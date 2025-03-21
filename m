Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E53C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 02:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8f2sispf1Zzeo96ckfraGHRzB8gAZfsSjbPMYc/UFTs=; b=cmoCkjtvNuNdpqg+56VqtdhCX5
	7NQTYOqCtC4FUz1SaAR8peY590nwLadSCHiDVU0CVpqFXv8lmmTfaXZs69xqV6LQ8Lm4QQun5Jdfs
	VmNlv4u5Pb7SZeEIAxvxraA/3ktL9LSWr8oQU6Sr9oIwjW8gxgPNib7Z9Np9RZQ4hEiLb66rYd5A4
	Rly+uAvWe5I0svlWW1NdHHQg8ri/uefltm3FukXLOlyzbOQ4EySYKPP7L2WZ0aigpIoG682aCpVAA
	1QTfSHEAfL4wJItue3AobS24btIVgSG0VtM76UEZbMoXX/dE5e1dB1rl3FM1jO3+XpRRqDva9DXWf
	0lOhJJ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvRwc-0000000DgOu-0kkm;
	Fri, 21 Mar 2025 02:17:10 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvRus-0000000DgEI-0RPb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 02:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742523322; x=1774059322;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BozcqSjBaUvQxOBddqwiOyYHQ86Jidgzcjeb9YrQUuk=;
  b=KC9ut/mq4sAhTWpC3AgdFE1SbMwwRSD3gRR++i076KOKCU3KfbCwCKfb
   dyquxKiisYXLhsJvByst7g+JBuldj0/vWM+Uko50q2DJEzI6B42X0DdZT
   62TT3KbHgwV8e30ybRqJ/cRyySQrc0kwsceXjr8DtNAqqikEwxGFRv4vL
   oBEHa7YfXuSxoz74BpVnPMuJGTMIlCZ4xJcGKtg//8TklwGm6Z55WPrsT
   oqLI1LmBJyDg5+VnDz92YLmqc0PFW0sfaDeQXsEY7TJed4i/LMeGtmn0i
   wFBDj92OusEnwlCqjIc+Pk+w3fiBTegYGe6w6BMxdGUtHzBvL9t6btjyo
   w==;
X-CSE-ConnectionGUID: 9OihklF1TXCeMgNEHzpx/g==
X-CSE-MsgGUID: rJZsGRwYQlS2AQ/JxOFnWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43910567"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="43910567"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 19:15:16 -0700
X-CSE-ConnectionGUID: jJUvwO6TSgGcYgMuUkcMEw==
X-CSE-MsgGUID: GoadUQBARzSfJlmltw1sDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="127425633"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 19:15:14 -0700
Message-ID: <3506c422-6508-42f6-8624-b968b7ffba08@linux.intel.com>
Date: Fri, 21 Mar 2025 10:11:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] iommu: make inclusion of arm/arm-smmu-v3 directory
 conditional
To: Rolf Eike Beer <eb@emlix.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
References: <12652899.O9o76ZdvQC@devpool47.emlix.com>
 <6164975.lOV4Wx5bFT@devpool47.emlix.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <6164975.lOV4Wx5bFT@devpool47.emlix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_191522_195827_B1DC2681 
X-CRM114-Status: UNSURE (   5.54  )
X-CRM114-Notice: Please train this message.
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

On 3/20/25 17:19, Rolf Eike Beer wrote:
> Nothing in there is active if CONFIG_ARM_SMMU_V3 is not enabled, so the whole
> directory can depend on that switch as well.
> 
> Fixes: e86d1aa8b60f ("iommu/arm-smmu: Move Arm SMMU drivers into their own subdirectory")
> Signed-off-by: Rolf Eike Beer<eb@emlix.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

