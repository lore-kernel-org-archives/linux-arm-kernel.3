Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DE7CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kiSYgOYyxORB21Hsjal1suikR0J5W+ut2yxpevDfr4k=; b=ynnhDY3tX89PmBM63UkGyYye4y
	3MJ39e2uM0oxywbCajSGavfP1j6kuEZ/xCFIdZFpeAD5En9qZpIeAzOsjq+jiU5gXB3pajBHr/rlJ
	9qLX//VEg+zRWebTW5dXKcl2m9QJZSB4iCi/VeE5OO8eTY9WxFn3bUAUJwIltStCqSk5RYHDSwZLB
	OdmbobBfsDegQ1ZFuhIdae0dhzoYiwF4unoECIENZrTkU247J8G041A9xd5s+vjXtnQX1YZaDbehP
	r1/pxBajz88wuoNkcvEsi4dQNOepdgD0pSUCYVIpSVdqKXDEeEjvm6LAiGWwfkYSEai+TOVoFOAIl
	b2YDYW4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eNR-00000006tTm-1Vay;
	Fri, 17 Oct 2025 06:55:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eNO-00000006tT1-24RC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 06:55:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLQVC001997
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 06:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kiSYgOYyxORB21Hsjal1suikR0J5W+ut2yxpevDfr4k=; b=WgTFadsGuoE0ISRb
	R6IP8bq2JghLey8v6+EmBsFhexvICq6PZDTzdy5dCDWMrWO3ufHVxTmHv8wf8E5r
	tP/IJ+Aq7aRXmLGeGRT5sGwqeTYvQNAE34hkmQVB/leI53E1Oi8ge9/S/3UgjMW1
	hwJ0Et99UAZcdXG+NddvHbfI4l75AQchr/jPi1yIFOenWMUROV7uE+c7gOSseOJZ
	pq0RIfQsoPW94BOK0ohYep6kaxOH82B78d4/9AR10HsvomdPulC23JN+fWQZocml
	dMcsDf7aEI6gDrKBmRALY2wrbeQigfuNhk3RbkOd7xaNakaHPd/rn6uS3EyiKln2
	r4XV1Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8k7cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 06:55:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33c6140336eso290413a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 23:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760684144; x=1761288944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kiSYgOYyxORB21Hsjal1suikR0J5W+ut2yxpevDfr4k=;
        b=PdJzFdl8KLsV6boA0KIKv2zhClEtKtrtWU89uCjky1lpUURX1P3KlYI2QQTkhXJu/o
         fDXxVuAfaqQPoLbOApaTPQVI6P85fSGaS286+oLnQmS339gPQvIjlO4PW50DBi/gf5rj
         9Sjkcrg18J3Zn1Nu+f0N5dMM+LWZik9Tu/2KVvqpmt+nxz/KjBOzQfEVl7pjXFEMrJnk
         KCnsAVtuPHh6974b/igi0gsBB94w3E/jquQVI87e9seuvYU7Wlvfkc+byI1fDUE+VsLR
         E6WCkc9VT62N6RFRzOkgiEBI2nVaETFpo3R3arEV0Gv3yV7q+DL7KoiAyYHiho2BBHO2
         hviw==
X-Gm-Message-State: AOJu0YwGwfS0L5Aw5ylHoqThv2oL0h/ZAoV99r+dBfvtn2ChZedW6FMt
	yyh3CjDCtXFfqT1n5TvLOoOGQCulD9AwGFfmkx+cR6vmPziuOOvbUdJ6dh3X5ab0ucZKf20LWJt
	OLbb7+Yffw2hVm8Ga+LpLAa29JR9fXwdKcqOuJY5R8WUdGyQ1aP4Wez7ad4W/N7pPxujHnASCPg
	Tczw==
X-Gm-Gg: ASbGncv1vS47i/fJOqCGoF/uLoBfrMIOJett6OeLCQzNHeIs9+tw6xsNv544JILZAK4
	uDvP1ACWSOdlE/dvJGbbuaC3W4FiUFtfpUMtKPamwlL8c/0Jqp2N0n6eLzjjNRaVSUBV3Uynrbq
	55hqiKUwKJQ4CyTD8jCW7TMdsbfcS7UT40+79o8nqshYqZNUlAlNOziGrl5il/dqYgVg7Irowd9
	/mGKpKxnYiv0Ru87JL4JE+Hn9IHzqW2lPHcPjP5qwPiD1NMIpGTrNGQZhGb+n9Fkz5BgzZOsOmK
	9t8HsmyTVb901G2aIIE4mgVs6ZMlggfxrHqjQIQ8zAXgxeGyb7URd+nXRd3m6FobGtYm4cAQM6K
	WXTVaEhHSrT5UtnRrOS+Y6kdssX4=
X-Received: by 2002:a17:90b:4f86:b0:32d:db5b:7636 with SMTP id 98e67ed59e1d1-33bcf91484bmr3018979a91.27.1760684144349;
        Thu, 16 Oct 2025 23:55:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrVqE4VqHRm9X5wx6ye+bJw2WGJ/5rkO3f3lcbWBpW0rM4dLNgJ4WrcSqwVApIqA9T7TXt5A==
X-Received: by 2002:a17:90b:4f86:b0:32d:db5b:7636 with SMTP id 98e67ed59e1d1-33bcf91484bmr3018954a91.27.1760684143928;
        Thu, 16 Oct 2025 23:55:43 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a22b9af2asm4949701a12.28.2025.10.16.23.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 23:55:42 -0700 (PDT)
Message-ID: <c4c907cd-ac5b-4ddc-96d4-aee840d98692@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 12:25:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Change CONFIG_SM_TCSRCC_8750 from m to
 y
To: Krzysztof Kozlowski <krzk@kernel.org>, Taniya Das
 <quic_tdas@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
References: <20251017-update_defconfig_tcsrcc_sm8750-v1-1-34b1b47a0bda@oss.qualcomm.com>
 <30390038-0f90-48a4-befe-475cf88ba1fb@kernel.org>
 <37f54b76-a274-4ce2-aaa9-88ba0eb84199@oss.qualcomm.com>
 <90c8dda3-f753-43dc-8bb9-d03a808c8704@kernel.org>
 <38b8468f-5006-46a3-a4ea-28e6692ef14a@quicinc.com>
 <03ac36fb-a227-438e-bdf6-f787e26008b3@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <03ac36fb-a227-438e-bdf6-f787e26008b3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QAtUpkJ7NljEbP9adqL712QrB1pu2kT-
X-Proofpoint-ORIG-GUID: QAtUpkJ7NljEbP9adqL712QrB1pu2kT-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX1GbFE+N0tm0K
 TuPhMBhm9XMiCiOkRe1Pth8Bz/s3WYcBQvN/zZENH7D4mqX/QJahqe9H8AMMy18ThkPXzPyISaP
 mbN8uLRjcgII9nBj/lQ8twoJK2/kJbWjyjaxRzbcGBBpnLsZu9BhF5jsIR91apdjT/shoKtJ5Vo
 Ey41LWJEXXUU7dUvJBJ4FbVxeCyQvgebPgluBzG6e1g5+O9n5EB8JLhzQXRsr8cUjutMP6uO7DO
 KcIE+U2MqOv5S9zkYclHq1z7oAP7FuQCh6BsB5nXWMVnUBZnYhkK76EbmpStIjbS+YQwszonkOi
 1sZxgkxKuMVkx8S9a1lQ0JLe+V2H1etG+eNkX3zl534XoT422BYZ4Ghpi/5FgbucRSMrKtaLw0n
 /DYaOWgbqa7D3HD1Pc45kfrmF0Cn5Q==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68f1e871 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dklrOZhk_xOpRdAJBjUA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_235546_656983_AE5811F0 
X-CRM114-Status: GOOD (  24.27  )
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



On 10/17/2025 11:26 AM, Krzysztof Kozlowski wrote:
> On 17/10/2025 07:49, Taniya Das wrote:
>>
>>
>> On 10/17/2025 10:51 AM, Krzysztof Kozlowski wrote:
>>> On 17/10/2025 07:16, Taniya Das wrote:
>>>>
>>>>
>>>> On 10/17/2025 10:00 AM, Krzysztof Kozlowski wrote:
>>>>> On 16/10/2025 20:53, Taniya Das wrote:
>>>>>> The TCSR clock controller is required  during boot to provide the ref
>>>>>> clocks to the UFS controller. Setting CONFIG_SM_TCSRCC_8750 to y ensures
>>>>>> the UFS driver successfully probe and initialize the device.
>>>>>>
>>>>>> Without this change, the UFS subsystem fails to mount as a usable file
>>>>>> system during boot.
>>>>>
>>>>>
>>>>> That's not what I observed. UFS works fine, especially that it is a
>>>>> module, so no, this is not a desired change and explanation is not only
>>>>> insufficient but actually incorrect.
>>>>>
>>>>
>>>> Krzysztof, on Pakala MTP we are observing the below issue and it
>>>> requires the module of tscrcc to be loaded explicitly. This patch also
>>>> aligns to how it is on all other targets.
>>>>
>>>> /soc@0/phy@1d80000: Failed to get clk index: 2 ret: -517
>>>> [   10.496570] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
>>>> [   10.503660] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>>>> find vdd-hba-supply regulator, assuming enabled
>>>> [   10.514548] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>>>> find vccq2-supply regulator, assuming enabled
>>>> [   10.565955] platform 1d80000.phy: deferred probe pending: (reason
>>>> unknown)
>>>> [   10.573078] platform 1d84000.ufs: deferred probe pending:
>>>> ufshcd-qcom: ufshcd_pltfrm_init() failed
>>>>
>>>
>>>
>>> I don't and I am testing regularly, so I assume you have incorrect
>>> config. Maybe I have incorrect one (which works), but then commit msg is
>>> incomplete - you must explain the bug and provide proof that this is the
>>> correct fix for it.
>>>
>>
>> We have tried booting up recently and and that is what we observed. The
>> patch from 'm' to 'y' helps the UFS probe is successful and the rootfs
>> is picked from ufs partitions. I will add these fail & success log
>> snippets in the commit text.
> 
> That's not enough. You need to explain why UFS fails. After explaining
> this, I guess bug in UFS would be exposed thus that one should be fixed.
> You just provided band-aid without fixing the real problem.
> 

When the kernel commandline uses is 'root=PARTLABEL=system', the  is a
dependency of the UFS driver on the TCSRCC clockref during bootup and
the TCSRCC made as a module will not provide the clocks unless we
explicitly load the modules. To meet this dependency we need to load
TCSRCC statically and move CONFIG_SM_TCSRCC_8750 from 'm' to 'y.
This will help the UFS partitions to be identified and then the rootfs
to be mounted from the partitions.

> NAK
> 
>>
>> [    0.000000] Machine model: Qualcomm Technologies, Inc. SM8750 MTP
>> ....
>> [    3.133373] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
>> [    3.144480] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>> find vdd-hba-supply regulator, assuming enabled
>> [    3.144585] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>> find vccq2-supply regulator, assuming enabled
>> [    3.227770] ufshcd-qcom 1d84000.ufs: Resource ufs_mem not provided
>> [    3.238319] ufshcd-qcom 1d84000.ufs: MCQ mode is disabled, err=-19
> 
> 
> 
> Best regards,
> Krzysztof

-- 
Thanks,
Taniya Das


