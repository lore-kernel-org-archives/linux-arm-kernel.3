Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EFBC98307
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfrxig7zhSKDLhGOOvPoUHViJ6FfSwVsRqNPifKAURk=; b=F89DRnwE+fpzOY42L0PEQAG3fF
	dxXJLUfev0PecOCS1MdPu1xPT+pR8gjw5AOEpCuMOXgj3IxazhePGxB/8IEQJyjNdKerjm5khURCZ
	D1lwRDk+uaIb327MUzxNs9vJyZgFVIUOnvcxtyt5e3CgVw2zcWr3/mJ/FBp5YQrYHk7q4Vk69BwGv
	Z5GlNZgjcXLY05GfL8bw7IWed9+gBNk0VlHDwEqxXeVLM8AVXhURtIqtHhClGjpRUX5T8BqO0b1lS
	GUsaLU9x3tn/T61ww7YAvx/l9Ovv9KN9eQo8daNn8HFrJPRhrqSatnTn+U9tvtjpUnfKCbTsN/map
	2D1KSmIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92yS-00000005zmw-1rc2;
	Tue, 22 Sep 2026 16:04:04 +0000
Received: from mail-yx2-x12.google.com ([2607:f8b0:4864:41::12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92yP-00000005zmL-1hRd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 16:04:02 +0000
Received: by mail-yx2-x12.google.com with SMTP id 956f58d0204a3-66e4ab19127so4942777d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 09:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790093040; cv=none;
        d=google.com; s=arc-20260327;
        b=oS+J0dmNVRpM8MizHRTQbgL/p1mlBwqdIDVVFcrAYwiXXk9Y60kk8n2T26YWm+sGha
         iiokYetA0HfKJYwjEx4oXUQk+coIQK2eQ35mLoxB6cOrWtcf6dRM1egih82ACPeGbVxq
         GOjFJvI7TKiR61BVK+uMrt9dfkcCchcG75AAcfkBS+W/ggrxSpKAGx6yMSkpABq9+zgx
         fglvuoa/VJE7RV/dkIw6QAosoYZqgTT96t248gXagQzUo8hOA9wodk94esrrfmelmkq2
         nRNp0q4wNgmfRyuO+3yYOTVYqk4KnvxW/L86t3H9q5aggZNEdz0q6kXJNQcmvFDX4YDZ
         8cdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dfrxig7zhSKDLhGOOvPoUHViJ6FfSwVsRqNPifKAURk=;
        fh=/29mqJWUp8nIpnEDRmqaOV9jfcvbIZOsiXkr8nGHhnE=;
        b=bhuI+XlccrYvi5FUWrk9ODKC6Gz6tPLHQCn7+tG+IihoCO1ecR82IwOE/NQWixjppE
         l2SCAxqzVvyI93Oprh/zRM3ACuZmQFsQxl84IHqzsl5nxZ7JXN895rbwpbPMG7DhjhR/
         nVZCVBbhoxGxVhYD3NyiXCsnb/7JV4DhmQVk7NKsUaYGgGZwRhbUM1oV3Z5BnPTwIw+u
         pkPsgFXF6mZnlr+sw2gmA+6Tnwk0ZOFpssb4umVRtYxDyRBQaBa/l+xZ37Zx19EjwDy6
         Vel6ptRDb2hJurTnSDBwa1UqU/CrmjqPc9nZ0ZNqzWRkqqoTP1/IICuaRpwXrqaU+len
         FLxg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790093040; x=1790697840; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dfrxig7zhSKDLhGOOvPoUHViJ6FfSwVsRqNPifKAURk=;
        b=qRR4bd2qy5r8L3X6LMTpIxr4EZcOwfsCUz4x0Q9VszjyPYiEfuip0i1a8+2HxLZQHm
         +2HFvRVTgzN5n6MCItfk454yiK5SfRwqPD7mOUgJrIrKJU/8PklkiTTeJR3Q9QNgMTYj
         raUeAHYjIsrR2Al6ndO9vUk8Y7iz8/wZbu3XUPH8S99m/wM7VJd1mtGN2eGKjD/hiiVH
         bbTwIl7w/CsXhe5QkEnNw8hrpSNnku+knqJ2qF8h6Gf706V24DdYHMJMz/eZtkUhl6LT
         Fy92KznxyuSckrL1J/e71a9JgBPGfqvftAECwFYVUGTx4q8YOc9iIX73mjvzly1Rb8Pl
         6kIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093040; x=1790697840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfrxig7zhSKDLhGOOvPoUHViJ6FfSwVsRqNPifKAURk=;
        b=lYYi5Rln90Eot0qOYuYzyZ4AAEqdvGGLDkZM+m8UBMoQTAOMl8vj9lyx+TICBLaXc/
         2h9rJ7SS+QYFTBJvyQ7nZFORay+1VYXo0Zsu1fP24apQzRhJ6xQdWGaMWxXgsFnbeI3d
         /Bq64CiFC3nZ5LgVjp+tMM3P4YZCooQsCEHg/6NR/LHmd5l3ZgIRwY25baGSpLPo9aKo
         AKOQgUpniEeU3Wz8KG3U/E9LJPOj76/fPMWa/B25UJnn4AFhqpLCGoai1zM7DHX/mhqT
         VpyUTxFgz0WNIT9P47d6lLEmxXQfXmi3xEv48TB0O/JEnKa7NCgR9BKwXEoYSXOvNAOF
         CKng==
X-Forwarded-Encrypted: i=1; AKwUvBxrZ79kuJU4CBubsCQciWqL9fm1Lr0aaqKdOlS6D/XznwJMiHSM/tN0Uxin1DgoiBuXactol+KKMvZGftkANazQ@lists.infradead.org
X-Gm-Message-State: AFuF++l01Lw7fihjKvA7RvqoULHHWH32LmlvA8xCclaxECe97rCvduUY
	ZNYwe2wCNqHjugOKzEHEBy35FyeOB4YxzXqfDsMq8i0zo72gSD2Aq3Rrc59bs6X/DaBObgF1Zhb
	E9yWyAUp5c+qy2H9v6Qwtavdxh6zO/oM=
X-Gm-Gg: AYBFou1zk5vw0/WcPxOf8sI1NqPMerCDNWE0ooBe+ZRcYzLkV+3KN9g/GWBe9E+ak1n
	SLias81zwBgliysYurpSOcvIRWqSjEccv0P0R3aggqTcefVnZGGn1gTyJMHb9p18RANrNsmCdB3
	JFeHqynuBeS5I8gaMMxQw6++NWzvT8n1rshS3AIOgk/9VbA8kpnt/qrQA2v2dZNvlxc849rM6NP
	nBjRX/mk+leAKzwAkNdtqmtaNEoMTz5Kwvir/y24C7BGYjco21VydhuaymM3YlM8NCCbjEAhZ2C
	uIOqreFDMivu444S1uwKBleMptYhklLDXAlC8J18dTtUylEy0qKOZkjyGion5VjzQtP6
X-Received: by 2002:a05:690e:1249:b0:671:502f:dd32 with SMTP id
 956f58d0204a3-6717fd6b6a6mr5447023d50.53.1790093039560; Tue, 22 Sep 2026
 09:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
 <cb05fc2f4158b03d312b94cd9361173fe92ac528.1790079398.git.prasanth.padarthi10@gmail.com>
 <179008369971.83584.9572254757332285883.b4-review@b4>
In-Reply-To: <179008369971.83584.9572254757332285883.b4-review@b4>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Tue, 22 Sep 2026 21:33:48 +0530
X-Gm-Features: AcwNN1Vb40B7-CxaHaopn8HdM12Pklcn_b9p8jPV7ixD3IPvviwFvarSvM72SF0
Message-ID: <CAMFFDGhNg7ogv0NYXe5Vga0Tf+XD85n80=MOwa6FgSX7q9D0ew@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: Tan Siewert <tan.siewert@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, andrew@lunn.ch, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_090401_454861_4E527C20 
X-CRM114-Status: GOOD (  18.05  )
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

Hi Tan,

Thank you for the review.

I have successfully rebuilt the B650D4U DTB using multi_v7_defconfig,
with CONFIG_ARCH_ASPEED=3Dy and CONFIG_MACH_ASPEED_G6=3Dy.

I'll correct the GPIOP indentation and retain the review trailers if
another revision is needed.

Thanks,
Prasanth

On Tue, Sep 22, 2026 at 6:58=E2=80=AFPM Tan Siewert <tan.siewert@9elements.=
com> wrote:
>
> > Add the device tree for the ASRock Rack B650D4U BMC, which is
> > based on the ASPEED AST2600 SoC.
> >
> > Describe the BMC memory, SPI NOR flash layout, UART console,
> > GPIO line names, video framebuffer memory, I2C EEPROM, and MAC0
> > connected to an RTL8211F Ethernet PHY.
> >
> > Use the EEPROM on I2C7 as the NVMEM provider for the MAC0 address.
> >
> > Configure MAC0 to use the RTL8211F in RGMII-ID mode.
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> >
>
> *snip*
>
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > new file mode 100644
> > index 000000000000..a4e384588a54
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
>
> *snip*
>
> > +&gpio0 {
> > +     gpio-line-names =3D
> > +             /* A0-A7 */     "","","","","","","","",
> > +             /* B0-B7 */     "","","","","","","","",
> > +             /* C0-C7 */     "","","","","","","","",
> > +             /* D0-D7 */     "","","","","","","","",
> > +             /* E0-E7 */     "","","","","","","","",
> > +             /* F0-F7 */     "","","","","","","","",
> > +             /* G0-G7 */     "","","","","","","","",
> > +             /* H0-H7 */     "","","","","","","","",
> > +             /* I0-I7 */     "","","","","","","","",
> > +             /* J0-J7 */     "","","","","","","","",
> > +             /* K0-K7 */     "","","","","","","","",
> > +             /* L0-L7 */     "","","","","","","","",
> > +             /* M0-M7 */     "","","","","","","","",
> > +             /* N0-N7 */     "","","","","","","","",
> > +             /* O0-O7 */     "","","","","","","","",
> > +             /* P0-P7 */     "button-reset-n","control-reset-n",
> > +             "button-power-n","control-power-n",
> > +             "button-nmi-n","control-nmi-n",
> > +             "","",
>
> Nit: indentation.
>
> Other than that:
>
> Reviewed-by: Tan Siewert <tan.siewert@9elements.com>
>
> --
> Tan Siewert <tan.siewert@9elements.com>

