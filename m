Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03BCEC01CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 12:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrAAXizoOHygHzB/TmZqVGfrawcHdiN8J7vTtvklL54=; b=QNWs3pZWpTHFgEzzPDyoB/jzRm
	QKoJ39Lv1LQvaWmabsZSEXkIFQpY7lMVA0a2AmURszbWULbTH2F827y+aq0v89/HQwRKJYv5Dhx74
	VOuXlITe47FeLBpKvWMV4B22isK6JONQ7aGd4/pxqWnSxxZSctiyQxNbs2LD6F/pUtm3VJq63OV8H
	YeX8ELwaRNrX9kjjKOUOPRTKuIWZ7OlxSazupOArSeQNAQS5Eg2w6/tSJivd/1R3ETLX03fMLN67U
	ZXBpqt6WlF7EjLX8TInnwMwsUfVtWmVYzErT6wixaYX489l74hz1BNajtThQIz9Xxv2usGLy3HGCy
	2/DKF2ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4eLL-0000000GhNv-2hOL;
	Mon, 23 Mar 2026 12:25:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4eLI-0000000GhNN-2GDO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 12:25:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NBgIlN123193
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 12:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lrAAXizoOHygHzB/TmZqVGfrawcHdiN8J7vTtvklL54=; b=BU+lu28d2SeS/6qW
	q60iEkc0Wbqc/09VVWtfNDGcXqfrFVTfSW1eKUc9eRZwSyfh8d4nsbG8VBcCrrzE
	sg2J4prP/M9AhVlgXJYwnopW2eDRHDk7BHDXJlgKuJnoKnB/LevBQyrdGOhnaPm6
	qEB5ItDiqDhdSxPNcyof2BKu6GdVNHsyWYS8PRtsHrpc1NcTH8HZFRdbKmKvJgRd
	vWvVqQmf5/9PhX2T3dseFOdwKnXtHSCm1B6VWQRyLtX2f8Z009qnnNOOxzmT+AIq
	VimyTBxPFl1gAKCPpOSlM38lt6u1kSyNST9DcVGPx9oM0k6bmSCwvvB/k0tJSTHc
	zGHHfA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkr47q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 12:25:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b68af943eso1675751cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 05:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774268711; x=1774873511; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lrAAXizoOHygHzB/TmZqVGfrawcHdiN8J7vTtvklL54=;
        b=C09ZTtgcl3hYryMKAGwqHuk+/Ex5Ies4hqazzcNgGHP57o4nnoBbeQdN8OvwqNA0yu
         E3wiri1td6JiqCE2MgCrfKr11DEclB2WMTYmdxBL+aQNZCXIB6i+NMR1Wj2a6Lu+1nCH
         LizZskQGI9vsiznytPKilV7b0xYJ8NtymLlg8mVgHv2np344erRyvRCMPZ4RG7ZuNOTt
         Z+SJ3ofbhuvlfyCNdP7nEqyzOVwx2a+3vq4cz3rF9nvZlvclYS9iRvZX3feMQckjJLvL
         4oUMwSX06iTlzG61U664gDzESY7E06CUOvKZf8OS+K/HC8ttvYlv5Q42XzAIMRyP0gIl
         EFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774268711; x=1774873511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrAAXizoOHygHzB/TmZqVGfrawcHdiN8J7vTtvklL54=;
        b=LMhXIqEHa9Xrb9lAMvh1AK/pT7X5F4uwkRMUDj9jofnfMDpIiGNwPCv9Hd0SXxBx3U
         CwhDGw74CajOWp3YNlcRZ3YTuy0ORbPI7CT5eSuhCKmk7C2y3Le4fB7Oe2AFXPrFFqxW
         BFsnxCZm9WA8DUPS6YnsllzMvPsiAzovEz9I9wLCAQ2mL+ivFvDFgprXNMhHho/qefJ+
         GV7cigI9mycCGsGAYmCUQJH6XsHmdX4Ajz4CNhAVROn4QOeUSWwFNBPFEc4Tl1J4/403
         YqjUZc8sGfGFCsMFDKRzPG8sfcr1pXad5RFQ81DJ2SQNzoVsDbKpy7KYv+undX6NXN3c
         5FVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXkdLs1Gm6RSlQyOllUChwGXsz1NTH9aev+rRG9vTjOYguUdSzhzZpeXeUmHLJs829MZSnVAhKRlHlzyURfOqq@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlu/szH70uzqAWBzvxnizV7IJ+BqmlxcwNMGyA3NwHd6ufHqXy
	RZ8KSn0y9oVz4GuZs2pE/ScFOEj1qo2meJXbl+eo0d01wYLRdd3Awcuxv/M+0IE7+s4WJNCN/cc
	z1fcrFXQ2JmUPxC0iw+1NRD9JvWzFC5uco171iJS9bTZSPHDjoeCqSV5fL2nQmHHr4lhCIKhLLm
	4nkw==
X-Gm-Gg: ATEYQzz2VJf+Qwnf2gf+IMUBHoQuBfp0V/gbU63idSQg6MvNjtdL/XGpq38DHZOB4Jz
	3L0S5r78PjfphiVOZ0SY9C4a4vpTHJ0Oeamnam3/g1qjrqlXwdXZB98gD3vGzIGMnGFUSpe2doH
	WHmW1IryLGugeSo+cMY6IcYNPwy9L58aUZQUmgH9iSaT7Sd6+fI/9iz2yEJVqt7Q101BE6P7H6y
	cGqEpFFtkbkxDPIKhx9HXaL4Dc8v67UIUxWnwOMUJJMq2b7KfWH7AqzSGyGb++MEcZWPfUkMcgY
	YFTuTYh7dtTyMqnAlH/pLssMCEScP6F0DCEtr4yGRr8hHloNP/XJyaQC645vRJG0VaZr0RNYkdI
	RZB+qNEMREXB2+64GbLEoLybHgq3NxbqH3KgJCaTFeFXhQKqWnMGNDEaoVg5pNDI0Lh+Xqt06SG
	A9Iyg=
X-Received: by 2002:a05:622a:293:b0:509:2b5a:808 with SMTP id d75a77b69052e-50b373d3484mr146051031cf.2.1774268710753;
        Mon, 23 Mar 2026 05:25:10 -0700 (PDT)
X-Received: by 2002:a05:622a:293:b0:509:2b5a:808 with SMTP id d75a77b69052e-50b373d3484mr146050711cf.2.1774268710253;
        Mon, 23 Mar 2026 05:25:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983398c140sm496780866b.63.2026.03.23.05.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:25:09 -0700 (PDT)
Message-ID: <96074093-b653-4024-bd09-efcd3d68927a@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:25:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for
 panel nt37801
To: Ayushi Makhija <quic_amakhija@quicinc.com>, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
References: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5NiBTYWx0ZWRfXzKT9epRZ8xE+
 juWnjuG7xp6eyZv/citE4ILh/qXj5dIMmgseZKR/jR6KjauO2vaqQJLA2/NcJ0f/OYgQ2m3iBMy
 8LKi0MsDDyc8/Fvd6D4XVh8P2gM5HnVLJB9hQI9Zzckqs93GdBv1iKaV4GnW+gSrGOvB4pbU66W
 jL1G5hDuZdKYaeRKDlrn2QIGBBI16zOFfnC05slcpQu5f/E12LR2w8VKpVTWVf3Mi65+ag5wEm0
 xOI7wJsu5nEa7cAsvDoOEX/wBLhaH6ZaGhBo9UlCvcBLO3KTtSvU7xE9xLnmN1q1H/Lx07gCbPk
 Voy9NuwfbINreheBOrciy6u0lkXTeXXAK+L7ILkeBvEMEh3Yb6lW6uu509l6ABBukHnevJsh83k
 y4GCSrF+CRh/MH2YFmiNxzfjJ2clvwgW5C99kEfFwFidy5gAGYFaBWhPzkKgQnwgTxCmrpgVs0P
 abUOU+Y1mkhUTSIcAEA==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c13127 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WnUHuuy95XYsLch6RvQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1aVf7uRAu8C_lBwGsMZaykM6iNPdye2x
X-Proofpoint-ORIG-GUID: 1aVf7uRAu8C_lBwGsMZaykM6iNPdye2x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_052512_700753_D1B17346 
X-CRM114-Status: GOOD (  10.41  )
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

On 3/23/26 11:22 AM, Ayushi Makhija wrote:
> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

