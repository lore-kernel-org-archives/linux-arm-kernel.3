Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490E2E9A036
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrP1EV3T54x1E7EsuxwJ7YEZjkA7SuQSx7N9/VtPaic=; b=dUUd0wo7ofogNP8EOuv7xifzUd
	g2Hf0wL7n8pvKwAOdyD/e0fvLvuxJHTexwllJk8/1ushx+XGoSyegzraws7C2wpTr75GPEL5pd6+A
	1CReCMhZWklysajSp3wf64wgzVgGxvTaXgDJVwjb54oW/vTW4vlGsEb1af6H8bf9YLxO6EF1NHZdt
	mkH/yFbMxHT/yHF0qYRSuY2l5OZ3epmJvSi9dwdulqHN0Wr/MGtJGTtOg8ZyURg+zThpqWmaFwJaU
	ccTTR3eCn3w9PRBdGzSF2AS6UKPNeDKfGjKEropP0WBRuMs4CMGxhzBjutaYZfOgBPrqkW9xB6l6y
	k8QPjItQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPyn-00000008jlF-0dtu;
	Tue, 17 Feb 2026 18:39:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPyl-00000008jkq-0Y5a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:39:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HH08h31545010
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HrP1EV3T54x1E7EsuxwJ7YEZ
	jkA7SuQSx7N9/VtPaic=; b=XnMxNOFA2nL3bBPtO0tGC9aKa0ddr3/TFFj3lql+
	OLwEaR61vOGo5OobG5tWWGPMXlHRCQ6VbxpjC7juDNVFex8dYWJr9h8fSJMzAqsk
	QfF9nWGB0+y1rq+o6ZpZAt2bHwH6LN5Ne7ZJvwkFIokvr5gpaMUwYI7vWaaMMTzu
	T0PNooiyLyxniBkd5QqjnoTglaHnsauLxybFqkADjbDK9euSUDGfrF8Wqxu7bD1X
	cKdC2BId1DTqMnOP8uFI/RplCaAy4SAbut8RVuXx6Eve3V0WKQ+Ks/EyX6q4NCqS
	sc9nxdPXDaKfhzHSt7IdyaCDsi8cGcOuzA6M4m2PdgGlsw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ajucgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:39:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e74e55d35so1421957a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353562; x=1771958362; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HrP1EV3T54x1E7EsuxwJ7YEZjkA7SuQSx7N9/VtPaic=;
        b=DHuS6ZHbYNHt9v+HgVoYKq0IB8Gci1EYUmDgQErs+F0DCp17o1LAAI/YL9WhpON+0k
         Pk3FrD3FO5Vt22nNl369FqqOgp5jrc03y/DRtAvzhYWTxiDJuWJjm/0zVqCwMNpKk/NB
         UcvOgCfj7Du/7iAgqKHoWA483UV+beoMVHaRGuIjBPwnYuGbWbLYTDweE9w4r8/QLkvW
         CsbCaM1sDHeXDzkoUevfAbn1gkbrK0HeAYjv3BCgWe97NcqWZk2iL/DR3pbVxmS8NNKT
         v/Tjjnmb2WgMNdx66XFNMgQOc8tlADN2gnNDc6fG8oqonBpTjNnb/DBnBwTvNCy0a1PR
         XM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353562; x=1771958362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrP1EV3T54x1E7EsuxwJ7YEZjkA7SuQSx7N9/VtPaic=;
        b=S+jyXDpeFoW4nwJ5ta1xXG2z40Y+Apl0XaEfPskoEDZxNXij70HQmJyoRgWXbLfcv6
         XhQ5hVyy7fATNeMY+c+/Kcw7VhHNlodMHBfqfBlOjZH/JTxHPI4WwZnaLwztwS37ZEeT
         Zgd8GKIO6FicQu6m5JQ0/Z7NwxffXXRbT8Mw3VigTXeXi6Dzh/PrtlBGN2EKKi9J/Xqy
         FQnBpVixdkGjUyBkyWcNY9S4qXJdxRRAJI1/7Jo2OnVqEd/cSAotNzNF9dtJDEc1/sS6
         Jetqgn4E3fNBpOnJ92iq5EMy1TG1wCKeUVkGhCWTTnPyz1Nirk7l0NXB7zHTzY3ebm3C
         4n1w==
X-Forwarded-Encrypted: i=1; AJvYcCWmmlQP3JggmeKbK4+K4Vfbe2szlkBr6eISKUoGHIzGezKII9rAQ3ZlGbBL5b+aY86Lmf9zBNbTWbsFsmp1XdTF@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqr+kNexcLuYKHlNNpIHBREOjtG6xUobUCe35w6i7H8AFE97ny
	6QnxYzqfd0PeJKpO0VLBR7qPKvty3q9ydMlfmJgTK2aYGFjZucuypQN7hLo0tpL47fJ0OpgJNRr
	AOFcs2pgf5leuUs+gkxR7+dCI1Ix6KOx90YETRWKpsoh8pZjro5Q/rf/R7/mMz7Pc7pVAyCJADN
	KuEA==
X-Gm-Gg: AZuq6aLoywHn+5I++ZaCofCMlVMz+jrBrAH1rLfq5R3mkwYtgAXf/I381U8KslHY9cR
	z8tDTt0uua4HjaGSj0jaxts7yIMnOq7QWQfW6VlKOrku+JIhd+/b5c2nIm7MtjPU9CwdRcOPe5v
	NH4xyn6NzIt8qOwAA1WMqJJBBMIbHU+r/hGU5ZbdJTyUL3n4OQ5J93VCjxp8efDe1fdVs3xgclk
	3h6tknQ9A+RiyQo9sZn2k4A5L1QfJSmgo34VqJiiDj3hJo+sIIsZZC3rbvsXAsbQChC39pL6H+6
	sTcgUNhiVGwCJnniShE+A1wn2PtBm8miGtaiJJjWXihi6CBZttpFAbvq7F3XOBs5l6Soh9rPjRj
	6NNvnQzKKlgELI7pBjgYFUW8qFbClHRUoZUk=
X-Received: by 2002:a05:6a00:600a:b0:824:a0b5:730 with SMTP id d2e1a72fcca58-824c94ed641mr13781189b3a.13.1771353561875;
        Tue, 17 Feb 2026 10:39:21 -0800 (PST)
X-Received: by 2002:a05:6a00:600a:b0:824:a0b5:730 with SMTP id d2e1a72fcca58-824c94ed641mr13781157b3a.13.1771353561363;
        Tue, 17 Feb 2026 10:39:21 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6bba008sm13377726b3a.64.2026.02.17.10.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:39:21 -0800 (PST)
Date: Wed, 18 Feb 2026 00:09:14 +0530
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
Subject: Re: [PATCH RFC net-next 7/9] net: stmmac: qcom-ethqos: pass phy
 interface mode to configs
Message-ID: <aZS10liDHG0r6UJt@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPQ-000000093ml-3FLd@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKPQ-000000093ml-3FLd@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfX9vClj9p3m/Uz
 9F2tYWjW1jc71wi31/dBSU006aIpdUuTiUb9IQ18FV9gQ0iSpDUFlGncS7G4um/cQpTr6SldB+d
 b5zOWiwNoDX1WerB4VKUy0h+JI80WJ8SMhFAMxov21+DJCeYjvfy7Nf7I5dluqS1oO/TzmP927A
 PA16PI1Kv3R3ktI1wVvioG+z0kIN2lPyQ4bDr6UlxF3RmEAFYAD8MNes4mU/k69gnYIavtA9rx/
 QuWbjYK2MNCm5/puBJqNTgjGMfmRbYicHqZPicZrJQO9TvHYEeDqFRg9boeM6gBILhOYR49xu8S
 fs+iUrSnseBOKW9YIdSGNNAnqZucvq04TWjXIau64tAu9hdMtRDX0HzOYOo9dC9r06uYRWQdEih
 bimjIhWy/4DLm0bGrOzy7y03jdUvV1BRiROpYsMrthCfLmI5L/r1t3myZ17GPcDpLi/sI+FbBqt
 JxCZUJ9rRC9rUAXdBUA==
X-Proofpoint-ORIG-GUID: 5DzTAyNIW73QBd6XU_AhQKUjUeWqkUqR
X-Authority-Analysis: v=2.4 cv=BryQAIX5 c=1 sm=1 tr=0 ts=6994b5da cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=VKYGXzwvPY_sFHXjFqMA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: 5DzTAyNIW73QBd6XU_AhQKUjUeWqkUqR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_103923_173986_FEB9E9CA 
X-CRM114-Status: GOOD (  10.91  )
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

On Thu, Feb 12, 2026 at 12:18:16AM +0000, Russell King (Oracle) wrote:
> Pass the current phylink phy interface mode to the RGMII and "SGMII"
> configuration functions.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

