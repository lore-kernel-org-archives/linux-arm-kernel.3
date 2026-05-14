Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1D5CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 10:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4tnR3SQ6CQJ0n4VHz7KRV07D8f4nSkV1c5YHTLLUWs=; b=lVbpK9Oqt1iM7PF4lV13VG45v6
	gaOr7Imzki7U/9Z/LH4/hc9WHVkBXTUnaJGJoy3/GgN0O613dxr379F7dMOg6gVr6zCu7SVEiy+ks
	0lCC1qs72ADZi0Q41scZ+sD6LQcJpZOKJN0gbNgLBR6kJbw8C4h3qYBRLHa40aLSm5+Altm7jt3sv
	y8U3sV8nimCGLOraEGiTSKbSfl4Nk4PPma++h/KdhF4lI0bg5HK65oVtacPBp1GIDET1zlCDtUv1D
	wb3x/8rageibgVWCoIKaIBwvga2Ek+x+MkAiAuktbOq3VVE3Gzpubng0YgdTQWcJrE7bTV5NzEyzQ
	yzyGm9VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTm1-00000005GE0-3J2Q;
	Thu, 14 May 2026 10:58:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTly-00000005GDN-2JTO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 10:58:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kFYT1989636
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 10:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d4tnR3SQ6CQJ0n4VHz7KRV07D8f4nSkV1c5YHTLLUWs=; b=WPXgBkWKfSDYOons
	V8Zyw6lnEntoyM8wItKqcCFNOVKn5LY4QFrIYhl0ZZjFBpthZxifv3XziZDSR6dJ
	nKP/sTwxc8+RSp8oXz759YxnXKiAua0IWlZG/Epxvl1UzHyFG+wz/EC0Osg7VQMN
	fHV14RMDE7KvkjvZlyqC3dnjaB6IrOv62jHUz/SaIFuur/SXwatPODS9RHK5l15z
	PPMFyr6BpmzP1U6ICljUF0JUIU4L2irkLVtN6NY+N8lhSZfwShSgGe2AaZVzbAST
	Ypf7sRnSfAh4KjcwBBVzM7sEx0/Un2brxq81bZwZypCkVG78RBedibz9vbj2x5aZ
	a5Giig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e566bhfj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 10:58:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91056376aa0so29886585a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 03:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778756313; x=1779361113; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d4tnR3SQ6CQJ0n4VHz7KRV07D8f4nSkV1c5YHTLLUWs=;
        b=CQGg5/vKiX9VZeQQV9leRrTKVoiepN+q6hXhc7tI8EwuD4tA01RwG+YJqG0W0z/yCt
         i8S3PkuOHHBCFhN73DSLNFfv0wDDVEU4gtbnzlSlOlUQHJ93FxqHLM5b1Ia8rjKVCElp
         GGaKj880+2pvvLj3Pw/cXP4LgrU0iEnMpakOr7ps3OGeeSdEHP+os9y5xvIoteXarnYz
         +qZUoGKlSStQ+KD7K1Y3a+gjuPRGmEHJcRlJfc7pO/cHlGqlzMiG85JWkBm/s9oQ534N
         0sFFXyxuQi5W82nnQi4IaYXlG9a5xA4BUrD87m0tXbwn83iJJdSPCAYu1MdOFoPVNK0R
         fh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778756313; x=1779361113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4tnR3SQ6CQJ0n4VHz7KRV07D8f4nSkV1c5YHTLLUWs=;
        b=IJLSs1nFBn/c3EXgSqgpXXPMwUPeaccJx/0UeqK0HYAJiETZ7Nf7+GzBGCKMcbcCFf
         XO9HeknNS1szLhcdx4zwHZZ6WD/b8aVC1LYqbzyzNmaQvKMaw2OKPXZI23WQJyUrrNzb
         J/dZAajXbNk9oZY3LmrP7HbwvNKqg2zeEDETdsb3WXN65XqAtH4i3Fu5yHih6fOkLDfg
         c1FUBuYyeTwUirPtvsFQ/fSwqDIWRxfoC1gnOSKnWmKDlKWrMIxQbPZTzHOeKcZmlUqF
         h0K4F0Nqct2eddjvNMKSDTne8KGCSBXXV4WPR2evgQrL2Tmxfas+vfcv6RFkTUclt6T7
         5QcQ==
X-Forwarded-Encrypted: i=1; AFNElJ89oRCxWBRubId23ERc3xSg7Z8nlbtkyh4G0+Xusu/S5wE8oC/yGXeH+OIeJXR7sFuilgy9iAu3KRZg1zt6jYB8@lists.infradead.org
X-Gm-Message-State: AOJu0YwRqb++w3mo8LG471IFQPEgzSERTEtp+UrsH0JrQEMvKVjXwcX6
	radrNLoN6fHc5HPcap5NsjfSSrjFrcuX6uPGIV557NJuVLcWQYaNkzjso1dkWsOR+nK7CYEPTB4
	mCHXO77T9taRh31pCWBQj1P14fnYx6IUlYxD0Q7IYJav4EwGgQg5bn28tzwpaB79Og1+1ASObyA
	LiQw==
X-Gm-Gg: Acq92OGYisa0zD950Shcol4DEYlMEejeNPyrYr4AwOPh0RRp/7W9w7AJnblrNvczjY1
	swXQ9VxPE+sWrWblrK+C03OwVX/XooSpSj00tIz5Iv4UcK++07PWg/LYIeLiEVgZ37cJwbZnxaa
	sARM30ttsQ+RuD9ldFXqZaJkCEPpRiZmJSanWUgGZpYZJGBmhagnj+0EozupxLzpwvHQTeqcWOi
	USjiFJpKTsvR6+V/npfJYnDxtVilyKyavAu++f1rNiqKzrd7SIQWISbKKFtmZckXZp4C9FSLM6n
	oiOv1uqD/iFjwvszWa4YW8mdS5Rc/DU0n+zEwnhPp4/cXhlmKUkRVB2FT7SX3MeoIGMIc4mSAyw
	AHCpbxQX2/Us2r0N/YKA01YBqpomGqYTW4QMjp4DXmxdzzVd8njoB2nG1qw8G95p7/RIpd8p4GM
	zIM0XW+cscHtxITQ==
X-Received: by 2002:a05:622a:608c:b0:510:144a:636 with SMTP id d75a77b69052e-5162f682709mr64383721cf.8.1778756312887;
        Thu, 14 May 2026 03:58:32 -0700 (PDT)
X-Received: by 2002:a05:622a:608c:b0:510:144a:636 with SMTP id d75a77b69052e-5162f682709mr64383351cf.8.1778756312468;
        Thu, 14 May 2026 03:58:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b3e8e5sm612419a12.4.2026.05.14.03.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 03:58:30 -0700 (PDT)
Message-ID: <f0738454-abd9-4a58-ab2a-df3479b78e95@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:58:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] ARM: dts: qcom: msm8974-oneplus-bacon: Fix sn3193
 shutdown GPIO polarity
To: Jun Yan <jerrysteve1101@gmail.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>,
        Wei Xu <xuwei5@hisilicon.com>, Robert Marko <robert.marko@sartura.hr>
Cc: Pavel Machek <pavel@ucw.cz>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Jisheng Zhang <jszhang@kernel.org>,
        Enric Balletbo i Serra <eballetbo@gmail.com>,
        Romain Perier <romain.perier@gmail.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
 <20260508152435.21389-5-jerrysteve1101@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508152435.21389-5-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wMNfQ7FEBqGOmomEUINhzzpKBHnIx_ra
X-Authority-Analysis: v=2.4 cv=WsMb99fv c=1 sm=1 tr=0 ts=6a05aad9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Ffu13P_rAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ZVWV2uAXYixwFVVeF7MA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=PkESTBlHdS-WH8rZy7fl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwOSBTYWx0ZWRfX1Z00UfgW1HaM
 PlTUre0ymuUlSDDHqeSx3J9qpM4UViu/+tFzR9elO1+3TrzujoLgBlPqlcDsqugvgw/Cj7XFGkk
 FNH89BUioEidfLnqNG2fOwTIk7/DTIueBNbWMQvb8PuB3KQQ1LpnSiyclxOXD3AvvJx/BvbifhS
 Pu/xrCjP5GVdrSxM0gdWDEhO6ilXU/5AaU4uGZ7mgWJjWCnFGGw8kRSJ9YJFZULvMsTER0Me9QQ
 l7VDfR/X1s/MfAwOMJtTRF5H8wnr9/oR3ETAKKPq3d3/4kciSnRzIuTlREc/6fkY4okEbdO2FTE
 L0NIMUUI+bvMI6JD587sKj0mGl5j2/QklLMs8pvXEAgyY8QL4/n2poCLp/xq2vCKUMFozLyrxIm
 K/Anx1qwWDSDN3Ap6F7osihx3YvJ8bCYtfjr9/QM38JA4U56wHrlin4k9INCn/2ce3Higan3zci
 hukNBo6WYDr4RGSN6tA==
X-Proofpoint-GUID: wMNfQ7FEBqGOmomEUINhzzpKBHnIx_ra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_035834_782161_27008B33 
X-CRM114-Status: GOOD (  12.08  )
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

On 5/8/26 5:24 PM, Jun Yan wrote:
> The sn3193 shutdown pin is active-low[1]. Correct the GPIO flags
> from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.
> 
> [1] https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf
> 
> Fixes: 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

