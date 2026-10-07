Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14FBCA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXYCbGv/F5Vt1j/YtSf4+kukmf2z4zJPoM7b8kguA9A=; b=o0kRuzuipcpmnPjPHLdo1kJ3MC
	J7qvu1h81e0m3VZRQt9vp0GhKJuo4fS+Mrkgx9Z1Gd/qnNKW4y6sd48ykIv93MFzeH+7pIII/RbMF
	qKhevmcmPy6fd5sedjkhpnwXMp/WVLV483WLGUV3bwNPVaocrdNDf2XQa33aeapuiR5OP7rmNp9xE
	isQQxQJS3pcAqK+4FcR7TPAJGz2n7qbXNzE9OFVwXQ8UziVvvr+4Bnt/KAH1wVzRx/VqlhUSgVpra
	mFk+SfhtIvrNIugWPsl886UB9SJSXy5GQ3GcwxFtdF2TX6sSakSloQSrCWQrsM+VrUr9dP/ADkC95
	E1+jsm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQRu-00000002PVI-0JNS;
	Wed, 07 Oct 2026 12:08:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQRs-00000002PV7-0HgZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 12:08:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D05B601FF;
	Wed,  7 Oct 2026 12:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46B51F0089C;
	Wed,  7 Oct 2026 12:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791374918;
	bh=eXYCbGv/F5Vt1j/YtSf4+kukmf2z4zJPoM7b8kguA9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BJ8x+/dhRv33KPE2HySL7S7CKpaUFP7Q8CmhydKnZ8PI0MWnayQVrgjG55RDsYIri
	 d7XiSYzE2OEanIGU5gVJAB3/Ncreo6UgL+nnXO3vwjElLRXnmhUsOTLij9gUnnTQY4
	 fGu9zB7evqlvtpHWam+/dGj9wWXe9v7+NIQEIxixPNbgE9FHvvTlF1iBkTPH2/d2zU
	 iiRo2ECbi1KE+Lj+T7wvqEhWoNxpxVK4+2rJaktSGlDF3tuA1wvrvyjpMOkrNqBC9n
	 vbROrCy0SUj+tPn3M7KBDLW/1H1tId2R+O7GBEIRXFbbwTmknTywAtuHj4IpMxbpzC
	 oqPgSODKrEtAg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xEQRo-00000000G5C-2nan;
	Wed, 07 Oct 2026 12:08:37 +0000
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
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3] KVM: arm64: Only emulate an SError's entry for vCPUs with NV
Date: Wed,  7 Oct 2026 13:08:34 +0100
Message-ID: <179137490041.698747.10587011555353009441.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261007080833.371899-1-fuad.tabba@linux.dev>
References: <20261007080833.371899-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, fuad.tabba@linux.dev, catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, vdonnefort@google.com, qperret@google.com, mark.rutland@arm.com
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

On Wed, 07 Oct 2026 09:08:33 +0100, Fuad Tabba wrote:
> kvm_inject_serror_esr() emulates an SError's exception entry when the
> host's copy of PSTATE says SErrors are unmasked, although only NV needs
> this, for a nested context whose guest hypervisor owns the vSError. A
> protected vCPU's PSTATE lives at EL2, and the VMM can unmask SErrors in
> the host's copy before the first run, so KVM emulates the entry on that
> copy and the guest never takes the SError.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Only emulate an SError's entry for vCPUs with NV
      commit: 3bd107ed6b23de45b861e7f0c151d7fba59d721a

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



