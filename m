Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA34C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 13:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4/g0FAwfoBc1ZpFJ33DL+FpXxKqFt7haerTzfBfI18=; b=H2BnsysgqbYlvYUg0ekdHUKMih
	XFPLPfVaA6qfm6LlCm9giqNhZmCt1Xxqo+txaWhbg19lanUKl4IUrs5oy801B1oQ5B+u6zwy/bpoH
	O9HqCWaMBTY6z3fT1V9vINzvHJYFZHAdgLnHcS0mbZF4DqJ8aMZ2U0CWVkTvW1H4K29h6/f0V4rux
	H6ZNKJTLK4Uy7u7ngUmhYUHXIq1OCGPEOLU+S9sEiKSSNU3GsvREmKzbd3g3MwzJuNx1IdeofV/4L
	/6dOR2T/1wSYxOV9qLVIWwNtEs3Uwf4qq4BVKOpAKki2tGXO3H9zSIPZmXO2dxL1zG2Cobra2GRJC
	SZs47AXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueD0w-00000002Xll-1gPZ;
	Tue, 22 Jul 2025 13:26:38 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueC2K-00000002QD0-19Pr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 12:24:01 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so974345966b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 05:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753187039; x=1753791839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4/g0FAwfoBc1ZpFJ33DL+FpXxKqFt7haerTzfBfI18=;
        b=i5eFa1Nwpx5RKyRr+CCsjepY/i/7fbqVDy7BeOCW0xELl4l7oef7xhTw1VZMui9D7l
         T25Y8cdETL6542phOKseCIp5ltceB+xE04iHJqNKikxmqD7/zHZeYeyzQU9BwUEBHwwE
         CX/VOS/KHZRIURkiShwJ74BJxF1SYpOn9LEKuEpwHSBY4oqPh6xq219WLnS8jfHjLVmt
         2balBufZNJVskjN2ITH/dnAGXl8GRP5qiJLQVXeV1PfGNd+EBabyBBu7U5DwqcsLCL5F
         b56mA48QkQGD4eCVXyHvDNlw3Z3bnjg7SnKwpLVe754z3JKN5Trg/CWiKvI9F3wSPDt7
         Qgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187039; x=1753791839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4/g0FAwfoBc1ZpFJ33DL+FpXxKqFt7haerTzfBfI18=;
        b=rlUW5nfOLV7FYjvEC/8F2MBSdMTYictgemXjrrFNQ5tYvbUvWxbzIUCJL9AOG9WSUB
         y2Z3uRRjRg4Vk2YEscm+O51/9B4tIE2kvV23YPPtyEVVDHxf0BUN669FDJx4rflR2t18
         Z8oiXymLDtbbCb5QaHQePexh8ubdsYLiXSv9/3Ff8MfDbUyq96DCRBry7jxlFd2nMZ3M
         kzND6aAzLQMl4LOQYWMR2ZoevyWQKvQA0X0EQ07eCeV9/9kVWDRQNlqjOcKNVgJxSNYM
         OrWmEG7WF6QsGcwkK0/urE2oU6+7AZTV9dhCv3bkwPGqhG6siB+eqX8RaNCVF5uLrc46
         RF0A==
X-Forwarded-Encrypted: i=1; AJvYcCVosy6BjVgAe9eXNIrLQ989ePr6BvfuVzu3OXu/do5UxJpAD2yN5/Znm681ermwZlwpSjN2pQ3rQtyTw3WnPbwv@lists.infradead.org
X-Gm-Message-State: AOJu0YybnTETR574WhxWenSIAZDjQw77asrKxyuxa/5f8F0ouEvEW28p
	bayzUeHUdpmanbLjJ6gr4RB8n1Ik0w5VlJJhPdjf+J4nTjxHx5+5RmeaAL+q8g==
X-Gm-Gg: ASbGncsdtBDa73fWxYjN/BiiVWHw0U/e8hq7Fg/PMKxEwJQfz34Dx/IqHqSFcYqBXw6
	6tCHEuHmbVJ06aPjN3cMYI8ZYMpYJJrLguIF4DdtJCNAlRhJMUA6VVOJdUuO8wpyCYbbN23blwg
	YVmDPvdruk/Mh8Mg5nclanzyr0rOrcCRLbsF9Jp649xVR7UQEjdmjibK5M9oV2abe48uHy0v+ZD
	vrfUyNVvnUDPn8uvNiJnBPyz5QcXm968wzaMt21fWURieBdx4PUcT9jrigvg3wIArYYgg7yQVqb
	DzrGv3Z7FzyNUhLxVGoDemZqhRm39FqGeE+anzuewATS4Y+EC25bzFe0VD2nTqbbpa9QG0uDuub
	YEqvqSseRcnalfiymCnsrYY75fJjXDDqODxVGNiUMKsxXElhu7DnKBO3nhLKdmKPTWBAMBlYR0Q
	==
X-Google-Smtp-Source: AGHT+IH/0+iq7EeyZ4cfQy0vOAyEo4RQDQZWMuHPMyzOjkIohP5ikawHhzp0OBmAfeBSqYEsgXzC1A==
X-Received: by 2002:a17:906:c114:b0:ae3:e378:159e with SMTP id a640c23a62f3a-aec6a528140mr1630162366b.26.1753187038334;
        Tue, 22 Jul 2025 05:23:58 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79a056sm861358466b.14.2025.07.22.05.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:23:58 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] arm64: dts: exynos2200: increase peric1 and cmgp syscon sizes
Date: Tue, 22 Jul 2025 15:23:48 +0300
Message-ID: <20250722122350.444019-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722122350.444019-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250722122350.444019-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_052400_312721_C8DC579C 
X-CRM114-Status: GOOD (  11.52  )
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

Some USI instances have swconfig offsets that reside over the currently
defined syscon ranges for peric1 and cmgp. Increase their sizes.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos2200.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index 6b5ac02d0..3fa183c5d 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -328,7 +328,7 @@ cmu_peric1: clock-controller@10700000 {
 
 		syscon_peric1: syscon@10720000 {
 			compatible = "samsung,exynos2200-peric1-sysreg", "syscon";
-			reg = <0x0 0x10720000 0x0 0x2000>;
+			reg = <0x0 0x10720000 0x0 0x3000>;
 		};
 
 		pinctrl_peric1: pinctrl@10730000 {
@@ -471,7 +471,7 @@ cmu_cmgp: clock-controller@14e00000 {
 
 		syscon_cmgp: syscon@14e20000 {
 			compatible = "samsung,exynos2200-cmgp-sysreg", "syscon";
-			reg = <0x0 0x14e20000 0x0 0x2000>;
+			reg = <0x0 0x14e20000 0x0 0x3000>;
 		};
 
 		pinctrl_cmgp: pinctrl@14e30000 {
-- 
2.43.0


