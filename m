Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AA1EFCD9A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 11:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vcqntBHnJ9jNcmMCrhjcICJWTC4/uHfcjNc+otCaEk=; b=lED2WLuBiBHYhAB4/yHhbcuwJv
	mOldGQnjJ2C5DWM5p4qUEzhoP9eoWaGEEBDFWQ9lgDa/ENfoZ2a+bUjsDuIVCReiB+Zo0leCl5cHe
	4dAuwzdax2pi92gL2fIap9xBHBrkzdV4I7KD8gjlZBseMlZX2IkxqLVhMfA/G7IXqcCUeFB5DGS2T
	1O3WbxFjeVbGUJBl6tCUzGXqsq+eGDSucm7/12UnvsyWo0di8yQW4klBG9ULZfRsyR7fLynldt5p3
	ZDBflIJzwI8UfXiUI87/+4kECaux+V1nE8gYXPtZ8i3zlZksE6kKQldmwKwDriKEyPjqDFzcGBUUD
	ts4VW+1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYVu-000000079bo-3Sar;
	Mon, 09 Mar 2026 11:11:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYVs-000000079aJ-1mYc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 11:11:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298WcAa2663851
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 11:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2vcqntBHnJ9jNcmMCrhjcICJ
	WTC4/uHfcjNc+otCaEk=; b=JeyvWL9CvFdqMvYH4Uwf5YXE6DfuYFJRKgNHwPFY
	j4P2q15t+EjR4zrgqEgCtY6mhfSEZVxpWD8Ja4EEbbJDJoOAyAd77b3YHrktAGR8
	sNrWbQJZhKLG1cyMMGplh0w41UKXhpoPf2MeJiOuhVMxrIJl8FxS0tnYn5yh/K3i
	tdp2qiAEg51gDf7PkG3fG37g1BIo+w6nyF3PQFjASzyrU9UmTqeePxxdNJ8YcKQo
	GTlIlhBM6cKjrIZ9Et6Uc7EyRo5Ofl5HTG3DK13vijuu2TQ48ylv3nf2LEd7a8DA
	ca2Whh2J67xeuowrAUHuoD5nRjBWvj1EenFqV0oJlTNgbg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpndqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 11:11:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8299499d582so10366861b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 04:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054662; x=1773659462; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2vcqntBHnJ9jNcmMCrhjcICJWTC4/uHfcjNc+otCaEk=;
        b=LzxhZc0t2ZIdM9BqnoswHC1DufTvsz5Qmeed0wocDBXAbFNONYJnc7r3qEpIH4n5Gz
         3e0KMtRiTNLMeB5vvz0hwUdUh6ntvXDlYw7ALUU9p8r4+/Db4ZMxCvZDDwkthtB4ktZO
         25LpG2DoNS1phmaNEN1Casprbd9WgrsrHrqGT9HHL8/zUBoTSuvBSSXQ4OQw4GSvdJHj
         ReBD9y0d3ngodICyzCjRqvYz+Lx7FMjgI0KJphYJu9WzrW6J8QxbOYECSvfS1ENvMzUY
         tivU5KHHWDhHV4PTuwKgRMTG4ubZZ8cKZU6xvpcR6/mrQ172tWS/bl0M4QUrahDx2ju5
         vyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054662; x=1773659462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vcqntBHnJ9jNcmMCrhjcICJWTC4/uHfcjNc+otCaEk=;
        b=lZXjjK333FLF7QeroWGpbiB7PMquGChgaqUZykIyVjoc6vakURvevDLsGhfHFPqWs5
         oD9BKyb9Z8Dlb+u+6SccsklZ6W2DsdR7tThZYtYSoolP67dFEYVpvebVpan1QbfSji0e
         3PoADUlz3dM+1cHhoXTdBKQQM/SnNClPasJ+5xVpQCefTcc58qvAtKb7XPCneCTfchfn
         Qk6zU3gr9qHCqxEmoXwJeje1AnQqDoSWoLPlngLm7U2YL3us1auTILvRDKExUVUHH9sv
         UaTn4wxzLyNKGE4T+2iw3VH7N+ndlwb0VimNM5lPtOhg8zDlNAGawahgFAnA8pDfmJs7
         H5lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVwGu6U6nA7wnhWapGjNp7zEdyMlqCGrYKnoaNlkjiVJqKxE8w4BpOjZ5IUKs+qPEhjz0e2caV0QrMunfbtVFu@lists.infradead.org
X-Gm-Message-State: AOJu0YzThkHbI2eYYDydy7BZjiMIpesnWBKWh1T9VwdFvDZ6Dt3kM2K0
	2EsvZDH6JkhlTt+9idpptshiBtK9+Po9TYn2w+abwJWi+kcMSW2oqCEhw+7AHTNuSwLvnX1mxk6
	mqwFtQG8lI6o6t7zKZLldhUQUG7F1qup/WuBANO4NDlR4VBlHWatKLNNS/jowTeNHMcODu+6Rdf
	kPow==
X-Gm-Gg: ATEYQzx5m01s/VOBCYOoJHK4YFJClxdhaqoDs3VO748hy+1R+7g8nwuKRBnTQyPz4ch
	iniuqtIfmnT6/ipGSJgVZQ8MNlM620Kf0FNGQTulECSq4oICvQPwY/akPTUdJEET1CyBP3fGduo
	/wQoHIsTQ8BnfVbyVXRlJR6gt785qxd/ap8RK/W4hcmdv+2RdGrj0LavKag9RmJFlpNvujmt7OE
	9foAkHn8p33yO2/Tc9AII9HV7W/zBBY/Dd0SVlWIs+I6TSVH0OEOdVgtDJ9xLEWPX30P7zN2I59
	p3o4qqy6eP3/m9i5CY2KGlhm+UQKyQBtKMCA+RdII95zg0N2z6OkxeLxjeTg5JJfMp4sJHPu+2b
	LaWqSR0IBw7dUTHtyuhDj0g7LtwHIk3tcWW0=
X-Received: by 2002:a05:6a00:2309:b0:828:f1d9:22cc with SMTP id d2e1a72fcca58-829a2d85103mr8988618b3a.20.1773054662334;
        Mon, 09 Mar 2026 04:11:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:2309:b0:828:f1d9:22cc with SMTP id d2e1a72fcca58-829a2d85103mr8988581b3a.20.1773054661861;
        Mon, 09 Mar 2026 04:11:01 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48676besm9478833b3a.40.2026.03.09.04.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:11:01 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:40:51 +0530
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
Subject: Re: [PATCH net-next v2 5/7] net: stmmac: use u8 for host_dma_width
 and similar struct members
Message-ID: <aa6qu7oWLeB0Dpeu@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX5P-0000000CVsK-0iwX@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX5P-0000000CVsK-0iwX@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX9ItVhKM+9Ka4
 vuFw2BsdwuFZGtHflCZ4CkXlOjfpI60FnTi/rhoQnjyNMd8hT5buAej+alZc0GMwrpMbqJ71v1o
 Rd85N7WThK0NMYVSrGyeSs/ts3+QUOZqz1/hfa0zZ+Zcel/IlrOyGJqqwwuRjx25+K3XYbGSWH6
 5HRvlsxt/I7hXDbo09bxZBA4gOvZbmIRQ3D5S6j0OOzFLtX9J0wXClz9RIQYGqsV34c1gv5ZYXn
 PRhFKPNXLgzT6WeEVO3TvpibP3BP3BRiLfcEt05qo31+6xYcbI27UXJUEPYU+h42/B56bFb4PY8
 9xCwnU7QXZijTgpx3WywpHkgB5IGlT37UwWfR4j3zH78ubnBKqfsvq+DfOwV9jSwhRu4u5rAZhF
 SlvJtVBdeK/EkwddY8GY4R2mZUdGdGniXvXVgOc34vBbtNvwwkg6DVac76xWXFCQ/TToZusvWk5
 TInDZ3F6yHy+vw597zQ==
X-Proofpoint-ORIG-GUID: 7S7eAO4pufc6-YEL5PnS2Hz2I-yUPamI
X-Proofpoint-GUID: 7S7eAO4pufc6-YEL5PnS2Hz2I-yUPamI
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69aeaac7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=nXI6kmJP-DpmoF2jiF4A:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_041104_576493_7F01D6D4 
X-CRM114-Status: GOOD (  14.64  )
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

On Mon, Mar 09, 2026 at 09:39:39AM +0000, Russell King (Oracle) wrote:
> We aren't going to see >= 256-bit address busses soon, so reduce
> host_dma_width and associated other struct members that initialise
> this from u32 to u8.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c         | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c    | 6 +++---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
>  include/linux/stmmac.h                                  | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 

Acked-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com> # qcom-ethqos

