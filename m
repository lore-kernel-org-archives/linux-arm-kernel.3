Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F61FED2E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/x6CLni2Lznf/8rBHNg/r6T6HvoxT4CEtAmm0nKOZM=; b=DdlK4Si4h9AAt4P+nakZN3tv5m
	qhzzbudiv9UUm1thHj7i5rGm+evBSyMCv+ta9oq5gx4ZgumuqoqoG/Ujf0XLk6gADCJGOWrVZ7J8y
	UGk1xEdWSITWQViCr5Px0VscGb1UZmL1kNFYT3WmtOcgHw3XyKGg/BO4/9L7I2k84W2dvDvxNee6m
	r1yLn304O+FBn0iv1bfNF4lRDKibxBopyayquTTk3kDu1D12HV22UxyiM83wJNmXoGAog4BCFAkL5
	vR6bbv+vcrmlYs4XczE3HdvMg8Ww7cSuhJnoBv1z0BKMXpQkhwlRRsAZvYjwxWommyzyX4DyTVkHM
	T0aGVy/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b0I-0000000DZWv-24sW;
	Thu, 12 Mar 2026 08:02:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b0H-0000000DZVy-2JTA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:02:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E05F360141;
	Thu, 12 Mar 2026 08:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D6D1C2BCAF;
	Thu, 12 Mar 2026 08:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773302564;
	bh=rj2gZrREi98L5OW7DVFeQ4A3D6mJm8/gxjqIgpOv8+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mCCgYEnN4wxBqbiELTtD0Q7L1zRqUtOHaqxSGbRTDlja+it7z4nj/jPPjtfiMM8eR
	 R4DEFYXR/85OcR9uN7U+KqmlyCklYGLl7+CIIhvgKw+DCRZyk0iOSMxS8XtTPm7AiJ
	 XwCe99MN8IJpYfX2fZTrwZCxTx9huehSdWR/+aXUHcp0RyNSuYPhRfj9GU8/BhQCTV
	 ImvN2W2g717TVK8WERXJjklq/kDQImPCeUkjYPD4KnOPtbnRDmE9G+6MWgdLNWOuTT
	 IBzBQhrM/4B8Cea52U+5+vwPGLb4yvF2SEElhw5e5fND6VS5NvvNivulu4XoeFd+IY
	 IMKHWjgQHWuxA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dan Williams <dan.j.williams@intel.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Subject: [RFC PATCH v3 08/10] X.509: Parse Subject Alternative Name in certificates
Date: Thu, 12 Mar 2026 13:31:27 +0530
Message-ID: <20260312080129.3483585-9-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080129.3483585-1-aneesh.kumar@kernel.org>
References: <20260312080129.3483585-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Lukas Wunner <lukas@wunner.de>

The upcoming support for PCI device authentication with CMA-SPDM
(PCIe r6.1 sec 6.31) requires validating the Subject Alternative Name
in X.509 certificates.

Store a pointer to the Subject Alternative Name upon parsing for
consumption by CMA-SPDM.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 9 +++++++++
 include/keys/x509-parser.h                | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 37e4fb9da106..d81b7de4236c 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -596,6 +596,15 @@ int x509_process_extension(void *context, size_t hdrlen,
 		return 0;
 	}
 
+	if (ctx->last_oid == OID_subjectAltName) {
+		if (ctx->cert->raw_san)
+			return -EBADMSG;
+
+		ctx->cert->raw_san = v;
+		ctx->cert->raw_san_size = vlen;
+		return 0;
+	}
+
 	if (ctx->last_oid == OID_keyUsage) {
 		/*
 		 * Get hold of the keyUsage bit string
diff --git a/include/keys/x509-parser.h b/include/keys/x509-parser.h
index 8b68e720693a..4e6a05a8c7a6 100644
--- a/include/keys/x509-parser.h
+++ b/include/keys/x509-parser.h
@@ -38,6 +38,8 @@ struct x509_certificate {
 	unsigned	raw_subject_size;
 	unsigned	raw_skid_size;
 	const void	*raw_skid;		/* Raw subjectKeyId in ASN.1 */
+	const void	*raw_san;		/* Raw subjectAltName in ASN.1 */
+	unsigned	raw_san_size;
 	unsigned	index;
 	bool		seen;			/* Infinite recursion prevention */
 	bool		verified;
-- 
2.43.0


