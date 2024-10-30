Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8672FD74961
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 04:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sp/Joqr6Fg+CbM6kllKhe4k7VezD6hpv2eBeT+NpJcM=; b=Z/eL9xS5B77tVbH248dpNs/W7w
	6A55TXRubS2U0lpwfc0CKYoADloCn+cpdNaN4NZuFxUWSsPlSF8Cw6jGuuqJMyCmUgTAUpZFqM4gK
	IcxWlCFSMq9lf7IqU0FivjNwCauGy3W15NkH2bXGsj9yud8OZRyJ6sggM4kLS2rth8tqiNJVGUXBz
	VHdUs/d0TAg000lSgUBz3DtETpUvEOwb7CZYQdOIKPnur14TRGsD5WNOED/5IH+i+RqhDDSGknk9z
	JdGUALScKq7JhpyrMIDm8lZXpa6f/szPFfFksmQpwJyA5Am+l5SKH6PB9qc10a8pL93FFPA50h8Dn
	ysn9zNCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t60W2-0000000Ggti-1zTk;
	Wed, 30 Oct 2024 04:41:06 +0000
Received: from out-176.mta0.migadu.com ([2001:41d0:1004:224b::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t60UO-0000000GgkC-0lvJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 04:39:25 +0000
Date: Tue, 29 Oct 2024 21:39:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730263162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sp/Joqr6Fg+CbM6kllKhe4k7VezD6hpv2eBeT+NpJcM=;
	b=PoMWjfHlTy7H6Q3L8P7djXveyvh0HGtnyk/fdVX3t5Pr3Kp2rNPy1w8a5UNt0sUPepSSq4
	+O8NZl5UbPoxtVfPZnQgBadyXzdKzIDT+f4n2hZ0etV8o24RHVM6WBDO9nAO+MWMhzpAlD
	+zggZT7wSclLJEi+pg2CAIbdT5Mv0iI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"maz@kernel.org" <maz@kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	yuzenghui <yuzenghui@huawei.com>,
	"Wangzhou (B)" <wangzhou1@hisilicon.com>,
	jiangkunkun <jiangkunkun@huawei.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Anthony Jebson <anthony.jebson@huawei.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Linuxarm <linuxarm@huawei.com>
Subject: Re: [RFC PATCH v2 1/3] KVM: arm64: Add hypercall support for
 retrieving migration targets
Message-ID: <ZyG4cjIscLqCT7Dx@linux.dev>
References: <20241024094012.29452-1-shameerali.kolothum.thodi@huawei.com>
 <20241024094012.29452-2-shameerali.kolothum.thodi@huawei.com>
 <ZxrzhAh3qE9hLV-U@linux.dev>
 <d97cd23a1962460990a642ee8a653d2f@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d97cd23a1962460990a642ee8a653d2f@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_213924_555596_79D60F2D 
X-CRM114-Status: GOOD (  15.28  )
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

On Tue, Oct 29, 2024 at 04:00:39PM +0000, Shameerali Kolothum Thodi wrote:
> > We can't treat a single register as both a signed quantity *and* a full
> > 64 bits of bitfields. Maybe just scrap the version and have this thing
> > either return a negative error or positive quantity of implementations.
> 
> Ok. I had  a look at PV_TIME_ST/ARM_SMCCC_VENDOR_HYP_KVM_PTP_FUNC_ID
> and got that idea. Separate registers make sense though.
> 
> Do we really need to skip the version number? The idea was to use that as a
> future proof for data format in case we realize that MIDR/REVIDR is not good
> enough for errata later.

That is definitely an approach we can take. The alternative I had in
mind was that we'd allocate a new function ID if we needed to break ABI
to correct shortcomings of the original interface.

-- 
Thanks,
Oliver

