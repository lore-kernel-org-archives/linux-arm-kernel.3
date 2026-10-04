Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DDBCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 22:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmHpsPp9iLBwKSLkzgRZINeT3/eG4Q/SLR9a6Ub540M=; b=RWBzWcuh9uB8sNhB5n94h25nyD
	1pau5JeJUR8zkixwMqAMOE8/QgW3jffiXSbGk8RjKgTVE/KXtjXpokt0sRR4eGJPZDpVMGAKsXP8V
	zXJo4OjFht0UhcvY3GmPqk37CcQwo8Vz8vXzvknw+HCDCJYds9R4FFjk/2ukF7mnHn5miwK7JeGHC
	IBJ/qYlETCCdoPUF26ecOt2ykT68o8s510LWgoeogQia4uNuISlGbDYcORBv2CmmPurhZfhV6iO33
	rLsM0g2fI9kEZpjBv6nxU2vjuVuuw5UQzoomXbqEGPW5TbOV9RBS7Id2iqHndMoO9bbOWgL6+YYCr
	kNBNyFiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUOt-0000000FPAD-0c38;
	Sun, 04 Oct 2026 22:09:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUOr-0000000FP9n-3ZhD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 22:09:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 98F3B444EE;
	Sun,  4 Oct 2026 22:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4491F0089A;
	Sun,  4 Oct 2026 22:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791151781;
	bh=nmHpsPp9iLBwKSLkzgRZINeT3/eG4Q/SLR9a6Ub540M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DU+R/k2iTEDi8OdYsB51Epn3Jf2n83BpJfVD5Rpv1WKNRx+d1kc2R1JTqIy0+KwjO
	 239RIN5YZ80bVXlpmcwTgFnSA6v2sk21jub++3xAau7HDdm8gHh5zudtog84rCOBnw
	 gcmAJK8qGA1ObwA69DI7d8uHsfCrnFMPATmmS28Qk9qk30DJ/MSyZXKPxmEAKz6Ws+
	 SWZVFYD3ldgQE5dKlhvil2146DnwqJfLNKC1RvxjyJyQC3nTsdB/vlLJEnjUW1uaRz
	 QQDgZnZ5ytF27NALGb1Xg+NRgqKCwNN61GBxwCj4Lgm3odwGeE9OzsRA4OpBJXmUKd
	 pox0Vh5J0lAgg==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Myria Sarvay <myrialsarvay@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH] drivers/perf: apple_m1: Add macOS 27 M2 Event
Date: Sun,  4 Oct 2026 23:09:17 +0100
Message-ID: <179114879411.1633099.5402206319757216770.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260912-m2-9f-pmu-name-v1-1-da682557453c@gmail.com>
References: <20260912-m2-9f-pmu-name-v1-1-da682557453c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sat, 12 Sep 2026 18:03:35 +1000, Myria Sarvay wrote:
> This patch adds another known PMU event that can be found under
> /usr/share/kpep on macOS 27 for M2 macs. INST_SIMD_ALU_VEC purports to
> count "Retired non-load/store vector Advanced SIMD instructions", and as
> we already noted, can only be registered on counter 7. Though this event
> only shows up on the M2 kpep records, it can be set on M1 CPUs, and
> records something.
> 
> [...]

Applied to arm64 (for-next/perf), thanks!

[1/1] drivers/perf: apple_m1: Add macOS 27 M2 Event
      https://git.kernel.org/arm64/c/652ab8ee0d27

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

