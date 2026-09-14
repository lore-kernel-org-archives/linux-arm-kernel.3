Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8709CC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMpwNCN/PilYOizsb4vbTSRly0vNd+P9tAq4T5tOvSg=; b=TSn/Hy6f6myNBCaKsMHNke/ap3
	+Fq8IMQ58drGJq3H68M1DWIfD7d9atN7f5yjJ2J7D1aD5nMxsWfFmFeUtG4f1PX4pf90ZQrup593k
	bkC3BxuDEiNNr10d6S25chzYLOWQPPsUD8G8U+nqBvXbBzoB3CSbiQpwyGiO+ADuWElVUgqlARKaO
	E8YRRp9KetufHtA4XxONw7CQ6lFqM8ZTBItoZGiE8Z21PkMW+iQcvVMdBULwd5vZr+vLeBmcPBcD9
	/yYS4LS/hxfARJA96oWf6VT9dk1vMkajH9uj1okRy/nnLToJWUvRc0VXlpG2DShfU7Qe84Oh4MBaV
	2/KDZWGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65QM-00000003TBN-2Go0;
	Mon, 14 Sep 2026 12:04:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Q0-00000003Sxd-07La
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:04:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C28A74057A;
	Mon, 14 Sep 2026 12:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C341F00893;
	Mon, 14 Sep 2026 12:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789387455;
	bh=sMpwNCN/PilYOizsb4vbTSRly0vNd+P9tAq4T5tOvSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hUxLR/XwBZ8wNJtCuQH3h1F+HL5DxMocu6uC2lWGnqbHe6TO4yYQnlbTcF2WGBKNM
	 mmd/YztTKVcxrI88onZHwERLpzBdOrsfZSCkKmJmlyXEH7CxJ2T9G7PBPqlq1fCm+k
	 UGK1WBt/woedV61WjppbviNQA7+SaVvCIuzL5bESHxo5sBdFUCHzjV3/n/RI6synyF
	 yvwkoERzCX5y7DTHfgb0AkAmvQjElDiOp5jIacg7REOSYf5xwkSZ1ILzQyEdqKx6DM
	 e5CnaxhKUi6kBJyILesWLDFygsFNxFxbeISAe9+VV5I/lhKnqfpKNSxen0F38v0e2A
	 JFJe7y3QKJNHg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x65Px-00000008bEf-39VU;
	Mon, 14 Sep 2026 12:04:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sean Christopherson <seanjc@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Gokul K <gokul02k@gmail.com>
Subject: Re: [PATCH] KVM: selftests: Fix VM leak in early return
Date: Mon, 14 Sep 2026 13:04:12 +0100
Message-ID: <178938739499.3215146.16232496567237748545.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260906034144.14059-1-tharitt97@gmail.com>
References: <20260906034144.14059-1-tharitt97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, pbonzini@redhat.com, shuah@kernel.org, tharitt97@gmail.com, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, seanjc@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, me@brighamcampbell.com, jkoolstra@xs4all.nl, gokul02k@gmail.com
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

On Sun, 06 Sep 2026 03:41:43 +0000, Tharit Tangkijwanichakul wrote:
> test_mmio_ease() returns early and skips the call to kvm_vm_free() when
> ID_AA64PFR1_EL1 is not available.
> 
> Use a goto so that the early return joins the common exit path.

Applied to next, thanks!

[1/1] KVM: selftests: Fix VM leak in early return
      commit: bb6c7d2bf564cdaa24b14764b7126f5cab45965a

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



