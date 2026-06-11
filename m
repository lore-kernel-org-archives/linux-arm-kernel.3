Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABB1CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpVm5xmGC/R2ADzdtCLJ8S55VXRKmTwz2appu9MAZsM=; b=vvoJiXq9QCA16NypYo6NqDBgRt
	SQryrd9RnIxjOGUORgfBWw2lpyxg+Euo4aa19FgrljTXGrqA+F+kBnLa26aJxlwEgYxNJ0HjgGwzT
	jTjgwAZKv4se1Rz+qnJJx0G3dDNfzC140SFzIU5ycZI8E5U3JnMVAILHPNNHW6Z+07LSzW7He9Q5/
	PTwA4iJTaHXHrMWdicNIcA1a9rSnCVV2WghlnbyoEhADSQW2y+vGv8zfrwDfQr4NpOucldIsuhrFa
	rRefVLZRKrAk3nqGn8Z4TlTFsjJkkSeSZe8VbwaIzae0rH7Mz0bZofJu2UNHWXsXL9FzP06ZGKCke
	bBPoEXaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf2j-00000009SVZ-0PUV;
	Thu, 11 Jun 2026 13:01:57 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf2e-00000009SS3-0Pzs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:01:53 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490ae0167ceso37959015e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 06:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781182910; x=1781787710; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpVm5xmGC/R2ADzdtCLJ8S55VXRKmTwz2appu9MAZsM=;
        b=G/Kuiys1ija57Z1jXiI/SKuIjt2CRLPPUpgowlY8K6qvGlxywCjZr7skqE73P0xDzN
         IJpjN8v/X/oAfg4zlbyJjmUKjeqnkrKJbthGeFzsCUH6GjQtjE46rg5CT2tS8TSgY2bh
         usSZr66x/ecwN72oyPESJwAajHZ2d8f1r2HaaDetq9q6G8GPTxHCdp4u9QrRnVR8OSRl
         j3c/w7q51SO6MrraGJuQIwn74XGszNTwIU2wQ6ocpIK9GoPEPEWwXcQACkLtV5Et3SIE
         1UsFvXZ2yW5P1tZEkXnWbrIHmD5DBS1NA4Qif7x1fm9rZgoUtMrZwb2/V0P2asKBBLz/
         U/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781182910; x=1781787710;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vpVm5xmGC/R2ADzdtCLJ8S55VXRKmTwz2appu9MAZsM=;
        b=jlOi2Yc5bX3E4zzsh0ffjKvMK5XzWrpkPVJGvsEL6EnWXPsEKIcHURj64blayZs7uU
         13A5xNbH8ZTtnwOgIHydStClKohLFnleIvjqC1qaOQNpmUyM+ANir3qzwkp79tp7EGaj
         3+HfJXh7MD1ZyVUNivMob/uGfbmcsNfuv+gcgj51e+BawlfnoaoaBG99F/qeHyLB5nHV
         nguCGkgYxfioRUm0lrL3wsV5zgmTWrpqO+Fe+JgVB1Kgm3lZv23fctwaHDZ1/YGJHtUV
         BKV2TiUPakGhY5446mKA0+Ui4YLBO09p3y8/UgZluk0Z0kHnjsMJVNMAbv21Zr9yEQKy
         ZN4w==
X-Gm-Message-State: AOJu0Yy5Es9zxtIzuXfCczcravHxwj4eRa0FsZyV3ZWWV/vRKCP62UlT
	MQ5auy5RLp29Z7UXn+9K9St+bQjLr20/wzG8znRNHAIwaY7PV3XNiMfk68SWaMV0ks8oRkxoXmB
	+IGt5HZN5s++IKlwCEzU1w8QOB3e/sLSjUw31DOS22yPWFnzPz64exS7i8YQpIr4nVoPYT+e0uL
	HZDgLYJaLCbGChlVvLktED0OuZUT1nlSS3cROYt2ETIyNvKQcsBN9IyZDxB2yY
X-Received: from wmpd18.prod.google.com ([2002:a05:600c:4c12:b0:48e:6f63:7624])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d04:b0:490:b58a:dcc1
 with SMTP id 5b1f17b1804b1-490e5614165mr34126615e9.29.1781182909448; Thu, 11
 Jun 2026 06:01:49 -0700 (PDT)
Date: Thu, 11 Jun 2026 13:01:39 +0000
In-Reply-To: <20260611130144.1385343-1-abarnas@google.com>
Mime-Version: 1.0
References: <20260611130144.1385343-1-abarnas@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260611130144.1385343-2-abarnas@google.com>
Subject: [RFC PATCH 1/6] arm64: mm: explicitly declare module and ftrace
 execmem regions
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-mm@kvack.org, "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, David Hildenbrand <david@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
	Yang Shi <yang@os.amperecomputing.com>, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_060152_140511_13E77ACF 
X-CRM114-Status: GOOD (  10.30  )
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

Replace the reliance on the EXECMEM_DEFAULT fallback by explicitly defining
the execution memory (execmem) regions for MODULE_TEXT, MODULE_DATA, and
FTRACE in execmem_arch_setup().

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 arch/arm64/mm/init.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 96711b8578fd..c673a9a839dd 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -519,7 +519,7 @@ struct execmem_info __init *execmem_arch_setup(void)
=20
 	execmem_info =3D (struct execmem_info){
 		.ranges =3D {
-			[EXECMEM_DEFAULT] =3D {
+			[EXECMEM_MODULE_TEXT] =3D {
 				.start	=3D start,
 				.end	=3D end,
 				.pgprot	=3D PAGE_KERNEL,
@@ -533,12 +533,28 @@ struct execmem_info __init *execmem_arch_setup(void)
 				.pgprot	=3D PAGE_KERNEL_ROX,
 				.alignment =3D 1,
 			},
+			[EXECMEM_FTRACE] =3D {
+				.start	=3D VMALLOC_START,
+				.end	=3D VMALLOC_END,
+				.pgprot	=3D PAGE_KERNEL,
+				.alignment =3D 1,
+				.fallback_start	=3D fallback_start,
+				.fallback_end	=3D fallback_end,
+			},
 			[EXECMEM_BPF] =3D {
 				.start	=3D VMALLOC_START,
 				.end	=3D VMALLOC_END,
 				.pgprot	=3D PAGE_KERNEL,
 				.alignment =3D 1,
 			},
+			[EXECMEM_MODULE_DATA] =3D {
+				.start  =3D start,
+				.end    =3D end,
+				.pgprot =3D PAGE_KERNEL,
+				.alignment =3D 1,
+				.fallback_start	=3D fallback_start,
+				.fallback_end	=3D fallback_end,
+			},
 		},
 	};
=20
--=20
2.54.0.1136.gdb2ca164c4-goog


