Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D317CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 10:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WY5c/4zmxkse8zO/jjJDr+KBk5pvA7tL5tyLdCm4lew=; b=wXuzYZOJ8bQknPsWpIrJRbqmMI
	jtjT7fHMz2JvI4xSdapPjHnANxzx7jLe4UQzS+J7Nsh7jYArXrtmxqmTKynOzjnrpDMhRn/hq569y
	ox1YHp9CZn8o7SUYQDyw4xaJTyKYwoTkE5Og7di94i/Mf7KuUBo8KWX1MnF+d6kRzu+yMSeUFhw4H
	mpRa/NNLHu1eYQLFSlo355X0G12X2hXtWEVzzHse4VGn7HwqbiWJNKtdY34u9i+rcRsVbh0D9AANA
	QW7ifdpVDnpfWrMQFeGKSyGdpj0nkZOrJ/d1OAaleNP5aZEkUr0CJjQCmFpFHcrPPHhbIEgpxneqq
	1Y/juN0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6R2Y-00000003bhO-3DkS;
	Wed, 08 Oct 2025 10:04:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6R2W-00000003bgt-2Aff
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 10:04:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890R3Q031369
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Oct 2025 10:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WY5c/4zmxkse8zO/jjJDr+KBk5pvA7tL5tyLdCm4lew=; b=M6+AV9lpMWbOcqt3
	qjpBnBgUt3+kUBPMRX550vY10O0aukIcpELdeQNvPcMa6hu50DPTf6IVHpBmJcT+
	GjnR3323XooBNylzLniaaikE0uzTgqKXZJYmevNo24pVhmoEJrbyUsli/NkbczSR
	Xzn5kzt1kG4fSfjzDVAnAThFTeglYuxKcW/VL2WLEqPuqpl08r4Hs5wZBjSumx6u
	5QFIFiIKtxFGTUhkBuVyPR8XTJ3l4+cRl2mKBAh0aKzT2Dj0MXGhYea3iTmmk5G/
	HQa+kOgIOc5lzvqmAZTewkS8xuMIOWJMbg3cPgnzBNwDfU7238zfeiyxshzx5/R9
	wD72qw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7swf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 10:04:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-853f011da26so239771785a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 03:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759917893; x=1760522693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WY5c/4zmxkse8zO/jjJDr+KBk5pvA7tL5tyLdCm4lew=;
        b=mc0eQR0RkrRfUnFy6Y1hewAZXgz2eeujx2DOpW4YgUoQYG10vNlwUrQVfducxFYPHc
         PJEphZchKBqoiYu/b+MkORTZOQ8uLZcvAtaOcu542mIq6ZIXF5dTq12v9FUdOXe1XHhP
         xj5tj6Opnl9LJSUewqosd5rPwdqMPs5VqA003wsS5GuueBHX8msgJoLWPLyatTasAB/R
         UGjNZ6NdfTUVuzbcziFmMOdc6AGvdfXPE7hoMmwPphr/YYXfkcwh36b75AlZjrnfF/wO
         sblJ8+N7AucWaeKtC4lQJpgzlQkW63VWClMCKkx+4rAbw3/CoHJZlX7phYH7uz7ebr1K
         /Pmw==
X-Gm-Message-State: AOJu0YzqT53A5A3qrY4LZ5h3M5JUTH67fc5DVYzZ9EtmqODMSsuMfIfv
	jBV+v0B+EJAVC9q7RMEUt2e8W8CzYwNxjXqF8nWA7itrM42vmc9TxfUI9gSPGz51n8ue+5DcxmG
	H/V2uRjG5ghBYCJbq+jCH1rFGz/sBn1kY3tkpPYQF+VjMeDin/a2TjGuNkpECgMG3RQOzNJruOu
	9cVw==
X-Gm-Gg: ASbGncv/xlGnw17pkQU/SkB9SN09wflfGblH7tEC7jcj81aEBh+k/dFRW87Rr1OnJKz
	biy40y3IVzX8GagwIa/RDoNh39EgR5SSnYPWhsE4q/j8JBKygVWRuKfiWj5NLQgtoy8S8NfF0VJ
	LKJd14R4edOXNbiJkt2unqsU0VDYPUTRmFpDntuXet3nE84sn0tsRp6HzDir4VIG++cYxylTX9c
	uyzG3+4b3xlR5lHExZdEwOJrJjrR6+T8HM51g9vKgz7bDGs+Y/WOgXHSpfTKhHJ8z5q3YMxajCT
	xtHymADnCCh7seWKRpIbp9DWWJbvnDIxJJMN75/ZIEnuua+cP4Bjv1o6+hI7ZfJIyNdBzmop0ph
	SRRSQs/mbRg1vCtc8pp3Oem5S4gE=
X-Received: by 2002:a05:620a:2681:b0:855:b82a:eba5 with SMTP id af79cd13be357-8834ff907a4mr267584185a.2.1759917892488;
        Wed, 08 Oct 2025 03:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsrYk53kHAbHUIZarAeviZCZN3o96KECTh+dhZAtSwTLjkr+Lu3URbxUm9serLVoPCrHnkiw==
X-Received: by 2002:a05:620a:2681:b0:855:b82a:eba5 with SMTP id af79cd13be357-8834ff907a4mr267579585a.2.1759917891846;
        Wed, 08 Oct 2025 03:04:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b0c7sm1688116366b.57.2025.10.08.03.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:04:50 -0700 (PDT)
Message-ID: <1afcbf5c-f32a-4115-b2ed-583a10758045@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 12:04:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250909114241.840842-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfX4GkDMSPEDM9X
 JN3P1XFcWj0Ajp8cNSfLlrRUb7kqxVcJt18vW9Jhm2mytrbqsaJfaiFtW3jsKMgs3rEg7pI6JtN
 PPSmDBtN2b5/fzQ6zuTXSEmk2BzTSt/43AS3AVziWVJS7Y2XsKn3v851QhHcJ2aGUjO8pWYlP8u
 0I214VyY1XYUQcOOD28gYPIblkLiTXYtHL6I1l1C3upL3k5q38C2eyfQCc8OabFg41+GnDxpoJ4
 9ApbzTtZbicDDVtlpgDsZofbtNhQQytfJQhXNVNDHdyvgHgkGCRs9z1kxTZkYGVRpfu2iCxWqy9
 3oEVL6M2BFU7ZTRjovVvXk+6ooRWRxvzPvr6HvHgSxvdSoGq6KHL03aopmY4B9bv3P+LBbrXr4z
 fQJmE2RN41ZBl88ZsfQb4+jnnXjqTA==
X-Proofpoint-ORIG-GUID: Uq-Bn5MKQJE-KiD5galgEGcfp-bTHRNp
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e63746 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=prks0494CB43s1mVRQUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Uq-Bn5MKQJE-KiD5galgEGcfp-bTHRNp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_030456_564537_B3EA57D7 
X-CRM114-Status: GOOD (  17.28  )
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

On 9/9/25 1:42 PM, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Add support for three Camera Control Interface (CCI) controllers
> on the Qualcomm QCS8300 SoC. Configure clocks, power domains,
> pinctrl states and two I2C buses (i2c0, i2c1) with 1 MHz frequency.
> Nodes are added in a disabled state by default.
> 
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 309 ++++++++++++++++++++++++++
>  1 file changed, 309 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index a248e269d72d..a69719e291ea 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -4681,6 +4681,123 @@ videocc: clock-controller@abf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		cci0: cci@ac13000 {
> +			compatible = "qcom,qcs8300-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac13000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,

Does CCI really require all three of these clocks? AXI turned out
not to be necessary on at least some platforms

Konrad

