Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60739EA855A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 05:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUExVCyNdG5YpObz2nxsxQo/pWFxavqjeF1Iya74LKQ=; b=SVSEsSqpslaBhoOkqCbaOuXZHx
	tJKxby2JFRVYP3jtRrnExlBz5MVkttFPivdRIJFmgobf1C4J4jbDbqpkljFj0xVjq15lSEaz6jqjR
	BjFaK7RaY2Y1zJzFSv/rIRSHohmdGR/AlOlCUTN1qwQ2IBU601Dzkb3IMJEq1JD+AAnRPhZcLMofA
	mLFF7wcPKJFUG5/4Kxj37rjMmxGwRc4bOCRr7lOcWz7nbU8eYjd3efADsqpU00xjRftOconJAwFWx
	rcSTc8qvITOp3EyYuOhsK9dogyB2BNXlh3AlNY3rAKSlz17kwk8HadngI/NPqODJgT9w+zs+TZV3S
	j33UhUsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzT7X-00000006gVD-3N9E;
	Mon, 09 Mar 2026 05:25:35 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzT7S-00000006gUA-0jnI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 05:25:34 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5a12cc20e71so3840764e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 22:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773033928; cv=none;
        d=google.com; s=arc-20240605;
        b=EHOmygWm5DR/zw+n2PRfGtBUN51K/mfdT1bzn+Z9DAFU60rrCmuxGX6hGVGG3arpy4
         9YpxkCJhCDFQcrSN37OOMGPeNy7IfTE40ZAE059kGCTrEnn3tuU1IDjtqVFKHsqBvgSo
         CYVAojw5iexm28ESiEb7oTOJN3IohQIsAsHSLfUYDHArNcHYNL/UG+r9rlChueef8YNa
         kUq9caTPmaWuGr3z1h463M9LT2TZruQd8NMXVWvW3YdSxJPFPOjJuIcRlZstbRfGgsGx
         GwghvguXJ2Q9KQgKuGZGuqhHQ9bfU0yS/olVyEObbq2nOLJWtMV6cplL1VZRJQXvqGbz
         2ioA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DUExVCyNdG5YpObz2nxsxQo/pWFxavqjeF1Iya74LKQ=;
        fh=WFLXl/FPosxiM9m0gat9GGuRis4dSj7IOwE0GhOzSUc=;
        b=OWRT6hzh0lXSQGltvrqiL5iMbGpk15x91oCDZ3nFmUZKrYgADGf5FGzG1uurIhAaqr
         QWtvq+s5lwqG6fNEXAfFN39Nd88uuV4/VEX7B40L/F9uq92w3RNUgvMQipjTL6eUW2vj
         LAlxuu4PRYaR07gzMFZ+65lJlijzv8n9S2aIHVL61aRBX/zjXJQnZ6gLkvPMcZO+VpAa
         flEA2NnnTFR0gbZqdEZkD6IKe8C3PJ12nN8YdaB4Y30PIJl23ttDbXQofBAnOQ6Vx+lL
         1LeDIJ+ANSpRTtsPckMhU5alrzJxb4bW4fm0Q/SCINL8yAarCjGBCAaBNiBdVdO8X+MK
         fctA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773033928; x=1773638728; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUExVCyNdG5YpObz2nxsxQo/pWFxavqjeF1Iya74LKQ=;
        b=XAE8oOP1LGUmEqTPdHOZmVIijoCkUNkxoy5TlTSI6q1JDELDg2IQ4bvTDETs8del7x
         zfLtXG86aEnKVxj6xB8I4geBKEdMiFTfSU9348mH9J3KeeJgTb7dVJLA9JkSeBV67pTo
         SfOqnz7RTpJJIc4KeaJN0ykY+OzDkkmu8a3uE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773033928; x=1773638728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DUExVCyNdG5YpObz2nxsxQo/pWFxavqjeF1Iya74LKQ=;
        b=gvOYUtVovR3C3aMdkXvwGEejOrGftg2o9whBzkQOPGcIzlxWl3sJwVErWjpq7UEV04
         Rt9PNl+0l3lBZpDAw2cPVOMJNZuEwYDI/BCj9veGEdhrTFhsU/TSD3pRmHBe6zEStgFV
         xWbWyIP6ONEH2bM6OBXZBcfZsHnXMCd6un9NoHEAYKuMBeruiKvNN63wngdeomlvrLx2
         Nbidyv0u7TV/axor9QCkLE0p9GnttK6jZuaCmp+yMJ+Oa9syg2kZvhDw0Wsw49Be3JGm
         Az5pL/DwVu6YhkJgMMqIp0z3tL89sggRhV84NDpGuML9EmCEHRfOZJ+QGxp9b359fwB8
         UDYA==
X-Forwarded-Encrypted: i=1; AJvYcCW2OltoJswf/TI1cyftBudgfxsHbGHZQ5vzoQUA6DtU2gKz38hNIsrsw2EEdJvrYEck8jcEPQyQh5yZ0WLSc+gb@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjpp9nnXqm9Xh9VOQT+3KMiSg9Gy6pkV2IPdlwvLVXibyq9M87
	x6r/iUAy1EFc8WvHXuHbNa51zk/kJG+GgQzmzHEaySavjiI4jmPprcNRi3W/7GNyZwa9PdI7SZg
	V/PD+322L0e3d9W9u9DVoGDOTbuCdJ4GJa/C8FKwd
X-Gm-Gg: ATEYQzx5dnDeBjnnDkCGCCMWHrq+Wq2MWufBuqRBdOg+odO+FCwqnf4udv3YoO8p+eg
	IfiQs17LcG/M6Rbee0pf5jb1gw8WgwS0aoP8dMaXTHrF+ojUkEE5rJauaIK3MDTGhZkcA8UsD8j
	FmxeMSEoBiX52wT/c6858NirbJmW7jnes9v/Ur1NI4VgVFIXDbak7bwegjCwaUifDGwgp8ir4CA
	l4BxTyz3Fmipk5l26s/FXeSZflfdk5qVOdvbi7YAQH1VqKWxNt7qgVl2/QlxO2XkBLU9KzyEyko
	gaDdxA0xokW8VNv4DVuKx7QRJSFC3IBHIMwCPXHJhXpadJRl
X-Received: by 2002:a05:6512:1554:10b0:5a1:3f54:b3db with SMTP id
 2adb3069b0e04-5a13f54b53bmr1623132e87.8.1773033928040; Sun, 08 Mar 2026
 22:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260304181024.738391-1-akkun11.open@gmail.com> <20260304181024.738391-2-akkun11.open@gmail.com>
In-Reply-To: <20260304181024.738391-2-akkun11.open@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Mar 2026 13:25:17 +0800
X-Gm-Features: AaiRm50OIiHuDB6An0GfjyAzF0gVfkfGW4EfH-a3Pnq4RMgefi_HoUtnuYAX_9Q
Message-ID: <CAGXv+5HnCqNsQxnW0oKV52A9xYVQg-ur018S3=TzhVR2Jhfqzw@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: mediatek: clk-mtk: Add cpumux support to common
 probe/remove helpers
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_222530_900652_C4935336 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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

On Thu, Mar 5, 2026 at 2:11=E2=80=AFAM Akari Tsuyukusa <akkun11.open@gmail.=
com> wrote:
>
> Extend __mtk_clk_simple_probe() and __mtk_clk_simple_remove() to support
> cpumux clocks. This reduces boilerplate code in drivers for SoCs that
> require cpumux registration, such as mt6795-infracfg.
>
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

