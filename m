Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66FBEFCD9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 11:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+vqi5yNfETZAao574uaaCl9A1rW1wYUCbmkQ0a4C8Y=; b=HbolYlzK76LEYlb+/G/joBUJIu
	ptvk5jBhofeTmB48b861NZpanqNV8AfVQ1RyyiRIC+LmQu417Tvip00bprbDYvbgqHBnhOAxLXlLG
	RggzKKFCrR3coWSY4UCIcZ8Y5ZaUcWoCC4KD2cQ9jZilJA7JCNAupR04sIMSjRxiJ1GzaXc15mKNk
	HDoQDylj4rrjN6DP329ZQjVuR5TCyfNW4k5prVMJzL364sY0hDYuoumIuR4TT02DN7Dev5HL5FLxS
	f7daSkyNSN1jV5RbURS7tD0zTDwEcOrCI3FBzwBdBQd0nuqZEJTucMKm+UinUiunnaF+JCT07dFH5
	d86AvTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYTM-000000078wH-13CV;
	Mon, 09 Mar 2026 11:08:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYTJ-000000078vE-1XxD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 11:08:26 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629AI3UY672717
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 11:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A+vqi5yNfETZAao574uaaCl9
	A1rW1wYUCbmkQ0a4C8Y=; b=Ub24Gv1Jn9nX9rjaOFOGcGwcZdVmHjStc0FyiSku
	Du3qSxRdTTmlVzYgQU52dkfNzEOykV6TdXX3XU2RMK5PpxOOuVmJnJtQTSSU3aQh
	YZzE5Y5YAOPSZz7lIVDB6OrQqEoNTkG7ubqqPSc695WGs8YU5Pf2motMQ+QZiTG7
	D1KjojNEENM+PhejSi1HkESscTsw9XJIGLBnUwRAt8QC8HearsmjoHY4RF7rJFkr
	J0HybVZePW1OirXbbHCjmvNavFwA67/oKKp+MPInfHMVdnJSDAqGCBVsPFAMRvGG
	933MqxunRvncA0CWlIIQtWPjnVk1jtIPVkCIg6XS4I3Ygg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxw4ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 11:08:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c73b1376f98so4640091a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 04:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054503; x=1773659303; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A+vqi5yNfETZAao574uaaCl9A1rW1wYUCbmkQ0a4C8Y=;
        b=jXVNigRDqylKJISNdnVuS2mzxOMIq37PNgZxYdzskib80hbWbn7T7FY4DR8UvNAm1F
         IRsVX6iU9jObayGWiYwJ6VRSAx/UYrYg+7g8Py7vk0HFotyhJu4N5qWyPG/JXmx6hCAt
         c1P6aq1vRQ9MZPBqJlwhMTXH6G6nPrhVA0+pjKLO0Fv9WEitN3agLFG8mZnd2EN41vyW
         LDFqdENo1Rqj8oSel13UzsIm9Y5dxILhGq8ijqWp8oq6awh5q2VK8EfCufSmCMMnMZAp
         f1sEY3I6SN9sm779DRPYw4Pip6LPEEqECerbNgvaA+uWZzxWGnJ2c0quD/Ks8az2JUlv
         x1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054503; x=1773659303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+vqi5yNfETZAao574uaaCl9A1rW1wYUCbmkQ0a4C8Y=;
        b=LXUbN3noBpF7DsvDo3SV7VCW7iS866khGo2J28UquTy1XKnF7owK/WG6WW0wKo2cKP
         Z5OeQcr+mAwxxT+wCjcsvnzV/UaEoHjskp4+gaKmWERPnA1IS9AO0d/jVgTND7vdE8tz
         Kf3tS5RDgZEWm6yJOemaq1ge+RFo7wn6djT+gL3zSsa6mMUpkuQKiH0zKdkW/Z0/Nh5r
         14SAk19j1h0Dxgg2eg80/1uNL09oniSVzMSJk01GWfGEhdHqtjZqlWbdhm3auS8WhZoy
         5u0EX0lilGM99swSq5fhtP59XfEy3wbhik2Bg8PAUi9VOAh3WoA+F7W6k+HxAa/TwTCM
         TYBw==
X-Forwarded-Encrypted: i=1; AJvYcCV4BMp7de/fOqQpMw6OcUV/E9KPI0dGSowoRIum/zBhWGIH48YGmwTLw4jjn/C24m2LMcOJdK54Ghi6zQqeKRsf@lists.infradead.org
X-Gm-Message-State: AOJu0YwyLAqSRcLUJ8tHVykX1jsTg4fX0XDFxZo5+ICJ92VKj8Co5vuw
	twz2NW9PcjvBdwufTpUwD0gkk49q2Hvp6yRivSv6BiTVqHd3FQAGGpBSSd0XOHlfnMkjMPCKn8a
	Yim/q6v7f+f/GgUtOuIUmvhtSOmQHbHLwqLzs9lclYvJADhLs0gVkiJGetZ3JrJwjv8BTNGcB0C
	jJ4g==
X-Gm-Gg: ATEYQzxcRU6P+keH2HZI9LMh5aSD8mv9W3jyGlKjvmtCQkOA8dj4a8iw9gMpmlMH22m
	zEmyCMIJAZTKtAOcUC2nHoob8lyDO1eS07FDbez+Gjh3yCwv6PiCmBuexJoRTDNHvpJERGxBeW4
	pd/ERPeCm3SLmM8KYoReO+7rPw6u7w/3NirPP7gvXt7GOvur0Jt0k7HpRA6vwYTvjn1LcqYqSSp
	iuvxPYXfKwmAJ/KTUHeZk+0sMlC/E2i4Gnn9synXxY0hwt5PVfLBvtKjvCRAq7Gp8XCb9f9Sff5
	S+T7mKkT/epsaYRWexVrBjxyhotm8u9xSc9PLbudYXqwfPSV9XXwxfzpO8W5IKBQJ51CTYiD6Gs
	Qvjf1YfIvTSXqXXgqEB3CQjhYGPcHQPRQMyY=
X-Received: by 2002:a05:6a00:249b:b0:824:4a22:ec16 with SMTP id d2e1a72fcca58-829a2f142fbmr7232866b3a.34.1773054503044;
        Mon, 09 Mar 2026 04:08:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:249b:b0:824:4a22:ec16 with SMTP id d2e1a72fcca58-829a2f142fbmr7232839b3a.34.1773054502566;
        Mon, 09 Mar 2026 04:08:22 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48dfc17sm11868886b3a.64.2026.03.09.04.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:08:22 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:38:12 +0530
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
Subject: Re: [PATCH net-next v2 1/7] net: stmmac: provide plat_dat->dma_cfg
 in stmmac_plat_dat_alloc()
Message-ID: <aa6qHFVdQ8pvDb+d@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX54-0000000CVrw-2jfu@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX54-0000000CVrw-2jfu@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX5xXnFd+IOzaM
 WA7hJYq/E0I8i3VsZ/Wx9oeoX+ndr+LCcEAdtJrWyzm2UYdiHZpK52+MeYtuVj2BIsN1LemXx7R
 hrUNqN2edaqZ56YKrukWSFTjpeKRV78NnPbsiq+EMcVme5gg/Icw+w13QkbrflhcSgZ/XhlHrE8
 dXpqF9Q9SmQE/uyPr4p5mHtrxbZkaxB3Vr7D8PoAPiqftN31veoLDjqhEK9CP5zpgaOQj1dzmoI
 v2i4vOYpZ8jePmlMEWFCssN+FlcDelpXXyiSzQbulAh0awsbfkPxTceTce9cFOO03ytD+OvDhj7
 ew5bAhOcOinFfPAm9r9lvnZZuN203bEHSQvAMKpMdCDqjULD6W5FWl1VlM31SdMvg3t/3rj3vH5
 AfzCB1pMfz7HZ7yvR7YfhMUza1vkABziHkZIaYgyQoFGhQVLCFKuYKEAldGp1J0GGDma30bc55P
 zAjuG6QggWT+C4Di7ZQ==
X-Proofpoint-ORIG-GUID: MimoFY__ZG1lTQ9B89titsvkBUarSjTc
X-Proofpoint-GUID: MimoFY__ZG1lTQ9B89titsvkBUarSjTc
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69aeaa28 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=EL_Z8gHO3nUhwFgt7b4A:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_040825_589826_245C6894 
X-CRM114-Status: GOOD (  17.75  )
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

On Mon, Mar 09, 2026 at 09:39:18AM +0000, Russell King (Oracle) wrote:
> plat_dat->dma_cfg is unconditionally required for the operation of the
> driver, so it would make sense to allocate it along with the plat_dat.
> 
> On Arm64, sizeof(*plat_dat) has recently shrunk from 880 to 816 bytes
> and sizeof(*plat_dat->dma_cfg) has shrunk from 32 to 20 bytes.
> 
> Given that dma_cfg is required, and it is now less than a cache line,
> It doesn't make sense to allocate this separateny, so place it at the
> end of struct plat_stmmacenet_data, and set plat_dat->dma_cfg to point
> at that to avoid mass changes.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

