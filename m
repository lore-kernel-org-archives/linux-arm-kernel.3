Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21975C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 09:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZlHMKj7zyobSURfdEPkExbP1ViVMvl6XZI3zCxnPlU=; b=TBl5+GFC2drGBZ+Z/0NqwMpX9I
	+fv7aIF2N1jNq3cFYeE0Qt7SaEXPpYwxfFQRHaHWTjkFFK8JY0Z8HDVbEIT9DHLajIw5ycFrVqKu/
	UusicibohX2W8ezXeDMfJEfac0ZHOq1HK8z/VvL4OEPRLa7Xhodh0fDTy2Dz25ESEtiEoWqhgl/Pr
	EiFPfCCMKbdEK8IbjU064/vkVFzWf5TlHZPYN7Shk+xQlk2dWQuGg+mOkmqwF88HwJz5o9BdPd7xH
	iSc6c0B1KBppGHO8QVNonuv5e8ooqYxj7nLDn2pHbAF+KPuJLFLwXtZJbPdygbkJyrzsH9jgIU+so
	KU9s+zIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKwBd-00000000ALH-1s8q;
	Fri, 30 May 2025 09:38:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKw1m-000000007GS-0DHI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 09:27:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47D3FA4C7B8;
	Fri, 30 May 2025 09:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E304CC4CEEE;
	Fri, 30 May 2025 09:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748597268;
	bh=/ebqk5EBZxzGGlkyw6B6h4CC/MuDUNAPuwoTejd2tEs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G36byAWVROT11g+bEvLS/8ozKuiVqs56Ag0r/SFA6WwNNrQv2eEsUY0fsxvvnESwf
	 ZiTV09ahOfD3LiNTveCaMEjxc3PKc9C7pjlvtNV/udzcOsqxiurIdrPx4P8NyD4d4a
	 o9RiZJPLbK1d6KXVSa+pdP2NOsfe5tqmCcDShAGZxBECV531Ov3DCO0gVbsT6DMzLC
	 DiIIVr6PICv1zvYwQmirQky5VwZyU0D07aptZdK6Y6E2lA8oR63pE0gPkD3aXCs1g5
	 DQRlmf8Zm6JbdkDkzRir4CL3P2SCcXnaGZ3wfec0pW9+gX8izhRP6odMsb06BUjbh2
	 UMzMynxIiEc2Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uKw1i-001oIv-Uj;
	Fri, 30 May 2025 10:27:47 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jing Zhang <jingzhangos@google.com>
Subject: Re: [PATCH] KVM: arm64: vgic-debug: Avoid dereferencing NULL ITE pointer
Date: Fri, 30 May 2025 10:27:44 +0100
Message-Id: <174859721253.1152851.15902065633561816989.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250530091647.1152489-1-maz@kernel.org>
References: <20250530091647.1152489-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, dan.carpenter@linaro.org, jingzhangos@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_022750_159193_59A41F40 
X-CRM114-Status: GOOD (  10.98  )
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

On Fri, 30 May 2025 10:16:47 +0100, Marc Zyngier wrote:
> Dan reports that iterating over a device ITEs can legitimately lead
> to a NULL pointer, and that the NULL check is placed *after* the
> pointer has already been dereferenced.
> 
> Hoist the pointer check as early as possible and be done with it.
> 
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: vgic-debug: Avoid dereferencing NULL ITE pointer
      commit: 4d62121ce9b58ea23c8d62207cbc604e98ecdc0a

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



