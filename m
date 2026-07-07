Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD97C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vb+uzQslXNnzFN8dPaHgq6RUHJYsFcy6X4K3rf4mJF0=; b=miUIQZNv2hvg0iBNxNZcMTGylw
	HpO/Z2nBlLbiTh1lNC/nyXJ4m14CQAPf6okWa4OhfslCW7QujyKZFdznoMiX1GmsUfxmLvIdEIkzM
	spF0M2tDJbTFk+2G6CMLRW/Ht3hvnWxLwVuqO9C1MtrbFA0SF2wC86fVky5kfUiyw1ApwkTDsVkPJ
	b6OmY8mUQyPw4kFNujwZPeEZfNalmG7HgiiuVSRPqoX/zNEZrCgCw5lb+grm53a+BX+2ZAuuVzdOo
	NVHyrAR3Dz0q4MGlWPO3l+WYsfzwkrvNtg9XW6uJNuN3zZR1MKaLZp738ygRe1M3m/oE9e8E3LggG
	HU0DlTEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8uo-0000000FUQN-3VsZ;
	Tue, 07 Jul 2026 16:44:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8un-0000000FUQ9-010k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 16:44:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 969E843D8D;
	Tue,  7 Jul 2026 16:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7868D1F00A3A;
	Tue,  7 Jul 2026 16:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783442694;
	bh=Vb+uzQslXNnzFN8dPaHgq6RUHJYsFcy6X4K3rf4mJF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Le6aDwkoKlfMT1NhMCg5Wvgg3JmjiLcfADQZOs6je0xZQBKNVpVQboR+K8SggDUfI
	 vpIYaMaTqlp86Zyn+9HH6+mVSFcywPAb+/MSOdUBAZVe6YAAzd/r1mt65HA34tVyy4
	 LwycDgj4rMhMj+HyDBVUZRZyvEyvcIUfc94uqApohoPjcRAMvtZliA/u+A0xjy0hl/
	 AzlZ4WKlrlNeOXRopIg9aC4usKVSBaduErqDci2L0bsmRmHDntIQedJDdsBU9WOAE/
	 8QU7KHSO5yR07Y+y+JQN4Z/v/JYp1XQFDTG23C7dLORvsTCb6A8YxIqqxvKaGECgxM
	 CummkJHAjU6zw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wh8ui-00000002VO8-2cNy;
	Tue, 07 Jul 2026 16:44:52 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Fix propagation of TLBI level in kvm_pgtable_stage2_relax_perms()
Date: Tue,  7 Jul 2026 17:44:47 +0100
Message-ID: <178344263830.1901049.2047368013580972483.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260707162935.1900874-1-maz@kernel.org>
References: <20260707162935.1900874-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, maz@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, broonie@kernel.org
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

On Tue, 07 Jul 2026 17:29:35 +0100, Marc Zyngier wrote:
> Assigning the invalidation level (an s8 value) with TLBI_TTL_UNKNOWN
> (a 32bit signed value) is not ideal, to say the least. Instead of
> this, only pass TLBI_TTL_UNKNOWN to __kvm_tlb_flush_vmid_ipa_nsh()
> when we know for sure that we don't have a provided level.
> 
> 

Applied to fixes, thanks!

[1/1] KVM: arm64: Fix propagation of TLBI level in kvm_pgtable_stage2_relax_perms()
      commit: 8d187d4b33c262c0f3e44842553521151d8629e8

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



