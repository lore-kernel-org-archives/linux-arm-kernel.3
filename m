Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540ACC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 16:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkofLTs/n7wvr8dKNEYEFluDsCYA/tkI6Ly0UHyGLdo=; b=dr5ESao7eysmwidQWp6qPn/xzK
	z9Y1BEzZi6GPksidj/bL8dEAS+9O1KnyHR943R1IEgaxtwEj4H6OtevYA8VCyNGoqiexnFMqnpZWC
	B2JtzOIdYUiUW9+WsTKWEz0AaE8Eawvi+qk4w3NeClE4bZ1k3whcSjQNubIGYd/ULwLoETaBaE8vL
	utwoVK3wAsg/G+cv1WgR7BPrwODMzliAliGZD57thHU5FtEbHujIrIlBuSVdN+KMF/XQEUCD/OyI4
	58IKt7Vpoopaw/JUxurQyAZhQh7nLbrXjt4RLRthJn7pl6XEzgDpzIUo3M5MzoZbqrzlI0INRKdI8
	AjMKf9VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOf3S-00000004cUx-2Fth;
	Mon, 09 Jun 2025 16:08:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeNl-00000004WFA-3Rfp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:25:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 73AB85C3B99;
	Mon,  9 Jun 2025 15:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27938C4CEEF;
	Mon,  9 Jun 2025 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749482752;
	bh=YiFiB0gJqqVhDkl2hVnB2VVfQod5K7jSRTa08zi1g3A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JHFbwsGA9NvrUXv28rBLETzbHH3jvPOJSUhw9dTYnxnkZVG7Qf0Syvsx1EKVwZkBp
	 G0hM3XLi4FAoKjzzyhLMv0jNt04ub6m1UmIWHQRzhE2TO+NdhiH6ThMkDfCCqYo03w
	 5zpy0UFHQrgTNQ56io5EC/EOzlWpdAbrzb0lCeygyPeeHYxUE9Z4IIKjlcE1ssrOV7
	 ebs0sAaDzPPSRbTWkqd/qyfxjbEIh3gda8BjCNra/jnD9jMVCxCIeK2R+YKXpkeG/R
	 Rbua09Ds4wfCHWD559/hwdTIHhN4CzDKgWYk6PQpo5OgnDy3kjskIxgeMQVoarYoRs
	 FzmfjWoowOLbA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Jun 2025 16:25:33 +0100
Subject: [PATCH v2 3/3] kselftest/arm64: Specify SVE data when testing VL
 set in sve-ptrace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-kselftest-arm64-ssve-fixups-v2-3-998fcfa6f240@kernel.org>
References: <20250609-kselftest-arm64-ssve-fixups-v2-0-998fcfa6f240@kernel.org>
In-Reply-To: <20250609-kselftest-arm64-ssve-fixups-v2-0-998fcfa6f240@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YiFiB0gJqqVhDkl2hVnB2VVfQod5K7jSRTa08zi1g3A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoRvz35uw4ddJPvpDN/dzqJsanKCxAQyD2Ha9ER7Yr
 Zs35tqyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaEb89wAKCRAk1otyXVSH0LAaB/
 9dY59pv9f64cvRL5SwQdgxAsI9AN/Fa8n9B9AOLV/8yI26OL6icpvFxOm+xMGqQrKccfZwBY4dGhFB
 Nh2zxYF3P8mBWOEBSjQDvn8TxyL1GcdZis3jP17X0oEjYh3y4IEjifSazXut+K4Szq2Er68xBv8wXz
 svEqCr4jCZ4e/lzKSUf2OHekwAxbTAiP3EyUyQYAsR9Y926yP2nGmHw/c258cenegC9ZdBH8PiPkLv
 mZn7RQ05xmk0lGHnCL/f58tMLa+RkjssJglDa8AHPPdZBfa/KY7HBzf0sKQli37VRIjZZVYnFBXBJk
 lXWcIrhd0hUxPnCcZx0+nhdyhdWiIJ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_082553_959677_340F25B3 
X-CRM114-Status: GOOD (  11.57  )
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

Since f916dd32a943 ("arm64/fpsimd: ptrace: Mandate SVE payload for
streaming-mode state") we reject attempts to write to the streaming mode
regset even if there is no register data supplied, causing the tests for
setting vector lengths and setting SVE_VL_INHERIT in sve-ptrace to
spuriously fail. Set the flag to avoid the issue, we still support not
supplying register data.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-ptrace.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-ptrace.c b/tools/testing/selftests/arm64/fp/sve-ptrace.c
index 7e259907805b..7f9b6a61d369 100644
--- a/tools/testing/selftests/arm64/fp/sve-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/sve-ptrace.c
@@ -170,7 +170,7 @@ static void ptrace_set_get_inherit(pid_t child, const struct vec_type *type)
 	memset(&sve, 0, sizeof(sve));
 	sve.size = sizeof(sve);
 	sve.vl = sve_vl_from_vq(SVE_VQ_MIN);
-	sve.flags = SVE_PT_VL_INHERIT;
+	sve.flags = SVE_PT_VL_INHERIT | SVE_PT_REGS_SVE;
 	ret = set_sve(child, type, &sve);
 	if (ret != 0) {
 		ksft_test_result_fail("Failed to set %s SVE_PT_VL_INHERIT\n",
@@ -235,6 +235,7 @@ static void ptrace_set_get_vl(pid_t child, const struct vec_type *type,
 	/* Set the VL by doing a set with no register payload */
 	memset(&sve, 0, sizeof(sve));
 	sve.size = sizeof(sve);
+	sve.flags = SVE_PT_REGS_SVE;
 	sve.vl = vl;
 	ret = set_sve(child, type, &sve);
 	if (ret != 0) {

-- 
2.39.5


