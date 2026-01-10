Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F9BD277DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 10:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmoiV3YGJbWIZBwbiBJaVG0gAH34uhFN8QRuY8BXQdA=; b=vMDqiYmaPk6ye1V99WZyVqcsDw
	jaI+JdBNOxKmw6yijwC1QQDAN1A092swwK9RHiejcIL6B/1uwi8nD7rbTesby9dfTDP7SzNBKl1nf
	uzhjtcQibl/PuTx6eoxrsPZHrVLz8BPyUW54CWkxpdYPmAdgnv2oBkn0/pwud/N/kqvCxXmV7oY3L
	sF1rxKKoAW36KlIuJDwB6GN1+lGHPrcZdgIuHK3RKtYm+lyUHaoOLTg+A0uwOhpCzPqYbCWG0wN6H
	qFHqmsWDZeoyh1E0QCAGD2ZwwLEZpQIDWAm0oT7gu3Jn3/Mk+pcIhSG2inz+0+NEb3yDIOXiujm0q
	jY2GF0Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veW7t-00000003OSD-44V6;
	Sat, 10 Jan 2026 10:23:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veW7k-00000003OOS-3epQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 10:23:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48926402E2;
	Sat, 10 Jan 2026 10:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C91C4CEF1;
	Sat, 10 Jan 2026 10:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768040590;
	bh=C7NdkOT1sMR8XLqlXwIBf7iZlmsgloV8Oc2iGw0koCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HmwZ9hH6FmsIbLR17pRxisu69tMxpCgO4J4tBNBsAHU7QKgZToVT3UzA/sTTZmVG0
	 ZDsYxVubWpV8DfOCqJeI0q+59hhVhzOTUj72AYzT2Xea/f+aX9mGdYOSp8mXN+4q5f
	 zWml/G1r7E3u9etQfqBvsdFl4PWrqF8Ff1mHDW8SQ6uAWaHpfHXHKFd2nMXBWc88tZ
	 R3hUgixYifXg0ExHZdyczWRhxTxTEDnfzff9Y+IchG0xChNBtdLs6jgwU8+A7t5yV4
	 6uQcvlxJwZ2ZM3KYl4zP/5uu4/cZPeE2jmH2ps4ljpKgJG7cHrRNDmXTiqpoAzNFRs
	 au/dfQ8FHABlg==
From: Oliver Upton <oupton@kernel.org>
To: maz@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	qperret@google.com,
	will@kernel.org,
	tabba@google.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH v3 0/4] KVM: arm64: pKVM fixes
Date: Sat, 10 Jan 2026 02:22:42 -0800
Message-ID: <176804045755.916140.1262128534408515726.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216103053.47224-1-alexandru.elisei@arm.com>
References: <20251216103053.47224-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_022312_935387_C76AF906 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

On Tue, 16 Dec 2025 10:30:49 +0000, Alexandru Elisei wrote:
> v2 can be found at [1].
> 
> Similar to [2], when trying to run an unprotected VM on FVP with S1PIE enabled
> and kvm-arm.mode=protected, writes to PIRE0_EL1 made by the guest in
> __cpu_setup() are trapped by KVM and the BUG_ON(!r->access) is hit. That's
> because HFGWTR_EL2.nPIRE0_EL1 is an inverse polarity trap and the FGT values for
> the unprotected pKVM VCPU weren't being propagated from kvm_arch_vcpu_load().
> 
> [...]

Applied to fixes, thanks!

[1/4] KVM: arm64: Copy FGT traps to unprotected pKVM VCPU on VCPU load
      https://git.kernel.org/kvmarm/kvmarm/c/145cc42fe121
[2/4] KVM: arm64: Inject UNDEF for a register trap without accessor
      https://git.kernel.org/kvmarm/kvmarm/c/aba963cb98c6
[3/4] KVM: arm64: Remove extra argument for __pvkm_host_{share,unshare}_hyp()
      https://git.kernel.org/kvmarm/kvmarm/c/26cdea4893c2
[4/4] KVM: arm64: Remove unused parameter in synchronize_vcpu_pstate()
      https://git.kernel.org/kvmarm/kvmarm/c/d252c7898ebc

--
Best,
Oliver

