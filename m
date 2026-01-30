Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD419E6BF02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 11:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbcTK2WZjfHEQQ39q4AXBDKxCctb3txQ5lG0R1mMthE=; b=a4x1UyxEyZU6w5KTD9/tzhph/c
	X0GRkC2jCpJ7oB2p/Ry1ZKkAgJi7uCw2WRMaGAIARuL1h1+THf8yQEOvaBr3LsMTswQ8wueNYQyO1
	j3mOrQPY+ZP0Pqq7wBcyulIWRiDbRIVHVeFgy1FQqWD2HjH1vmDCpl8LhK8UcNYAxneiMpKGFQAop
	5gXMiJOwIsudGO9QDO/PXbatz9o79qMg7Jht90acjK9VZvnSbduoHf3CiHCKFBS0oU3toyB0JoAG6
	OYglIxXcyD6BzGKYWAJiziYKDSPiW9zir1N5Ko3gpyR66UEGf7764TSlKS5drHfhRCHUNuBy7zrC4
	0yZlNbeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmYp-00000001QCy-2p7x;
	Fri, 30 Jan 2026 11:21:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmYm-00000001QCc-3fLn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 11:21:10 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U9V07v2675381
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 11:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KbcTK2WZjfHEQQ39q4AXBDKxCctb3txQ5lG0R1mMthE=; b=eeLkMX0iElqJMZIv
	JKwPktQIB4bgh2Vu2+TDkrpF5y42WfD2KBx+fXCvECzkxBO4DvfLR3AMrXqNBw2Z
	MEbxZbW9zvBDIXYc7sdEPumuqoQwfLMmx5qssdu14N7bSKqbeBfZ0KPL867hhzcG
	PBR1plwIhUnLt/QBcWnB2gcd7M59r+ItWKcdOTZKHCvllniem9vE9hfQ1ywDuTo/
	kyi8J6ky9mwsJK0cpP7VtPTVCVUbj0W7j/GlViwHTGE6JHAWtUdY6wDggEFkMuXT
	s33CkGpcHpk+M+P7At3DIjbA/jm9g2VgIRz2jj+7GJIWsbDdKbrM2s9da9ZT2ePV
	eJmU+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0t340b2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 11:21:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c53892a195so35374285a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 03:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769772067; x=1770376867; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KbcTK2WZjfHEQQ39q4AXBDKxCctb3txQ5lG0R1mMthE=;
        b=ZRZvbR0mBHAgjvD0bqnWtC4/ws5nJMiCRd9Imu/ed9ZciNJxhVdPrvdVHej6TC/kNq
         ou5Q0uS/wr7WyDihR3J6Sqb4QBlzGO4delU626rJ5j2lOSLe15KBn8w1TEfwJrjYhjEE
         U9ovaCk6yUgIzJovlvEJG9CqWRMqci6IaMB4D3n6QNFymQOJNvOJAU6ETg7dt1OiGJ1e
         Ii6ibLoX0jktdLmCo24u02GRGoVnBCOFA1bWbeJzEYNR56BlXsKNiFiuVk8gV0unsC4f
         Lkm+9xttytgYj78ioKd4CP6m87uZAvSZF1YpVl8QLDSivtKooOwAq9+yoOqHi0YBqGbr
         paZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769772067; x=1770376867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbcTK2WZjfHEQQ39q4AXBDKxCctb3txQ5lG0R1mMthE=;
        b=mdUAnjXnYJBnTisLHX3z+3/cP5BmgyszmGhbeocDR9CCj+HD6+EfgbnqNpZEkX4SKK
         w/LZ+QjxRcIbSUQavII0+5xt7Vwd8q+la0+6OHj2EfCh8vnH3rLAi+ZbG+yUluVKW/3H
         pqEn6Y1B7rp+6tRDP0PkwiqWvlvBR9vcdoGqPPjW4FH4Ecys9XJ23VVBIzVnP+P/CEfO
         ZHbsOE1SJTDFd135KNINCsLqCAhTcEhLp+bfJZbCWmGULM0nBxuO2u3WIfZXb7cRoMgl
         GNHSBfMROPDUK+cTX/uqb7eHmGRrUu2zJmreZYSW9nhWYrx6vPCCYvrzMJ7P8EVn7HZm
         DS4g==
X-Forwarded-Encrypted: i=1; AJvYcCWINgu4G6wuWJnAvrTIrxnrl8mq/HxKlhUlJIGJocttFzvdGZrpNvDSuham2UVnNzPEXaQqqMj5V2sHOGylcG/J@lists.infradead.org
X-Gm-Message-State: AOJu0YzlW1zhuBqarsD4Vm+xc0ktZ3+AXldvOngo4/1n5x+FWl4JsimZ
	QSYfps7RxG8LEBwpYDix3buQL8cSYcaLFeHIildqGvfMjF5eGqDsM7YtedNEDma+ppg+qqzp44/
	0zYCzd38FcxbskStj5xuP+PJnpfcfzprjImglacInG39vRTSLXXuf+0d5f0px2x1to5c4tgTRxB
	164Q==
X-Gm-Gg: AZuq6aK9rJIH0pyz4O/eFbfkn4/8zVkoJvJSogurTdE4R4jrGNRBnmMM2T4WLKxAshl
	dfD9FYxOrlouzOMDnVduHcF8pAwkmFGuTQjoYWMEE13EGL4FXz3VxxUEZ9qcYFzM0LmIXhPkbUr
	ZmCq4yxz5z8OzgsodUVSBB724JJa/XvysStF1FKPY5XqrojA3anhRQ5ithzsvg6jQQMCJzgNMqz
	O3rxgdZW7yk8Ttl3jgJHAUJUnxk3XMmldhZsQW2fFraMmUbfonNqcj3ia3FeucmVZG4CsWMGVDv
	m2UH8NjupayVdIXMAR5d6fRJU+put1Bo8nlSB7QQrEiFWftWmTILZYZ1Gdj053pu6eC8R22vu6r
	95K8+Mvpd2lYMZAOdEfU1NAwc4kPbWK8y8iKpSDmRugCAhESzb4A8xHu0eEN8EHVUa9I=
X-Received: by 2002:a05:620a:4441:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8c9eb312fd8mr274269585a.9.1769772067213;
        Fri, 30 Jan 2026 03:21:07 -0800 (PST)
X-Received: by 2002:a05:620a:4441:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8c9eb312fd8mr274267185a.9.1769772066697;
        Fri, 30 Jan 2026 03:21:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8df8465cb5sm137854166b.40.2026.01.30.03.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 03:21:06 -0800 (PST)
Message-ID: <7e61575a-3e0f-491d-ae22-89ab8bb21c91@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 12:21:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] PCI: qcom: Add D3cold support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
 <20260128-d3cold-v1-3-dd8f3f0ce824@oss.qualcomm.com>
 <63531057-ea7c-4a87-9848-04e502bffc32@oss.qualcomm.com>
 <45e1c870-f155-4943-990d-5e75a1e8b998@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <45e1c870-f155-4943-990d-5e75a1e8b998@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5MiBTYWx0ZWRfX2uuC0wVuBAMY
 y1BvuG8yl4BuliQN4BRzVN+Mvh76cj5e9zKDtBj1lCiIc+etJNvzFgpkGmEaGFAQ25erqfZh3CW
 dtcR7pKNfJhQpIf3VGrI6Q6dVBsPQCItV6r1e/hJOI50jpYHfFBfP6B2B4VIxvy4J/weGpZN7O3
 YjOeU6xfcEv1JMaqd4CD3oHrCCU9OR9yK+E0GYJisfnqJXkAEIDYhb53BAxe02nMPTEyR95WEBI
 IQw9lp3qXSY9hR5jSXR+7Yw0II3NSrz3lJQDifwWB6iVWw1b/M1FXCAPq+19pv+crrXPX9xdpFa
 jJDgozXrJz7sit6T/pNN03Rr4Gt3qgnYTQTCrPUBxaVZ5b9eW741i+oPCOaW/1Ypkhr8p3BOLWW
 eFNfU5Et64Mj21OMD70IXWm5OA0eb/pmcXIE3469fQCOBGTleo+DXCIKCzJHRgCE7/bazPCBehy
 Cla8jbrSlYDZyU1xD0A==
X-Proofpoint-ORIG-GUID: ShmBDKgP-4EguOZgHeOCsj1XaudA6PO7
X-Authority-Analysis: v=2.4 cv=QfFrf8bv c=1 sm=1 tr=0 ts=697c9424 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=M7nLEK1OKNC5V3jzK1UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ShmBDKgP-4EguOZgHeOCsj1XaudA6PO7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_032108_946781_05B70525 
X-CRM114-Status: GOOD (  20.83  )
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

On 1/29/26 6:27 AM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 1/28/2026 5:58 PM, Konrad Dybcio wrote:
>> On 1/28/26 12:40 PM, Krishna Chaitanya Chundru wrote:
>>> Add pme_turn_off() support and use DWC common suspend resume methods
>>> for device D3cold entry & exit. If the device is not kept in D3cold
>>> use existing methods like keeping icc votes, opp votes etc.. intact.
>>>
>>> In qcom_pcie_deinit_2_7_0(), explicitly disable PCIe clocks and resets
>>> in the controller.
>>>
>>> Remove suspended flag from qcom_pcie structure as it is no longer needed.
>>>
>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +        /*
>>> +         * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
>>> +         * Because on some platforms, DBI access can happen very late during the
>>> +         * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
>>> +         * error.
>>> +         */
>> I think someone internally once tracked down what that access was
> As per last debug which I have done few years back we see access coming IRQ driver to mask the interrupts
> as part of disabling non boot CPU's.
>> Can we fix that instead?
> The only proper fix is to keep device in D3cold which this patch is doing. if some client drivers like NVMe
> doesn't want to go D3cold we need to honor it, but Mani is working on it to allow NVMe drivers to go to D3cold.

That doesn't sound right - if there's an unclocked access, we should
either ensure that the PCIe controller is online for that write, or skip
the write if it's not possible for $reasons

Konrad

