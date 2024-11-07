Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07387D29FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 02:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFwUVkp1LFUrT1bd0e5cxLw4J6G7gfMz/1czgC7EWMY=; b=pHDja/GeRrAUYbjHa8FnRjH98K
	w8IACw3dVKUh3pcojxWfIYbEKblWlvbBCzW2dxEpp1u9EZoJZvddGcE8t06RIoJkowmZQnhFjEUo+
	NWZzE57ZcjHXR/Iu78sXFC/VihlFeex3cb/OnGgafb+/mm5iUrgkpshpbFeU2yEd+eQfdRUO1cLC7
	o1q/gmS1QfQ8pebt8r1J0+/Ysh3PYeSDOo5AzNMSZoSIckDsoDq5W2ibbLGiYhCZNQnzKK1XVYAyT
	Cy5gshR6Tzgi7edmcVCdBdCoLr9S0s84jUkogQtaDW3ABG5yJRU+cwenjt9O7qxTVVV29baxv4mi2
	GbLQEXDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ruV-00000005Ozz-2mCO;
	Thu, 07 Nov 2024 02:06:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rZ4-00000005KIF-3i8Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 01:44:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B166E5C54A1;
	Thu,  7 Nov 2024 01:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC4BC4CEC6;
	Thu,  7 Nov 2024 01:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730943842;
	bh=vmq9jrn8vuSD3VpJFg9vZzUggmSUeit7J7xVMGFrJhg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SNyWj4hXoSwtKFE4Q23qDjAbNQV2HYafmT6nfUhsCGj9bJC1XOa/8scYdkfYM6zdj
	 4PtEtBF0uPRREIwL7lgIH8w9Rss3EgVdkR/dT+GNsrpHOdr7q9lIX5JS5qKH6oBzLP
	 g3XgNT2cdhbFuf2e4JcEv7KlSMnuxUPwN5D/E8X9PlX0yjjbweoTHyTjW1nlskRBBd
	 rIvle74315XTZEpG7Q7owSb+06aLjmK5wVYhfct1/A+rsJ4x5SOg8HXa+HAcv6V/KL
	 AZx46JsJ2IDBxapUvJgrlXfLsxqNc4syQGUNE8BrDKf1xnOFZ/ZPwadSVTMrmjfX+3
	 ytP5fOQ0Kn7JA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 07 Nov 2024 01:39:25 +0000
Subject: [PATCH v2 6/6] kselftest/arm64: Test signal handler state
 modification in fp-stress
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-arm64-fp-stress-irritator-v2-6-c4b9622e36ee@kernel.org>
References: <20241107-arm64-fp-stress-irritator-v2-0-c4b9622e36ee@kernel.org>
In-Reply-To: <20241107-arm64-fp-stress-irritator-v2-0-c4b9622e36ee@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vmq9jrn8vuSD3VpJFg9vZzUggmSUeit7J7xVMGFrJhg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnLBtTWoXA4eHd6zfw971HD8lilDRJqnyTNW/1R2WW
 DSk3ur+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZywbUwAKCRAk1otyXVSH0NxLB/
 0QhT6wTv8THELHvP8ObPV5Wls/EzSymSLag6pDrd4ya2LZ50x0Q6/+4Yni77XBfDvIMGDzADqk9d1y
 pPC6kx+WhBONPXVYzCcG+oeucfATYVRlJem/srypiq84viWGUdETPLB3tyJun/CcptYd37d2PNrhcP
 cOakCK+6UKQjnTZYU2ERhh1zRPHoavzLs/5eBz54TqQBgsLVd37WPGHVh/gKjlkLLucyFfpNCATfqT
 /vKAnFfvgVjPegyVyYXKfFpee2BIk+e92YdZTYJHREdL19GhFfMhDfWbMgDI2U0lpW/swoLG0QXSMn
 aKXv8WLvIqS08/7aj4Zn88rMvcrV7N
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_174403_022818_130522A0 
X-CRM114-Status: GOOD (  11.02  )
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

Currently in fp-stress we test signal delivery to the test threads by
sending SIGUSR2 which simply counts how many signals are delivered. The
test programs now also all have a SIGUSR1 handler which for the threads
doing userspace testing additionally modifies the floating point register
state in the signal handler, verifying that when we return the saved
register state is restored from the signal context as expected. Switch over
to triggering that to validate that we are restoring as expected.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-stress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-stress.c b/tools/testing/selftests/arm64/fp/fp-stress.c
index faac24bdefeb9436e2daf20b7250d0ae25ca23a7..3d477249dee0632b662b48582433d39323d18e18 100644
--- a/tools/testing/selftests/arm64/fp/fp-stress.c
+++ b/tools/testing/selftests/arm64/fp/fp-stress.c
@@ -221,7 +221,7 @@ static void child_output(struct child_data *child, uint32_t events,
 static void child_tickle(struct child_data *child)
 {
 	if (child->output_seen && !child->exited)
-		kill(child->pid, SIGUSR2);
+		kill(child->pid, SIGUSR1);
 }
 
 static void child_stop(struct child_data *child)

-- 
2.39.2


