Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB97AC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVVaZTfA71hNG0BSuf2xrM/AfoVAw+w3Csdp+8nmO5Q=; b=PqRnrM3SvusfVNq04fq+5BQxSw
	R9KyM2fXwtrqjN8uBvXArj25ARClOrcf+lve3IR6+766qTz/euDL6nxfOwR6hQpH76DtCLFNxk49D
	4QmeHeNepeC4eMQWgVWYwIJrSO96MXAeLoyhavuirh3XI1Hg3C0deHndnUImLfD7ECG3rEWQuXZZu
	17+Eh1n2hUTwDFM8y6ALTiNKPHO36ga8Rn5oY4fgzW8vZ47W4iYa3RY/D2hqdVbs55d5lFU7QuiJe
	d/hjji/PBR48Evma0P5Qt1EJ8sGo7DvFBnNdxV4JdSUv1LNau6Bexu9OXMOpJUB/9vwWGvYIrh8gd
	cmRqqFoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrj-00000007rhm-1Ti3;
	Thu, 24 Jul 2025 15:28:15 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewRF-00000007evr-0L8l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:50 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45622a1829eso3520175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365407; x=1753970207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVVaZTfA71hNG0BSuf2xrM/AfoVAw+w3Csdp+8nmO5Q=;
        b=mcma0DFnzX9PQCdY4X6TDZ3qz5TTRyszNylbrgb3+ZFly0IbmCfeEROLdnIty0zab6
         U0IyXiVAe0LtrfTN0qP2KhyXgu3TcX10rDcPkAKEEO14l7hqjQ2aUvfA+4A1esVloSO8
         9sA9Ye+HZVDvrlcFPPVmglsXr4OXnNAWe3qFdQBSWWx0LM8qdfu4XyIKraSd4pBxn3jq
         /SJu5/TXUPCItw+lInLQHm1QvHEwNce98JlZhS8MYpGwOb1omqFjC4kidSKnG3aPGkaa
         RyjlJ+kaZqxARNPZUZCMtEXB2xx64PCpd+H2gE5fd+blXU1txX0b9BZmh6jduz/drfdF
         LUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365407; x=1753970207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVVaZTfA71hNG0BSuf2xrM/AfoVAw+w3Csdp+8nmO5Q=;
        b=pahKy27YxbPE8vE/3mNZHCS+NjcxdsPv4XyKy/7TkCVjdhJondCfPp005W9B3QL0Px
         7I9pnXMRElGftAu9AAjp8EKweD6D2fcGAH2jocqw3yu0lDTShBRQ/dwkEmp4ZDeSNDwr
         jTeQV6wE+NqHBBZzRTmySF7iSRJp71O6/ju9RUGo51Pvk4xKBmUcuPQ9gylwNBqvGzMd
         yJX5O1q2btUKaFlN9P8tb5KS6f+PzyVNUvk2jNiGs0yFC82kB5i0eXRLP3MWoqCLq7UK
         pHsrX8TmlKUQp1I45Il1shSaOIJsJiU1BnDPUn7gT5wVE3sQC61d3EwSl5PXfc+CaIPV
         rEwA==
X-Gm-Message-State: AOJu0YxIslPaeR16oHyJmDR31bKCuA7P8zvBjgcV0LsomN0MiRX5yDMM
	+LQKHY9S6qTjkaSaWnKL+UHDAfMD/orz3fGWb3/7oWgTVChiyuJPMcBtZTCTtnKNRvE=
X-Gm-Gg: ASbGncu+tsM6KUeDKEeSDbwEfvI+Mt0Gq2FcXSLAElDDTSwluLrPx+LodrIxjAnEr1d
	yoPttkFTMi0YdOlOaAN8y8VCSMWoBnZ3l7an8iIgDCm3ewW7lZ4W3OsWcJelHBVBKc6UHMm0yZA
	Q9/zWY4ZWw6i36dO9A2ZxQiKre6WZsI5dgt2FOLN4spWT7hg8YTrCVGcPreEZmoGThHcSCFD4Rx
	nrDKZALsXzKD1Xv1As3wbCVS5U+YZ8PXzOUfIRx18773y4qxL1SSOKa1+c1PWlASp7Sgl+5ZRHL
	aIMaT5Y4fuGCSeUnKuqUd0EC1PSnPemCqMbjXzsUyREypdfle03ABqfvvqEzKwrfnvXIsIhvqZp
	QezwKx1ubrG0WojIHGy1bHaI9nYnEi9dAV5ngu3/eO8UzGC8GpBqytOr/a735V8d0ekYNw0v2xT
	jYk2pkG5fqIoZY
X-Google-Smtp-Source: AGHT+IEY/sSxRS3Okztem0YstmxIRhVbZi0Ba2eKMOhhVazzTllUuYgXqZyOH8eoFni3mxJ7gmSmCg==
X-Received: by 2002:a05:600c:630f:b0:456:2bac:8f8 with SMTP id 5b1f17b1804b1-45868d485b0mr79331075e9.16.1753365407522;
        Thu, 24 Jul 2025 06:56:47 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:47 -0700 (PDT)
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
Subject: [RFC][PATCH v2 28/29] mm/init-mm: Annotate additional information into Kmemdump
Date: Thu, 24 Jul 2025 16:55:11 +0300
Message-ID: <20250724135512.518487-29-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065649_118225_CAD817B0 
X-CRM114-Status: GOOD (  10.12  )
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

Annotate additional static information into kmemdump:
 - _sinittext
 - _einittext
 - _end
 - _text
 - _stext
 - _etext
 - swapper_pg_dir

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/init-mm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/init-mm.c b/mm/init-mm.c
index 2dbbaf640cf4..01ff91f35b23 100644
--- a/mm/init-mm.c
+++ b/mm/init-mm.c
@@ -20,6 +20,13 @@
 
 const struct vm_operations_struct vma_dummy_vm_ops;
 
+KMEMDUMP_VAR_CORE(_sinittext, sizeof(void *));
+KMEMDUMP_VAR_CORE(_einittext, sizeof(void *));
+KMEMDUMP_VAR_CORE(_end, sizeof(void *));
+KMEMDUMP_VAR_CORE(_text, sizeof(void *));
+KMEMDUMP_VAR_CORE(_stext, sizeof(void *));
+KMEMDUMP_VAR_CORE(_etext, sizeof(void *));
+
 /*
  * For dynamically allocated mm_structs, there is a dynamically sized cpumask
  * at the end of the structure, the size of which depends on the maximum CPU
@@ -51,6 +58,7 @@ struct mm_struct init_mm = {
 
 KMEMDUMP_VAR_CORE(init_mm, sizeof(init_mm));
 KMEMDUMP_VAR_CORE_NAMED(init_mm_pgd, init_mm.pgd, sizeof(*init_mm.pgd));
+KMEMDUMP_VAR_CORE(swapper_pg_dir, sizeof(&swapper_pg_dir));
 
 void setup_initial_init_mm(void *start_code, void *end_code,
 			   void *end_data, void *brk)
-- 
2.43.0


