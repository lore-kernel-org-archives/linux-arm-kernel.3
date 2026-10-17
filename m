Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F6FCCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 18:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMiB8dh6dsfFg4997+NtGDJuD1DGrADZtiME1dFQP+c=; b=D1mQVQt2CZWUC+w+cgiZIw+t7F
	gOaQheQdCGL1zJFiII4dUr4WSTv5SuWU0297pJwypFQWAUGhWogfJsuaoIljjUqxvNdFTfGq47Gii
	ilIdMzA7lU8lX80MAatGE82oEAXO/NQ8Yzm6manR68mK7sqSJyaopg5FZYI2XLu1ahqvZEVY0J2nr
	2mNE1+E9BE80n+5qoLZ9SBhewfPPfltmOv+UAkWYXPa4HP5dw8y11eQGJ0KWxcvz4R7S28ajBdB7o
	IWPFNleKYyN8GFFQLdcYb+GwEV/alxj2TfOsUDxcIOAmTsu56f9NG7ImyIokZMms1YYm+/L1tgPzu
	QZVJU+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI96P-000000054DE-3o94;
	Sat, 17 Oct 2026 18:25:53 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI96N-000000054CV-02Ta
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 18:25:52 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8a05b210703so104392b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 11:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792261550; x=1792866350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMiB8dh6dsfFg4997+NtGDJuD1DGrADZtiME1dFQP+c=;
        b=kvJtuwLMaaP628w12SpPTQIfBEqnU4eZ7PWWb0qr1I09I1rljXIvXqne4ga/pJbw+9
         WqHsXXnqD1oXihBZVjZDcBHNsmakt4pTd0XU6RellvVFouUh4kPbn0OwYnQ1m1ZoTFA8
         vWju6LUVbPTw97g1vpBLN+m/lBRXxS1efXvYNSQ4fu/NjAmGL/Gwi5pX7FkHvR+tu2kU
         1abTbaGOVJXaPXG8Z8Re+lRLKihEn1ZubPYP5AYgrS3XuI/HfzBOtZUCuAkV2f4E/Ty7
         /3L1hD9RmNoeH5EJjGVJuRlJqGC1n2ioumNg18fvWW9b6ev74ttusg1/u1F5RzPYc92v
         /yBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792261550; x=1792866350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tMiB8dh6dsfFg4997+NtGDJuD1DGrADZtiME1dFQP+c=;
        b=rXR1vki4oEv9i+/REj8JdJ2sDf2fdnuOU39tPSmEr/wUJsdvJO+IdZamUZIGEu90E8
         BLoOANd9L9OfkmN0+kUlDWldjPdLh6aTEhfEqilLPcICxeFL/mqMPE8ChyW6LeZHr2Mp
         NJnne9ploVZGzcU5WTMjk7EmAeIzL1LPedCSaHEec91Le8o6xP/ER+BumcORFElR2Esa
         1CfH12wEsiDB0Ujj/50g/RK2WAKyQwfW9RXjCU7Da7MWBVOz/ImHdR+Y0qltNDyBHo4X
         jLEkCEyuIcpkx2fwCvVZ2UHRLrav7jAyDQV9NmmZR//Q3oL4tkB59ZWWECILqcvRIDNa
         E7IQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFpDDit64Woy/rXh7sJfr0bAgzAkyp0LM/vjO+piTAP+83nbjpI1caFLnVMkRwQQVt0ZQ3NeAwHAsU2KuRttci@lists.infradead.org
X-Gm-Message-State: AFq9FYIeEzL9/nmPMns94vkJiVJt73yzbropHjVEtCioP9U4UqLPAurk
	R+8RF2NJJcbv/BWCAFwSH2wnyIY4D1oNqd44uaaszY2ipiUvsF/Tt4puz0uAliJO
X-Gm-Gg: AYBFou1lY/suqQ0rISI9uY9RAPowEf7GrNdxVamTGfkDDlmkFrlOqG9n+DE7fwE5ZdN
	hoxnNFHlRK3qaOFuEDo7MJRbgri5Cl71VCVJRLghEWqmpwuHyDSFbdOUeXdf5izFnuD3JO2Rnyw
	rk1mgHUmIQly5h6R0dsXfxhPgXy2tm2cLj4zr2efVm1+6+shcBg38Bn9X1rUTc1QELDAsTeV0fh
	nhr914i0GXnB2MKesT5YKZuVYjrZ6A3IL6HXeLNg5rXH8od6s3+sHD4mWO9/Bi9v3x5HSsquUaF
	6osd4JY/okCxwxIGyMHDUMwDjBfXAl6eePfvvjlVJ8Ivp2voRH7iWtvUuU1WxPmOAuETUhv93aw
	gCt+tKgOCOQ3DI76kGUUmggFFTuR6ik7DAYLgEe0ITTjx8HaQcP+R+CBkLIHaRWqxJDNUqJptaU
	X2enfHdaViHeegMouQgIly6Ff/+eCVIsi7HhfJPyT+1wDhfdKBWjXW8qECgQWzfFqXqrU75ZryY
	iP140lMKcc++t5LlCfnAs8wOCku2SLhAHaFzZC/n3kLVuwnspUw271Q5ECEUBhMgQdiSMFHTj55
	9Q==
X-Received: by 2002:a17:90b:4c8e:b0:3ac:9a03:20bb with SMTP id 98e67ed59e1d1-3aceefbec6emr3109229a91.18.1792261550287;
        Sat, 17 Oct 2026 11:25:50 -0700 (PDT)
Received: from localhost.localdomain ([2001:56a:78dc:9300:8846:761:63e4:6d67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ecd32sm9241586a91.3.2026.10.17.11.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:25:50 -0700 (PDT)
From: Abdalla Eldoumani <aamsdoumani@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
Subject: [PATCH 2/2] kselftest/arm64: Check that PR_SVE_VL_INHERIT survives a second exec
Date: Sat, 17 Oct 2026 12:24:54 -0600
Message-ID: <20261017182455.1884-3-aamsdoumani@gmail.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20261017182455.1884-1-aamsdoumani@gmail.com>
References: <20261017182455.1884-1-aamsdoumani@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_112551_060533_BC3213FF 
X-CRM114-Status: GOOD (  20.71  )
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

From: Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>

The prctl_set_for_child test sets a vector length with
PR_SVE_VL_INHERIT and checks that a forked and exec()ed child sees it.
That only covers the first exec(). The kernel keeps the inherit flag
and the on-exec VL across exec() so that later descendants keep the VL
too, and nothing checks that part, which the fp TODO list notes as
testing PR_SVE_VL_INHERIT after a double fork.

Extend the test to also read the VL in a grandchild. The child
re-executes vec-syscfg in a mode that forks and execs the rdvl helper,
so the VL is read after two fork() and exec() generations. Both SVE and
SME are covered since the test runs for each vector type.

With a kernel modified to clear the inherit flag on exec() the existing
check still passes and the new check fails for both vector types, with
the grandchild getting the default VL. Drop the item from the TODO list.

Assisted-by: LLM
Signed-off-by: Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
---
 tools/testing/selftests/arm64/fp/TODO         |  1 -
 tools/testing/selftests/arm64/fp/vec-syscfg.c | 62 ++++++++++++++++++-
 2 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/TODO b/tools/testing/selftests/arm64/fp/TODO
index 44004e5..90ee128 100644
--- a/tools/testing/selftests/arm64/fp/TODO
+++ b/tools/testing/selftests/arm64/fp/TODO
@@ -4,4 +4,3 @@
  - Ensure ptraced processes actually see the register state visible through
    the ptrace interface.
  - Big endian.
-- Test PR_SVE_VL_INHERIT after a double fork.
diff --git a/tools/testing/selftests/arm64/fp/vec-syscfg.c b/tools/testing/selftests/arm64/fp/vec-syscfg.c
index 2c8ccbe..b441dbf 100644
--- a/tools/testing/selftests/arm64/fp/vec-syscfg.c
+++ b/tools/testing/selftests/arm64/fp/vec-syscfg.c
@@ -24,6 +24,8 @@
 
 #define ARCH_MIN_VL SVE_VL_MIN
 
+#define FORK_EXEC_ARG "--fork-exec"
+
 struct vec_data {
 	const char *name;
 	unsigned long hwcap_type;
@@ -85,8 +87,12 @@ static int stdio_read_integer(FILE *f, const char *what, int *val)
 	return 0;
 }
 
-/* Start a new process and return the vector length it sees */
-static int get_child_rdvl(struct vec_data *data)
+/*
+ * Start a new process and return the vector length it sees.  With
+ * grandchild set the child re-executes this program, which forks and
+ * execs once more, so the VL is read two fork()/exec() generations down.
+ */
+static int get_descendant_rdvl(struct vec_data *data, bool grandchild)
 {
 	FILE *out;
 	int pipefd[2];
@@ -123,6 +129,14 @@ static int get_child_rdvl(struct vec_data *data)
 			exit(EXIT_FAILURE);
 		}
 
+		if (grandchild) {
+			execl("/proc/self/exe", "vec-syscfg", FORK_EXEC_ARG,
+			      data->rdvl_binary, NULL);
+			fprintf(stderr, "execl(/proc/self/exe) failed: %d (%s)\n",
+				errno, strerror(errno));
+			exit(EXIT_FAILURE);
+		}
+
 		/* exec() a new binary which puts the VL on stdout */
 		ret = execl(data->rdvl_binary, data->rdvl_binary, NULL);
 		fprintf(stderr, "execl(%s) failed: %d (%s)\n",
@@ -174,6 +188,37 @@ static int get_child_rdvl(struct vec_data *data)
 	return read_vl;
 }
 
+static int get_child_rdvl(struct vec_data *data)
+{
+	return get_descendant_rdvl(data, false);
+}
+
+/* FORK_EXEC_ARG mode: fork, exec path and pass on its exit status */
+static int fork_exec(const char *path)
+{
+	pid_t child;
+	int status;
+
+	child = fork();
+	if (child == -1) {
+		fprintf(stderr, "fork() failed: %d (%s)\n",
+			errno, strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	if (child == 0) {
+		execl(path, path, NULL);
+		fprintf(stderr, "execl(%s) failed: %d (%s)\n",
+			path, errno, strerror(errno));
+		_exit(EXIT_FAILURE);
+	}
+
+	if (waitpid(child, &status, 0) != child || !WIFEXITED(status))
+		return EXIT_FAILURE;
+
+	return WEXITSTATUS(status);
+}
+
 static int file_read_integer(const char *name, int *val)
 {
 	FILE *f;
@@ -498,6 +543,14 @@ static void prctl_set_for_child(struct vec_data *data)
 		return;
 	}
 
+	/* _INHERIT must survive the child's exec(), check a grandchild */
+	child_vl = get_descendant_rdvl(data, true);
+	if (child_vl != data->min_vl) {
+		ksft_test_result_fail("%s set %d _INHERIT but grandchild VL is %d\n",
+				      data->name, data->min_vl, child_vl);
+		return;
+	}
+
 	ksft_test_result_pass("%s vector length was inherited\n", data->name);
 
 	file_write_integer(data->default_vl_file, data->default_vl);
@@ -759,11 +812,14 @@ static const struct {
 	{ "change_sve_with_za", change_sve_with_za },
 };
 
-int main(void)
+int main(int argc, char **argv)
 {
 	bool all_supported = true;
 	int i, j;
 
+	if (argc == 3 && strcmp(argv[1], FORK_EXEC_ARG) == 0)
+		return fork_exec(argv[2]);
+
 	ksft_print_header();
 	ksft_set_plan(ARRAY_SIZE(tests) * ARRAY_SIZE(vec_data) +
 		      ARRAY_SIZE(all_types_tests));
-- 
2.49.0.windows.1


