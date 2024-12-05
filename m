Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213DFE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 16:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVewGd+CHap/GFBRG9A4Vc53nu5CRbniCuyyyIyrS/E=; b=lA1mvgvVJsPF5JmLYCx+zR+0AH
	/XySRNucq16ZqF/IjCsgKUnXMehTg6PuRmAla0PU9DttLZmlFSEXb37W61XKyovMhz1PI0bOXPbpY
	w2jsQ3BNw2HrIX4QbchXauFXpjmzHgZPg9okqlzQ7KPyIR4GkoWc4gJ0p/oKRIC7p0fntXxKD73Tf
	Hkwju1Bza9wiTyMyt42zxvPuS+8nCgu2hLdBZYFiefoDrJXoxomRxeSHziOD8D4JUweYStdB/xsF2
	DBWemx2TeqvHdlbZAqfz0FsHr0fhKHXI8jlS+V2jSOk8e7GQFKjnhDwHw2AenZ2fAbX2jR30YBbwZ
	k6hwI3Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEjx-0000000Gknf-3TCP;
	Thu, 05 Dec 2024 16:30:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEiV-0000000Gkaz-28jM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:28:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B59whmZ030449
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Dec 2024 16:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EVewGd+CHap/GFBRG9A4Vc53nu5CRbniCuyyyIyrS/E=; b=Ch5SBvcB0TbZns63
	81Peg1qa9GnWJwaAeVOgwplc7EZrn58imN7b63HagQ6JYvhDMxyBgtcaT/pmueuB
	zkUo2dJezjDsRZE+nbXSJnkLFlBzX3ZP8wC4PzS8mDIZPQpXCp0yy6E8LkoLR/DQ
	V3w+xxssOZOK08jCqrhFmfzGULacHOFNW4ZY23LdjK6pRM42tj28cJeoU6LNeCOQ
	PL+AxoFXYpW29PE4Z9V4mNkiv56UTIzSVPRwI+y/myG9y9EVMLcWumWjOeHxXYpG
	vUTvJlD6zXzVds1K+BYG0s9XDU3kJy7tWW1JTxKmz1qgGrx9ybNFOJMMnQ7eIh8K
	+MCIaw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba1412da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 16:28:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d881a3e466so2950696d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 08:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733416117; x=1734020917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EVewGd+CHap/GFBRG9A4Vc53nu5CRbniCuyyyIyrS/E=;
        b=OHz3cESEZSSbd8ug98+O3K/cLLuG1Jp9Z5LGb3r0OIJvl3UxwWDF1C3EJcosDEpK+w
         0IMo4o/0WYNfg7JLjxZHEAjxgRwD1obT8BSz2lOv72o/UVpF/3d80D8Fpy/o93F9Q5j3
         9jBuJpd4PBX86Ky3sxCkcfCvlI1pV91S6irfNCwjNyKbhdlRv1paYsY8pcInPzsnGIy/
         KpLeFCfIvp+KbILJl1r+VHVQO0wBAUiI7ELc9vKzaFZXa27K6zQQRuxukPUsjqJPNSLC
         5M2qIlWRcj0zMF2PyoIJqXlRd5p7e5MahwKfztX02Tu3o5wqNcUsfqkAm2B2fuhU5Ums
         acvg==
X-Gm-Message-State: AOJu0YxSQGO9vGAu5XVLGNF+4aI61ZEhOjQMQ8jubTW4QW3+AcxlOZlE
	WBwZWKmdDtomqadOH+qCmWP1Y+plhtluhmVs28lLTpMDE3abWHc0F0Vyl/OSHhTG3bko93qKn9r
	oAS+r5w6ayoqmU9gWLIgHvMu/hUgAl0a0kgDD3NUh+i6aB/nqidwK0nKH+2g4biULzJ+TerVFzQ
	==
X-Gm-Gg: ASbGncsnxxKMTzX7yCok0mTGGTweHDLiAtqigMjlGZ+aSUp2mp86zlfqs8qmHAFqyqW
	vb2Q5ZKGC/NEGSnj7nimir3q211CNbRkNAp7X/dhQ0OmgbFTJzYNzRTTjlAjYzpA9LWZK7rNiDH
	3W8MtAra40MRKyPSRl/5jIAtoOb+vD4aFrKzjYS5Pswt8S+J50yOcLFd0fSHYma7PEjSGfvU/IB
	xyWM5BznuHWZNOLFziFsJDrdcMr8v/66gSKViYX2GZ3TGIIq4+/syrzuRTMPeJjIiMU3oBVaflW
	cCIPFvga9zsup8RvebUw5k2raXV+uA4=
X-Received: by 2002:a05:620a:2a0b:b0:7b6:72f6:210e with SMTP id af79cd13be357-7b6a6bddcf1mr653503785a.3.1733416117639;
        Thu, 05 Dec 2024 08:28:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIQmJDqB7aPqLdNqqxjOXlNlTRx0vV7ECtpg6Wubt2pVIN3Isf/fldXO36qKZaV1jYkkt/Pw==
X-Received: by 2002:a05:620a:2a0b:b0:7b6:72f6:210e with SMTP id af79cd13be357-7b6a6bddcf1mr653500585a.3.1733416117234;
        Thu, 05 Dec 2024 08:28:37 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c7aa441sm964726a12.72.2024.12.05.08.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:28:36 -0800 (PST)
Message-ID: <e586b76f-50a7-47cc-9ce6-a37f9b53262f@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:28:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: sc7280: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-5-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241204100003.300123-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: La-7ua6B_Tda5fgqjdZNSiPUC5rsj1MW
X-Proofpoint-ORIG-GUID: La-7ua6B_Tda5fgqjdZNSiPUC5rsj1MW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_082839_669764_58D4B65A 
X-CRM114-Status: GOOD (  11.48  )
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

On 4.12.2024 11:00 AM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SC7280.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

[...]

(isp@ as mentioned)

> +			interconnects = <&gem_noc  MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,

QCOM_ICC_TAG_ACTIVE_ONLY

> +					<&mmss_noc MASTER_CAMNOC_HF  0 &mc_virt SLAVE_EBI1     0>;

QCOM_ICC_TAG_ALWAYS

> +			interconnect-names = "ahb", "hf_0";
> +
> +			iommus = <&apps_smmu 0x800 0x4e0>;
> +
> +			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +					<&camcc CAM_CC_IFE_1_GDSC>,
> +					<&camcc CAM_CC_IFE_2_GDSC>,
> +					<&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names = "ife0", "ife1", "ife2", "top";

vertical list, please

Konrad

