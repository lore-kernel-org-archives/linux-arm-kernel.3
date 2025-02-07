Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D78BC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 11:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RsRq64kyAjVQMzOmw5odn/YZS4WeBKPCs8/U4hV6uus=; b=PFHjCqAB9SoVZ8oYIM7K++vZAg
	WiUeV7qUBfdS11pXptcel7RTcCvKsixuD8DW60hE+PPyOQ4CYmiA3E2YryK9NSw5sYhexLpV4cuRr
	y0zwoHEYD05QahMH3hVeh71hMiHIdyTEfwwVJvBCH/dgRPw5blH3sY9uhiDl1CmFXb7YKwCEOKu6L
	D752hAVChWiQNlCu7ahx3AbWdO46OY8cxB3lGiHFue7hmMY9YkCylF4RRCVK2bxMZUsAetH5XuAWR
	0OSOMQy1GUnKZZrfINE9Bx2tTEI9yfN6tkFSiiVYpUsSHXOHJTvpB2/tJg4+ZYcww84Idvrv+K0ee
	W4kdf6KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgMEs-00000009JKr-29Kz;
	Fri, 07 Feb 2025 11:09:38 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgMDU-00000009J3A-46mL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 11:08:14 +0000
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab2b29dfc65so315674766b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 03:08:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738926491; x=1739531291;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsRq64kyAjVQMzOmw5odn/YZS4WeBKPCs8/U4hV6uus=;
        b=ngcUIbwqbzS/7ySRetQpShe8Bw4v5lUbmbEcRckhIDujBisoDrdQKLGmJVVQkbl/uX
         IF6R83d06DQE+B7NR6CMuAkXxAlZP2ByN/HCJTJ4o8Fe5gmK+DhxWpeDguSEt2SoZLOi
         axqV0lZRKh+b/qU20GYJkz1Hqc7AHmBCi7Jiz/i+uJK95wGtMh1H4XJfu8GepTA51R90
         K35SnGER6M0DYdGZ/fU6Dh5CFt3NCypbrwTLP6aywa3IHzD0Qyi4N4rwmv8/FHQOCDgN
         ePmrW/1Gf/zsF2kjf+S/hXwPlucVFbxVpvC/a/trzMSm0ry42JXoFL2hD16ve2N5MQ08
         mKKQ==
X-Gm-Message-State: AOJu0YzGsAxSoLITaPgLkmvx+SDDRtZzZNtMiZrXw7t8KjK+7gVHvVl6
	cbUZBpHZqbf3zYb98+VKz0DLIo8hFZMexJ89wCC+m+SFpk7Ky1lQmKIMWg==
X-Gm-Gg: ASbGnctF5vCqpyORobgPmlhYlyiD1aNIVyaluL2TONczW37Ud4yeu9LCvTkiO5bHoat
	4b6Spd5VOr6BfUYoU9WjlAVDmJSgjgE+VP7io0gpQO5wP4e2/b2zv3N5mSR4bxYg6/1JFRxJYpk
	xRPehqW2Yza/UC35ExG3zp9PFx5n4KKW+yftJBGdy6slyUkUroNBTe2KCGom8VuSyfNpdUihZ3H
	qJZ5wFtRs9jV0HBkFq8XmgsrDiRdAN8I3OUab7ws8HDAethwOnWc2M3Roxf2T3AtLmtJCPAB4Pw
	EQfJ2LM=
X-Google-Smtp-Source: AGHT+IHcITL5To976uUv3g6/PFxfYoR5rQZeHW9vC+BYgEFLYDJUHScldAXv4hpMHHGpz7GOQsUrGQ==
X-Received: by 2002:a17:907:d08d:b0:ab7:992:7f42 with SMTP id a640c23a62f3a-ab789ba47famr300315966b.34.1738926490752;
        Fri, 07 Feb 2025 03:08:10 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:71::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab79298641asm24762766b.90.2025.02.07.03.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 03:08:10 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Fri, 07 Feb 2025 03:06:42 -0800
Subject: [PATCH] kselftest/arm64: Fix uninitialized variable warning in
 FPMR test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250207-arm_fix_selftest-v1-1-0d6eeb04299e@debian.org>
X-B4-Tracking: v=1; b=H4sIAELppWcC/x3MUQqDMBAFwKss79tAjNjSXKUUifrSLlRbsiKCe
 HfBOcDsMBalIcqOwlVNfzOi1JVg+KT5TacjoiD40Prg7y6Vqcu6dcZvXmiLI8Nj7IemSf6GSvA
 vzLpd5fN1HCfBGjmnYgAAAA==
X-Change-ID: 20250207-arm_fix_selftest-ee29dbc33a06
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, broonie@kernel.org, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680; i=leitao@debian.org;
 h=from:subject:message-id; bh=FXr2YRk6o0W+K1SCzkVuQ0zPA5u33Pz/k+U6e+ZtLAw=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBnpemZuPdqekyA08fFjtglkBR14jqQw3Uj6Uk0V
 EAK6v/62DqJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCZ6XpmQAKCRA1o5Of/Hh3
 bX/WD/4rUdj3lsA1jPbgX6PH+CiNh71KZM+IKE24sNk32JMUs0ekeLZIqNltEL+R9Vt33IPTvjs
 5EWNTIH0TnOI3gDcfbUYRqdBgGivRJ6sYdUYDHMqUhR5/7V+Q4/9uKwsludJfdhkIKvA/CpmGzV
 L+9NUd8J6KOQ2nlgOYGxCKSJrkvdB6CnnA5sHNCzv103BMpU8E+OlKCIWsZANEo9gEOr/0BhHTg
 WoZ79a7/0lFzdMWTrSiTlbboRvuuedd0tQdRqUGkIXtexuz8pQ0KK6ePj9BhZqOYnDkVsDbMppC
 dYcC62SFQRmj++AsQ1KUSJFQAjzBP5Y/GgG1PX+0iFFp792oiAeMxloI03+V/2VdY9iyHA3WmIj
 I8qUVxtvyZR5Wdc4V1VBPHwtJpcGwh6aJIOg9azqse2usQP1At+Wb+LuQCO8GOy6QtOVb6RX9Rw
 pLIio064AMoa4Fe8J4IEbNtqv+gqPIKfBLI7vQ7tEf0kNw5RQm6P32Z6q1ipgOfsfuHO41srbTQ
 ZlYpIogzy7ClYAN4ka6zqpqX35RyKi4FI76SZ56LXT386ReWB/l/O/zKb+JrjdeZ/+AJ0JRScDx
 VZAWI+tTR5dqYaDwPOUbSoHfZY8oHnrxXayVAc9IWftE3fhOjWQEp8HAo29XsN4dThRBfPniJR6
 zLrtjTZlKFbZN7g==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_030813_014889_DE4C2D61 
X-CRM114-Status: GOOD (  11.83  )
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

Fix compiler warning about potentially uninitialized orig_fpmr variable:

	testcases/fpmr_siginfo.c: In function ‘fpmr_present’:
	testcases/fpmr_siginfo.c:68:25: warning: ‘orig_fpmr’ may be used uninitialized in this function [-Wmaybe-uninitialized]
	                         fprintf(stderr, "FPMR in frame is %llx, was %llx\n",
	                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	                                 fpmr_ctx->fpmr, orig_fpmr);
	                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~

Initialize orig_fpmr to 0 to resolve the warning.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 tools/testing/selftests/arm64/signal/testcases/fpmr_siginfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/signal/testcases/fpmr_siginfo.c b/tools/testing/selftests/arm64/signal/testcases/fpmr_siginfo.c
index e9d24685e74194fc4ed1aebdcfd4c6edd3488e1b..26818860b223d367955d96e12d423fadc304700b 100644
--- a/tools/testing/selftests/arm64/signal/testcases/fpmr_siginfo.c
+++ b/tools/testing/selftests/arm64/signal/testcases/fpmr_siginfo.c
@@ -40,10 +40,10 @@ int fpmr_present(struct tdescr *td, siginfo_t *si, ucontext_t *uc)
 {
 	struct _aarch64_ctx *head = GET_BUF_RESV_HEAD(context);
 	struct fpmr_context *fpmr_ctx;
+	__u64 orig_fpmr = 0;
 	size_t offset;
 	bool in_sigframe;
 	bool have_fpmr;
-	__u64 orig_fpmr;
 
 	have_fpmr = getauxval(AT_HWCAP2) & HWCAP2_FPMR;
 	if (have_fpmr)

---
base-commit: 0d5248724ed8bc68c867c4c65dda625277f68fbc
change-id: 20250207-arm_fix_selftest-ee29dbc33a06

Best regards,
-- 
Breno Leitao <leitao@debian.org>


