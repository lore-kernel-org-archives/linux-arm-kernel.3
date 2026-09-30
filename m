Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2488ACA5FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKCgEvmzuqdNYv8cvhm72vtRBBD6mf+wxSFZ0lP7EGc=; b=ONNy0XMwFalBfw3Jm9ewtFxc8c
	PXKZ3XbmVQAuS5VghNcGSFOM1/r4Sm5dP5jYBLDihk0UV2rWims+qmdNyi5Ema2xJlNiJ7bobQSWF
	wxP4M80AVcHIMSbS9qVClZEto7lvj8/pRMQ1eDp3Rpx46FMg52z+clnqEMpZZE+nX5QjH0SKnslYY
	kryIWg7sHbTh+nPq6Zkk8C0ANxoJbcxWUonqc/U68+knRusoFIaO4VE20UchXOXPDPNKR9ZF29vZg
	mh6ZtfNZM10PEFs+FBvaUk7sRZDJWG18oaOgTvo8+y3rX862oNIYZczUJEWOZsOi/S3rGkaUBMH3N
	9TQ0VthA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrPS-00000005jgr-30T2;
	Wed, 30 Sep 2026 10:19:34 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrOa-00000005jam-17VI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:18:41 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so31789685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 03:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790763518; x=1791368318; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKCgEvmzuqdNYv8cvhm72vtRBBD6mf+wxSFZ0lP7EGc=;
        b=ZB4TPhKF9rNP6nPwu/V193kgzl5POw8pIGRSD2qXFcHyjQBfDaCfwsoBbyuvTCbZ4M
         mGWJi8U0v8L6kHXzxn1u9WQW2IcJCH0vcxLtbLbAY7fjDWqPJu61M77ehqiUZOaYNB4X
         00LTLkxSrKQm3SXEUGjKZLrJBdi5d3EG+coYYVi0wh/xrhbwoOwlVSbbS/qsv73qmQfO
         WQ+gPX/mn0UH+qsO2Nk2Vb4R/oKbWqoq7kpE8ihCuymQRlMcMs8Ayq6leCEd+hnm7+GH
         Jr5vm1yOfWr+34DUWeVhyv+aJN8yUyNjFCWoEq2YTj6OkfdCun16Oj8pYAHwPE+gAD77
         8GoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790763518; x=1791368318;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vKCgEvmzuqdNYv8cvhm72vtRBBD6mf+wxSFZ0lP7EGc=;
        b=hUW+Z7z9bNBPmvRGnZHsoC62ieDtEiiaK7jKJeMy3NtwJigSqLtVcTY85umxEVkVd8
         eFv9dppuyV1kjOUisaZEsLYlNjriGJ7UHMos1ueJpcMkldyzBvfLgAtELHMYfeKFaX69
         BR6ybUjFcl7Z1ZsRFUWtvKpTCVGq6q+bFfEyZXq+bGuCcZ/auogd50B5TjePOobViXeG
         L0GXqY8rXeIDU9v+webrX/XWO2yOJ0q8hJ52UCnAmSMXPjqkqwX29yzk8TRicu14W4LZ
         jFVle6bN9lQ/po/2gChDosHVPBA29vWqBoyKeltWGGX4k5nUUa7NunqYh0Illf8t+yJl
         h26g==
X-Forwarded-Encrypted: i=1; AKwUvBxpUDRbTv05dyvmrUK5vsgoIrYLnePuWfH00A5cahUqbQ0fManOmPX60hFx9PpzM0XURdozzFXC34fuPIvETl7I@lists.infradead.org
X-Gm-Message-State: AFuF++nayJcEMy4rTdf8KyFHXs/s0UD/XuXIS+oDTGygni0RaxjHvoBR
	8tho4Wp/iD/+MWFWss7BIhGVACOccDHc/VjPHr9hb9U4/zoYbhF9kVfK
X-Gm-Gg: AYBFou0n3CsnU+wRP22xOWOfigdsR8xMsYh3udfgM+uP2r4+AenrmB5gj7GPfhP14zc
	WFDx/cP4teFvdNnQA4flbZcY5k+w2vWhL82CAVRudxR61Jy+Wtwy2rRLEc2XqdXispg7UbvKKSB
	QBrehAJMfwTJr343tIhq7KOcIOnVU/a9u6/ZrSosHEJYsHdEXYOECcm8COx+px3yiLDh/uVTZ42
	PA+T8gLVt2Weg2CQ+jVZT9KDnrxcQTweibJIyWZ1zUh8PDSEzbvkBM8jf9M2nItlmgpg7plOAMS
	PH21aRp89ZYJqSEMax2K/tlC5HY41x+4X2zAxoejQUSByzJBvzcF1/BMZWmmn/cAvmo4+geXGLO
	DEw1VDqf7cSjSFWCtkJCuCZstVrNR+YQIT+jTul+21SVn6zyUipI2C29bv0Ldtsv+9DWYTrcnMR
	qgqNmXwHkDDbws/Lf+pWVGAZ1nI1XSAmLrEvJ+rdkZtM2ceEUaFX1djZLtBizSyTUwUL15j4v96
	G1Kavw1iCMXbLhyTUnLOTYC1hwFMlfX
X-Received: by 2002:a05:600c:4f4b:b0:4a0:35c:8953 with SMTP id 5b1f17b1804b1-4a01afe8499mr17900545e9.7.1790763517873;
        Wed, 30 Sep 2026 03:18:37 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a017468b10sm56852175e9.0.2026.09.30.03.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:18:37 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 04/10] ARM: cortina: Add support for the CS75xx SoC family
In-Reply-To: <CAD++jLkXyh9ujjFEE5UwpMnj7Ykgb5_W+Mp-YXBakn5Q=_vj1g@mail.gmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-4-4617c4463529@gmail.com>
 <CAD++jLkXyh9ujjFEE5UwpMnj7Ykgb5_W+Mp-YXBakn5Q=_vj1g@mail.gmail.com>
Date: Wed, 30 Sep 2026 13:18:34 +0300
Message-ID: <179076351495.2893601.12682235689198768135@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_031840_344175_8630AD54 
X-CRM114-Status: GOOD (  17.89  )
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

On Wed, Sep 30, 2026 at 12:11 PM Linus Walleij <linusw@kernel.org> wrote:
> It's a bit weird to have a mach-cortina when mach-gemini is actually
> also a Cortina SoC.
>
> Could we call it mach-goldengate?

Sure, that is also what the vendor kernel called it. I will rename it
to arch/arm/mach-goldengate in v2.

Should the Kconfig symbol follow as ARCH_GOLDENGATE, or is
ARCH_CORTINA_CS75XX fine? I would keep the "cortina," compatible
prefix and the arch/arm/boot/dts/cortina directory as they are.

> I am OK with this because it's not like we will add hundreds of these,
> I just note that ARM64 has abstracted the spin table handling into a single
> driver used by all such systems:
> arch/arm64/kernel/smp_spin_table.c
>
> But implementing it for ARM is probably overzealous and just a waste
> of everyone's time.

Agreed, I will leave it as is.

Thanks for the reviews,
Fil


