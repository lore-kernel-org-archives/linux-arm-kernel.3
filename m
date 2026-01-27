Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A724DD2FEF4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 22:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Y87uN8apxJlmpJ0adW57fWqDfRG/gwUC83x8atmq9o=; b=iApBdwc5USoUco0VfnyGzVVQEB
	i36pplHH0+kqKZonkPbvxP0itZNQfIy1Fr7YQ8Bs94a2yaJrPZzzjEDFNwzF0cjaZmhnAdfsurBXU
	kMI++lFCk/X5sXolAb5T8ODbWoFRB+vfDOLPB4BkuTGyzL9yJVL5GYGlMDcbxtR7hezrIkhJyK7Uk
	E1GXaIZAXjVA5YZ8Te+Y83t8Rp1mRgnRwaDlePIX/zOasEbFI0dZJT2FImV1kew313pxYIicSn5uQ
	iAB3+zAYzxMYNsNU0DQ1GBrHuWKh/9yhxe8/8Lmvm0fj5PlXhET/LKuvyWdY63M2zHR4L7/luvW8l
	hy0xOD4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkrao-0000000F77l-237Z;
	Tue, 27 Jan 2026 22:31:26 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkram-0000000F77K-1wYu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 22:31:25 +0000
Received: from localhost (unknown [20.236.10.66])
	by linux.microsoft.com (Postfix) with ESMTPSA id B8ED720B7165;
	Tue, 27 Jan 2026 14:31:21 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B8ED720B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1769553082;
	bh=9Y87uN8apxJlmpJ0adW57fWqDfRG/gwUC83x8atmq9o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=F1si3MiQathZr4J82s8s0tPHsEM5HHu3iS0KWgyiIFmh8t2z/1riF5H5xeqL6uiuf
	 AOSvepTJcBbjh7av4ZpznQmyzGXf8lMs9q1Z9SaOKsW9NyFqjtoOkeHsLcJPT2cZXK
	 bl7roCyARz3JMk+uDttCnod8Mzv/bdsqjOGEPfig=
Date: Tue, 27 Jan 2026 14:31:19 -0800
From: Jacob Pan <jacob.pan@linux.microsoft.com>
To: Mukesh R <mrathor@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-pci@vger.kernel.org, linux-arch@vger.kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 longli@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, joro@8bytes.org,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, bhelgaas@google.com, arnd@arndb.de,
 nunodasneves@linux.microsoft.com, mhklinux@outlook.com
Subject: Re: [PATCH v0 12/15] x86/hyperv: Implement hyperv virtual iommu
Message-ID: <20260127143119.00006d2f@linux.microsoft.com>
In-Reply-To: <20260127112144.00002991@linux.microsoft.com>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
	<20260120064230.3602565-13-mrathor@linux.microsoft.com>
	<20260121211806.000006aa@linux.microsoft.com>
	<34de2049-912e-fc9e-9fc1-727fade0480f@linux.microsoft.com>
	<20260127112144.00002991@linux.microsoft.com>
Organization: LSG
X-Mailer: Claws Mail 3.21.0 (GTK+ 2.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_143124_557236_E630CA52 
X-CRM114-Status: GOOD (  15.22  )
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

Hi Mukesh,

> > >> +
> > >> +	if (hv_l1vh_partition() && !hv_curr_thread_is_vmm() &&
> > >> !hv_no_attdev) {
> > >> +		pr_err("Hyper-V: l1vh iommu does not support
> > >> host devices\n");    
> > > why is this an error if user input choose not to do direct
> > > attach?    
> > 
> > Like the error message says: on l1vh, direct attaches of host
> > devices (eg dpdk) is not supported. and l1vh only does direct
> > attaches. IOW, no host devices on l1vh.
> >   
> This hv_no_attdev flag is really confusing to me, by default
> hv_no_attdev is false, which allows direct attach. And you are saying
> l1vh allows it.
> 
> Why is this flag also controls host device attachment in l1vh? If you
> can tell the difference between direct host device attach and other
> direct attach, why don't you reject always reject host attach in l1vh?
On second thought, if the hv_no_attdev knob is only meant to control
host domain attach vs. direct attach, then it is irrelevant on L1VH.

Would it make more sense to rename this to something like
hv_host_disable_direct_attach? That would better reflect its scope and
allow it to be ignored under L1VH, and reduce the risk of users
misinterpreting or misusing it.

