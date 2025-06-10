Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F87FC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 17:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVZlJK/GxgJY/X9zC0XGrcWqi+GkfHWHyAwskSfnpf8=; b=47hFveszNhGe9DFk2a8m2En+3y
	OuomEQ0BHTTb0AlPZiDV0BUiw2B2eNZlEhBXbfQtv+n7qAbOJ7Cn8oLkVXo4UVu213qttCYCLuI2W
	/404jveb1ub7FK+0JjeXQYMSfwiiOyBy/NKonbZb7tTpBkawB/TVLvDMdwOQn9FXSXUddTqf03D7X
	4m32C1WqaDP+KXFnQpVEdXXOa4o7dfL088qSt+pSDz7g1QdPk2naacFSnNcgat1KeyThuYnvFUBod
	Z4acO028rWDxOp2MLGy0jO85d7beq9X5slbZqwi3ETi+XjhitBMPQk70LADWvfyMMCXlWtQCbxtPv
	Zob/abaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2x3-00000007exT-0Xud;
	Tue, 10 Jun 2025 17:39:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP05m-000000078wI-3uEq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 14:36:48 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A7jqdj011530
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 14:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BVZlJK/GxgJY/X9zC0XGrcWqi+GkfHWHyAwskSfnpf8=; b=mn4SUFjE8MRlZ8ke
	th4z4VSdiSRULhatOTzsxH3y97c1zG7QDfIUZKTm/6V7IOw8NTJXEcce9bnlNkqa
	dCLMgWGT83cZ+cqcYHmJ1t0AOAJp+mIkzzFgGlxhI847Sosgzv6wmT3F56XbzxDq
	c2p2JWle1/byMaVeY9OiCTu06028CUH6HFQ+pJdZxVYxs7U4hnb9HtReEdkxIQvJ
	ENBqgx+f9YrdpNbPDQnELhIYRDkrzTeHi5MwIOiHy9tpTmTXvzOGgWQUSyyS6acy
	88+43FAPKs6bOFi2QEzWcinAkUqHruexI4hoD8Eo/hdnPfd8c3UxCNHFY/AjFLIe
	Rf/1+A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxt1p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 14:36:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09b74dc4bso95859485a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 07:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566204; x=1750171004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BVZlJK/GxgJY/X9zC0XGrcWqi+GkfHWHyAwskSfnpf8=;
        b=h5Zca/qjE7Rkl3M4grRkZK7mNgMoUm7Pxcy/AlIEbJXgVKTEiBHQ6hGvJ/6JEazhky
         9ThgoS5/8j07HHaFbaQu/1btumc/xOGlv7NpuA2INrCywYp8AsN/vXvkipE7bfbSQS3t
         /1SjjC7yUjuJ76vIuNQnSjtHn9P9p5gsHfufRpH2ENWNLIOmRQd4zSlgvcU7sRzuA/xw
         Nfun3PQoTkCMZxUZL5sMZlhEuZO/MMEVXbfQcFHurH7kWXAX5AOSQPEl3OWVQLY9JtHk
         rzBmpkrzOmeISGdgUx796z8HliGCwHlCv6lb58hQvcehQpRIV0dQPSFxlK7eghGEgbxy
         0jsw==
X-Gm-Message-State: AOJu0YzudQNC/FnEwPyBQT5M/RASMffKthJqoRgEp/PYMBS3rAZ4CByt
	IqsPqpN2CfXJWy3BxDslHtnL6TTjwluW27kjCCVGvMs1B86bQhE2qYrhReIFc4XKkoCbGBQFSxA
	G3h913451Rp9TeVO3LDhsYehLE4TwQoCuZdCLLKIFEX1yfZa6KXLSq7o3fhblQW0mCEY0Y2BYmo
	iicg==
X-Gm-Gg: ASbGnctngH7K9tB/JI6kJqz1Ca2+kF6zHOuJDOHcOafvfXgpglthCDdeJdGk+uhT6ul
	qkojp5EBTMfnJqMTz9YxqOO1mqPjhBVaQ1yNqmDiAkFksTdazm42Ql3r4ZVfxShjx8eACv0kEWI
	/d6NcWshe0Ja6QglRtWlJZBbb4QnDN/H5fgPGGiJoi5pRXNXcTN1U2CQwK2lzCgEhjiH7EdYcH2
	ThqLLlmEQOJvE1HZKZYR2hdKMYS/zaaVRhtNyYc2TOxSNuL6sTw7j7EPrqgP77PVTLZ3zvIfoUw
	YI+/Js78UNXqcJaStTOiCHqEyVA5YEy062GDGdpzE7HiGwOnBmfhcYZsgTMM0dYdt8bLg89Bssu
	x
X-Received: by 2002:a05:620a:1905:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d33ddf703amr932426785a.8.1749566203888;
        Tue, 10 Jun 2025 07:36:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBbQ7SHFJAIcnH7aGz2wAofoXXYsrztV5V109VXWdIgAcLNVnSvMvyMhOqmTXg8HcgDxWrxA==
X-Received: by 2002:a05:620a:1905:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d33ddf703amr932424885a.8.1749566203410;
        Tue, 10 Jun 2025 07:36:43 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d7542c8sm734986766b.21.2025.06.10.07.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 07:36:42 -0700 (PDT)
Message-ID: <33fe6caa-6720-4af2-a0d8-44b75b6792da@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 16:36:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm/adreno: Add Adreno X1-45 support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Pbo-Y0NVJ6X5tx9VIa9iK7R84sePFEnl
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=684842fc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KtEEE0qNWcsMKkko6jcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Pbo-Y0NVJ6X5tx9VIa9iK7R84sePFEnl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExNiBTYWx0ZWRfX+4zpmorInHE1
 E/RQrJUpRXTFrodIQPtZ5P/q9ONiUiC8KWZ6Nns80GI0Q7dhCiK1gLU2IvmQsmqryobxuNG2tHS
 7jzjCk2mGmR6y1hBI30aHNOk8rK0egPigAHnvhzOe8rAJeClk3MfaDtduxp4W1+ePCpMJwU2I31
 vXZ2zuIK8vfVvc45/Ve5cOlBpa3rPA3TxvXz3hl++q+VSWvcb3enxHaAkLnPFDDwZyOJF3wlLnD
 ruzCrSWn6jKXg74iv52lcPXpGfBVvwuktypOz7V9dQW7RTUPF/W27H9pXCZlgsSbPqxPzwIF5I6
 bnTCCcM0HnNUWdUH77SgkozbSj1KXmRiPZIK5wT3hdLnXhk5DA3jEs6Wi8G9ILxsk5dZknNfxE0
 bKQlrv5lz+gIczP5EHs1ig/h//LYRclMO4Q7C5SVuZtqwili3o64jsZC8Wq+2ZNYlPVUqLvV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=983 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_073647_093062_ED114BD3 
X-CRM114-Status: GOOD (  12.25  )
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

On 6/7/25 4:15 PM, Akhil P Oommen wrote:
> Add support for Adreno X1-45 GPU present Snapdragon X1P42100
> series of compute chipsets. This GPU is a smaller version of
> X1-85 GPU with lower core count and smaller internal memories.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Matches what I had running, I don't know the source for fuses but
I trust you

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

