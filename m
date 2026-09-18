Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8FBC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 04:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FL7nLGZapJfQ8aVhLmuBZ6WgKTHLgrmHKnRf7yd+OgQ=; b=0HiDIgOtVje+K5
	tlfLaJh+3+NftKLewRxqx6h01r+m3Q/smOk2xkVjGQbMHqMyGEGt6Oi6/dcNMdXfvHHvCsv1a+mvt
	0NY99K8FPBWzn7AHZDpsOQJc220l4LyWX5Sy7Sp3fwtxZQTTMGNiSh+bjriNa5Wb9sdYQGiPJOQ90
	WPeto/0b48BPHkU8/QgOmC48bArnKE2F49zd83KOj9WY68q5rBLnQ3KyW+6t2Kb8t/h/LrfJENiV3
	QNiSKC88eeEitZ27QLXfxu4yYA5yHPwpFMfiX/0nK84J42euC8TcHmAuhd96V79QmZDrb7CzpoBG/
	zYRmXYtkak9+loaiBO4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Qfc-0000000DTvZ-1RFm;
	Fri, 18 Sep 2026 04:57:56 +0000
Received: from mail-oi2-x05.google.com ([2607:f8b0:4864:32::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7QfZ-0000000DTuj-1Qyv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 04:57:55 +0000
Received: by mail-oi2-x05.google.com with SMTP id 46e09a7af769-804d58d09e9so93631a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 21:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789707472; x=1790312272; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FL7nLGZapJfQ8aVhLmuBZ6WgKTHLgrmHKnRf7yd+OgQ=;
        b=TR0/Ox8ZI7mhHCNMpiHXD9ZN/iIpwtvXo87gDVlfAAfpRiTdt6p6nrEjpx3SM92NKs
         cgZvU2faTE5LTh/jEFdZJ63JNg6MAD/Ena7kHZ9oSs1X+DiHEIKg5k/EoxaLbXKuCiTA
         bLfUVnwLvN31Y1mDYs4bKs/g5hL5Mj96VkkZnDyT1gYTwZBusgjaWca96gIWjOkmdW9l
         KuSrttjE4F5IPIdQlrz7dtQIiRDMPNFG61+FpcQ4VxYf/Kxbv3nZj5QfVYWbD9QrN9JR
         t4tBX71PYZy73fsGAJozwYSTYwzEWA6HqG5/C8vRYP+s2PyEvq1ef9zcIoGvQQ5ZylQU
         +0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789707472; x=1790312272;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FL7nLGZapJfQ8aVhLmuBZ6WgKTHLgrmHKnRf7yd+OgQ=;
        b=PxQ2m3Vn3DBJqsuWgkE11eYpspVnGCQ1gtQEysNEDNhEks8ayqSioPWgy8HUMkJefF
         m7Y/w+AbK3o7Y+z97AIcrrzwxlwbLJ/V0Urwcx6c0Z6mpqIQBM8RzfJswXns1u4xq2Ug
         6mLwn1Mg69pdVi5x6VAdKGaSbG05XrJCjQUqyzRzGwmkjl+AGf8QmsCGwCGZzGM1aoci
         lA47e7lD0b1xgkzurEzs5Oto2FhfBQHWIisoEKqmhNaKqccJ2V5WkgmNBxxs0VMMR1wC
         5sZ58HX3Q70EYRO1AN96xTEU7+TBHzOMUZj8tz9B84A66GjZP8ZltoN0wC2Yd39xCH0b
         xjOA==
X-Forwarded-Encrypted: i=1; AKwUvBw3RV4E8LtPr9lLRKrO7Xbf3PYAhlOtxgkJG+4ui+/nLp68Hpe+C6zMNFaGgehVVo2m8EUK5JZ5F4G1mCkRSnLe@lists.infradead.org
X-Gm-Message-State: AFuF++nDNj5PtgqKPkNLr20k1RqeB3UFI2k+qvJtzypy03VOnuAzpD/o
	XEqvSggx/GXiHk9Bk1Ck8VUhjO4K/p5bD+3SxNv3+vJUCLec1lvfl2mY
X-Gm-Gg: AYBFou0/OF6uuraJ+jHOmYR4+SApOW7JMj8IS0XWamVqaOrw3Gpj3LicjwLvtdCeGer
	VoOQSMjKDit2UskgUyP8fTvKaK9ypLQRbQTK3/EaZpVEBAhaXxVO4f2B+TEgwtMEPvaS6yuP1lG
	07+gR7gEHW1WKb/1wwwmTqwHa52q+bKQ+wkBPPDK66mTFJIYogWl4PKAT+4Lw7XJvlO2h/1q10G
	QIBueD8pxRhFeJ+axmapgJKvn2qVj+EPvK7eIybSzn+5qK23xIJ3QCkLGtANhVBJCfoH4Ce2Uj0
	5l76bCs+4PsTeG9pcN5CkSd+jNqKmchd54EUfMzvuhS7p9vOg4TqNdnByiqtpHRAxeNXpY3HkbJ
	PhtfpdeqW7kMd+gOtneu46ri8cj2w5Z32AUu+9Mi+rT6VVvXbk8UdgCRCEyZb6+VHS/YGqO2wrE
	9bxSoP8OQ9o3wK0T7Y/tv9o91X10RyVSdnGiDr1mR0mW5qxssvJ9wyS8Ndn4BTdNk+tKCvMc3/2
	uPx
X-Received: by 2002:a05:6820:f007:b0:6b4:3a06:c251 with SMTP id 006d021491bc7-6ca9ad3aa5emr1276873eaf.29.1789707472079;
        Thu, 17 Sep 2026 21:57:52 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48739da0d0dsm256318fac.12.2026.09.17.21.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:57:50 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/2] rtc: mt6397: expose the RTC's spare bytes as nvmem
Date: Thu, 17 Sep 2026 23:57:45 -0500
Message-Id: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-0-558b8f95cfbc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NwQqDMBAFf0X23AWNELG/UnpI9Wn3kFR2E5GK/
 97Q4zAwc5JBBUb35iTFLiafVKG7NTS9Q1rBMlcm1zrfjt3A+tICtoIvl82yIkRJK8fs+7HaPHH
 aIyIDLvTOh3lYHNXapljk+J8ez+v6AbkEtDF5AAAA
X-Change-ID: 20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-ee2a326ad7f2
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789707469; l=2221;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=pKSQ0omTuskZq+kor8UoJ2wNfDWorQkFIo60SsXbA4I=;
 b=D2wXBjz7609fl7tbdcv1OCK2Vh4M2UOlYFbDFGfPMj9WSbvog4bhWkntuU48WNlEyAVi731X1
 mTV4XKZ/YGDB/yukOfu0K8mkN81aRKfm+RoXS0pYHAKLn1q/1WbZXok
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_215753_393493_E9BAD27F 
X-CRM114-Status: GOOD (  14.60  )
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

Four of the MT6397 RTC's alarm registers use only their low bits. Each alarm
field lives in the low byte of its own register and the driver masks its
writes accordingly, so the high byte of four of them is storage the clock and
the alarm never touch. MediaTek's documentation names them RTC_NEW_SPARE0 to
RTC_NEW_SPARE3 and assigns the first to a fuel gauge, which is how its PMIC
battery drivers carry a state of charge across a reboot.

These patches describe that layout in the binding and expose all four bytes
from the RTC driver as a battery-backed nvmem provider. Doing it here rather
than in the consumer is the point: a write then lands under the same lock the
alarm paths take, so it can neither be lost inside mtk_rtc_set_alarm()'s
read-modify-write nor fire the write trigger in the middle of one.

There is no in-tree consumer yet. The one this is for is an MT6397 fuel gauge
that is not ready to post; its other dependency, the MT6397 PMIC AUXADC, is
on the list now [1]. Offering the provider ahead of the consumer follows what
the subsystem already does -- 32 drivers under drivers/rtc register nvmem --
and it is the part that has to exist before a battery driver can stop reaching
into this block behind the RTC's back.

Tested on an MT6397, in an Amazon Fire HD 10 (2017). MediaTek's spare map for
the mt6323 matches, and the alarm field masks are common to every compatible
this driver binds.

[1] https://lore.kernel.org/all/20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com/

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (2):
      dt-bindings: mfd: mediatek: mt6397: describe the RTC's nvmem layout
      rtc: mt6397: expose the spare bytes of the alarm registers as nvmem

 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   |  9 +++
 drivers/rtc/rtc-mt6397.c                           | 91 +++++++++++++++++++++-
 include/linux/mfd/mt6397/rtc.h                     |  7 ++
 3 files changed, 106 insertions(+), 1 deletion(-)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-ee2a326ad7f2

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>


