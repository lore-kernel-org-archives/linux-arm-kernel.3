Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4901088E5C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 00:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AY/dmLi/z8SUAAMZ2gqdSfQxfr35ot2Vi6eYrVHNvEQ=; b=KlibzqMBQgVrWzHXVcVPmPwV/U
	UcGYxwonrM1iz+aOm4U7QzMC82ZXLE52Isq66WBt1BuU0jaNZbFNVdES9ab13FBGBs9vHkU1iFaeY
	ZxTjiqhD0SlLljKYjf1cAKAfSI9/M4J0KT0KA3BW/wLJc7wgRDHWFhhG/a41sIHAvA+1bb7LBFvt6
	C/gApzF3FRreZ3WBzv3hfiT0a652SFfSO9DooHhGv7dvRZKZazMReTWuT9d11HA3/IFEE6QYq9FZs
	Z/V6RfhEa8X76BUdufWqSmwjhnZOMzzg4i9cSPat+FsqFTRjKsP6tlhHtQc69RB70fNz3mj3XTydU
	tXKwky8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w30vs-00000009XAN-1lju;
	Thu, 19 Mar 2026 00:08:12 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w30vq-00000009XA2-35Ik
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 00:08:11 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2b052ec7176so19115ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 17:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773878890; x=1774483690; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AY/dmLi/z8SUAAMZ2gqdSfQxfr35ot2Vi6eYrVHNvEQ=;
        b=lpSf/YKGhTSrROord+l2wLYLnTbuqAPlivuiN0L3mA5YZL1q3RBLSP5ATS1JgSvHdr
         T2F9lkKUKfTVno7qDuhx2ZEMFvVSPetMoyB9fBhiOxEu9iz81CZ+u2k9EiacC7grc1SB
         Cxhca7X+x8JdHAX1kwM87JnyxUVce+wKLRj8MAsLul/brryPNtR6bVAL1xxJqy1E2Id7
         GtYSNZYD+HJ/EaUfBmPP4DmnTYCC++ciyFOL0xjEgUivTO3zCdGwaFjvmB8XbGwbWHuy
         AzY+Bt9E47ns643grP3qP/cRxJqdrYnp3PB+JwYPdLXKEKPX0VHCwJXUryzJMFeRYEYO
         ojiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773878890; x=1774483690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AY/dmLi/z8SUAAMZ2gqdSfQxfr35ot2Vi6eYrVHNvEQ=;
        b=TdphfoQV6JaXMW2wkYPu+86l1r9VQQFKpo3ZZnyruu9fzM7dG+qjPdUSKt8/kYPLN1
         zlEiNMQmWMKvPLzyVbMG8whBb+ZOoKVI2v/R/gS9YYFsUdpN7iaZUw95OLGUsUzpERSd
         8Es28gl2fboX2+kafhMttl+ezVt0LmgFdr4me6Y2CMSo5X+BJsAa0FM024edxFjOxkV9
         TEw7qFkoxPpxDbn+MX3azFAMGsGlw3RlvNMks4WGKe0PpdmrzdPhYeBDhksR812w6eDp
         1IQGIj6ze6/+wIsdhAKnWUQlYwoAx2a8AgKlCXyolU/SUzgLoYamybDI5QItaH9YoyNX
         hGIg==
X-Forwarded-Encrypted: i=1; AJvYcCWKDU6L3gpF1sQqKhZuyNRNRETmR8h0cZ6KX7r4sRw7BX6YQmpx0pRugJL39HUzHSKoTL+bJGz0uI9lLyhyLbtR@lists.infradead.org
X-Gm-Message-State: AOJu0YyyEPDi8946UlT7X0LRHLpiKVV7xiaovRVZ1hkQXOybFw1ZTDdQ
	I1Bdm/8kF6UVN2vKUDVClkek7RUt26s37WDJou4zj1mf42L0UE4fMi+yhez33sIJOA==
X-Gm-Gg: ATEYQzzIuIhvlRYsokFdHnvHB9LmLU5LB7rtE3Zoiurg2gxMxBPFIorayosOiO9d9KH
	8xGVuhcDpNQzkG0i2ioUq8AobgqnzeWu09piyrvIjqlanULrNHBUQWLR6QTbjjMF24zWto/HFyw
	zS+LCjBUyXyN7JpWv4MxT8iwbNFZZZnTnypJWa+5xB+Iak8FZBRTm1/8o/R0QdBb13Dn6Z5P7VS
	e+4jakESkAK/FDBIc7Cca+Ppwsgk3wNZWkgpNjDIuQuvb8I51lKqOy3HGOU94N6I+bNX+TcshCH
	R+Da86pbv5BpmpA6CUGwonj2wwwJwXcrVhlXlJEiwmLYSY60iT7vNOiPKR4/iborfG37Jt8rCZi
	mGHmIs8e9bE2jvXBm06s/uMIDKQMu5cbIV7rAZZdM9stbJOfYgyZBDrSAgIhkGBwZA2bj/odxN2
	rjPU5bTmHzanVoqPKXl/UdmzDVxFLM2QOsYVArWpSUx234FdqS6n1S6uuM8zCAdg==
X-Received: by 2002:a17:903:2ac7:b0:2ae:45cc:aeb6 with SMTP id d9443c01a7336-2b077b4ca86mr1596195ad.6.1773878889199;
        Wed, 18 Mar 2026 17:08:09 -0700 (PDT)
Received: from google.com (168.136.83.34.bc.googleusercontent.com. [34.83.136.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbe6162sm3741880b3a.42.2026.03.18.17.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 17:08:08 -0700 (PDT)
Date: Thu, 19 Mar 2026 00:08:04 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	bhelgaas@google.com, jgg@nvidia.com, rafael@kernel.org, lenb@kernel.org, 
	praan@google.com, baolu.lu@linux.intel.com, xueshuai@linux.alibaba.com, 
	kevin.tian@intel.com, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, 
	vsethi@nvidia.com
Subject: Re: [PATCH v2 4/7] iommu/arm-smmu-v3: Mark ATC invalidate timeouts
 via lockless bitmap
Message-ID: <abs6PudCAh-eVRPA@google.com>
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <0c5525367cc67ccc84a675544d1d9f8462704065.1773774441.git.nicolinc@nvidia.com>
 <absfAT4jgL2f3UfR@google.com>
 <abs0CQCrFlCsV6Ls@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <abs0CQCrFlCsV6Ls@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_170810_798752_BC5E21C1 
X-CRM114-Status: GOOD (  25.14  )
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

On Wed, Mar 18, 2026 at 04:23:53PM -0700, Nicolin Chen wrote:
>Hi Sami,
>
>On Wed, Mar 18, 2026 at 10:02:32PM +0000, Samiullah Khawaja wrote:
>> On Tue, Mar 17, 2026 at 12:15:37PM -0700, Nicolin Chen wrote:
>> > @@ -895,9 +898,19 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>> >
>> > 	/* 5. If we are inserting a CMD_SYNC, we must wait for it to complete */
>> > 	if (sync) {
>> > +		u32 sync_prod;
>> > +
>> > 		llq.prod = queue_inc_prod_n(&llq, n);
>> > +		sync_prod = llq.prod;
>> > +
>> > 		ret = arm_smmu_cmdq_poll_until_sync(smmu, cmdq, &llq);
>> > -		if (ret) {
>> > +		if (test_and_clear_bit(Q_IDX(&llq, sync_prod),
>> > +				       cmdq->atc_sync_timeouts)) {
>>
>> This will not be set if a software timeout (1 second) occurs. Do you
>> know if the ATC timeout of Arm sMMUv3 is less than the software timeout
>> in the driver?
>
>You brought up a good point!
>
>I think ATC timeout follows the PCI Completion Timeout Value in
>"Device Control 2 Register", which is typically set [50us, 50ms]
>but can be set up to [17s, 64s] according to PCI Base spec.

Agreed.
>
>> If not maybe we can handle the software timeout here also as the cmdlist
>> is already known?
>
>I think it's trickier.
>
>If the software times out first at 1s, it means the CMDQ is still
>pending on wait for the completion of ATC invalidation. Then, the
>caller sees -ETIMEOUT and tries to bisect the ATC batch or update
>the STE directly, either of which involves CMDQ. But CMDQ has not
>recovered yet.
>
>Then, in case of a batch, all the reties could timeout again. So,
>it will fail to identify which device is truly broken. This would
>end badly by blindly disabling all the devices in the batch. Also
>the disabling calls require CMDQ too, so they might fail as well.

Yes, looking at VT-d currently and the queue length is 256 and this
spirals out of control quickly.
>
>Thus, partially to answer the question, in case software timeout,
>I am afraid that we can hardly do anything.. :-/

Agreed.

Do you think we can maybe document this somewhere? Maybe add to the
cover letter?
>
>This means I need to set a different return code for ATC timeouts
>v.s. software timeouts.
>
>Also, there is another problem: when PCI CTO finally reaches, the
>GERROR ISR will set atc_sync_timeouts but nobody will clear it..
>So, before calling arm_smmu_cmdq_issue_cmdlist(), we need to make
>sure there is no dirty bit on the bitmap too.

Yes, Just to confirm, do you think this needs to be handled regardless
whether we handle the software timeout for the ATC invalidation?
Basically to cleanup the bit on bitmap.
>
>Thanks!
>Nicolin

