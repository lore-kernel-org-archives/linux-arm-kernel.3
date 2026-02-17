Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54905E9A037
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpHs+q5sc2ESyRXoe6yeXOmMBULgitSi7HAS3517law=; b=dwl19ElDG7ntYRYnraUVtlmHnD
	GOQiVY+x/JGROdVIoljl9fUEpNdWTrlyCyLx4Q0F/nlCKXpEYNV45G9ApyBKt7EyCT3d9hk8TgtjD
	V9O0xipeXIpa9xK5L0cKtLCOzeXMEOhL0kAnsKKNorSfvy17nh3hSh06PBklnGY01LjU1MG55AOGH
	TEH9ZcFNwoc3Rp72bfootMEHzymMPdC4YRymNYTShLSxOcR6ME1uDBBaHKBVhKAvuSCimAN2VehkH
	wT/nxRDlqBFJnmVrnrXrgGOkbk5zFCdym7iuxF5we2iczIdU0JkSAezQZHGkm1yU2X5FceXTb0U1M
	Z7kiUAjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQAo-00000008lcp-4C8i;
	Tue, 17 Feb 2026 18:51:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQAk-00000008lc2-0mXf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:51:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HFZa8S982132
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gpHs+q5sc2ESyRXoe6yeXOmM
	BULgitSi7HAS3517law=; b=IpcZoKPlwXP+qSoGmhgA7aZ52B1WDxH60u2yqNm+
	a5XxCGsJPgPhfqBPTXWf7qOlgQuVwrPxC4KfNYzmebtTVsM0jTq0mvnvTl3y/f/l
	6v2h3wLnFDfuhLBvv9e9l1v5GYpyBLRSussMg7oMIV6Du0nO1tQ472vJygiK67R5
	P0kLbqvSLaQcGAaOkSexpBhyRexouLT8bBsqxmA+q/aCA30GQZ+4pBiBIuTqjQk1
	EznJTER67p2oqpav6zrzwHrh3M0d0iT78Ytmoy/JhqgeRF3QtswLNt1i4k63rG2N
	Lhi3X6WzeE+BEFGXcEhHliUAmSdscI4qSswmFpqCrBBvlQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662umfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:51:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3545dbb7ee6so3481582a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771354304; x=1771959104; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gpHs+q5sc2ESyRXoe6yeXOmMBULgitSi7HAS3517law=;
        b=Pfz+wABKO8Rhy6EjU15lzx5zQUPXWFjIhh+JEfyF3dQ09IQc+yFetlpr6oVjtmeNip
         mu+qm8zvLVZ3WGtVyxALHhQ3mxkSDmY5TWeccnp342OEpP2El734cv1NKhvq8HGMlpgo
         nwwoHnOIvJAptMcoTBwokjFclFn2hylWp1IcoMZsx7X7eej5xcrVwnL2xgZtlXExcbhN
         CDl8SzK/k4/td2TpjtnD63E6EMu6AR1h37kHw2zHTZ1UksoZogpVghe63AKHulOwfXez
         Zfn8N041pobwt/L6uL0A03saTcDrDHGSveDGkz2sNl6+/TrBScZOaq2j3I/TstTeNEsD
         z87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771354304; x=1771959104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpHs+q5sc2ESyRXoe6yeXOmMBULgitSi7HAS3517law=;
        b=ZlW1v80A/M86UMV81b5lKE3QEHKrL5dc8QPSUzO6Sj1b6wJlOahm9B5NJvnogePALX
         OEWV9WokTQQtqldVumGMOxgOsUKDa0y4jm9cUzhHQQew16Kd1vG2yvGDEX5uXFRtiA9N
         hbcu1UiIO2hu3OngNzBrGMwhJLDNmSePCnewHVpYAC2Cnms+0sh93VAqkMO8bUd0YlaL
         p3PVBsoSC4AymebgnSVi9XVlV0cnGSKWaXvC0s7Tr62Ovra+bdonpouktNrkpUBvUoZy
         Pc5msrIDuXiRX7tkhRZMWs/ftvOcV64BA8ryhYviWhR7wNiprqtPic/qK+rnHeEEL348
         uINg==
X-Forwarded-Encrypted: i=1; AJvYcCVnRouKw9riT8J83DDwEIAPjqbp9i0BBfBc5UVpLVhS+bmepq8m6JJsl6cAGy0WbATEpz1oVtFxuekG/HZ7BG5P@lists.infradead.org
X-Gm-Message-State: AOJu0Yys8/P6mdtuNoBsMx1mUJGdM05zCBrFjbIx4j6fXlFyRtF99jc5
	4kSKxR/2KMiAWS9X98MAu7bKCKgVMd3rGJsKYVhw9TzTbJth0FGejGBz4zvKoSfQtKJb3ZFkmZ0
	FhFYDycv6Bo6qgk/tNvR8C9AwgaArH152vK7YXBhKhftXNin8mbz5cv8Fw1dNxMnxXpRBwMoIdZ
	gVhladsIWA3Q==
X-Gm-Gg: AZuq6aJpdm5cjPmG727pYbb+lf1Ay4J16fw3iUOzFr+iu8eKriyJRlHmhc/u+PhYHE3
	8PZed34DQ04w0s88oYGV0Ai6Zy7D8i4apEFXphI4N7YfWZxLJS4+ZJH45BdKTGM93VmcyXoUcIl
	8cvURTXCYJiyOAw2UCEl5Nk6kQvHBTB+CVyeZ4LGurAyHcsCPYQuz3Ku/7uXRGPWzvWpR0XtROl
	p+ia5Pt+x8f1fVm3hJKmLdLFEFH3TxaNy21fRtvdErAbeLjE7m6iJtPG7LfyV/lK0Kzwq/4gAIu
	N9SzTVCO4Ol1PytrD3NbOsi7G+lagjXSiFh4w6fejG9STkTmZxeaJgwHE6ND5zDdXEiWLXacdbx
	O5QysNb0D1XQd2hYO+nKpsDprhy7wiV7tyQs=
X-Received: by 2002:a17:90a:e70d:b0:330:7ff5:2c58 with SMTP id 98e67ed59e1d1-356aaa98b25mr12221096a91.7.1771354303840;
        Tue, 17 Feb 2026 10:51:43 -0800 (PST)
X-Received: by 2002:a17:90a:e70d:b0:330:7ff5:2c58 with SMTP id 98e67ed59e1d1-356aaa98b25mr12221081a91.7.1771354303326;
        Tue, 17 Feb 2026 10:51:43 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567ebc4331sm19801025a91.16.2026.02.17.10.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:51:42 -0800 (PST)
Date: Wed, 18 Feb 2026 00:21:35 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 02/14] net: stmmac: qcom-ethqos: convert to
 set_clk_tx_rate() method
Message-ID: <aZS4t5Uf21PTOQA7@oss.qualcomm.com>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <E1vjDr6-00000005fQ9-3RUD@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vjDr6-00000005fQ9-3RUD@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1NCBTYWx0ZWRfX7B76Hmk5qcA6
 qeTbGlwm3I5XsQelyD/F6/la8SW2FB3XBwK44g8RroIH6usIMEkD5onJFqsWxNRA9WRs/PNCW5E
 qVFR1TmD7R6dVc1C4pJ+ZsrpR1ZbGN41l6qrYrGt6a4/+Db15EsKbAJbbdo4rpQBrzIX4c3BUZc
 Gq6tU1jM48PGaUPAeE8VIv5W1Tj65qAAN+X0x0LGhNJuBk5h0bgakfTU7licYOr6exmEuTrB7ew
 IGTqqJyNC5I2V2W9ZMMm/EsNzWLI0jIKfsWwwjRnr/GoqdT2+Bg3N30GSlCfsV1/RCh9KY8YAZk
 VCITQus+bczmbdLL1QupCbQZdYPlLoHPZr74xCHLJcYYjUiEBI9GysFIDqdDpqBscwSHBviEHcW
 ig40SVfT6bwSqTxuDSspdL2SDVdFNfw1z0IsxHIvVDxjmDmSpXjMPRu+bfqoWOMN+njGPnJDP9G
 uEYqPjb7+qvkyyXjD6A==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=6994b8c1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PHq6YzTAAAAA:8 a=UutzXAvyMBxkWM3TwEQA:9
 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: zw37-pPudAtjiE-OsOv-CkHcA5zUYQ-U
X-Proofpoint-ORIG-GUID: zw37-pPudAtjiE-OsOv-CkHcA5zUYQ-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_105146_369763_D69E3DC5 
X-CRM114-Status: GOOD (  15.25  )
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

Hello Russell,

On Fri, Jan 23, 2026 at 09:53:28AM +0000, Russell King (Oracle) wrote:
> Set the RGMII link clock using the set_clk_tx_rate() method rather than
> coding it into the .fix_mac_speed() method. This simplifies ethqos's
> ethqos_fix_mac_speed().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

No issues found when I tested this patch along with "net: stmmac:
qcom-ethqos: cleanups and re-organise SerDes handling" on the QCS615
Ride board with the KSZ9031 RGMII PHY (see [0][1]).

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
---
[0] https://lore.kernel.org/netdev/20250819-qcs615_eth-v4-6-5050ed3402cb@oss.qualcomm.com/t/#ma85cac924488d580b971e6477e7df30dc7e48045
[1] Ethernet is not yet enabled for this board in the upstream kernel.
    The changes from [0] were applied locally to test this series. I am
    trying to figure out how the board deals with RGMII delays so that I
    can revive the series.


