Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FA0C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 09:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdj/IIFa1G8cJv22IS2RxBEe7lzI0ZkPGsBx8d4NcJg=; b=QGYMvZMQh+QQpgiFA98U0cxiMQ
	k2BVfx2851YoXR+OXfPo3feOi3OaAgv6fbZw9dg8/oifFlDjtYp7xUVUDXtYqxf6M++N31zKFPor+
	32I7zyB6CIBeUmYnfuM2gcMLoJr/vXsiqhY9+9NkPGA1TI2MtmS1C8vOT3is9nvi0OYQsm6rnaBrM
	WfFZ+GYIM2EWag6X3JYihZgbxh4TEShNy184jPKVlpZMv5mDZRYkpdUbzu1gs1IzsRDn3MirOK1gl
	3oLVadOoPGkxDO4SQfb3bkOgARIu71krFMeuF+ZgfLlg3YD6swZbO8MoTYGQ7xMBPfr/FQA00pdWN
	2XpbCoag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQiE-0000000GHab-3qRD;
	Mon, 24 Aug 2026 09:11:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQi8-0000000GHZL-2Wyb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 09:11:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99w2Z1509304
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 09:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sdj/IIFa1G8cJv22IS2RxBEe7lzI0ZkPGsBx8d4NcJg=; b=KWBP/0UFcRqBdNHL
	nSewzdviaQAaBr5RFnDQ2PcmlR4ok5ZoGj9eZQpYGTadeG060xdXtmn9U2v47sp+
	HE/AtOAFd/X7u3Xm7K9BZ/+aOIbMk/MaHtHv4rmNayPosdvKH8cDsvuSGY8jlyLf
	alfPcKeyIi+w1Iav2tZS7lEkgPW6wFH4guieqWGGSirsPH7hZOxdeJgu0r6sUK0/
	yJblmZWKscYwMtgcxxqgu7aiaSrEh43Yebf7pMqOX2VtBSUB3jZ3Ikr+h7b4yRmq
	4Ght9f9YNgE+VsVjv4xs3IA0h4V/bf6jt5LLqHIBYfw4HPlcdlNeZW0NtNBxYQdu
	5fbNPQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74xhe5vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 09:11:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38105cc58e1so900608a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 02:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562679; x=1788167479; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdj/IIFa1G8cJv22IS2RxBEe7lzI0ZkPGsBx8d4NcJg=;
        b=bEqs9qdGAzQfHBjfdkS7ohKBlCpO63NaKMM226PoiahydRbgZ7lMsl7F7BfCVQmFVR
         klZc4YXk9X2UmG4rsZB8j7lyLPSmLWNLQWaqF+wLy9Pou3tjizUS7jV9ljegjVCfQ/G/
         1AZGVFa2FGwIOzGNynPT+Ufanwydl8wzc+LwGnavUzWe1IWE+2eWM5+S2/Wz9QW5FyQe
         /akYeg3GWkVYc0ussztFVhGOzXco080ZlDaDBaPGw7Lp8bz/0++XpqOdirfHUJ/E1NlX
         BizczaLDRChK3EuhXeuF6oBzarmsWIwMl7jZmo+T+2UDDp58ZOYPF7/NQAWIpTeKMmjZ
         IURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562679; x=1788167479;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdj/IIFa1G8cJv22IS2RxBEe7lzI0ZkPGsBx8d4NcJg=;
        b=LP9fp3sbxDB5NcXcbJQGnb8fc4NOrFF3I8v9meobvKin824O0cbhUjitYAifY612XO
         D1L4TuIZsxbWQTs9kuRxOLH38puX91F+ORcMNlo4mifsIc2kUjIq/xkFyLXWfwpNcmYS
         hwNXUVbvowwuMXeKDC6LWiw41SDtCyqPpjIfbSQAjIIWt1BUZeMnVp6YvSNsMrylDejc
         gTjBbczUfLis19PjFJg3THNaadBJkRmQeqdTwn2vA3fSrbI4wZ973GnbBBExbPhgidN2
         sDrfkGaVcVVDw2i2ZSSyOKfd8o1zJYEUTSyusvHJxM6BY5ztrGW6a97y7cNHq9lAfd+X
         h8Fg==
X-Forwarded-Encrypted: i=1; AHgh+RoC8bzFlzEJIrKrMq2Pxci8TxyvINhZlxQ21l3qKNqcIy/AJW52u5PTFl99EnY3pDQEiyK8kiRDyZCiF3USpoFI@lists.infradead.org
X-Gm-Message-State: AFuF++lG4PrWC/ro/AGtt/WvkTyltBuVb3kKWfxHB8dbOYH9HwU921cX
	rI8rAlgBvqXwtu8AbMu77vf0m78GtXC55gkmoHTXlaVVjFmXHjiNrXEwWMf9Y1NnbebAdJcPIRb
	3//uK+Y22s/EzxyZ3J6TK7BEMjP+1OSwj0N4Y/3hMak6LPVgnMA9d+EmUs0U94Y44cNBuhNGYK/
	Kyrg==
X-Gm-Gg: AR+sD13bs32/xRK3Yojgx35okkBoKezxzq4rvM6ATHbCafkunksumcjM8aWo8rva1zG
	7f8Pf9ylLLJNzVR46DXElml7WiYFMUPF4Bbx7juRERb+9htp5X5RHDhVfiz3up/brHxcWHEjxUM
	0vm0HXA8gooeMckaBuYGBBk4vWhrwdd94mK4BLTpeJuyOB7GU/AZ+HNQt3tINrz+3hDa6xE8vJt
	qjpx1J//XX1ClFw49bs3i/8PSCJ7hEwnyVZ+SV+g5Kgxf+/QBqWkkyvuati1s8Mj6HHnj9NPaA9
	MilKLcMugncupwhynAWenlKog6oIroCBvWE0YosignRp7p7qs/L2tsDXGCdXYP1blC1fNKf0PsS
	QnIl/j0Sictj+yxq+HoDziQI3dWtAxQ==
X-Received: by 2002:a17:90b:3b84:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-395c358b9bfmr18634961a91.2.1787562678998;
        Mon, 24 Aug 2026 02:11:18 -0700 (PDT)
X-Received: by 2002:a17:90b:3b84:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-395c358b9bfmr18634920a91.2.1787562678524;
        Mon, 24 Aug 2026 02:11:18 -0700 (PDT)
Received: from [10.92.202.220] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4968618sm10951827a91.3.2026.08.24.02.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:11:18 -0700 (PDT)
Message-ID: <20e19a52-81d8-4751-99ae-c1297c2ca026@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:41:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: monaco: add RAS error source
 nodes
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
 <20260720081954.1858180-4-umang.chheda@oss.qualcomm.com>
 <am69fjQNTv2xJonT@baldur>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <am69fjQNTv2xJonT@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Fy1FEGsMVM7Yz7jyu-DCaiyZqXGlnWhm
X-Authority-Analysis: v=2.4 cv=GdQnWwXL c=1 sm=1 tr=0 ts=6a8c0ab7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pc6iunps6SSU6zhADHUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX5gNzLKqx0LSc
 DshqhTPb09IaOgMNfSoI+dicdZkb7VgDsezjHKL11SP8Kd24kRiGbYBKbPzI0NyZ5Kb1nvH0ik1
 7itWopsoyl+9junwGWLF1m6N89gHK4nGrxz1UtpqgmzN+t86ay0ByKYB8LSOKaaFTcV1P0b6Spa
 GlFY67Ct/0oXamjMmyIVlhfGdXqdHJkDJEY+P7r6WyH1PWtclB7VUCein9xdQKRE3YGC8ce52ft
 7cCOo5l4G7v1pBFMZm1jyfUsGKSNrUpSBozlq9aOH9toKqL/aE7jHUdGQEdgrQL+D8Ji4csPxLU
 UPQnc15dXZF+HMWxjwOW+1zed9qSLixpKoeh5cwArWg5J1sDrXTDcK/HQLg3RCiQLjj1PpJqPIp
 xTViN41MOgy7auZ1pDBf4MaaL52MYYgbGDShlo2D5uqCKxUn/Z3dtTE9E4ZjmGXJPuHJKSApX0q
 OwaPV1FGFgsS8Y8Qz2Q==
X-Proofpoint-GUID: Fy1FEGsMVM7Yz7jyu-DCaiyZqXGlnWhm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfXz8GOQ23ficXi
 GTnZBFWRrkeEcTsw6CKw4jOhSevRNzFI57tVnB97umEt+hcBZC1EGs1MrONdnvGwKKV94iCeaSy
 0kVz+l+KrVvXEtoq8JNUwtGLjbaQWNo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_021122_626994_20AAB829 
X-CRM114-Status: GOOD (  21.64  )
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

Hello Bjorn,

On 8/2/2026 9:19 AM, Bjorn Andersson wrote:
> On Mon, Jul 20, 2026 at 01:49:53PM +0530, Umang Chheda wrote:
>> Add RAS error source nodes for the Monaco SoC.
> 
> Why is the subject "repeated" here?

Ack, will fix this in v3.

> 
>>
>> Two processor error sources are described: a per-PE node covering the
>> L1/L2 cache hierarchy using a PPI, and two shared L3 cache nodes for
>> the two CPU clusters using SPIs.
> 
> Please read
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> and don't assume the reader know what this is and why it might be
> useful.

Ack, got it- will update the commit text to reflect what it is and why
it is required.

> 
>>
>> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 30 ++++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> index 64fc0d592282..4fbd1dc9a147 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> @@ -724,6 +724,36 @@ system_pd: power-domain-system {
>>  		};
>>  	};
>>
>> +	ras-l1l2-0 {
> 
> Why is there a -0 suffix on this node?

Ack, -0 is not needed here - will fix this in v3 to use generic node name.

> 
> Regards,
> Bjorn
> 
>> +		compatible = "arm,ras-processor";
>> +		arm,num-records = <1>;
>> +		arm,record-impl = /bits/ 64 <0x1>;
>> +		arm,status-reporting = /bits/ 64 <0x1>;
>> +		cache = <&l2_0>;
>> +		interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
>> +		interrupt-names = "fhi";
>> +	};
>> +
>> +	ras-l3-cluster0 {
>> +		compatible = "arm,ras-processor";
>> +		arm,num-records = <2>;
>> +		arm,record-impl = /bits/ 64 <0x2>;
>> +		arm,status-reporting = /bits/ 64 <0x2>;
>> +		cache = <&l3_0>;
>> +		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-names = "fhi";
>> +	};
>> +
>> +	ras-l3-cluster1 {
>> +		compatible = "arm,ras-processor";
>> +		arm,num-records = <2>;
>> +		arm,record-impl = /bits/ 64 <0x2>;
>> +		arm,status-reporting = /bits/ 64 <0x2>;
>> +		cache = <&l3_1>;
>> +		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-names = "fhi";
>> +	};
>> +
>>  	reserved-memory {
>>  		#address-cells = <2>;
>>  		#size-cells = <2>;
>> --
>> 2.34.1
>>

Thanks,
Umang


