Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79694C02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 19:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2oCQTDyFtzOd9uDuk0k/6IADn8jCTnEtRWIODY/B3s=; b=ocgYFJFur5vqcSR2GddanerX35
	qMUJ++0Z5e8efowojeBdkdzaxQZrNLK/yDO0uDP0Bj6a1ASeEQOkZFLFKiKTl/vh9+iHEx8sbMQfZ
	gyaxrmf405gpJ285d98ZJ4rmX/ZLnV57MXClwbuK/vjcD66WPPXecDdS93EahELyOL9SpBBo8gDSm
	OKr/nbyX+irg511IMq1Vfe3qNuYbu/lUBufWJK5m2FgDuW6+xwvB4JP9vO6OiYO/jfhFhcw231fhO
	4NE1Ij2b/WjFJ4XIibruihHjzNbP/sEBP7uriWVhh9w/qWOS4MncykkliKvA3jci6757p4j/N95Ji
	JwOkdtsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYVc5-0000000FuRL-3Yeh;
	Thu, 16 Jan 2025 19:33:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYVaG-0000000Fu0B-3KOn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 19:31:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GEJeSO006599
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 19:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p2oCQTDyFtzOd9uDuk0k/6IADn8jCTnEtRWIODY/B3s=; b=MXJQZwt5zFu72kpv
	RCn27+pG1vgqfm1+XSm4qU6C1/n2lf0zo8jeOY2xQ8jHveJ83l4BqhAgMkXFr+nF
	e/9CAjpd9GGjd5cXO/TLxq+pr9WRn007Pwq17aFm8yCyiHKGeuceKZdeDjyPstkC
	o2ne3SEcT/X1Jfdp6mVbpiawhx0UJtFA7a4fUHgsT0mWmp//uHPYl1AOn5szZF37
	oq6Fxka8W4IL7KhkDuNd1Vmx96slz9T8ASJBl3uU3SArVYIq4lBZf5Hjc1exmBSX
	/3aO33DY+ZEL9VaLwl1J4xpt0FKi2WDa1v+/fLPpbSfc/1/c0lw51N2Li6l4oAsK
	FKKnSg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4473se0sf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 19:31:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d880eea0a1so3237746d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 11:31:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737055863; x=1737660663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p2oCQTDyFtzOd9uDuk0k/6IADn8jCTnEtRWIODY/B3s=;
        b=bJE03jn3TK3MDP51InZbKiWEQkBEysyPUvYjzcYU7vKUJjHuY8Mt3IU0U9oFuiA2BE
         VdtMo6yv/1x/4ai1mFgNkC+Kd8fHIdfPFK8gE9dLFhKBn6ORBsLf3eRRxv5vRTNWJ1kq
         oOOAhFK44+aAiXmVjicioiUncf1Ro7SX5FMDQv3bxWBLMyeg6hI9k4cGVXWWhRkZEOYZ
         Ih4eYa01Jk/cG2Xmf0U/VVscGBeeYuyuaITWcVwOfuPBKPxv3x3MvsVSkXaDVQIwqP89
         ZpqVVLZHIMeFsOkV5vsUV14zhyaHuqzsCQxFRNI62f7Xxl7rSEFaZ4rfo08asB6sKIlH
         cFKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE7c+iBvmK0WWwkwiJ4crtQXc9HA/aT0H/gVertCfJ+mk9zOKwFDK1ZrNqX7tJ4n0WC04/zL9YKG9u5D5ur9jc@lists.infradead.org
X-Gm-Message-State: AOJu0YxjOlTWRnVW+foJzhbpnIlGRUI/y61TkzUJ7A1NXH3Qu0SAlaa6
	XByjiaP/AFYZ3cV3odS9CQVFxUpEWJVpxD9aID+cBowqpMx8sp3Kong0gc572ro+geh1WJQCKjH
	m2XLlWQFSN4XZGyad6QrYu8ztztw6+lOaJJNzrIiEp1KAyOgeeOUv/vfhMVrYMBqydY1K6BpgCw
	==
X-Gm-Gg: ASbGncvXDn6wboxkQ07bvMl3WqRcsMvSJ7GCAGv3tZLA63DXoipgVIsLZ99h21+t/RE
	owgDtsUhbquQtpasORpoK9icHED4OztSQMzE7D+VwTvFsqV9rJW3VstYJTIa8eaBbu9G0XlDA4U
	6HBIrAKlDa981wKlQcACigYb+n0o2UdaJ/AnNHZZRvwK2gwihr3J9YLHf2+LowN87f5RPRrd/V9
	5nDSlOc1KAbZwz+bwezLXWgnqvyJDCLYDGnyRtAH7syvewkHB2dti+qUJWo520fK2DeQXzCQM2J
	vJBUQ7oY/vZVCjl4Y9AL1ImnpyGaJn0hM3M=
X-Received: by 2002:a05:6214:3016:b0:6d4:1f85:3975 with SMTP id 6a1803df08f44-6e1b21f207cmr237126d6.8.1737055863098;
        Thu, 16 Jan 2025 11:31:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoEvs3dPfn98G/nJY/KiQsPoGomSjcKF4fvgXzqrXcQPhHh0k0bJ4l0NVlAcPX0Z3NeGEoWQ==
X-Received: by 2002:a05:6214:3016:b0:6d4:1f85:3975 with SMTP id 6a1803df08f44-6e1b21f207cmr237046d6.8.1737055862745;
        Thu, 16 Jan 2025 11:31:02 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f86265sm37902466b.130.2025.01.16.11.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 11:31:01 -0800 (PST)
Message-ID: <e08535c5-33e4-4f9e-a234-deae4f179371@oss.qualcomm.com>
Date: Thu, 16 Jan 2025 20:30:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings
To: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xPgatqrUu54rdEVK_GTJs7GgSfjP7hEM
X-Proofpoint-ORIG-GUID: xPgatqrUu54rdEVK_GTJs7GgSfjP7hEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_08,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 adultscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=763 lowpriorityscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_113116_947911_ACC5D346 
X-CRM114-Status: GOOD (  13.31  )
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

On 13.01.2025 10:52 PM, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> On SM8750, the M31 eUSB2 PHY is being used to support USB2. Add the
> binding definition for the PHY driver.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

[...]


BCR>;
> +
> +        #phy-cells = <0>;
> +
> +        vdd-supply = <&vreg_l2d_0p88>;
> +        vdda12-supply = <&vreg_l3g_1p2>;
> +

stray newline

Konrad

> +    };
> 

