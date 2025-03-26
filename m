Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5836DC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 23:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ps0LOA1rZ7tVmufDCYSMrXairdaApv+By0nwQ7sMedY=; b=0OVixZFDLrbJJ3aeP+9m+5C5pK
	OuiCGnVpSD4+AddANSelaJSLd9Gc/L9nXHbiVcoDb0kFbWqtyqIQloSsSSk87P/9V24VS5N3iO+H3
	3hoCF2isTJdv0WscAY5qv4D2nbMXOi+6o/h14EEqd3hURE/+F3ApzziBe7moOlyag7PMjryeLWLnT
	f0dsp51ycSdaDmJS8WDRVnh61HFl5ZLH8k9d2pSish6lP2zAO81xZHVGwdN3KKWnaZ71k35hc4yrG
	o+EdWItKQncGcyHP4RyVudTOl2OBMPaNrRfl4iwYp7Tl9pPQIGGNakYQJ+5V6hiInDKX0dHtD2g2B
	tOSk+TWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txaUv-00000009pC6-0BXa;
	Wed, 26 Mar 2025 23:49:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txaT9-00000009p3r-1oTc;
	Wed, 26 Mar 2025 23:47:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QEZeif009175;
	Wed, 26 Mar 2025 23:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ps0LOA1rZ7tVmufDCYSMrXairdaApv+By0nwQ7sMedY=; b=i6MOTzSTNCE6kcq0
	z3QjdhhefkggMJ+PAHxy99c8+2a0G3wM8j57GTjBOQcdR/Qj0Jn+5GF4zrMljEpd
	Ppz+oATOeUIvdGozA6Glvc2zaSOHb1KpfFYmAONa4G9QdX0fIKDaX6wVBNA24iXc
	jBa1hf/jNmeCiJ2/U1IuWLFz8I/LQoQl6j+6MwVK93ZNBYVirQpuAJFYTYhBb30L
	vduzbLgmjjs0GwfBQY860Yq2Xfhfzhx3AbXg8aAk1RdQd3XAiUXxHmrip3nczYsE
	Qf35K1azRml8QrvE2B1PSRwgEAQKcMwnU1I9K79tDq4Ylq3pJrBZuFSiC2bZlDZC
	gxFuig==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd4pqje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 23:47:16 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52QNlF9w002413
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 23:47:15 GMT
Received: from [10.46.162.103] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Mar
 2025 16:47:15 -0700
Message-ID: <ad246ef4-7429-63bb-0279-90738736f6e3@quicinc.com>
Date: Wed, 26 Mar 2025 16:47:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/1] scsi: ufs: core: add device level exception
 support
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>,
        Arthur Simchaev
	<Arthur.Simchaev@sandisk.com>,
        "quic_cang@quicinc.com"
	<quic_cang@quicinc.com>,
        "quic_nitirawa@quicinc.com"
	<quic_nitirawa@quicinc.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "minwoo.im@samsung.com" <minwoo.im@samsung.com>,
        "adrian.hunter@intel.com"
	<adrian.hunter@intel.com>,
        "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Bean Huo <beanhuo@micron.com>,
        Keoseong Park <keosung.park@samsung.com>,
        Ziqi Chen
	<quic_ziqichen@quicinc.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "Gwendal
 Grignou" <gwendal@chromium.org>,
        Eric Biggers <ebiggers@google.com>,
        open
 list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>,
        "moderated
 list:ARM/Mediatek SoC support:Keyword:mediatek"
	<linux-mediatek@lists.infradead.org>
References: <4370b3a3b5a5675bb3e75aaa48a273674c159339.1742526978.git.quic_nguyenb@quicinc.com>
 <SA2PR16MB4251229744D717821D3D8353F4A72@SA2PR16MB4251.namprd16.prod.outlook.com>
 <c5ab13ec-f650-ea10-5cb8-d6a2ddf1e825@quicinc.com>
 <0a68d437-5d6a-42aa-ae4e-6f5d89cfcaf3@acm.org>
From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
In-Reply-To: <0a68d437-5d6a-42aa-ae4e-6f5d89cfcaf3@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jOzoVN6oCqhmK4G6Uxv_ULe-2YdiwsRn
X-Proofpoint-GUID: jOzoVN6oCqhmK4G6Uxv_ULe-2YdiwsRn
X-Authority-Analysis: v=2.4 cv=QLZoRhLL c=1 sm=1 tr=0 ts=67e49204 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=PtWNw9R7xlkL8hu1AuQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_164735_479064_DFAD192F 
X-CRM114-Status: GOOD (  16.00  )
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

On 3/26/2025 3:49 AM, Bart Van Assche wrote:
> On 3/25/25 6:15 PM, Bao D. Nguyen wrote:
>> The existing "struct utp_upiu_query_v4_0" probably has a bug in it. It 
>> does not use the  __attribute__((__packed__)) attribute. The compiler 
>> is free to add padding in this structure, resulting in the read 
>> attribute value being incorrect. I plan to provide a separate patch to 
>> fix this issue.
> 
> Adding __attribute__((__packed__)) or __packed to data structures that
> don't need it is not an improvement but is a change that makes
> processing slower on architectures that do not support unaligned
> accesses. Instead of adding __packed to data structures in their
> entirety, only add it to those members that need it and check the
> structure size as follows:
> 
> static_assert(sizeof(...) == ...);
> 
Thank you for the info on this, Bart.
IMO, this response upiu data should be __packed because the data coming 
from the hardware follows a strict format as defined by the spec. If we 
support __pack each individual field which data may be read by the 
driver (the attribute read commands) and check the validity of their 
sizes, it may add some complexity?

Thanks, Bao

