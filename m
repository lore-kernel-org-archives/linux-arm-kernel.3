Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62D9CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVI7uFggDmtkUrKpmwdvu9OF+oUptvFzkUqtkEZSjmc=; b=Tw5k11NUWT0v416tN8SWTIxY9g
	JNCeEummN5hm2N1cBhEhMdhXPbAJ4RXEoDhbQ0JCztp8J+GDra62Va9WC6JWMr4uhcaeASeq008HI
	t0XmymV5R9B35C1qHVuq2Pet3tj8IwIrBmax7N8BCaCSjL3jVbHDnAWva52AejDwLxHbVnQQXyXgs
	3CmP7u2PRSFIHWNWnlLFW0cepe1BjDTWygct0/865/mfnZsPzzPG/4ryuFlxfQK5xtR5pnAby7LOT
	0djP71Qc4ZGr9MFMUwCOrZr9oEXLrjKFOKhYselJQAch2P2lxbLZgBCVIngJKVEBh8moZyhKmHGYI
	TokBhKrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVWn-00000005Vqs-1Mnk;
	Thu, 14 May 2026 12:51:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVWm-00000005Vqa-3mYZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 12:51:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EEFF860138;
	Thu, 14 May 2026 12:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36103C2BCC7;
	Thu, 14 May 2026 12:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778763059;
	bh=NU7efjjrxQUqAILsFuBvBIYHO01a0fjLt028tTxJD0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zu8U3myvrfYUrToiqd9JuWi0pe15BoGO21xJF3J9aIORX52lpfSHZ/efZj4QSnRFq
	 S+9ilFe9XBbhL+H8AxubbWH7Sw5sucd+eCDt1ZdqPNfiyRo0XeD+S/jBOtyRAjKL8Y
	 4A63UrJCKcYplb4KX02aG4ETvgWV/pwl8NVmyVGTGUxUXayGdHilC3Z9SGaHbUI20b
	 L+obL1IRTAwo0L4w1xJp8AJyyvXwPOD3EPFVIwpxrAZQzptWoji7W+cK0qrDT1woMf
	 InMyhp0gk7BQv4GR6mdxR+FhqEaGeoUMYQDqq2LlVUcll3Zue/0K4pe49VZLzZ56Fc
	 F8YfZZrN+AixQ==
Date: Thu, 14 May 2026 13:50:55 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
Message-ID: <20260514-invisible-peacock-of-potency-ccf65d@sudeepholla>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
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

On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
> Hi Aneesh
> 
> On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
> > Make the SMCCC driver responsible for registering the arm-smccc platform
> > device and after confirming the relevant SMCCC function IDs, create
> > the arm_cca_guest auxiliary device.
> > 
> 
> There are a few changes squashed in to this patch.

I had similar thoughts but I didn't get into forming a reply, now I can keep
it small, thanks for that 😉.

> Please could we split the patch in the following order ?
> 
> 1. Add platform device for arm-smccc
> 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
> it before the RSI changes)
> 3. Move RSI dev as Auxilliary
> 4. Add the firmware sysfs ABI.
> 

I agree with the logical split of functionality above.

> That way, first two could be merged while we figure out (3) and (4)
> 

I disagree with this though. We don't want to merge this unless (3) is
agreed. There is no point in doing that unless we agree the approach for
RSI as well.

-- 
Regards,
Sudeep

