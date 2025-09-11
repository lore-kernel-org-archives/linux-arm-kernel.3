Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64416CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 12:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1CjqlXhvL+dqcsZqbFvvfk8Xta9TV6JWB9PtbZ0BjE=; b=gn7hHglF/nzvm5Bunjm9kJBLWF
	8hSEGpfH8TZc9GcdIXVgw6axY2cOlkQS+CQ9ZA1NbgH6UtIa/f48DzJ1X1uedRUcMEs70h/S0r2ax
	Kt3CycpOeYJ2V5f7W1HnbQ0hQ3cAD53pfX+qFUnhLWIO94fNJNPeRlQRgHamJhqn7N1/0jiVIUY1J
	x6vALniS6lNdIgRZm/00AdtisECeCaYZj7ayzUzY4AUUZtJ/XoZmLGApp2NibQoyhSJds3ZGg61f4
	9yBpwhUGRJ58UoXk/HBngYXNJqRwDBZPf6QhVoBQ8cebfZljrgbhYKX+832HSjOer1efUoSXHV2QD
	0GVzdzKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwgjx-000000034Hu-2cdX;
	Thu, 11 Sep 2025 12:49:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwgju-000000034H2-2yRO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 12:49:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBQnrZ026440;
	Thu, 11 Sep 2025 12:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o1CjqlXhvL+dqcsZqbFvvfk8Xta9TV6JWB9PtbZ0BjE=; b=OPczHEo/9jaGv9CX
	IdGQHF71IePA1SoA9c2Jjy7IWzLcusSfCQNqqhJEONEs0erQ5J4D/cczOZujZZTM
	M8TFfRibu0oVcs+hEQinP/RAjFxHwE6AKYqnTHzPc1qyWCmSW0H88zbQa9k37Lqd
	Emj7RCzGqgIIpJSnQ15NTYNR5eoG+0dOLd0GKaToWXIuYorpKh7zjU30rwe6AxhC
	DcOkwRh49/xkzRqzBvvJ0nprE36pXdp8R5o5NXIapodNguX7Dr0v5PA+gBKshInm
	6VhVqZTXSECoh1HB1GMTHomfBiKtj3UXmovCHr9n3WPfxdRudlYa6AU6N7PxV6HD
	XE3nLQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0ykxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 12:49:19 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58BCnHr8009491
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 12:49:17 GMT
Received: from [10.206.103.106] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 11 Sep
 2025 05:49:11 -0700
Message-ID: <0ca4f6bb-b2a2-4f98-a494-bb0507bafcd5@quicinc.com>
Date: Thu, 11 Sep 2025 18:19:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Vikram Sharma <quic_vikramsa@quicinc.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_svankada@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Ravi Shankar
	<quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-4-quic_vikramsa@quicinc.com>
 <w54mpkzk7irjb7m5jiouxhj77czj4ex72oqioaph4o5qhcsay2@qjolctktsu4s>
 <8104bb41-e827-4daa-bc96-9b6678a9d345@quicinc.com>
 <3d26b554-727a-44cb-a1a9-56f49775ba3a@quicinc.com>
 <j475dpcflsibhrim44wjmtbfcfht5jzvptlzrj354oyjee5mit@wmfc6zmrkbfs>
Content-Language: en-US
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
In-Reply-To: <j475dpcflsibhrim44wjmtbfcfht5jzvptlzrj354oyjee5mit@wmfc6zmrkbfs>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DnpLQNfpcOq7b1_m4H8RFmoDZtxR2qx6
X-Proofpoint-GUID: DnpLQNfpcOq7b1_m4H8RFmoDZtxR2qx6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX15Lt/VU2vMEm
 QTxoNQx6IOx0kCqzgsv0JVD+mSxb5/G34E2gcuu01cw8dyqhpgYmxVvTWxOiwsWKoWGkm5bvr+D
 sIMYxrgn8VQlfHCtYksLf5Eo9Yn88kUJAIlnsG2TzakfmWeL9AebUI+Qj74RKS0Ex6b4ErcWwuT
 8KA9FKKwUNSEbn90zZvjfIQbAuF/oC24gDzxU8OE2Vl0al/GSWrB/aGnpCk70K+29/Y4SKbiJ+a
 esQtoxqI/up9PEPywcrDL8iR4Br+HjJc8DPpO11VgIdFTzLIC3duD0JcKAnQdK3WZrn1sAe9bXL
 /sSpuFAwUocLMUrASt3WGVMW418aWVgbNedBNpZqRGn6f4DXcI47ja97T1tiCQcFYIwqFRdIWP9
 wDU/1Ugn
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c2c54f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=5w7gkbzRxSBdikr_-JgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_054926_857417_9C79F1A5 
X-CRM114-Status: GOOD (  19.89  )
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



On 11-09-2025 15:38, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 02:49:59PM +0530, Nihal Kumar Gupta wrote:
>>
>> On 10-09-2025 12:33, Vikram Sharma wrote:
>>> On 9/9/2025 7:31 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Sep 09, 2025 at 05:12:40PM +0530, Vikram Sharma wrote:
>>>>> From: Nihal Kumar Gupta<quic_nihalkum@quicinc.com>
>>>>>
>>>>> Enable IMX577 sensor using the CCI1 interface on Monaco EVK.
>>>>> Camera reset is controlled through an I2C expander,
>>>>> and power supply is managed via tlmm GPIO74.
>>>> Why is done as an overlay? Is it a seprate mezzanine?
>>> It’s not a separate mezzanine; monaco-evk does not come with an attached camera 
>>> sensor by default.
>>> The overlay simply reflects an optional camera sensor attachment (e.g., IMX577 
>>> on CSIPHY1)
>>> That is why camera sensor is configured in monaco-evk-camera.dtso instead of 
>>> modifying the base monaco-evk.dts.
>>> Please suggest and alternative approach if you feel this is not correct
>> Dmitry, Do you agree with this justification or you have a follow-up comment?
>> Can we post v2 with the same change addressing other comments.
> The previous email didn't land to the mailing list, I'm not sure why.
> 
> Anyway:
> - What are other options that we might support? Having a single
>   monaco-evk-camera overlay means that this is the only configuration
>   that we plan to support.
> 
> - It all should have been described in the commit message. Please update
>   it for the next revision.

Yes, We have planned to support device tree overlay of the IMX577 sensor via CSIPHY1 only.
I'll update the commit message in v2

Regards,
Nihal Kumar Gupta

