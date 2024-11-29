Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B69D729E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 16:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYsZ8UL0DzOAWz2ADEWTSZ8ugBXeuk2Tb+MixeCMxU4=; b=i5FTy5BciwRW63QDMbhjsdFlij
	Diamyd32CxfR0dEPsN/ufEHclBHE8P/BL6JiFdP3qkPljWTQ8IJz9Tz4tjsuDnNO7Of3gTF7OvZyB
	Q568lmaWK1as9SpkEmmRot3dIPih2F5yhQIWiIlYUvfm8WxBxTx2oxetGNNBd2ywwTFIIPR1T/3IJ
	pYuqs9Kp8mbfoWixBY7QCX30RMUmqO+TqQU70yphmA85lZnEjXOs0N7hPoSuPe5UNVTZyHXShswAg
	C1mqlE+sk1qJBzp/t+49LAAk1gFUAeAiSGYerEKKVMMoY1SI9Us7IAIJmk/Wm2ZJcyPeduU2r5cTN
	m892TGqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH3wl-00000000cWU-0AL0;
	Fri, 29 Nov 2024 16:34:23 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH3vj-00000000cCe-3WbL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 16:33:21 +0000
Date: Fri, 29 Nov 2024 08:33:02 -0800
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Keisuke Nishimura <keisuke.nishimura@inria.fr>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH] KVM: arm/arm64: vgic-its: Add error handling in
 vgic_its_cache_translation
Message-ID: <Z0nsvvRNzjWTLI7A@linux.dev>
References: <20241128134534.361144-1-keisuke.nishimura@inria.fr>
 <Z0iujBMl1ypdwfBu@linux.dev>
 <a62e682d-c2e8-424d-84c5-4e64468124a9@inria.fr>
 <Z0lrWynd3O8a1pG_@linux.dev>
 <e85e92f9-8387-4021-885e-a379a2898c9c@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e85e92f9-8387-4021-885e-a379a2898c9c@inria.fr>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_083320_021200_E59FD8A1 
X-CRM114-Status: GOOD (  13.87  )
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

On Fri, Nov 29, 2024 at 12:30:52PM +0100, Keisuke Nishimura wrote:
> On 29/11/2024 08:20, Oliver Upton wrote:
> >   - Store fails because of a failed memory allocation / error in xarray
> >     library.
> > 
> > We don't handle #3, and the correct thing to do in this case is to put
> > @irq since it was never made visible in the translation cache.
> > 
> > So I think we'd want to do something similar to the following.
> > 
> 
> Hello,
> 
> Thanks for the comment. xa_reserve() can allocate the memory in advance and
> ensure the success of the subsequent xa_store().

Yes, but xa_store() can fail for other reasons than a failed memory
allocation. Which is why I recommended adding an explicit error handling
path to cover *all* failures to store in the xarray.

-- 
Thanks,
Oliver

