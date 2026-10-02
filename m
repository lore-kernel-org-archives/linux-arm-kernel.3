Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8605DCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxiMhjvj0g+ovvxICx7+x3/w+8fsWlJqd773IyQrH10=; b=YkgLj3yEfIshKBQQxioX+j6RYA
	ZR/TEN4RgOjpE8U7Nrwo3VnnhEMd5nip6QXjeEhIA1t0N56yQQ6gI8uL2R8u1mTECkA2haGPUsCQN
	FPQ5tLfZyhHLO7JXSINOg9rmylBRgS+JYuxKHm9ChhXEKgZ439Nybgm+m6/ImLFEMMmbDrjO7R58R
	CEZJcdOPKKVFMke+MYcUV7lLEIiSLgLEivdUwsBb3m2k+peSGOWedqbzQjhuzBNseHqQ8WnMV5TlV
	7ZqD9s69S7TF/Y+mn5S7yRatvl8Sv3jgshs2SdElTvOnqgVIoEeVkv+nSVY53sLYCIdpAGlNZ9oHT
	xdYycC3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfWj-0000000Byc6-0iBl;
	Fri, 02 Oct 2026 15:50:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfWg-0000000BybL-419s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:50:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5FDD2F;
	Fri,  2 Oct 2026 08:50:17 -0700 (PDT)
Received: from [10.211.55.3] (unknown [10.57.85.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFF853F882;
	Fri,  2 Oct 2026 08:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790956221; bh=addLhb0y53M6moXzrK6ciKSDwv0bF0n4zaTd5bS4+ec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dIc0SqhSeSEZ/CM/AXGJdNLXtW0qvBRe6LGaQceAFTxDl2JXb5l1nqfpXkBBCwt0o
	 ppPo9dofMYeflUMRn+pJr9K+j9HrGjjkXXaIrtTO30cB8XZO/flVYhZKFU5Ih092NU
	 xY/dPfvJiyPGAr3QokJAAotPvX3tbzS7/jGzn7eg=
Message-ID: <02c82cdd-6fc5-4b54-99cd-32d88cca956d@arm.com>
Date: Fri, 2 Oct 2026 16:50:15 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH RFC v2 01/10] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
To: Yin Li <yin.li@oss.qualcomm.com>, James Morse <james.morse@arm.com>,
 Rob Herring <robh@kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Drew Fustini
 <fustini@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
 trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ganapatrao.kulkarni@oss.qualcomm.com,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-1-bf6645bb2f65@oss.qualcomm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-1-bf6645bb2f65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_085023_054000_88D6810A 
X-CRM114-Status: GOOD (  16.14  )
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

Hi Yin,

On 14/09/2026 10:37, Yin Li wrote:
> The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
> which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
> is defined as 16, so the check should use >= to reject index 16 and
> above. The previous > check incorrectly accepted index 16 as valid.
> 
> Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

> ---
>  drivers/resctrl/mpam_devices.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index dd422c56fbb1..6da217abf689 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -552,7 +552,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
>  
>  	lockdep_assert_held(&mpam_list_lock);
>  
> -	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
> +	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
>  		return -EINVAL;
>  
>  	if (test_and_set_bit(ris_idx, &msc->ris_idxs))
> 


