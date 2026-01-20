Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654A9D2629F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 22:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dvl+8B7mnk1aPoHAx/TJDHGSG8tbL3V20aP8f8Vj3+E=; b=atapkkWL0DAxJOh/7YFp0HyjHd
	toZLN3dJlPybhpgE/MKGqtNO4hVKVZaN3wDintXMunC/RFkfP4rWjCoDj38MIvPlMbR5E80FNqPjG
	IvAExW2oSoUxVr1lzHn+eJQSqMvieZmXfLhhZ1lk+g/uA6S/NHAN3hJ5oHhOtIayZEQTFJgNyzbPD
	OXyWjzQbaKAU6EuQ9HOYCSL3ell3WgeD4LlsxuzYyQCPq2ZpK3TbDu6CsY0/JXz7NPUMnF9ggyXfM
	491tIv1PnCsNNqKQFv5dgxy1Ya544bAOeD8AbwYaiXO/W4ktD0LPVddjdd30t3jOKZ/ShvZdbPiDD
	ZEl0sriw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viK2T-00000004Wp6-2Qbz;
	Tue, 20 Jan 2026 22:17:29 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viK2Q-00000004Wj0-3Yze
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 22:17:27 +0000
Received: from skinsburskii.localdomain (c-98-225-44-182.hsd1.wa.comcast.net [98.225.44.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id BD17020B716A;
	Tue, 20 Jan 2026 14:17:25 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BD17020B716A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1768947446;
	bh=Dvl+8B7mnk1aPoHAx/TJDHGSG8tbL3V20aP8f8Vj3+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JoszuDD/aoCCFFZ1PTZGeW3UErubIvihzLaH1MOVE3lbw5m5bqG6G8ISinw57dkWF
	 0+uEhM/crqNkSWCAVY2utnIZ5oZZwqxYhxoUlzMH3ohKBbWL1cfLjanypp96A3blLE
	 0JCMTJ+CG8gaEvz06yNE4QhWWmM2FvT7zFlVXdrM=
Date: Tue, 20 Jan 2026 14:17:24 -0800
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
To: Mukesh R <mrathor@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, longli@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, joro@8bytes.org,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, arnd@arndb.de,
	nunodasneves@linux.microsoft.com, mhklinux@outlook.com,
	romank@linux.microsoft.com
Subject: Re: [PATCH v0 09/15] mshv: Import data structs around device domains
 and irq remapping
Message-ID: <aW_-9KO2DrVvmvSs@skinsburskii.localdomain>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
 <20260120064230.3602565-10-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120064230.3602565-10-mrathor@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_141726_937347_ECD1393F 
X-CRM114-Status: GOOD (  13.07  )
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

On Mon, Jan 19, 2026 at 10:42:24PM -0800, Mukesh R wrote:
> From: Mukesh Rathor <mrathor@linux.microsoft.com>
> 
> Import/copy from Hyper-V public headers, definitions and declarations that
> are related to attaching and detaching of device domains and interrupt
> remapping, and building device ids for those purposes.
> 
> Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
> ---
>  include/hyperv/hvgdk_mini.h |  11 ++++
>  include/hyperv/hvhdk_mini.h | 112 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 123 insertions(+)
> 

<snip>

> +/* ID for stage 2 default domain and NULL domain */
> +#define HV_DEVICE_DOMAIN_ID_S2_DEFAULT 0
> +#define HV_DEVICE_DOMAIN_ID_S2_NULL    0xFFFFFFFFULL
> +
> +union hv_device_domain_id {
> +	u64 as_uint64;
> +	struct {
> +		u32 type : 4;
> +		u32 reserved : 28;
> +		u32 id;
> +	};
> +} __packed;

Shouldn't the inner struct be packed instead?

> +
> +struct hv_input_device_domain { /* HV_INPUT_DEVICE_DOMAIN */
> +	u64 partition_id;
> +	union hv_input_vtl owner_vtl;
> +	u8 padding[7];
> +	union hv_device_domain_id domain_id;
> +} __packed;
> +
> +union hv_create_device_domain_flags {	/* HV_CREATE_DEVICE_DOMAIN_FLAGS */
> +	u32 as_uint32;
> +	struct {
> +		u32 forward_progress_required : 1;
> +		u32 inherit_owning_vtl : 1;
> +		u32 reserved : 30;
> +	} __packed;
> +} __packed;

Why should the union be packed?

Thanks,
Stanislav

> +
> +struct hv_input_create_device_domain {	/* HV_INPUT_CREATE_DEVICE_DOMAIN */
> +	struct hv_input_device_domain device_domain;
> +	union hv_create_device_domain_flags create_device_domain_flags;
> +} __packed;
> +
> +struct hv_input_delete_device_domain {	/* HV_INPUT_DELETE_DEVICE_DOMAIN */
> +	struct hv_input_device_domain device_domain;
> +} __packed;
> +
> +struct hv_input_attach_device_domain {	/* HV_INPUT_ATTACH_DEVICE_DOMAIN */
> +	struct hv_input_device_domain device_domain;
> +	union hv_device_id device_id;
> +} __packed;
> +
> +struct hv_input_detach_device_domain {	/* HV_INPUT_DETACH_DEVICE_DOMAIN */
> +	u64 partition_id;
> +	union hv_device_id device_id;
> +} __packed;
> +
> +struct hv_input_map_device_gpa_pages {	/* HV_INPUT_MAP_DEVICE_GPA_PAGES */
> +	struct hv_input_device_domain device_domain;
> +	union hv_input_vtl target_vtl;
> +	u8 padding[3];
> +	u32 map_flags;
> +	u64 target_device_va_base;
> +	u64 gpa_page_list[];
> +} __packed;
> +
> +struct hv_input_unmap_device_gpa_pages {  /* HV_INPUT_UNMAP_DEVICE_GPA_PAGES */
> +	struct hv_input_device_domain device_domain;
> +	u64 target_device_va_base;
> +} __packed;
> +
>  #endif /* _HV_HVHDK_MINI_H */
> -- 
> 2.51.2.vfs.0.1
> 

