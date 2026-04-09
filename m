Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98E4F364BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 21:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cg1DaVL6nWUYFSlhuDMyvflwk+IUOSESUOpmdy0y/Sw=; b=qmfyI0nukAo5rKig1dxDN87D1H
	pYmoiCiJd9rxrWAyT7LvrG8C675OALeeVVsIRIzpnNzi8gFWfqboVT3efeYzxQBeo8T/QxuvmT0N2
	40VllTKEtmuQtkh2Sb53bTXfGaSqUSX1CkP0Uq9xjPyTLLZ4gOVCu694F7V8JEdxB16gMakpOpxLm
	TiUWeDxIMe5uVHWxhpttPPwqhKUNGhEIS3B7mj3itod06+m1lOJG+5MxpS/1fflK3Al9ih/deSg9E
	uheDKC7uMokhf/asbsUl6fURFpa+kw6KL2ooYG/ZkskIL+6jwixRdCViSDvmTXSchV2jKQipfGhfV
	CCdO0Mng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwmS-0000000BE7e-39Ej;
	Thu, 09 Apr 2026 21:19:16 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwmQ-0000000BE5t-0wI6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 21:19:15 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso10685215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 14:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775769552; x=1776374352; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cg1DaVL6nWUYFSlhuDMyvflwk+IUOSESUOpmdy0y/Sw=;
        b=YS1GAErsyZwpTsy8F31xyIjyo2nSACUITA8vtIXfAk1oRZWyh1IO8LhSDN1YrYKfqr
         jhaHUa7SWLuJDZilV4EYD6IyLhNWJyJ7j3XoNEvNksbhZVZSmr29RSmo76ugI7+GAEVb
         LSwC5IZYMlVV0gYbqWyENMXGvFQzJ6jstWrt4mF7iS0LJHRJnNLvYguJhfNQh7Lj7KXu
         tcE+xh7cDSYMXOavve7S0vI4wvdc5BdEH/GyHJ+25G/ShLASCrSCzk8YoYOyZy+8qmIY
         pXrh5ZbvBZGvzYTIYezdcu+3KcmYVqCrIuL1J8WGMrNxIYBzpmkEOhheg3gVYTzQg720
         HamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769552; x=1776374352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cg1DaVL6nWUYFSlhuDMyvflwk+IUOSESUOpmdy0y/Sw=;
        b=O/qkxEznrJ5g979rMgH9Jd7qrQqoqZNkjv/jpv7POKaijP3yRCfK3188vugLooRall
         pmmUp/BZabY0VzV78oWvR4mnqBPGK33q4RIBRm88lLw2/7N0GYVqxvc2CJBGkkNqjtom
         jNurYkkS6I1lZ5QhqC7pUmfkJgTEdgi6OoAksGwdLixzk7c1A1deYK1WTVQVjJLxBYt1
         iBJ06bczU7oQjV+K98/6cHs+46Nv8iRK+luuViTJEmoYZxLLJg79Aw79flGjqesgii7O
         lU+X+qpCCXFKhcOq8hpFI5qLoNWw57mzy7u/UAy3JlX5MLnPXobMcOoA9uZTftGW/MlB
         DsvQ==
X-Gm-Message-State: AOJu0YxCCG9AvK4FazJ1VDVxNaJyMUQP9m1Hl2okEUBBSPh8yrzyJEVY
	8IS/51+7taVAfQp7pCLltdACgtw2wNo6Zc5bd+9YLPaJxj51/XLvgHmJJxcYBbFsPds=
X-Gm-Gg: AeBDieuV6RJ+Pm73lKyrAAni/OHGUWsMvegoEZrT3p/ERyYALjlwtj9EndbScLA3TAG
	RrYEkBbrFIvuTJMhFcUyNj5YnStwmWOF47c1JJJAuLEWedvvsLB/9pV0m+VddOgKmqd/sXfk908
	vFkd3ri/tO+tJADduKhq/AfUkCb7F5X+5/+lROE6TiYjfeNsyRlhgHPlveEFOQ/cdhrC3Kx8GTt
	sOq+odSZqLSoF61wj6l/RUtWtdJn3EMUM4cUnNpaVLcVVZVkm/urUZN/75T3fnx2SD25xIEjLqv
	I2cPJz7euqulGqb41Jrgrg0sIuzkuaBr1D8KcFvMcVY66oD1HO5wMfwKzsRg4cq4YnRheaboxpn
	NNOk1HhBuujaRm7X7uVuVvvBuTMFQCIolKqlpQmi5K8Qzn97+rhwm4wkrnyTI8QueEf4BgNLI6W
	I/DNmOy5/fn3Ga1SOl/75AgF7ci3i7K99t8qNoGi+vt8nWgEaQP4i+sqgGqg7yqNPJ6GBFCZAH2
	lPDRzSdu/TtPMjA1pXASAs=
X-Received: by 2002:a05:600c:8883:b0:488:b87b:3052 with SMTP id 5b1f17b1804b1-488d689b400mr3274635e9.29.1775769552285;
        Thu, 09 Apr 2026 14:19:12 -0700 (PDT)
Received: from [127.0.1.1] (93-140-227-38.adsl.net.t-com.hr. [93.140.227.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a53sm1797536f8f.5.2026.04.09.14.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:19:11 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Thu, 09 Apr 2026 23:17:25 +0200
Subject: [PATCH 2/4] arm64: dts: marvell: samsung,coreprimevelte: Use
 memory-region for framebuffer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260409-cprime-dt-fixes-v6-20-v1-2-8df6f88942c8@dujemihanovic.xyz>
References: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
In-Reply-To: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Karel Balej <balejk@matfyz.cz>, 
 David Wronek <david@mainlining.org>, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1437;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=KI7O8gEqllNwm8OPBSd2QRQJEz2ZYAYwoNkY/8tsJRY=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDJviJ92MpTbEWxygW3OvB8c4aveK2cmv2d95V0Y89By1
 w89657ajlIWBjEuBlkxRRbmpXKX+FLDJzoU2SbBzGFlAhnCwMUpABNxX8fIcFCZcc4Gk/XKV7ev
 nrJfpFXP9Eb395t1h7ccqn10W2r/my8M/wzeztC8/ebvsiTBc7IXrz5ZzmquMm3J+kt27UXnfbT
 P5HABAA==
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_141914_279189_901C6FA3 
X-CRM114-Status: GOOD (  11.53  )
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

From: Duje Mihanović <duje@dujemihanovic.xyz>

Since the framebuffer resides in system RAM, use the memory-region
property preferred in that case over reg.

Also, testing showed that reusing most of the region (excluding where
the actual framebuffer resides) is perfectly safe, so do that and save
~22.5 MiB of RAM in the process.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index bb0a99399624..f71bb856f1e7 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -23,7 +23,7 @@ chosen {
 
 		fb0: framebuffer@17177000 {
 			compatible = "simple-framebuffer";
-			reg = <0 0x17177000 0 (480 * 800 * 4)>;
+			memory-region = <&fb_mem>;
 			power-domains = <&apmu PXA1908_POWER_DOMAIN_DSI>;
 			width = <480>;
 			height = <800>;
@@ -48,8 +48,9 @@ secure-region@0 {
 			reg = <0 0 0 0x1000000>;
 		};
 
-		framebuffer@17000000 {
-			reg = <0 0x17000000 0 0x1800000>;
+		/* The "active buffer" is at 0x17000000 + (size of one buffer). */
+		fb_mem: framebuffer@17177000 {
+			reg = <0 0x17177000 0 (480 * 800 * 4)>;
 			no-map;
 		};
 	};

-- 
2.53.0


