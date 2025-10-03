Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A507CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 21:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlnlmgOOT12GpfzucYvYIMK0TqyeJkc9z5qxx9XRYY8=; b=Vc+g91UF63tQbO4n7Xfg/t9V61
	PHRb7XW9RS7Dgh81ousb53Hz0OJ5rHG9BJJPbKaW0d6uFIogCZ8s/k8llJKD9lnaMv3hReq1jX0eN
	C72QaY4HX2p1BD7MqA/2LxdqSqlLjVbgXd9edBlH0BPNgDUQOgrIet4DCETGu6zY/ukQYgUFkMb8x
	QQB/jnUmGYvHBMs4dKJDLQS6+DIMr9sQUXSrvIj+7PwERUnyqqY3LJ82M1t7jIm6fl7kUYzqout+K
	+pzs0GyNJWQGI3lyMf72+toInLYlW4cd1jsHZqZvCrcOiT7c2W+HCMbUCu7Rvjy2mu9KZQhObGuHB
	nyolVWBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4n4E-0000000D8S0-0jo8;
	Fri, 03 Oct 2025 21:11:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4n4B-0000000D8Rb-1UlU;
	Fri, 03 Oct 2025 21:11:52 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593AuIIj006266;
	Fri, 3 Oct 2025 21:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VlnlmgOOT12GpfzucYvYIMK0TqyeJkc9z5qxx9XRYY8=; b=pvHZeJiVs9273E+a
	MKB9du1YD58L3VnG+boZHwnA/z7pQ8czFVDKbBHIbxy9se3oIEIy2cgKthO2ZbtX
	VqYhGdf823e29/tFy85dsaMqWWVV4wwnAI1FkBP2Dd+9W2dnuly5EuRzP/tpfB/T
	rE5PIELLjNbpRWPMYjst+SgQ7KoLi6/a+ilZc9f1qNF6QGgjWYgbgLHsSE3mPthT
	FioKhlUEhKb9/ez/EFsN0AyHt4s2RfrXErf7Mjo4jAaRqL3sARBM0PDsHfhaxayn
	m3cPCLln/UjtcCxg757AoBYYG2uVM7d6G8xKH7REflRmg41UK27L+uQB7bgsNuYC
	OmuGOA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pduqfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Oct 2025 21:11:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 593LBcHc010764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Oct 2025 21:11:38 GMT
Received: from [10.46.162.103] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Fri, 3 Oct
 2025 14:11:38 -0700
Message-ID: <4e58fa6c-ddec-a6a9-fb8b-5f4ffa12fbc3@quicinc.com>
Date: Fri, 3 Oct 2025 14:11:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 1/2] scsi: ufs: core: Remove
 UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk
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
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>
CC: "beanhuo@micron.com" <beanhuo@micron.com>,
        "chu.stanley@gmail.com"
	<chu.stanley@gmail.com>,
        "quic_mapa@quicinc.com" <quic_mapa@quicinc.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>,
        "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>,
        "mani@kernel.org" <mani@kernel.org>,
        "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
References: <cover.1759348507.git.quic_nguyenb@quicinc.com>
 <0f0a7d5518d29fc384aace558d2bf098d792e0db.1759348507.git.quic_nguyenb@quicinc.com>
 <450e834545af935010ffc4f9079e56e47851f197.camel@mediatek.com>
 <69a111a2-219e-e3d4-8b89-3400facc02e3@quicinc.com>
 <9706ab36ba82a2522931326e114155c027da5461.camel@mediatek.com>
From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
In-Reply-To: <9706ab36ba82a2522931326e114155c027da5461.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3c1VoxhXOBkTC4TMBzna8V3v2NIgBFn4
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68e03c0b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=bJ9VZFcO5FWJG7T8bRkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 3c1VoxhXOBkTC4TMBzna8V3v2NIgBFn4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX1n6USvtA4GKA
 4gP2OSfg06dxDVx/Br7mf3Nkka4psSRegTv7qkd6boyHDQDNV8r8lWcggJZJJcXNzvPadtXZVvx
 srIE/K+KvaNBXtgN7XuLhunD+RqZo62DqUSU8SD/ltpaSZDf+tPnHXNn/qyWUI2a5x5UwUoJOYd
 SJq2tWPU+tmqghle5BTOKcMqfULYS2Dv0AwqVOsmilb/40AdLSO6bAxXE3vzlPYD37tmclBNeUe
 FO3pQU6Hk+e4a2A+nhmuArmlDq5U1vvwDplIr/jYWM7q5jgHxJlhz0f+Mri0mGVb70lnF1/Mcmm
 17d66YGlBz0gaqHzWH+x+r8rJCfPRn8jLdcY4HEMUyrt23j4BFMFM4VOtaOTXXFaLS7/6kh85lz
 OR4nwwl6T+h7bSxQzccqrivaMO/ERA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_06,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_141151_435467_859C5322 
X-CRM114-Status: GOOD (  20.44  )
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

On 10/2/2025 8:10 PM, Peter Wang (王信友) wrote:
> On Thu, 2025-10-02 at 11:48 -0700, Bao D. Nguyen wrote:
>>
>>
>> Hi Peter,
>>
>> The current Mediatek platform driver applies this quirk to all ufs
>> vendors which is consistent with what we would like to do in the
>> Qualcomm platform driver per the vendor's requests.
>>
>> I do see that, about 5 years ago, Mediatek merged a patch to keep the
>> device vcc always on, probably to workaround some HW issues. Since
> 
> Hi Bao,
> 
> Yes, some UFS devices may have issues when turning off VCC.
> 
>> this
>> is a very old patch and the impact of this change on a broken
>> hardware
>> is minimal, I would like weight the benefit of cleaning up the ufs
>> core
>> driver by removing the unnecessary quirk
>> UFS_DEVICE_QUIRK_DELAY_AFTER_LPM vs the inconvenience of a 5ms
>> (potentially reduce to 2ms) delay impact it may cause on an old
>> broken
>> HW in the suspend/shutdown path.
>>
>> I believe removing the UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk in the
>> ufs
>> core driver as well as all the platform drivers yields positive net
>> benefits in this case.
>>
>> Thanks, Bao
>>
>>
> 
> I think you misunderstood my point.
> I am okay with removing this flag, but this patch will cause
> devices with VCC always on to unnecessarily wait for the
> delay, resulting in wasted time.

Are you referring to the always_on flag in the struct ufs_vreg? I 
believe currently the ufs_vreg's always_on flag isn't used in 
determining whether the delay is applied or not.

How about we add the check for the Vcc's always_on as shown below?
The Mediatek's workaround can avoid the extra delay by setting the 
always_on flag as it already did, without using the 
UFS_DEVICE_QUIRK_DELAY_AFTER_LPM.

if (vcc_off && hba->vreg_info.vcc && !hba->vreg_info.vcc->always_on)
	usleep_range(5000, 5100);

Thanks, Bao

> 
> Thanks
> Peter
> 
> 


