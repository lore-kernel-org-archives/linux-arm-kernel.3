Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFBCC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 13:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k47eOFDtblZTXzV626qQ8FC8NdB08Nl0iHc9y8piA/g=; b=bRqRjgtSPrZOimMG17W554zGF8
	m7rpaIWkx5JOV9e3eEVgXG0iXu4SRD955PpdMGH4XoA/stDbijf3NlyBzcH1DP0cY00NMX3xJEWPm
	TPR1/J1v+FGv4BfZ0PLRc2S7fA5383LLT4+BHZQDlF9rgAPhMB32YXJnp39oVa8TEeopruZ3C/zlU
	/wbqNFYp6W6Ii/ZSVdN0w/W8SqkYshRnXC4Mo/5N4Eq5R880VgBDzNpuLZnNX/NdmulEN28SWEo3p
	L473eIx3Dz0Cz308oNg3npUwgimRXrhj27dxBSYhN7veckwiA6J242fyL1ap8Zvx60En8SWH0ev4P
	2CO9VKWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpTt-000000063us-0OtD;
	Fri, 01 Aug 2025 13:07:29 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpQN-000000063Dm-2zI9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 13:03:52 +0000
Received: from [100.79.129.131] (unknown [4.194.122.136])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3AF0E2018F0C;
	Fri,  1 Aug 2025 06:03:46 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3AF0E2018F0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1754053429;
	bh=k47eOFDtblZTXzV626qQ8FC8NdB08Nl0iHc9y8piA/g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HXbUItXcptdZ0a55CSqNyeflST4IwBaAaATj+QdjdEiskHAWN6qxBeiU+Q0Vo3Rsn
	 CMWWlnB4ubqKeRLqNfrJWa9icwyvZzfyX4gvJwyhdW8l9c7lV1nrsGFuwHkPgG3+u/
	 OpHZSRpEAtopRXQg1v2wXggorwfrvJzEq5pzxhh0=
Message-ID: <300b5c01-33bc-4ce6-942c-e32b6e55e5c7@linux.microsoft.com>
Date: Fri, 1 Aug 2025 18:33:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-of-arasan: Ensure CD logic stabilization
 before power-up
To: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>,
 Adrian Hunter <adrian.hunter@intel.com>, "Simek, Michal"
 <michal.simek@amd.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "git (AMD-Xilinx)" <git@amd.com>,
 "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
References: <20250721095357.3783222-1-sai.krishna.potthuri@amd.com>
 <cf04326b-4de4-4637-aa3b-fa1c358b9ae4@intel.com>
 <BY5PR12MB425804611D4B29ADDCC82906DB59A@BY5PR12MB4258.namprd12.prod.outlook.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <BY5PR12MB425804611D4B29ADDCC82906DB59A@BY5PR12MB4258.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_060351_790001_68C3B058 
X-CRM114-Status: GOOD (  13.04  )
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

Hi Sai Krishna,

On 25-07-2025 11:19, Potthuri, Sai Krishna wrote:
>> Will this work with all Arasan variants?
> Yes, this is expected to work across all Arasan variants that comply with the standard
> SDHCI register definitions. The SDHCI_CD_STABLE bit is defined in both the
> standard SDHCI specification and Arasan's user guide.

As SDHCI_CD_STABLE bit is defined in SDHCI specification, why are you 
making a driver specific fix? Is this problem specific to Arasan eMMC? 
If not, does it make sense to make this a framework level change instead 
of a driver specific change?

Given that you are planning to add a quirk, doing this in common code 
would be better.

> On Xilinx/AMD Versal and ZynqMP platforms, the CD stable bit is typically set within
> a few milliseconds. However, to be on the safer side and ensure compatibility across
> all Arasan variants, a timeout of 1 second is added.
> Please let me know if you prefer to increase the timeout or if this logic should be
> enabled by a platform specific quirk.

Thanks,

Prasanna Kumar


