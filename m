Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1CEC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvYd1deVAhihvBAnBWJn94CrhAU80ERbjP9yegxtMRc=; b=GotpJhvQoX6dL36RXLv0D4WBm4
	H23EtjxW3t1+o3Rdt2Fiykv0JRfVf/HwcYeV1x+9ew33Dp5yhwKer2Mt2Cml6e/vlFWKfD8MEeuey
	f1WYEYC63DAFLXIX9mN6nUzwd0AvuasMCJ776TUU8BEdUAiVyUDTs5OCLjcsj9K0vBMnwEIcBHChP
	9QXv7saftT5UDI7DeG3sq/llyBoXxLX1nBmzbOkCD+k8cL1AQamJLh3DZgifFymKpvGLwWlKQ98lc
	MkXJ1QK8jAsL407XPQWEUyuU5MbQPKUiuWY0LATAM0KYjxbRMRKlys8QffPFqkHfJdffiqs3IIKka
	xsgL4ayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCud-0000000FPjR-2Fhf;
	Fri, 27 Jun 2025 17:30:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBvC-0000000FGMP-23gc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 16:27:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBmNZK027380
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 16:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lvYd1deVAhihvBAnBWJn94CrhAU80ERbjP9yegxtMRc=; b=bDXLCAQ0cbgCnzoi
	lm+zHp0o4lGhoQHyD9gxNOKnTFOFDsTWHkH8HmlD5/uBJW4rnl8cXb4Iiurr8HK4
	XWXZUjskbqOFfdlzu8eneXoVRrnHQ0izL8V8U8OGPVNi+/19sBQkKUkT0qngbbsz
	e6H8F3kGVCBMhN9ByxZkXMJfSy/TJnOIRDEDzWtUNA7vCW+VYrAGwBcyNr8ntvII
	HNexMP22VMPgv3qVSUFsSxkjm5C/EVvoDKtIgW4KZ/4PGBIG5DNfUa6r+J3jnP0d
	kzQsq+hYUyJaCEOlqcb7dIarRz7UZeNBOPCWu1nBFcZZieEKow8ZsZwgO1wTFWZP
	yn6sAg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26huxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 16:27:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0979c176eso47155985a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 09:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041644; x=1751646444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvYd1deVAhihvBAnBWJn94CrhAU80ERbjP9yegxtMRc=;
        b=LXVQW9lkaeP3aPTU4V7O9BC4jeGp0NH+Q69PoXjpQFHkZs225RqJvnj8pfx+M090BZ
         8E0CdvCElCB8BGQcIJnN03L148QMTIuUAnnlZbZO7Fe1Jg6jHV8L5LqGokCAr3eIjqS+
         uSvsha00LXpDcOSJcQ3yjrhZVJrrJHHGkdzy18yj41sx3tJUFcazaIGakarw9JeD1t/2
         1Yd2G7+n2B4vJT7FaG0OWAWXt7z0fnFBWgO4HGWOCYMJsjztgXPwCzz9M+zUam7Y5xoB
         E89NENA0DMQfd8IDvvIuvFDfMIfZshbFIA6EWMwo7476cuO1FY+v0JCa1u6xdVVLRAxS
         WwCg==
X-Forwarded-Encrypted: i=1; AJvYcCURXiKBFxEvg1ZyWh9rF7WrW+XmCh75bffnSGLn/6+XTQ22YcSbniCvCJPtXMZxIeM/DumzbhmQCffYDhFNBLCU@lists.infradead.org
X-Gm-Message-State: AOJu0YwB66WoFHSB6WzFyy0zu+lFXUzaLyTMZ7j9R4TRwjCMywj6ZNxZ
	AjVttwFDmG6NVoZSTTAhHnSjYmQ8DtJMKVkkf7dMygOco5jChrxSQq12qYwFKItxvl/L/j/y8R5
	ScRpsuSt761z1Wq0SZWjQf2f80w6vOKFPEQr5vvWturnDQXNK8jsdLYlQNbVLmORd1JEp/rGI36
	zrCQ==
X-Gm-Gg: ASbGncufRCRslkPypLFUyi/8+wjQuKizjqF/+8Lqy5ibmnDt+y+fF1jMhn4bEaL70wc
	biKmo+cAGOk36iL0yftfPs5L65x080ug1s7FflqUeaREsaFgByg6WC1ciJm7h8EvMfT82Q3lDSC
	oqzSdVGcYwKZ3Ta8Il2ZTIodItI/WE0cmEJBwTXX9O3klvAM3Ml7oh2xz859n4XWg+XeQeR4o0J
	DH9b+yFXWwbjXSeVWosWtsVAhl3PJm+kZNLPO6Xss8Irq9PyFo2QyyZM9QWpa3C1hSZ5etfMJXp
	Qz96gzv7ZQ1hwguq1ZTB6YUIFFu4Ji7ogP38XkpfrR6gKddRNh0lv6spDR7slI5CcXfpD3jo4M9
	Qy0w=
X-Received: by 2002:a05:620a:6011:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d44393af52mr224993785a.8.1751041644580;
        Fri, 27 Jun 2025 09:27:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQx+88Ksz4ECZwUoGt+Ed4X8fsAOVBGWYUZ4j8qk+znxirQR95/4sMWkJF3ZwWKFN09XhTLg==
X-Received: by 2002:a05:620a:6011:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d44393af52mr224991485a.8.1751041644137;
        Fri, 27 Jun 2025 09:27:24 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353659e12sm148855366b.40.2025.06.27.09.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:27:23 -0700 (PDT)
Message-ID: <cd6f018d-5653-47d8-abd2-a13f780eb38f@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 18:27:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: ipq5424: Add NSS clock
 controller node
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com
References: <20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com>
 <20250627-qcom_ipq5424_nsscc-v2-7-8d392f65102a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627-qcom_ipq5424_nsscc-v2-7-8d392f65102a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzMyBTYWx0ZWRfX003i9jW1/Gav
 lKa/YKuRR6EFjnylN5+PW480Nnydmnhtfqav+ap8dag1JFOphllqdYREmBZTi7i9Pr7czT+LGyn
 /kOpRcQeNJhpJl8q97jyq0/KO5D8QhoDk2kckmODtpgIwGVJbklKR0voQBsfq9XF3caQ4U6mYaN
 FVNonnzSkpPiY2z+afYlqyNqR2g6B+fcW46X7xqIiV40Hcr1Hn3vHN3+UbAyuj/xmHjcZcmcisr
 TTCseM35in5pNWSnIhFEi0crzPa6RdnxwFSpU487CYJXc6v6gk9PiS5qAHscDrlfE9EWie1Xa2h
 2EsX8VXnyU7bLCahO91QKSD/aAXq57kxkqciF6g48OLR3/bGv++L3P6KfYHRDVylErOn7aOsao/
 u4NUhIYai343UgPJmmWtqKiwKdq1mOybKw5WMA4w4BUW7ytuPxXWTmA6aviGqxISOoZgUCq8
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685ec66d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=f6GukiY9ARMaQ3Zrt0MA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: u41eCGMWqbvsnNUl4bY9xdSph03W1hMk
X-Proofpoint-ORIG-GUID: u41eCGMWqbvsnNUl4bY9xdSph03W1hMk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_092726_539144_AE6D8453 
X-CRM114-Status: GOOD (  15.45  )
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

On 6/27/25 2:09 PM, Luo Jie wrote:
> NSS clock controller provides the clocks and resets to the networking
> hardware blocks on the IPQ5424, such as PPE (Packet Process Engine) and
> UNIPHY (PCS) blocks.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 2eea8a078595..eb4aa778269c 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -730,6 +730,36 @@ frame@f42d000 {
>  			};
>  		};
>  
> +		clock-controller@39b00000 {
> +			compatible = "qcom,ipq5424-nsscc";
> +			reg = <0 0x39b00000 0 0x800>;

size = 0x100_000

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

