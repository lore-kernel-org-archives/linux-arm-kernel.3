Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5CAC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 11:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/zsrPomSGC1iO5LSmQ+QJBzaniKLt0k5UGEjWJYgjM=; b=E0YJ5gM7xQ8UoQI3iza3B9IKUU
	9DLp9tNt0buSXGiXRhCnRwAVqwYIs+QCeJYhIizqusjGO7CwxG8Az2g5SK9ZPyopsWoJL39RMOv1a
	gNbCxLlcbVTbgnlJbTEV/OZS7TXoWCccpsLZNmssZRbQJ6H/DQL8dtyByjtEZGRY6h5I+g/VdYTMs
	UUF/s8hrgY6xBnFJYSf3I5O1qbCAoAOEpRR0ozp/+7QeBaDT5y5zz6oL39PTxl2FK2mFKD1+nBus4
	ZLYDgCPrf4zsQdUPmWdDQaVlcNRNMS6st6qFhtdcXlMJP883ngcTmcZQMaTNRrWrQPB2l27g49w6Y
	dB/bDYKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trxgW-00000005SD5-3u6D;
	Tue, 11 Mar 2025 11:22:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trxdb-00000005RjP-33gB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 11:19:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7mGfn001165
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 11:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/zsrPomSGC1iO5LSmQ+QJBzaniKLt0k5UGEjWJYgjM=; b=ZnMDEV2blLkM1v6j
	yz+sUf2hDI0q+GO8vzhQ4koX6CWHGWxt+USTTF7vdAR8pG5Pun5GL0xLGPYlFpHm
	VCercVTpc2OZNFgq1Sll8rcPHuSEMSkeUXkTWwDIC4JETfBANvLUmqAYvzEXbNb9
	9PXbp6u4k0bNY1+uhh6mTp377KkHSGDJ7g7unANHauZe+W5vIQGOoy9wXbYSKLRB
	fo8rNQvZvA1oRQ97U1Hbp4+soJs1FaqcTKjZIGA5CB1at82gqINh9OYZ9yy/44cZ
	BHksC5VzdSSS0lnRNBQ951k31rSH+lz+RdeKhnGtQakSzCUmmd0fdXHhUehU1Q32
	ygPmEQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ah3krp4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 11:19:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e906c422a9so11235846d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 04:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741691946; x=1742296746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v/zsrPomSGC1iO5LSmQ+QJBzaniKLt0k5UGEjWJYgjM=;
        b=VV2NKQ8Q1oHja9Vlh+szXbvs7HBcCFaPXQhZTDYXHWNRDOeIH2JjoU0p9F59TN0olN
         lD0oP+MjRFxt1dIPiLBkAtg5Q+l3KjWDn9QXcJB38fsG3o39zCWOl/VTovjCAVObrAlK
         L3CGSr0R+5N2dc1n/qFGoaXkaixiOVIIfC3I07X4+2RYcdtH6zu6Pe0gkFmq/iauw3oa
         juQwb1Je3hT9BC8NxB2R4jDooHnftWjlXfL5R6scJMm2BI67SJkFdqJn9xBVqWFPhf2R
         ItoyUEi+AcVDoIS6CJZGiZxeMOBoqbP4DZ/y2+iki9VMcTtGbGWqVT7u9dsKifWPccyp
         B9vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJllnzVcJp8gwwW3WQWUK9t3gImvgH3Ipt2EZpS3QhqSAnImcq2PbbahmnEebIMZufXptx6kYKT2sY33Y3soeO@lists.infradead.org
X-Gm-Message-State: AOJu0YwIQDr7JLekaEzcJzutl1GN1md4tavTwdOGJmP4G2ZMsQ/JHTIL
	im68AQOF0abg0aQQETFg37evIDtTCfrFBJd/m9cKEPOnuVxBqKy8ZzSDGfL8G+c8qDK25nlDwlf
	s58UyEnDRK+arzKkv+POQVxWZiHKEXoQbqRhPFUmL8JDJOjtwiR+OrIc/kIKYOhnrc6wYKbCRzw
	==
X-Gm-Gg: ASbGncuZjQFT56tCtjLd7J7q+ifZttHL5Tj34kG+oRL4RQFUhEBXPuWOx1CPrcKfdWo
	xM56wMy9C+qZNxslzWQHzMYNTDrNxkbDR3O4xaYtMgYxtduvdFjCl8jC7DVRDgLFJdAYz8XaCFb
	5qZSkxi6FazozdI9cyPLQnA47PAeJ2aWgjidyBtKU0ZDS14rXaeBb9qf42ZKcC3Ylel6H8xlozp
	gErVAEWKPC1AAISFAqRQk2Amz9cDdck9aFGNucCpXLzL8bXxgiR+waeT8bdjdxjyhyax/RC7liT
	WTFPMRqBuF7odHjy3MJQ9wC6wTCtiSTGRAT8YjQIFsKi64lo89nuVjTSAGZzzzIUSgwJ+A==
X-Received: by 2002:a05:620a:1d03:b0:7c5:18b7:506d with SMTP id af79cd13be357-7c53e05f9c9mr737227185a.9.1741691945869;
        Tue, 11 Mar 2025 04:19:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMbOo9/SytOGUrUMo2XFyejsZDSP+j5JNs4kPwfKJu5yFVYu9xbBZSRIJg5VV2VeLv97QvVA==
X-Received: by 2002:a05:620a:1d03:b0:7c5:18b7:506d with SMTP id af79cd13be357-7c53e05f9c9mr737225285a.9.1741691945534;
        Tue, 11 Mar 2025 04:19:05 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2394fda1asm904961866b.78.2025.03.11.04.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 04:19:05 -0700 (PDT)
Message-ID: <69fa7f33-e957-4dac-93dc-6fd40167873c@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 12:19:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] phy: qcom: Add M31 based eUSB2 PHY driver
To: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-6-a698a2e68e06@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250304-sm8750_usb_master-v2-6-a698a2e68e06@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MabhlbqZjyaTTl3kKXUSCEZ70UeA6FFb
X-Authority-Analysis: v=2.4 cv=MJiamNZl c=1 sm=1 tr=0 ts=67d01c2b cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=obrcSLqBe2MPJ_po3l0A:9 a=QEXdDO2ut3YA:10
 a=T1PIRxOFuHhLvSGs3xkl:22 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MabhlbqZjyaTTl3kKXUSCEZ70UeA6FFb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=908
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_041907_782181_2F37DB65 
X-CRM114-Status: GOOD (  17.49  )
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

On 3/4/25 10:56 PM, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
> sequences to bring it out of reset and into an operational state.  This
> differs to the M31 USB driver, in that the M31 eUSB2 driver will
> require a connection to an eUSB2 repeater.  This PHY driver will handle
> the initialization of the associated eUSB2 repeater when required.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

[...]

> +static int msm_m31_eusb2_write_readback(void __iomem *base, u32 offset,
> +					const u32 mask, u32 val)
> +{
> +	u32 write_val;
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(base + offset);
> +	tmp &= ~mask;
> +	write_val = tmp | val;
> +
> +	writel_relaxed(write_val, base + offset);
> +
> +	tmp = readl_relaxed(base + offset);
> +	tmp &= mask;
> +
> +	if (tmp != val) {
> +		pr_err("write: %x to offset: %x FAILED\n", val, offset);
> +		return -EINVAL;
> +	}
> +
> +	return 0;

Is there a reason we need to read back every write?

Does this have to do with some funny write buffering?

Konrad

