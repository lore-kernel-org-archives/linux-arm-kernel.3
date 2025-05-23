Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F62FC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7tNtk5Vt2wPmtFRjnMB+GnkzT84V76DwiIr8hkd/yQ=; b=mo37eYG2iWKmTEToWWQR3p1Mp9
	T/GKfdF/0uE1dWc3oIFFncjoo6/skIpN3o1ueltae1PUiFy5Q7bjsbBkra50e7lK8eR+7C5Zmg6sg
	J0TMoGyOmJTUEDYiFOclZg6SLVL3ZXyPkYEHvCEBskau8DwTz3v9IZUkIMdzksiaFHbp6JcfHJCSm
	88X82DU7v06GUPUj73+XMMuhY4ZNGgrcedQ/eai3vLRdDgTm7zKjzU6GChSO8k3V5nwDr5cQHAMeb
	Px9gIIlwbR8HAo/7lGMuLBDch5wlxAk8XnoZ9h2I76y/SYMgnkFXUaUgCfNAu7qgSOCMtrxUhYNry
	NDi9oY4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUZu-00000004Hd5-12nF;
	Fri, 23 May 2025 15:44:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUJg-00000004FVM-3D29
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 15:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7A46A4F897;
	Fri, 23 May 2025 15:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931AEC4CEE9;
	Fri, 23 May 2025 15:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748014091;
	bh=AUZ+fD8AIUEXsr3uY/mmdzQaEKRtme5ZcQYFEQojcC0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BMY4x/M0ATfW9VMXlrWTIcYTFYTqviZvYYBtWGNBPGEb3JshqoszUpxaqfsLeJ4Q8
	 e8EsOkVcpWv5tErDOk5g1NA9Xwge3rCfZRPBazGBkdAZArJp2sN6mU8KsjZwOw/LsL
	 Px9RZvJ2xZhKiG6VSVtsFef28YigCKxDtFRsly0viP/TRfihFdRu1rOIMn+tIfCKUg
	 s94nOX6qsiMicRG/derobY7nT+w+98b9B10ZGQYy6/RBxAjTzRV06dwD7FVyD2Ihb/
	 sqU1jeuXkSqG3RpzN+32RqUlYr1yWuW48K5YBLgnBjSmeBIJkZVcWF1E2ZoSA7kr99
	 20PSiDpK1Ktrw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 23 May 2025 16:27:12 +0100
Subject: [PATCH 1/3] kselftest/arm64: Fix check for setting new VLs in
 sve-ptrace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-kselftest-arm64-ssve-fixups-v1-1-65069a263b21@kernel.org>
References: <20250523-kselftest-arm64-ssve-fixups-v1-0-65069a263b21@kernel.org>
In-Reply-To: <20250523-kselftest-arm64-ssve-fixups-v1-0-65069a263b21@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=988; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AUZ+fD8AIUEXsr3uY/mmdzQaEKRtme5ZcQYFEQojcC0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoMJQEV+AipcEQ1foCd3DCkpsN89qB8XFyKxeR2
 2fY1WEDRKqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaDCUBAAKCRAk1otyXVSH
 0OGxB/4q8kvzRRqJYIiDpNrVMBN8jDz/JrNqCUY0F+/fH0wF42Wnwvolp2MxsItzvqHYUvKNj+s
 DSkBlBIlwAd3RvA1V5MFEB6VzGojvousnHJSa+5VjX04vPC12diP1pjAAt3Vhwp4LNBJuAK1p4E
 6I/XelqEGR1LJHAsVkMiE6IUDNt7NAUxygSUKQ+I4MmSCc0Ua+OD4h0cZJtMLW7BQWakSjolY2y
 9FDBh6dRjj52YMm98XEr7h12Qc5VOgSURUigvmCcUTfkwTQa6qStRTXQBaz54qWfSdB02gxKO16
 4sg0vrD0Mi7NLuVJ96eBDsSlxU2szS5MF90sywnEM7/KsiZL
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_082812_870207_E22863F9 
X-CRM114-Status: GOOD (  11.04  )
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

The check that the new vector length we set was the expected one was typoed
to an assignment statement which for some reason the compilers didn't spot,
most likely due to the macros involved.

Fixes: 0dca276ac4d2 ("selftests: arm64: Add test for the SVE ptrace interface")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-ptrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-ptrace.c b/tools/testing/selftests/arm64/fp/sve-ptrace.c
index 577b6e05e860..c499d5789dd5 100644
--- a/tools/testing/selftests/arm64/fp/sve-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/sve-ptrace.c
@@ -253,7 +253,7 @@ static void ptrace_set_get_vl(pid_t child, const struct vec_type *type,
 		return;
 	}
 
-	ksft_test_result(new_sve->vl = prctl_vl, "Set %s VL %u\n",
+	ksft_test_result(new_sve->vl == prctl_vl, "Set %s VL %u\n",
 			 type->name, vl);
 
 	free(new_sve);

-- 
2.39.5


