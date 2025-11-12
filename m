Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40784CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMu+htqmxZY8v4PRGC/BjkQuDTuHtKgG86zOvFLzlRY=; b=vKKImbVjqZM7L3/UnHkStOEfuV
	yqjJ0cdL37Pg078DzxMC2VeX/xjAuhnsiqTlgCXw7Y30KIiSLpbV+x5EOF8ORvIh9yJla+DWYOhoK
	qQsplmf5aiedFOHqX6RFUMG6bh/kjM9J/4dOmqZ6QOYaCg1p82IGMQu/bnUK96vs9XYcF0dYcuxFu
	P27FiDxivP1iMAihyoNbut31BVD7oMaDljO9WnehAYXHj/rvoXMYvbT8y8r2z7TGfMkT/5sKSUMM9
	ZMF8mqUg75KFWoldPfVF3qI8IQwWNg47aj8NRXJgYiCmVg36ZAqsVXwJjCajArr7QovICQPnCL09h
	todJsrqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8VB-00000008cSw-1OGi;
	Wed, 12 Nov 2025 10:55:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8V9-00000008cSK-19RX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:55:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E143D4469E;
	Wed, 12 Nov 2025 10:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D6CC116B1;
	Wed, 12 Nov 2025 10:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762944898;
	bh=W51dKg5AAstr6djaoD8uG/T3R+JrK/bE16/j24kPxSc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qu9C9cIXLuXFWuyGDg1uBYoRwByiVd1c5b2SUc0CWhywiOcSJ92iu7cn7IbmsJ+NV
	 Wva7Om/yNmnG2qu2qLiCZjed3u8uY2nHLWHmnJXQ/ZWFNnXXlAxaAFsBVMeAGB6oQD
	 Evxo0hSlLGBjcGiWBKYdlQzfWD7AhMNXdec5XuG88Aq1VckKBoDaGKgnZ8+TBi784P
	 NyR5qevJIIWdEqGBdsq9NZumjHNQrUHV9gHta5If/u21whj9HSm+DfOIl7PfBDKCUW
	 93z3iFlzl59Qyz7TrdCIHmPCOAv0AoFPjOCHPxJmXLmKqv9SLTy1F2Er3uAD25ij8F
	 8oaJHWzC4qk9Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vJ8V6-00000004VdI-2xmh;
	Wed, 12 Nov 2025 10:54:56 +0000
From: Marc Zyngier <maz@kernel.org>
To: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Oliver Upton <oupton@kernel.org>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH] KVM: arm64: VHE: Compute fgt traps before activating them
Date: Wed, 12 Nov 2025 10:54:53 +0000
Message-ID: <176294489353.2146675.1598964023376256637.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251112102853.47759-1-alexandru.elisei@arm.com>
References: <20251112102853.47759-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, oupton@kernel.org, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_025459_333133_9BA1B69B 
X-CRM114-Status: GOOD (  10.46  )
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

On Wed, 12 Nov 2025 10:28:53 +0000, Alexandru Elisei wrote:
> On VHE, the Fine Grain Traps registers are written to hardware in
> kvm_arch_vcpu_load()->..->__activate_traps_hfgxtr(), but the fgt array is
> computed later, in kvm_vcpu_load_fgt(). This can lead to zero being written
> to the FGT registers the first time a VCPU is loaded. Also, any changes to
> the fgt array will be visible only after the VCPU is scheduled out, and
> then back in, which is not the intended behaviour.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: VHE: Compute fgt traps before activating them
      commit: 85592114ffda568b507bc2b04f5e9afbe7c13b62

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



