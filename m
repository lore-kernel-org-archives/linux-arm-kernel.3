Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCA1CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 05:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HduW4/8dW6FdrYe8vG2Qnom2bAmwiuZMHEH152Z+N8Y=; b=xPh9D/CfshvZdlHcu0ty67vQxf
	iwcZXWQqmG62G+OV4t3VGFWhJIVuCSibFz3JfEZIQNAbFW3oBK4Lmi5nmW8Jtgvq5WHNBiUZQKLrO
	hp41fzaM3VONRUuf+dLCV3490V15ZbJztvGIPchX896fC+zXzEyJ/nrTyFjyxS3EZxvJANQh/TuN0
	UbF8O+j04lSx9EqujBe34Bxv2duPZEGUw9MnGc+VlD32vUgUhgZGfgJFafyt5rcNFinK8WNOCnZIB
	ZogvPlanGM5tmvoMjAm9HLQEOwzdqV1p9HxtR+p/c9lszKGLN9KWEyMbZ8volApna68S8FWXtgvW+
	eDFwfhXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBnWw-000000056Oa-0u71;
	Thu, 23 Oct 2025 05:06:30 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBnWt-000000056O6-3Lrm;
	Thu, 23 Oct 2025 05:06:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761195988; x=1792731988;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DCH/vfaxQEKOGMRXQjGl+NsvW2ShKX9ZTs4inc52yPY=;
  b=Ahr+73b/YzqUnaD0Ia363n9M+8yT10rPqiTp5eHPlhBgRSpuDtgewbTF
   Pha7K8fSoroUhzHpq0pnaZUuiqUKAiu2vpil+v1jxRsQiSUwkiLM5GUeB
   lNRpVMGMem28a3AILeiE+23828ASOqna5y3svPjfnoOmVL+ennyfNXluK
   4FajSm4BPdQh7QkhCysXBOLGnAK1e0uCFIjbfAQSBvjx8zwz/MxhdB0ud
   IwlTFeJZsZBPie758bh/AKFy0iC6k+H7Md1svGB194D8Te3V50YMRIj5L
   HkzX5iEzzszD7teimem5HpvUpu/MBJGrAZsjEbJUjB+02xPau+T3jYALW
   g==;
X-CSE-ConnectionGUID: OSE6t9SpSBK7n2sDotOpxA==
X-CSE-MsgGUID: g17nwg5wQI+jFzdcVr5NBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63264378"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="63264378"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 22:06:27 -0700
X-CSE-ConnectionGUID: LwzQDDKwSZeu79Q3nOvXQA==
X-CSE-MsgGUID: YHvnnbziRNqwuyb2sZq+xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="214987777"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 22:06:22 -0700
Message-ID: <a2ec4e64-329f-40a5-87d8-610dd4e91904@linux.intel.com>
Date: Thu, 23 Oct 2025 13:02:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] RDMA/usnic: Remove iommu_set_fault_handler()
To: Jason Gunthorpe <jgg@nvidia.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Christian Benvenuti <benve@cisco.com>, Heiko Stuebner <heiko@sntech.de>,
 iommu@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Joerg Roedel <joro@8bytes.org>, Leon Romanovsky <leon@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rdma@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nelson Escobar <neescoba@cisco.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Robin Murphy <robin.murphy@arm.com>,
 Samuel Holland <samuel@sholland.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
 Yong Wu <yong.wu@mediatek.com>
Cc: patches@lists.linux.dev
References: <1-v1-391058a85f30+14b-iommu_set_fault_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <1-v1-391058a85f30+14b-iommu_set_fault_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_220627_875868_6F1C736E 
X-CRM114-Status: UNSURE (   7.95  )
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

On 10/23/25 01:12, Jason Gunthorpe wrote:
> The handler in usnic just prints a fault report message, the iommu drivers
> all do a better job of that these days. Just remove the use of this old
> API.
> 
> Acked-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/infiniband/hw/usnic/usnic_uiom.c | 13 -------------
>   1 file changed, 13 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

