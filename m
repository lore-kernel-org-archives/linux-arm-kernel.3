Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797B0CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 22:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuF/Oflk0EGtFwSUt1lIc+g91x71wm++DJyeLPvXXB0=; b=3o5pASPEL4DdSTuPDySJtZpYqJ
	LvwJqfBggxneUk8oHWw1UEEazZmETbrgk6r+41axxqwbAdp9B1byHrKsjfjlPqGNLgNbivew+bejq
	0yUxC5QoiMKOER4CIg9Zy+i3gnoJaeSS56Y9DrnslD+054QIGMLFaGtjedq363WOffjFMmuUkyGOQ
	kF8hyVc9nILc1eK06mx+D1zR76dCbL3B8IC9bdck8ejEAwDh06YXsjNTOZfxvyiKdgyGGcBmrlhIt
	L58JrPyyb+yO6+BbvITEbXapOQucFpW/UQdSU7nRUUHLrL8rlzettsIdyuL3RvHv7E6deHlyd+Ja8
	Wx6phB7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorez-0000000F8Bk-38ec;
	Wed, 20 Aug 2025 22:52:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonZ0-0000000EgSb-22jg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 18:29:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D452B468B0;
	Wed, 20 Aug 2025 18:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B4AC113CF;
	Wed, 20 Aug 2025 18:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755714573;
	bh=OMuQjCF+LEZgzxsBMcsJNa9yV1ZyVyIxF/02RSfwA9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OhBmXqQL69XWfsGVFWp2pL/cMtfurNw6+7j363cugbyi8aJf+ZqZm+iHOy1eKLZn2
	 8QRQu7MxHqvJDgmu7QoxZ0WsPicOVAch51AjpUW/ZecIYUfeS+LcciVcglsrT04m64
	 gClvL9u+u1cr/1wtBQboezre3jeoVqzMJPrOz9d/9ZRQgbdUo63s+4YiawIzgaMME4
	 0zUEV1WfvWVYeQuXuvbNLTRBc53PxTE93gL8QTYDV46U14N2JeCnGA+9LMqRTx9u9L
	 bDmMU8EqTuZ19PGO4lMvPCTgi/O4H3rymQppPdZfvW/BatIyg14RonP8G7NJf6QCT4
	 ls007xoMEHJOw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 20 Aug 2025 19:29:04 +0100
Subject: [PATCH 2/5] kselftest/arm64: Check that unsupported regsets fail
 in sve-ptrace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-arm64-sme-ptrace-sme-only-v1-2-f7c22b2871f8@kernel.org>
References: <20250820-arm64-sme-ptrace-sme-only-v1-0-f7c22b2871f8@kernel.org>
In-Reply-To: <20250820-arm64-sme-ptrace-sme-only-v1-0-f7c22b2871f8@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Oleg Nesterov <oleg@redhat.com>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 David Spickett <david.spickett@arm.com>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Luis Machado <luis.machado.foss@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=2392; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OMuQjCF+LEZgzxsBMcsJNa9yV1ZyVyIxF/02RSfwA9w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBophQBEDrSy5gbCqYmjEOVsYPzA4r4WdGUBR02Q
 RVoZ08qRU+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKYUAQAKCRAk1otyXVSH
 0LFHB/oC7r5NmS8rvezdaqGX2+jaZs1ybK8ILWXxbmD+IDd6cmq1X8uUwnciGXVu22tSN9cG/Wq
 3KWsSiqlDjt1kXrsRDAzETo67WqYE7X7J0+Dk+trnLio0RCAhEaKImXWuOJ4x8aZLHSer9ighDu
 ehY4ZcFL1aRkV/BGAgDvHGxf4HBSJp4jzcyGx4PH1Z4ImeCyNvTgAVSr8ou9CbuRzLvWj8os9B6
 iQrDaF3OxR+AaeZ4MbstnNh0o8ZMCODMfiek2GRRBhgYfNyP/TmPzOdygh1JvY976Bp2sM74AT0
 9onIDfm5+mSUwp7qBm7f4QbxWhEtVqO8dtOseV4qykTrTeua
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_112934_570217_0CB5D5C2 
X-CRM114-Status: GOOD (  13.80  )
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

Add a test which verifies that NT_ARM_SVE and NT_ARM_SSVE reads and writes
are rejected as expected when the relevant architecture feature is not
supported.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-ptrace.c | 46 +++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/tools/testing/selftests/arm64/fp/sve-ptrace.c b/tools/testing/selftests/arm64/fp/sve-ptrace.c
index a9b2377c46b8..5f39ca0b4194 100644
--- a/tools/testing/selftests/arm64/fp/sve-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/sve-ptrace.c
@@ -158,6 +158,38 @@ static int set_sve(pid_t pid, const struct vec_type *type,
 	return ptrace(PTRACE_SETREGSET, pid, type->regset, &iov);
 }
 
+/* A read operation fails */
+static void read_fails(pid_t child, const struct vec_type *type)
+{
+	struct user_sve_header *new_sve = NULL;
+	size_t new_sve_size = 0;
+	void *ret;
+
+	ret = get_sve(child, type, (void **)&new_sve, &new_sve_size);
+
+	ksft_test_result(ret == NULL, "%s unsupported read fails\n",
+			 type->name);
+
+	free(new_sve);
+}
+
+/* A write operation fails */
+static void write_fails(pid_t child, const struct vec_type *type)
+{
+	struct user_sve_header sve;
+	int ret;
+
+	/* Just the header, no data */
+	memset(&sve, 0, sizeof(sve));
+	sve.size = sizeof(sve);
+	sve.flags = SVE_PT_REGS_SVE;
+	sve.vl = SVE_VL_MIN;
+	ret = set_sve(child, type, &sve);
+
+	ksft_test_result(ret != 0, "%s unsupported write fails\n",
+			 type->name);
+}
+
 /* Validate setting and getting the inherit flag */
 static void ptrace_set_get_inherit(pid_t child, const struct vec_type *type)
 {
@@ -702,6 +734,20 @@ static int do_parent(pid_t child)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(vec_types); i++) {
+		/*
+		 * If the vector type isn't supported reads and writes
+		 * should fail.
+		 */
+		if (!(getauxval(vec_types[i].hwcap_type) & vec_types[i].hwcap)) {
+			read_fails(child, &vec_types[i]);
+			write_fails(child, &vec_types[i]);
+		} else {
+			ksft_test_result_skip("%s unsupported read fails\n",
+					      vec_types[i].name);
+			ksft_test_result_skip("%s unsupported write fails\n",
+					      vec_types[i].name);
+		}
+
 		/* FPSIMD via SVE regset */
 		if (getauxval(vec_types[i].hwcap_type) & vec_types[i].hwcap) {
 			ptrace_sve_fpsimd(child, &vec_types[i]);

-- 
2.39.5


