Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2536CEA7946
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 20:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HSdgK9Ht2fP7rByPNvPOtQygotTmOr97BiUZ61bEe4=; b=AXTJUyCHJuNPf5b/Ka2HnEVYiV
	7nL1Ryk9jqti3LoFvWHr4c8Df3rkqGYsOxi7yCtE7xVZaipNaiu/BL97qcOF6hYQ/QiNxJp0Q2n7U
	Dmfe9DqBtzOq3ShifO5SNTUAu10/175MRa/vr6s6WrptYO/pYBpo+Ct0fPivAelu8uyZmitmGYudd
	GKgtQEExQOmUd7KuVw3ogK0nXZGLHIlJXmX6r9B0cXgSehCbCGvpX0gR5E9vjv2yyzNZ/ub3yanCH
	mxUWI8Eg1C21f15Rt5uYoMl06CQKPw3dH+a8qXWTxKCIHqUqT0U2DBPqEYgBOQUCT88gwk0XmsAWu
	XjFfG6Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnjbj-000000093g4-0LUN;
	Wed, 04 Feb 2026 20:36:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnjbh-000000093fw-1fZg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Feb 2026 20:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3HSdgK9Ht2fP7rByPNvPOtQygotTmOr97BiUZ61bEe4=; b=n9g8nWKVAOOUETBtBJ3wcw0wrC
	3to0eUNR2VPD8ZFvEczv63CdagFXBLD1Erl4xNRfk1EdDy6pdHaYrN93L0QAnK9JXmFJR2PipEJbm
	+90ERy+dJpgQU6lPAmCUFl227Xp8+OBO57goUB792P+rFEbmOwcAuSnbEXf5c9TxE3n8zYJ/FxvWC
	qm6RRjBaeKiWgWDy+HlJIo2PZTOFSrakjw+Xsq/AzlYFoOg83NcRl49ePC5H4C9J1hF5whtZCug4/
	Kb7nOhPQnwKgSasS5Z/YEdRNMjYPVxacHPM+zp7OUbI/KhCib43GsWa/l/LYaPXdX3e0p7jY/4VQe
	d5btPj6g==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnjbe-00000001DCo-1G3w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 20:36:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 433634E423F8;
	Wed,  4 Feb 2026 20:36:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDEA360705;
	Wed,  4 Feb 2026 20:36:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 024F7119A865B;
	Wed,  4 Feb 2026 21:36:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770237365; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3HSdgK9Ht2fP7rByPNvPOtQygotTmOr97BiUZ61bEe4=;
	b=oCnokV3ZbWAGL9oCVSJV4cMxSsxKwSeY05TG5vUCyfP02P9BEa7K/w/d8cn1BtWvtFJX6S
	ustJvJKVYUGqxNctEkGiFPTcHTVB4hV3/6yclCW7E3dS4ZoqsAZ40qe8/niAUgVQVuocrf
	z4vWapYW53zngYsiwncm44wVBFCffz/8TibcXTfYzeyIQ88MBrmhkxzktuQn8OxYlHdZgw
	krfEfsPHQGVAfwnc2BkWPEQrXze289OdgyvQSZdj2O51PLm5+ayH9klxhjhc7xZhAz+aux
	HBOOFh6yHkhCuQ2fISbt2UZQSeNC41lgzPWKIEtQ10lNL6FM9/jCH07benltnw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,  Hauke Mehrtens
 <hauke@hauke-m.de>,  zajec5@gmail.com,
  bcm-kernel-feedback-list@broadcom.com,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  linux-arm-kernel@lists.infradead.org,
  devicetree@vger.kernel.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH -next] ARM: dts: BCM5301X: Drop extra NAND controller
 compatible
In-Reply-To: <CAHi4H7EVLsgVL5KCERTX5XBNTMvZDNxePzo48Zp5dsfDdoCV1Q@mail.gmail.com>
	(William Zhang's message of "Wed, 4 Feb 2026 09:36:51 -0800")
References: <20260204091530.624230-1-miquel.raynal@bootlin.com>
	<CAHi4H7EVLsgVL5KCERTX5XBNTMvZDNxePzo48Zp5dsfDdoCV1Q@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 04 Feb 2026 21:36:01 +0100
Message-ID: <87ldh8fdqm.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_203610_454022_FB0FD251 
X-CRM114-Status: UNSURE (   8.41  )
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

Hello William,

>> diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dts/=
broadcom/bcm-ns.dtsi
>> index d0d5f7e52a91..46b650abdb90 100644
>> --- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
>> +++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
>> @@ -479,7 +479,7 @@ thermal: thermal@2c0 {
>>         };
>>
>>         nand_controller: nand-controller@18028000 {
>> -               compatible =3D "brcm,nand-iproc", "brcm,brcmnand-v6.1", =
"brcm,brcmnand";
>> +               compatible =3D "brcm,nand-iproc", "brcm,brcmnand-v6.1";
>>                 reg =3D <0x18028000 0x600>, <0x1811a408 0x600>, <0x18028=
f00 0x20>;
>>                 reg-names =3D "nand", "iproc-idm", "iproc-ext";
>>                 interrupts =3D <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
>
> Acked-by: William Zhang <william.zhang@broadcom.com>

Do you mind if I take it on top of the commit it fixes?

Thanks,
Miqu=C3=A8l


