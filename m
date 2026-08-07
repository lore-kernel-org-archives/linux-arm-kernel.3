Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B7BC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 12:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjdnzx+QsVtgM2X6y1LWePg9rWQkquFUfDwdlQM/D0k=; b=PhZaTSpMJSIHhhMlFNIMbtGQC4
	+zK5MmFyioznhCdV6rs7DqZo/qN9/JcFGNHOMHz/gj60mn5Is8hHXJ+lVIXOsvlaAUyO3Zj6hD4kS
	n2grzdw3qPsLWjUvrFjDBwq7UOwu24PmDcottM6qw0h2tkeQdNWc810slSJiJIhli0x6X1aku8Fy1
	S841Zl+xF6bWgrjiGOYNZBUEBjalIFZ1iwNk8AeDSQh0jsnTjtDhjq5oqYx21NlWm5mAhMslq6qEL
	yNjlFofWe0gvVxASsuUVlaSlR+lvBrMkG/j2um5b0tZxGmMXwWApok1m+IRcIK2A+hKry3hnDYuZv
	fevrrdEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJPk-00000007zna-2aFA;
	Fri, 07 Aug 2026 12:11:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJPi-00000007zmo-1UMN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 12:11:03 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6779WPRh564996
	for <linux-arm-kernel@lists.infradead.org>; Fri, 7 Aug 2026 12:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zjdnzx+QsVtgM2X6y1LWePg9rWQkquFUfDwdlQM/D0k=; b=fcdIfSMuj3HLJvrR
	FVFOIUGxLVpO3A1PWuCnkR3uTVoeQDD/YnUUd17H9FNeggns0tluDyvT1asx9JrH
	f8AEeVCEVlNSoGMahDbYKSHDa55cxKM5yc2LplKk4A04+mVj3/XLRA4bYUNm8PoJ
	uJXzwOw3XaBaqpcoXGqLCQtlAIBHJ/LLehKXYkGpF4dDLcWowGphWBkhXUwJPr7t
	QCF7T7fWn2dBQOqdrfZTAEmoTPrDBPIU2eMIcEMGRoEkyPKfeXTylw2AJdH2odfN
	ZuRf0wUKftiQrppaYOWNWLE/ZtAPbkXUAP6vMD5l4RHrND5PW3N+OYsamJS64YxP
	qzwL4w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwctp8h4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 12:11:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c07f25de2so26740431cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 05:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786104661; x=1786709461; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjdnzx+QsVtgM2X6y1LWePg9rWQkquFUfDwdlQM/D0k=;
        b=HW9GoT3DWkJ5PetWhOKUtGiTbOcsLQ2t+6ZtzIWf9d3DJubjRhbmp4mvGUgBrCO5ka
         OwF13E0mx1ysKr1HIq98/Ks4grldzMzAA44E8i/ZdCoX5suco1/d0NWXlGmD/jNTrPg5
         gUx7bcfwa2tlqrw7jHSEi6MzzfRQO5Glwxy0JQP5p4lwRe3fTOMVXso4dGg3sV/v5dzl
         C7CeKMSwBO8GwVYVL2JIsAusaqzIE3r0kzoJKJaRFT7kU+lTbSKAGuIDw1WizYK+2CRP
         K4PS+oaCjB5nOGlVcXL6FfEFQVmoIPtwgIrrlgrFF7muVt3pK/EGtvWi/yw8aAKVsrak
         fGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786104661; x=1786709461;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjdnzx+QsVtgM2X6y1LWePg9rWQkquFUfDwdlQM/D0k=;
        b=Se1xjUAeAADq60p+J+WrF2KzC/PyGWHGVLlWQAnwMNq7bJc7U2XUBC//4buIv+udZk
         6AGSqk6LoS99Iwd0858hzEeG89Z2cDtk1n0e7CTeh9qelbfaB+zq24tOVfYX+vHQvMxk
         5eCaCxKAVW9NCePNkEWGJUsC03QKn1OlB9uaOk24ms5DEkvDV+OLhcxQwJ4IhGLSLHM6
         G2vPcNzXbHXU/kDfLCJAoWMirbj/CSGHF0PZVeTUPdBdUvrkUTAgpXxtAtHXRGRRDXzu
         TNbqx8fB5pBolSV0teTGU0zBcVDXQpu4HYi22w4Fj+YDbYfMRTNSKZk/8nKOjWOVQY2q
         VX5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqcw2/vR1RLvJaQIORDuww1bPoDn0aFa9jazYIfyXlwV0J8qS2vzU4PF7fzS51qazrUJSul3Avhj4yVfcxc7JcQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyCwg3ejdI4mRkL+kxLj988ES3wNYh/SZOyhH9Tdu8zRunDsqGJ
	dHZZXLeRBKspang63SuGDNs7iYgGcxI7BUUkXk+4wFx852aJ3QsVPQwQeydAQbSJ+jqflfow7Kt
	Mzmlx4ARraMsBpk1H4yNG/UvDMOw0MoxY7agn/jKRlGyy6ONW/S8qQGQLcPgiEvd/bQymwc5+1t
	+Ha1fxGofbWXwW
X-Gm-Gg: AR+sD13OgHMKT+T+NWZLRSarsR3Kj4TmONW0EoMjPk1c42Uh+DCpSVGg1xy7uZtdw1+
	xdjyuXanWFn9SJB28TTb2Owfhh8KORC7EW76D+KTify2gLYKDT2tsd13sp5lhELob47xxCTaTKH
	xR5hhf0A69k4ihNZ5JiFAEpjdsf0NAwKtrjbRu75sSu/Gw4jLwFdUlSJnmqnaVMJWw5uQlyrlXS
	ssN1df03v7Ihxsp1anIl1WIDy8D0jb2Lg7g8v96oXsYjJq5Q7FxzgHlGm74B/HLOAtASYtxwwW0
	DyLMNB26OHSCk2+x2kz/2lQdDUJP2xki/L6tlo4t9wNFMSW+bUnVmh150K180H1nF3vtR8xWK19
	FP7KzxUwJ5aGWhKXVwYGV/dsUGdGhKseH0rBP20luEtAy4Q==
X-Received: by 2002:a05:622a:5a0c:b0:51b:f36d:1ae4 with SMTP id d75a77b69052e-52ce61fcb59mr247580641cf.43.1786104660492;
        Fri, 07 Aug 2026 05:11:00 -0700 (PDT)
X-Received: by 2002:a05:622a:5a0c:b0:51b:f36d:1ae4 with SMTP id d75a77b69052e-52ce61fcb59mr247579351cf.43.1786104659899;
        Fri, 07 Aug 2026 05:10:59 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995ea27b29sm41957535e9.11.2026.08.07.05.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 05:10:59 -0700 (PDT)
Message-ID: <14ea9fce-2bb1-469c-b751-32f7a2e28f48@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 14:10:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] lvts_thermal: Make reset optional for MT8196
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        rafael@kernel.org
Cc: daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        p.zabel@pengutronix.de, matthias.bgg@gmail.com,
        laura.nao@collabora.com, fshao@chromium.org, wenst@chromium.org,
        jiapeng.chong@linux.alibaba.com, frank-w@public-files.de,
        bchihi@baylibre.com, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fp01OWrq c=1 sm=1 tr=0 ts=6a75cb55 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=rXlwX46IFeUSpfNkUDcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: sQeeOdTBtDwOSEv6NlunvfsHOY_EZ6yK
X-Proofpoint-ORIG-GUID: sQeeOdTBtDwOSEv6NlunvfsHOY_EZ6yK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA5NCBTYWx0ZWRfX5tLLQ9b+x1Ei
 hj+cdSnC+clMtHryRM2Ibn7CHtUG8jvRfc/NmYXAYx9p9ZvbcFbJLgz1u3GaHh3IEDC7MCGtiaF
 ABjXtAd3KcNtQAu4qKIY8CKtB7+eHnHMypekPo6/tbyQTelTkVfZqH9lOIJUDWVteUgiGzpsOL/
 BXmUZtyQ+qlplhe+pEWNA9M5R6cz3qOgeW06QsfOqIsbAX+gZHM7uGaEgeEW7F7GoVBr//kZzQS
 kBhCWbNd0V+boxdukAdTfRd9YmJjCqWE1yBKWmLizY0FVT2kJ8oaew2CB/dFVCOqrImW5MJF5Tk
 usPuXSmeUWCtVFogk4wB0dxsr+eWJoBOdmoYP+/+fkDSvakLLBBhhlTUcI8+Mge+m6ydsvVgCHi
 HDJMavPdSCrBW8n8svGti21YMX5qXWgumwSpMIJkdExk8fnd/7fNSsFmWytqnQzNMDj3x6gwxpC
 3WoG/nuLkXL42HgAHYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA5NCBTYWx0ZWRfX3YUFUnj5Zghe
 Uisp7VyFxSHDSCdvocDC2aB7MTROeP1sI+uOr0yVVG82uRUt5R7mWb9DuzD+hbNbGQnhyXFFeyh
 pkQcKZABjuaRCyd65gWdgB8do3TQqTI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_051102_536541_AE804B86 
X-CRM114-Status: GOOD (  12.72  )
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

On 7/21/26 12:52, AngeloGioacchino Del Regno wrote:
> Changes in v2:
>   - Added change in bindings to allow resets to be optional on MT8196
>   - Made the code change simpler and without paranoid nonsense checks
> 
> AngeloGioacchino Del Regno (2):
>    dt-bindings: thermal: mediatek: Make resets optional for MT8196
>    thermal/drivers/mediatek/lvts_thermal: Make reset optional for MT8196
> 
>   .../bindings/thermal/mediatek,lvts-thermal.yaml   | 13 ++++++++++++-
>   drivers/thermal/mediatek/lvts_thermal.c           | 15 ++++++++++++++-
>   2 files changed, 26 insertions(+), 2 deletions(-)
> 

Applied, thanks

