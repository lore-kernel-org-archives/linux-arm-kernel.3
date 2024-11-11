Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D264D3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l479EozP/2hXAjyq80KiYR6AzKDyOfAws4SkWfI45gY=; b=v5DaKDkUYvDRR/QPipalLd44fv
	y0kpcF8M455ToBnKfqEBZ5q6tQQaEYPyPtxQc+rvjylBz6DxLhalT1zg/ty3hoBxMYC+ldAQZY0FM
	dr8pBivoYsZaRuy4ghi2K7mfRmPBfRKk4/PSGBrYPAYgj3v142ZwEi+LEgmVvcPgRuxyBu0E8F+gA
	rdVDgBxR62VyTM8HLUJ4am01qN52ioLPm3rKwFYcr3uAmuB2jFW985S99oe+q/TWGuGFENQKT25Dz
	DYtWi0ptTb6LTGFSs8Z7UTk2+SWoxu6SEYE75cLZzSsBqjCY/fqNUgaaOumDU3vIhCeAE78dTSW5j
	5+ubSkvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXD5-00000000ZCp-0rME;
	Mon, 11 Nov 2024 16:24:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAX8D-00000000YbZ-3N2s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 16:19:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AAD66A41799;
	Mon, 11 Nov 2024 16:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388D7C4CED5;
	Mon, 11 Nov 2024 16:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731341952;
	bh=g4YRupDmS6rsFE+fXj4fCiJaZnhgWz5kCy7tqLUbGPc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m+BwE4NnKbLT5R3oGmmZtiRrc+XhPt8Nmq3mDWP7k7VgCQRhSg5Ufoj/wAKAjHhPd
	 vPhpkrU3GdEQJkRY7vwaKXuz5jO+OBD7ClUtV90r37ccrrB5itCWDLynhxDp0GeNI6
	 yFktqayQrOsOKjJbd9/M0t/u6IEwRtrgCwg71pE/Xtopf6mK0dlvrZUH2VudV5qUFk
	 /TQFR+WXSL0r8f9IN2yPgHZAPNocGahZ0KGufVvj9fcFuejnOJA96IvyqIcebYVAHA
	 Cl3ubG/YEWueRf1YOj97/Z5IJc8nKmfq/wjGrl6M4o8Pi6ffIpNDQB0P7lwe/1c+7U
	 xbtyRPoK8SYwQ==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 11 Nov 2024 16:18:55 +0000
Subject: [PATCH 1/2] kselftest/arm64: Don't leak pipe fds in
 pac.exec_sign_all()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-arm64-pac-test-collisions-v1-1-171875f37e44@kernel.org>
References: <20241111-arm64-pac-test-collisions-v1-0-171875f37e44@kernel.org>
In-Reply-To: <20241111-arm64-pac-test-collisions-v1-0-171875f37e44@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=923; i=broonie@kernel.org;
 h=from:subject:message-id; bh=g4YRupDmS6rsFE+fXj4fCiJaZnhgWz5kCy7tqLUbGPc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnMi57hYbOZoCypxxS5DdntS9d1pQSZA5sNIhza
 3ZAtKIvlWGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZzIuewAKCRAk1otyXVSH
 0Ct6B/9GaplZ+Wh3jbdMs+/axyR5eFAUQoGrgCp4yDH16vLv6X6MxioUbodUygXW9QAlaFfCISv
 uTKM2qH7KJvur5hsY4sGV1cmmZWNAB8jhWNVpzZ2nbjIiidg6GXYPm09Ck9KAO8mkFDSuc+eDfH
 p4Nynex1KCFehgEI/AYG6y0Nc6XNx83LpPqiTxHEeEe1nxS1OCdRtAzVUP2/BmFMBUxdS8RnBrx
 rDC+bMGrY5NrBKOfm+dbPSnnORUcDNrBHGVxYOgudxew/CKp16yVECIo1+HX7S0gskv96hAc7qH
 AI8O3nEP2dnlcKzTZeBTx80K4LNKdRDIH1QXvhqAsg3DG8p4
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_081913_949272_1A3C6B5E 
X-CRM114-Status: UNSURE (   9.68  )
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

The PAC exec_sign_all() test spawns some child processes, creating pipes
to be stdin and stdout for the child. It cleans up most of the file
descriptors that are created as part of this but neglects to clean up the
parent end of the child stdin and stdout. Add the missing close() calls.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/pauth/pac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/arm64/pauth/pac.c b/tools/testing/selftests/arm64/pauth/pac.c
index b743daa772f55f570a3c0a912ac0c2c403c4256a..5a07b3958fbf292b09c9d6b11b8f9db2880beeed 100644
--- a/tools/testing/selftests/arm64/pauth/pac.c
+++ b/tools/testing/selftests/arm64/pauth/pac.c
@@ -182,6 +182,9 @@ int exec_sign_all(struct signatures *signed_vals, size_t val)
 		return -1;
 	}
 
+	close(new_stdin[1]);
+	close(new_stdout[0]);
+
 	return 0;
 }
 

-- 
2.39.5


