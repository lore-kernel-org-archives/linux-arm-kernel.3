Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103D6C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxY5YIWX2A55LWhwTPL5a90n771CdZxutiK9owzN9tM=; b=OmaWyDudtQ+bsFL8BA/4pBcMbQ
	znU+I1rwdpKiudEnNB+u1360KiOJl1KGWvsO9QilbtGea2lnpOiyTfb97BeevlKuKBqpQDNPisOJ8
	iDUXtlKHADfbhDptGzEeaDwzTJvxiEolNQ8281v7NlL3vlGw5n2f8Vv+A1V5AW2qgo5X5qE2z77Oj
	8i5hhmmfpBQZP+iYiAU52/QzUEz7uixrR2j54346STqFnpgyiBSu7lTWCqnrSoqSzFoAwRJKJeOWl
	hMGhvC7mj7J0NcVCKh/maZ/ctzjuHUtuPFfvCFm0gVKuUIFZyJ7bOuS+BMbOajaHXQIP/7muloVTx
	RVp12etw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Po-00000003SsS-0WGg;
	Mon, 14 Sep 2026 12:04:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Pm-00000003Src-0fTW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:04:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F490601F6;
	Mon, 14 Sep 2026 12:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256C01F000FF;
	Mon, 14 Sep 2026 12:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789387441;
	bh=hxY5YIWX2A55LWhwTPL5a90n771CdZxutiK9owzN9tM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hm09lbjG22f4PN/yF9G8XjJkOF4aj3sN5qj5QWjCyuk76RaboRefzBZNzlyIfqKwu
	 tvm5UpfLMueqyIZumZ9L7yzuLTJ5B10Vk3bulmN57i4ptJlHKkEACEi6qH7WZ4jBds
	 oEKJNjJiheQy903xfNUEzSA8VVopfwajnYhZPN1NpgMmsernD5fdd9dXTfrWlSDcZX
	 9s5X6U+7c7bxajmer28FIPJgkV1yIC4Qa/WoEh+visEE1rtiR354cwDrUvY+7GM5ax
	 pZCv24o9v/ud0dZJth16m6W13XpRlk8CUn/VOVVyzPru/L/yNMf51mViueMAEr7X3F
	 +kHot3CyfVK2A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x65Pi-00000008bC0-3CKp;
	Mon, 14 Sep 2026 12:03:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	kvm@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix the KVM_ARM_PREFERRED_TARGET documentation
Date: Mon, 14 Sep 2026 13:03:36 +0100
Message-ID: <178938739487.3215146.6544975088974680554.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260831162815.269851-1-fuad.tabba@linux.dev>
References: <20260831162815.269851-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, fuad.tabba@linux.dev, catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, vdonnefort@google.com, qperret@google.com, kvm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Mon, 31 Aug 2026 17:28:15 +0100, Fuad Tabba wrote:
> KVM_ARM_PREFERRED_TARGET has never set a feature bit: the original arm64
> implementation zeroed the bitmap, and kvm_vcpu_preferred_target(), which
> only ever zeroed it, was removed by commit 5346f7e13e5e ("KVM: arm64:
> Always return generic v8 as the preferred target"). The ENODEV error had
> gone earlier still, with commit 08e873cb70f3 ("KVM: arm64: Change the
> return type of kvm_vcpu_preferred_target()"). Document what it returns,
> that userspace selects vCPU features itself, and drop the error.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Fix the KVM_ARM_PREFERRED_TARGET documentation
      commit: f3435cb7df9b8fe242bbf776a9ac496bdd2184e9

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



