Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230D5EFCE53
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 23:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=La/zyW1kZlkdjuba28Y6cKUEjgLjT1PdHqsncSoONxI=; b=QPZHvZ8O0MauBZJEEW9t7IynbI
	UpuHDaOJ1bmeeiER4SOJhZ4/DqUiv8x5qn34BdKZY6R6r7kuJJc7xbwG1YplPV7S72iuZecboU/vu
	2onaBgGm+Q1Zi3ITJIMZtBa1JoITwgIctRmWCbK2A+UiFOELlv9JhWRBxGjs0ctef27DN4tYCSpBT
	ZflvAXObCdWU8JSKmNYVrhuxOqwczqfdbBUN8I9Df40pC8o/a5217oGUpGwwgzuRR19A0qKEEE8sK
	2f4ljKSY8X9pkvfwxcNBF0PWPVjqkXenTvMQ+n/jWEapAJ2zyMV9y0GH3FceVuI2ehJdtcOD4IXkK
	5S7oDKYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxw5P-00000000fK6-3ReD;
	Wed, 04 Mar 2026 23:57:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxw5L-00000000fFz-46vs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 23:57:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HHte21213363
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 23:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=La/zyW1kZlkdjuba28Y6cKUE
	jgLjT1PdHqsncSoONxI=; b=M3gyhoDKsD95tRqPBt6AVRtUJ8xAewA9091Llh/v
	3N7WGAoRQBPzVIJQ+qMMIDlNc/bfennDxIAH2TEssBH789bj2CFI/9WHiWumbLtX
	Ql5cWWDkmHK/HrduZFYdFIBCxQbuZCUwt9VpsjOneOKdaQDvPYtLjUV+u71lyXmG
	dmxjU+qXynuSopTYtoQMCaamDnBl8AhwF8OiwiX39d0m+NMjaFXCFWCfbfdsFV2h
	o+l1R38GMJrzXlm7o2GPUvHPn1156OUgdepeJ2YZzwgJPRbOnHzpNxoiQgsN2xDS
	DJcDnZ8howbsvkbWgknRmV8ZQ+d0VG8z+7CPjjKVm1P8FQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5tdnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 23:56:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4817f3c8so3965280385a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 15:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668618; x=1773273418; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=La/zyW1kZlkdjuba28Y6cKUEjgLjT1PdHqsncSoONxI=;
        b=YDyzOGi0ddnzwY4FMICq2iyuqGv2h01cTEblYeeeRMEB7sopP/WdZQxbXmb6D0Kgdd
         s5gHb6NZPWGJmIYeS5XWBi6ORXFyrg1a9sxgUqLC9HH3QyKs9NEirddwCpknLPDccb4N
         xhh4lyr1cib4f2j2z56IoXJEWBcBFR4AV9LMaTBENl4f8y/LkUWHBSnwW80nMt3hQs9f
         Klnap+hztbB4d0rxnGLxvTRiZcSf31odNkB6hKZx9BSiO725dnG2hdFziRFAtlXpWSmf
         Qx3YabHAuozIErvjH7cI559C5TmdW9ZTR+oR0DtG5OwGIWZADZjnWQ+3REgX6xBhHVmF
         HkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668618; x=1773273418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=La/zyW1kZlkdjuba28Y6cKUEjgLjT1PdHqsncSoONxI=;
        b=cH4Y89jck/BO320fFVQnV5A998ZpFoCvt37YSi/0z07gDrRz8firIcsJD+FX6A/IsK
         vuRcS2VyciQUZRDkklC4d/1b2DT//gIinMmiygxWt/Ipil1sgScnvTyUjRUtxkMZ3dPp
         rBnXq+gzajHgbCa72Nv8eXp900JZ3bwC4sFdgGR8M7wEg89bzTtYaQrhAjrJTKV48UKh
         Tc0wHzgBVGvCv11cLr54vUvDW0w5U2IL1yN0TukNGwSkVP6ZwoH291o2GXz3a4TNJUKj
         l8ZyyIf1MZBaUAB8IV6ONuNqNYhQwdO2XuZGib4o4+FnXcz4ODJz/Nl863euKuSzoBV0
         OpDw==
X-Forwarded-Encrypted: i=1; AJvYcCWVqrU+oydojvPrXAQQvciQ7yrG+jbshDME6RBD6qA+qDiWbXq1XkUnb7ipyhhMnYjBlH8eb+1Kjyl4WGtjVCn8@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk8eI8CB0ZA046N0ClozNhGUJ5tctpA0i9VZoEcW/FU957P4Dw
	ruHpWjgsCAj+qTNXehxpr7TAoe/gaGvI7noQXR9P8Ep3BqGpjzCJpYt9ymSjzgi/DviOY4Or5dT
	0EQz5rEdZfKQjJuBEyhknH4Lemw+7QvW/J8NRl+mUMmkUIaZZbTp3PllHcuJuffy0fWElr5yV08
	CaAQ==
X-Gm-Gg: ATEYQzwoCzArs380d7NvxyGsOBnTdC3BwvncVBQsfJC8AfKCrsXCAv4gNAq7aJ1jL/d
	rP5uIOFVEvIBcWxPRwxv5QB08trzC9aTK37ywFtzRSH12mT/ulXzsDCvtehXvy3MLqKf7gufPzW
	lT2dwN5KUq1BrCs101DS/h5zXjiBRITmIJFlwO3kMCJ5phmDvNhuTFRpVk/1hMCeDNALk8629sB
	ek+ZRK0Tp6OiJEoXAWR3gWfJstpwV//CciZpA7MeCmxo68Hg6TacxQRuVAZLPtpNmiAFr4UIFKi
	fxVG36g53ec51tCtbxRO6cFTpjBaQfjWPO70K3NHJh2iYBse5dnglQOQIjTAes4PzmvD/KsduU2
	Z1rdBdK5bRW4WuM7iKOA3/AVu7AVx9yg+sAl4m/huxNIOmEI3qWiJfnkan6Qn6dEL5KJiwu18eF
	tc/Q9t6OKwkPznyYIstMxhpNQIzDvYHcHtLPI=
X-Received: by 2002:a05:620a:44c2:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8cd5af775e5mr481317285a.40.1772668618462;
        Wed, 04 Mar 2026 15:56:58 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8cd5af775e5mr481314985a.40.1772668617932;
        Wed, 04 Mar 2026 15:56:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123573df2sm1571493e87.65.2026.03.04.15.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:56:56 -0800 (PST)
Date: Thu, 5 Mar 2026 01:56:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 21/22] phy: remove temporary provider
 compatibility from consumer header
Message-ID: <o3yvtltydr5hvve2htwgqbp4bfopgu74ft4gnyelmges3hmiaa@wy3brdd5dnek>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-22-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304175735.2660419-22-vladimir.oltean@nxp.com>
X-Proofpoint-GUID: qSu4QEZAqsS3MRdHfRcaLmAP7IsDOmMR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5OCBTYWx0ZWRfXx0qJE2BHm42D
 7fZYJl03lNa+XpjdBl66vsGfp5CJgLqhqEXgViBMa2Wqvw73SGk8xYivBy0vUUBl5ayljjrlkLR
 o4+vtoIvanpnwrfoWGmuVhEpKT3I6gmp2HQg35KwkYUNqAJeuNkLVY7vhZgDyxy8aMvq8gXwEx8
 eZ5irKS4PccGpt/2gb2lVgvBojz09ZoccNOr0j0oNw1dy5l5xxsEypyiSWG2uznbE+hA+yJLO5L
 dZZbLx2+0kB/YDk7wESJSx9+MhB+tRfYQk4HJEbzWusQaOo5X5E+cajBAu9cXKiLO2xzvg6irBb
 WPyemLuNd0e2dcTw6NfZsbDXbPnm5tvZ73l0KVJHG881k9ajC1hRj1wFByh9doGf8RnPg6zY8LH
 ZV2ZVda20btJW9oqTEiBD8NHexNJ6aqRBB/E7rH3vtoXxvtaiCiAYzcH1XqR27zStd5XkrXfhCD
 RTYHQwXwUWTeGWpLNDQ==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a8c6cb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=Ji6k5uvf-STsHdHMmocA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: qSu4QEZAqsS3MRdHfRcaLmAP7IsDOmMR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_155700_162089_4E2CB930 
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

On Wed, Mar 04, 2026 at 07:57:34PM +0200, Vladimir Oltean wrote:
> Now that all consumers have been updated to no longer dereference fields
> inside struct phy, we can hide its definition altogether from public view.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  include/linux/phy/phy.h | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

