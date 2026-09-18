Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDDAC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 15:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cl6MnsVJ2tgqjlk+JWZs6DCC+wi7QAAwiMKBJVJY4Nw=; b=s7+S0Hm1Ily/l4hjWEcJCW27Gc
	BIsJ+ip7DHzWor1WW3sM2jxytKKn5tIz/64gRhNcfVeWvwYZozS8llfvNMWthJUiyLJh4yY6dfR04
	apiXeD/x5iKnIM11vFf12xFHZiWgOpYLCcWswhSAaiwEXHrCD2l1J1q3ryn1+EvCgsZzwvwUHIP52
	UixDlBGWUYFQxXo1WEhPfuv77ew08xZHui1RxYt/QY0h9WjWbQJ0E8tgGBANgyhKypsQ+717bCSE5
	Tg6dsqsksWilIgwBFdhullr4kYXam+G8ghWmSWqTBzCUcnbpMi4774XY3Ec2pjRGYHbCHADCZrfHb
	gPnJFB5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7adr-0000000EuVB-1rgr;
	Fri, 18 Sep 2026 15:36:47 +0000
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7adp-0000000EuUP-2VXy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 15:36:46 +0000
Received: by mail-qk2-x11.google.com with SMTP id af79cd13be357-939922847efso80187585a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 08:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789745804; x=1790350604; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cl6MnsVJ2tgqjlk+JWZs6DCC+wi7QAAwiMKBJVJY4Nw=;
        b=McnftnT0uehrLoN3LzOwvzKmLimXmd9e7MeYEh8NpD3VQ1c9//dR5jhSxRMFI0r8zD
         TddyR7S/D4s5LtdTFKecd7PVN2EZKQOi/H+I4+DVlkbq0LmRtEakiZm1Ew18mJTKgc6U
         glXpFU3BkULcIjJ0Dh9EojK6iuceUvvVgyU6HyplTuZNg/1txDkSRMCYWD7Y0AAHCmOr
         np8awRqNlPS6d79VSCrt9sRvVSgmxyOCq8v7ilDhSFK7ug36ZYKCf+jBnWbw7z2p35Zz
         ggpgJck+CYSRgfwCAF1+h22xSIZUMmiTa1TnA3+3RS+jUdkoWkO0ToXIMgafcBnQjA0J
         U2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745804; x=1790350604;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cl6MnsVJ2tgqjlk+JWZs6DCC+wi7QAAwiMKBJVJY4Nw=;
        b=2s47YH30TSHs3/7sMQXjS6omLrDCiXUQSgSnEQw1OHcz87250ehnoSl+gM4g2ILZpt
         SDrDWbR2TRuBHFKX+UVC8VBxRTYWZmT8TFhlfWhU6vGntaejxAJdGR31QsxMTd6381EV
         0qdGRdR8rILvc442M3/93MHbLWzm3khgU3RC3+EJN0VbDSDvZJ830NUxcEg4UOAPPaoE
         zOxRvllQC3oM4mO3g+yIeXNReSLvSX8Q9AyPR2k7X8XnJw2zV5+eBLVsrzpimX7CAfEB
         fK5OtoPNH4OYapwUyxHQvJntXZQ/wuiWUc7aIDaY8e1gBk1j7Mv+q16Yly/EMWtbqAbK
         h/+g==
X-Forwarded-Encrypted: i=1; AKwUvByJFgYXqjtwRtrZ+IhkGwzQzVB7YYwKzGzo6O6/mLjiZzViklRaf3T5M91Gjj7s2FKxbuLDkfXVKdhfAVxj/L/1@lists.infradead.org
X-Gm-Message-State: AFuF++nnqXodQwTH+wOMuWeEF9b6E8o814oCY4IpAWu+wZUqj6kmWGKc
	VBleZ24EvY4WAMvnWr/IjaZ6zlx/oNoLucW4E/FPiEKf4D2tFWDBJ7boH0jPyNn9SMQ=
X-Gm-Gg: AYBFou0CQutBsDu5eHsyHz4++WtI5uPyuklUFv4e+IQ+1Cd2WR6bzjztRxD2F9Cpluk
	tAdmw2XdloCDG/tlE3701tWJe6MAaypS/nPea/HmOVRtnq7Kufl3uETJ+AZVBil2Fm/uh6TfM5a
	2Zcynvw3oeRV8peGCVYXArAW37OoXOhwV2fcJ0YxrFdtP3NPk7lDWpm9DRAHpF1+LzHOyNWVCt5
	rXq12QISw7eU+72icpZVvVRXAxmSDmhp1J9TINSnANdcjFFdqqDa/dzplCRf+5nBi+aK2fMy9cz
	wL2N5fiGEQnCVzf8rJYGZq4CyC1soN1WuBoE8yJelxblZHeMiEP3vtq/zM2tYCfucI/A3puuNU5
	B15WkvVIn1VqlrK9POSeLSbkISnAXLZJstA0SkFbZEpB5uCFrZ63RDBm8SMuxURIuIS4n8usqep
	KbN1Ugm0UoEiQk6G2E45ixGGeA1C3yiSpouDxNU6XPhg+0nKPxNP7KA9jTSg3gROaizK5gUebl+
	qbBGYmo2pK2v7aU2I0dD3XxyVYX/IQaKnZoOOHrWb+4/A0qdLMfvggO
X-Received: by 2002:a05:620a:470b:b0:93b:d7a3:45cc with SMTP id af79cd13be357-93bdc77f152mr382061885a.53.1789745804221;
        Fri, 18 Sep 2026 08:36:44 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0ec44fdsm163568285a.28.2026.09.18.08.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:36:43 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x7adm-00000001snW-2UlV;
	Fri, 18 Sep 2026 12:36:42 -0300
Date: Fri, 18 Sep 2026 12:36:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	"T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v6 7/9] dma-buf: system_heap: Enforce shared-granule
 alignment for cc-shared buffers
Message-ID: <20260918153642.GD11599@ziepe.ca>
References: <aq1V3oeDdvXobt8J@arm.com>
 <97c30fce-9bda-4c61-b1b9-10297b89c8d9@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97c30fce-9bda-4c61-b1b9-10297b89c8d9@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_083645_644543_CE1EECE2 
X-CRM114-Status: GOOD (  20.08  )
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

On Fri, Sep 18, 2026 at 05:23:32PM +0200, Christian König wrote:
> On 9/18/26 17:16, Catalin Marinas wrote:
> > First, none of the DMA-BUF maintainers have been cc'ed. It might be fine
> > for an RFC but this series got to version 6. We need their feedback.
> 
> Yeah, thanks for doing this.
> > On Fri, Sep 04, 2026 at 04:04:50PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> The system heap can allocate buffers that are decrypted and shared with the
> >> host. For confidential-computing guests, those shared buffers must cover
> >> whole shared-buffer granule; otherwise a userspace mmap of the dma-buf may
> >> expose only part of a host-managed granule and allow unintended access to
> >> adjacent private memory.
> >>
> >> Require cc-shared system-heap allocations to have a size aligned to
> >> mem_cc_shared_granule_size(), and allocate pages at least as large as the
> >> required granule. Keep the allocation bounded by the existing heap orders,
> >> but fall back to an exact minimum-order allocation when the required
> >> granule is not one of the preferred heap orders.
> 
> Uff, I don't think we can do that.
> 
> That is massively platform specific behavior in a non platform
> specific code.

What we really need is an allocator API that does all this for the caller.

It has been pointed out a few times, Aneesh maybe you need to try to
tackle that?

dmabuf heap just wants

'allocate me an array of shared folios totaling XX bytes'

Arch code can figure out how to do it. If some ARM configs only give
order 4 folios or whatever then dmabuf heap doesn't care.

And solve the double/triple zeroing problem.

Jason

