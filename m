Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014E2C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 10:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5PN1TT1lMw7TFu/s+fchO87W7nUXA/Ck6/FI9wxkQQ=; b=l+wdC6cGHw2wg4w7CpH4cvr8SL
	jbr+nY6wXDnZgeF/2Ph/9EqraQu+Q/+C/Ng5et4/iiq7dSxIxb9o5i7M4+2z+6roNdFrcoWGaG5uG
	r9pRCQV3WdMTRD1QkGF2rVg2NVY8ts4by9gj9MSJakRDmG6iUaT8EuTSONQfbXvXuvExQAmh7uhVR
	Ugjkr0KaaJfVJCJRfwds82qaGI+Df1qsKHM0uQyAqUkdCBz34/eJ8beebwDzMkghI8CIrbf8yDXzW
	kURdLxlLGbFslgSvvtvfx8oyecqme6ciS0ARfIVbrVFnPVC7QrkT+3KHUvqg1s6p8wmdq6ptPX7vN
	Ol9QYT3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woebM-00000004uFL-1oBy;
	Tue, 28 Jul 2026 09:59:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woebJ-00000004uEM-2YNx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 09:59:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82WcB2129569
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 09:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U5PN1TT1lMw7TFu/s+fchO87
	W7nUXA/Ck6/FI9wxkQQ=; b=J1ev1n2UjmCEGnDr2A3w20S3xTEdMbyk2o0n2O3b
	uydHI8Fdeh6KmvEcUuikaqnKHsiZRMxfXorFisVwty213IRNbxOFTqYqI3AhFB04
	2CglaJ7ckrkNZ0aaVIds/BzE2qKPgBo4kTvMGXmIeTvgDk/7CSrYHgNYcCUKyoXn
	DU/kSTJ7rAHH/q5jiwTr1yV6Pva1HsPkvCIF11KSqlLbd4hrwQv6zFfK8jXEmxXF
	RFJthzdSlIov3kNjOQTSIFSrcJaG/I0LMHODKM3hFbk3eAJpVfGRdY15vBqD9RIr
	YJmaYfwyqdp7xuZOpa/SyTsoQTdvKpddt177lKG98FlhfQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8bm08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 09:59:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e53b8a302so415610485a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 02:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785232792; x=1785837592; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U5PN1TT1lMw7TFu/s+fchO87W7nUXA/Ck6/FI9wxkQQ=;
        b=MLWdk/locXQwvUBAAi9iu1ACdTEOYlWzqbPAoCY7IJ15vvmfB111Xd6YA6WNSiTQfi
         6S5gINezNIVqXMWdtdH5W0Uz4WQVj0iXoYSHCG0aIqKv9mM2LAvWt4xJbEFqz2hImMmu
         olhUt6JwEbXkKiIVPS7tTX+JT5jGSQjYir9ZcHVdkEC/iYBqiSF6vKvxAmnHTWlqrlfV
         kTr1KXNdXE8wXMH805ZrbKpe01w+QZxawVjxN/hV/YzNBdJIPBFk09q1oTnwNu69HN/Q
         hrTSYd3qvaQrBCH2OQrIg/I2FWRJn+E9UVXOr7TmQw37q/onQcVvXw1BlUXCHpiRZnTJ
         +wFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785232792; x=1785837592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5PN1TT1lMw7TFu/s+fchO87W7nUXA/Ck6/FI9wxkQQ=;
        b=r8JhM/0JVdcoi/Najd8IVdGKNKcpiJboSnrKx/T0aEmyNePIlimDkxo1CgaCEAQwCV
         umbkA6Lt4d6Ki/WjFueyQR088huU/28MLeqzxdEx4UMJWOgFPjNE6Sc8zcQldvjIobqn
         mdfIc16Y0BnaCIm2yOzh1++AxG1LJC71m5xBaM9q0BDzgj0wdCWkTclT2yQgEnnDNshL
         /fwG67Zih77n7gXn6Cytz/eNQXR1psEwPia57WXkgIsesTwi2MbOn7gbshWNVU0/WDY7
         x/LtdXvP010aFMZmrV99e0NnKlOtGAki0Wrsa46i407Pq2/JOIjLyEHGU7qShUnMFEFc
         QU1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrg0366O4MrWcWwNUcf7tQSuhVcKcwFcoPmfSEgsI5AppE3jS8Z4e5W3wxnIzUACrrMFeZPnTQcvfuNr1BsOmrW@lists.infradead.org
X-Gm-Message-State: AOJu0YzlvCzTEIK3tYys65nMoRx78KRHnRNagaS+XpRiwEZn7YujHJaN
	eso8v36QtgIya07wapHn7TVqEAvFIp+uc0X6mTMR/58NXKUxuBJoBLvQpxS4Mfd6/xZbRohBZX3
	C4f55Ns1QYedPnDn5IsiPkD83QsatNDZuJ2lxjR9DoBgsIt9F+O9RO9M+QrzbanUqvPhFDepbDI
	HoYg==
X-Gm-Gg: AR+sD10qXCf7wYDWY4BJ3talgfxCMywFedghOvzzTXBLBx/GKYliHVZOryJM1Mt3bhW
	6Uf0WiSFQA8ztgvceh1OUHCrLgyMVCjmz41NfF4j+5MS5h3w8sB+MbsYfnvoFZCRurhiJ2pvmT+
	AICxgwXVGrx05C/AuvQnbHfl0Q9zEtuo7h8fNiN43ml3Rso3vhNEjzFoSoBcyfjFEf38ArKAoyP
	Qq8YPIrhhgBqcR4p6IYXalxsqPiCsGkctaUFh/nw/mdNTMLj4g+yhxps5XF/yQHcTtrxSkBwP9h
	4iwFv6eOPdB2JMinz+Pyerhok1pv7G0IBpqOd9WhuuW3w888Zj+OITzXyn0Xq0FmzCoyT79zYAP
	wn4hKJO8Fbd4vRhc=
X-Received: by 2002:ac8:59c7:0:b0:51b:f25c:2896 with SMTP id d75a77b69052e-529d6fa0310mr13120391cf.11.1785232791989;
        Tue, 28 Jul 2026 02:59:51 -0700 (PDT)
X-Received: by 2002:ac8:59c7:0:b0:51b:f25c:2896 with SMTP id d75a77b69052e-529d6fa0310mr13120161cf.11.1785232791475;
        Tue, 28 Jul 2026 02:59:51 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b388d5b4sm212090015e9.3.2026.07.28.02.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:59:50 -0700 (PDT)
Date: Tue, 28 Jul 2026 12:59:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Frank Li <frank.li@nxp.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v16 2/3] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Message-ID: <2hmw6cq6e5ba4hps46k2drdutaofcqcrczjreq7hoikmobb7rm@wbconxilsxg3>
References: <20260728-csi_formatter-v16-0-1065ba47530a@oss.nxp.com>
 <20260728-csi_formatter-v16-2-1065ba47530a@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-csi_formatter-v16-2-1065ba47530a@oss.nxp.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfX6eDz5xLpQdRr
 LGZW75WGBGh0QoVOSL5euZhgUT4nwrt+GmX0hqv7wN/fiTCn4lk6BKFEiYMnxZ5NwqDe9UbvV6M
 T0Eha18l9O4EmSiA3l0srLCbCfcFpARAmVpFjKn20Icgh4bgKtLv7FQ/6EdVWubtMvqnLLg6wt9
 YstlpP/7Y2VVzZ2I+lGIfK0gR9XL6nmHkl9k8Gmvjdr6qOtHuAbmA94so71+jXqECqRQOCXHfAj
 bvJQJt6uOTkjgYukBqPdHp559W4VjQQiYFWikxEOlcw0PzqIVAeDUSgC2Z/Z7C3CJKkAoLo4m+o
 Dlnhjcgb7rZnNpk1mAOPLWqnJFMzyV4H0P1PjjQ/o3+Hw/cGtAHv1RUA87+u6axfDGq4FwOKzFp
 b/7OlKpKeqhbBgNvFNfzMtYEs9iGJ3JL5DbEIrUMIFe6kdfT902ijErtGoJZHZe9+nHCBv0C3Sz
 MTcsiFUYEyl6AFwpW1g==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a687d98 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=P1BnusSwAAAA:8 a=mdcQqFF6s0ROXEWFMbUA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=ST-jHhOKWsTCqRlWije3:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: S938Q2dKlrNobFko-z1cz4u2lpG4XtkG
X-Proofpoint-GUID: S938Q2dKlrNobFko-z1cz4u2lpG4XtkG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfX/zR5bquB3Do5
 BELV2wnvGdvinqHjYir2qdqKuCdntn1UwyymiXK0ziHTh/Jph9qPD7UIeczWf1Y/KPAyLejgaSj
 7a0Q9W+C/r1gkia9emHqWJTkI/lLo0g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_025953_765404_196F9915 
X-CRM114-Status: GOOD (  13.36  )
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

On 26-07-28 14:14:15, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The Camera CSR contains control registers for multiple CSI formatter IPs
> at different register offsets. Each formatter is an independent hardware
> block with its own clock input and media pipeline connection.
> 
> Define schema to allow formatter child nodes under nxp,imx95-camera-csr,
> with 'reg' property specifying the formatter's register offset within the
> CSR address space.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Mauro, please let me know if you want to take this through your tree.

