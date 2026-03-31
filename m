Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4E2FF60EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 09:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbr1GARxBMsoXWwR9sIPZisrIlDf6DQwHv9fzbstqNI=; b=g8d/epTPco6vqB34jgCLf7DBGL
	NRTRRhOLCJ9kW7Tq2MlOJ+5gk2pxzG4MhhRJjPD4BAOh0xWieRV0EsoDc6Vjp2EPUd3dbXHvPmGkC
	5YjiEPAT+bApr5XMPZqPgbtRtbamL5/etVOG03RR2u6YwlQaNB4zOAZ8jY2kgHRE6+E9qSht4vtTL
	VmcypH5la2umn1F6ml8CM+M2nKsNGxXK+UQVV9sAgukb+22JlTC1R9Nn17SVy0HWHu99d4V3FgLVs
	QmPx6SEKv/CwI/smV7fq414QHZztZSuAdrZvPMC0Xpkje0deNk73StitE7wic5wigC0lHEXg5FBN/
	8o7+bAsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VTk-0000000ChHY-3MzD;
	Tue, 31 Mar 2026 09:33:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VTi-0000000ChHD-0042
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 09:33:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V912En2761342
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 09:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbr1GARxBMsoXWwR9sIPZisrIlDf6DQwHv9fzbstqNI=; b=gYURW5u8Oy+FvkAV
	iV6lj1t2gyDq2TyCPN5xPmOqrKfh4g0cVxLnBL5w+fuLUXgFDkIRmo8Fn7AtGe5X
	WgpJooLelIuKRBFqZiousuqAhqvLT2s6ikMh85ii3ZTPCU3FUMQR7rfD4ux+ddzL
	uDG6jMUe5ZOXx1Lw+KHM/fucy2cUv/jWn9fuuhnd3yRLRqRgOJ3A6t7OBHUIRD0t
	inlW3BVWBqMTRUUD/7g8L6YP/JzGRmB4wTgPV4jBcTHx6JdbnyEqgl2FUC1f3kJU
	xBPOJaHKh6mcscOX+CYbIQRHFx0lPaTVAr7dgtBxP/P7N4kQXFkCeklGBjhyorUv
	iWQo9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b9304m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 09:33:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb456d53a5so159462285a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 02:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774949620; x=1775554420; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qbr1GARxBMsoXWwR9sIPZisrIlDf6DQwHv9fzbstqNI=;
        b=R7ZVOXSu2ddjSwqam4Qw4PrlNjm7OGLc8yokOWEkw2weMuDWYwEHq4d9YFvZk6bfdy
         8jFP0fFzZzwzU2m0kGcMFdPIELVqaqlU4vq9InxndXkg+IhTcBTrP4/aZD4NMcUcv0G/
         hB34T+NrIwLKtvhD+mWgQbObV06Y9h0Ztb+CbpWOwUI681yEJn+fRcuIOrvJSeDj82eF
         pR3lqPqEZdJGo0LPEoHQ8y2W18nUHZg1Kh9Y4/T3WjxeaodJ62mvadLDpOZ8g0iDkooY
         nyzjx2PT/yfTBkzLu73sfiGept3r9jRXmTlQNttlIDiB7cJsYQvXhRK9xh3KppIy0W6e
         R21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774949620; x=1775554420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbr1GARxBMsoXWwR9sIPZisrIlDf6DQwHv9fzbstqNI=;
        b=kCXEZcBySyf04nPElbzUvKz1gBg8jJXHRRFHF54ohnUYMsqrBu2jBAOjGUXno5nghk
         rvP4PKXQS9x+pJ1ry9NcADFZZ/44OSOIrugwS+ehOixOmTK4VcFToUNKAw9Q7tv65Kug
         cbEZygxTc3d7hX1gZTYb562oEcrd+kOQCoxiAqJqXQ79perNNSPWodajyMhDFR625r19
         AX0MqiZwoBQLdE0awZ/wpS6ilz8GNOAezBczgRjXTMQvwAHPrbIq1vfoXydnaD/H1DDq
         9B4UBoLZ02Q1RwmMKNdZQi8k+hpLKU60bm5qflDQeGMOqG4K1cBvt/ppOQzDrbrEz/AW
         mGcA==
X-Forwarded-Encrypted: i=1; AJvYcCWe0MMFJ/kO4nATtO2RwTSaI1+pnd90Qu+CO7CSaDUqJ/Ko1B6gPia/jPwIMDPTZ3ezDpKaVH50SOrL9u7gEWU2@lists.infradead.org
X-Gm-Message-State: AOJu0YxtVKCOBODghj4AdGf31Gu+Kk3T1tdWTwTWPpud518Mstsy18GY
	i6Cki1mYZi7nR6jI4HJah6pvuadi41pgYj1DU5kvJ/7wK9+9mAwTIXYLlfsZmGtL0t2oB92HKxF
	frJZ2r3BB9P9gsxkUpF2J8igUezC1EpHPzYbXixuEf8YSMctr/dujxBLdDgQ+a0AC8Ymcx/WkaK
	K+Bw==
X-Gm-Gg: ATEYQzxbwKpiRt7fBVhnhdjKDzfkMt9ntI3P81FbqNDCXiVVCFXL+uPoz9auXFSd+Pz
	kiwQPe0RBcA7TxAjTvDt5PWigEiJeDmcSfm9Vn7cS1YhzV3OZAutPlXrJ/0WiS/pFhOmO/xqcTA
	lOp5chjYy10VxZQ91CEKW8e6+Z9Bzs8Ku5sZqS6oLhDk6ZjXJpmuYkvnHGXAKKRZhSCE0wx9SEQ
	eRKdGKx4+4AjGcfn8EADMh26ac92dW5oZpC7pZuI0gpnndCYcC+ZDM6mL9c0vGnA8DS+yyhQ8rs
	gOpv6jA/FdsiuD68QIe5OJVFvFJQnpyuZIFV67MOOPA3prTgvDZdloMDkULjaSNIb9bjU3TK8UR
	fARrif1h1snvPmPgwhnviZFgm9knDOvHAIhEvvGnsftyxI+4+iwMj4KoXUzGxCqzAD9vYj7bO4/
	aRUMA=
X-Received: by 2002:a05:620a:4709:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8d01c7e1cf5mr1572459485a.4.1774949620370;
        Tue, 31 Mar 2026 02:33:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4709:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8d01c7e1cf5mr1572457285a.4.1774949619932;
        Tue, 31 Mar 2026 02:33:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b72762eabsm3602840a12.4.2026.03.31.02.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:33:38 -0700 (PDT)
Message-ID: <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:33:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5MSBTYWx0ZWRfX6PYOd3icav5Z
 3LDHHnaXwT9pmAd8eKr2MYnOUHg0H6PANxxE+OzjZiq7kpbddAoxTBo+ZW6BfK2RBqISkWZ9oHZ
 iN5TVrY/qt5heo+NsAa6vE47mwlOY93gPbHH3oYILSJjTWcHVWxVOwrA0NvPaBC4sDgtNseMrK1
 v9dJXxiLeW2y3mrOQLgrAvLVPsVi07g0UFStP6CdzFXMmEa4YHX2GOJv9Gr3Tg0NzfpKtazVraG
 R5lYOvfObVv8xxMXJiwWix5uvzG+8/Uoy/v5IncFCJOjwkF0a/R+6zl1gQu+MJ7ah4DlBJnMsOB
 9trtETffDDxAZyQzb7rFEdYIsomczxydF4nkorXBSWD6GpKzxAjyDLVOeKBxkq4TdfPfYxY9inR
 gCHfVOxklVNTvpvDuyHp0bwyz0YrVDeVX7E6rEr49H1TZP0+Y3S6M1j1KO9zFcsf+uxSfHestOa
 MawVPtnDdav/fCNjiAA==
X-Proofpoint-ORIG-GUID: IKQM2LtsxoOF_R5QVu9KBiQC2-KTeUyZ
X-Proofpoint-GUID: IKQM2LtsxoOF_R5QVu9KBiQC2-KTeUyZ
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cb94f5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=n83Ni56Gs3YPKE9ALmUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_023342_071063_A3AD5CD1 
X-CRM114-Status: GOOD (  15.25  )
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

On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' contains probe match-like data
> and is not modified: neither by the driver defining it nor by common.c
> code using it.
> 
> Make it const for code safety and code readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]

> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>  	size_t num_icc_hws;
>  	unsigned int icc_first_node_id;
>  	bool use_rpm;
> -	struct qcom_cc_driver_data *driver_data;
> +	const struct qcom_cc_driver_data *driver_data;

This can be a const ptr to const data, even

Konrad

