Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02005CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 15:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3WyBIrOjeOhX1lO7ibQGpENf3bYQBgFUbIdhbIOHLM=; b=HTgCwzigzw5uMPZSHyLUFIiVeQ
	FrkRIhg5kGCT3HrA3j4gbVwH/7d0D08er3TT5X7l7Oqt1cP2RMYkESg1uFfA9P6bk4urm/oUWmJvk
	/6MBb/5IXaQiV9tP49aNQGT+WFlP63d8M7M4WDEs5BS2CqXgEDmTfJ3umM0MX+hMPGhlhisHVfrMc
	zRtD6sEr9hAdnRE69jRQG9mfnETprgUwp7iFNvnl0Czxxb5iFnv0Qm92y7IeOV13VFOJXOuJZSU49
	ECV4irlqCkJxjdRXIGKpR+HfVVmhHYitFj4znoK/GoBYL3u5KXA5Iq1z1HyERLr7YRcEaZhdMK/cB
	09pauGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0m6-0000000FpXM-1TL0;
	Wed, 14 Oct 2026 15:20:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0m5-0000000FpXB-1Fv1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 15:20:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A39C0600DA;
	Wed, 14 Oct 2026 15:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB4D1F000C4;
	Wed, 14 Oct 2026 15:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791991212;
	bh=O3WyBIrOjeOhX1lO7ibQGpENf3bYQBgFUbIdhbIOHLM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LtoWPpl051yNcApac6fpfjnS+XgldKeifspPNP9fc4jIqE7zFLvtvuOyMmPO29/6R
	 ZlpnxBS3wtEK+o0M4+ygOr4Ni6SLFU/UTXBC1qMCvbjevfrV46aK74tY7zhZ54ONnp
	 rz9iTouQZmwvNXqLBj8+egPeBy3o20FPIx/gGrwbKIddUJ90HCFfCakA46ONtQoATI
	 GQhy9/I496Y6+4xdFWmxpszve6fINsVSjVHmeveEUQSXoaBAl/6BNqagrtoIhEqjLo
	 NHlHDaZSWZSu3vtMKQ7/1L9wGQG2WWlLM2FlRl+6WBb/p8SOs+U0FM6nEkPNfP49I1
	 M1m8V5P3h3ZRA==
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>, 
 Mattias Wallin <mattias.wallin@stericsson.com>, 
 Ludovic Barre <ludovic.barre@stericsson.com>, 
 Samuel Ortiz <sameo@linux.intel.com>, 
 Julien Delacou <julien.delacou@stericsson.com>, 
 Alexandre Torgue <alexandre.torgue@st.com>, 
 linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Guangshuo Li <lgs201920130244@gmail.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20260924144355.1604369-1-lgs201920130244@gmail.com>
References: <20260924144355.1604369-1-lgs201920130244@gmail.com>
Subject: Re: (subset) [PATCH v2] mfd: ab8500: fix child device leaks on
 probe failure
Message-Id: <179199120992.1194488.8547333779686899093.b4-ty@b4>
Date: Wed, 14 Oct 2026 16:20:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Thu, 24 Sep 2026 22:43:55 +0800, Guangshuo Li wrote:
> ab8500_probe() registers MFD child devices before completing the
> remaining device initialization. If a later MFD registration or sysfs
> group creation fails, previously registered child devices are not
> removed.
> 
> Use devm_mfd_add_devices() so registered MFD child devices are removed
> when probe fails.
> 
> [...]

Applied, thanks!

[1/1] mfd: ab8500: fix child device leaks on probe failure
      commit: 5bf2ae8b131d4ae9c0ed5f7aa02532645f512022

--
Lee Jones [李琼斯]


