Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E06ECCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 05:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztpItGhwww+01uRB/XGbeu2VJa1PsaWtSMm/a8Jc9UA=; b=bpO3CBiym5U7PiPh4bWcNMfeKd
	HEArh17wAEfAt+2zeJqZp2v6bx1Mcer/L0MALFCJi0OUGn4QklSZwU6VqmuJnIa4YMjq43DyBTybY
	T593tdkS+TwSEdACwj96teaQEOKo0bae8T8ATHnKrmtPk5TvcJ+NuZAPshYCS4JQqSoryHrO9WJfn
	UQP/ZGfgW2a3+TP03qxL68n3g6nMa4/cmxQaibef84fnxiPyp11CSFO6FK+ST7sFDGKb2whaNd0kJ
	b5iQlBLzZnhRrEG3AsMjiaVF9IuixIuZxXn73YY4lUItjY9Vyt3Wc+FjcCmOY2kKWHumN2hSpJJte
	3AxUHaKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dLo-00000006enT-47X3;
	Fri, 17 Oct 2025 05:50:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dLl-00000006emF-1yB1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 05:50:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLriM029768;
	Fri, 17 Oct 2025 05:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ztpItGhwww+01uRB/XGbeu2VJa1PsaWtSMm/a8Jc9UA=; b=VGUzWsCvGWj7/I0Z
	Ns751LEKWSzQ1ywcD3Z4hNO9usHbwML9/8Yj4YTo4mXEVoJ0SlUFSsqltUd3kW4Q
	EgouTddfKYs+2uAmBHv3gbTD4ff9HNHv1reSdm6cR29wUHFs0eiq/0Y1SL9q3mWv
	TX5EN0ulh/cFSDpO5ri5tWRsxL7RzNc5mqO8EhBG5AZsM3dVBYUYFkiGXgF9/UTm
	5y9fk9fJCNaoloJCvVgnkqWzXheL7P+/41fvbhZ4uMhj5Ne2lvfq4ziAlBrO/khu
	Db0FAYCl2P+axPsvW/4SdnvNVN2kziNRNg17HKmz9bw7lhInesBoIPhSnIWA2Iyd
	7dja3A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49u1h0tndj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 05:49:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59H5nvla023962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 05:49:57 GMT
Received: from [10.217.217.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 16 Oct
 2025 22:49:54 -0700
Message-ID: <38b8468f-5006-46a3-a4ea-28e6692ef14a@quicinc.com>
Date: Fri, 17 Oct 2025 11:19:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Change CONFIG_SM_TCSRCC_8750 from m to
 y
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Taniya Das
	<taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
        Ajit Pandey
	<ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        <linux-kernel@vger.kernel.org>
References: <20251017-update_defconfig_tcsrcc_sm8750-v1-1-34b1b47a0bda@oss.qualcomm.com>
 <30390038-0f90-48a4-befe-475cf88ba1fb@kernel.org>
 <37f54b76-a274-4ce2-aaa9-88ba0eb84199@oss.qualcomm.com>
 <90c8dda3-f753-43dc-8bb9-d03a808c8704@kernel.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <90c8dda3-f753-43dc-8bb9-d03a808c8704@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=esXSD4pX c=1 sm=1 tr=0 ts=68f1d906 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=22LTnq53JQY8k29RJeMA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: cl2Y7Ne2T2beiKdQr943SjgL5kn2S_rK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDA5OSBTYWx0ZWRfX4yP9JSGXZzhC
 xtlIL6U7zGD8nUiQLTAU0QYt1zVD2ezRZeOMWzy2NgovQUHblxsXyp3CDS6LwWfdae+wWyksi8P
 TtSrG5XE1on41Lp+UwCe/i/JBdo48B7pGaAtRjkY0+vSE/rko3NmQo5f+X1xoXOYH78SpoZDBSe
 YBYAJ3tIA0Z03RLkmSePT4mN0/UN08gKLpMit5pxahkEXD4oAlOD50LI4EVBZ88QQ6ny0UgkH7e
 IqguT/znlpidnjp4fmPmxW/0fgjw5vcjsBm6rWYLWvDsyuQDhY2kLKwLEGxpxxtEqLYSJR7B16y
 YqqicEFFu8+x1bA7El53IJ0FfymJe5iOpp1vvGgJMdfNWsooCoYerHwV1QSVTZ1fwEH6XmYLUiC
 L8x8loYvD6bFaSiAFHfBetfCWqhuNg==
X-Proofpoint-ORIG-GUID: cl2Y7Ne2T2beiKdQr943SjgL5kn2S_rK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510160099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_225001_653162_7E7EB9D2 
X-CRM114-Status: GOOD (  19.05  )
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



On 10/17/2025 10:51 AM, Krzysztof Kozlowski wrote:
> On 17/10/2025 07:16, Taniya Das wrote:
>>
>>
>> On 10/17/2025 10:00 AM, Krzysztof Kozlowski wrote:
>>> On 16/10/2025 20:53, Taniya Das wrote:
>>>> The TCSR clock controller is required  during boot to provide the ref
>>>> clocks to the UFS controller. Setting CONFIG_SM_TCSRCC_8750 to y ensures
>>>> the UFS driver successfully probe and initialize the device.
>>>>
>>>> Without this change, the UFS subsystem fails to mount as a usable file
>>>> system during boot.
>>>
>>>
>>> That's not what I observed. UFS works fine, especially that it is a
>>> module, so no, this is not a desired change and explanation is not only
>>> insufficient but actually incorrect.
>>>
>>
>> Krzysztof, on Pakala MTP we are observing the below issue and it
>> requires the module of tscrcc to be loaded explicitly. This patch also
>> aligns to how it is on all other targets.
>>
>> /soc@0/phy@1d80000: Failed to get clk index: 2 ret: -517
>> [   10.496570] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
>> [   10.503660] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>> find vdd-hba-supply regulator, assuming enabled
>> [   10.514548] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>> find vccq2-supply regulator, assuming enabled
>> [   10.565955] platform 1d80000.phy: deferred probe pending: (reason
>> unknown)
>> [   10.573078] platform 1d84000.ufs: deferred probe pending:
>> ufshcd-qcom: ufshcd_pltfrm_init() failed
>>
> 
> 
> I don't and I am testing regularly, so I assume you have incorrect
> config. Maybe I have incorrect one (which works), but then commit msg is
> incomplete - you must explain the bug and provide proof that this is the
> correct fix for it.
> 

We have tried booting up recently and and that is what we observed. The
patch from 'm' to 'y' helps the UFS probe is successful and the rootfs
is picked from ufs partitions. I will add these fail & success log
snippets in the commit text.

[    0.000000] Machine model: Qualcomm Technologies, Inc. SM8750 MTP
....
[    3.133373] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
[    3.144480] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
find vdd-hba-supply regulator, assuming enabled
[    3.144585] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
find vccq2-supply regulator, assuming enabled
[    3.227770] ufshcd-qcom 1d84000.ufs: Resource ufs_mem not provided
[    3.238319] ufshcd-qcom 1d84000.ufs: MCQ mode is disabled, err=-19
[    3.244707] scsi host0: ufshcd
[    3.255170] scsi 0:0:0:49488: Well-known LUN    KIOXIA
THGJFLT2E46BATPB 0100 PQ: 0 ANSI: 6
[    3.272001] scsi 0:0:0:49476: Well-known LUN    KIOXIA
THGJFLT2E46BATPB 0100 PQ: 0 ANSI: 6
[    3.287011] scsi 0:0:0:49456: Well-known LUN    KIOXIA
THGJFLT2E46BATPB 0100 PQ: 0 ANSI: 6
[    3.304264] scsi 0:0:0:0: Direct-Access     KIOXIA   THGJFLT2E46BATPB
0100 PQ: 0 ANSI: 6
[    3.331545] sd 0:0:0:0: [sda] 121774080 4096-byte logical blocks:
(499 GB/465 GiB)


Thanks,
Taniya.


