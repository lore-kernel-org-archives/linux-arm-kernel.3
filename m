Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4157E77197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 03:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2PUrbMMzmEWny9WVLOt2Xvhh/MuxwYK3DMRh87/FCE=; b=gIfEIOEShMsI40EwV7dEbpZxQF
	KAAVkED0mYRBceV6K3uI1cqhBPIYKvFn7msQhGoYRdnOYpfCFy5qsG6aaIWn7jMw+DN+vbjKUuA80
	k7GgVhnSrlw2ilfkGmLDdA551gUAv5obePNC1X4sN/3hgPhNtEOhtib9O3pWrlQlLDFZW/ioV5ZeM
	djePtSKx9x6rFz+jozVyoGYRr0Oy+by355xaGUHdgnk6I44MVkHw8LYTE8ZEu7gxEirntYSDTulp4
	duifUm+eUIHusGvAtAb4D71Ho7YPzQ+Ficipfi3g1au6HnhAQ9syia8JPVfnnX0anIcGZ4TmHtvAO
	C6UsuVhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdOv-000000006pJ-0FMQ;
	Mon, 06 Jan 2025 03:03:33 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdFg-000000005xS-0mx5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 02:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736132041; x=1767668041;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=35czMcYfWqWdhWTrh7yDm8vItzYjaALer1FEV0y/qBU=;
  b=f4s+3DM7cz6szIsuiwLLBkKf/Ze6t+WAlKNw8zRyYMozWs0um+EXA3ze
   tJHGoy06RhuKMhcv4DQBZcAJZXuuBnB6svWNdrScuq8gmooAiYQeGc4JL
   iU5B4pyN7cMb5VWPdSTai6HT68pgakWApUvZv2ti3tq3VG/0RbRqCGm6t
   UPsLCzuRO2qQ8VlfvTUdgJwBJVZ2IhzBZBHvk2rhUuwjVNqn57JTdme0X
   hzozJpP1DIJZfZqsw8KeHUG2GK/ss7DpvQkivbLUgNe2uwebQb+nUQeZS
   g8n092ZtQa+DzWa7AL/dqRSLfs3EZuOrOa9FnVZH/RG46KOtzHEW4APX/
   g==;
X-CSE-ConnectionGUID: GKl1RMSrQo6r01fIR2+lYw==
X-CSE-MsgGUID: RigtHBKNRrOvrYrwFrwKvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="40044062"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="40044062"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:54:00 -0800
X-CSE-ConnectionGUID: tpZJa4pBRWuPrOdRnS1tJQ==
X-CSE-MsgGUID: leFVVUmYQS+Y1J6MpcV1pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="107172779"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:53:55 -0800
Message-ID: <9e77c4db-afa1-4cd9-8d57-a1241be6ff09@linux.intel.com>
Date: Mon, 6 Jan 2025 10:51:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/14] Documentation: userspace-api: iommufd: Update
 FAULT and VEVENTQ
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com,
 corbet@lwn.net, will@kernel.org
Cc: joro@8bytes.org, suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
 dwmw2@infradead.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
 mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
 smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
 patches@lists.linux.dev
References: <cover.1735933254.git.nicolinc@nvidia.com>
 <14ee2076bfd7df1d2f7a3322d7f24a71b7417867.1735933254.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <14ee2076bfd7df1d2f7a3322d7f24a71b7417867.1735933254.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_185400_278096_01A46E7D 
X-CRM114-Status: UNSURE (   7.05  )
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

On 1/4/25 03:43, Nicolin Chen wrote:
> With the introduction of the new objects, update the doc to reflect that.
> 
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   Documentation/userspace-api/iommufd.rst | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

