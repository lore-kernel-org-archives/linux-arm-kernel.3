Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F75109B462
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 13:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VNbbvUY3UV4c5nAnHb+NpQ9gBlif8YcQdMt8wQ0IbI=; b=OI85klyuYChboI8euJT6vgDoQP
	gpJp7a9Zek+fsubxlVqPyysyqShcSlF+M6LcKOCvsv1J9Cn02jADdkX4eTM9vNQSiL5HOmtvoD6Dt
	fPF1UzJmTBMyYP6JdBzbzaSToEsOgl4bTSVaNHd89yecZsmng3kmkQYlnKN+IbgBKhgQV+6nqX/LV
	fcPXnhu42e1IlrJCJwa3hy0ZsvLk1o5zIt1QIvV0cl3crRcyCDfcAkMNMipNHj9YNXUAs4PvcrObE
	J8tRVoLRw2wGLxgW/UjtVrymXVFyDYtzOdL+wwBFvacGICtz0H0+YOmdU0yTbYyp6zyJqImQaly8s
	OZSwdFug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7YzL-0000000Czze-1Zyr;
	Tue, 31 Mar 2026 13:18:36 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7YzI-0000000CzyL-2zKA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 13:18:33 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-66b8110361fso5837415a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 06:18:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774963110; cv=none;
        d=google.com; s=arc-20240605;
        b=dfBjPJZ7HeSdq4nypJ8yV09Ccivxxn6/ulCPIk4SuzJEZ29i244x4a6+QCGRXUlxw9
         tdIUuVCgYSoZIYyLLC1YFFRfg41RhAJT+blER0k9DEcStqaAT/q/N7ZXDl8Iz1n7YtUw
         v2KBBpi/DHOkCaHFE9foTNViUQvuYZB4RUs83phtiBGDIp9U/k2YhYJZYvp/kSg/Iok1
         G9RUuMQ5uacFukt/+Rb0EPVHIPu+h/ka+CfJhaFkzNR47Kr1PrEoe9yVRZLOTKoaOShj
         vkYPUmalqPNNRUtuBVRRjGwT+mNvPUYxjBNMRazkQqyB4V+pthhNQC5tvI1VXm2j3MUp
         vTpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6VNbbvUY3UV4c5nAnHb+NpQ9gBlif8YcQdMt8wQ0IbI=;
        fh=2W0uFJ8yzllKaCxz6zUOhXxh8SttaRKAqCDrv5l2RRM=;
        b=JgzcHsLUNsss6N2Xw22e6exx2pA37HBafT4AY3sc8ZNrOmviUOWlWTXbwfg8m83AG6
         3aXmxPcmKGsxKyJVvTI/Qo8T5oJKwlFbrMHToPviW1R/X9m8WMlWWnmA1pNRkWa05FQH
         FvNF79Sp8wywsZcD3+8zPOIDUGmqsrMTEdy129HYKyYuNN6gN4WDmlqmqlZ1LhgzGZ2U
         3nAhn6nX24UyGY9ylSydDMAI4PhWyKi82yn46i14W7njz6pPYSa6rWh5+LQ3aw1W+PbV
         GH1OkHFPCofGYVR5hbbhz59cYehnHilbZLCjnB1rx4MXxpfj9nRnq9Q48PlkvsrQVGZZ
         ukCQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774963110; x=1775567910; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6VNbbvUY3UV4c5nAnHb+NpQ9gBlif8YcQdMt8wQ0IbI=;
        b=qsFJkAn90barDshBVlv/ZyF9GEQWib2qzaOhW+G431SzcHQP1Yx53EGI1Bizu3sKj0
         GpBqzSlF37zqJWvsrExW4ArOF6bwjY0GZrihyTrnaCkk3lZMi8k1lut/qT+NWBCwGd88
         1C9cOHjK/fr1zF69mrkFw+6lN/mBA30FIHKIWc3wCF5mG4fFgQj631eJTEiJqFfL7PR/
         kIjBkUmx3/rv+kBPOUQh3a22BhYcn3I4fT0i+ff8jKV2GBjhxUyzRgKA36501iBRYF0L
         txvs97f51e0YTxaVZljmz02SAvWM62t6uv9r8dmENJZC42gcZrS05OzDYvzyGpE3v27i
         uNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774963110; x=1775567910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VNbbvUY3UV4c5nAnHb+NpQ9gBlif8YcQdMt8wQ0IbI=;
        b=FoSHr7PlIn9dgHrtyevAcSMktNh2GjeVZ2SM8836jaT/45rNgBtCq8e/b94AjBC8VW
         vfU10UR/y1/sjPGzFKxwPOXUDJNILiPGGbGcZJDHDEWW994NEfyxaBjONPm0CL3Gcghq
         2kdFbV6Li9lONE7Lkht+3Nl+8jJVedp6EwPoiu/AVnkRoHBgrO1WkmG1c3rgxB8YlOa2
         A30BuWIaYWcfqf8wDckQqIHR9o3lQnQB51xFRlF9f+UoBUDJg6YeHl5rBTCr6YldHPFF
         9vVK9AaJU0wxubJbHHfjA//tliIAJaP7uXYOeXqS1LLuGP5D0m6i5novZDrPMo0Sb1CZ
         ViGw==
X-Forwarded-Encrypted: i=1; AJvYcCVwVXnDghHDqVi//VnOAicpg62HpzaNpwT74Ahb+RqFq9l8m2bzAWL86KfIgoOCSpK2G37B31oXMYhpPtPHLpaz@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf1PkCgYYGu6NDdfSXyzly9MfPnrZst/3Q0Rguaj3kNsEjA6Eu
	gvqwbP4nCTAoogCkFKXxh4DdxpBB/kBka/0L0XWFF36vgWpp15HnmQj0YGY4p/dAziMF+9ujfis
	M4/j5H6LtqKlQJRoKXA7R3LgPHoEOr08=
X-Gm-Gg: ATEYQzyaY7EODEy2tnVhaAqhk+2xJDGvnnvhl/yyAMhxdtnHdDOjBBIS1uKvA/zycKy
	9bgOAHUhUrf4PrTuzPusgS5ESrvsZYpECvUpJGpBWDLQtLPjQhX6ncSOgQc6NE6q0KVfm70SNBs
	ZHzGfyxkZ+mXHczDPvOTaaMcCRsh/5Bs1FnGvLqKMraP5Hf/OL9EoOloPazlZ8m4dpnlYmKjXOy
	JLbkPhInUnjZTiqp+JI1Ox7ENkzNlDgKJG4fMOWeV8IhtCwe3QMbltYfNir/FyEDw7YLWbemJY+
	Xfw+4A==
X-Received: by 2002:a05:6402:3549:b0:66b:a9bf:2f with SMTP id
 4fb4d7f45d1cf-66ba9bf090cmr5857704a12.2.1774963107139; Tue, 31 Mar 2026
 06:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260321105146.7419-1-linux.amoon@gmail.com> <acaO5ouMmGA8-tqJ@zenone.zhora.eu>
In-Reply-To: <acaO5ouMmGA8-tqJ@zenone.zhora.eu>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 31 Mar 2026 18:48:10 +0530
X-Gm-Features: AQROBzByRXPbx7tA51z_8CluOw54nEqGeZC01-m9c54wTUWKrbejLJocvfXsXnk
Message-ID: <CANAwSgRVXd4PLAV3NGVdmxcJUVe6UUs74HkRmOG7TkkoLBCFeg@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: rk3x: add support for SCL OE debounce and slave
 hold recovery
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	David Wu <david.wu@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_061832_760930_BE9462E3 
X-CRM114-Status: GOOD (  17.14  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Andi,

Thanks for your review comments.

On Fri, 27 Mar 2026 at 19:43, Andi Shyti <andi.shyti@kernel.org> wrote:
>
> Hi Anand,
>
> ...
>
> > @@ -1125,6 +1141,17 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
> >               }
> >       }
> >
> > +     /*
> > +      * If a timeout occurred and the slave is holding SCL,
> > +      * re-apply the timings/dividers to attempt recovery.
> > +      */
> > +     if (ret == -ETIMEDOUT && i2c->soc_data->has_scl_oe_debounce) {
> > +             if (ipd & REG_INT_SLV_HDSCL) {
> > +                     dev_err(i2c->dev, "SCL hold by slave detected, resetting timings.\n");
> > +                     rk3x_i2c_adapt_div(i2c, clk_get_rate(i2c->clk));
>
> argh! this nests i2c->lock. rk3x_i2c_xfer_common() already holds
> it when calling rk3x_i2c_adapt_div().
I agree; the current implementation can lead to a deadlock.
To resolve this, I'll split the function into locked and unlocked variants.

Note that this deadlock only occurs if REG_INT_SLV_HDSCL is active in the
interrupt enable mask, as shown below:

 static void rk3x_i2c_start(struct rk3x_i2c *i2c)
 {
        u32 val = i2c_readl(i2c, REG_CON) & REG_CON_TUNING_MASK;
+       u32 ien = REG_INT_START;

-       i2c_writel(i2c, REG_INT_START, REG_IEN);
+       if(i2c->soc_data->has_scl_oe_debounce)
+               ien != REG_INT_SLV_HDSCL;
+
+       i2c_writel(i2c, ien, REG_IEN);

Thanks
-Anand

