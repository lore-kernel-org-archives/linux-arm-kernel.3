Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F0CD0EE3D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 21:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSpRIR702+FeMvO11khfPDA+po/fNNhJC4ebj7CI+P8=; b=CyhM5s+HspHlB+zymFG79/dM/5
	TfJyv13XRVVyRlJpyTJKG01YFsC6a902PkU1/wLYq6MM/x5GTTXIOHL1DmZMQv4KJWO2ZBByUciQ7
	iA7/wLyd7SiD65h+ygIZSWkGK1KWghCFzEPxJtYzv5XQCKzgPVo1NeFRIwbNnWVAdFDbWe3E1ukeW
	hXFBfRLzIbbfMoJI6I1Su/zP6dx7buXTbNq5n3QJicPnQVX+yDHFDMRHveXXNHt/RU0/DUEr1fUlj
	zO2r4/S1cM6B6py1x6q2Yo+narhzN06Zi9p0OVmMfo9GSpk0aKdPoHzIOgiATReQm8DWwR+rGjBzf
	AP6RxXjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO0Yc-0000000DxlQ-2Pt8;
	Tue, 25 Nov 2025 21:26:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO0Yb-0000000Dxks-0k98
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 21:26:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C37A600AA;
	Tue, 25 Nov 2025 21:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25AD0C4CEF1;
	Tue, 25 Nov 2025 21:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764106000;
	bh=j3PFuvojslHLNYmdmCoF9SEmIH4R95D0u/HjVyTT8uw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ScWFMkJ1QIkfkGpwHoZvxJn8uc6QJ2SBxnfKVzjoHJzbaAoMYPFDWH6e5hre/DrVs
	 kT0yl90HJc90N+9huQqq9fb/dK5KXOTehydvzJ+fS/lMsytXH8pphr4KpxIsw6ukUf
	 70yYrpktNvn8Z1QuVtrdFTP4jRihoqC1HfsgkZzeOoxHV5XlQ4E2gUmC7KwSOF1Eq5
	 Mt8jg6J6NSD48NhaCXWLRRIgUBQNCT6UnAvRKqnLGeUWmpGZpuSLclz1rGad0Jz2tr
	 H3ujKq2PDX2yTyCKFPM+NmsNpqulbkQRSTmPoktP95+SrSUyrts0kvV28bYxMnoORw
	 VbUDZaZj3gfEA==
From: Oliver Upton <oupton@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] KVM: arm64: Add endian casting to kvm_swap_s[12]_desc()
Date: Tue, 25 Nov 2025 13:26:37 -0800
Message-ID: <176410599244.1757287.4209231567146876775.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251125204848.1136383-1-maz@kernel.org>
References: <20251125204848.1136383-1-maz@kernel.org>
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

On Tue, 25 Nov 2025 20:48:48 +0000, Marc Zyngier wrote:
> Keep sparse quiet by explicitly casting endianness conversion
> when swapping S1 and S2 descriptors.
> 
> 

Applied to next, thanks!

[1/1] KVM: arm64: Add endian casting to kvm_swap_s[12]_desc()
      https://git.kernel.org/kvmarm/kvmarm/c/1625e20fc198

--
Best,
Oliver

