Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE68CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYpcsE3JJVoPh3yiGg+2u2fE9IOmYvM0Rb6jQc+GT84=; b=DV7/MT6XUNUgU0Xn+D6HfxivpH
	iRObAbno80g6POILn58xEPyYf+Mifv9hUtCP86V/GQ2N3C0jQiyg8HbESNWEjjnpSEshBksdgdfA8
	X0VsqnufXEHO4wjB3XYs04ldGSkXbzTOuDcAAFf9PrENe961ruVRZMWYCwyZicyGJ8fneXhvwPmSl
	g705ln1+4C7SwnPu+/RdMpIPqXeOzpkRM2hQwx6obc9rtCgvdWvzMvqOyj/z3i1hAg4MztWN3x7Du
	/PLGHySxOQXNZ72RQ1WFRG9RfJN0SrCg0PoDoZ2bgY6Pwly/SYsfmIrnkozXDjcVixkXCzeaFXfjQ
	HXPDXeeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Pm-0000000A82d-1wZk;
	Fri, 12 Sep 2025 15:10:18 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Pj-0000000A7z7-0Jat
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:10:17 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-71d603b60cbso18634677b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 08:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689814; x=1758294614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYpcsE3JJVoPh3yiGg+2u2fE9IOmYvM0Rb6jQc+GT84=;
        b=UPqsDMrTHf4rh37R/fMefxhImkqR7ugiW7/s/gY6P7UGPl5/psIRSSDj2ce3w1POAa
         aijpclcnvl3DUchNrQxPpMcE+SC455L4L0su3/IFPrtMRw6UEMnq4gWeQj+KmKulCR7w
         l5beAulBYRlynH/YqrjV84EgccGdYLUoVlFbirdsXMv/a0V/hHEAwaAtG+pJd0bVJ1Cj
         6buc/7PvNFcrqxVyJ6bc2CLVy18G2Cx7RStm8AOZRXr5qU61JThU/FaO4eSfLe7ku7gp
         TsxQpiKAaUTUzCZddrKR+06SZBWnmzZfLpuFCPvQ8il5xhq0WBMd7ca5jz4Qaye7Xfs7
         XXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689814; x=1758294614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MYpcsE3JJVoPh3yiGg+2u2fE9IOmYvM0Rb6jQc+GT84=;
        b=DXiekvjuBp2Hi2GAmpNr/lwJN6VnTYXNcIz6+YzYdz6vdEjXeMwnO+gRFxxNfxZkiG
         2lCe66DNQJ1yFGxv+Ra4odAMWCb0+DIUoSxQaCYvKnfKllmdKylkHQGK8mkHQUrVUyS+
         9s/7xYiumL6VNnHQelsm1kwU2OsYTM7fQo08XWhGW3D/cqPnwHkZ5wR9ol+9bF5rZvbx
         vP6tzgdPa5Ot/mqnxgJJFcy8Nd4wJcULDxpVfMbPaTE5FT9HOrKKntBoiuEQ/zRmJqfi
         fLtAFLVen41etZjJ/AObn3L8GDU4J3YRAt3YWo6HAFhaIcUpgP0rIABBbTSIc+DOnGmk
         ex1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfjQdLZD/V9IfkK6WJjHQpEQ0qU7ox2hTmhJw1bIXQ/7k7GrhPTNB1CfBQmw2QFU/PrtGAUnFQO1ur32mmIzt5@lists.infradead.org
X-Gm-Message-State: AOJu0YyJHZpjS7oZ0fJoKH5M/AxDCZI8fAkuS+mwYDH1/fTI8M8Y5kqG
	vWmsXtK4mhWs638cPRC/2oMg/NdofvM/lepvgB1z0OAmfQhmfqrpjE1SJq+zek9Sieo=
X-Gm-Gg: ASbGncvlRCu3spa44jDgOFDPh+Yh7GafCmZDwwPeGoCtUwcDhSFqmY39TaE5MJ9+OCi
	2mxXDJbTzEFwxwrga4G4ue7HpHfZeEMZXGifXamxx/qL2aIIukWFOQCR5hKmC00LlUYtyGeB0zh
	ts6hglU3bI/woz4EMAgpiWDeTtJakJ3cmW/sX4EHiJb4FsAlot5kms1Y4uZ3knekcfqUNDl27gO
	1DBhx8mxis0OvQ+Hwfy4OBjsxCk4r06OOryZS+XaurGDrPwSLe0Mt75fNAu2Ov243X/eXPB2CiU
	9unRWwqCTFChxpN8k9oWkiwPJbDgEgxBJb5ENeSJF100jkdvnkRrOHM8HZ9ysFQY7tovcGqbu2w
	UZlFf4BCYJq+9sPn8pHPhFplqO1+QDar/JNH6eLqyIdxp
X-Google-Smtp-Source: AGHT+IE2B/J5wRLXOu5lnuN+Axv8riYyigPru1eeeYCbQIMixSd8q/6Ui1Mo233PH+t3U62U0f7UQg==
X-Received: by 2002:a05:690c:10c:b0:71f:c7ae:fb73 with SMTP id 00721157ae682-730659befadmr31464037b3.42.1757689810056;
        Fri, 12 Sep 2025 08:10:10 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:09 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 04/16] Documentation: kmemdump: Add section for coreimage ELF
Date: Fri, 12 Sep 2025 18:08:43 +0300
Message-ID: <20250912150855.2901211-5-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_081015_125523_67F81472 
X-CRM114-Status: GOOD (  10.96  )
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

Add section describing the utility of coreimage ELF generation for
kmemdump.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 Documentation/dev-tools/kmemdump.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/dev-tools/kmemdump.rst b/Documentation/dev-tools/kmemdump.rst
index 504321de951a..5616843e0407 100644
--- a/Documentation/dev-tools/kmemdump.rst
+++ b/Documentation/dev-tools/kmemdump.rst
@@ -27,6 +27,14 @@ are limited.
 Although the kernel has multiple debugging mechanisms, kmemdump fits
 a particular model which is not covered by the others.
 
+kmemdump can also prepare specific regions of the kernel that can be
+put together to form a minimal core image file. To achieve this, the first
+region is an ELF header with program headers for each region, and another
+region contains specific ELF NOTE section with vmcoreinfo.
+There are also multiple regions registered with basic kernel information
+that will allow debugging tools like 'crash' to load the image.
+To enable this feature, use CONFIG_KMEMDUMP_COREIMAGE.
+
 kmemdump Internals
 ==================
 
-- 
2.43.0


