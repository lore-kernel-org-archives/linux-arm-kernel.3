Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB633EC01C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 10:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLSPbVu3YIx3t0kj/MpUR8GOt3Fwk1rHJ2vT0PKRk9s=; b=FUte+rdW5qQPHDVa/3ijEdSGQC
	1LJyEa7N3IjW6MwsfYHGqFeMEtgz7G1wlNvPb/TVdJmCWS4166M2UvIbKCF3na+C/CmzSNxz2ziE4
	Zzp/ajeHPtXcZWyenbFMeS5yrG4OH0DtVz51hD/Te4irL/OjFL/wNnON8qcSCmAVBkKkY++BpJ9er
	lRp3Zw9hgY2bD5p1pc6bBdgkNWCKaZEu5rGK8AlUY6KTShIL7pBbFMl8GI2Anigv8x+yN6fj8C7VI
	Z80UlQ3MLzVPlBLZAuq1tURzFTz/lwckpHjSZx9zpywfg0wwunp7NqDniPP/r9GRDzSEYoevrUuw5
	/yeIAYSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cYw-0000000GWGr-1Goz;
	Mon, 23 Mar 2026 10:31:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cYv-0000000GWGd-0qxn
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Mar 2026 10:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MLSPbVu3YIx3t0kj/MpUR8GOt3Fwk1rHJ2vT0PKRk9s=; b=COldj2Z3Gxy6LOgSz0Amm8JMjq
	LIP1lYDcpXQvCb7kQvfTyYSXy84seumR9Go0Dtw+Y3skVa4kX0I+0Gk5FnWYg7D3ILSdDUeqpU/Il
	1MILu218rQZ/dBf5R7o6BN1kf9ryD+X6UPqPZpInyK4res8u82ZPW9yQ6lWeHn0i7pFHv8dEkMPmz
	/OLIfCKjyJv4CJnykGikHexYvWs7TrJcxWsieM03XQoxrMafAHjnAkZ1tUGKxiOWuzmRJ9isV2vNY
	YbiNyTQPiJhdr0ZQnguNo0fBCIRTQXV2rJzNBHNFOc/bQBeRmPoOiaV/s3eM3T+4G44wnyi/zIMhy
	7Q7b4szA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cYr-00000001EX1-04dF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 10:31:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3111744503;
	Mon, 23 Mar 2026 10:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E40BAC2BCC4;
	Mon, 23 Mar 2026 10:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774261861;
	bh=KmGnBvKMzR3WBmIZw7lxqJvwoUfOF73BsW5xUbWkhjo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jV5iEclbUcaLlVkz/oAjM0CHZbT9x7l1LoucV4A16HDLof2omrwFdjsJnOLu1db5h
	 Z1uIIrudQ8nElsVPPefCeHuR+OvDpv7e8SuYoi9iMxFyoBPfbeBwNlhqVP/HajZA4k
	 gqzLz5fhCzDObfrBrMwe7XiRU3vLmVytp2e3fpgzkctVaXcJBN6eMkxGt2vl7LxGAv
	 cEd/Gp5OnfWwDN4GWobZ/16iMA6jL3mNiJ8OtJQC2VU39CxpGuusPvg83uxz14mb3l
	 zzsBD5jwex+5R302u3R4vQeFITojQ/MPTqPUxAU7rd06Mw5bMNfQakPKng5COdc1wF
	 JOw3rfagwXfxw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w4cYk-00000004g7W-2Cyg;
	Mon, 23 Mar 2026 10:30:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wei-Lin Chang <weilin.chang@arm.com>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 0/2] KVM: arm64: nv: Expose shadow page tables in debugfs
Date: Mon, 23 Mar 2026 10:30:54 +0000
Message-ID: <177426184180.2895807.211946324243843322.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317182638.1592507-1-weilin.chang@arm.com>
References: <20260317182638.1592507-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, weilin.chang@arm.com, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_103105_363108_CCAD9908 
X-CRM114-Status: GOOD (  11.36  )
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

On Tue, 17 Mar 2026 18:26:36 +0000, Wei-Lin Chang wrote:
> This is v2 of exposing shadow page tables in debugfs, there are a few
> small improvements, please see below.
> 
> Changes in v2:
>  - move debugfs_nv_dentry also behind CONFIG_PTDUMP_STAGE2_DEBUGFS
>  - use a macro to define the file names of shadow ptdumps, also
>    explicitly spell out the string to get its maximum size
>  - add Reviewed-by tag from Sebastian (thanks!)
>  - Link to v1: https://lore.kernel.org/kvmarm/20260308231829.864983-1-weilin.chang@arm.com/
> 
> [...]

Applied to next, thanks!

[1/2] KVM: arm64: ptdump: Make KVM ptdump code s2 mmu aware
      commit: 204f7c018d76c2488a90fc6681519b8eb6eebb1d
[2/2] KVM: arm64: nv: Expose shadow page tables in debugfs
      commit: 19e15dc73f0fc74eaf63ad9b3a50648450269b4d

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



