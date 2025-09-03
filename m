Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF856CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 12:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAdecgndlY/39/fQoxZP6zmku8jlWLThotKjefWO13w=; b=W+PTV+e7eavK8xc4hoTPGYp5gG
	5EE0Uio1POfcnJgFOhgRIoRcpa7b6bJ267tkxoBvIcK+vQ5Zv8Yb3AxG72D04BPrwUpKFXO8V7ozm
	ApGUVFtKiY2hmms/0fYyEvT4mfE+8ZYIs2BtxZ6UB0O2AhLg6jFaEhSH56od9nhUXN5ozaBeCp0eR
	RIYghQNOBcPR31Fb+sT3a8JKKK1uN4r8reAPqqpBzBqYymk65sgw6nbfZ4G71ZZtLA3+JBMgycG9w
	Zwi2gdl8Eyk1iBucNLRj7RRgaL3OcMreicltiitNfdD0bwyNgdn5Qh6RedYmR+aR/+lPlKxqDZV0f
	5k9hLqHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utml1-00000006Pnm-1o2F;
	Wed, 03 Sep 2025 12:38:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlZP-00000006Din-2or2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 11:22:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6359F4460E;
	Wed,  3 Sep 2025 11:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74004C4CEF0;
	Wed,  3 Sep 2025 11:22:29 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: John Stultz <jstultz@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] arm64: uapi: Provide correct __BITS_PER_LONG for the compat vDSO
Date: Wed,  3 Sep 2025 12:21:22 +0100
Message-ID: <175689848208.2711243.6145487727322080491.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250821-vdso-arm64-compat-bitsperlong-v1-0-700bcabe7732@linutronix.de>
References: <20250821-vdso-arm64-compat-bitsperlong-v1-0-700bcabe7732@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_042231_727068_FBC78352 
X-CRM114-Status: GOOD (  11.60  )
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

On Thu, 21 Aug 2025 09:56:43 +0200, Thomas Weißschuh wrote:
> The generic vDSO library uses the UAPI headers. On arm64 __BITS_PER_LONG is
> always '64' even when used from the compat vDSO. In that case __GENMASK()
> does an illegal bitshift, invoking undefined behaviour.
> 
> The first patch should go into the 6.17 tree.
> 
> 
> [...]

Applied to arm64 (for-next/fixes), thanks! And sorry for the delay,
missed it due to holidays.

[1/3] arm64: uapi: Provide correct __BITS_PER_LONG for the compat vDSO
      https://git.kernel.org/arm64/c/9a6d3ff10f7f

I'll leave the other two patches to Will for the upcoming merging
window.

-- 
Catalin


