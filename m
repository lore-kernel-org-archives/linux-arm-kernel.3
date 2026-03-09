Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A963CEFCD99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 11:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBuXrT3z0syHkRjP3iylAVgo7EGbnv7gdiOgzGuaCiU=; b=OXdSk+QPCELP51UusojuUtb7Nr
	TeDJ+2Tt6i4cwCpLW9k4lFF+DwIs6ifbZHTjsKYhe+nLvDu1gyRJUu5ccD9PoYlUJW7ofmTt0qc20
	U1JD12P8xWVI2Kch6CRZs/aa/VSm8XIYpSWUqWwwaHuIQNB9NShsKRK9reXDdmBhoXXurdxp+IW/H
	wosKhui7/FN0SqF0Tw+D0vObCuv+s4yR83iTNKebW7HXziP0pOQgYZVO3SnzAL/qrx1o7h+YTtopv
	KBUSS5ufLc/n/D9PkZ6McsZeauUqTO4QSTukxcSuGzz26yRSTAQJH4cKQT/g4lGDnlO4bQbJ2KaTO
	1PYDllMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYeA-00000007Abg-2J3G;
	Mon, 09 Mar 2026 11:19:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYe7-00000007AaB-1qDh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 11:19:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62986OfO3686497
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 11:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aBuXrT3z0syHkRjP3iylAVgo
	7EGbnv7gdiOgzGuaCiU=; b=IpI6JDD0HWnBmmlj0OFHN8/gFzwsaR6GGIPaSRWZ
	iFf/DH7u4vd7h1Ql6MNsSNVW9oPR5VFW70oJAOTynQa/kotTy97vXA0zLfU6dzvA
	uNntI343AApVrwilF4Ccnldt+LK7L50ujgLUmwLSHh8Zw6kc69JCAMGvA05QoRPE
	9O4dpQc5tRl5IG1keLHk0u4cwJIhRoOu4w361lkUDa5Q2QOyO9hNNQvNH43cn8he
	7kk5Yw7SulMX0XAPaDCMv1J1DuARQsDGemPZ4pfuNOCdlEnEvGJDhSE+ExzyMWep
	mCjRxW8ZWiSYWgw7VY+HBiZ9DBPabub841Zlzj4UETzIkA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrn9kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 11:19:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae66ee7354so58745475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 04:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773055174; x=1773659974; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aBuXrT3z0syHkRjP3iylAVgo7EGbnv7gdiOgzGuaCiU=;
        b=hnt0Dxnt6G65uOAHn4OjZCrUDT4uY8N6aFWyXkVHoBYTvvQAsrqibYFS8U1ab0UPqC
         xAU7MrQxCCSFoB/vOcIOqRMddUJR0bKJVxYMQuHkxGhmPUeZn03k1wXl1qJciwwAWIs6
         tQzlZUyoUG1bARG8vzhXKuKtnBKHJe2JpYu2j0FpMFmsCLJiFt+e1SFJ/ndvz0jZ2IAj
         ds4nMUIlYv1QTDqvKvoZ7xwRVsoQvEg7C77FnXYjX7Pw8DebNt3BXPwk+3UFLAH9fgbz
         KDlz39uBVa07+dpALhHgaaoq6uJ9DHfEQUeJzCYShSR3dzKKuwLkc4m/r6v4+7h1juws
         utRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773055174; x=1773659974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBuXrT3z0syHkRjP3iylAVgo7EGbnv7gdiOgzGuaCiU=;
        b=kT1wKCT8P6kY8Z5mSvXpJRxeyq/H9uE91Uoy6X/WJUc3aoiXUVTb1SRlJrpecYY3PX
         7kbT8RDuIaAC+EUEwCSpjJDhRzeFusaJmOvXqCwWnC1Zisi/TPVJhhwrL61Vujh17iWu
         kyoluioJIcj42XobJXqIIevIntWH9QGv2rrYVsHsu2/LC0ZFfteJ/tgLYchAWw5tOEe+
         Kq7YgjSpF0/PzHofJ0IZekEfYuCVFhexXKf8DFit+hQAaCQ1jCBlXkGOpKEiyib9L9Nq
         vBDi14Ku1oPTQWSpiPzUmMvUD5T2GFURXP/MyoWuQGqZ1ldM0DhRFiYwnm7vB+Y7A1bl
         9+bw==
X-Forwarded-Encrypted: i=1; AJvYcCWfDkErW54ncmutmRo/YoT9j4K1o5twr68eFelA3ipovMtPBJkTKqwpv/yR7dGgY/FK0fQIOraloxNPIiTPX/b+@lists.infradead.org
X-Gm-Message-State: AOJu0YwGHHxoqrqDuSNLJzj1OL9cM+2FIFOnULWgiM94/nyAGl+QVehd
	VmRW0A/hB1jmtBzK4Fs8HrIbf3ATxkx/4WDRkY9nKZMkpwJCttBR5KlkrMEHhvvI+Nfx+2voo4f
	7Les/2KXdznwPO4jEXBLK7ID5+SuPj7B2pMCiAoMPwALD85ozEhhR+5DifYDj6lN1uWpS3vo82y
	ccuA==
X-Gm-Gg: ATEYQzzr4KKyTMRZILteDKIwb/aTfCATbiLRWrWGm4fjadEbGjjJY5h1y7VowWZIu44
	pg9ft5Jqdyjo0NzD8mn0ZHQq7U1zAt5eQV3eTtTYbG6WusEWNpN1mASqKSIEucDno8mKsDs2baG
	3n0uImDGdfUXTnqauQPxOpw63ygtO82iVj3AjimiNUolS2mg6MV7PuuYSeiH4k9APqP1nxEaqa/
	WwXsThbYkiXcyp1oL9zMJIBT7ngzbmzdt66lw8RBjGCo/x8HysZmbzCTtG0Ftt2AgvptE75EWo/
	DYbjwwN0f1Id0FgdSJdko8M25awnD9zwmRKkIHtHLaeRoZshBGFnfgJK8Y8a6ijAA5WTw7lDl+c
	OGxDHpMkBSsDMQmdA6e6OPt5uSHGwLWJq/F4=
X-Received: by 2002:a17:902:f64e:b0:2ae:5fc0:308f with SMTP id d9443c01a7336-2ae825056cemr110474315ad.41.1773055174150;
        Mon, 09 Mar 2026 04:19:34 -0700 (PDT)
X-Received: by 2002:a17:902:f64e:b0:2ae:5fc0:308f with SMTP id d9443c01a7336-2ae825056cemr110474115ad.41.1773055173696;
        Mon, 09 Mar 2026 04:19:33 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm150127135ad.85.2026.03.09.04.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:19:33 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:49:23 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        Jan Petrous <jan.petrous@oss.nxp.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
        Samuel Holland <samuel@sholland.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH net-next v2 4/7] net: stmmac: use u8 for ?x_queues_to_use
 and number_?x_queues
Message-ID: <aa6su45ASA4jR2VJ@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX5K-0000000CVsE-0J0Y@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX5K-0000000CVsE-0J0Y@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69aeacc6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=2l7Dc_Zt4Q8SQ2GGjncA:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: NeIb8wnPXgDQDbvc12GnfTTQR5ujzFgO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwNCBTYWx0ZWRfX0PdI1vpYwQaH
 xBOimB1WbpoQClbJBRU47Av3sfZ574NENTWxYVjPTsNE536Hqpiv6txMUUJ7e27/At0ShiujpXo
 0sWycqIVbFtnmMazKMugjdieuGa4lgEx/3eA9itZu7eIvZinCz6De4/ThT1V7zz3IwsIz+lbHrT
 ir5q5t+2p99YgwIdsDjAHjtMDTh5DMi42yGaBBhBdPA5o4uJ13BXLwMz2CxkQIrD0JEXvX2bQXS
 3tVaXbryYNPDixT+pNfuW4D/IIb+Zv1l1A920WYiHasWVRJkC06on2jgQLcHag+1O4DZZailkXg
 0Twmq480fFOxT4Jx9jLZ1N3CGEnK2+1YwU+ntKwD5tIJo0Is1cdTjKeTTEaf/EkLAg4MmnEDMCh
 R7p4AbdZkZmwg+qPl9Mhi5/YH97Sv6EVXLbfJmEzV18oYkQRmrpqFZSWUnUnU6Fj0BeExGVhIoD
 WAL+DJrcY333ikgTDMA==
X-Proofpoint-GUID: NeIb8wnPXgDQDbvc12GnfTTQR5ujzFgO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_041935_478622_DD8610B5 
X-CRM114-Status: GOOD (  12.46  )
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

On Mon, Mar 09, 2026 at 09:39:34AM +0000, Russell King (Oracle) wrote:
> The maximum number of queues is a compile time constant of only eight.
> This makes using a 32-bit quantity wastefulf. Instead, use u8 for
> these and their associated variables.
> 
> When reading the DT properties, saturdate at U8_MAX. Provided the core
Nit: saturate?

	Ayaan

