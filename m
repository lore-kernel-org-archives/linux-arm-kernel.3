Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EFECD583B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 11:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHrWLmSLNK/AuxYZ0Fr323TcqsIbmfwjvkMStothfTU=; b=0iX6UESq4lJjL0tGyeDoPaXf0s
	Kvy2QEUVy51mUsDOM+Qk1xsTYgEds8AImGN9sOm9YjN586M9UbN3sdXV7WgYs3lQnWgJ7ePc8T+fB
	13NqNoV7lJvK+q2Ho9qz56auZLCnhzEJSfnfwbrlhts+VMjkZKBAvFVyiDVkxvlE6IZw2cvztJf/F
	LR1y3uH4PaynwzO892Gh56LvNp/WCCCpo4jZioj5gxY1altZHrPNupS12AgsCkfe8UEj3Rhs6QpwF
	kBgVPdAw+ZLEsnXWvwtMDH2sntw3MQLks0H3uC2Cqmnr1DfLrbCx4WzMXXzPi+ba03Xc1dVEYe1Du
	4Sbu7/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRrj-0000000Eq7A-1ezo;
	Wed, 07 Jan 2026 11:38:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRrg-0000000Eq6D-3yBI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 11:38:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079efdr2988464
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 11:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hHrWLmSLNK/AuxYZ0Fr323Tc
	qsIbmfwjvkMStothfTU=; b=cN0gxQdoBXNRBUGFuqRgxaRlBzprukYD5lYhDHbh
	pJCKSwz40xcwrwqkily6uh/EgL6nWBzkttz7gDMRrpeKgjtrl+kIctX4StnKM5Qr
	xE7dqdZXJKpjyP4HNVph54Kvu/feROYEF/2Gp8YsWe60Fx7NzqIOrJnAwe3iGOj/
	K6Q4znLDh1EU8UfdcpxuptPmjlECc5h7m1dhVk+lIbXNBpm3iJZggY+dBSocYQEY
	G5MRM6bFnP8DkR7MTRaidB986Sgmu3O2uHLlrX7hriaJIqu9v8U1HOeWAEMtpJfN
	EoDaq/XTcuPiHUOhd77u1VX3SsZoX99igl7TWD3kNc6pvw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn2nrbmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 11:38:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4a92bf359so57056521cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 03:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767785891; x=1768390691; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hHrWLmSLNK/AuxYZ0Fr323TcqsIbmfwjvkMStothfTU=;
        b=ZaLxmHUnw6Ltzts2G04l0co4ZNJRLoUGEdcpeWFFZ3Sft5fo4sbASq0zYdtIopnciW
         EO/N+Oc/O845uncUbmRWyQQfknBeY8Qi0of9sC6ZjncHSTFWe6wwGPXM+yIUEY9YB/IA
         RhZuGrKz1eWvXpqTquB5w/OQkxHqvtRfsevebKraVqMry0OY372WvQVuyfWi85X97Usm
         XZuGdvyRDWHY4kRjHycVV0AIj1sM6M8oKydQHfDFcAGw8Uh55KcUbIDRQEQ6gj/QisNZ
         HZS1Rx6YAsuj43BibjoHsnFcavCjop65GKEegMnMICXFUtPWGVnZ2lUdV7CQKRDn3wfF
         zDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767785891; x=1768390691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHrWLmSLNK/AuxYZ0Fr323TcqsIbmfwjvkMStothfTU=;
        b=m9kmlILXcUhWSKzgdYnjuETduHvNTSI1w3T5s3G2LXoRhzJrqyvxwWErnRwxet7OTK
         cJp0kJBAYCO5NQEYIYTEyayG3RkWBKoqWzEpEJVVqiIUQ9oKrcbwCGOXinjav0BX5O+n
         UmaOWqJs3+mrGll4ZyJ5KKvP7VAgoICXgHCuDv/J659mKE15KZfg++ZTkUjdOxppraba
         OZAdaSWKO1Hcg0STwk6rR29Uiv4y1p2P4Uk3XT4K7RynyBSFkusSWxbzVolh8Rmu0g9l
         Vw1WcTyqfAVMl12BjMfgLLmrG35is8uTFoNWgtdHA/Jrsbz4dwPtL1x22OLPfmvHexVA
         rPKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkny9pchGQStdZj9M8dz1ZQZ6e7ygtgz2DEd2yXhzYM2rDp4wdP0pRGk7bAWuRXACqiusclTJpHcDa6qpojxOa@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5GM02eQsbY9NZUyfhs142NGFcT+feGGzZWDoDAwb6JHdUDt+/
	encESnNSp6hqsncY3ENl87KMmg0l+w10CkS41ikAvQTWu3SflDK5mADVxKTw0y7A6UY8lVsoT14
	Nx5JzPEHnr6a+k5FEa5IdllkLhwiM07lQs8CGSTaEcqKBMlR8n4e2TepK05r1s9+gZ0RNYp/2aV
	y5dQ==
X-Gm-Gg: AY/fxX6DFalwGkM/RPr/Xk7vCSDi3JEBH5PG0/YWdMJpCxHM4eyGnhXqd+usT0/yLb7
	hfw8V7PPgbI5V5eRj7BAYaw5+z78lrDdty/djW+gzKWbbQn6GvJ2IE1V8UoJLcaiWbrqB2D7yKT
	G4V746N/od9KI3qloe4wGfNi1YSfWlIlB0Us/dm24upvbnB6EwM7ZYH4Fnw+8YhV8lKVUjWlSB4
	ofKCt/qi3Egh53FTw81kCpJQYVPColMpPoizmoFoO96zAB1JVCEVHmdEnTanlV9X4CznOD+0+PS
	dNj6A9MO54K9AOVQZzx2wbyOrQHXs5VKTUkiOpW6muMbwHzbtLKk11ez2ZC0lcnAfm5ARzh2VUv
	Flt8KfXQVfuFFxFNn1WsO12XGvdy/OPNwkqaDVqV272Gs/khGA8rfwjuoY7EJSqb5O2nm4ZSrUU
	5bBmUzpJ9gIPH2nu58AuSN9bg=
X-Received: by 2002:ac8:6f07:0:b0:4ed:2ec5:acbf with SMTP id d75a77b69052e-4ffb48a85c7mr24563481cf.24.1767785890935;
        Wed, 07 Jan 2026 03:38:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHssrBbLsPN63EAqbkxOs6z7YlYy0fo56gNVYCJ+4TuA8iD6IDnXJH7V/amJMkJBpE+nIYMmw==
X-Received: by 2002:ac8:6f07:0:b0:4ed:2ec5:acbf with SMTP id d75a77b69052e-4ffb48a85c7mr24563251cf.24.1767785890529;
        Wed, 07 Jan 2026 03:38:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b715ebf53sm343531e87.76.2026.01.07.03.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:38:09 -0800 (PST)
Date: Wed, 7 Jan 2026 13:38:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 03/11] clk: qcom: clk-alpha-pll: Add support for
 controlling Rivian PLL
Message-ID: <jffkujjicjljsyqfzu4hotjetlfcextw4vmmagjxya22tshol7@buvtkrkmttos>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-3-8e10adc236a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-3-8e10adc236a8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MiBTYWx0ZWRfX9yc/W4CvJas1
 Ii0I9bRWXgWbbAsA1CoM6o+W8p50vTV7KQn1+p76For2qT8qP6HgYBiLwZmLZ3MRXhvaQo7g/sZ
 p9iSu5GRUz7iQIuGGbfPgiQfxF0Ay+VSDRUO2LcQ6zRoKCq4wL0Q5npLwUFmniakStPWgTEJjny
 j3+OSdyYGyaNc1FqkKnU8m8qavugmWAisDzpBB9cCg9wfLKala8d3qND742CDmueRyG2Dl7JStJ
 1D83rZBzySWZCRqs9bi8ZQtZBGTOpWez1p9zxi7W4RAwfdLQ4rawWlzsPUlT20hG/iqrA9LCMfT
 X9KG7nxtc30C0JSR1C8dCys3Vl7DuzCWd77ZfF/9V1fUnqb/4Cg2DeN64Cmv6UiCfZINTqApYXn
 Q/Ycx95owgH8sGBLGKai8aI9TMtMqjXgBF8SIV9u1tnKpO5PduKnSVt/XlcdRpFZ8b27L9HyWzf
 VEGJUM5mwyjudsZ1p0Q==
X-Authority-Analysis: v=2.4 cv=CYEFJbrl c=1 sm=1 tr=0 ts=695e45a3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Rar_LHnIVK7gKg-YXgkA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Tfba8jL_9jCWULuiX8g4OImgkxqz_-yp
X-Proofpoint-ORIG-GUID: Tfba8jL_9jCWULuiX8g4OImgkxqz_-yp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_033813_105207_8F1A6730 
X-CRM114-Status: GOOD (  15.37  )
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

On Wed, Jan 07, 2026 at 03:13:06PM +0530, Taniya Das wrote:
> Add clock ops for Rivian ELU and EKO_T PLLs, add the register offsets
> for the Rivian ELU PLL. Since ELU and EKO_T shared the same offsets and
> PLL ops, reuse the Rivian EKO_T enum.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 14 ++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  4 ++++
>  2 files changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

