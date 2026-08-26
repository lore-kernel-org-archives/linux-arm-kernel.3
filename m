Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB95C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 17:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cF2ObdGfsb68PRigF5kDWtjibcdTOJHY9W6xpmS42m0=; b=CcreM0gAZkPjs7gFtDF2HD1WJ1
	2AKkCU4DVuoPQTE/eBaHuotpUEFwEtOQt/QFMAyssprz1MwrNTdLR2z7gw2EZsPjvDCVSO7rH26Y8
	XIPbeU2fam0LiVG7Spndj3rKEnSO7V+PiDauUbWGNOsPvcRYirMwAExTFZq4LlGvD2BtNw9BwDGYB
	x1xIdWpt8If8nsyn8jwmgFTdySuZ+03HKKwPVlQ4A2bK9CSwSWQo99xSlWRSWsoNtgi56Qxjbkke6
	PdWWb3K1xvkluqQZRjpsoQSi1I6rXzFMAzcJAoiAi1mhFGC7DWWlQAJv8hCa2WNtlQrhVyRdpDPB9
	cMAJCbaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzHbB-00000002pWn-36T6;
	Wed, 26 Aug 2026 17:39:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzHb8-00000002pWD-11GZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 17:39:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGuq1e424887
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 17:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cF2ObdGfsb68PRigF5kDWtjibcdTOJHY9W6xpmS42m0=; b=TtQOLEGzH9pt8AOx
	7brr/MLYU/Lp/wc+sHhQKaLpDe7GK+mBavMrbFcY6Yx3FH8VnTgQyn5M18kbGRE8
	5r2agtr5TaY4S+Knlb1KQBIFqV7RLgzuxh1XsxCRcytRB4ELxrFrSygBWznpedER
	jfYzUSywIS1sUsUMn7r2RAcc001/Z2Pu2jPVCPy9m9vPCtxUnTsPIw6UwUoeG+o7
	zLdBGx/+vbID1Jjj1zetAE5HOkC9RbiHwGTmzdwufY5zaEK5RLI0unrMWlcx5nnl
	FaZNk+hpK1aLOtuYUVePCkwp37lOoDs+XgqNFI6ySliv/kxYX45cOfDY/gg1RkQX
	AM4ibw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqsx5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 17:39:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d52734fc41so25051845ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 10:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787765977; x=1788370777; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cF2ObdGfsb68PRigF5kDWtjibcdTOJHY9W6xpmS42m0=;
        b=hWhI4nW9YoDF80eanT50FAc7uHzD313kQNCb+QlkAfv7WKPixdXR5L/a3k1SiAjTk8
         P5c72wt6+0W0NNcTz+XLFAl0AKdfWOJmcv/b2WXXKfgvMJDHxQe8njrShfA0KC0hWbDw
         JQ2cSNh2xZp/n0k2zbUw68ecwUOd3D8heHAZ0aDleZL1PBX5Odi50NKQozCtjru+2Oct
         ++4VxPoFHOlYnOpah86xLnQ0AJHX5qYLfj/j9hxQrK4bBQadx0s3yaiT6XpSpdskNC8x
         jrlW7uYjgXhhGKkKbitJfKqTZAQvkAuuLwxdEPkLTDMGyuBoWflKfdNhJJW27snwLvw3
         vTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787765977; x=1788370777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cF2ObdGfsb68PRigF5kDWtjibcdTOJHY9W6xpmS42m0=;
        b=KQDgLauixuZ0bm70ix1lmsjyMtmD7v2+sVmuU3PI2PpEQkGIK4hk0vSbd5UNpeOUGI
         2AwyMAYNIvK8o+waZoTacIawbvGJOGFHB67xtP8nBabxwBHmDFECDK6x+fVjdOmWVmiY
         R8yy9HidHeEE4MXust/3s2Nna/MqXzeSHBQOcd3i+3r+6SO6luMcGai/vp0vo6fM3gsI
         Pwb160rQl5nIqpWO/N9nHosjuwN5RN9UaThIllHbUkcqwYX1Y3CXtcbmfLaqwtdiKRb0
         FG7ancKIjchDJrNZQbD/MyT3wDgUhhVzNp9FvFwZgzTZ8WWpjRrxvD7sAsAIIWSsCsbd
         NGug==
X-Forwarded-Encrypted: i=1; AHgh+RoiNzpFy3fMLl4bSySLemlV/5MPk+yrasWTu0oN5MheNDCcP0rUffOPLk/4WQB2G71Jwo8D/F5MrP9d4+OWOE8g@lists.infradead.org
X-Gm-Message-State: AFuF++kXDlFq3YnC/LLv8xtYNWWF9ncmOrTuIeTZMrzXr0/udoVBVaR1
	sw3DG5RAIq6RAUClQaQQA38gM6F1QzeeZbAlrXPlPxNOE9Tc8nCStGCYuExvoUoLZibOLVyMRV2
	Q9t8jJEAa1H8M/g4tMIcvvqOc8vaouGgV+j5H/g1vMXjr8MeBoYpV2T4gdeL9Fh5Nt+eH5Fn+UV
	4wcQ==
X-Gm-Gg: AR+sD10Ei+Z6SqE3sbI2VSFgLFhYHm0DMxZaQXEHB4oLzMWuog5qgsRi2zdNDUrK3WU
	7DdTIlFkq0jmHnweQMztknkbffPXingpetXPIua9B7YGZkUhDbE7s+RSeiZU7YpqebOYTNe5s5M
	j7d8RmQP4hMqcGyPOB28TTWVM2E3AgTFBQov6IjxYVHhigYcuX+dg1swHCgmEYeGWvXNJAi7VBj
	N0633/PkTI9IYacbxJLPc8sO8Y970CjOYFvg+9THd5/q0wQDFp32waDQus9ojvuQoYqORDNZqcL
	Z8J+bp82fk31E7Phm+rTpjkXP2QBf1Awe1EDFqP5PnrAcRrEf7m2akNvh5BBP/nMOMBW1OtcryH
	Yu6JL3TEWvyeTjEOLIIxYg6F4sG5fb/59EycqEJWyZHtkg8+sPGJf9RJAOs5/wetWZvzS2xQ3SY
	DPwK2sZCRyRVHKBdV+9g==
X-Received: by 2002:a17:902:ebd2:b0:2d6:61a1:822 with SMTP id d9443c01a7336-2d707af8b52mr47154605ad.10.1787765977026;
        Wed, 26 Aug 2026 10:39:37 -0700 (PDT)
X-Received: by 2002:a17:902:ebd2:b0:2d6:61a1:822 with SMTP id d9443c01a7336-2d707af8b52mr47153405ad.10.1787765976584;
        Wed, 26 Aug 2026 10:39:36 -0700 (PDT)
Received: from [10.50.45.102] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70497753csm10214575ad.18.2026.08.26.10.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 10:39:36 -0700 (PDT)
Message-ID: <ecccf96f-e201-4dc0-8f61-7ebc6b9a9d4b@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 23:09:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/12] arm_mpam: add MPAM-Fb MSC firmware access
 support
To: Andre Przywara <andre.przywara@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma <ritwick.sharma@arm.com>, Gavin Shan <gshan@redhat.com>,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260807105451.3728284-1-andre.przywara@arm.com>
 <20260807105451.3728284-11-andre.przywara@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20260807105451.3728284-11-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0NyBTYWx0ZWRfXz6OUAoerQuK/
 L247immBp1P8D2G0GdT7oxavw51apFXcvP6l37peOjyRrR3ccw1gQge9H/mH6bsjKn2oipO8d6j
 74Fymyq0iyyu9M3W+eDWPOCJUN+BIpE=
X-Proofpoint-ORIG-GUID: MoTMhhkDUkmmyrEbf5tH33pRUKgMZUVb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0NyBTYWx0ZWRfX4wuxYinWB0P0
 ACP8733DDYl52VWz0Al0pO4yMYYqiiaJUMjw6HYhNhqLy2tFPy7sC3pvEBVfy3LMEi95ZDZtmqy
 WqO9FMfsiQd/qzpwdRkh4UT2ZKvmaFS+jfp8hG+I1Wy1+ghdftTefEygBcQChctD1uL6C4yrXIk
 S0ENENH10dZbVgxy7oKoeLPQUOjYlW8IqdjMIphj8oPV4H5h1e01gMhtsNS3XWzLN7TQr++KAFh
 VJPOnPBQJBGV3cZcAxCcu6Ijbf0CE21NimB+Mi7b5hZncKbgfEdMAIctjO3RwDwnWsT6XjXDA+A
 Y+zGoBgt84P43Fk67J7S97Cvk3QoHQ125tnx988BlJidoCxnzBO1EDmSoRV7clNq/2RYyLiaSSh
 e/9Pgi+r2+pjLQGack/i2kMcRHVqJ+1AJ8nhzl4r05T80Vel7biTSWX9pPuRi6lj2GxS9duwgei
 mUxh1Hp5TiVqK7yKGgA==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8f24d9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=y8rQOhXNOWzMl4_LRjcA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: MoTMhhkDUkmmyrEbf5tH33pRUKgMZUVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_103938_426855_9D336E1F 
X-CRM114-Status: GOOD (  21.83  )
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



On 8/7/2026 4:24 PM, Andre Przywara wrote:
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
> Tested-by: Ritwick Sharma <ritwick.sharma@arm.com> # on Arm AGI CPU
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
> ---
>   drivers/resctrl/Makefile        |   2 +-
>   drivers/resctrl/mpam_devices.c  |  65 ++++++++--
>   drivers/resctrl/mpam_fb.c       | 211 ++++++++++++++++++++++++++++++++
>   drivers/resctrl/mpam_internal.h |  18 +++
>   include/linux/arm_mpam.h        |   2 +-
>   5 files changed, 284 insertions(+), 14 deletions(-)
>   create mode 100644 drivers/resctrl/mpam_fb.c
> 
> diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
> index 4f6d0e81f9b8..097c036724e9 100644
> --- a/drivers/resctrl/Makefile
> +++ b/drivers/resctrl/Makefile
> @@ -1,5 +1,5 @@
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>


