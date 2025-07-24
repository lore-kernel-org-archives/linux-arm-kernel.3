Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6716EC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IAPeYZVy8llrcCGwu3MIGe2nhyxNrtHRlXTr72itWZc=; b=NeQCGnLRtcYKzaKTFhBxO1t9O4
	WC+Mq+MC9qk6ZnELF4fxdr2YaYQMhtDW1AzRmRr4iUBIigiMq+qqCsDuFqwdKFAUYLTEaQwA0foMX
	inrFLFpVexfqJmyGZ8eDbIofygU4ZI1IH8mX84xR8G0AeqX1kpNvIFNyDPPmtlSfIGN99gUpsDwGm
	yVCRPTJnm6jtu1L4MBCQ5YT1gKv3crIMHOxtcZn+g32Zoh4vkqXAW5jFDue8hrrulqNlvejjroVCC
	YNiZsFYaP8/wyCzFD1mDPa5DCKRyCfBUkUd4hQQVPj9Wrw9E07diVpvGeeaEdzBVxyL+t+u38draX
	KG0Vcesw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrd-00000007rXD-3C6w;
	Thu, 24 Jul 2025 15:28:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewRC-00000007euY-0wzm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so1287802f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365405; x=1753970205; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAPeYZVy8llrcCGwu3MIGe2nhyxNrtHRlXTr72itWZc=;
        b=Irb8MFOY0h4a/JL9To55VxnFP+dTe+h6us2d+gy5zVE4SCKNwGMOS4b0bQYT82YQ8M
         iUR7eNBKz7fk+cYjTIiGyZxVBpJVLFc+U2Sctvu1DY50gOmJ6jPPtyRkgBlycHqnVzDf
         vpFvBiHrF99yncCNS3BmWY7UdzieLRcnO4+8a+gKN88MVCmCnkTdHchLAtlg4AoGAqRl
         Jbd5shDvXjL0y8PtIR55iuFCtYCpgf5We5MLJ1VCiKjOHrowPSaIgTJBIC0kIjiI5HGU
         cQwbAzkA1lJwxUAiKy1dXSGlJbP9cNCjdpfto/b4J23v1dowtXFhlPhuxD7x8b/yF1Ce
         XFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365405; x=1753970205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAPeYZVy8llrcCGwu3MIGe2nhyxNrtHRlXTr72itWZc=;
        b=SUBaesv5LQvWZKVMqlfh3U+9UopiEfYWAroB+e201GR50/RJjwuNYqJEHKZwQ+BnB3
         e23Wkl39AkY31FSyYL/47iHfDEMZ14mIt2x9rzpGnmTnLrRmUQPPx11VEE381BzfS0Iy
         wvZ0CR8XguVsLq0QM7XlyuVHOGxyWLGzqJ8VkuTwVxObRJYjRRFSuKn47SMFYdo5GXhM
         r8BGlrMe8vyN4ddzHfAiKZRzHddtDnOYb++72FRgCtiL+Ik7rxEE/ZqNP48Ctw3daU/1
         ZZeleHcbAwcsJYX9cNszK+c7c1QwZiBUtpCZA7NNRX8FKA3Qdm8x/zBj0ei0Fx0gsuPO
         /Osw==
X-Gm-Message-State: AOJu0YypfgKfKDWFDZSdiSizOn3WYSozYx2WKu6/teUVt1VuldJzIfi1
	A32djiFuraT3swBxiFWT8C+7ZYT26I9Ma0dRRZI3gBWL908kl/Fh7LHgteY7pVMKoA4=
X-Gm-Gg: ASbGncvD3CM0SO/nF/S7HQ6kQWAJGi1DJWKQv7F9OMRwjaG6aY7anTJ+ci2wzBIxunO
	GdfameeQyvtrsh0JSKpnAPjMZ3wSLOgUlyI9f7YYL4JMtbXWYKKherYbQNK+bY9tnN/t1vtOmLo
	TvAR/o4mx26KakQ02yYaE10iOt4x2WTrg7Sj9nAZ9nVbmEND/OnWRFZH2C+LZQWtgv+u/JzDVyz
	2SkB8jLHnI9USglUno4lnyQ/2QpRfEouRpDQpSGJ5UmLIS7t5mFshm+vzivwBG5j/zuO0m8Ou+x
	kiQjxwnkHvnV5riP66oH1QRIjrVJl4U5y+EeH6kjdTEr1JbCBcxjs1oHIxfmlEPIFocd5B5qgu/
	Bu6XPQXJX8ktJjxxIL2RdVOQM3vDCfVkzpOpbbF9xQmFng+QCdRxxghgnreGlg8+qyMG0ao/S1X
	ZtAqF3l2Ou/xYv
X-Google-Smtp-Source: AGHT+IE/tOxCaZJgBIx1z77DRVJHCm2c/RVz26viacIOb6VPqsOvedK5J5brFqoj/rS9r4t912qyvQ==
X-Received: by 2002:a05:6000:2482:b0:3a4:e1f5:41f4 with SMTP id ffacd0b85a97d-3b771356cacmr1929316f8f.17.1753365404772;
        Thu, 24 Jul 2025 06:56:44 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:44 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 25/29] kmemdump: Add additional symbols to the coreimage
Date: Thu, 24 Jul 2025 16:55:08 +0300
Message-ID: <20250724135512.518487-26-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065646_261899_1EDAF007 
X-CRM114-Status: UNSURE (   7.79  )
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

Add additional symbols which are required by specific platforms
firmware for dumping an image.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/linux/kmemdump.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/kmemdump.h b/include/linux/kmemdump.h
index 7933915c2c78..94493297d643 100644
--- a/include/linux/kmemdump.h
+++ b/include/linux/kmemdump.h
@@ -35,6 +35,22 @@ enum kmemdump_uid {
 	KMEMDUMP_ID_COREIMAGE_high_memory,
 	KMEMDUMP_ID_COREIMAGE_init_mm,
 	KMEMDUMP_ID_COREIMAGE_init_mm_pgd,
+	KMEMDUMP_ID_COREIMAGE__sinittext,
+	KMEMDUMP_ID_COREIMAGE__einittext,
+	KMEMDUMP_ID_COREIMAGE__end,
+	KMEMDUMP_ID_COREIMAGE__text,
+	KMEMDUMP_ID_COREIMAGE__stext,
+	KMEMDUMP_ID_COREIMAGE__etext,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_num_syms,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_relative_base,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_offsets,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_names,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_token_table,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_token_index,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_markers,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_seqs_of_names,
+	KMEMDUMP_ID_COREIMAGE_swapper_pg_dir,
+	KMEMDUMP_ID_COREIMAGE_init_uts_ns_name,
 	KMEMDUMP_ID_USER_START,
 	KMEMDUMP_ID_USER_END,
 	KMEMDUMP_ID_NO_ID,
-- 
2.43.0


