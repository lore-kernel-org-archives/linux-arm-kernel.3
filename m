Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF5BCCF2E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 11:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZPZuCeu5pAv73ZW/8DTyL/ozw9zd1BtapBwykhxOng=; b=0swc1Xj+Ubmc/+J+dVnzEyRDSr
	7vceZhVQX7H/vLOlp6p3s+De0pmHAvzlOXJVbp/EWrara9lo+e7SKP9DUOf5dIlt6QRYRzczRX+kR
	PNjK4bp/6g39v57uFjagd6T1iRkt8rghPjM8RI0GPh00kHdItKSGBvuTSK611WiowEyDG4OW7XMmG
	VRCrfdM9ns+R6r37WQAo5gG9QjBeGUQDWfBadsDSv2Yjc+X5C1J16J/DESSfdcJsBAoRpWmd7Jbtj
	8H8WRTk2DoyOkwHjBiSNtNf0wByv84LnHOWTd30h5ae7wPxdDcIPCVkV5hurO8Vrzt+Nbgoxi4QXg
	VtHOVqEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlmp-00000007JUu-2y3Y;
	Mon, 19 Oct 2026 11:44:15 +0000
Received: from out-100.mta1.migadu.com ([2001:41d0:203:375::64] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlma-00000007JQ0-3Vi5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 11:44:02 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=VZi/aOP2PUmoQrhPDl8klEmLUlL0sCZECFYs4qI2270=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792410238; v=1; x=1793015038;
 b=fgRZjkmeg07XEsLARKqnyXpQFK6g6W4EB3nFk6THi4CJi1JzyxfAMr/2/jtHD4ccFjHesL3R
 CKkSrdvart1g2z1I4dXI5fXIxFjCY3msvwPz0IbBvaPQEiICuQGxB7XAvM8DNF5be0KNHQwhvb7
 xQmFb0GO4zdQmezK3BTl6CnE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c4850a772d6b8ee9;
	Mon, 19 Oct 2026 11:43:58 +0000
X-Mizu-Trace-ID: c4850a772d6b8ee9
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: Ensure TLBs and I-cache are private to each vCPU in pKVM
Date: Mon, 19 Oct 2026 12:43:57 +0100
Message-ID: <20261019114357.3528498-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <atXqLxU5bBtJ8U9W@google.com>
References: <20261014125510.2928306-1-fuad.tabba@linux.dev> <20261014125510.2928306-3-fuad.tabba@linux.dev> <atXqLxU5bBtJ8U9W@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_044401_020076_26EBB10B 
X-CRM114-Status: GOOD (  10.68  )
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

Hi Vincent,

On Mon, 19 Oct 2026 11:00:15 +0100, Vincent Donnefort <vdonnefort@google.com> wrote:
[...]
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
[...]
> > @@ -54,6 +54,9 @@ struct pkvm_hyp_vm {
> >          unsigned short refcount;
> >          hyp_spinlock_t lock;
> >  
> > +        /* Per physical CPU, the vcpu_idx of the last vCPU of this VM loaded there. */
> > +        int *last_vcpu_ran;
> 
> Unlikely to be a problem in pratice, but vcpu_idx is "unsigned int". I wonder if
> this shouldn't be unsigned int here too and initialised to UINT_MAX?

I'd copied int and -1 from the host's mmu->last_vcpu_ran, but the
vcpu_idx it's comparing against here is unsigned int, so I'll switch to
unsigned int and UINT_MAX in v2.

Thanks,
/fuad

