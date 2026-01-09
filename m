Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4B7D1A62D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 14:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnokwNTfGZIXmBX/ga1vI5Gz8+qjRTxL2GrMqLWnT+M=; b=pTa2/iAKIxdV5nh2TMP0t9yzNq
	XarUGJNZoBxWXMWkXc4NI8dQJ/RbbbR0Ni8Im2B45WoxdINYCFawOuexs1igvuVg1vbM+fuLVS+nq
	MEWCvBbpyUR+8GWIW6RBUNCkar0lI7+BBpDas9eybMMcsRzApratbFNulN4FLZB2py+j3LY3UDe40
	3u1UhKu7wy//sB3lR86vxgOn/UCtiPJ/A5ZBO3fbXitGpleP+7oBlHYYoVftLOF7d7MpmxH9zk9+i
	4O2E92Z66gOPGLUGS5KUTYqQWsp8GkAXXSGN7jUiafZuQTQsybTlU/7wWTm5aMCQWkVDU8jFexoq4
	jEWmJ24w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDP7-00000002PFV-2BG1;
	Fri, 09 Jan 2026 14:23:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDP6-00000002PFP-1rMQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 14:23:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7774A60145;
	Fri,  9 Jan 2026 14:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB0A4C4CEF1;
	Fri,  9 Jan 2026 14:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767968631;
	bh=v2mF8aLKfRFIoZvCzsD/JTiSuILPUbZkMqh8PP3HP94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mjXgkvzwh9ohy9KFUBLSwyL4x7NxOnQEV4oodib4hze9U+aPNObV+YkvS0nApJpuF
	 Mm8n5d2VU6GIBsLvgketsGZgEA1975ZxY3Mn5lQKMkEizKXYbyYNXbHoIOJCbL3mAM
	 vW/kkmkNFU2tmLeQ2SoNDBRrP0PMc0P01jCzR8zy5Mf6xIl8gh3Sk364ikJ+M9d5oq
	 Kq2K48UjIauB6LARB7dibk4h5Q5KchAbOPheTZEWcgWG7Qc87oNokXDIqtiOftfNdv
	 aJOjd6C+25kaMY3R1AvhlZgnX8WO4MYyihLGfLgDX7nOpOwnwlWyQngjz1EmIRKkYH
	 NnPh9ZtT8W9cA==
Date: Fri, 9 Jan 2026 14:23:45 +0000
From: Will Deacon <will@kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 06/30] KVM: arm64: Remove pointless
 is_protected_kvm_enabled() checks from hyp
Message-ID: <aWEPcS40d9rwKWh5@willie-the-truck>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-7-will@kernel.org>
 <cokixmkyotfs6ts2rqn4xa7iseno6hk34eon76raujupedgsff@hmkoakf5kr44>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cokixmkyotfs6ts2rqn4xa7iseno6hk34eon76raujupedgsff@hmkoakf5kr44>
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

On Tue, Jan 06, 2026 at 02:40:47PM +0000, Quentin Perret wrote:
> On Monday 05 Jan 2026 at 15:49:14 (+0000), Will Deacon wrote:
> > When pKVM is not enabled, the host shouldn't issue pKVM-specific
> > hypercalls and so there's no point checking for this in the EL2
> > hypercall handling code.
> > 
> > Remove the redundant is_protected_kvm_enabled() checks.
> 
> That made me wonder if we should further divide the HVC space to have a
> 'pKVM only' range in addition to the privileged/unprivileged split, so
> we could WARN in the core HVC handler in the pretty unlikely event that
> we take a pKVM-only call in {n,h}VHE.

Good idea. I can certainly look at that as a follow-up to this series
but I'd prefer not to grow it beyond its current scope at the moment as
it's already bigger than I would really like.

> But yes there is no point in littering the code with is_protected_kvm_enabled()
> checks all over, so:
> 
>     Reviewed-by: Quentin Perret <qperret@google.com>

Thanks,

Will

