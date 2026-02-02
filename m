Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57722E7DEF8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 15:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qVPXQU4qhkOFQQ72DotLn0KFm/fOY/GgVAh7B5FQhTI=; b=Z5L914BPaqPkH1tJvFbyrBBbAp
	wxNm1NJQDFYJULJdcTQVo4vjum8zgTgFk9/LA5ll2GSqPlkmlAP+3sSMZA3IoDqHrD2pB8I5KLo0a
	+xqVLizTXZdOQ9b8ZjiFBX3IlOCRGZDjOX2hdrs219F9PqO70FX4gfIY9vIF2zTwwfLPhRJDGPUEU
	3LddLsK+WROE7Ts3O+pUrJ4HtE/jabinva+L5EwqKVDTHNAanQNhdFIOWpkPMq+oxXXY+str5azCh
	CTmm75wbecU20kr7ILN71UdiPhF+C3FpJzr64P6xbGw+J/kKVp4HIeVU6srCQ/9BJmfST/JuOlENM
	YI1gm70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmw9L-00000005DAR-1gNB;
	Mon, 02 Feb 2026 15:47:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmw9J-00000005DAH-3qZJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 15:47:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1638600BB;
	Mon,  2 Feb 2026 15:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5516C116C6;
	Mon,  2 Feb 2026 15:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770047256;
	bh=DQHMSgsv3Ovvgk7wrUhAAoPFmN9TTDqtPHu6Cz7HA7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DfsrRktoympOnvAdNukfodGNDG57OpTppFaeZUdDCTWc08e5pktKeeyIy6iMkaaF3
	 4J+6hXYdrb1E+IYZHxefkc/te9dqgZh7EMAWS/Vk8ITrBHA1IsJYQe7Zx2MXtDanlL
	 SNj+7YAA+pCre+3IUVjJFjRNoLSDgE9/iDyx4Pt4wAvwejiL8/M302wAwTKIqTAd9u
	 NCqG4KsaqtqZ7x0uVN3sVCVhNLMiMLh1GCFzmwvIyoRddjQ+J4zG0mMtcoS/gd9MhL
	 5N9NdEqIys5AkbDfDr+mDxI0B/q+vJuBkq3Zmh5QlGhSwKPNQOJ3rKth3itJFcpoL1
	 8ouC5IMV34uDg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vmw9G-00000007pPD-1BGL;
	Mon, 02 Feb 2026 15:47:34 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <tabba@google.com>
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	qperret@google.com,
	Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH v1] KVM: arm64: nv: Avoid NV stage-2 code when NV is not supported
Date: Mon,  2 Feb 2026 15:47:31 +0000
Message-ID: <177004724421.2704560.7699222325442161081.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260202152310.113467-1-tabba@google.com>
References: <20260202152310.113467-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, tabba@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, qperret@google.com, oupton@kernel.org
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

On Mon, 02 Feb 2026 15:22:53 +0000, Fuad Tabba wrote:
> The NV stage-2 manipulation functions kvm_nested_s2_unmap(),
> kvm_nested_s2_wp(), and others, are being called for any stage-2
> manipulation regardless of whether nested virtualization is supported or
> enabled for the VM.
> 
> For protected KVM (pKVM), `struct kvm_pgtable` uses the
> `pkvm_mappings` member of the union. This member aliases `ia_bits`,
> which is used by the non-protected NV code paths. Attempting to
> read `pgt->ia_bits` in these functions results in treating
> protected mapping pointers or state values as bit-shift amounts.
> This triggers a UBSAN shift-out-of-bounds error:
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: nv: Avoid NV stage-2 code when NV is not supported
      commit: 0c4762e26879acc101790269382f230f22fd6905

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



