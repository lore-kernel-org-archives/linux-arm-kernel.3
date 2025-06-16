Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD69C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 03:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAoSq3wYkAzHSzDe11Bf1GRaSjoJSndSGYRKR7JMYAE=; b=TKRRS6UBCHfzjYji2aDgTWHR3+
	+QTpCjTbDbEHs3vfS2iokIaDFcfdp86yKtwcXKbFy3JAY1lgviBKgxctnLWOJHMan6+tnjdQH+sTX
	OOMyVwWHheJA3VzlvGrssbCfuWnsin0l9xSD3OGyF2sQPaCgvc4Q0wMj195MlQOO3nnxKJIXlbnnx
	S4o1RsIQOZWf3vBwcYbK7R4UnnMkIDHw9hf9Hqvi1NXqMPzU0pTLVPa4CtrR3f5c7TOKlPa9AHHky
	5kE91HTQWxCxMskaCMjiVOmEY57345qfSpuI0VPf/mZW+EuGl8T1mAGnX32MwYG2fbxGW0ibjJS+5
	6cs5EZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0il-00000003HKU-3fl9;
	Mon, 16 Jun 2025 03:41:19 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0UF-00000003FZG-3VIW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 03:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750044380; x=1781580380;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uKnRFTsk+pJYACVZEJSmxbfKFT2sXQF4jSkIx9+DZxw=;
  b=SRDvVBpueQFzCjdib6tAXdyhCmanouW+GWzZ+zD59F+b6WfSXvC21Ieq
   2gvKQx6Scd1raAXnSZql6Iryj+CXrF8qL4zMrf/QNDh8gynFHTShKjZUX
   eu6qy7ukLpfEv32/pYJz0BKrvm73if4se7CaKYEaiBVrxNNSsWyXywxE6
   m04phMTR/5fgFRZQD3YMccLkODhp0AtdHt/zWl77d5O5OKhQXrfoc7czN
   dyM4uAi5mAb+ZxKwYKgOlN2eV/jchn6sRfW6i37MLoX/27XnZcFuKtl6G
   K8TvJVpF/fmSiPGY5UU0shQigt9rjUZjbzlb2w0PVbJe/E2x6gRhQ4pTJ
   w==;
X-CSE-ConnectionGUID: 3UL7R6lRRcuiDZCZPNXpOQ==
X-CSE-MsgGUID: rvYImOPaRK+eOfejG2xW3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51889507"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="51889507"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:26:19 -0700
X-CSE-ConnectionGUID: prVbeiNhTtmc4WoRu38u7g==
X-CSE-MsgGUID: Efe+tMqcRKuc4eAWZkWqSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="149229808"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:26:15 -0700
Message-ID: <118a918f-d549-4a19-8636-3bed2a670852@linux.intel.com>
Date: Mon, 16 Jun 2025 11:25:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] iommufd: Return EOPNOTSUPP for failures due to
 driver bugs
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, praan@google.com,
 yi.l.liu@intel.com, peterz@infradead.org, jsnitsel@redhat.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <623bb6f0e8fdd7b9c5745a2f99f280163f9f1f5a.1749882255.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <623bb6f0e8fdd7b9c5745a2f99f280163f9f1f5a.1749882255.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_202619_932419_DB91AFBB 
X-CRM114-Status: UNSURE (   5.45  )
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

On 6/14/25 14:35, Nicolin Chen wrote:
> It's more accurate to report EOPNOTSUPP when an ioctl failed due to driver
> bug, since there is nothing wrong with the user space side.
> 
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

