Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB5DC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 06:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vc7IvitSvTFGyb/MOLTvZQtrYIUAGbu2AsxINhlGFEM=; b=Sp1GR3Q2/w20YqBu+BXiD8yeaB
	RFejvHE/i31EKoF4xALVgMLOUzGUbid8zkVckNMlTasHRI/obIsDGWsfd2RKo2TdAaVYjYPsn2sJR
	A8z144xDhji/QaoDeZbAHPU6PzfSyX0Hn0pS6TqTLjzVzXSLVfs9pyyDdDog7yEmqFezG9CFXiE0G
	N5gWQjta1AepXYQMwfzyrfiwFNJBkA3wE5pe7GrRRpEGfRpv9r/15dTfLBkP//LkrHE20djAEPjzr
	kYCYSpaLjbpYPZfZuiGz27vbOg9s7o0KJlJPahtSvxrsZSQbMShrR/GBkGC1e8cMefOhvF3x8POtS
	jemZIFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ccb-0000000G4v3-1gdd;
	Fri, 25 Apr 2025 06:33:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Cak-0000000G4kC-1Kqu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 06:31:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F284E435AD;
	Fri, 25 Apr 2025 06:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB92CC4CEE4;
	Fri, 25 Apr 2025 06:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745562677;
	bh=GIqQZ1dCRUDCHo4FeFANi+6joS0iyejlHj27N/oETyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofAFvxRb3i1wsdHnPsZon3UzTa0HMqQEAs49Z8Whb/D8lHfG5gPiZatwVWz7pB/NW
	 dp9oTLlRjQ9fVjS6J4KItmgYIvEwGX43Ns9FUTndfBIOUBIFCLzFFvlvs8MpE0FGo/
	 bwXc6kNmKTGh6CYL8sLsEoBumcqbn1l3cFyBPNiittw3T6RviJqRh0vBuDkl8CAiV6
	 bdcDIzSfiFbdAAbp2wkqpMfpccQgxQiU1BpHvZbCQHeK3ql4xFSHBThRB8+ZP35ZRY
	 3g3Vvn9ckTeisZyBBJytUOX9pIH415/yQ1zvu0pzExHTwVZBfwVYA8KXAQRM50hwOL
	 ++ZgGFIEhlT8w==
Date: Fri, 25 Apr 2025 06:31:15 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: aleksander.lobakin@intel.com, andriy.shevchenko@linux.intel.com,
	arnd@arndb.de, bp@alien8.de, catalin.marinas@arm.com,
	corbet@lwn.net, dakr@kernel.org, dan.j.williams@intel.com,
	dave.hansen@linux.intel.com, decui@microsoft.com,
	gregkh@linuxfoundation.org, haiyangz@microsoft.com, hch@lst.de,
	hpa@zytor.com, James.Bottomley@hansenpartnership.com,
	Jonathan.Cameron@huawei.com, kys@microsoft.com, leon@kernel.org,
	lukas@wunner.de, luto@kernel.org, m.szyprowski@samsung.com,
	martin.petersen@oracle.com, mingo@redhat.com, peterz@infradead.org,
	quic_zijuhu@quicinc.com, robin.murphy@arm.com, tglx@linutronix.de,
	wei.liu@kernel.org, will@kernel.org, iommu@lists.linux.dev,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	x86@kernel.org, apais@microsoft.com, benhill@microsoft.com,
	bperkins@microsoft.com, sunilmut@microsoft.com
Subject: Re: [PATCH hyperv-next 1/6] Documentation: hyperv: Confidential VMBus
Message-ID: <aAssMxyM-TBnyARj@liuwe-devbox-ubuntu-v2.tail21d00.ts.net>
References: <20250409000835.285105-1-romank@linux.microsoft.com>
 <20250409000835.285105-2-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409000835.285105-2-romank@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_233118_375770_5F84FE88 
X-CRM114-Status: GOOD (  14.81  )
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

On Tue, Apr 08, 2025 at 05:08:30PM -0700, Roman Kisel wrote:
> Define what the confidential VMBus is and describe what advantages
> it offers on the capable hardware.
> 
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> ---
>  Documentation/virt/hyperv/vmbus.rst | 41 +++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/Documentation/virt/hyperv/vmbus.rst b/Documentation/virt/hyperv/vmbus.rst
> index 1dcef6a7fda3..f600e3d09800 100644
> --- a/Documentation/virt/hyperv/vmbus.rst
> +++ b/Documentation/virt/hyperv/vmbus.rst
> @@ -324,3 +324,44 @@ rescinded, neither Hyper-V nor Linux retains any state about
>  its previous existence. Such a device might be re-added later,
>  in which case it is treated as an entirely new device. See
>  vmbus_onoffer_rescind().
> +
> +Confidential VMBus
> +------------------
> +
> +The confidential VMBus provides the control and data planes where
> +the guest doesn't talk to either the hypervisor or the host. Instead,
> +it relies on the trusted paravisor. The hardware (SNP or TDX) encrypts
> +the guest memory and the register state also measuring the paravisor
> +image via using the platform security processor to ensure trsuted and
> +confidential computing.
> +
> +To support confidential communication with the paravisor, a VmBus client

Please be consistent. In this document I see VMBus and VmBus. We should
stick with only one form.

Wei.

