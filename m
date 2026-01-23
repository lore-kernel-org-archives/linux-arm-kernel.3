Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D6BD6CFB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 02:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aeWGzMxBIh6hKBnzi2b6uZexZzjIgGrfHofmca0u00=; b=rfPhFKwERzuKjWl7EvjtCsmTcc
	LNrQicXIX63hpfDUgj3HS7JjWXDD93e1RXUhAx/6SsCx061x90nzvm94L4I3zzINgACLs/h530zAS
	QUlD4u7C97eGs3Ap94NNpBN+J9ines0i/W4sbQZybE115qNdIh0frUfaoWNJTC6VqR5TyQnnkn1jS
	VZRWDavM53MqZZy108342XFXbX1XWJSod9HzoNQTHlEHRjyIjMLbpX9jq+UpQ/SM8gUnIYkJgzhSp
	Zh+ZUsdErO/aS5vc5Q7NA2uL7NpACr3E8+VG3N42UCWE2yeETryiBcx9fOcw8+FybTEqs3IKRTYNJ
	fNPRK8VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6wR-000000082Yq-0VNO;
	Fri, 23 Jan 2026 02:30:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6wO-000000082YH-2U7s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 02:30:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MK7nsv4009518
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 02:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6aeWGzMxBIh6hKBnzi2b6uZexZzjIgGrfHofmca0u00=; b=NoFjCCueJEZgaVON
	oTYHY1xKusFZTAAGOfDvHh1T89z90P/vVKRwm2GTje2RPIicO6FGSUsoIMCnlfx5
	2RcDG+k7xgfdpNu0S5ePAd5svYiLbkI86pytAD2+HRqMzJ3LGhOKexJ0rhJlVx26
	+EtJMyIvPBjizO1lA9tUvy6rstRp3YhKMPSc4IA94nYfPOAv/h/wayDMUUtO74hl
	d7mRiYJrRskOFtB1LsItq1Qt5qB+UQcQFjg/jknO6j5MTvq0hJBEj0iykgWJIQV+
	htRWlDjT/vqQG0q9TjA8RS6vNB3qy9mDqypOOVH5cv/p0t9QtBtpXm1E+qan6+n+
	uKT6qw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198] (may be forged))
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4but2cs0wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 02:30:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-502f0627494so32104221cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 18:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769135414; x=1769740214; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6aeWGzMxBIh6hKBnzi2b6uZexZzjIgGrfHofmca0u00=;
        b=Lq2mma9/WqJuR7SiweQexTqUwT4PkGPL0N9JlIziNGTwbeARMmxe3NamXbFXvynF0R
         oVWatIZc0ypavF/3p91f7vCSJ2vMI2HLrldyaHkxlShP9gcpKBPO6Xock1E6uFHDaplB
         DmxbQ0Bu5TvEy5YZurnBla9URHs4RyazBZ7U/ezCq0pPxk5Dutq7GZAGdD14AS6Wis+E
         n/KbNClUKvLUDKBpMd8hBxb8PisKm9g5+ktMbIw4WjtaUR7vvC6BJMLHeQ/AIjNWf3po
         Ng5JymI80bu0PpUFP8KSC+feD+5WLu2RGki8ri83rUSXpRFArUjnV9ZtGdsjeS41lSux
         vg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769135414; x=1769740214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aeWGzMxBIh6hKBnzi2b6uZexZzjIgGrfHofmca0u00=;
        b=ICmwipg8A8gN6VoCVBvjILANdXmZDGQaYTmNoL0gx5gEZKiTZJXKx+3hwb26ANtZoW
         0dd8njKM6BqzigFXddUSXkpsIcJEAdIjFdkmwA/xSiogTr7zEuDQ0B7o0UysH8std0Px
         0t5fp7zpmL5tglaOvUCXuJ23xFMWk+vUJwMnO8wKXj1P1vEf/wLi4EpedbnQWFAVe2D8
         pkiI0bVL5s2bdofEk5+hqtzo+ZIjuT95gyfLV9Y46bG7pBeRXe9TUB9E5Nb54dbluoIU
         9/fUn8OYXSPxZEnogbyXNXU9+KZNNA70t4QWEipCWJpJe4WlcN2XQ7m4lze9o39fMstn
         HP+w==
X-Forwarded-Encrypted: i=1; AJvYcCUKkpXJuRIBnPNAbZfVH4ZjjU4xGDsnLIm2m3G/rAMDjfyoPRO01XnB4Opx3QgMRBcHj9/2wGQPoTCkaaoMEQIm@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2Ap/3xExcGrqFTl1OzW8vjV4808w3A7SucVrRDkU8jkD4pPSH
	26blBxT71ez78kac9XnzoO6CZV2f+6nmVAgbejhCor7Ill2jpQMpZMXz0CkyDWjlQ2gXfAUYjKY
	inLBVxuYBsR/b+P0kpOsq7OapGFcdn9z5sj0+IM0UlecPVITYJG126KPnd1wMkhGjvEs9abUvsS
	Wmgw==
X-Gm-Gg: AZuq6aI/bmkO15+HJ6nv9LHFfSx/pqi4qcZsvpi4vZh7HSf4M9U6lcePj6w2miSA2WA
	anE5p8idecdOkY+WtNM/G4KTsV+yjEMe23Zjij4YAkYuG5lZ/cG/yMnWnWBUKqj3lv8HmCg2mzY
	9S+MauB0opMv8EFsA4hCml0o9rhVnYBrqBGufN9wU+7L5mS2vuxOXMog7HMM0okkqBqNYWDnDvE
	TLRdciBDRymTzpq20F8mgGpIyCJhAeKqmN3mYy3NmruLu2JPwS7RKYXw6qTPUsily3PUTawvmr0
	KVAvHFK4JBT2QAwecXsUOOAN3nGw7bxQ1T2xHtXNmoiyRiRFOf5LjJHpRW4xve/8o1rDKhKIrdd
	E5yNlcV4YZqj0H6p43e7Ydy39jozmHr1n0Ik8XTRJozwW/pRN1WlIjy/begaOb2Jzb0zr51MjiA
	==
X-Received: by 2002:a05:622a:10f:b0:501:4236:5474 with SMTP id d75a77b69052e-502f77653ebmr23040691cf.28.1769135413662;
        Thu, 22 Jan 2026 18:30:13 -0800 (PST)
X-Received: by 2002:a05:622a:10f:b0:501:4236:5474 with SMTP id d75a77b69052e-502f77653ebmr23040251cf.28.1769135413099;
        Thu, 22 Jan 2026 18:30:13 -0800 (PST)
Received: from [10.111.171.243] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502f7ed650bsm7054291cf.11.2026.01.22.18.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 18:30:12 -0800 (PST)
Message-ID: <e0e6f248-3d82-4b0c-9ee2-4a655b7bbbfd@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 10:30:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
 <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
 <825c3e7c-469a-4d69-b298-18f2edf72ea4@oss.qualcomm.com>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <825c3e7c-469a-4d69-b298-18f2edf72ea4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDAxNSBTYWx0ZWRfXxC9nlgHzG3WR
 Hebkjd3IO198WMdZSEUyEAHqAUPUs6ry1cXvt4QOv5zPtmwyterEf4zbDg8bqfMAq5o7YURClc8
 hPsgXfSJqnp+lSWGaCmrRjqXOoAl6VXqhiGzCbPQXKR962LlyYywKQcl7aLRySiDUrZhgMHYYXT
 4VOscW+Do5DvhAfJDjZb/09IPzk4XtL+m4ndT/gxEf5telZ1b8Owncq4lFmhpUMeWHAkcm45Qe2
 H5oG3y9hB2dSly35kl5nbQuvPFI1ku/L4CfsUzzP7DcjAnpowqCZCjJ4/EdTFOHgWXH6DBvLWuI
 mVps98KXYkWNGChpxVsK3G+Mt7dlQhktZ+TJykuBHUzWmnz6LZVOuYtSHrvisPShVrvMkyh0qMy
 R/yMjEsQwTveaNazCeFUds/PCp9GYXAFIOH3uUMnl6kTLYTAfqYnECfUFbjGfqGv5QqFpcD6qAM
 oOl+YdMOoaZyYaKXZtA==
X-Proofpoint-ORIG-GUID: RbldFCGK92VCLFSXBiVtGaHRcfSPmS7q
X-Proofpoint-GUID: RbldFCGK92VCLFSXBiVtGaHRcfSPmS7q
X-Authority-Analysis: v=2.4 cv=YuYChoYX c=1 sm=1 tr=0 ts=6972dd44 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=yKNFHEXJphivSBQIcCoA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_183028_647284_9FB9466E 
X-CRM114-Status: GOOD (  13.37  )
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

Hi Konrad,

On 1/22/2026 9:44 PM, Konrad Dybcio wrote:
> On 1/22/26 11:48 AM, Wenmeng Liu wrote:
>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>
>> The Talos EVK board does not include a camera sensor
>> by default, this DTSO has enabled the Arducam 12.3MP
>> IMX577 Mini Camera Module on the CSI-1 interface.
>>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +&cci_i2c1 {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	camera@1a {
>> +		compatible = "sony,imx577";
>> +		reg = <0x1a>;
>> +
>> +		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
> 
> Let's define the pin settings for the reset pin too, otherwise lgtm

The reset pin on the Talos EVK board is different from the default. Do 
you recommend that I define the reset pin's pinctrl in the Talos EVK 
board's DTS?

Thanks,
Wenmeng



