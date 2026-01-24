Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66C2D77898
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 00:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EooaXTHikFgY2c5b/5Qui7RI5PR9D7e9Nlkv9UbFGyY=; b=BDW8XixqIG18G7I6RlWy28u1hx
	BjebQKDGaNBvbzY9RPnS/t09fJRm4iq/NOVy1/5tivKhD39z8cfuQWYUAOtes9z8fwgundfMcZXY4
	P7yhXEtGQCE9nf5RWE7gCm36aYh/0Cs5jtubx+InlwOdxcpUHeK66OCUJxwaJ9NLWUkt9jgqYKEJO
	5STzOrAkHAJVuKNpCCN6i5JIcEm64MhODYfa7oxP04fmUPYb5mZrfC7vkJNzv7Z4RGtrG67K8wgUq
	BHmD7g4UrwJWavq8p2Tc3obTj/ujhm8RiWqnhoWadtYfhwOk0Rntgr1yrVPtGoapY/v14lAE4d04z
	clQv2v4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjRg5-00000009e1l-1BBO;
	Sat, 24 Jan 2026 00:39:01 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjRg2-00000009e1O-2iW6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 00:38:59 +0000
Received: from [100.75.32.59] (unknown [40.78.12.246])
	by linux.microsoft.com (Postfix) with ESMTPSA id E61B920B7167;
	Fri, 23 Jan 2026 16:38:56 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E61B920B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1769215137;
	bh=EooaXTHikFgY2c5b/5Qui7RI5PR9D7e9Nlkv9UbFGyY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ua9n+eZshb41iJSM0VepkPNs2akDdspbcAC+KpkJ1vXE7KN85qAmzy6YXLGgxOWrM
	 HFbL7ENaTscuSs5mfxkV9jRnHPj0JaJyBcfZXN0vSEsHue2qBzucYEkZivymiUUWaI
	 8ogGB/QBfff0uau+8//BaoY1uYmIDQBKP/Io8ejA=
Message-ID: <669e56da-e27f-1dd7-e7d0-0323ae7beaae@linux.microsoft.com>
Date: Fri, 23 Jan 2026 16:38:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v0 09/15] mshv: Import data structs around device domains
 and irq remapping
Content-Language: en-US
To: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-pci@vger.kernel.org, linux-arch@vger.kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 longli@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, joro@8bytes.org,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, bhelgaas@google.com, arnd@arndb.de,
 nunodasneves@linux.microsoft.com, mhklinux@outlook.com,
 romank@linux.microsoft.com
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
 <20260120064230.3602565-10-mrathor@linux.microsoft.com>
 <aW_-9KO2DrVvmvSs@skinsburskii.localdomain>
From: Mukesh R <mrathor@linux.microsoft.com>
In-Reply-To: <aW_-9KO2DrVvmvSs@skinsburskii.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_163858_718911_4AF0E7CC 
X-CRM114-Status: GOOD (  13.65  )
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

On 1/20/26 14:17, Stanislav Kinsburskii wrote:
> On Mon, Jan 19, 2026 at 10:42:24PM -0800, Mukesh R wrote:
>> From: Mukesh Rathor <mrathor@linux.microsoft.com>
>>
>> Import/copy from Hyper-V public headers, definitions and declarations that
>> are related to attaching and detaching of device domains and interrupt
>> remapping, and building device ids for those purposes.
>>
>> Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
>> ---
>>   include/hyperv/hvgdk_mini.h |  11 ++++
>>   include/hyperv/hvhdk_mini.h | 112 ++++++++++++++++++++++++++++++++++++
>>   2 files changed, 123 insertions(+)
>>
> 
> <snip>
> 
>> +/* ID for stage 2 default domain and NULL domain */
>> +#define HV_DEVICE_DOMAIN_ID_S2_DEFAULT 0
>> +#define HV_DEVICE_DOMAIN_ID_S2_NULL    0xFFFFFFFFULL
>> +
>> +union hv_device_domain_id {
>> +	u64 as_uint64;
>> +	struct {
>> +		u32 type : 4;
>> +		u32 reserved : 28;
>> +		u32 id;
>> +	};
>> +} __packed;
> 
> Shouldn't the inner struct be packed instead?
> 
>> +
>> +struct hv_input_device_domain { /* HV_INPUT_DEVICE_DOMAIN */
>> +	u64 partition_id;
>> +	union hv_input_vtl owner_vtl;
>> +	u8 padding[7];
>> +	union hv_device_domain_id domain_id;
>> +} __packed;
>> +
>> +union hv_create_device_domain_flags {	/* HV_CREATE_DEVICE_DOMAIN_FLAGS */
>> +	u32 as_uint32;
>> +	struct {
>> +		u32 forward_progress_required : 1;
>> +		u32 inherit_owning_vtl : 1;
>> +		u32 reserved : 30;
>> +	} __packed;
>> +} __packed;
> 
> Why should the union be packed?

 From GCC docs:

Specifying this attribute for struct and union types is equivalent to
specifying the packed attribute on each of the structure or union members.

Thanks,
-Mukesh



> Thanks,
> Stanislav
> 
>> +
>> +struct hv_input_create_device_domain {	/* HV_INPUT_CREATE_DEVICE_DOMAIN */
>> +	struct hv_input_device_domain device_domain;
>> +	union hv_create_device_domain_flags create_device_domain_flags;
>> +} __packed;
>> +
>> +struct hv_input_delete_device_domain {	/* HV_INPUT_DELETE_DEVICE_DOMAIN */
>> +	struct hv_input_device_domain device_domain;
>> +} __packed;
>> +
>> +struct hv_input_attach_device_domain {	/* HV_INPUT_ATTACH_DEVICE_DOMAIN */
>> +	struct hv_input_device_domain device_domain;
>> +	union hv_device_id device_id;
>> +} __packed;
>> +
>> +struct hv_input_detach_device_domain {	/* HV_INPUT_DETACH_DEVICE_DOMAIN */
>> +	u64 partition_id;
>> +	union hv_device_id device_id;
>> +} __packed;
>> +
>> +struct hv_input_map_device_gpa_pages {	/* HV_INPUT_MAP_DEVICE_GPA_PAGES */
>> +	struct hv_input_device_domain device_domain;
>> +	union hv_input_vtl target_vtl;
>> +	u8 padding[3];
>> +	u32 map_flags;
>> +	u64 target_device_va_base;
>> +	u64 gpa_page_list[];
>> +} __packed;
>> +
>> +struct hv_input_unmap_device_gpa_pages {  /* HV_INPUT_UNMAP_DEVICE_GPA_PAGES */
>> +	struct hv_input_device_domain device_domain;
>> +	u64 target_device_va_base;
>> +} __packed;
>> +
>>   #endif /* _HV_HVHDK_MINI_H */
>> -- 
>> 2.51.2.vfs.0.1
>>


