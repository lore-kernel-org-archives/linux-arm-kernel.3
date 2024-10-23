Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3D8CDDE6E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptk+B05Kxi+5GIvILUnu7fE4fEomqs1sYxrpNL3sly8=; b=Y0TgghKx1ssoqopTBTE+ZUXM/X
	ta+iI8XK2SKCEYMCb5mR0VVw+JvV2bbrveV71VyOzr5fbZSul1R1nG78KELUiGBMInbDaM6+YCcih
	fARr2ryJWyZPe2R8J1qOmtVS7VUhNoSwkwZzjvvZHTtYXTTs+kHNhrJOiKiMz05DMfWXzfYwNHqAM
	+t8P3vbDAbakcER9byx9z7Nbf+x6SBBLPD/Z1608wqU6VNMSdgSwe9Q9fn+9Ue9YqVwxaDtEW3Bd9
	t7yfJ+mXo8XKA6KLKIr6frpV/rv1Pt/6cON5zt0gMfrZs5Hvw8aFwlYkCXmJVRA9P8TTXvg4fAY6X
	kqcbN6Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Zpi-0000000ECNW-0nDX;
	Wed, 23 Oct 2024 11:47:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZBF-0000000E5B4-2nbk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 11:05:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2DD6B5C584A;
	Wed, 23 Oct 2024 11:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE80CC4CEE7;
	Wed, 23 Oct 2024 11:05:30 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Log fp-stress child startup errors to stdout
Date: Wed, 23 Oct 2024 12:05:28 +0100
Message-Id: <172968152193.1430866.7898159592219415431.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241023-arm64-fp-stress-exec-fail-v1-1-ee3c62932c15@kernel.org>
References: <20241023-arm64-fp-stress-exec-fail-v1-1-ee3c62932c15@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_040533_789476_13427544 
X-CRM114-Status: GOOD (  10.28  )
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

On Wed, 23 Oct 2024 00:20:45 +0100, Mark Brown wrote:
> Currently if we encounter an error between fork() and exec() of a child
> process we log the error to stderr. This means that the errors don't get
> annotated with the child information which makes diagnostics harder and
> means that if we miss the exit signal from the child we can deadlock
> waiting for output from the child. Improve robustness and output quality
> by logging to stdout instead.
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm64: Log fp-stress child startup errors to stdout
      https://git.kernel.org/arm64/c/dca93d29845d

-- 
Catalin


