Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07085CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 05:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nj5rA64RD6qkRiVqBvawEfccQ2+uLkrtP869UCuNn10=; b=nTgwqH88XciMROPGJ/m7BIt2ZT
	nqhwqxMFRq3sq7vaA1xkV/uzrScjbxocno+RmOa/jYfRNq1kaOR/CpROW9OXzyOoc2FDQGwlKBJB5
	Ard4rak3x9Q4vxDrrQsx0yENoVDggfGyh6Xc0iLS0kKJhKXbM3KC9wxHDZaGAD6wi3DoAB+63+cXL
	I6RBzaFQcPpQ9bw9SEaBxxZqLr7cW+zidss4u2HbNjnEUcJtVbQHZUPIpukoeWNlBHpI+jmbX965w
	/8ozU36/48J1VB6NOBOgsMOMvgfSIodda8LAE4OqpJT0hkDgFxjYJvaHcliaPPWgM4zZ9QLT2dhMF
	o6i3lKlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ummuJ-00000001WNQ-2LxH;
	Fri, 15 Aug 2025 05:23:15 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ummrh-00000001W5I-22OS;
	Fri, 15 Aug 2025 05:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755235234; x=1786771234;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bfWN7p/dN5CQdIzjUhkdC/9puNhPF03kOfuc8TkPySk=;
  b=GZfEpUeRvhASrdUkBhJT/i3LpH9+oKqMaNsJY9PpOyWbenagy3o/uDyU
   ZVlyVOAiInYgWapf4zlUbZDW9bgPkTqbYMxtuuoefmqRwxRVUatdW/1XX
   Iuh2Ojn2lusPd5FL0aIwDGXKINjQlyXXWuzOqdxZbvMz1cHTO8EEbuFhQ
   6t8TwPnZRu5MK4gP/VnBSzDnZ390xYulBKngEBEj8KAhrfC+1eGsu2y9N
   5nf7osqomvbvoc9kVnC4OjG5JwlLWvOj64ClVkQvqI3tWG4Voy/FWU9ye
   W95Ivph2Nmpcx3B4OenzdPG3FFo/UCvwZeBZ0CZVKLHKSnEPwOpZiZMdt
   g==;
X-CSE-ConnectionGUID: 52xdbsSDTFSb58GXO1XNSw==
X-CSE-MsgGUID: hjdBPTaRQv2wkPTVg4jcgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="82994561"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="82994561"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 22:20:33 -0700
X-CSE-ConnectionGUID: jEHnJRqjTqGy3Eyj8EPakQ==
X-CSE-MsgGUID: 8mms4+OcTRSPtWyL1PCG4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166913623"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 22:20:27 -0700
Message-ID: <a9cc9b2c-71fa-4ee8-a82e-3254588cf964@linux.intel.com>
Date: Fri, 15 Aug 2025 13:18:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] iommu: Pass in gdev to __iommu_device_set_domain
To: Nicolin Chen <nicolinc@nvidia.com>, robin.murphy@arm.com,
 joro@8bytes.org, bhelgaas@google.com, jgg@nvidia.com
Cc: will@kernel.org, robin.clark@oss.qualcomm.com, yong.wu@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 rafael@kernel.org, lenb@kernel.org, kevin.tian@intel.com,
 yi.l.liu@intel.com, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, patches@lists.linux.dev, pjaroszynski@nvidia.com,
 vsethi@nvidia.com, helgaas@kernel.org, etzhao1900@gmail.com
References: <cover.1754952762.git.nicolinc@nvidia.com>
 <b07a15780fd5a8c688f1ae6285438a112a9b9478.1754952762.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <b07a15780fd5a8c688f1ae6285438a112a9b9478.1754952762.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_222033_567717_FA880907 
X-CRM114-Status: UNSURE (   8.22  )
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

On 8/12/25 06:59, Nicolin Chen wrote:
> The device under the reset will be attached to a blocked domain, while not
> updating the group->domain pointer. So there needs to be a per-device flag
> to indicate the reset state, for other iommu core functions to check so as
> not to shift the attached domain during the reset state.
> 
> The regular device pointer can't store any private any private iommu flag.
> So, the flag has to be in the gdev structure.
> 
> Pass in the gdev pointer instead to the functions that will check that per
> device flag.
> 
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

