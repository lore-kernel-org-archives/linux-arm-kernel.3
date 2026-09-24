Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C88C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 20:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0P8UquZTMzoLeTcu1N/8IjI1pGOo9Exjooyz7DQixc=; b=NM1XVSOM/mEyKEIRI3PbKlLgch
	bIKdiKadZgwncjgBNpf5HifMlaL8PrZJ+svCX0OD2vsU5rBwZfpQmdTgGa2wVEh7mdMi+lcGz1Yr8
	hWi2tuqtSdeHq5OgzQOGqNnSL7lwTCOABmnDLlRpIr8bwyxIgFwzgpe2U9fUePYGy9RpogvQ1tjkh
	F1AR2cJbog/8VS2Ubyt0Sdv7DFwtnSrRV+HJgApHVmg9GDe53lFhOKJd9+lhfF3zYvnhUfpn2x064
	MXlX1+RretJbCtcX3dB+wJHiE8QYQxRAeZECKD5LGdAYyNSPGVEuCHtj/gCePSoUAB45+X1+Hm2Yk
	IP5EizMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qG6-0000000C9cI-2JJ8;
	Thu, 24 Sep 2026 20:41:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qG4-0000000C9bk-3lpO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 20:41:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 032E5600D4;
	Thu, 24 Sep 2026 20:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA4B1F000FF;
	Thu, 24 Sep 2026 20:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790282491;
	bh=i0P8UquZTMzoLeTcu1N/8IjI1pGOo9Exjooyz7DQixc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qo8AksOcGexF+fKbzzUM8yk8rQAM8arupT5f1/wxZCJAeChofBjgrW7wwtCL0XN8C
	 NvGJdZD2OjHzM8pewzjcl4FC3pPYMFcTZ8h60e36ZL7jLpmqFelJhCWjHt1G3VW2Oz
	 7W9+CoV8sn58zoMUBRZyKUFU3kCxXLbno6+w4IqiuTi/IRmhSmfj08KUiMorWs2hyC
	 2CJIS8cgtwjkgjA+o0hoChW5JtTX//v4+muOEp3HC3UH9g7lMbWosuKiBNwty0Fh7V
	 3bdOphQ0knaXVOmQKCs/ItfLt10WBuzV1I439rcellwyqCXgZH99glnkClKonQ3eSl
	 3L00IIktn4jdA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x9qG1-0000000DDGu-2Wfm;
	Thu, 24 Sep 2026 20:41:29 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wei-Lin Chang <weilin.chang@arm.com>
Cc: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v6 0/7] KVM: arm64: nv: Implement nested stage-2 reverse map
Date: Thu, 24 Sep 2026 21:41:24 +0100
Message-ID: <179028246121.3395858.305245720728794780.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915154305.3852871-1-weilin.chang@arm.com>
References: <20260915154305.3852871-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, weilin.chang@arm.com, oupton@kernel.org, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, itaru.kitayama@fujitsu.com, wanghan@linux.alibaba.com, xueshuai@linux.alibaba.com, ljs@kernel.org
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

On Tue, 15 Sep 2026 16:42:58 +0100, Wei-Lin Chang wrote:
> This is v6 of optimizing the shadow s2 mmu unmapping during MMU
> notifiers.
> 
> This version fixes a few issues, and adds Marc's space optimization
> for kvm_guest_s2_mapping [1]. Please see the changelog for the details.
> 
> Tested by booting L3, and running in-kernel targetted tests described
> in [2]. v5 got some tested-by's from Itaru and Wang (thanks), I didn't
> carry them over since some bugs fixed in v6 are non-obvious. Some
> retest would be much appreciated!
> 
> [...]

Applied to next, thanks!

[1/7] KVM: arm64: Use a variable for the canonical IPA in kvm_s2_fault_map()
      commit: 3b8ce2b5132ae4eebd81811ffd3bc2395c41ecfd
[2/7] KVM: arm64: nv: Introduce guest stage-2 tracking structures
      commit: a6ca6cba59598de94eda90e4b3a4e405621aca90
[3/7] KVM: arm64: nv: Track guest stage-2 mapping creation
      commit: c2778d14cd2ff757224715221a2ddff89fc6f127
[4/7] KVM: arm64: nv: Track guest stage-2 mapping removal
      commit: 5491980c1a416139ea67faa6c4d52fa1ed0cd4e0
[5/7] KVM: arm64: nv: Avoid full shadow stage-2 unmap
      commit: e6084aecaeefe9177280ea74c90127294260d805
[6/7] KVM: arm64: nv: Drop kvm_s2_mmu pointer from kvm_guest_s2_mapping
      commit: 2064f15b08485384d4fca892c63a1c1b4f86e9c8
[7/7] KVM: arm64: Refactor kvm_unmap_gfn_range() with common variables
      commit: 862fa568078514d0a41bd0946a65c23a0c0edec9

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



