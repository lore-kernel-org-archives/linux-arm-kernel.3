Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD1DC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 04:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJlZQxAuIqr1JT83/pU2DIYPeCs7+afDmDUJaJYT1ts=; b=QaZlBr/icG/So2Yc2ZbjDGxCLR
	2ccTUw0+suSj3d0JWZVp7tgq7HPWIYqgDppOXm10MNS/vMuZVAc7eCyey+apvInZ+GlLjxST9cuP+
	fEop3XpFjzVSXgo+LDYclRtLj/Iq1GI+jb1rH7szITk/Ibp/mwOkOQ/DMGNNavCZxJgoK9+dVKNd9
	ZFLjcL9YJJuScO45XBZotpHFnqluiyQSkOyshUW91MqAHSPfvCwNyF8jwYz/2JcEoHXJ9JaHMM+1E
	w4Rr07nOwixjDBaW0XnoSSKljyaKLsel9zz7TMg7SB8f58S2DLcPXcxGjuV0BkyVKsL+C9N6c2oW8
	keGD3qhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eXR-0000000GON8-3TaX;
	Mon, 07 Apr 2025 04:56:49 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eNK-0000000GMij-09bd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 04:46:23 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3031354f134so2883694a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001181; x=1744605981; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJlZQxAuIqr1JT83/pU2DIYPeCs7+afDmDUJaJYT1ts=;
        b=crXpBE6Rf7tCr507gwDdLyz0Yj43/9aU4XP7ttP5qREXXwSlhcY2cw6D2ICHvU256i
         CKqNhStJHitStctUcI+xFrjYSMGuD8tgpDNoEPPH2fUJuxMpVXJAaKXSOQdd8DxcAgwT
         i0RLAOFL5w8N1pq1w5Xry8qUxJoptk1zfklPfBAwYxoHR+kHewHC+HsVN3eYLy9yyexm
         OY95WF+fpxMHy6066QaYgSg00aAN2/LVZ0dWfoh/FcKaWdWRUnOhpO42ZzoVLuSQpYJW
         vwYIjasjCI2mXmwQHK0oZPI7im87/wI9AejdUy3q1S6iJnLLPf79wbTW4rP4qqhRBVxf
         ENPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001181; x=1744605981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJlZQxAuIqr1JT83/pU2DIYPeCs7+afDmDUJaJYT1ts=;
        b=B7EySX4d3DknmBh4ME8VUhgDUBnDsAYdP/VcVuqYS0/Uyuu4HVTcJuTiV99C7nPND6
         jNM+x6wc6okWqJPEQACdPHgjqk31L1yqs8bq2SZiQQQBgVE8dAUyfr4GjXOcec3BaSOt
         Yw8/gRP0WVSO5WT+Hm0Kf7JSeq4C1UlAbyLbXdyWcnnZbG7mtsc7Yi+9FM78Ml9kv1cI
         1nJAg8ffHngg4tqt+X2SDxDiNvhyzt6pOQck+PiZDegRTSHfya9FSO/tNixJD1QeIF2u
         mBEUH4ywPCd10SLN+/95EUNoi5BC9OPmfpabXw5kVGYui3i4Z7fLbt81pCkjBd3Y2CRC
         P7sg==
X-Forwarded-Encrypted: i=1; AJvYcCVmD1Gd0Ba5nDWmHh6OsUTU0DQ5hteqXKoJN2vLyD4KXUcddhGvZMvfkZ78D64QaM44hPwRoC4qQ2BZc/6k1NV6@lists.infradead.org
X-Gm-Message-State: AOJu0YyMLWfXTOPzvcfmbaHJT+EaPe/zJX98qWpuBVkhsMWvgn2nc0Id
	oWpnbWgdbfo/pTmZbs+GNJzzS+unwe91R9JQZ3fYs8IKLolygc9r
X-Gm-Gg: ASbGncse3l6oE3KoyIvwswf0d4bboSI6WkjfS6DWLxJrwPFtm73q7HuKipW6DyiRPD8
	kEn5+c6s4VOHuZ6kvqrOOaxbthgLHwudycjcIxWxVCbrHC47ireC7TR2VeDvjL2z/DNG1GhOA6S
	uOorUmA6zY3KhG9LKUllVgKHKHANY5f9NTAKTq9khjGMVTu7HfGQbRkL3wjY16Rzqt/GyRaNHIP
	gkBWJvAu8vJSPwbzqXQWTEBCINnl83ZahfJByB3Ct7fA9QBoelF4m5Nxllme3rTvit1lxB9eCgA
	U6hjYcn3qWiagQzmc+Gcgot29j48aLSrPcdhUaeyizSocEw=
X-Google-Smtp-Source: AGHT+IE3UsvEN8B/jPJeK2nWJ2V478sYP9gTu+9N0iXdhKlIqPB6z7Iq+TIo5yM0yYIrGGZUAhTo7w==
X-Received: by 2002:a17:90b:5247:b0:301:98fc:9b2f with SMTP id 98e67ed59e1d1-306a60e4ad6mr13274073a91.1.1744001180978;
        Sun, 06 Apr 2025 21:46:20 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:20 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:14 +0800
Subject: [PATCH v6 05/21] drivers/perf: apple_m1: Support configuring
 counters for 32-bit EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-5-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ow2nagzt8cdbi88jV06ZnLC5cMis8xMzKWgyHSgosSQ=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iGwNe6cSPZDJeV+M3GsJYDoPDTRilFEHJMm
 2rQGNvdL0uJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhgAKCRABygi3psUI
 JFdaD/40iSJYdfx9SHyamIEddVIar+7DkYWcqtkWkzzjdFjSq6Ak3TgXq+p2CjsWVzYpv6vrMqN
 wkUbLR01ADbBmEykVR9Y0QtU5S9VAFqQX5Vfn+TFbFhK6Uuh+8mC5RllY0pIqQoEThDegeWYpSJ
 JhR3g8h8WP4XRZjuiw1nH0e8Ps6434D5kLgPRftpB5o5q0jFjc0D9TZ3G5GFT9Ff6sXVwqLPO7Q
 /Iusv7lYcBaKt4e1jwlmjSSrjMXq2V0KxFOobVCOVtVsl83igP38QkOUf/HeHnwyOMgKsyYZ4EF
 afHMqCOs31GPtvVmDFnKC96tFnzbu+VPFp4cXVqpMUzNM5P8JvjzR7Y9U73PGwoKNs3He827Gv6
 5zsgxG3OFOlqcpg6IaDXEDBdwnlNUpCgQyn0mBUv0ENcHpQk0PDzzOmnucKmD5OJ2pQVQeb0sJ/
 XQoTupZGYQLxBm1DDMIJgmNlbehuTD26BIMJ/XSHL0bUy/CMmJ2NULPB3O9qWM0TF9JJcmrMDfp
 ty1aG3m3O6fAFdDxu4mfj4AxNr7OgDg1jhorFf1h6HerMlSE8yj5Q9+ZI2sgZhFbP6moM+/aNa2
 YEqfWn4n4QY8GvOq/ro6MkZ5LexuutJd+d2HYVvjqSyaBJTyBwVo/SzYJMLc4DBigaFHI7R5XSW
 h1HMGgKlDZVP8ZA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_214622_098847_D0340CF8 
X-CRM114-Status: GOOD (  11.89  )
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

Add support for configuring counters for 32-bit EL0 to allow adding support
for implementations with 32-bit EL0.

For documentation purposes, also add the bitmask for configuring counters
for 64-bit EL3.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/include/asm/apple_m1_pmu.h | 3 +++
 drivers/perf/apple_m1_cpu_pmu.c       | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm64/include/asm/apple_m1_pmu.h b/arch/arm64/include/asm/apple_m1_pmu.h
index 02e05d05851f739b985bf416f1aa3baeafd691dc..6e238043e0dc2360c4fd507dc6a0eb7e055d2d6f 100644
--- a/arch/arm64/include/asm/apple_m1_pmu.h
+++ b/arch/arm64/include/asm/apple_m1_pmu.h
@@ -38,8 +38,11 @@
 
 #define SYS_IMP_APL_PMCR1_EL1	sys_reg(3, 1, 15, 1, 0)
 #define SYS_IMP_APL_PMCR1_EL12	sys_reg(3, 1, 15, 7, 2)
+#define PMCR1_COUNT_A32_EL0_0_7	GENMASK(7, 0)
 #define PMCR1_COUNT_A64_EL0_0_7	GENMASK(15, 8)
 #define PMCR1_COUNT_A64_EL1_0_7	GENMASK(23, 16)
+#define PMCR1_COUNT_A64_EL3_0_7	GENMASK(31, 24)
+#define PMCR1_COUNT_A32_EL0_8_9	GENMASK(33, 32)
 #define PMCR1_COUNT_A64_EL0_8_9	GENMASK(41, 40)
 #define PMCR1_COUNT_A64_EL1_8_9	GENMASK(49, 48)
 
diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index c03eb7acbb66790e17967d570c71746f72e40867..f2566a0f8d330fdc0d71ae298f16ee9700a13c23 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -348,10 +348,16 @@ static void __m1_pmu_configure_event_filter(unsigned int index, bool user,
 	case 0 ... 7:
 		user_bit = BIT(get_bit_offset(index, PMCR1_COUNT_A64_EL0_0_7));
 		kernel_bit = BIT(get_bit_offset(index, PMCR1_COUNT_A64_EL1_0_7));
+
+		if (system_supports_32bit_el0())
+			user_bit |= BIT(get_bit_offset(index, PMCR1_COUNT_A32_EL0_0_7));
 		break;
 	case 8 ... 9:
 		user_bit = BIT(get_bit_offset(index - 8, PMCR1_COUNT_A64_EL0_8_9));
 		kernel_bit = BIT(get_bit_offset(index - 8, PMCR1_COUNT_A64_EL1_8_9));
+
+		if (system_supports_32bit_el0())
+			user_bit |= BIT(get_bit_offset(index - 8, PMCR1_COUNT_A32_EL0_8_9));
 		break;
 	default:
 		BUG();

-- 
2.49.0


