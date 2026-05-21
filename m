Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26177CD5BAE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWBYFbSSJIlyYLmg5yu4OD5TUCoM5PbmQ+anX61sM9o=; b=0CQMo/RofiHjd11PjbJM9ZsSvY
	qb/cIJbKRV8y89HMckzlD/UM8qCNc6Rv0yG7j174n2DE64s65FVV2pjPrUU7tp3JQXP2ExgIu4/49
	tFXUqSSU1n/bDKLPVoztIv5sfkbmFI8F2h3UkBUZlXh6xKhMqmEHw9mC6bZm8C2MtOP+H8vD96yka
	vbB+pe9y96UxN90/5s2OzC0Gub+nUOameI8ASSER/ml8ViTkUV7mNjAJA0CAsptD6/t70AG5/l1U5
	8Au+qCMyZRcxvSzXPTZT9AMehGgJ+Lllwy24Y3SESGQHqp2SR6e4mi+aLs/3M8Tai+UdV9oTCwqJe
	9Bk49yYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxUw-00000006uJ9-2yrI;
	Thu, 21 May 2026 07:07:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxUu-00000006uIs-41hQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 07:07:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F11E60172;
	Thu, 21 May 2026 07:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81111F000E9;
	Thu, 21 May 2026 07:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779347231;
	bh=MWBYFbSSJIlyYLmg5yu4OD5TUCoM5PbmQ+anX61sM9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cmcjuivtodEDwjJC8rUpA/6qgkf1lCqjqZTrLeWsfGt+ox6Shn4WkEajN6s0bpI/V
	 ujQUDq8LupgVqh9ZpnWDckk1RPiokkEfq9LKp9b33X9bvakp7akVCBQfpIxSKdDRFk
	 /GCIoGzH5V/GvhkUaLJOLlZi/gpdXiMKX9qWcucs28d+0e3kIL/TFsrkspPKCqCIqi
	 9zPUOgskBVEfyHl6iaVFWGMPLFMXSKVLGx2RjCg/Plym5u62Z73IVz+xeH3xlieHap
	 VSAx8mDje3YXlvUG7hksnbRzO/UncZ8YJZt99F3+mb2C5AU8X5w8LYqV7mS0ETLOzz
	 71WBx1ys+8wqg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPxUr-00000004h5X-0uwF;
	Thu, 21 May 2026 07:07:09 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 0/2] KVM: arm64: nv: Reduce FP/SVE overhead on exception/exception return
Date: Thu, 21 May 2026 08:07:06 +0100
Message-ID: <177934721772.554248.3495223802015312407.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520085036.541666-1-maz@kernel.org>
References: <20260520085036.541666-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, maz@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, mark.rutland@arm.com, will@kernel.org, tabba@google.com
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

On Wed, 20 May 2026 09:50:34 +0100, Marc Zyngier wrote:
> This is the second version of this short series optimising away a lot
> of unnecessary FPSIMD/SVE context switch with NV.
> 
> * From v1 [1]:
> 
>   - New commit message on patch #2 (Mark)
> 
> [...]

Applied to next, thanks!

[1/2] KVM: arm64: nv: Track L2 to L1 exception emulation
      commit: 27ae400e6e888153ded1ad807a94a94e506dd2df
[2/2] KVM: arm64: nv: Don't save/restore FP register during a nested ERET or exception
      commit: 435c466196148ae116f616e6cda97c33281defc2

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



