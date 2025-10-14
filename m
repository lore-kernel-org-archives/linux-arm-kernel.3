Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7A8CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKXUCmU9jFowxknRpXATBfrh5U5iaqmYG7UiFDMEOEw=; b=R58r4Ye/UYd4//NrJLrIZCUuRw
	zHNStP8aysVm9R4UZQhFpkjBnPLHXWGnNF8I6HKRUsv9647GVE67hH9Mks8NDdU4Ym/LWofe+O/1k
	Vf8VhqLL08Ahc4Fb+vOgbCgk2S3mY43bDOdbQ9FYDetK/z9+FRQDVHqTOVpb1Z8XbMFlg1vHhcIvx
	jfK8hputYC8RhaDQgvQ9yeVplKDKlJIZwvlcIJ4q4mIFCPbCNNc6iQ7gSdJCdgpbfXKgmNiZk0E1e
	fFgvh+flaqeHyMXw+pj3+FG1RHWe+N770KzC7He9mTdYmV8ZKNzBcoGjufDwEhOU051pn5wUCCoW3
	hosLDISg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gaZ-0000000GjLK-1RML;
	Tue, 14 Oct 2025 15:05:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gaX-0000000GjHp-1Fwl
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Oct 2025 15:05:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fKXUCmU9jFowxknRpXATBfrh5U5iaqmYG7UiFDMEOEw=; b=Mztim5l2P8lJioxW0/nQMAQK5P
	yTb74cV84Ab4Q0TFmiVX4kIuh85fX4ZLrNucZgP8G4qIdjkqTNEAj2+KMInF+ZCGPVDeoTcJ6ummy
	j1aLthM/KAMtO8kluse79IVKIhHU2QkPePmBKSt2K/y1R9yQ369gqrPlPTdCKjAs3lFcpUO080u26
	jIXpaPVfou8Ehm/vq11yyy3kL81uVnUu6RmvhN3mU061958VO6oGeDRVSUXvPXImfKvAoJEK6SDGL
	ArfLeWJqee3NzQwI6ry7jwFzeuCKg/g/kmnRLtLd7wrOm5vujhJeq3tbN3/5eYXYTpnYd/aA3udoL
	xtDEkStQ==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gaU-00000005GWJ-18b8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:05:20 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-33067909400so4022547a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 08:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454316; x=1761059116; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKXUCmU9jFowxknRpXATBfrh5U5iaqmYG7UiFDMEOEw=;
        b=RYFsck0ESJeJSFxua/c0WZ+OU9BcW39uK3mO8a7NJk3VsNiGdyOb8Z6xWWcZ8MMdab
         G/kEiCFu6zG1qTllUIJ44t3UyTOj9KLFxDIIHc1nGPxV7Zd9s+I6axDfAT876i/b7VwA
         rCBiglCEfYKUDNT/Gsz/u97iUwJL88XomFzd27EXc5fCW+LaQcaZxviYrrKdpecO6ywH
         Gka2EtHkyX79Qaf6D+wi7G0EBVtekcqSUxArXGuZ5/gy+s3KFNbjrZDUlh4fMioMCjIn
         iAEpiFJcIqnyUt04lRDef7u3pMNawYQGzKMIt8QWh1Z6SLMMQ2ZcCOEI6eDnfgGc6H5V
         EGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454316; x=1761059116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKXUCmU9jFowxknRpXATBfrh5U5iaqmYG7UiFDMEOEw=;
        b=W6FLUSrHMPHVrPqHI2WP8G56mHlOmHLASesCWH47kYCUpHj8zjbh/qXkhCR+mc83fz
         ueBC93LuwYpFpKB4FtGZ/tb/r1sHem7wRVuRQC5ZXf2iHI1R6+iaR/kSQncEURGPqBv7
         mE/jRbj6IDeKvxnAFyqempBeTENUg71wSsBarlRoD7Mpm+YGITzOluy8GZSjAXmua+7W
         AYgfr5UKYdFFpe6jmJKo6zvpr/vPMnEUxk5nmbReRgnITLJdMTsRSMkCYH2+1JnYhlEH
         ACzM/5BeTQ2TP5B00ODKep9kvlnjFuNmonf/lVDlbO+WUSt6/FeSIE7R/R0WieDvIHWT
         3pNw==
X-Forwarded-Encrypted: i=1; AJvYcCW59qkt71SfBPpiF/bdjtiZlDSiDcZw7RVKOCtASHWVtTgkwESz2unY9WK++ZG88NZuduhD89hfkudgFIgIiozC@lists.infradead.org
X-Gm-Message-State: AOJu0YyV2S2ivdgbIfk4fO8qvXqlwl4/ZUt7aEUIQVBKConqsp/slma3
	Klc5fQlbQregVK4pk4LefAlWM2xmLM8ZX89cBf/vTbRq9akwHfil3GpL
X-Gm-Gg: ASbGncsEqEII9aKD2hvA7AdCPSl0u8Dm2xAGsDmF8NR7vBj0bmd2Jlf5urI5QEB3HOf
	Frc/WwxGw6CnwVHNdcXhcu0N53j+D8aFnUpq51lNCwLv66EHsj/YjdQD/Jrt0Z7fCxgpTpPrkTa
	cw3OJmFUg0ak7/HrPDzWJjvgOL4iE/cSjFX/Xo5PzVx3PcS+aVX6yo+ju0+8WO/ezApwW/F8i8T
	6pTMbi9Qedt16sVak7Qo6GulSnQlSsuPolgNiciqWLq6gVeFd3rQD5gYoKm4jKb+YGxBferN7od
	E1E/Y5B/DlkV60Vu0yDNhnDqP/Ddz4sn97UcWY3gFvLafaTv3ygz/XPtJQsQRe1NBLTtXxuK/7W
	TjZF11FWrGD/YbCO+nH0lau032knUnF0Z4KAuNo1L4cU=
X-Google-Smtp-Source: AGHT+IGBkWS8gO3ZSwZOT6x7Qoh3z6cOoLFKGH3Z57P8QReIcdrjAjkWJi2zfQBYmSoAjoVcg5azOA==
X-Received: by 2002:a17:90b:3a92:b0:313:1c7b:fc62 with SMTP id 98e67ed59e1d1-33b5137591cmr34129260a91.22.1760454316096;
        Tue, 14 Oct 2025 08:05:16 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:05:15 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:49 +0800
Subject: [PATCH RESEND v8 16/21] arm64: dts: apple: s800-0-3: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-16-3f94d4a2a285@gmail.com>
References: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
In-Reply-To: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=KUmhbvVhE7a9qQQiOxTeh6fcRXxeiaIPFMb6Ibxmxag=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZuMNyJ7OTVUXLasrGIPIVb1HBj9fWNw8yZt
 x7jbIc/tzOJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbgAKCRABygi3psUI
 JPs2D/9uehUxcAwSWk9iIwuMFWleyYm4LiS7tb15vFvqVEPXMUdQbk3G/e3eMusQArCpn+ycogj
 GJnwe0S8BwwKu3XcYLuNeIltnBhYG3ttIWXlIv6+v0wZd9gnGNEfgBUFUdV/jOuBlYRltuPxhhT
 eZiVnlIyArZJXWC7ZUPvjvnAGUs9HsJqJ7mw0BTcxhi4fUowK/2T5rPvDO78eBAARkeF5YGWqKc
 V8zTBUCHNsYb/mKXrGMVQik7gN5e4OPRvelEjnJy5vydwcTTKWc1G8skj/Psr85LG4blw3t2OF8
 9wzNSPW0+qJVs6nJTw7OHP6HWqVOk8Ahm0BWROI3WF7NFa2lKb68hQAnn3r+/xOT+VDTntFMu5w
 J9qwPqKEBxkXTbCBlnsJaXOFhvNaYmgcQjbFdwyunGgv5/kBIpeOYbwPVm4/LuAZvHsfONBXSK9
 uX0EnZrWIBvlEfOo8x4ZBITYaux26qtx2xk6fMsFhdgDXLTmZmu9gY/leIam/UuI3i2tCEkgjrH
 Axn8Ce0OR7Qp2DpYzHEwFlnI/jCaQ6jhcyI/RoUTO1NHPydclY5HYZObCyuVkR/xJVfCIpBCfks
 gKH0riwiIyWOaccR6cKpl6YEpjYknaMSuK+/sBaQsNs69k1R5YYZUVrei24afzpvPjXdP5OjYIY
 r0MyYbipMVm75+g==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_160518_612152_46EFEDD0 
X-CRM114-Status: GOOD (  10.01  )
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

Add CPU PMU nodes for Apple A9 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index 09db4ed64054aefe5b8f8298553d87fe5514e81a..bdb66f7e0de43a6a751af37c9ceabba44ef907d6 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -180,6 +180,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 76 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 79 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s800-0-3-pmgr.dtsi"

-- 
2.51.0


