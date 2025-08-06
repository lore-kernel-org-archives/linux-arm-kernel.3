Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A64C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beiS7t+GzME6HrCWrDxFg4QAgrnHKblwzktiAUMZhgg=; b=G8XlrGiycXoDeurDQjGwN/qMq4
	oTgWe9wpgncBCGyooxxtvp8snIB+ErOmz+ux0E9KafHq3bz7I/2Wpp8uz6txqfPnwoBW01qGRtqRC
	6F6aPk33DY6pAvXHEr0XhZTxhszXTOIx8+EBWOuYNRVNAsQBhSz7/v0afUjZ0JGyO+whjxAWmKFEf
	C/lOgfpV3eBdgDmOcGJMCxrLUWX8ot1lpRZfnJwvH43m+sSMBTurHChE3C1+j6cOO6Q0M+VVr488b
	J+4gGc+HwlIiL1hN+I5v5Tf99XOTULF9SsawsgQs0bUdPXo2fT46WXHBEX/i9lJr0BJ6y02oYdsob
	WCvvqRxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujigi-0000000G2e5-0O9w;
	Wed, 06 Aug 2025 18:16:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiVI-0000000G19B-3xRK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 18:04:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4398F176C;
	Wed,  6 Aug 2025 11:04:36 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D27493F738;
	Wed,  6 Aug 2025 11:04:38 -0700 (PDT)
Message-ID: <897b0cde-79b7-403b-91b2-7688cfd3f893@arm.com>
Date: Wed, 6 Aug 2025 19:04:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 16/36] arm_mpam: Add MPAM MSC register layout
 definitions
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
 Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 "shameerali.kolothum.thodi@huawei.com"
 <shameerali.kolothum.thodi@huawei.com>,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 Jamie Iles <quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
 "peternewman@google.com" <peternewman@google.com>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "amitsinght@marvell.com" <amitsinght@marvell.com>,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-17-james.morse@arm.com>
 <OSZPR01MB87980409C12B21D619324C5E8B51A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <OSZPR01MB87980409C12B21D619324C5E8B51A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_110445_022184_99AA23E0 
X-CRM114-Status: UNSURE (   7.78  )
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

Hi Shaopeng,

On 17/07/2025 02:04, Shaopeng Tan (Fujitsu) wrote:
>> Memory Partitioning and Monitoring (MPAM) has memory mapped devices
>> (MSCs) with an identity/configuration page.
>>
>> Add the definitions for these registers as offset within the page(s).

>> diff --git a/drivers/platform/arm64/mpam/mpam_internal.h
>> b/drivers/platform/arm64/mpam/mpam_internal.h
>> index d49bb884b433..9110c171d9d2 100644
>> --- a/drivers/platform/arm64/mpam/mpam_internal.h
>> +++ b/drivers/platform/arm64/mpam/mpam_internal.h
>> @@ -150,4 +150,272 @@ extern struct list_head mpam_classes;  int

>> +/*
>> + * MSMON_CFG_CSU_CTL - Memory system performance monitor configure
>> cache storage
>> + *                    usage monitor control register
>> + * MSMON_CFG_MBWU_CTL - Memory system performance monitor
>> configure memory
>> + *                     bandwidth usage monitor control register
>> + */
>> +#define MSMON_CFG_x_CTL_TYPE           GENMASK(7, 0)
>> +#define MSMON_CFG_x_CTL_OFLOW_STATUS_L BIT(15)
>> +#define MSMON_CFG_x_CTL_MATCH_PARTID   BIT(16)
>> +#define MSMON_CFG_x_CTL_MATCH_PMG      BIT(17)
>> +#define MSMON_CFG_x_CTL_SCLEN          BIT(19)
>> +#define MSMON_CFG_x_CTL_SUBTYPE        GENMASK(23, 20)
>> +#define MSMON_CFG_x_CTL_OFLOW_FRZ      BIT(24)
>> +#define MSMON_CFG_x_CTL_OFLOW_INTR     BIT(25)
>> +#define MSMON_CFG_x_CTL_OFLOW_STATUS   BIT(26)
>> +#define MSMON_CFG_x_CTL_CAPT_RESET     BIT(27)
>> +#define MSMON_CFG_x_CTL_CAPT_EVNT      GENMASK(30, 28)
>> +#define MSMON_CFG_x_CTL_EN             BIT(31)
>> +
>> +#define MSMON_CFG_MBWU_CTL_TYPE_MBWU
>> 	0x42
>> +#define MSMON_CFG_MBWU_CTL_TYPE_CSU
>> 	0x43

> MSMON_CFG_CSU_CTL_TYPE_CSU?

Yup, copy-and-paste error. Thanks!


James

