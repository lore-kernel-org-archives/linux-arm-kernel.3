Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EAFC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 09:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUlG3UNtQJExnVI2dfP6DGSLfDrec9VsYrxCHKK+B9Q=; b=OyRGmxO9LZL6Kk93VSb/Yl3lFt
	JMYpBHz8xIbBiJxhbGqUgVCwSBbdtwt/oMuWVdf4pO9+exhA6a1ITBpAq0ZQ+gUSJXU1ep4D3Htt8
	PJyc90ySov167DWAHM3xXPdxhx/PIk/fYzP9J/c4WrPqi4Bll42O2ybYeKjpxk/bzV8vXTqKI5+wr
	GX2UnVg1gHMscHRF9FGuqbfRNsVsKb0lr6GC9fISKzwj5bKcm2s7699S/IX/Kutvh7wcqSl3P++8m
	soOUR7xXwkG4C2aGD7FDpDKdaTZxMGiT8a7l6HO8EleMqn5IEqnvj57NsurMXLr3NmmTm+UBenN28
	AuHE7m4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfxl9-00000005m6o-0251;
	Thu, 06 Feb 2025 09:01:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwOW-00000005bZN-1Pee;
	Thu, 06 Feb 2025 07:33:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5163JoOM017544;
	Thu, 6 Feb 2025 07:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WUlG3UNtQJExnVI2dfP6DGSLfDrec9VsYrxCHKK+B9Q=; b=btVR24liqNCeM9Pr
	EtL5s5B+8EeiipP6Vg6GGPUkkKDE1MMbC3xyoyq3REh+1JVp9KskNuo/fHkey7FP
	rmVGhSThcXEmbAj6xloDDepk5LKAZ+yIEF0IABfBjT+hp4ngRXGeILgxExmt60uU
	7HoVQmVyJ5tnWVAtUPb7rRL/ASnTK+T9WJQCjbiDyn58fISm3eeBDQbVLypbMfoM
	dAHKtOfZv/koM0V5d36dTJFFMOAG3bu/zkHG8fKTu4FMHBgSouRhDzhR4SVMcH92
	vzUbxp5jK0VRvoRJrgtEeSv+vEyOV2TAAkETYtQNc3UMk5CvMxyUJnFbtxpGknc/
	55Owzw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mn2ygge1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 07:32:39 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5167WcmY004871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 07:32:38 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Feb 2025
 23:32:32 -0800
Message-ID: <a56ee502-658c-4189-a963-51b488da95a6@quicinc.com>
Date: Thu, 6 Feb 2025 15:32:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vop
To: Bean Huo <huobean@gmail.com>, <quic_cang@quicinc.com>,
        <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
        <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
        <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        Peter Wang
	<peter.wang@mediatek.com>,
        Stanley Jhu <chu.stanley@gmail.com>,
        "Manivannan
 Sadhasivam" <manivannan.sadhasivam@linaro.org>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Andrew Halaney
	<ahalaney@redhat.com>,
        Eric Biggers <ebiggers@google.com>, Minwoo Im
	<minwoo.im@samsung.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated
 list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
	<linux-mediatek@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
 <20250203081109.1614395-2-quic_ziqichen@quicinc.com>
 <ceeee4f93b22ab53c4243eec85449a95b0305c70.camel@gmail.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <ceeee4f93b22ab53c4243eec85449a95b0305c70.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HCq-x5_05vsA-b4SdG6bzT-DOJeaUXeF
X-Proofpoint-GUID: HCq-x5_05vsA-b4SdG6bzT-DOJeaUXeF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 clxscore=1011
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502060061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_233352_386112_E6357FFC 
X-CRM114-Status: GOOD (  12.65  )
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

Hi Bean,

Thanks for your review ~

-Ziqi

On 2/3/2025 5:37 PM, Bean Huo wrote:
> On Mon, 2025-02-03 at 16:11 +0800, Ziqi Chen wrote:
>> From: Can Guo <quic_cang@quicinc.com>
>>
>> Instead of only two frequencies, if OPP V2 is used, the UFS devfreq
>> clock
>> scaling may scale the clock among multiple frequencies, so just
>> passing
>> up/down to vop clk_scale_notify() is not enough to cover the
>> intermediate
>> clock freqs between the min and max freqs. Hence pass the target_freq
>> ,
>> which will be used in successive commits, to clk_scale_notify() to
>> allow
>> the vop to perform corresponding configurations with regard to the
>> clock
>> freqs.
>>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> 
> I have reviewed patches [1/8], [2/8], [3/8], [4/8] in the v2, since you
> just changed coding types, and typos , but no logic change in v3. Add
> my review tag agaion:
> 
> Reviewed-by: Bean Huo <beanhuo@micron.com>


