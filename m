Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EF3D3941D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 13:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RP7slZGQSuHut4ZTVDnaiwyr/f73hxyrNB6uD8oKTJc=; b=vPlHjb1JxkwGrn6+oqpSo8i5sz
	z4/KCny+QW0ULy7ut39PoO/i7E1MACfCH9qNNX/EgdFEoZJ7LyEvK5Xd3n8V9qfmjFIKE3yryPn4k
	cs+DjcaptHLMutceRkQpH7omSPqXF0MnQLYHGd+jD66p7ZBMjOn0oj0QfhOb/y3ypGMTdpfKEMcok
	siZrDQqgzi1zKw3iI/epMweLJksAuucctutyzphyAA8EmVvK7U6xL1fCHty1kmcXTFEVrD6PJaLoZ
	vNZ5URjtuBLbbsZUo0pF9wtEOZTu8YrxC1d+BsWed4sIfM8N+iBjB+YWNFs9dyhDGavcbCFK69SJT
	H7zv29Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IEO-00000000C2N-1We5;
	Thu, 02 Apr 2026 13:37:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IEN-00000000C2E-0iWV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 13:37:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BEF8600C4;
	Thu,  2 Apr 2026 13:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF10AC19424;
	Thu,  2 Apr 2026 13:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775137025;
	bh=QnR+5ZPsi9aBhWPoij2khowQATygqtU/rg9EGE59exM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R706PM/I2JxvODs6tJtfSTyrjfyqI6dFCmfqSPWwahcMaEuVuVCvVHAuYAn3cO1G+
	 yuljNy3dntSzagdB5wkbVIkqcRjJesnkWRTQYs0cJ/CPjhTm8tBuUoNSzOZxixkAyj
	 fuRy6aEOqDhO2VNtg6JUc5zC2D0dDbQrogyJpp5Bus7VJTzJzdwbd+dBEwghdDSOhl
	 5Ts6Np7c/QaZRZAM4o4iwUdgrYqTKl/4SLnEQvdroe9/ABG3+X/uN639toLlmeX7vv
	 uhjSDrMAynmdLLJjb9aclUDgJG+f9o5Kjc+2To/eUQk7lN0564ULAPrY9Y8MO7nmee
	 TbKmzf7D6L3ug==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w8IEJ-00000008H1C-3LHQ;
	Thu, 02 Apr 2026 13:37:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 0/2] KVM: arm64: Tentative fixes for page-table lifetime issues
Date: Thu,  2 Apr 2026 14:36:59 +0100
Message-ID: <177513700675.453054.2462359302983806549.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327192758.21739-1-will@kernel.org>
References: <20260327192758.21739-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, will@kernel.org, linux-arm-kernel@lists.infradead.org, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
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

On Fri, 27 Mar 2026 19:27:55 +0000, Will Deacon wrote:
> Sashiko highlighted a couple of potential page-table lifetime issues
> in the upstream code while it was reviewing the pKVM protected memory
> series. They make sense to me so I've had a crack at fixing them and
> writing a better description of the problem in the commit message.
> 
> For the second issue, I've tested it by forcing the notifier
> registration to fail and then watching the SecPageTables line in
> /proc/meminfo after attempting to create VMs.
> 
> [...]

Applied to next, thanks!

[1/2] KVM: arm64: Don't leave mmu->pgt dangling on kvm_init_stage2_mmu() error
      commit: 2fc0f3e2b9a9f397554ffe86e8f6eb0e2507ec6e
[2/2] KVM: arm64: Destroy stage-2 page-table in kvm_arch_destroy_vm()
      commit: a3ca3bfd01b7ee9f54ed85718a6d553cdd87050e

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



