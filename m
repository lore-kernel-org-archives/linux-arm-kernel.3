Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA5EC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 15:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQlD96KP3t1YvDKoOGLaZdhqGhRYm9+1I6FKDrf3KQI=; b=NAYrKY1/+IliHWuBWolKbMvgUg
	um7cgGFoAN9v7eaQmwCDc/VmcCAUc/GyNQrLHHjGMAFFqoENhx2/ududSP9OH5zPHKP/TZDmA3FWG
	N7PV9jV+qmy1TQgOqcUC4fF+EIf7ustR6qjRBSvkWmtLwKO4IHR7EMLxIw/dMjMjWczwoEX+rjwo7
	FM7ehFbWY2YsVOZs98ygGF0bPfLm9UoI0cQzUF26Jd+4S9RoIB+/bDokhdY8L7lD+iXEkZMGVNb50
	JdhBPSLGMXp9Y3k+9pmUx8f3p/zRYF12j87cS91KPZ9zmzEz9syWvrH+e+paGw3ZHGu99aUT2f3e9
	Kq1cTpww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGzj-00000002Cja-1Ywx;
	Tue, 04 Aug 2026 15:23:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGzh-00000002CiR-1RNl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 15:23:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E87651476;
	Tue,  4 Aug 2026 08:23:44 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 964693F86F;
	Tue,  4 Aug 2026 08:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785857029; bh=L2JX0u8Lfazn5RuRn03mNfgqAEqgLPIOjbmGYwItSCw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ccAb3BZcuVgv6XZv+Wh+4/ektkFWGnknlGrl6C5/AvKTMAkCpcmZ/Se+jz8XyyY7c
	 MJ45VhKFzjjjKJ9CGatkCCdLCWaaXlVX0Mtt32vZSBinH1X8BORTfKxjvGqb0YQUtC
	 dsVwghScmdvtTJ2I6Lf+EZ6nDWcnc6NL5za5CmSQ=
Message-ID: <57013b4e-d024-4c37-8fb1-5d7c96a13978@arm.com>
Date: Tue, 4 Aug 2026 16:23:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] iommu/arm-smmu-v3: Shrink command/event/PRI queues in
 kdump kernel
To: Jason Gunthorpe <jgg@nvidia.com>, Will Deacon <will@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Nicolin Chen <nicolinc@nvidia.com>, Pranjal Shrivastava <praan@google.com>,
 Breno Leitao <leitao@debian.org>, Kyle McMartin <jkkm@meta.com>,
 Usama Arif <usama.arif@linux.dev>, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260706084708.8072-1-kas@kernel.org>
 <amiBagGKn-Aym1DK@willie-the-truck> <amiz6GQZ-XGlH706@thinkstation>
 <anHxBh-xGW9JXsa4@willie-the-truck> <20260804141704.GB27883@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260804141704.GB27883@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_082353_421074_CA8CF68A 
X-CRM114-Status: GOOD (  15.49  )
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

On 04/08/2026 3:17 pm, Jason Gunthorpe wrote:
> On Tue, Aug 04, 2026 at 03:02:46PM +0100, Will Deacon wrote:
>>> Would skipping their allocation when is_kdump_kernel() be acceptable on
>>> its own, or would you rather see it done differently?
>>
>> With Nicolin's patch, we can just avoid allocating the priq and the evtq
>> entirely in the kdump case. We can then add a cmdline option to control
>> the maximum size of the cmdq, which is useful regardless of kdump.
> 
> I would still prefer kdump do this re-sizing automatically, even if we
> do add a commandline. It makes it easire to deploy than having to know
> secret command lines :\

Right, but if we implement a general command-line option/module 
parameter/whatever with a variable that needs a default value for when 
it's not overridden, then it's even more trivial to initialise *that* 
default value based on further conditions as desired.

Plus implementing the more dynamic mechanism to begin with is arguably 
nicer than hard-coding a kdump special case in what is effectively the 
wrong place, since semantically what we really want to 
override/generalise are the max_n_shift initialisations in 
arm_smmu_device_hw_probe() itself.

Thanks,
Robin.

> So functionally I still think this patch is fine, though yes it points
> out more things in Nicolin's work too.
> 
> Jason


