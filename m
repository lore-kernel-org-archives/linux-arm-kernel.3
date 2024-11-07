Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED192D5D682
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 18:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMYJiK1fYUKUXwc/yM9f/FJQyk9dGTJcRw7XLjqvIoE=; b=2ys10OcASm+jiTXQlQPi5jF1Ji
	H0Uyml9Fr/WppYko5N8PtbXaWRhjbd7gAMIKKpJzdld3e1GxQkURT9r2ievhxB+7aGruuBy7mIj51
	ypmk5kdsiEecGo170Ucn1LfM/cdkv4Fy/hwN82eNveYQ/FxpujFzixfZ8Zx/fRphek6UfVzhbb/F+
	bvBn8gBBYrHMeQtffm8WtrlmNVuHv28MHJvRtPkGmcEe96R/oFxVU6lNep635eTQF8t45hJMz61Vj
	1Z59J1ZgEZ4AJcYnDsqwJJUWKZFRVfiyQTGfrcD1bXxszngamXAiH1Tg246ov1R1BLGLiIprsuZrN
	i6zf+pQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t97Td-00000007xYT-3tNz;
	Thu, 07 Nov 2024 18:43:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t97Qq-00000007xBk-0lKI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 18:40:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 640F7A4495E;
	Thu,  7 Nov 2024 18:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60EF2C4CECC;
	Thu,  7 Nov 2024 18:40:33 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/6] kselftest/arm64: Test floating point signal context restore in fp-stress
Date: Thu,  7 Nov 2024 18:40:31 +0000
Message-Id: <173100478595.985049.6746642229117398125.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241107-arm64-fp-stress-irritator-v2-0-c4b9622e36ee@kernel.org>
References: <20241107-arm64-fp-stress-irritator-v2-0-c4b9622e36ee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_104036_312243_C2C87A6A 
X-CRM114-Status: GOOD (  11.73  )
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

On Thu, 07 Nov 2024 01:39:19 +0000, Mark Brown wrote:
> Currently we test signal delivery to the programs run by fp-stress but
> our signal handlers simply count the number of signals seen and don't do
> anything with the floating point state.  The original fpsimd-test and
> sve-test programs had signal handlers called irritators which modify the
> live register state, verifying that we restore the signal context on
> return, but a combination of misleading comments and code resulted in
> them never being used and the equivalent handlers in the other tests
> being stubbed or omitted.
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/6] kselftest/arm64: Correct misleading comments on fp-stress irritators
      https://git.kernel.org/arm64/c/94de486e4215
[2/6] kselftest/arm64: Remove unused ADRs from irritator handlers
      https://git.kernel.org/arm64/c/ffca567fef9c
[4/6] kselftest/arm64: Implement irritators for ZA and ZT
      https://git.kernel.org/arm64/c/d65f27d240bb
[5/6] kselftest/arm64: Provide a SIGUSR1 handler in the kernel mode FP stress test
      https://git.kernel.org/arm64/c/7368debf275a
[6/6] kselftest/arm64: Test signal handler state modification in fp-stress
      https://git.kernel.org/arm64/c/ead1c35ce3b3

I did not merge patch 3 in case Mark R has any other comments.

-- 
Catalin


