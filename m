Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A5CC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 09:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHMnPqihyDt2o5jw28xSqsoRzH/dDdSH6iUrAEDb00c=; b=wSsKIiC/bQjWplq7TCMA2L5dbR
	24kspcX5Weo5HIud8Cnp8WLrU65dy/FPg765I3RdHg4mPwr36RsVnYDDGLB5Iid3x8ScluTmZChBj
	p1STcssm8o30ptO73dusjocSUDHqYmF5jkWN0JqvbkA3948PKZK7jE98rVHt1pWEW3eIwdMqCC2Ua
	kR3Mt0riici3E8MYiUpYXhlGJDSYyyFvHdQ3IgIPONqWmI++spechXaZ5SvZyAEnROxm5+jk79556
	6AXDZxfams9cQmmiFLi8Uc/yAv0nl1sHeWj01STLnPzkSwr2wzQN5QsKsNldApRHq9A4pAv/RDGUi
	iZXS0YvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trvoL-0000000589H-0kHI;
	Tue, 11 Mar 2025 09:22:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trvhH-000000056yL-0FFA;
	Tue, 11 Mar 2025 09:14:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741684485;
	bh=krh3Xo5+e4+66cDwA1x9mFLk+qlGz6xj0D6Py+bTdGM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M/re1CNFx5F+jw5e7H70TQm+ufe0OmJINW10yJMxMNdQd6dei7Wi3SIjNXfFULUHE
	 NmrQ/FsZDckcUX5QOMTs7NrkQpqnj9eMvf+7EReGAe23ywcw0imqF4Yyfu6+6r397I
	 vAPDO15efrbNI5y9CeSzoTOH6uJ0X6lEOHZXs4QyP/6o0AnfbOfGrz8OozhjbJAEHg
	 zyqPmX8vPPf0JIWiUejsZ6MCR1MjJkn75+AB9ziSX/VXe822CHdSJcVvoU/e6LzCHm
	 tdsBSLjxPLHv5RsbL/RIMNBzaHIyAAJDZpvmWpic1fH4ECcYZY5nHB4eViVua5/5zg
	 RSzx2HorV+WuQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ABF4017E0B25;
	Tue, 11 Mar 2025 10:14:44 +0100 (CET)
Message-ID: <16f6a6e2-4dce-4af9-bc0a-61c4d6213f02@collabora.com>
Date: Tue, 11 Mar 2025 10:14:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] drm/panfrost: Add support for AARCH64_4K page
 table format
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
 <20250310195921.157511-5-ariel.dalessandro@collabora.com>
 <20250311090545.3b941567@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250311090545.3b941567@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_021447_250430_B0D74652 
X-CRM114-Status: GOOD (  16.82  )
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

Il 11/03/25 09:05, Boris Brezillon ha scritto:
> On Mon, 10 Mar 2025 16:59:19 -0300
> Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:
> 
>> Currently, Panfrost only supports MMU configuration in "LEGACY" (as
>> Bifrost calls it) mode, a (modified) version of LPAE "Large Physical
>> Address Extension", which in Linux we've called "mali_lpae".
>>
>> This commit adds support for conditionally enabling AARCH64_4K page
>> table format. To achieve that, a "GPU optional configurations" field was
>> added to `struct panfrost_features` with the related flag.
>>
>> Note that, in order to enable AARCH64_4K mode, the GPU variant must have
>> the HW_FEATURE_AARCH64_MMU feature flag present.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_device.h |  16 +++
>>   drivers/gpu/drm/panfrost/panfrost_mmu.c    | 132 +++++++++++++++++++--
>>   drivers/gpu/drm/panfrost/panfrost_regs.h   |  34 ++++++
>>   3 files changed, 169 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
>> index cffcb0ac7c111..0385702aa43c7 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
>> @@ -42,6 +42,14 @@ enum panfrost_gpu_pm {
>>   	GPU_PM_VREG_OFF,
>>   };
>>   
>> +/**
>> + * enum panfrost_gpu_config - GPU optional configurations
>> + * @GPU_CONFIG_AARCH64_4K: Use AARCH64_4K page table format
>> + */
>> +enum panfrost_gpu_config {
>> +	GPU_CONFIG_AARCH64_4K,
>> +};
>> +
>>   struct panfrost_features {
>>   	u16 id;
>>   	u16 revision;
>> @@ -95,6 +103,9 @@ struct panfrost_compatible {
>>   
>>   	/* Allowed PM features */
>>   	u8 pm_features;
>> +
>> +	/* GPU features */
>> +	u8 gpu_configs;
> 
> I would probably name this gpu_quirks, with the GPU_CONFIG_AARCH64_4K
> flag renamed GPU_QUIRK_FORCE_AARCH64_PAGE_TABLE.
> 

Boris, at this point the quirk should be LPAE, not AARCH64_4K, because the
former is legacy...

I think that Ariel is right in this, as in, that's a capability of the GPU
MMU, so if anything I would rather rename it to gpu_capabilities, but then
that'd be confusing for other stuff - which means that gpu_configs is most
probably the least confusing and/or most appropriate name for this.

Of course, just IMO.

Cheers,
Angelo

>>   };
>>   


