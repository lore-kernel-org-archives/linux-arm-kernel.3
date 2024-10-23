Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492F4CFA46A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pz8zjk8EFrO8r6vwJWUFUyel58khFz5T31bsvjzVB38=; b=n8YganzWsIVEVA
	Wf2raS2I24Xbz+xRgtf/+wxZV+4vqvfO9Xj6QyR+2F4NUwmeKmpHWZy9DFfcIQgllBaTCO4P5daYC
	nwCmc6Fi0vJI4V2CjgB9ONvLuf+yBjZuUT8JmTz9TbXNJjPKCcAYTJAICpCzv7rcb8rF4itfCezB2
	JPNQuPlHV1HMhLWWU/L1NrQKLsExPZhwyGptRSU3s95PLfF2o2jq5inwYEk/NesdBIPKni8uZF8cm
	LhEvvuBl1ZxcLjHihH0stTF+LeNsTYRN0hyNIAFnRgCV0in/8t1cchfMsA0c71j5SkxzwSS1KGTsj
	XnrHA+HsTQ795KWZVzGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3iAS-0000000Frqk-3EA0;
	Wed, 23 Oct 2024 20:41:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3i8r-0000000FrTj-2ofT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 20:39:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8EDA65C5E6A;
	Wed, 23 Oct 2024 20:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EEA6C4CEE5;
	Wed, 23 Oct 2024 20:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729715980;
	bh=KVTyCSHO3IKy45k1g82pm2rTQMvLTo5VSsiU946MF+Q=;
	h=From:Subject:Date:To:Cc:From;
	b=EMAbHMVYbG9E/UFnp6Gh7YN4EgkfqD4+HH1FzQcZ4tUZdDoge9aKec/xoUEuwPyUB
	 AYWX4UqKtGwdbAdXIdk8Kg9sRDqD3fQ2zDn8FdaXNk1X7SZczzkSzVhY+SHmI1SEXt
	 J1gIfbc5KUJ//YeL9YA6Wa3XvcKt/CZJo1/rY0n74FqJggODv+xmU818/s0O6fTVtC
	 4NZ9zG8NrASnXkPLCGObHArigqg5fPkexmlFH0ewlFS4Rt9RMlkQqvTcFXCKeSHR+p
	 WFOE6aHXN4GTZrdciurL8RZJ50TRoNtwqpkMIL6rd3BPe8pii4EjX4m6WejjamyVx7
	 7IbKzN8+QA90w==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/6] kselftest/arm64: Test floating point signal context
 restore in fp-stress
Date: Wed, 23 Oct 2024 21:38:28 +0100
Message-Id: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMReGWcC/x3MPQqAMAxA4atIZgNtrYJeRRyKpprBH5IiQvHuF
 sdveC+DkjApDFUGoZuVz6PA1hXMWzhWQl6KwRnnrXENBtk7j/FCTUKqyCKcQjoFW2/bSL0LC0U
 o/SUU+fnf4/S+HxgEPM1rAAAA
X-Change-ID: 20241023-arm64-fp-stress-irritator-5415fe92adef
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1908; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KVTyCSHO3IKy45k1g82pm2rTQMvLTo5VSsiU946MF+Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnGV8F2INtwxgXIoiUoQrRFDtnMbJkUFgtlgl/WYNn
 rDKLzfeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZxlfBQAKCRAk1otyXVSH0BNIB/
 4ih+CnZpppBhkqbwlSYfQYsYtU61752e15oGC34vX3GFkcyMQngwu4YRNYbl4dfb5IQ5L/mMkzWlg8
 8aB5EuqMca3/yUHOBfLb6+ZodJuu4si2/v3hFz9vF4ixkcZGablC28XwRxF4hE50mOHniDct3Y3gvG
 BByBjJgl3tgydbkA2MY+rAFIFKttLAP88Urj1FgqknhLoyqMu/xCXYzaA3ERE6G66IKowL1gNoFks7
 /NdfQXfchwmZxyqA6ycREy2TUvINBqUhesj7rrrEacTHCQ1UQqBN7CmUMKglNPbkJu+f2VaSU/Q5ta
 CIhImwroMaSg5wI5B9JGVCuRjWpRKG
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_133941_833169_4F89EA39 
X-CRM114-Status: GOOD (  10.90  )
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

Currently we test signal delivery to the programs run by fp-stress but
our signal handlers simply count the number of signals seen and don't do
anything with the floating point state.  The original fpsimd-test and
sve-test programs had signal handlers called irritators which modify the
live register state, verifying that we restore the signal context on
return, but a combination of misleading comments and code resulted in
them never being used and the equivalent handlers in the other tests
being stubbed or omitted.

Clarify the code, implement effective irritator handlers for the test
programs that can have them and then switch the signals generated by the
fp-stress program over to use the irritators, ensuring that we validate
that we restore the saved signal context properly.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (6):
      kselftest/arm64: Correct misleading comments on fp-stress irritators
      kselftest/arm64: Remove unused ADRs from irritator handlers
      kselftest/arm64: Corrupt P15 in the irritator when testing SSVE
      kselftest/arm64: Implement irritators for ZA and ZT
      kselftest/arm64: Provide a SIGUSR1 handler in the kernel mode FP stress test
      kselftest/arm64: Test signal handler state modification in fp-stress

 tools/testing/selftests/arm64/fp/fp-stress.c   |  2 +-
 tools/testing/selftests/arm64/fp/fpsimd-test.S |  4 +---
 tools/testing/selftests/arm64/fp/kernel-test.c |  4 ++++
 tools/testing/selftests/arm64/fp/sve-test.S    |  6 ++----
 tools/testing/selftests/arm64/fp/za-test.S     | 13 ++++---------
 tools/testing/selftests/arm64/fp/zt-test.S     | 13 ++++---------
 6 files changed, 16 insertions(+), 26 deletions(-)
---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241023-arm64-fp-stress-irritator-5415fe92adef

Best regards,
-- 
Mark Brown <broonie@kernel.org>


