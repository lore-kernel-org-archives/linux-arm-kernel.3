Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E743C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 14:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBjifDT2yWCpEiPcPVoxuSXGvWaJ5sB6oKsyghiYmEw=; b=FvtZc9RlY2qT0jNQNcBlRksAPm
	DqpW9JWTZTb50lL1fsS5TKZFP63qArvzcH6PiIcdeWGg8OO9tpUaBghYn4/ZTnykRLNaT8xSXuqaD
	A9MEAOxWXoN4s/vnXkCpDrZQMYoeoI2JTHhJ2C3bPm8Zkh4DKq4mgdALRt/DoWAZHfn0BvhOHPWcF
	KCHHObhd9aBFefz/3k8V6Hpq5FBawDTmpaSupLD7itdYTbqoHBVD34eT8U8HRePqmK+08ptQP4mrP
	D874HUBxzBdR34SU3uzpacteG8ifjBbLD3wHQJ9UF+gtK+reG2mhcNm1QSF9OGZpKDwl19SADDNVN
	WO3tGpyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2FK-00000004t2c-1VZ7;
	Mon, 17 Feb 2025 14:37:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1sa-00000004nhR-2D3l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:13:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 379CA152B;
	Mon, 17 Feb 2025 06:14:07 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D4523F6A8;
	Mon, 17 Feb 2025 06:13:47 -0800 (PST)
Date: Mon, 17 Feb 2025 14:13:44 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/18] firmware: arm_ffa: Refactor addition of
 partition information into XArray
Message-ID: <Z7NEGG3DKiMUEu83@bogus>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
 <20250131-ffa_updates-v2-6-544ba4e35387@arm.com>
 <20250214045030.mfegbypq27gdl6sg@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214045030.mfegbypq27gdl6sg@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_061348_605670_CAC6DD2A 
X-CRM114-Status: GOOD (  10.37  )
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

On Fri, Feb 14, 2025 at 10:20:30AM +0530, Viresh Kumar wrote:
> On 31-01-25, 11:24, Sudeep Holla wrote:
> > @@ -1461,39 +1480,18 @@ static int ffa_setup_partitions(void)
> >  		    !(tpbuf->properties & FFA_PARTITION_AARCH64_EXEC))
> >  			ffa_mode_32bit_set(ffa_dev);
> >  
> > -		info = kzalloc(sizeof(*info), GFP_KERNEL);
> > -		if (!info) {
> > +		if (ffa_xa_add_partition_info(ffa_dev->vm_id)) {
> >  			ffa_device_unregister(ffa_dev);
> >  			continue;
> >  		}
> > -		rwlock_init(&info->rw_lock);
> > -		ret = xa_insert(&drv_info->partition_info, tpbuf->id,
> > -				info, GFP_KERNEL);
> > -		if (ret) {
> > -			pr_err("%s: failed to save partition ID 0x%x - ret:%d\n",
> > -			       __func__, tpbuf->id, ret);
> > -			ffa_device_unregister(ffa_dev);
> > -			kfree(info);
> > -		}
> > +
> 
> Why extra blank line here ?
> 

Spurious for sure, no idea how I managed that though. Dropped it now.

-- 
Regards,
Sudeep

