Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080C9CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSowrtE5EBA1YxeyO47FidyogDnDbcytlrVwQdLxer4=; b=Vhvyhy+lmRwBLclJftumz5JBkF
	8HMALARZlZalWeqUPTDDZf1cObTuMT8cpMF7VWAXuUmebYhOpa6gv1HrnY6XXHzRmkEUn3i86X1SI
	G8b+iFKAQ2QtXK4E/r9HrkDWnDhijwpFnvSMrFtjHzEuSyTrn0Vtx7PNwuCKknuSq3QpNh3Pfgedt
	A7ZYxHpl0wpIlVp+6J9dSJXfiqn1+EhrnrQCxCcet/s5pHXrcCbf+HmAyjGiPajJRJtZlJ+naoOYj
	WJ6oA1mI4tynBQaz7Jv+ndHnlOMBCrU35razxZZZW3V4fM5b1ownin7cdctKAaBde1egw2uFev+pG
	f4mzs/bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVJU-00000005Tgu-09EB;
	Thu, 14 May 2026 12:37:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVJO-00000005TeR-0nwb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 12:37:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeQ671717730
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 12:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSowrtE5EBA1YxeyO47FidyogDnDbcytlrVwQdLxer4=; b=YO3C7bqTNygIL/rR
	zg77oN8KLtLkXw1o9VI6MvzrB6UO7CpuTxul8EfDF3ylpXFy4PlS9YB65ZpR8uuQ
	kQSzpsFi97NIDDLMkMZ0t0ll/vbQifE8iZE849QYOjqmINbfVtcP+6Lv0uNZEeE5
	plu6CnxD6EGbJNiBU2nfloYUR9laruvX1+mNd0NV2a1tVvb7nSKCyDT9f+4dexqN
	yzbF6ss/mLueX8iJvzhDKN5ao0aRWsgf3waW3bf42B35O14bClIGEm/7/i+UOnB4
	/jpuJ424cuxQRSmIbOQ85vsSTPYulquAkAvnGdj+oaJDobPcarkiAmgVQVK+sGRL
	2NKmaQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57y7hffy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 12:37:09 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-573ac60fcc2so650226e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 05:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778762228; x=1779367028; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iSowrtE5EBA1YxeyO47FidyogDnDbcytlrVwQdLxer4=;
        b=JUp7OfjBa6wMMwoMKTnr81UT7tAEI7NI7C9dDo8XwX8yqgJSm42Eckip7yM2xFmSmN
         WeeFvGe+FXfWeyQBMWoyIJNyL+6CTEN+DhEb17HwuXF11RHz8PlEK2k+fyO5beh+A1Hy
         Ub8tSOhRdvXVzuZncUutgagejHTN9ATR+oZ7yenYcyXKoMRWzrH6+8zm8rfg4wy9mkZ0
         hTgzG/obYsIiQuygbKTBjJlFfhYSpqTYuPttYklh8oKFaZoD9tioBNGjQOxsqsYKbCT8
         +IKIVMZBZgSmPBsU1CgHbADz0ojQ96BERIPWf5p0ViTHx451RDkPSR2Xvi9Wd5NjRSbP
         qXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778762228; x=1779367028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSowrtE5EBA1YxeyO47FidyogDnDbcytlrVwQdLxer4=;
        b=qHcgo1trYiUzDAqT/g16TlGIj3tbbIdvLHHsPOGNFdQXMdgEwTegG7Kh/VLjh7Gjjm
         VoaLfJbVJKMnQ5k2G6hJ4LtyvyjQlxaR3U6GA5ovXNIS8MRhb6AVss7vMMMWQQA3lkX1
         Eyfqskm75KrnhE6FkebrxQWJiD2xQYzJFJKMS3TQfFIG1dVWrgfSXJwWUDukVsRDG1BE
         uenNMDsBfxiGDhJf3wackUc+/ULbqBA9wMEohi4K4fUiphKy5GIA/IzADeidyKSh8v8m
         kQsv1EWJgC9I8NA3oVgkjQAPu4XgDR+A7Y7Og2Tf2iiiZrOO0Y3Xzz+VQK1LLfRMjGt3
         qR9g==
X-Forwarded-Encrypted: i=1; AFNElJ8fyOu0Fb+TfyuBKABMve2gJlM2VC/K2JAfmHBhiLsX5VUCHlPjTeWBNmxda92nz2u5Wv2kJJ9pfwhzyhYRTWTK@lists.infradead.org
X-Gm-Message-State: AOJu0YzvbJfIu7qcw6CZTdTQUaLt6+W7+8LB4Qz14P5c+jzZa/p+/CnW
	7WnRZ9DyE4tshMrLFE29myQLoKzNshrUAp2dLNta76O8Ly6ssWHfoktqMW2dCfwan1D8o+xQ0XY
	qFAVnOvJriyNgEVr9nfVjHdLTe+A4BHYBbNyon8iS7yHonmB8wwBu6lLi8dWO/mvbRWTod+MIEH
	wB/A==
X-Gm-Gg: Acq92OG/nTvs4ds34TDMCqqk3f3aEQYzTWMAT4F1JkKxW94No+e0D5Y9n+EOywxurx9
	DEDiQLL/gHIFnoj/8+D/NLBIApvHdU+kxDZS0dBmw9r/1N5FsO1cJDvN9opPVWayK9ntgfDK63C
	oU0vH15lIZjDskjfMMbW1esLq9X3gFP9z7bjzy6OZm3WtM2THBxCF0mX2p/PBKbcrJ6OvTV+J3w
	rZfJr1A3tlo/0hBWkGdW0mIicz8QH4xCGXYhUCVXYusIb+yg7E5fK12UX74m6yzmLD7q+V48xnI
	G+Le1P+ocRSSa/IeAmb/CSKSe1g9zC+/eBu6gKNIK/tnUe424P9m+C2aVBAQ0SEY0PyUPwpDtAl
	jKrkCne3W/eUoHS9nA40sl95mvPxmdNi0KHvdAP412USIpL3Rcw9HfMSIL9aat7gxG63Ji07hWE
	T1ufA=
X-Received: by 2002:a05:6102:2157:b0:634:b9a9:c082 with SMTP id ada2fe7eead31-637733f0556mr1164965137.3.1778762228446;
        Thu, 14 May 2026 05:37:08 -0700 (PDT)
X-Received: by 2002:a05:6102:2157:b0:634:b9a9:c082 with SMTP id ada2fe7eead31-637733f0556mr1164943137.3.1778762228059;
        Thu, 14 May 2026 05:37:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1124sm84302766b.1.2026.05.14.05.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 05:37:07 -0700 (PDT)
Message-ID: <2a19abc9-4e73-4e8c-8cff-c2b28100abb5@oss.qualcomm.com>
Date: Thu, 14 May 2026 14:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: kaanapali-qrd: Enable GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-8-13e1c07c2050@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-8-13e1c07c2050@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: u21E50smmdNXBC23_vGHbaeXVShBCj3i
X-Authority-Analysis: v=2.4 cv=UY9hjqSN c=1 sm=1 tr=0 ts=6a05c1f5 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OwxjEWw48HTU6ZCEJDcA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: u21E50smmdNXBC23_vGHbaeXVShBCj3i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEyNiBTYWx0ZWRfX/pODGCBkjtUD
 YAhEItuD/n7wu17enC9MfZDULG9i+knRgEJYw0Buw6CqLL5mI8FbwCEBeCZNhphAjS4pt8f80LU
 RrTEruSSHxo/sCQTOLEDflIz1vwUL5RXm94yDg9Um5eEZh2kW4GzGIdXBs/EeYt/2RTAsLbJNA5
 Fy+ihmKOwdbO1MiNJtRo17fUrm5SBsgviwMZZ1tT7RGrEW9W0lyzF5kdkoOaWRaPg0mJkvJplYU
 w2KrXYsN0Yd/Qyp0FBJ07khHWNfV16O7zSUEwHS2wWj3qn4y8qxZsi6UwuQ18gAF3xR/aMDdufr
 F8AhDperu20SIpOCzUkNobSLG7Od87XfmGZxmU+6jHYClAKARxmIzAoggbSeIRO6ctZQQxJZ7To
 SgZkCgMxlwXTVZBVm0prKRHSe295UIsEk2DcHWnTXMm0159iPvqbftffGzwvXeEfzTdSL5TDzFA
 0br0Rh7pKI5JTnn4ORQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_053711_409824_46123CC9 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

On 5/12/26 12:23 AM, Akhil P Oommen wrote:
> Add the secure firmware name property and enable GPU support on
> Kaanapali QRD device.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

