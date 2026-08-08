Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575D1C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 18:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YfvtnhYlOjlLxdP08uU/4xA8PeOG0Ri4dShMX5YdVRE=; b=2SYvV7Skzd54yBn4FKAT3Jh5Hd
	4JKNVLug4E/IBS38K7jRWs7lALW1wdKnSuv93mMeeguEda+NgoeNaSDlvZQQmgsknxOcVlu83fcW2
	sVo7LawmhGffJg64OxxHKD+6q0ooUVGNJXNLxN+7vzWVF+A6AovxONS6wvay76FctmdeE/gn7Uhiw
	RxYwITKT/DY8YT8PBJgfNkrZsBTMZ3H7irD2IgFpyHCvbkDl7Pm6zHJDUtbjKJEwColWfnRWEdwfp
	x+8RwBUzYHpx7Di33ir0z/Cc5KplLPaPjKI7Cy3KtXdvFFxSIm4wXJ5XklUtLvFKo4zSoz55+LXbB
	FKaGpVWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsm1u-00000009akf-32YU;
	Sat, 08 Aug 2026 18:44:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsm1t-00000009akZ-0lYX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 18:44:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D90206001A;
	Sat,  8 Aug 2026 18:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5130D1F000E9;
	Sat,  8 Aug 2026 18:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786214659;
	bh=YfvtnhYlOjlLxdP08uU/4xA8PeOG0Ri4dShMX5YdVRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cip1EV8d7zjSlPE46VIKquUEHeGQCSQC85Gefg9BUPfQpyDoPpM5vYCWuKbId1/F1
	 k9FfuYqjH+7gok2ymhdrsGyvyJ+19L0opqNohl4gejlyfngpgYrNUzaDcDjnBAzWRr
	 KFoSkh3cFlda55Gk6pC6wtEVfqAXztlAvgb93Z96gkwcQyZw0DXWizC/NRz1TbOB7a
	 TTB0nEY0iBcI+pT2Ix+DyV2QGwvugdKOrnWnb4ebwyvk7ZndRjbUrQ7rjnjT8qZGh8
	 0uoAPDy6ONdabbxqr7qSkgu6J9TDEzp8WrMzbXWNdzIUUqx/5KUGGgd/sCOynO5cd1
	 sNTCHg+s6a6wg==
From: Oliver Upton <oupton@kernel.org>
To: linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Mostafa Saleh <smostafa@google.com>
Cc: Oliver Upton <oupton@kernel.org>,
	maz@kernel.org,
	seiden@linux.ibm.com,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	vdonnefort@google.com,
	tabba@google.com,
	sebastianene@google.com,
	keirf@google.com,
	yaoyuan@linux.alibaba.com
Subject: Re: [PATCH v2 0/3] KVM: arm64: Fixes for timers and pKVM
Date: Sat,  8 Aug 2026 11:44:11 -0700
Message-ID: <178621460524.381735.15023846552532101058.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260808085824.732659-1-smostafa@google.com>
References: <20260808085824.732659-1-smostafa@google.com>
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

On Sat, 08 Aug 2026 08:58:21 +0000, Mostafa Saleh wrote:
> What started as a  small patch ended up as a 3 patch series thanks
> to Sashiko.
> 
> First patch from Marc to consolidate the offset calculation,
> follow up patches fix issues with non-protected VM and timer
> offset and protected VM running with broken CNTVOFF_EL2.
> 
> [...]

Dropped the unintended SOB in patch 3 you mentioned.

Applied to next, thanks!

[1/3] KVM: arm64: Make timer_get_offset() work in all contexts
      https://git.kernel.org/kvmarm/kvmarm/c/2858600ecd01
[2/3] KVM: arm64: Fix timer offsets for non-protected VMs
      https://git.kernel.org/kvmarm/kvmarm/c/47d3eef780e3
[3/3] KVM: arm64: Fix hvhe and broken CNTVOFF_EL2
      https://git.kernel.org/kvmarm/kvmarm/c/2e813a6e8ebe

--
Best,
Oliver

