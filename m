Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E71E9A035
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZElJviG4NF1mW6UtvdcdLWTvHSgF6zYjPqp+73i8VE=; b=kjNTJKJ/QV6KlWV/aVlU8N4V9o
	LCmw98z0L6t+9yWfhdQ5Fg6P+qDL3Y1mFjJI/cKHchKMiEgZRQbtFWHJr50/yNGPryROd4PvPtiTk
	k3JNaOCZSRyTWCEN85QWw4+WZfhdN0xxR9nc/ueX5JVUH85extzeDBLsEbVWbsykcfHOT3RrEaxvU
	EQ+6hjMS3Kh1vCDsGPNtHef57Z5T8TEiaKLtw1IzffgRS8nudfu1vHXWerQ57UsU7zTt1LEYvDvIm
	YDH9bkTG9ziOItptjv83RqttKpmFqH17qIkWa9iilTRyO3jPEqQEd7n71b4dIi19/sjKzFjpPb0ao
	AuEFcdIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPuB-00000008j2a-0xfq;
	Tue, 17 Feb 2026 18:34:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPu8-00000008j29-1c5A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:34:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HFUA492319792
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HZElJviG4NF1mW6UtvdcdLWT
	vHSgF6zYjPqp+73i8VE=; b=LHxKULUR8AdJLUA+Vd99o1XvUr9hZBufaxlm8UJC
	zwiHJ26uBNAatSzFqPVa68DvlOHxOMy7OGM6H3Gg1z+NHxOLoMqS+ojcaEKd04AY
	xU+US4BBAKk6ZlehHl/K5KjN+7mZ8Z7j5DuXlzvhn3R6ewBFuJHpLGc1NNkM3KIg
	SR4ei5eYh+RERmNU9lawcDgWB/r5sl0OnOGZ70+RnB2baaY27+txWqjrp22gIkzZ
	e9t/Jzjo+PQ7L4v9SL9BWjJt0xJSaTMlq9pOZtJmhw3ptQPoS4mGW0TwR0nkfrVK
	yDDS5+SIa+0zUht+7RmLCxLpOGhRk9N9APyuiNYz7nRWag==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccu1erm6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:34:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354c7a38429so87743a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353274; x=1771958074; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HZElJviG4NF1mW6UtvdcdLWTvHSgF6zYjPqp+73i8VE=;
        b=eLAh8E1/IgH/aQdn9VWZyh2PA7sKhifOz2GVoM7MMpCg2GMbb/sRgwDX798mBqjUMb
         om+vpTCvAe98ikIuGKcpu2IKE2dMj6/WvUGyHmZmMF3TE6ECuiPld90zAaTldfsyxANB
         3tClV6Ge35o5/G5Xe8P6Yc0z0yv64vuPXdm17qoDNskn5XKCmbuMx4b3Ho/80LrWMrSZ
         HNb15W4kkOsv7E0eSCVxwYWVmXOjjCIicllwIR2w4Pwxkw0FLXdTk1Z06WnO6+7gwYdw
         8cX1wGTO4JeAkCcB8Uuur2udg1uGqW5961i3/LIqTdoCNqK/0F1Rfp/LRjWoiNFeGOm+
         qT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353274; x=1771958074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZElJviG4NF1mW6UtvdcdLWTvHSgF6zYjPqp+73i8VE=;
        b=RBQjbAlaNbdoqrtqlJPwt0iLSQInyRWR/jCRAe+x/QqoWjWY/g0gcSIoyAZ6HJkR0w
         +u576V+SsNiY82BaBjrrAt8Lr3kvSsbr6naAoJyuUySFhkHW7nIQYS4W8UOpqG4n1O1p
         71kr9il+VZuyCAw1H1UHCrSBveUPsf877H4dWRFPF/S2oSsi6c984VxnURDk1TE0frih
         XdqUS0huZwPDFKzOkQJJoGEaUNqVe1d0Bc2D0wHM18tBvz5duFpCnuQ2oYoEfgEpqrnj
         9w+XTU7dWD0HLnM36HBfbmHxqujfK+YH85fgy1qBac3JoG3+uiCmcUW7rlC2sOz/128Q
         Apqw==
X-Forwarded-Encrypted: i=1; AJvYcCUqLNpO15C3O64MgCEwCRgwlnpbQO6LegErv8HhpUq48WI/11Vr0O4rcfSlwgFuAyLOxUMzKOlglXS2gyKMs1lY@lists.infradead.org
X-Gm-Message-State: AOJu0YwqiiR9I1K+FBq7YVfRCDY2ltQ1hvJ7dlpXy+I6htg60/12TqXT
	PlVx7AZtEznt63OPSgOiViDcyiUJhBvCTj++NpybV+wSLCQShvD5OfwTCXjpVt1exwwp5WBPzsu
	YIIIt1JI60o03O7cRnhJ3q/lx9MXtV6zwBmrzohpHL8k6piLSvTjGJVDJWgdFFJKIUgIMWN9Rge
	lE4Q==
X-Gm-Gg: AZuq6aI/SkQwgCfN04Ou2szk0EkIBI8iF6MwVw8hyltCsKOeChKhcVHR0z9HuU7+XtQ
	sWnG6VtWNS7d8b7PLbUK10BQDEIlpvCafaMGnxVqMrDACWTfYH8DJ2dBKK5oTZzZfksG3FdEcl6
	B2M77szfRCmZRvvD8RqKq9EOXugZs6aweRo5GrYr/q9KMaJML/Dq/3HnyHb/glTwKAojlj6kN64
	hgWbuYwoqnFgTAXo8RHSG4v7/89bxo5AJg7JHHuM8w+r+75Ag86DOUOpD5Z8kYNJyYci70WECzl
	DpqscBaA/NprbEi+egGROnLxgG9u2Avmx0P8wwtRnchEPqSA4zbylr1rgx99pKP9NdQthg8xeEj
	QVaVx0Ub0O9VmCUOQChB3SW02PGMN8Qr+8qA=
X-Received: by 2002:a17:90b:2b8f:b0:343:3898:e7c7 with SMTP id 98e67ed59e1d1-357b518ea91mr10071986a91.12.1771353274191;
        Tue, 17 Feb 2026 10:34:34 -0800 (PST)
X-Received: by 2002:a17:90b:2b8f:b0:343:3898:e7c7 with SMTP id 98e67ed59e1d1-357b518ea91mr10071965a91.12.1771353273637;
        Tue, 17 Feb 2026 10:34:33 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662f8cc57sm23799159a91.13.2026.02.17.10.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:34:33 -0800 (PST)
Date: Wed, 18 Feb 2026 00:04:26 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next 1/9] net: stmmac: qcom-ethqos: rename "por"
 memebers to "rgmii_por"
Message-ID: <aZS0skzczDS9g2Xj@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKOv-000000093mB-48ei@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKOv-000000093mB-48ei@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=LfsxKzfi c=1 sm=1 tr=0 ts=6994b4bb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=AnVTdvRHBf_CuTIAticA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: OMBVfcoiKpManWCpwrS_Juh_E84Mn8oM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MSBTYWx0ZWRfXxj4GyuIwWTn5
 tmk4rb9CnRS15bMAIjV40CRjwxwD70xXzoR3vbhG/4cIheww1P1w0mvP4hW+4cd0omJ5juyDpKT
 cj5Z+mlATxQZeVMRSnHepZzD9VNUjS3Kb4PEB8RoN03jpFgYIKLsFVIdliqSrrdP9onQUknEBYI
 b2VBxWjS9Sp5fBCvGS01GYDJYSiskvEDstRbi7GoURVbEiZ+OXStsz2RbnVrKJTqOPKKWnorxMF
 zaNHu8el5Et0ZfRxA5ljXStS6rqNGGnLUIfKt1HP50BlqiZjRFIODSYF+GO/YDJ/jExkRu/1Qzj
 oG3VMUWd4kE5tntCyP1pScb6e0NC8ET63v3hZugeGTUBi4aqwqfV0hcoUa+tFamM+tcfVDwYskG
 /rD+BAtHyy4GN6aaT0vojBryRZt2/ztfwQeWYNF6PS0E2RLqBuoKFIxLvEOgxrdOOjhtgsu5Qt1
 wUPb4zwdOyukl8DV0Tw==
X-Proofpoint-ORIG-GUID: OMBVfcoiKpManWCpwrS_Juh_E84Mn8oM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_103436_540749_5F63F525 
X-CRM114-Status: GOOD (  12.41  )
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

On Thu, Feb 12, 2026 at 12:17:45AM +0000, Russell King (Oracle) wrote:
> Rename the "por" and "num_por" members to indicate that they are for
> RGMII mode only as ethqos_configure_rgmii() is the only place that the
> values are programmed into the registers.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

