Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D928C36001
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IygKvUSovqJjIcgBHkL5I8fdpvAkZ2upGcSD5Jix+nc=; b=Fgyv3XpuZAcByUthydyVmNGCTj
	UXIbqd+koM/dP9zbxBwSrfiXUUvickbCiZqrlmuxT6x9wR3VUxxWPWg7Z3cN96TGK+lHBVqWVAhWA
	Y5men13RliOKKFJ3ek7iTWOJBjpPWXlrAqu+Y3opF3zueESh4nkSNdWX75drKbKY/a3JjmotLJo/2
	1uopoE0AC4qXinGNC3MokLvK6C2s11W7YtLPoDAdGmtT3cwea2Qs51NjfaIVlpUOstWZ1G1JtE4RO
	CalcqgnocjTd8u7J0J9B/+2PtQd0f29+N9ntuYF2G6F9ySHS3l8Pfvh70Gt6SXkziaO1Llf5HLmwV
	j5GAUNkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdH0-0000000F5jR-1es9;
	Fri, 21 Mar 2025 14:22:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdA3-0000000F42i-1SX8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 14:15:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATEFx022440
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 14:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IygKvUSovqJjIcgBHkL5I8fd
	pvAkZ2upGcSD5Jix+nc=; b=iJTOldNn2Hujp/0G059Gy26ug4FclmrYmd8es9cq
	8K6TWDVA5odygD4qey/epN6oVcaw5LFZiG9lbyj0bRdmxwWsgOSeeSL7kplhRhBX
	jOre/1U3+4O7xg4IVT0uQWXP/Dt8UF0e+/MtlllSOi7fjeA4RnZHp2pcb5DmGZQF
	hQPzFT8IVuoPREIiX5PMrVsL/1hy6CtdpWbxbeM/r2B3/N/Zgg3amQUAyi0lCGEg
	MMrDVIfeFDHtkJkGSQVGOzuT4wJH6eb/Zdf/EP5Kkk2mq4mheGy1Cy0FQ69FpTKV
	Rt4BiyLLU0eGNCn/zPes5yN9OKWDeouak3r/qqi4UqJvkQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fd1dt1t8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 14:15:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e913e1cf4aso49434176d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742566537; x=1743171337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IygKvUSovqJjIcgBHkL5I8fdpvAkZ2upGcSD5Jix+nc=;
        b=VMQ29rctLNt0hWC97cf7ktWt6tVuWwxjDcZaiwqEn7xH0hcwwwr7ejVsftbr5YZUmo
         zdTOHa5SNhTYYf0cif6vdEHaboN2u48of+eWGGDERcNETCpv9kRUE883FSRcz2HpsRi9
         JuvImrWoW54lxlDkxHfbJhdvfGcI5xAqNvJkDOZx+J0PCLWHVtRvVEkuA8wS1UM2R1tV
         H53ER3Z7DhRgmJWSZzQhkvi8C64mI2Hssk/WrjCDYBrb4hFhQQ0HMNRmI8GDLvF8P3Mn
         6lLBZHmYfE9gPKzx/108VIlKftCzWGUmnv3phKaHyZrC0UoBqZqQTGMs5WM1W+iFEdCj
         ALcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd7hBMHLz1CeGif/SD0nmaD9R2u0CA2bb1Nxz73l3+bGrYlbXTgk0Ziiy73r4cUMfWBSyBv6tZKYcwkf8rV86J@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4EGYz+DpD23hjJdgMvtj78tpLWM2/I4RSt8wfX7g4cbZKp0mJ
	udPMHCcAqOS4KN53N3i+Lzi6hnvLX3+o2Kq6SQXZE6atcVeh0Hz1LiNQns1u++UufTWChLbuQtG
	dCos7kOxOOOOhkNVwMGfYo+kTjnT9kGerScr9wcHNNPvXXMLvndt+4XeApV485qsJQzCc5CQhkw
	==
X-Gm-Gg: ASbGncteQvOz2l3Ax7v4PLioAQnfafu0b3CxRhykMm90S5JUd0aIqSvKfOmAERXHPng
	2fm6hkN394bd7f6PR62pM2ap4zPtcV2LPc2hEWzhNrSn48SGnAVA3Xytd5IsFQExAppSk+PDvR+
	ito7tkG5b4vFsIQEIwjudVyW4wbj/Yc/I8K4EUd5iR4coXnV/K+CgWPDOPRvS/oM1dWTva31tBF
	rr6aXfkg5Q9fzatk1GDjjMsdx+U1UknQWtltDY2+v+747G7CFoC0G/16IgGN63aLm9zwseA7vAT
	y3wXx6ImtjwDyoV3pPKUxFo+Rful1yZmjKoTiMnJ2gAPMPK1HGnmWBPjntFokaTjWlUhOSW/0Zm
	kGK0=
X-Received: by 2002:ad4:5d6e:0:b0:6e8:fb92:dffa with SMTP id 6a1803df08f44-6eb3f2f5960mr61025106d6.25.1742566537086;
        Fri, 21 Mar 2025 07:15:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFN/n1Ojxb+W+fnWe4TwdIO9ZmKkhfBLlVD64bA7J5vncM0McnA+X9BWkDQCQmyd0kZxS+AA==
X-Received: by 2002:ad4:5d6e:0:b0:6e8:fb92:dffa with SMTP id 6a1803df08f44-6eb3f2f5960mr61024326d6.25.1742566536504;
        Fri, 21 Mar 2025 07:15:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d8f3c93sm2661681fa.82.2025.03.21.07.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:15:35 -0700 (PDT)
Date: Fri, 21 Mar 2025 16:15:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 03/10] phy: move phy-qcom-snps-eusb2 out of its vendor
 sub-directory
Message-ID: <vzlylhf5r5xy4ip4hkcolt3iye4stiabzxc4jwdzenbhll45ct@hx5gwpzrd33y>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321135854.1431375-4-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321135854.1431375-4-ivo.ivanov.ivanov1@gmail.com>
X-Proofpoint-ORIG-GUID: F1PXlPgNx6Fxe1e423cuK6vr7giWUVWT
X-Proofpoint-GUID: F1PXlPgNx6Fxe1e423cuK6vr7giWUVWT
X-Authority-Analysis: v=2.4 cv=T52MT+KQ c=1 sm=1 tr=0 ts=67dd7491 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=N56nwJYzXhOJYq9YhE8A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_071547_500153_B4D2F3CB 
X-CRM114-Status: GOOD (  17.55  )
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

On Fri, Mar 21, 2025 at 03:58:47PM +0200, Ivaylo Ivanov wrote:
> As not only Qualcomm, but also Samsung is using the Synopsys eUSB2 IP
> (albeit with a different register layout) in their newer SoCs, move the
> driver out of its vendor sub-directory and rename it to phy-snps-eusb2.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Please fix the order of the tags. SoB should come after Suggested-by
(and usually it is the last one).

> ---
>  drivers/phy/Kconfig                                      | 8 ++++++++
>  drivers/phy/Makefile                                     | 1 +
>  .../{qualcomm/phy-qcom-snps-eusb2.c => phy-snps-eusb2.c} | 0
>  drivers/phy/qualcomm/Kconfig                             | 9 ---------
>  drivers/phy/qualcomm/Makefile                            | 1 -
>  5 files changed, 9 insertions(+), 10 deletions(-)
>  rename drivers/phy/{qualcomm/phy-qcom-snps-eusb2.c => phy-snps-eusb2.c} (100%)

With that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

