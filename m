Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA454E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 09:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=17/YkGcoUt73Y2+AfuHrh6H6j0zCznkX+tUdDNoqtVE=; b=YpALY0Ex/ZiJxF
	UiMUczKMbtqbgisPk3W0czcVcCCqlrwX/+CZ+bqNaFszfrIBR90TLgPpxIFPeW5c4/ZqiX52nNcnM
	vogkI/o0Dxgrat8gpwbIdu2otvuhteBOYitDhAnM8TJIdsTlVYmQqPi+CFpUg28vbTO2W65C0ilWD
	w10XJQnaRba2Sjbv9deJ96EClthyns4zFwnA/7/atwGKjv2DbjdRlnwjjpb5VlLeQXCzroyD/blko
	kWgHeKZxZh8HrRkCtbZHeKnz29BkJt/jSMAb0wyl/GSUwYWw4cBEPxBrANAYD+Or3qzFf99BjpFHC
	4KQDG1/umoJrwDV0DW9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVS5t-00000007hUa-0VNb;
	Wed, 08 Jan 2025 09:11:17 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVS4g-00000007hDJ-2Pxw;
	Wed, 08 Jan 2025 09:10:03 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-540215984f0so17023700e87.1;
        Wed, 08 Jan 2025 01:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736327400; x=1736932200; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=17/YkGcoUt73Y2+AfuHrh6H6j0zCznkX+tUdDNoqtVE=;
        b=OfRnuKB61kWfs9Tfnn6Sm3PIJB2fKTrhp/UrzVmF6nn4VbzF9vSjeh7dPhNgUG+DD4
         r1/cdWbSjUa/QFfGJ1j85vH0HnpjkeQj99ffv995WrEiXzyTzFLemty58sFX8foVQojS
         y+ueM8PvMhx4JV3OQS/Gr3T6XOgX9NbILke0WWDn/6wQ08aZuMmu6dFi2K5M5GMX+XJf
         3IkvID7UDZ7MM0gOP8ajHwIUiJ4A9RQFe1/5OKb5lyo1LSLHSVtxhTHWoPa8ADHq/ag+
         L0torE/J+GkoNOBr62fXsKHlLYSI+mOF0yF4Dt12730jGSA28mnsPjYxRRVrJvAebz9v
         pfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736327400; x=1736932200;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17/YkGcoUt73Y2+AfuHrh6H6j0zCznkX+tUdDNoqtVE=;
        b=mcEFJ9lqv63+fIuneJTqF/NOH/9Q6UPTqy4eT3Gk88CVsbiRdQKpy6nsOHpZn/DcA5
         MHYsWgm7W2odM/Bbfl/teaUHFb0P0xNw1t8C5/wN1rAYCfGV2vFiHxgzYL5pZB8Lo6kk
         sbl/pUVTDjWqJfa72fRcvtGvouSV+BXuAyBy10dW30BlmyKdnHmgORzHl3aU7v7Mkpkk
         Z1/7ZvSMkSiCx+JGq7z5pJtn5JHgen6OEzGHen92C8MM+J67Z7KugKwmAjipINxxd3/4
         VUuzEWOjVLIzfqFtXMPfCNERy8TuzhkDvVGyuM81p2YrsLxMbOlnlu4M6WDoo6/djAG/
         IYBg==
X-Forwarded-Encrypted: i=1; AJvYcCWOHNimVZO/aSLWj5C/PFQWJszBOr0lcuYRlpcEgxZsFP4FJSMVB7V5p6c4fqqgUdPVYyE5a9xIL54nkpRTSRd8@lists.infradead.org, AJvYcCX9U0jXmJ7JA464cFAIuQMG0JLswurHo1uU2YP+PAhtLUK4NYMzQFxv2qkok3FFvAp9P15JloIwVtSsUbwy/cQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yygjd1XC3oNagLQ2CmH5ZJX2MiH8LTgv0v2E9bqyS3S8Oyg2mFn
	sLQ+WyQrWc8CjYl2N4zhO4tvO5g5GF+BjViOy3H0uG226T4iwqHu
X-Gm-Gg: ASbGncuoh4rEI+ptycUc6i7Fl27U17iuI1qUu5rNWnkWSAeBEGCSoCu7Fu+tsNT8f7k
	tMv7kRNlwj4pWTYR5Q4MflCR7fts2fi5k9500YWfSwLqhM1/uZ5fVgWjdKQ8Q0VjilRmvhuhL1d
	plmXppLap9qb5ORe0ouj5eRLAAa+4mZGPxuRaHPWPj3EQd+UlzRc0Sdyg2RWZU/M74Z4hflDgL+
	5iCpI5m1THH5vlZ8VfEk0I2B0z1Or0vKP7IjVjf55L+xHzNmnJobZJP6A==
X-Google-Smtp-Source: AGHT+IG9vDEilGecqfIee0EPhs6XC/SdCMZE5b3FTq0kDLUNQVPbKIBsetat4pMP6r/SXGR3mknQPw==
X-Received: by 2002:a05:6512:6d3:b0:542:2190:9d99 with SMTP id 2adb3069b0e04-542845b17e5mr550651e87.6.1736327400021;
        Wed, 08 Jan 2025 01:10:00 -0800 (PST)
Received: from [172.30.32.150] ([185.204.1.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813898sm5386450e87.154.2025.01.08.01.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:09:58 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: rockchip: Add H96 Max V58 (RK3588 based
 TV box)
Date: Wed, 08 Jan 2025 13:09:05 +0400
Message-Id: <20250108-rk3588-h96-max-v58-v2-0-522301b905d6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALFAfmcC/22NQQ6CMBBFr0Jm7Zi2Ok1x5T0MCywtTBRKWtNgC
 He3sHb5XvLfXyG5yC7BrVohusyJw1RAnSqwQzv1DrkrDEqoq9DSYHxdyBgcao1ju2Amg1ZZ+fT
 G6brWUIZzdJ6XI/poCg+cPiF+j48sd7vnSEih/+WyRIGdIkXkDUlv7/3Y8vtswwjNtm0/BaJqP
 rQAAAA=
X-Change-ID: 20240618-rk3588-h96-max-v58-c2c1bf8e6996
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736327393; l=2307;
 i=alchark@gmail.com; s=20240125; h=from:subject:message-id;
 bh=TYJnRulh9SsoN8lhqpA3Tk15WrSalmWYQbRKyBZQC+U=;
 b=ENiXKmahLqDMSh0OkgiT4U78QvZnxHkxL2aKvLLsWtNqIGWeADtT6txSEE2zLdZltKXaCB0Fm
 ofUft9c48d3BrZMsuu0DBbSPCqs/SNlVpIIG/2fwxuFlSGB76HxPg6g
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=xRO8VeD3J5jhwe0za0aHt2LDumQr8cm0Ls7Jz3YGimk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_011002_624475_2FC4FC15 
X-CRM114-Status: GOOD (  12.16  )
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

Add support for H96 Max V58: a compact TV box based on Rockchip
RK3588 SoC [1] that ships with Android by default.

Note that there is no publicly available hardware documentation,
nor vendor sources to be used as a reference, so this implementation
is best effort based on poking around my board and staring at the
decompiled stock DTB. It works for me, but improvement suggestions
are very much welcome.

HDMI output is not tested, but expected to work.

Auxiliary LED display is not enabled (no mainline driver available).
The controller used is FD6551 connected to GPIO3 RK_PC7 (clk) and
GPIO3 RK_PD0 (data), which happen to be the right pins for
i2c5m0_xfer pinctrl config, and thus might potentially be used with
the hardware I2C5 controller (to be verified). Out of tree drivers
are available at [2] and another newer alternative at [3]

SPDIF output tested using a 2-channel digital to analog converter
box (higher channel counts not tested, but expected to work)

[1] https://www.h96tvbox.com/product/h96max-v58/
[2] https://github.com/arthur-liberman/linux_openvfd/blob/master/driver/controllers/fd650.c
[3] https://github.com/jefflessard/tm16xx-display

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v2:
- Added SPDIF support in SoC .dtsi files and board .dts
- Fixed DT warnings found by Rob's bot
- Reworded commit messages following Krzysztof's suggestion and
  collected his A-b
- Link to v1: https://lore.kernel.org/r/20250106-rk3588-h96-max-v58-v1-0-d25255f851fc@gmail.com

---
Alexey Charkov (3):
      dt-bindings: arm: rockchip: Add H96 Max V58 TV box
      arm64: dts: rockchip: Add SPDIF nodes to RK3588(s) device trees
      arm64: dts: rockchip: Add H96 Max V58 TV Box based on RK3588 SoC

 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  64 ++
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     |  30 +
 .../arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts | 826 +++++++++++++++++++++
 5 files changed, 926 insertions(+)
---
base-commit: af349ca4d3f8659d84abc667125c826fda155109
change-id: 20240618-rk3588-h96-max-v58-c2c1bf8e6996

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


