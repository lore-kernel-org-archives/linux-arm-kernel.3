Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27049C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 06:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yP8yO/BRENtBx+IwrJFj34waJ33MmACcGPTviE5xVwE=; b=mNthlW7Ic7pItUitdQ5YHImCw0
	VWvC6Ere/LwMdMgeN/Lbb8tHaR/U3E8l0sqqg0D4Jmp/BHNiCvHBRfBAHvuU4LpCBf0myhIcHYmII
	aFajuo2lT2qLk+JaUuQwhERr1Yiumj6rNR7vrQjlrZ4O4p4vFBtYn7P2poI9GQfeRAr+3EDupeg4K
	7vPgL7I91uRMVZRw1oZrg41owiijaa9KUPZXw7i68lB42y19Tj5//edH3snAc6WDMPnWyXPFOpkC6
	Ijy80RoWhZsTZryP+GzRy9F56obWBCQHh2Bg5mRu5e6Hfj8v9vMiB7F7AZqfQaeZBSd5BbwVX9bQx
	9hOMAXPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8lU-000000017rT-0GRe;
	Tue, 04 Aug 2026 06:36:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8lQ-000000017q4-2aWw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 06:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785825395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yP8yO/BRENtBx+IwrJFj34waJ33MmACcGPTviE5xVwE=;
	b=XTPraDNzGSrZYnCIp1mXZ+PV3bITP46bIQihpPGWI17vR2MazR8Aer8B+UnD0l32YrOFxZ
	n/DTLijju5JA/imd00KbWognutLlNQuCg2V+xuM0K3+zQe5C9ait5Tjmg8gbbNvDqJQnnG
	3PB7OU6cJsE6oNFnqg0nYhw4sckgQk4=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-x5ITU43XPjGyMsqa2toxZg-1; Tue, 04 Aug 2026 02:36:23 -0400
X-MC-Unique: x5ITU43XPjGyMsqa2toxZg-1
X-Mimecast-MFC-AGG-ID: x5ITU43XPjGyMsqa2toxZg_1785825382
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc5faecf01so82633675ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 23:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785825382; x=1786430182;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yP8yO/BRENtBx+IwrJFj34waJ33MmACcGPTviE5xVwE=;
        b=tRGVU/4esVV/qDXD5k5W01VkAIt441st8BRbnW6CKB89lRpvvv+UbH/GcmeaCnzjlH
         pfrx6eIXY8JUf1GN2aGEppQ5+jJ1IVD/7fN6PYNt33KZ7B/msDTJbXrJ2oNJikrSoZDE
         5HPcTV18qLRcQaLohZjCRLSJ2xIBj7y1RLH8ayOqIEyxV0YBVeXYOZs5WnBJAP/0cuL2
         D/Z5GANLGDuHDN9sQcXwmWa2OfHsRdelY4IWN0wpZMhFz12bSNx1PnSCgUsRdMZbHUB7
         kleJWqlifoX/JZCp6K1vkBJuRaPSV1LxbF+dxowFeRlpasOQKgAfY7zOgDmmWN21oehy
         S17A==
X-Forwarded-Encrypted: i=1; AHgh+RrAUrr+DQt4ItjKFgFnsVMvOXRppg64uXN9TsQZClcmSsviqOikxQPdsz+uHWzVyGtfSaS6aaFGie5Uhjzv03Iu@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3tdP2JpD48HHSAKMQWUZ8YD/wSC7WcHoHtIPE2dK2si/HHoSw
	jtcXonDErOwxEZ2r2ytjZKLAj7MujkG4Wkui1ijRoypkXs0LC+ZVKcNvw5UY/nsBm2/LAGtvLh7
	rKvje7EnIa01nuqACDfc6C3G4VjPdZ6j2gjkDK/KZgjyjivyAs5rvFjaWCKX7r53JQ0BYTB05WG
	6a
X-Gm-Gg: AR+sD13IlouA+tQtPHwC1PNLObxd/3P6kYL7fE7jhJyrxDXmHsvXeUVLbs3wVz/IIn4
	qnjFSoOXI50mkm1dcgjewo76ODXDZODv8etV2C4SZqxtD2syrJnuojrXxyfdQiImSp3CTi2XN00
	9nctwPZjSjpZebVxDNflS9vsXjdVCnwaa543nmdGkrOAkL/i2BjJJOLtd8lsZ/SG75+y07zpqbT
	00PtxtEYa6IWRq6nPSlUplm6C0LbOf6uEC97eF2z7Q94W324xobGiImaLrPwVExTf1k39/sH2TX
	X+TrJy/EUPtxTBhtVOBFj1jPa6bUtpbFWMoSi75loKuVNejISEVcW+nTKwDi0G0HUQScBBDkJs2
	droDgr/ybqHuwieJjcgTuBRPcDY+h1BYZe1aktCDZWgM=
X-Received: by 2002:a17:903:3810:b0:2cf:b23a:3e6e with SMTP id d9443c01a7336-2d0524740cfmr132333565ad.40.1785825382409;
        Mon, 03 Aug 2026 23:36:22 -0700 (PDT)
X-Received: by 2002:a17:903:3810:b0:2cf:b23a:3e6e with SMTP id d9443c01a7336-2d0524740cfmr132333335ad.40.1785825381970;
        Mon, 03 Aug 2026 23:36:21 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4fb5f4sm503705ad.84.2026.08.03.23.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 23:36:21 -0700 (PDT)
Message-ID: <ac199749-e90a-4077-9fef-c7b3adff71c9@redhat.com>
Date: Tue, 4 Aug 2026 16:36:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/11] arm_mpam: add MPAM-Fb MSC firmware access
 support
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260731170324.2927758-1-andre.przywara@arm.com>
 <20260731170324.2927758-10-andre.przywara@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260731170324.2927758-10-andre.przywara@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7oHZlIYA6pQT2FBBL3xVWlx1P173UyRk5Mk8UpFMHvs_1785825382
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_233636_758472_4C3626E7 
X-CRM114-Status: GOOD (  25.29  )
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

Hi Andre,

On 8/1/26 3:03 AM, Andre Przywara wrote:
> The Arm MPAM Firmware-backed (Fb) Profile document[1] describes an
> alternative way of accessing the "Memory System Components" (MSC) in an
> MPAM enabled system.
> 
> Normally the MSCs are MMIO mapped, but in some implementations this
> might not be possible (MSC located outside of the local socket, MSC
> mapped secure-only) or desirable (direct MMIO access too slow or needs
> to be mediated through a control processor). MPAM-fb standardises a
> protocol to abstract MSC accesses, building on the SCMI protocol.
> 
> Add functions that do an MSC read or write access by redirecting the
> request through a firmware interface. For now this done via an ACPI
> PCC shared memory and mailbox combination.
> 
> Since the protocol used is only a small subset of the full SCMI spec,
> and the SCMI protocol has no full ACPI support anyway, open-code the
> (simple) SCMI message generation, for just the fields we need.
> 
> [1] https://developer.arm.com/documentation/den0144/latest
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Tested-by: Ritwick Sharma <ritwick.sharma@arm.com>
> ---
>   drivers/resctrl/Makefile        |   2 +-
>   drivers/resctrl/mpam_devices.c  |  57 +++++++--
>   drivers/resctrl/mpam_fb.c       | 209 ++++++++++++++++++++++++++++++++
>   drivers/resctrl/mpam_internal.h |  18 +++
>   include/linux/arm_mpam.h        |   2 +-
>   5 files changed, 275 insertions(+), 13 deletions(-)
>   create mode 100644 drivers/resctrl/mpam_fb.c
> 

[...]

> diff --git a/drivers/resctrl/mpam_fb.c b/drivers/resctrl/mpam_fb.c
> new file mode 100644
> index 000000000000..61a91c6cec0a
> --- /dev/null
> +++ b/drivers/resctrl/mpam_fb.c
> @@ -0,0 +1,209 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2024-2026 Arm Ltd.
> +
> +#include <linux/arm_mpam.h>
> +#include <linux/cleanup.h>
> +#include <linux/errno.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +
> +#include <acpi/pcc.h>
> +#include <asm/mpam.h>
> +
> +#include "mpam_internal.h"
> +
> +#define MPAM_FB_PROTOCOL_ID		0x1a
> +
> +#define MPAM_PROTOCOL_VERSION_CMD	0x0
> +#define MPAM_MSC_ATTRIBUTES_CMD		0x3
> +#define MPAM_MSC_READ_CMD		0x4
> +#define MPAM_MSC_WRITE_CMD		0x5
> +
> +#define MPAM_FB_ERR_SUCCESS		 0
> +#define MPAM_FB_ERR_NOT_SUPPORTED	-1
> +#define MPAM_FB_ERR_INVALID_PARAMETERS	-2
> +#define MPAM_FB_ERR_DENIED		-3
> +#define MPAM_FB_ERR_NOT_FOUND		-4
> +#define MPAM_FB_ERR_OUT_OF_RANGE	-5
> +#define MPAM_FB_ERR_BUSY		-6
> +#define MPAM_FB_ERR_COMMS_ERROR		-7
> +#define MPAM_FB_ERR_GENERIC_ERROR	-8
> +#define MPAM_FB_ERR_HW_ERROR		-9
> +#define MPAM_FB_ERR_PROTOCOL_ERROR	-10
> +#define MPAM_FB_ERR_IN_USE		-11
> +
> +#define MPAM_MSC_PROT_ID_MASK		GENMASK(17, 10)
> +#define MPAM_MSC_TOKEN_MASK		GENMASK(27, 18)
> +

Why we're not using GENMASK_U32() since the operand the message is 32-bits dwords? :-)

> +#define MPAM_FB_PROT_HEADER_LEN		sizeof(u32)
> +
> +static atomic_t mpam_fb_token = ATOMIC_INIT(0);
> +
> +static void mpam_fb_build_version_message(unsigned int token,
> +					  void __iomem *msg_buf)
> +{
> +	struct acpi_pcct_ext_pcc_shared_memory __iomem *pcc_shmem = msg_buf;
> +
> +	/* .signature is filled by the platform */
> +	writel_relaxed(PCC_CMD_COMPLETION_NOTIFY, &pcc_shmem->flags);
> +	writel_relaxed(MPAM_FB_PROT_HEADER_LEN, &pcc_shmem->length);
> +	writel_relaxed(MPAM_PROTOCOL_VERSION_CMD |
> +		       FIELD_PREP(MPAM_MSC_TOKEN_MASK, token) |
> +		       FIELD_PREP(MPAM_MSC_PROT_ID_MASK, MPAM_FB_PROTOCOL_ID),
> +		       &pcc_shmem->command);
> +}

static inline void writel_relaxed(u32 value, volatile void __iomem *addr) { ...}

The input value would be 'unsigned long', which is converted to 'u32'. If  GENMASK_U32()
is used to define MPAM_MSC_TOKEN_MASK and MPAM_MSC_PROT_ID_MASK, the unexpected conversion
can be avoided.

Thanks,
Gavin


