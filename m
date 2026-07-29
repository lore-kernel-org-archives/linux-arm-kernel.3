Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755F0C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 00:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4Gw4ioSscdZva3p6jvwUu/0HqrTnRkxRU/WO0C15fA=; b=w7wNDIjYle5E0fm9o0XT9Mw6zJ
	Z2qf+mEzeBYv/9F0FuGJPskMJfG+mBWFC3RblUMi7L90AI1NH3ydlVrU0W1ESyYnlOrEuiPZ2NYwO
	/a+7NJM40BsVyoXStUfPvJhBjnTkcrUDi50YEzdv04SA6cW4AcU8NUCfhSD1ihEp+b2JmehnsQqU9
	r67+5gQtUivCvKRjldU9slQn15KuDXdwPQpi45chtAXteVnVU5yDl5ziM+YG6wpZXzmsOx+iqrd0u
	+b7lZiyGqc788Kv8VSykdMbqctWK+z2dkwG4Ap875/ySfDxNrr6RtlLwHmzfQVkeiPp5f7bxX464t
	ij67kXQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosOT-00000006Xjn-1taT;
	Wed, 29 Jul 2026 00:43:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosON-00000006XiT-0KsA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 00:43:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso3051425e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 17:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785285805; x=1785890605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r4Gw4ioSscdZva3p6jvwUu/0HqrTnRkxRU/WO0C15fA=;
        b=T846IJ+k2EwegQMWpWbw/p5P2QE2cMELU0VRj2ELPNAFli5ouIPe2erVhtr0VzeO6z
         yb+OYiP19cXSS7m+sL/X9ep29bf2WTADNg7CsnwdT0Evtup32ae5CTrJ1uOYhoIBjrIy
         QWs//luhNtTo/s0iljfqrnP5gE7hE29NXM/u5+T8Yc8z2JnqMjRegjJY1ErQLzn57HaJ
         1xnj/KXx90Rs88kaJgr3M+0aEe0kWIcL9hZF+Bff2ypINXZA+ACCoTyb4t9HOOOfLreB
         JMnGCwdmS9I4JVbrCv5dehNJFp//V+XiYUBRXW5KUUXs1ZDxUc/Uht0SulPs2llShz/i
         6bng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785285805; x=1785890605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r4Gw4ioSscdZva3p6jvwUu/0HqrTnRkxRU/WO0C15fA=;
        b=MzSJkyMAXmy/XA3dfnouzflFIYfUsxV1iE8ZOGo+LfhBOVsByKuE0Pr7xDIStV+AaS
         ihAnqRSqqrenBIFvSfRUhO1RW5OmzEs1y4B6PUsItNSS1nBe+xjt2S4qM0PRsnCfdQTu
         hQ6t343TpgKLNS50XMBVahWGIZC5uwDojuokwk849nrNtxD3D1RvhXbU4MLgczHHgPga
         cUhkEegfJwGZv2zKTNWyKkyMIPYUz5yauTgrWv9jz0bt7aot+j9bQ8qTCA0ApbtdO/tl
         8ZFe1X0OBRlSZeckNdI9SPozu7xFDDxmBLvRvxXt3fnACKS1K4HDtspKtv7eZMZhJarD
         +frg==
X-Forwarded-Encrypted: i=1; AHgh+RqdUJO+hog50BL4OWPvEDmN5Xeidw4kl2PSRvFiMpUWDsiq3wPYB4tPedA7kN3gS/ShOGfiIBpjUQSF6Y21yruT@lists.infradead.org
X-Gm-Message-State: AOJu0YxHIobaAWDehWC/EPF7RrbuuLDLs4jveOKm64sXz99CMLbAp5I/
	2ziDeAKzcZRVxqkBatRzGMkdRVJaCvsbTWkbC9TeowIlA5aG85zgK9XK
X-Gm-Gg: AR+sD10mGkDdZANEeorp6togEaXqOL1yJpsTO30mryTvZ+FtZAoidvKQQHpAumXbE16
	7jFgLofOPMVVewdnitg86WAXVUHx21HMeaHwMLvGE+6umGzq6X8c9Xp7/ESjkTT8AFapuiOlzCl
	Lp7p0PTEUpoX7QqLIxUGquY/GEy4yICrFe6LnqGzkvFLS3TX9GBMgh/S8iK1fKb333fNMAr1ian
	E9pP5LJHLI1NPot4xDfA9NYK3uF8gWkuYm4xS/TtsRBBnlRDGEPqKN2E5TbS/qn6fVvu8gqwE5c
	pvI+wJv8KctUpjMqV6jhKDhxNDmBdA1v4zWo4TtXAPjsbxjG+ZSrhXlWD9bzJYJ9XZErrbbdrpd
	lgsF0uZsbkfyWpNjrohfzVi5Upw8dVentFtwU0ngraLiP0aHVt4V18cByu7HqulutHz+DZHaUzt
	a5HJOuVwPYFyxdZXC5nC0QcAT+BuOo741bV7VOIw4nSNJ51+850Undrr5fsk/9GbKuqWXYkfwkt
	MZ+3K1yla4QjAp+HFyN8LgooUS1pI8Oxp0OM3Kej+Mgwtdhb5QhyEXC+TpZdkJWZ5WCpkLG1L+9
	ZL1sAIqR6ISy9PfwJfZRRWWxMneEdOtmjeOvZCeyFbL2exPEsMsIKADIW2fe/wpT4yuAlopx40r
	c2gMhyE+qBjbSjKujpQ==
X-Received: by 2002:a05:600c:3b0c:b0:495:4d2d:82f2 with SMTP id 5b1f17b1804b1-496c659dd2bmr53499995e9.26.1785285805037;
        Tue, 28 Jul 2026 17:43:25 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-b323-2b01-0d98-9fe8-a4cd-78ab.310.pool.telefonica.de. [2a02:3100:b323:2b01:d98:9fe8:a4cd:78ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm2827343f8f.6.2026.07.28.17.43.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Jul 2026 17:43:24 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 2/2] kselftest/arm64: fp-ptrace: Fix checks for inactive SVE and SSVE regsets
Date: Wed, 29 Jul 2026 02:42:55 +0200
Message-Id: <20260729004255.15630-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260729004255.15630-1-kmehltretter@gmail.com>
References: <20260729004255.15630-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_174327_171276_5CFA125C 
X-CRM114-Status: GOOD (  20.06  )
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

The checks on the header size reported for the inactive regset of the
NT_ARM_SVE/NT_ARM_SSVE pair compare it against sizeof(sve), but sve is
a struct user_sve_header *, so this is 8 rather than the intended 16.
The kernel carried the identical typo when filling in the header, so
kernel and test agreed on the wrong value and the test passed.

Compare against sizeof(*sve), stop after the header checks for an
inactive regset since it has no payload to compare, and prefill the
buffer with a sentinel to verify that reading an inactive regset
leaves everything after the header untouched. This also covers the
getter's return value, which determines how many bytes ptrace copies
back to userspace.

Fixes: 864f3ddcd715 ("kselftest/arm64: fp-ptrace: Adjust to new inactive mode behaviour")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
With the size comparison fixed, fp-ptrace fails against kernels that
do not have the preceding regset fix.

 tools/testing/selftests/arm64/fp/fp-ptrace.c | 47 +++++++++++++++++---
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-ptrace.c b/tools/testing/selftests/arm64/fp/fp-ptrace.c
index 22c584b78be5..b435837c8c0e 100644
--- a/tools/testing/selftests/arm64/fp/fp-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/fp-ptrace.c
@@ -65,6 +65,9 @@
 /* VL 128..2048 in powers of 2 */
 #define MAX_NUM_VLS 5
 
+/* Sentinel for detecting buffer bytes the kernel did not write */
+#define REGSET_SENTINEL 0xa5
+
 /*
  * FPMR bits we can set without doing feature checks to see if values
  * are valid.
@@ -181,6 +184,20 @@ static bool compare_buffer(const char *name, void *out,
 	return false;
 }
 
+static bool buffer_is_filled(const void *buffer, size_t size,
+			     unsigned char value)
+{
+	const unsigned char *bytes = buffer;
+	size_t i;
+
+	for (i = 0; i < size; i++) {
+		if (bytes[i] != value)
+			return false;
+	}
+
+	return true;
+}
+
 struct test_config {
 	int sve_vl_in;
 	int sve_vl_expected;
@@ -401,6 +418,7 @@ static bool check_ptrace_values_sve(pid_t child, struct test_config *config)
 	struct user_sve_header *sve;
 	struct user_fpsimd_state *fpsimd;
 	struct iovec iov;
+	size_t buf_size;
 	int ret, vq;
 	bool pass = true;
 
@@ -409,14 +427,16 @@ static bool check_ptrace_values_sve(pid_t child, struct test_config *config)
 
 	vq = __sve_vq_from_vl(config->sve_vl_in);
 
-	iov.iov_len = SVE_PT_SVE_OFFSET + SVE_PT_SVE_SIZE(vq, SVE_PT_REGS_SVE);
-	iov.iov_base = malloc(iov.iov_len);
+	buf_size = SVE_PT_SVE_OFFSET + SVE_PT_SVE_SIZE(vq, SVE_PT_REGS_SVE);
+	iov.iov_len = buf_size;
+	iov.iov_base = malloc(buf_size);
 	if (!iov.iov_base) {
 		ksft_print_msg("OOM allocating %lu byte SVE buffer\n",
 			       iov.iov_len);
 		return false;
 	}
 
+	memset(iov.iov_base, REGSET_SENTINEL, buf_size);
 	ret = ptrace(PTRACE_GETREGSET, child, NT_ARM_SVE, &iov);
 	if (ret != 0) {
 		ksft_print_msg("Failed to read initial SVE: %s (%d)\n",
@@ -440,10 +460,16 @@ static bool check_ptrace_values_sve(pid_t child, struct test_config *config)
 	}
 
 	if (svcr_in & SVCR_SM) {
-		if (sve->size != sizeof(sve)) {
+		if (sve->size != sizeof(*sve)) {
 			ksft_print_msg("NT_ARM_SVE reports data with PSTATE.SM\n");
 			pass = false;
 		}
+		if (!buffer_is_filled(iov.iov_base + sizeof(*sve),
+				      buf_size - sizeof(*sve), REGSET_SENTINEL)) {
+			ksft_print_msg("NT_ARM_SVE wrote beyond its header with PSTATE.SM\n");
+			pass = false;
+		}
+		goto out;
 	} else {
 		if (sve->size != SVE_PT_SIZE(vq, sve->flags)) {
 			ksft_print_msg("Mismatch in SVE header size: %d != %lu\n",
@@ -485,6 +511,7 @@ static bool check_ptrace_values_ssve(pid_t child, struct test_config *config)
 	struct user_sve_header *sve;
 	struct user_fpsimd_state *fpsimd;
 	struct iovec iov;
+	size_t buf_size;
 	int ret, vq;
 	bool pass = true;
 
@@ -493,14 +520,16 @@ static bool check_ptrace_values_ssve(pid_t child, struct test_config *config)
 
 	vq = __sve_vq_from_vl(config->sme_vl_in);
 
-	iov.iov_len = SVE_PT_SVE_OFFSET + SVE_PT_SVE_SIZE(vq, SVE_PT_REGS_SVE);
-	iov.iov_base = malloc(iov.iov_len);
+	buf_size = SVE_PT_SVE_OFFSET + SVE_PT_SVE_SIZE(vq, SVE_PT_REGS_SVE);
+	iov.iov_len = buf_size;
+	iov.iov_base = malloc(buf_size);
 	if (!iov.iov_base) {
 		ksft_print_msg("OOM allocating %lu byte SSVE buffer\n",
 			       iov.iov_len);
 		return false;
 	}
 
+	memset(iov.iov_base, REGSET_SENTINEL, buf_size);
 	ret = ptrace(PTRACE_GETREGSET, child, NT_ARM_SSVE, &iov);
 	if (ret != 0) {
 		ksft_print_msg("Failed to read initial SSVE: %s (%d)\n",
@@ -523,10 +552,16 @@ static bool check_ptrace_values_ssve(pid_t child, struct test_config *config)
 	}
 
 	if (!(svcr_in & SVCR_SM)) {
-		if (sve->size != sizeof(sve)) {
+		if (sve->size != sizeof(*sve)) {
 			ksft_print_msg("NT_ARM_SSVE reports data without PSTATE.SM\n");
 			pass = false;
 		}
+		if (!buffer_is_filled(iov.iov_base + sizeof(*sve),
+				      buf_size - sizeof(*sve), REGSET_SENTINEL)) {
+			ksft_print_msg("NT_ARM_SSVE wrote beyond its header without PSTATE.SM\n");
+			pass = false;
+		}
+		goto out;
 	} else {
 		if (sve->size != SVE_PT_SIZE(vq, sve->flags)) {
 			ksft_print_msg("Mismatch in SSVE header size: %d != %lu\n",
-- 
2.51.0


