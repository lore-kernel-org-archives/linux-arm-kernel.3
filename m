Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F3EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCYltqR2tGKqicmJ75SwIc6aZzCwkhsUXbfmkVc69/M=; b=IDJ/32Q/Lr/64chWDyNjVhVzcc
	Te3QuzeMRAu4lfaoM497bvP7I6MzSbZF0hG44j6KPV/gVWx25oNj0gHoOIysBN5kw1gyIhg0fX3GV
	T13RtlbWZvbyb2DLWh4Cujx9zGr+xqdI8aA1U5DI/HMQlZ8ju55UltwHgTn+aGR11EBBhxfW68o3j
	7fU3inyA8m7mlkfxfPIZZih093iAZRlZqo8o0PwvK+DtfL9qWk4iHwoNm1jkKJ7T4ixJPEmdstN2f
	xoUUmIvgRiYV3OVbYWSdGOXv8UICA8RknbCODvoyoPVqO/MxQG5wIzMBlNrhGkVeQ4xz3/n7Rurej
	IIXvY93A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaE9N-0000000Ex99-44Ny;
	Fri, 11 Jul 2025 13:50:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaE1A-0000000Ew3q-15ZH
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Jul 2025 13:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lCYltqR2tGKqicmJ75SwIc6aZzCwkhsUXbfmkVc69/M=; b=gcmnrcg6Um58F/Fyzc8S3Q16AN
	2IowRMZDDDVwyg1epPOYUlP9BczBJaG7dUmSMZIJrvCv706tc6lxSk3dE0ALCPee3YUAHh5zbBekl
	w3cQQPDjvGj00tftt3Cp2qbZA2Urnegk3Z0oIwwmKZwxgHDiZFnprLMBDbMSGgXuAAsfce8gP26Ll
	GKgJeVYmLBaKh072WUvBBspFPWjzmfzgiU3ZW37/TgU5G0nh3icr3dBi12NJmGXa+2K3I/gjMZFW+
	xFvQCqSO2ft3DcFKvddIN+7603DqIzzrK2d4fpdPcHULMY6ZHf8XCN9JiRcDutnMsN4uRz3jvkTeA
	UUQXN55Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaE16-00000009Gln-0Sel
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 13:42:22 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BBGRlr012022;
	Fri, 11 Jul 2025 13:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCYltqR2tGKqicmJ75SwIc6aZzCwkhsUXbfmkVc69/M=; b=dQxmP7xkKj6Dp/VG
	YE3sT7nw7oJgHh//h3KutH6fPjPn/76oRO1zN5DEwgehinH2KdPx4dZx0D+Z7Wmw
	jJTATo8PiXTfTXjPm+iULJd6GzFHCoax5cJCoTg/YTJ/+R6HHdxt1nw+iKHR+Hqk
	4/muNd8vIZ5WUJpNjyMtoaJoqhTZKUJP+cEQB/BNwXF0JbTd5NbZNTXol3lzK6ZJ
	A5PiHmhi7554rfvkkQYQdpuwrjVWk8DHTNwLo1mZxM0/HZIWA3qNn1X5dndiMd9M
	TOZCJIaOe9X79pRDjDccxTpVWC6T1sEQEiKJlb3yrCDu21DcuzaTwunfXgGa1ETb
	HN0UOg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9e0qaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 13:42:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56BDgAoF009822
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 13:42:10 GMT
Received: from [10.204.66.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 11 Jul
 2025 06:42:04 -0700
Message-ID: <73537de6-4ef2-4dce-bcfe-3d602afec89a@quicinc.com>
Date: Fri, 11 Jul 2025 19:11:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] arm64: dts: qcom: qcs8300: Add support for camss
To: Krzysztof Kozlowski <krzk@kernel.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
 <20250711131134.215382-3-quic_vikramsa@quicinc.com>
 <ae8d2356-8445-4c05-a023-0f08560dd356@kernel.org>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <ae8d2356-8445-4c05-a023-0f08560dd356@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UKc512xHmYsmMV54SYPIxcslwi9BJZRM
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=687114b3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=_R2wk7YzvhxZsAH_nEEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UKc512xHmYsmMV54SYPIxcslwi9BJZRM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA5NyBTYWx0ZWRfX6fEXYlt2I1iS
 8llTUW8wryZ/lmF8cYbJeazo+2qSn3MPoOWFH0piaKjWY/MJdnWrNrtpTcjDfVGqFhfMV0uM3JE
 6zWla64CXB9jcQSLlC2XeGKLPYvoCSwQNb1kPPR1xvwuEuoufacx0kE1lKx9o73xa38vhX1pNlh
 MM7OmGCLyu7tj11aOfXlIzsH1Ub72fwPFhEE+09hFoiPlZ5GG3yDjIJRD4Mm6dM6sVNXUL8/wAF
 9FZv1/+k898jLakrxnpohNIAwlvrlNbWDCi3GfPEtiNZzb8wvFtONKbSL1DSELRhlfaSV4zCnW0
 ZnyB+GkXIMtq7Ftxvt48+XD/L9Z3XsCjuJcCpsJemlxUm3T9NSgwDk5Qgf8Ze6XgYq/vQ/LOvhz
 9NO8TqV86H2YykeP5FVrc/IVBmQM4771J9ApPwx/8k3/TrUW9hJDu4Ksa+UBdTBbD/dcIFcJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0 phishscore=0
 mlxlogscore=670 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_144220_744406_4D0B48F5 
X-CRM114-Status: GOOD (  13.28  )
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


On 7/11/2025 7:05 PM, Krzysztof Kozlowski wrote:
> On 11/07/2025 15:11, Vikram Sharma wrote:
>> Add changes to support the camera subsystem on the QCS8300.
>>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 171 ++++++++++++++++++++++++++
> Don't place your DTS changes in the middle of the patchset. I don't get
> why did you decide to move it to this patchset, but since you did, place
> it AS ALWAYS at the end. See soc maintainer profile and your internal
> guideline
ACK, Will upload with correct patch sequence in next version.
>
> Best regards,
> Krzysztof
Best Regards,
Vikram

