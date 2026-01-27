Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E242CA6CBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRaJIBsOgwkV+eg1RM+W3L4+CnbMHXTkmYHk3spsKPM=; b=WOGF7xfDyywP6KAPROF/8rSb3Z
	lKM6ysclR/BBWtsMn+VFPKLeSq7G19gPyzW0I+don4e6KrXjEEcXzTnHqbvB3bEyuq5TMe9fHIr3c
	sZ/wpYN5boW7McoSgros1o6U6Fh6BXN5eu6W6gZopsaNFuhYE/yLbOwmh/knnYq4I/KK58snkrvFl
	K9YvVj+EziwliVbe6KnDB1GDJPwJV3pAYshFpXA36YmZ7xJ+f2+4fJPhNUdHB+3nPvarXgTOdFguJ
	/TWb2kjVOln648FVbJA//kAYKkJ80an8T48mp1ktmKwbwWtQo/MBGCjz/reJ6tdo1LOgF4ieffJS5
	oTLJOdHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfFJ-0000000DvFo-2yge;
	Tue, 27 Jan 2026 09:20:25 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfFF-0000000DvF1-3Iwu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:20:24 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b8869cd7bb1so655110966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769505619; x=1770110419; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRaJIBsOgwkV+eg1RM+W3L4+CnbMHXTkmYHk3spsKPM=;
        b=kc6tjSVzqE+GtBijOtoVZkME+gHP2Ifb+D7l0hIQhOVH1ZoYInC942y+kF9rnK8JDY
         DBUxtaSGccaE1XqJC5giJAICkn0q9ZlSH1YBIVkvanl6MOZ3r7nMQQDCcpszp69LKp6E
         HZ5zImiUSIB98tba5hlcQ860ThkRRKpmjw0zUMk3/3UZ62MAaCVhU6U3XybwTjXVKoOn
         e/ovG2kPGd266HyQqH2JcZaXT+a3NTiWQUme3BuOyu+dNTGI+ixZtC90rKMQ89HDh669
         PPWqhaY/QorwwvuUNB2zcyq+dB0gOcRfnan+x0vJCxUz+18uTAagik4zVkyT5IxO2f2+
         vPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769505619; x=1770110419;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRaJIBsOgwkV+eg1RM+W3L4+CnbMHXTkmYHk3spsKPM=;
        b=VQGVxvPx69B1gD6YEXH91KnzonamFZYQ5eVkKDqMFwSthbgus1k42EmFA8qZH+is3B
         JzN67SUBnevykEgoTUFkdSSdSunMpAWGxT/oMf6S6NQi3WMJZ4A5pyvDOo0+U/zs9OE1
         j9Ntol5Y6ZDlKliwSPUjFCWvIeay4o5N4RUqisWJEzgr2hL2bsjruFgoIylzLt+RIVux
         PxfjIPfUBb3Rww+bRNKNV64562xvta0Jhr9aSVMYH/Ng2K7r4mXweIkRuqw3u/EvxVBK
         EHCybgAgCxGV6Px2ZpL5dXs+55L04IdDxua8sSG8ALE4t7x1kEcsHVaHT8+3hFmL7NoT
         FWQg==
X-Forwarded-Encrypted: i=1; AJvYcCVwX+VAlEvceOSKY9yEFEC1mLbkKJST1CYdEBccuSKsHa6JvyQSEmPZcLUtmyln8hDpymg9uE5HYmKZL52p6Q9g@lists.infradead.org
X-Gm-Message-State: AOJu0YxxT8tOAXwSiDk8HiOV89K22oNXmEa/QDtlJy5Y+QCq3Mck8vJc
	Ve8yqmaC8urtaWQ7c1yn3dzMn0K9GL+r14m9WUEJC7gk5YMtdHqjjWwC
X-Gm-Gg: AZuq6aI8NuEm1hBSvhsil0B207nA5emLCEabCB/RLt5gcI86caMIBOfusUKCh4wOun0
	5Kzy0kIPTVMCDXLpzV2e11moiogbZkTz2kaDkUCyCE6Z51ji9b/JZb20DFw/KNPQiIw3Y36RUFL
	YaLKZa8OMYS1o1nEG3AfiV3xZZO4iU9xQsVsPkV0xp0tgAWr54yuDion2PYs37g1kucIxvaUD4J
	FXvVbev0sxcomTnCduqsXT30MSbpZGJORoEPXuhtcbgeF7zOXtddlak/9bdO6JQQ3acQD7IHA1s
	59EG6Yn7NqXxMPoX2C7zD6RWjqQPytuBglCmWPcgrMPb3awPH8C3p7ppBfid1eHw4utRcMJ40Gw
	HQBRgvaSOB9g8vM9rVw1Cgu9+T5tWLzWBrBwi4QQSCv5I3CVNsPyEES+tbBoIBR5krI1P+33fuU
	RdV0jUWN6CMdiTWNI5BIbbe4kCWguuK/tQgJNGOVxa/dgYyATvPwxn1adg6/MGsOcW
X-Received: by 2002:a17:907:7287:b0:b88:5b35:914b with SMTP id a640c23a62f3a-b8dab3d056bmr95912366b.59.1769505619057;
        Tue, 27 Jan 2026 01:20:19 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b700d43sm776257066b.41.2026.01.27.01.20.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jan 2026 01:20:18 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH v6 0/5] Add support for S4 audio
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
Date: Tue, 27 Jan 2026 10:20:03 +0100
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org,
 jian.xu@amlogic.com,
 shuai.li@amlogic.com,
 zhe.wang@amlogic.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <35CAE0E9-4C3F-4B41-BA1A-19761671F392@gmail.com>
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
To: jiebing.chen@amlogic.com
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_012021_869797_2AFF30F9 
X-CRM114-Status: GOOD (  13.63  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Jiebing Chen via B4 Relay =
<devnull+jiebing.chen.amlogic.com@kernel.org> w dniu 26 sty 2026, o =
godz. 07:01:
>=20
> This series completes the end-to-end audio support
> for S4 SoC from hardware bindings to driver implementation
> and system integration.
>=20
> 1 Device Tree Bindings Updates=20
> Added audio power domain and S4 audio clock support for S4 SoC.
> Added S4 audio tocodec binding support.
>=20
> 2 Driver Implementation
> Implemented S4 tocodec driver for G12A architecture.
> Added S4 audio clock support in AXG audio clock=20
>=20
> 3 Device Tree Integration
> Add Amlogic S4 audio subsystem support in arm64 DTS.
>=20
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
> Changes in v6:
> - Fix the problem of string for =
Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> - Remove clock pad register, and it will be submitted as an =
independent patch.
> - Redescribe sound/soc/meson/g12a-toacodec.c
> - Link to v5: =
https://lore.kernel.org/r/20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.=
com
>=20

Jiebing,

FYI

I applied this series over 6.18.7 and tested on s905w2 device.

With audio routing like this:

amixer cset numid=3D40,iface=3DMIXER,name=3D'FRDDR_A SINK 1 SEL' 0
amixer cset numid=3D73,iface=3DMIXER,name=3D'TDMOUT_A SRC SEL' 0
amixer cset numid=3D37,iface=3DMIXER,name=3D'FRDDR_A SRC 1 EN Switch' 1
amixer cset numid=3D61,iface=3DMIXER,name=3D'TOACODEC SRC' 0
amixer cset numid=3D1,iface=3DMIXER,name=3D'TOACODEC Lane Select' 0
amixer cset numid=3D62,iface=3DMIXER,name=3D'TOACODEC OUT EN Switch' 1
amixer cset numid=3D17,iface=3DMIXER,name=3D'ACODEC Playback Volume' 251 =
251

i'm getting working audio on analog headset.

Great work!



