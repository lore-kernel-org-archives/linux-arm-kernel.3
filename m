Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2621C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 08:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDj+GWBjiBSeF5JpgYDOTVoWkRnCXYhtIDJ7JnjDj8U=; b=PzG88KygPZjDSiNx4omI4YU9JF
	lgfT0tCpox8jYWCXy1QAmcdNV608/FSQWCKPiE0w3o2Thn4mPvpcJijYdaW/dQ7Vwe7fmZYCZU013
	dxjP0sJKHI283ofKMcpmiNXDzdC7MQtnntyGoDxm9iqzty6h1mz8GY5gfdfszsi75+Eq0tnw8+G6J
	AVQdTdk7vMh6ZuDnqigd9gB2CTo9mDIstTDa15H+a0ko7NonTIe4l/4HERXgNXaXrA/XWz9xgcM4H
	AZYa7YTNZAU7wyb4V4W5v954TJIbWsewjGLZBwaMjw+U0e/x8SA3V0Qa0p5q8yngjFj9M97IfGP4Y
	v/4glrbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgf0x-0000000BtpP-0yHf;
	Mon, 06 Jul 2026 08:49:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgf0u-0000000Bto2-1qhH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 08:49:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641VbE3615509
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 08:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDj+GWBjiBSeF5JpgYDOTVoWkRnCXYhtIDJ7JnjDj8U=; b=SaqEcrQZixh8kqJX
	NIbjiiJv30noknviAqvmMqgcd9dLg97+KHUy1B+DowDAtFZdbHov2MJOyoJff6iq
	rqDYW2t4byAMNskkfn2DEmteAKvkbmtwdfnzzGWPM9pYwk9ipzRkB/unQDpp8wQO
	spC9sxDTJrVufwRQlROqiocRM89e1lPBV1O8a+WO5Ti9EHzSmsRDEWPLvWF6owNB
	KQMo662zF2+8K0WTRQ81OMSHEK20fKVNoKuj+ARZc+lVli3a93Wr8++tSyhr4abz
	mQhBlKRhfEKrta7A91FCOx0fOf8vmN+8cT/qCJhPL0qbIjn1JKUVPpUrlbkgGQV5
	z0EtTA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3dbw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:49:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8efd48cbe2eso7066776d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 01:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783327755; x=1783932555; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDj+GWBjiBSeF5JpgYDOTVoWkRnCXYhtIDJ7JnjDj8U=;
        b=VL06+7jGQz5wXNX2CP6DPDUXXPDiQiWqbx/x4Q0W4uXSr2M/U2xOl0iqBVAe6GL12G
         b3pnHvdUt0CRSK1nN3wA25pIsWoPlwOCSYbTUTk6/gtJn4PCftnfVIF2MWxGCP1mZxj5
         xLzBsE+s/JW0V1kMIAahTvbGyhb78QCfXFSFB1hNj84HXHD4sGCUoCMnkn7Po6Xs5Nmn
         xaxGAOodNIVbOpEuA0iJmKzdS15fOLFmL11kB63Mvpsqxfkk5RQAhiVCjhMgJw+a4a28
         9oS1rLwGupO/3Oscpq5kmNfL/1zGFvL0ORbSV36GcB8ZDYUVi0eP0X/yOCmyNZSUJFDp
         4cpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327755; x=1783932555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDj+GWBjiBSeF5JpgYDOTVoWkRnCXYhtIDJ7JnjDj8U=;
        b=X+l6WM3gQ7QGTejRye9gBakVpAH6mRfBLNyySuJ6unMTP8Nu+SX/ZHzmo20OtuHFL0
         Mb33hXQ/CVzrh+8VVQkpUtikypuawtvFIKALbkqxrSZBvujoOlAy7dGJHz+BJgVBeNWS
         raoCxc/6f/fGzxQn1ACDWIB3+YeujkADOKJCZH6JoAek3N8BmGknhJoWrx6eGbomgmG2
         RM5oLhg67C6S9xzFDgnCZQ56HJ4FGTAEYZSoWL1nd8yjlN6JM4IlfDm9LkdE8ZJfN4TH
         dptvLX4KnDvNIGMS5gRjeHSyTEoHZLRkzD7B8qXNd8AEe3X/fdV1/lU5O8nHmBRH+B/H
         qmfw==
X-Forwarded-Encrypted: i=1; AHgh+Rr2vOMkIhRYQggaPfzL5u7l/402xu0CrO95y2cm0bgvIRmeSxZ0jb7eEp8LLLZcarR15kVxCN+IFo0sa2iEnrht@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi17vb0IY3b7Q+vvBeMIroCWuLnFTJa2MzwCqZeRw7DLD1ngsH
	i/7xOkDSb1eFL3g7jv8trRExv0JdXAGn1YZBiCBPoRNivk3l3Baog9gLs9pjBS6c4SWHj4diOGd
	cTVg9KPU6387HEbDOlKSq0WyRoJ84f7YKJ0PcO8BL5P2rXnvk/ROClJxirxFEmLyfae+zFB9RkP
	NZXg==
X-Gm-Gg: AfdE7clvH0gXKVnUBvREk1TGP89DKz4GPH5651j/nBHX5OnTZIq79BwdLgVwJoQmz7I
	9tS48GmqRUQqlePKUvxUNAbRpRBmFbiEY91N4knd+NElzYGPot0OosYpWxFuhMAdF55rRtoVTB1
	UlgH5pYSD6Llj5q6vKSwDWmSDMmcOiNwl+JEVdr2QjVvgV+AevUhD538g2y3q8TjPYCa09nKRed
	3jCNsoR87tOHblXHe3E0rFoyUg9uoyzdpfpEcgB5+2kga/iBI2X31xDXjyqOUmA+2OPFgWMPwlc
	kRiPtxdOjC0GSRIEnl+IP9qZZcPrjFguFKIFF6qzNYApyyN2M9vblqY1NycCpve5u/JiB3fDprh
	xZ5x/QooKQ6BY+SRmeoch1YOaiDF4AZI+isE=
X-Received: by 2002:a05:6214:5181:b0:8f1:7139:d6a8 with SMTP id 6a1803df08f44-8f749a7315fmr109103956d6.2.1783327755084;
        Mon, 06 Jul 2026 01:49:15 -0700 (PDT)
X-Received: by 2002:a05:6214:5181:b0:8f1:7139:d6a8 with SMTP id 6a1803df08f44-8f749a7315fmr109103826d6.2.1783327754703;
        Mon, 06 Jul 2026 01:49:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd88aesm3455501a12.3.2026.07.06.01.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:49:13 -0700 (PDT)
Message-ID: <a4f31004-8e74-447b-988a-e3250859e74a@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:49:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/msm/a6xx: Rename GBIF_CX_CONFIG to a A6XX-
 variant register
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-2-c9f1354dbd29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-2-c9f1354dbd29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfX+BCUim83OjjA
 +f6d76IFGszQ/dtKq7iYe599fN4do8jfN7PDLJ4cR+BpS/FNg5+vZLujTAQPndW51S7DKB1j5Ma
 1DOctZmALqaJpuGf8Bph255j50syRbg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfX4qvnlmMq6FwN
 P4yHsM9YkL2CrjNDUUPEIcjbuimfUpOg3AMt89J1MeINO2Qvht1U8hV6V6zmzy0fSpQzzJZW5dt
 FxlJTr14yxIP8TUqJhjUMhPYiUhrGmoyUmvQI0QfjVAXm5fGGeGn2izwSayHWs5B/wWdt8vn2Fn
 kkYsxo6n7XM+za5rd7NDjGAYnB86urWxLOzMaGioo6xWIZ20r67kh32uvudDRx6fZeT09l114qA
 PJi/9q2KM/uL3mRVTBpA+5jlZkNkaQj4unhlvgfZ/ol2gmTWkEy5zYbX7tMTT1kPCX63RrdNz1R
 qv5CkedpX68Gid2wGMbx2Nf3WsVjQf/JrSqpihM3Lv7zOCleRrnsXSU5Ri3IwohylccCK6Vy/UW
 44/pGtLOws+j0XCavrjPwphHZp3YCfoKhkIveDdsLQid+SmdkNHLq1Doq5rCLoT3jbS1jjvl0iT
 K9hvdF97ssN8RCyeJ9Q==
X-Proofpoint-GUID: r6bHpusu5ufMa_CVPSwPOVftEUl56IJS
X-Proofpoint-ORIG-GUID: r6bHpusu5ufMa_CVPSwPOVftEUl56IJS
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b6c0c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=m8Bw7PwqJOGBpySAz2gA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_014916_511998_777CDA58 
X-CRM114-Status: GOOD (  11.81  )
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

On 7/5/26 10:14 AM, Akhil P Oommen wrote:
> The GBIF_CX_CONFIG register exists on GPUs prior to A8XX (it is used on
> A722, for example), so it should be tagged as an A6XX variant to match
> the register spec. Widen its variant range from "A8XX-" to "A6XX-" in the
> register XML and rename the generated macro accordingly at all existing
> usage sites.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

