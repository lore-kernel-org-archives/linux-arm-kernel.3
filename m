Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B83CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 16:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8Exf5uWUb9cZkvT1EFUDPQ1TTQV69aXO+M/fGf49Pw=; b=AYrAo9TJ5oZdAa4Q3yYjyt9kmj
	6MCH2HxeweP6R9Ugo4H/kmb+pjPnrFWQrRgqWwBGfjWevGMGNX0DFkfYonfmJ3UnvF6i/7yFBojh8
	pCUNUQrkgV8x/7ZuI1C2pPpIYfYgeS6gNIfN+SMTRxg0dDuWuc619L8ldj/sRytcnblFta/02HVLl
	qGAii3OMDR3oW9Djyjngytt3FMGEVVfRA0t1BPOPnyDkkLIWcsBP4TXXPyPBvE+xLhUWIVzxbCE6b
	j0Zqr6kNPD3P0Wii7BwJcec9WBtW7kVqwD4o5xi+Dg0f/XwL3RMud719q4cO+j1XHXaCJAhWQKxP2
	jEXrEdDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7NB-00000004vpD-1u0J;
	Sat, 17 Oct 2026 16:35:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7N7-00000004vnn-236d
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 16:35:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGA8ci2534316
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 16:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M8Exf5uWUb9cZkvT1EFUDPQ1
	TTQV69aXO+M/fGf49Pw=; b=SvbhEerpHza+8SdmQLIHmI2tzCGBloUXBXclwzhH
	3zvmJVOB8xwyS3hhxJYTNNiBUKV0XY8PSqCFVNpgzc6CSSWCLvfPtkFeAkh9XIK1
	xP0T0+G1nwM3GWS7HSfRWAo/8PcMnsmd7shqnuEJ3rpDIoglzHyWZguFMOBASYUQ
	xSZvhnsNiP058el1npRPaibWiTLs12fbApd83r4HIqKT8fCMA72QZOq1uwE3l8N7
	UFCDy0DUt44epTi+3yVj932X9a0ROrwhjoNKlti0uhJoGJp9p+GEAT/QwlAJKX30
	ztQqKDxqmquratQ7dPnl35V6MTTEyo6UTZRB8hrvMHd/Fg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys1fux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 16:35:00 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so3798091c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792254900; x=1792859700; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M8Exf5uWUb9cZkvT1EFUDPQ1TTQV69aXO+M/fGf49Pw=;
        b=joxoQ+w115Ag++LsrGnwW9GgIp7ViMgAFIfQISUIslGla1nScZUjZe3i5eBw19DzKc
         lo30PapsGh++LhMhd27bSKIqFEkX53paxKTiczCYikfDr6BDPLQgFWhTHBuvKwA9xknk
         seEm7rLV+zbP8JnPwK7mMUCLchaI5sNVNqinJFVwJbaw7aLfRUC7S3UiJFaEB4b3a8Tw
         LZo8oDwxj83F+tmtEsuH0rS4ITUcarRyyhi6Wk4d53JTORduj0LrsNB3HreprsYQo3IB
         42Dz/OKlio1ATKrejxF9A5ef5PKJGazKHD5wIlgtKDmO0Hzk60xe7zSsF3n7GPVd5liL
         Jc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792254900; x=1792859700;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8Exf5uWUb9cZkvT1EFUDPQ1TTQV69aXO+M/fGf49Pw=;
        b=mic5jOfcFnF2hsvFneS2E1/YWV6hEgx3rf8a5hgtE9KEbMnTMdYAKuKxOJoqCKGqW/
         fBY+DaZrHrODxVJP0Z8D/DladXkd/g62n9UuMO9CpTI9hQhqqmAi0AMiCI1At7soLNmf
         3z4h83ajyvHB0kJncZSx44Uwd6txnLfky9sIxbPeZJOrdgQpeOij3lV5oBND+CjCCdPU
         fIlAv/x3jbNId63un3AzKtIMmjF78Cr/tqamT3RAZ6iDTzKRbMyvrN9hsb2rMvyulHzK
         FwGPfrX7BbYkXNlDk1rhutt0zIj3d7USd67Wnqvx/HK0DL7zcgO972GNKsuJpcmwDF1S
         ZeWA==
X-Forwarded-Encrypted: i=1; AKwUvBzqjtc7wCrCwyqWqbU2bnRiWC8gz8QepXI0gA3FouKr9Pf1wnc06XOwP6Ki/XDikxcDdXaY/1lQrEpHI98l21ry@lists.infradead.org
X-Gm-Message-State: AFq9FYJj9ousTKWkToea+V4JVt3mfeNCh3fTQUwWxZuCEnnb8qoTNhIo
	l1bQuEino06aKbwcVuKt+7qacYyWzikcpjjenOhm5l4ClDVjS6yKKVyQBs1L1COhMzxC+4N6fTM
	0j8oROVCEG/YcdWmEkUTJlFc+hsnKFoHJGSQfs8sygR52jFeSRMkMPfp6Y4HP7GEzQgXN6nvIz0
	sTIQ==
X-Gm-Gg: AYBFou2yh3vMW4G3BRaI4fHU2pLtq7nww6sexN/ckkSxPghtp1VVrN7NYQKqp5Yhe/y
	fkMG+YgeUlGPi3AHKhidor9rhYkT+kGfD6nOpTn+XBr4JEJ0juNC5hCG2eID2sU/dGDd94rCwQU
	OLi09oWzh3jTybTGvofUE8BN7rkeseR27CHMFjF7F1V/eXHS6LtTFdSrOLxWRkjW0V5u/AZs4H1
	VW7E5sg2hjKmzVBK1G9RQ18uvJndmNy0sEBFHVVOR5zbxECBunkkPnA2Z8O8wzEXdLMXdZrynzK
	0PasZLxLRoObXC9+iSNDM9Seod6V+RFCYy1gdNuVGj4BrXDmMB4wrWYWOsGou4326jezOT+TaFd
	r8yYtw/kH1Osv
X-Received: by 2002:a05:701b:205b:10b0:184:d593:2897 with SMTP id a92af1059eb24-185138b5855mr4814787c88.29.1792254899695;
        Sat, 17 Oct 2026 09:34:59 -0700 (PDT)
X-Received: by 2002:a05:701b:205b:10b0:184:d593:2897 with SMTP id a92af1059eb24-185138b5855mr4814714c88.29.1792254898926;
        Sat, 17 Oct 2026 09:34:58 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm21415852eec.20.2026.10.17.09.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:34:58 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:04:43 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v16 3/7] net: stmmac: qcom-ethqos: set serdes
 mode before powerup
Message-ID: <atOjo+X7y3WniiT3@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-3-0266c2ead980@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-3-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfXwPCtFWr9YfDF
 uRx4rTkMxL0FT4Efy16X91dLU7M17SDlDlOUJJtjoEG3OvRau8hZ+gEC7aj0WxCl+zr9dK38/Az
 8IzWPY6WxCNk5e9N6b1LT7R4Kro1Nsg3EZW/SSSHGK2jNk4CtXUXlFdX2Kfhfs4eh+y5YgrxjT7
 CtpsN1L2rnhCU1k7CQoUsNiL16JlE7oGVS1uXXF2YISdzs7+wf3EIeRm6lYk/ECrrubgFWfOfLb
 /ofqbYFdr1Et9KchFjBkEOoFez4HcomPu50+Mm7I47l4CI6WCpj2Xr1D2tGeX9SXwobNYjaBcGX
 8ClkZSt2tjXF8GTFUsjQab1dmxvkVKNuNWF5aqv11qeqB4rb0jDerydCQZxC9Epu3J4uSHxR1UJ
 E2X6n101x9NndeNFPsbeshfW75NQnyvxMtOLko0E57c3VOnBc0rXlqMJkcVLNs2J1ya3y1RlU5U
 Rck+/FehYv/jpVDPqZw==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad3a3b4 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6xCJM4BY7YgkIKmfACwA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: -qPzADypYAX3iDCz3zjXPT9YCnIeAy1P
X-Proofpoint-GUID: -qPzADypYAX3iDCz3zjXPT9YCnIeAy1P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfXxszQfrhoW6Vf
 hWusZK4FudDfpu1bdmjZ62d8qrN4TwYPGZPe6Y9j4Ka+I3pC3kEwJMFX1/5JuTWSF/rBaiB9xbc
 VCqNbWJhnaVDekslpiIAg48/u7+l1R4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_093501_539310_84A6CE51 
X-CRM114-Status: GOOD (  14.81  )
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

On Wed, Oct 14, 2026 at 02:36:42PM +0200, Bartosz Golaszewski wrote:
> Call phy_set_mode_ext() before phy_power_on() in
> qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
> SCMI systems this is required for the PHY driver to select the right
> performance level - which translates to the link speed. This is done
> ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

As mentioned in the commit message, this should be harmless for existing
non-SCMI systems and I did not see any issues while testing this series on
IQ 9075 EVK, so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan


