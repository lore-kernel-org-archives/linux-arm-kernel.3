Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB0AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 09:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ih4+jHDjFRiA69gnHwzJvT/5UWdEO8jOvDrfGXowHW8=; b=xFgrukIA+8GqjJ0nrVdhRBineM
	OQMQImc65MSKYIDHt0MwyhkrSsQIznGkUuS8vxmHNRB2Mimba+v2oiymNlH5bHMN4P7jJz3cegyCX
	JFduvy+PmVIPYJdvNuFPyTvt3oRIO2KaWyUd+kfHhUAy3G+qObGuMtThTVvwU8NIhugkj1c/Fw90c
	6Ur0tHyiaQ/wvy6ozPzltB6/AiUcFPm3+ntWW1XzMzVrqwmLCvDHXq1GOCf09ZYBD5b+nLY4w4249
	TIJojJ15RJ61F+KpGjVU9caNYhObKXs35J8P2srxYPYwyTwDg8V4+J80JCQGTRNMUagjvqA3ohf+J
	JlehZCeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZsr-00000002Abz-29a4;
	Mon, 10 Mar 2025 09:57:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZiC-000000028WL-34Sh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 09:46:18 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9ebHi018890
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 09:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ih4+jHDjFRiA69gnHwzJvT/5UWdEO8jOvDrfGXowHW8=; b=Ur26tFllRqWg3bp8
	zrTPDYoFq4wRonBIXz9aJTZx4kZLz+AGWI8lOIj26/WN0knnfyVT3JpAEJRAb32e
	6v62GwAn3rBZI0VT0PtsY/frrnlua1QrAK9ZCewEE1VEg0Y1qgaW8ms57o4o+PwE
	mNK88HHL+6jHFrISjByy+w9u6PWr6sm2+XhdgzrtxHD8G6NLYNvvU/DzMPJmF+8a
	cikikbdqkTX4XnxIOt+kwYsy69rgeco0u1e5/JHB7VC4bY868a7V8xpnIt/YdxLG
	mH22jH6KXLdm4uySxxn34xLLWFKTgtL8TRYkcQIPunhlWNDvklPZkjU39RHYolN1
	TzZ8bg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex6vcst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 09:46:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c55ac3a1d9so2351785a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 02:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741599974; x=1742204774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ih4+jHDjFRiA69gnHwzJvT/5UWdEO8jOvDrfGXowHW8=;
        b=lPoPiwLR3qN1wMuxm3T9xlJt3OZCv4igXLchdu7IjE3qGuc37QwXxL+4yJ0GIYI2wu
         ePYioz0AhlIfHt0VMIQhaOemY6XoHIDh5s14DFf/4D2Bi5uAUWIgacD8YFC+xb+Y265B
         br2eYjyzOS33sMSwIqPgfXs9h1k/YR7/6yUOir5Vy/Y31pTofm6lbE7ndvIfHgE4XdjT
         uasHRUWxG6e1iL8GhGfeb2si463EWtJRRE9tk8yPNUfASmmvETWsCNrgna+1pZ0uUNiF
         OEN6N0CIBJUoKsf7wbwmP7CZPGVtCmobk9Wk+fJhFx6D7qM/CAlEQce1fG57BtgT6SPM
         /m1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZWczyHarzr/YSJH8f60a1O9uEvpiwqqe3e4Og2hyoMwDTV8OtjyJT5RpRoBoViswVTzEl1wjhB7dDBxSjjedu@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr/A7/XN2aYM3ielrcjPJ4oyo2jmiPm9HOMJol91mBvuSM3y6L
	l9J1puPVWBQXcPTMk8moRKUa8CXPPMWOLHfwzPSMGQXCaB5xbfqfdC4xFonW3Xp63pAXYdM27+x
	JshjhJ53vheRtceC57IYBUCIYRFk5Pezp+LRgBrUeEM9iJ/vqNCGeBq8/8Lb7ihV+VbtnboWcvg
	==
X-Gm-Gg: ASbGncsnIZclM5mLYhKlFKx0oXmuDhgUyl8Q9++k6Fn8kQtvR70tG0TUrcnfGBT50OW
	QRnMbcZlwOin+O0ER9QN5H+zcKgAVsXw2l8CsehPIiae0cGvAxjzWqvS3GZHMLn+h/Q4MKHo3/L
	2i8Q8Lje79yZJw0xWN+PIHpGLGOLPWyoocw1KVbi1lUWwjaYyR8elfQmdvByXHDYLWd53N0ib2F
	EYnAGwvcxrEmhxr4lj1itfDsl1bLmEVimHDyH57SgK4PsfYmUBPIu/QtleH28Tlv5nFjNQ6XDyG
	tIhBQaOj89PXYeTX9VL4WgY3llHCBbat97LYwtvSu6aQUdkIPa5wmVGUpngJqII4SPYu7A==
X-Received: by 2002:a05:620a:2612:b0:7c5:18b7:4f25 with SMTP id af79cd13be357-7c53e1c4375mr521305685a.9.1741599974156;
        Mon, 10 Mar 2025 02:46:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7YuheYHS6PGU9dToJsmdjfNsj9OapzQsAAm6IkqoYz7wDIJ4He+ANVKbuM5AnL8AZiUxVHw==
X-Received: by 2002:a05:620a:2612:b0:7c5:18b7:4f25 with SMTP id af79cd13be357-7c53e1c4375mr521302185a.9.1741599973726;
        Mon, 10 Mar 2025 02:46:13 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2394826absm747393566b.55.2025.03.10.02.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 02:46:13 -0700 (PDT)
Message-ID: <dcbdeb90-d274-4914-84d3-24bd1d6e826e@oss.qualcomm.com>
Date: Mon, 10 Mar 2025 10:46:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 10/10] arm64: dts: qcom: sa8775p: Add CTCU and ETR
 nodes
To: Jie Gan <quic_jiegan@quicinc.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-11-quic_jiegan@quicinc.com>
 <0be31ecd-4386-4eb6-ad6f-a4409a3fc6ad@arm.com>
 <942d0b2f-c3c1-466d-b894-9dd32ec4e6a1@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <942d0b2f-c3c1-466d-b894-9dd32ec4e6a1@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8bmE8k5 c=1 sm=1 tr=0 ts=67ceb4e7 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8 a=YlNZv3wqyhfgsvI1z0IA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: w4rnJW6dqyIQImKTfYh1RX3eNRKqfRLm
X-Proofpoint-ORIG-GUID: w4rnJW6dqyIQImKTfYh1RX3eNRKqfRLm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=705 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_024616_792825_8447709C 
X-CRM114-Status: GOOD (  12.66  )
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

On 10.03.2025 3:57 AM, Jie Gan wrote:
> 
> 
> On 3/4/2025 8:28 PM, Suzuki K Poulose wrote:
>> On 03/03/2025 03:29, Jie Gan wrote:
>>> Add CTCU and ETR nodes in DT to enable related functionalities.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>
>> Assuming this goes via the soc tree,
>>
>> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Hi Bjorn, Konrad
> 
> Gentle ping.
> 
> The driver part has applied. BTW, I found this patch has a conflict on tag next-20250307, do you need me to send a new rebased patch?

Yes, please resend this just this one, rebased on next/master

Konrad

