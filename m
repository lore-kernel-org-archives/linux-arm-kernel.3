Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CF3C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 09:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZJFFFU75xnAfcL8zLuM4V6jHSfHq6sIXUl/50bulpc=; b=EginqqSEPEKrf9i/pm8gBGLk71
	Fa+pHVltB7GXiLFZSZwv+g4p3iMQOzGhBQvOxksia65uWil/0rvI3dVZcOneRkfgGn7z4yZ1A3P8c
	e+dC4vAwI0udOAZGcAksGSxRDANXcWHbDVuUr9jAxW/gsnuWlR4Lp705ovkj5nVttF2PRy7ixeR/I
	8AGnclDrTJZoaCsmyXkRIb4EJwKw58ZKDfTMTX/utHrNjqoLvX6gskcYnWwMYTH1bE26ujXBPb+UQ
	/yoSiee9tuyvd2TCGup68LFBJwMNo1YImaMiXAueveACKdjE9bOjkIyqkTr8XmiQp2KOB6w1MnNjv
	DRKD8o2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tupKU-00000008QHa-0HS4;
	Wed, 19 Mar 2025 09:03:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tupIn-00000008PuL-0qoH;
	Wed, 19 Mar 2025 09:01:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lfPp013111;
	Wed, 19 Mar 2025 09:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oZJFFFU75xnAfcL8zLuM4V6jHSfHq6sIXUl/50bulpc=; b=jPK/w8GxtQuXHbR/
	THyDFV+bjrPVEyCfjqnsr6kVT6Qb8xvw1dkTqSVcw54F+9D5EdKroUBYLswzFReX
	qcIG4oHmI8Chq2+eYPDqPi7iRT0e7/2QWdR2Zq+dEa59eceEb8tFbml1PBZB1oSq
	PiBAYrAcwVCcI4hGavpNQUW555lyNfOcZmeLxJrTJ679/7pb4KhoQ5VglYpWEjBo
	mtJ49UR8FdAuWUbmnFi38PYunzDCSlrV3EAUfUETHF6a8kR1Ea5y1nKyhhpj9ilB
	KZh5DZDcXO1/K11k68vKRxaol1zdp/qGuOJp3k63g00hKWc2ihfV71nJUXSKVtTC
	UdYSgA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtmtb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 09:01:08 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52J918qf015779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 09:01:08 GMT
Received: from [10.46.162.103] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Mar
 2025 02:01:07 -0700
Message-ID: <9cf88cda-cf9c-9dbd-d586-5463ce2a0cfc@quicinc.com>
Date: Wed, 19 Mar 2025 02:01:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/1] scsi: ufs: core: add device level exception
 support
Content-Language: en-US
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "quic_cang@quicinc.com"
	<quic_cang@quicinc.com>,
        "quic_nitirawa@quicinc.com"
	<quic_nitirawa@quicinc.com>,
        "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>,
        "bvanassche@acm.org"
	<bvanassche@acm.org>,
        "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
        "minwoo.im@samsung.com" <minwoo.im@samsung.com>,
        "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>
CC: "beanhuo@micron.com" <beanhuo@micron.com>,
        "ebiggers@google.com"
	<ebiggers@google.com>,
        "gwendal@chromium.org" <gwendal@chromium.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
        "quic_ziqichen@quicinc.com" <quic_ziqichen@quicinc.com>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "keosung.park@samsung.com" <keosung.park@samsung.com>,
        "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
        "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>,
        "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
References: <6109425449ac4d18249ce7254e4fa1252138a94a.1742369183.git.quic_nguyenb@quicinc.com>
 <61570104d58cef22716fefe459c0c45670108aad.camel@mediatek.com>
From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
In-Reply-To: <61570104d58cef22716fefe459c0c45670108aad.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vr39mJyDo-GZa-ntTDHhauSuOWF0_4ug
X-Proofpoint-ORIG-GUID: vr39mJyDo-GZa-ntTDHhauSuOWF0_4ug
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67da87d4 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=RWTcRH6CgHNVpisSJ_IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_020129_253639_77A9186E 
X-CRM114-Status: UNSURE (   8.48  )
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

On 3/19/2025 12:56 AM, Peter Wang (王信友) wrote:
> Hi Bao,
> 
> Could use atomic_t for counter protect?
Hi Peter,
Are you suggesting to convert the dev_lvl_exception_count type from u32 
to atomic_t type? Because the value of dev_lvl_exception_count is 
returned to the user space via the device_lvl_exception_count_show() 
using the sysfs_emit() function, keeping the dev_lvl_exception_count as 
u32 data type probably works better in terms of the format.

Thanks, Bao

