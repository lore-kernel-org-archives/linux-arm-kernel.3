Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307C5C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 10:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2f3dK7+MKJ/z1loG9CU/AAIIV64HRI5KTaq4hfss28E=; b=gU0aX06pSmovNSMDzQoJxS2Cx3
	33AwYjDN1RYjmLlhc86FP0OoV4FCCnZyCPIvHBXciGRXVsoQ60bzdPi5HiHAtXTAIiIVqf7FqxEFK
	s8GLUWLjkA3QA1iHSgLVK8M0ngju7/UZpQrpQBn5B4sTxqWHXUFxGSpBUscWw8kMrPHtgw8og3W2s
	pSoEOsNDknry3Jwj71YigDigfx9pdZYJrbb3UwohJJaQp2w7HmKxQ5scKdfUAL1koZivhkD/xRYq0
	fY3KMV1mPcXAfd8UD34FlKeImpa3WytLSeLOtVSvBuGLxSRJChJOo6LP5oO6FlsaELIevTlD0aIae
	cHYy5txA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ttK-0000000Dh47-1s1Q;
	Thu, 24 Apr 2025 10:33:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t2w-0000000DXS4-2PNV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 09:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2f3dK7+MKJ/z1loG9CU/AAIIV64HRI5KTaq4hfss28E=; b=ED1sIoxEBq5TUJUoXMucAYocuO
	3XhcwXeUKNqTEkLgZlsM7XxTs9fZ+yNnVZKFdicNmUXZUhYCVm3c6bXqL2q11Ht0Wn3hDH9Yuue8u
	DM9HeD+pfqvCs1zuPG3WOAfjGpHJSnq9CQf9WnaxWKVbVaLhPPP+lHcQTXBHMcveRO5YPSGSdeDC+
	9/udA23Cu2AizLewYoNOkqUkBwwatjoHrhzX/zJ9Zf6cTvaYEYLhiQqy235imAi+0eyM9OKuNv/XO
	PLR1sF6E65K3j+M8sC6LqXfosDpJGnrb/XJ4nq6CfFT7QXcdJNQrlKSq42ItKHW5Kb/MxBC+VIPYb
	SNPogyEA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7t2s-0000000Bgq7-0WlV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 09:39:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6Bq028361
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 09:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2f3dK7+MKJ/z1loG9CU/AAII
	V64HRI5KTaq4hfss28E=; b=U8a1newRJEdS9P6IAa18vzlihzo2D9BcXOdX5yOJ
	Oa4bDNC3lgOmphXitQm4leabcGaZDhhlNzJl9KhHxDTKGiliBt58f4p+ZiX5y/Fc
	HFqmdOOHc4yXGvsNx2kWMnpj8IGnoxW24Im1ZkxZFykXbRWmjt2K34atY+Z6STWf
	Z5zU/4rlDMrOGtRiG2dbL4MAJQ5MUAyC7YbQPvoQKvfVIzOicN264g1THBFin/xW
	WKSOuTeu5IUxqn/gNk78m5HtLVbVsx+CJZq8zMjBJTb+P4Jc9VyvR/pazAHoljvX
	PU+FTpYnToVVBWwDfWS9azPHsXRkF7YqnR5IMTSOYndiMQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy50w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 09:38:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54e7922a1so163083885a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 02:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487539; x=1746092339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2f3dK7+MKJ/z1loG9CU/AAIIV64HRI5KTaq4hfss28E=;
        b=Z2AUm5zqlhp5MY5mcOmBt7M0oY1JwlnqP3QmOs7bJnb5aMCNp2X3evGatXzROpjKyX
         pjlAKw1CKQIRHcXAF5FTqJUhTmNwH+qxZuYV1Cn84jRf3xGClfauk6KR/yp1PNX2DELO
         YEG0Hnq2LdlFTNSINSUxAw+5vhe5FJ1/1xUlBREHqefwv6l5xM9lvNZUe9hvxWQnXfYM
         hdFqFt5uDftnKESEQBiqFt47n78q7WX2fLSxabGI7BIh2sM0rRK1Q3gov/KpNgoE2Op2
         JqJCkW+IEqzYj9ppZkl/FkbIzXdlfaaEhuDdJRCYABg2eCXNHX5Vtg4HFfAz6cUG46an
         9UbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFogjrk+NvPa0w1MMDCejGNq96nkAWz2ekqrIU/1rZNUfOnXWFpHH3wGglaF3MR2DcV3IPbscETnTqZS7Eg0uf@lists.infradead.org
X-Gm-Message-State: AOJu0YwdFuK3y3+7B/YP5qyqb/ygOztCoM40x6mdK0XiSBCkG30MEqQl
	3D0sCYcJbETgjcItzVfeTU60+jgW9KuysAkxRxIUN276ZGNlkOjZOPRkdIPewQF1nS6US3kNaqP
	g103DLARYA6rs+G0DbDO80tRAtQu7ikrsFUeGcvWTLNCRcP4vb3fSL5YFFnx2zviSp1iqirbGJA
	==
X-Gm-Gg: ASbGncsiYPGWGZkjYMJCw6ws0ZGQkTH273zwoyZYce9KcAOXVjVnTspEWEy6BC0FAo8
	U6RWrG8V+wr+evPipNw6c3in1F+qplwtk7QYrHrIf44a+kps02N/TocrXu8k+HhFP+82tLZvv5N
	4BsGZjlYLadcxwISxNrxKpcSRCwqKmU62WbOzUc4p6gHXqKSUVMSODiH2zVGnkInWmOm7J5StLN
	I9SAxdj7rp4PrsshmnDHf0XLzorHo+JAac+w1OVwy9NurXM21MTapD8AbzBtiGAt4dTIaeSzrvm
	upeWY2VLl0E6M+ni+Ux2yF7sGLtY9gnr3F+1h1C09uUYNTKf+5blmn4yMXJ2G5hUyVoF1s05pTc
	=
X-Received: by 2002:a05:620a:290c:b0:7c5:9a2a:aac1 with SMTP id af79cd13be357-7c956f281admr276027885a.46.1745487539298;
        Thu, 24 Apr 2025 02:38:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVpA1BUKeX5X8TebYkgy0ZTMhGuaFRaUuMOgDF2vXdicDx4tCttKkvklxUD+kzOdmlB27N+A==
X-Received: by 2002:a05:620a:290c:b0:7c5:9a2a:aac1 with SMTP id af79cd13be357-7c956f281admr276026285a.46.1745487539012;
        Thu, 24 Apr 2025 02:38:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7791sm166472e87.211.2025.04.24.02.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:38:58 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:38:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/10] arm64: dts: qcom: sm8750: Add USB support to
 SM8750 SoCs
Message-ID: <rvjdnmhn5pb4dbhp3jxcmytr2svumafutopjwue7nueu6ymcsh@dbl7kkoipae3>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-7-25c79ed01d02@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-sm8750_usb_master-v5-7-25c79ed01d02@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX51/p9gZ1YQQh hMdIMSixHc1S+KbwfC2EWcMHa+MD68rsxfgEF53VofLJlUHqBPGVqsCnJXapV1glheWv/8/C5tA ZksQiPAQkPs7YWKGXHw2oeRLtFQhLWuP+7HfKaTIJdktvYH9vHzuR1/FMS6Q2N6EMP3m+3srWrC
 JvYBwtl4q9ae117U4kqVZy/blZKaIKRo/M2CSKFNWqj1/fRHsvITraoZwvWDtfyppdwvtMcaLFK 5ZMLm2aFHad9VBVOHwTYIy2/GV0C2WeEFR7J9twHKn4URzF6Nqtmx9WqpmL6S1cIpkRDAYhzt95 HwxiL4jB9s9nmBGs8Q6zInpTFWRtvpTFHYpsDiZhlsjRp4+1D1bBHsfwbiNKfQGnpuO1l61cw9i
 D4Ac7MskRhHAOxI8WryFcg8Qc0zu+AgNR88DLkN1qQEuolQtQqwQpzTc3eRoy5+QplDaJOfg
X-Proofpoint-GUID: YYC3xjDBoQg-bnSoPF_2a4lSV5LaIuZ0
X-Proofpoint-ORIG-GUID: YYC3xjDBoQg-bnSoPF_2a4lSV5LaIuZ0
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680a06b3 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=oz0Rim8_5s926H0KrIoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=583 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103902_478377_24E596F4 
X-CRM114-Status: GOOD (  16.80  )
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

On Mon, Apr 21, 2025 at 03:00:14PM -0700, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add the base USB devicetree definitions for SM8750 platforms.  The overall
> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> (rev. v8) and M31 eUSB2 PHY.  The major difference for SM8750 is the
> transition to using the M31 eUSB2 PHY compared to previous SoCs.
> 
> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 164 +++++++++++++++++++++++++++++++++++
>  1 file changed, 164 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

