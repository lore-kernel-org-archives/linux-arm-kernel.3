Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50213C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 05:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t22CBONJmB65GQP7nsD4ofUIJ4+sf0vAxHh7+1UHNU4=; b=oYmkap3oUSlyPHrTAJeXs9/6/r
	8cbWCjPWzZtfdFHMzuzx6qDdPwLDrOX2tofVHe5U0xIalWT/bR6N3t/FPFsaeYo1QJvb/yCgrZbBo
	q2JTbeQKu4O8L5m13O3dgbZl0tYoNQnb7ueq4XsGmyH/83HWF1hpYyZaP4MbcZl2l4MZAxOVSs3r2
	14kbENfkhQ32OxzINCalb7gHPTthR9kxnKFDiakINW290rrXYDICJEhE6gCPspPrBGKcfFmVyEnqj
	ySVYijgr9WfTAEOd/+VRFMYxiXSaccQpdkECAy9D/bqxTHxHFXtDBz2xnk9/T/9QLDeJcBGcrGlTP
	+hXmMq3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eof-0000000GQb7-3Rft;
	Mon, 07 Apr 2025 05:14:38 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eNr-0000000GMqN-02y5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 04:46:56 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-af55b7d56a1so2656700a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001214; x=1744606014; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t22CBONJmB65GQP7nsD4ofUIJ4+sf0vAxHh7+1UHNU4=;
        b=TGflBYFiqwAsXaZxIEy5+Ka1qfnoHAWp1p2ieH2aT+z/GwJC3CVrxZOopBpU8TASxd
         pAXHfx8ImianbUL8aVPX1IxNWLPG3t90jObFOGltF4ilSjkODhU1D5Fh4K5ibOOp0XY7
         /b/XH8Ap4WyzyIjkHDdC+IHeDSbJ2ZCVGfRgZJwC0JjbYsrgz9tPwDqbq6v4KQu1/MZc
         0b1rQJBDzWlQ+hx6QcieljJQf1RF1gaAAIMRL/OLfPdiQqP0iDiYK4EKasi1NVjtxIpQ
         Usr8nUPMUtreNFIn7rNoimPYfggSEwAhE/D69h+zTIBadrGDiz1xUZ62sjTYAZ27hN5w
         1PFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001214; x=1744606014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t22CBONJmB65GQP7nsD4ofUIJ4+sf0vAxHh7+1UHNU4=;
        b=vtUGr/1oDjMcbSvBOPdW+YK2Jv4z5wYDbV7on9QrsuOBaXD/aZvB5KqmGkOF7R7ZCD
         eNQ6eohGfvEphSphyk6qXqhEchfwvqg5u3WV96wee8YXO7CR2yP+NL2Fq83kaUheNhs1
         yrdY3rBD54ZwalJiOZQqx8oGQZxl8WLmPBmXY0u0k0oLGlnuDRebDtHXWwPhKBoPOnpO
         et++V1FSZXZ4Z9BW1QmwcXnbhGXdJPRYuTbrf7JAZsnZVRFCwHb7ktBGyXJs2sZYQtC/
         U90oSHw6FwmCHOkunzAZ8oy610j0/EQ8Q3YmnLz9sw+mgsfMa8wiRK0a1h0WES58kLrR
         KwZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoNlxaoazj3A1PVbWnHKL6DWDE46CB2+3i6IwrK3HX14O8k08FL5NGac2qAmRRQ83/Ge/Q7dFkHl0xM9QXucnm@lists.infradead.org
X-Gm-Message-State: AOJu0YxzLmxTOlwSg9Uj0oyfZX5skigEH0AqGbZ/C+h4VLR1WR+45URX
	J/AAoex+SMD2/JLL5k6e1QK9Bdz5Upu6DYruzf2CnfBSeZkOxm3r
X-Gm-Gg: ASbGncu5AQIV+h/N3J+G6KQ5g4LQ84NxGOFMTxGpt8Wwsqiy3DvK+JJbYgXDoqhZjLA
	w9/WTCOiwE+XRR7KgcetfoIvD5hnJGjpDS7PHsp8HevEOf4TxRV7X6g0Q4xlLwy9T3rh95hhY+O
	oaUjYW+IO3BuRvw+eALnfG02NeQVVYybLIVPlfvyH0NLTuMrGPAJsPvMMp/yh1GZs74Gj8lpWGm
	WLG74LPw/gSbcdkkXEITkg6ATF+0bw+cQUGy3ozYPADyJhzJKoWEQdE1qkjbQJIlQvOTNPYQORu
	YYibHuGJU49r4TMNALPNhL2gimvx8DT8qdU5Bg7rZm2qoT0=
X-Google-Smtp-Source: AGHT+IHkFpKG5KLURShxQe/XDzfzWnriRP5pm3fYD01e7ndiHQzSjwI+zMrCouTlArXInI8jl6xCWg==
X-Received: by 2002:a17:90b:1343:b0:2fe:85f0:e115 with SMTP id 98e67ed59e1d1-306a4b7015dmr14258833a91.26.1744001214056;
        Sun, 06 Apr 2025 21:46:54 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:53 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:24 +0800
Subject: [PATCH v6 15/21] arm64: dts: apple: t7001: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-15-ae8c2f225c1f@gmail.com>
References: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
In-Reply-To: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=/9xxkCL20iFcrQUCvIdlPD0ncxR9ZewCh+wmud58YcU=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iHfwtmOGqo5XKi+MJVM24nFqWXwya/Kcraw
 O5i/ZZ8CaCJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhwAKCRABygi3psUI
 JEijEACr7ACw4+MryIBoVl4smMOuI8RCmwN+JZ/aBT3OcN+QuFY/0FfHpsd0GkKD+HS+kKi4XJj
 RuXBjk4nvy4rZJAa3R3Y3mvva0rlW7iUDBhix24sD4zXYqnGVCNOyPBkkiUd8vIv6TX2bExPK6M
 GyOeTm1mSiIi2/aSWJGTgVrmJEcvcZdnUJ0NYSrWmvje1lr2RsJwBVKMwLCnvlnwN/m1YSL9qx/
 /t4n4JuQCoMtQ8lyg6Fr47wJcAj0YSm92GhA8BdzAGAQvG80u3VXfDiuQUvCcgNkJe4pS1byR+m
 6Iw0LBo0mqKZArdToqAOvGMlvWPWwA/7pqyQlxR48ZT9aE1qDI6UqAl12/9duiZ18hm+XkNlYEg
 LjqORKXEbvhSK+G/MljXBxtWnthQSpvvuzFtxWZeVNMFng2wrJEjd9LYkP7V1ElMrRRiiQiEVxS
 Xc1ShfI/BPdAYdueD1zqhSTfgnxjNuSSW+XBzjhC2My2fypAY7l3U+TLbnrNesgQAFI75x50l3X
 4rtaz2+V188Bxkp6osE+pBTWE9usDgq+TAc5tD1VxJck+zte5jOpImIRDeT1Dtse/rDd0FoIEj2
 /NqfRob47D3b25C1NTgjFHHmdBv2lhECqREM+bKG/kkQzx21Ete52j+nGCT0I3Rp7ffhr8E/YGU
 0n64V0da6dVqfMQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_214655_084427_DF5F3B33 
X-CRM114-Status: UNSURE (   9.30  )
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

Add CPU PMU nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index 8e2c67e19c4167fc6639458ce79588e153336603..fca0a100dfd7b29086735d36fec0db51144da456 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -183,6 +183,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 81 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t7001-pmgr.dtsi"

-- 
2.49.0


