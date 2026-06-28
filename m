Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4FAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 22:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYOeB9wXREvb/kPXlH/uSBNjP/9Wet3bk3Yudk2xHjY=; b=bwkH7NOzWLeFapPf6qub3L2s2a
	8oc+yx25r2DQDNQdDlVcmAK/2AFp8ttmDJYJAopKkB2RjXmJ1V7nIsohg3lEAxXMsAZEyMPCx8ljb
	od5wlRoA9r7vw1wHYi4xyJqxhJyHH+KX0vlOW9gkJ82pdultfItUKI0qgY3HlAAIT906LHw5s/pll
	7tXeC6YWlOgRisNvhK19769SOxxM+RdYyo76IllCdTg4PmcC/L2vQ1DEvDKggDxoDlF8rDCU34lX2
	9h+yuVTrkeiME/uy63nzt497Dh19meTne3aBwRFUZWaJEnbyOZvdsWsi1fpYbF+Vr9Az4z1Ykanva
	iVsnu1pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyKB-0000000DSaZ-0gYB;
	Sun, 28 Jun 2026 22:50:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyK8-0000000DSZo-3yWW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 22:50:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SMjoJ21054721
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 22:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JYOeB9wXREvb/kPXlH/uSBNj
	P/9Wet3bk3Yudk2xHjY=; b=TNgb6CGJ1Q0zM/RkqqlO050O65PgXwERKDt8KdQH
	HG2zEfeMv9xdcLl4NAknubrRRPHSLUzNmEP9U6pqJ95hCaHPyjibqiXsSKOo5sbL
	cGdaN+Z4bq+WYnT/zT3immPtN4qTYkqW/luUFJJQ3kBb3rSfgGL9X8uEtX7UaNJF
	zAzt4+8XMg/2tFwVnZaqyq6WgnbNRvf928hV1p0g45fP/Xaf9+nty0xC0UdVtEQP
	xi2MX8a+zibiz7K82RGUnvX/LoVPSeQFvhzoQExiVTCFc5uI1Yq8c9luG6lcyqFa
	QbmXJCb8wV+D400Pli12Cku4keg5bts2SAbjDXLjqJFQZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27083q6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 22:50:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92af3d5e85aso564257585a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 15:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782686999; x=1783291799; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JYOeB9wXREvb/kPXlH/uSBNjP/9Wet3bk3Yudk2xHjY=;
        b=jRPmOITOGXharfCepPkrskZjuiIw9nlGFWJXCQxKmEZZULlQbbSfh6yBrW4SuzYpmg
         dcZPluRRevL1HpbCWb78yacCLQcj23pJTf/U/SEb+LWlf8ube7/NSyx6676MX9ieAq6R
         2QR+zJ9iHQ9/4DZxVhpOo+qao2gn4dcpbCIpI02FYsfqN9Gfm02fC1+nodwWcf5Rupqp
         YGf1gDNXgV/87hruoiqbVv/FzKP4YyPmpCe4wQ+OPkV1gPMR9in+eeYPt4iAeDWDOrSp
         TQ5zTh7rb4WDgexj1adkK2faL5naf2WF0Jf57rZ5RcSaRqWvxnGrnA/NIzNeDkZhqTkV
         6xHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782686999; x=1783291799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYOeB9wXREvb/kPXlH/uSBNjP/9Wet3bk3Yudk2xHjY=;
        b=SG6s/id6OpN81mHBy6rUhpA2qgVDcN1fkIyPlDAksjVJ7QjReU5UrV/si7bXthcB8M
         2jWJPlzOZE33wMIBdxuofzmjfY7KkPHUj8XX9XdSJ7HWtK2DpDYvHNJbQpaUePvtBQom
         kwErG6l4j0SUN+jtnDMqm93Sjr7/TLmVtCd5qdrZiqoZK5hFqHOhUhFhHUI2i/aPzUxa
         flHRMYM4maomf8fCYVl3Ik2AorIPRRRSHmFEfF/pFI8NARt1LzL0Fu7nZH+1CaZ/1++d
         /v8MVCLjQSmOZhuikXuqXUjzdVpgINI7G3RnCQjm618fItTeQdfLgSpk51VhdKzizXYS
         v98Q==
X-Forwarded-Encrypted: i=1; AFNElJ8qByRE0T/6OSM6AUQyeBYBvFWkqBgLjQwtdi5QVl4D9c0Pa6jmnvHRHj2h8yEb2cbGCZMV2A2uDQNcVBoezRb5@lists.infradead.org
X-Gm-Message-State: AOJu0YxRHTwcQlHYOxdteqcLFtpMi6b8ZetlF/yyl8vXgL0xu/K0ep/s
	7DtPaoMxVy489aYoUzTODtEq4O4X4ytenPRWr3xJJJKc+aTGhk1y0PHSAK6/f6FADdrFhI5DNax
	aUJHCtaHVZd8mmav/A009ln3ZD1Z7+n1D6Ck2FW4qYzPZogI1pMJP4TweRpKrLA7oyaeg30ZEgs
	zACg==
X-Gm-Gg: AfdE7cnubpt/ux75aksCPBc5SBeQ+vwwY/dbytKS4R2jm4rqirkLq5+i3zAQunLPSB8
	SmcxizmEt75D1TuwvXqrvIw+whMQEgGoJtLjK3oa9+1ztuskXAcK02WglWLttMqQgTeDlKjuuPj
	OHVzDWVUtxqsBpwAt5XM1cyczmFQf3vw5D5De21Qiw4kXz1b5FHebccCp4P4VEvCV9CIBQ6oNZ/
	pXR/DcSGBnrMduA2uIEMxf3ocyrtrcExgeYf5mJApEr+ZTXMltaEHYLW2pKSzIqE/mqPGqU4sGj
	UWTJ6aSP0dzAoMABNzGQIemXiWYzPZtVx4bjzctL7MpmtcTPPU7A4I3gzzdcMFy0adzSBr2DDgL
	y3PsGXK+MDsdvIu0j3JEShcssI7z9Ew9jbTYlOLP15x7dmDSJLwBXpyoXuNNCqPQ6iI3lyfEk7f
	F/Wj4Ao0ypUsuykdANBPe50DDD
X-Received: by 2002:a05:620a:19a8:b0:92b:641f:ea64 with SMTP id af79cd13be357-92b641ff8f9mr1205794485a.35.1782686999084;
        Sun, 28 Jun 2026 15:49:59 -0700 (PDT)
X-Received: by 2002:a05:620a:19a8:b0:92b:641f:ea64 with SMTP id af79cd13be357-92b641ff8f9mr1205791185a.35.1782686998633;
        Sun, 28 Jun 2026 15:49:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999afc749csm74899421fa.12.2026.06.28.15.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:49:56 -0700 (PDT)
Date: Mon, 29 Jun 2026 01:49:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: shikra: Add Adreno SMMU node
Message-ID: <ilwsmzpebxsobixd6xwgkr2dajsza3dr2ghcxfig2m6vhcamj4@but7o2rxmmrr>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-4-9b28a3b167e1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-shikra-gpu-v3-4-9b28a3b167e1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ObKoyBTY c=1 sm=1 tr=0 ts=6a41a518 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=CtAqrJV6yErwifH23rQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDIwNiBTYWx0ZWRfXxlPNxjAUVkv4
 O4LA/30XFxIU1jOzSfIlL3FGbOEkq25ZJft+xaQ42e0tPe1Yy5OumG9pVg+xt1R2MHY7WxZ5HBR
 hHpuAnIc1YmSdIWLsw0eo/gp3prw7+JbzITVsTA8F3rCjZ8fOI87K5CR/tsCrzQIWSfv18AQfU0
 BOs8klWIfYuMO8biYjBqoHPHZtnVjhYBX8I4ZstzzIBRdC4dRzuXQ74DcecTx+SWqVL9z6SOqAe
 GkQnMN8dWLs617p4SvG5tloaK4ZvVcY2anBmai/MevuKolaB0W5qPt+f4ajmkHOITWRgghSCyke
 mFcF8AosJDUzO8PVcnfzEidQ1slbQTV8C6JN/VANvaJZHqryQfIMQgzhHBYdXkXTwNOnZhABxL+
 FCHClmF0FqNorB5ANiAp2V+4C13JO+6uYkSDSmX1nr7IpxG8LE/SP16xDtvhHfb7zK40/ed1ieQ
 8hW3FHh8hUExqaKXYAQ==
X-Proofpoint-ORIG-GUID: 6mND9DLD28GtdLZSdIrFD_NnQV8BiusR
X-Proofpoint-GUID: 6mND9DLD28GtdLZSdIrFD_NnQV8BiusR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDIwNiBTYWx0ZWRfX68gsijRcMnbJ
 MQJ53Txko+gaJrzCbzLzIUw8TuZglV7SeZzar9T0WM7lVCIFIz12B78KNKgSboTSKC3bJHfFM46
 qAxQkdDxQicnSU2yueNqBpnf8ZWd94g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606280206
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_155001_007710_50CFA927 
X-CRM114-Status: GOOD (  13.84  )
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

On Sun, Jun 28, 2026 at 11:53:57PM +0530, Akhil P Oommen wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add the Adreno GPU IOMMU (adreno_smmu) node for the Shikra SoC.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

