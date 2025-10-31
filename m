Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94916CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Xa3/Awesw6OMt3PSs2q2cBtqduLAjKaT7ji9cCCq90=; b=gGGdNSuWVW5ALFPPTZhR382Y+R
	YH+dhXdRlGqkRJXDJJd/9i0J5Z2c9shESeveeggEy9jjDjB9KJo5gjbPqxtq/0GjtU2ybgOSAbQpc
	t87p9pySMJjLI+t1sE/4cPbmL/KMzOVAaILG71QqiF0GiueylXSQ5j6hBSa6Z/RBksjmS8cgruFOx
	MYJxJE9h4AFYPb4emTL5MGqMUCpcafAEPd1ePbY3b+/scX9Ri/LpylZC85bAkcgSiFHP2Yhyd71HI
	1U7Gfs08numaR/r9sCwf/D0RwXcrl+GSUVakEqa559lN3obQrG02UF5SC/nVlsgIBWB935q0nzHwU
	1cBOACiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmZH-00000005vzA-0vsL;
	Fri, 31 Oct 2025 10:41:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmYC-00000005vK5-3bIL
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 31 Oct 2025 10:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0Xa3/Awesw6OMt3PSs2q2cBtqduLAjKaT7ji9cCCq90=; b=Nf4oUZZ0Q8wHTz7TQIqJsS5NbX
	5VBRl0psp53A87hBqSZTmUssHyWr8onnRlCZF+CV7rssSqxIZpzvjKTrTpG0maUra5FDSGuVhSrVG
	z+35NtXRPcviCeYg90c6xA656o6kE594SsVgd5vaz7bMhKiSV74qgL1OupUhWuYc4uTLOn7HRxeFa
	jTLnpUjaimoZo9WspO2pQsEjAyO/rEoVw5SHBN/icURpn/TsD2sTgegOaoU7aiCdfht/JSCEo5DTv
	HRcub+NVr5hy9KN8d5Q3x9CCBMX6tClX6aT0yiRgT6Hph0sVcaIP2NqzNlVuJUp4lgL8hhFPBeeXb
	nmbwD93w==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElgR-0000000B3CB-0YaP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 09:44:36 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-475dabb63f2so9485315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907204; x=1762512004; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Xa3/Awesw6OMt3PSs2q2cBtqduLAjKaT7ji9cCCq90=;
        b=tB9YfLM+EnJoJuY71UYakJaA6eQ4+lqhhXSIc/dXaNkTY0GoD0X9UexLrOzz2ebZNw
         dvz5y7svhWA5iJoj8lcDM5rAp9xZ0VGbvZOzybCe2RptMgteU3SuG5wCnA0daJQRC3J3
         yaxBY5r5tmTP694hvtu0RVx2buv06leInv3F6h73sMuxYJISWiMM3wNrZMw0JYq9gzoS
         Wb6K/Qnjiqple6ONPy+JCHihwA+7bOYbSIVmJb0+81y1Wn23zJEEmGPwg1xv7oqkvwRM
         W5cUar6bIbJsltOVJ2/s8PMdAaWlsnTfQT3SW5M1qMF2uOiFoJ2ivMllFsW3Zjmoopv7
         8VeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907204; x=1762512004;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Xa3/Awesw6OMt3PSs2q2cBtqduLAjKaT7ji9cCCq90=;
        b=NZ+gWM3GNtiqy4phydntRX9DKhAJpW79N+utibodLTHuyL21+6IvY9oDiIRiMJ6YiO
         R3EZt6qnFuFZGnIpgZszwO2aayEo2xQi1Id4W0faKjtJ59MbJRIVgXJKnz1+yZb2iDoC
         Ygjelyu/jiJ6Mb1LiLOseompS/gAgL9Vv7omz1azbj8ZSpdivVwvbrj2Zumhfblr3oI+
         kx0qchlyqDPTIpwHXTN9dWjw0nQwFRYKhubLnI8UKCPJ7vR5OjKpg0OttPIuA9JvzWTz
         Mpy9G6f8H5PsmC27YUJtDxG1+CDsBkxLXWoLVc9fx/YiO5JOHIZwfEpEhBiTHGSd0xLa
         5NBQ==
X-Gm-Message-State: AOJu0YwcpnAm+ZBL+KGjvbtcV9xf5RGsfJ/4djFOuQ8Lt27Rx/fCTUkQ
	Qwq9S+fpKFoOqaKMs8udX/mTla8M3M4I9tl5WwOboyOPGGIbkHfVVLjSHqmKW4g3eXlQBPZftJd
	gul9/k1TYslLoYA7kYMUDjHU9R+Qyuq+JQMU/DUlYqZRQnGFrR2Bi1sNYBlYZlsbpDqS17gLPOx
	vepcftiHeBWNQaYC8gDPqrn4RTbsXMmCVZIv8RtXM8lnxg
X-Google-Smtp-Source: AGHT+IFG1Dv0rjVcEt2/0GVVIUFS+KzXMYU0UsEadz9yjstPJXyipRoXNOS4eHXBONiuPbDNnDbrnIrq
X-Received: from wmwq8.prod.google.com ([2002:a05:600d:8348:b0:476:4b14:2edf])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:538e:b0:46e:33b2:c8da
 with SMTP id 5b1f17b1804b1-47730890e99mr28895635e9.32.1761907204019; Fri, 31
 Oct 2025 03:40:04 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:18 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914; i=ardb@kernel.org;
 h=from:subject; bh=JNFlhs5YlNOgtpbYMnFMguYKcFlrOPN7ItLaOkFoa/A=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4r3azVwKvxa+e+bzxvzhjJCoDf0pmzLzjxfveskbc
 3b79c+sHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiL3IY/qmunjvvbXvjWee2
 punuZxcfZXy6++W/uyz//fM8bu+WUnjF8D/61YbAlb+lv9pt6nmpE1ux7mTG++LWrclW3s33r5W svsEDAA==
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-42-ardb+git@google.com>
Subject: [PATCH v4 19/21] net/mlx5: Switch to more abstract scoped ksimd guard
 API on arm64
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_094435_295804_0D95781F 
X-CRM114-Status: GOOD (  10.46  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Instead of calling kernel_neon_begin/end directly, switch to the scoped
guard API which encapsulates those calls. This is needed because the
prototypes of those APIs are going to be modified and will require a
kernel mode FP/SIMD buffer to be provided, which the scoped guard API
will do transparently.

Cc: Saeed Mahameed <saeedm@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Tariq Toukan <tariqt@nvidia.com>
Cc: Mark Bloch <mbloch@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/net/ethernet/mellanox/mlx5/core/wc.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/wc.c b/drivers/net/ethernet/mellanox/mlx5/core/wc.c
index 05e5fd777d4f..815a7c97d6b0 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/wc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/wc.c
@@ -9,6 +9,7 @@
 
 #if IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && IS_ENABLED(CONFIG_ARM64)
 #include <asm/neon.h>
+#include <asm/simd.h>
 #endif
 
 #define TEST_WC_NUM_WQES 255
@@ -264,15 +265,15 @@ static void mlx5_iowrite64_copy(struct mlx5_wc_sq *sq, __be32 mmio_wqe[16],
 {
 #if IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && IS_ENABLED(CONFIG_ARM64)
 	if (cpu_has_neon()) {
-		kernel_neon_begin();
-		asm volatile
-		(".arch_extension simd\n\t"
-		"ld1 {v0.16b, v1.16b, v2.16b, v3.16b}, [%0]\n\t"
-		"st1 {v0.16b, v1.16b, v2.16b, v3.16b}, [%1]"
-		:
-		: "r"(mmio_wqe), "r"(sq->bfreg.map + offset)
-		: "memory", "v0", "v1", "v2", "v3");
-		kernel_neon_end();
+		scoped_ksimd() {
+			asm volatile(
+				".arch_extension simd\n\t"
+				"ld1 {v0.16b, v1.16b, v2.16b, v3.16b}, [%0]\n\t"
+				"st1 {v0.16b, v1.16b, v2.16b, v3.16b}, [%1]"
+				:
+				: "r"(mmio_wqe), "r"(sq->bfreg.map + offset)
+				: "memory", "v0", "v1", "v2", "v3");
+		}
 		return;
 	}
 #endif
-- 
2.51.1.930.gacf6e81ea2-goog


