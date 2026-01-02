Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA8EFA374B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 14:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=; b=sSl52AI8C0K/43H0eGBRnxi30L
	v4Jrd/nl3Yfw+u2VqOq6FjS9EdvXg9+dgpvdNLRngeZ5O6ETfESpe1QK6pIUyAZNPD+amWzP9dVNd
	8zUfdHuBNbW5qiqkyZfgfWbOtLthgBUtzyF6LvL1q121xiwrkqCQh5OTooAPkBE28aiBoYv0iPWZZ
	foR+8M5GEQaTXzbT/+/NaoMMm2VtC/CbuVv1KhtSgeUj8KGV/d9IhoJDz53SV0jgy0TnQPUGq1h5d
	ipLGwT28GglfsQdssLSHeZGkht3HE2fKkll4RNWy/e745r1alKS39dtY/m0DyUSakkSBjCKlD4UvN
	EAA8siXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbflw-00000008Kci-1rED;
	Fri, 02 Jan 2026 14:04:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbflu-00000008Kc8-2vgN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 14:04:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W2xW3961097
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 14:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=; b=hiUiWEBwMnNLAklc
	Mdn/iDZ5S1Ojj+YUIDgMWzwynsLFeHLgc95409459dtRgAoD+ah6IAI7J3HDgm2F
	iGsrhafq+9T1vcWC+a9uyqW2yjBcmLeg5ZAm4ViVhMal8b/YU/tGO2+0yN0sjp06
	mmYHFtkRXO1EjmabOBfrG5BZMj4qgrRj27Ej6K+bXYGnSX/HJQwDMRnECsjNoA7X
	8yuu+Uq13kNoL1e2wMQ/Cr97Qz6Fwp7vrCLyCoQmH8y32i9WmDVER2gBkdQabhOT
	vAik/WgXoUOfMIuo9A8YvE9aPTszAkJ+mpRQu60bwvsUWkOrEaB40vj8YO9mtlPx
	qAPpfg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd77v3kmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 14:04:53 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-646c87dca90so652978d50.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 06:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767362693; x=1767967493; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=;
        b=YbD+LJC/Jalp8+6K1W6AReX0oAA047Jsg/TzJImwF3fEtPPD9ZJ5vssmSDlGnVrIBz
         phDE38HRLubmE7Qmojyx0bX/WLHabMjyaGydDY8yk9aI/ufu+DpNuNajvnvGVm7VSDjn
         iyzlKeEiIt8/MMQKTqBRw1ML+aRhi2OIIwCpXNG3aK4tIDhaKcLsR3NBcBuzKEiCbdPS
         CifGI1G4yCW0vQgR0aeolGrBM8ZdAaC+OIfrdOmZbPZslXQpFS/5hLdXod3xXs0C7YfQ
         Z15HLrlTXZEDFAllLu9IlP5W2dKaokxWqihxYgbuj2K3FXDyo68BqnsyikoJt5SOk+1b
         kKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767362693; x=1767967493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=;
        b=AYMQ38ONTxEkUa3jixdvPsy+qVHSpDjnbVEjxpZABCmtasFMaECwgdhCQUjPuOZajM
         s/5o+jDmdAGgso2Olbzjmi1xHP7Imn+OiYOsuLzL9KNAKZKwwbbwWVfqXq6pk9wVtJJZ
         c+8mKOVFpthRFzPI+EHVLBQbbqlP0gX53sK6WCZNxDi+iVoI3BwKotWsSiiRJuF0Ti9z
         g6dt3F2mhoxLrlZefSkkxXX1CnfpxwJVjmKKlbm92s6TxbOgWlDgCrVJGbkLN00zneOa
         VI2hsZhL1sUORGMKG64kZcTL7KmlwxFvhwJg9J6JVW0yumVbckd2R+Pt+Ay+fJBgiQgi
         nOVA==
X-Forwarded-Encrypted: i=1; AJvYcCWENzJjZI60rgd/XTtVFl+pfegafAoIdpUPLppsibg1GEa+yS/YPB4w46OAsocgwYIHI4PvQ10nKNqdxA0+ScB/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6nbtByZXwc8tRcbocYEfcuCoKO26DsG+xp1nth69gELySCCJb
	Sohx82Z4w6rpQ0c/Q6uWjcaHu70D5z9uxzaQdQa+qXTyZH6b9QChGRFvkOn9M1CmpeMgruZIrZT
	nRR5/rWKe/jCxvBk3CTRsRFCFKV/ZbxQ26MXs+1S9qQoJWqrbL+lYuUrRlck8PhodVSHBnLb1vl
	CGHw==
X-Gm-Gg: AY/fxX4lPZ8+w93m8ACbwr0lcJ2B5Zofd12/dbhg4CRl0ofw2940oz33tOLOlA5oHFy
	wcNRDf8LvjtJNKKUhQ+sl4elHuw82KPgBNlLiHlGdx2hmYwBudEvNblXuW9IEolHK/y5a9H8iOz
	T0wCGu1HDIM09G23BY9TwIAkCFy6oHlMfEzQGfrsTEkJVx/m2aJZbLFXImidIJj4vsfbZCW/3/q
	rlfeVeNIXf/EehOFDfeuxZrLpctu4vF123HtrM/JWG8L2K5w1P9YKEples6g7R1oLv8GSpLKgV1
	bz0ag5P0UcQdmh2X9VujZcdveFFynHp0oM+PGCgsFDSmv86HxwVk4hpM4LtGboFPwSYqKulSWDs
	KEDZlOmPSfwvVeiFsjnzJ2u50xBz6mGj7efkId9oUkXJ6v8by8DGfv/O9EHBkVbKcug==
X-Received: by 2002:a05:690c:660e:b0:78f:c442:57bd with SMTP id 00721157ae682-78fc4425d4dmr294187937b3.3.1767362693377;
        Fri, 02 Jan 2026 06:04:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcuVYNEGxR9hACuiPoXsy2jxkn+9H/E2BmtBs6xGRA8g33A//BqoQw+Eh2o4U0h5D7LKzxRg==
X-Received: by 2002:a05:690c:660e:b0:78f:c442:57bd with SMTP id 00721157ae682-78fc4425d4dmr294187647b3.3.1767362692979;
        Fri, 02 Jan 2026 06:04:52 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b7bcsm4718340166b.49.2026.01.02.06.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 06:04:52 -0800 (PST)
Message-ID: <0707bdc9-001d-4601-a26e-f5645c8ae20a@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 15:04:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] bus: stm32_firewall: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260102125030.65186-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260102125030.65186-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3b3Q7XWVoP-B7wmcYtn_jZSp6wrscojw
X-Proofpoint-ORIG-GUID: 3b3Q7XWVoP-B7wmcYtn_jZSp6wrscojw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEyNSBTYWx0ZWRfXwGPptaLIOzLJ
 xm1ZQgxo4vji5Shmov8/YQPG9V64AREL1AWEQv5xSd71+rh9CwEMcr9vM6pNUY24jD8aCXSAH2c
 oGWFU+kZuMyOECP1c/O5AG5Q/D8519Wa6xYfZ1Ipgp1nC5No4/K7zStEplOnWva8lUSAuwHJSUl
 72VvQmD5cAwYnw74gqwHsEVIZnNiIfAtTKTzByLa4p20EpZwNwmHez1CZieU3nFZghpyLaWOXui
 rCH0RHZuudeCEFNUOTK8qq1vyoNHk5+RCohmMvTKiGXpZxteCBlrbvjiJgu1bzQJrraw3cx4Yn+
 cfD1EoKhDS/MOZkr8K9lyWuaF8APwUgPwxDEnYGaa8GkbmZXOL2sRk6RMtJe2/dt8+vh1USerpn
 PBiSr/wUYTiLiUWKeyt7L3UEoRW6LXdva9FgKhjRZ0TEOWqoJc0vJLqdqSjfKgtkXgHWGxoBGe2
 aotTJ+sZVV3Cqg3Ct7g==
X-Authority-Analysis: v=2.4 cv=ev7SD4pX c=1 sm=1 tr=0 ts=6957d085 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9ra_KJl88v3tURVkoeQA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_060454_849675_E52831AF 
X-CRM114-Status: GOOD (  10.12  )
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

On 1/2/26 1:50 PM, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

