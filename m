Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C7FF46455
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 12:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRiiX4zWYpuwYrXgVU9TJdiqt0ihuqsNqrMiVyK6xfI=; b=g3Yq4zeXt6kaWN2WkW+nFxMa6d
	JCY/6LgJw8H8F6QUZipx/dMunsJiTzzfDInn454MdK6JUKJ3PW3b6c2nOR7I7yP3c93kwNCrJBJ5i
	tuPkw4XZq/fePl/9UXQLReo94P5Dzh5XaZB+VXPDFnbElu6+ig/DwdMWluzbyh7JdK3PKkT4CpFtG
	0CVE4dZukhyq7ghK0HesTltcFuGDa2TG6G9P53mECawkSq884Qqb9KR+ZZY0dOVnpmbTgFRt1oBML
	b6zK7KS6nASnYHaAdkLxA5e+DBGdmcQ07CkWaqAR5VWTqLLpPIW584iGHX3DJZ5o7vQWpujucp5kH
	im/PgjCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26hv-00000003t0V-0BPj;
	Mon, 16 Mar 2026 12:06:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26hj-00000003slu-2MxD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 12:05:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBftlU323708
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 12:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JRiiX4zWYpuwYrXgVU9TJdiqt0ihuqsNqrMiVyK6xfI=; b=pNpSDV9MYHjH3m3u
	W7UJ4st4HocJne8A1SEc7ryGYtLWqc2ksDPxIIL8M5//pxk215liAyLNcy6s3rUm
	WxmB+GGDGQBY0CiGaZMn2odOdtBYFlsaXMRHH1/KdTLCkBgXU+g3KEg4PlzTLwjc
	nC9Osf8wm9qC+95l7Er9+lkZmEhPJFJDevy28b/NZSRPHEUGvW5bLLeI1UmUBkp7
	FUua8LMPEdG/hIlids8UzCfJAkdURCLRvfCaOTfbNI3hVwRE9ijGhwFQ8pDoz0qR
	mEvmP7ycgXvD5srBvNdgPAgFNPytbw6wI5IyshwlY/4gBOQpNVgf/i07Q0zuReMc
	rqOVpQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qns21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 12:05:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509011403a7so250090261cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 05:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773662750; x=1774267550; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRiiX4zWYpuwYrXgVU9TJdiqt0ihuqsNqrMiVyK6xfI=;
        b=PCnR/sUVqYePFhBIAQGAP5MKEn7pZ5AaOfi0UVH39nxcsFZUnOgCZFp4ICp5jGfmt9
         Gcfr58DLS0TyDi/xL4dBP8UI3Ap2qigEt1PriBcd4dr82gzrdZdUf2RPVTAywFLaJYI+
         K1LNgsn4iO4pg6A8wJA2fn34k6hEvPDCZxVfZlHBu/557Y4mObdZopgsLaUhCk8/+6xE
         U0Uynb2/qX99a2q6reO9VsP/CqjCJYbTsdQX7McDEBPivrvSLPN7ajBoNBodd5utgfYa
         PkttigPWCwBUDr9/mVBfhWhBadST7yRC9Wl8V/qibwIl/vg9kE9ApBOBP9gqitCYao7F
         4YUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662750; x=1774267550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JRiiX4zWYpuwYrXgVU9TJdiqt0ihuqsNqrMiVyK6xfI=;
        b=DtHB6MjT5FNZFQUMa5ZyUHUDNqEp4hVNVdyJ2Q/lg5ocRIhTKgt/Vqq+bw+jDtmFTc
         /k07/5GxU2AjbaMNKqiabtIa/Kzd8FmDpZQjhSiGuQObcIVb4xrUDkh5nREb2eBkOabf
         /kxrvUyhlxkzD8fOuGce/ZfrZPP5icZUvgxMmZGO0YrzBS48JGljaKEcKNidaYqlgq4e
         6b8X6AqQpjgs2P9sWCTch4v6qbmwz3cmIzF3PYZZdoAfZxEBAOZ4MWOTYlTt03gZNulD
         UUg+Y+VoHiVmMo2THp069MMweNF27hBsF3Ax2Xx4e/en9H7oE48lod1npU+KW8VWOtl8
         O6fw==
X-Forwarded-Encrypted: i=1; AJvYcCV+2eNXSAKpjpDJW4QpAOSFGq3LzCa/yc3txHuZDsabVMfe22YsnitdrhogrUYJjxu8u9iOSbKx6rnLIURO4MIt@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc0LoBp9/E9X7+gXKR4dHzi+kk6rtoHmZuJKc/5JyxYrve/YfT
	9r7VdV3HWnhTqqrqMFiAbBrZmDxHx2CrXdX4ooDWYJRVccl/0LaQRmL9ZMFl0cSEhIgTeb+wgf6
	OUbBBxU8a8wQd6QMZvV7kRUup+WAaQUKbpoplfC+O1sVt+2wDfEHfeej2CPd9L1HPcZSvYRjwN5
	QeKQ==
X-Gm-Gg: ATEYQzynJ55HNfuKuKfrvZCpxCyX0nKKG9QhXFT5bNc0KQEpt6L3BqYfBxhrp5EF3t2
	s2YIdxfAJlPM4xW4P2Aj/byHYudqTl+D0/EJUv5iVZp7p2p08h8YZ1XyXZVhg+RIkYaYj5DEA+5
	diq0f/ko4XFSXmqzFYMoyz5rQVhZRvkm6RCXKqoMxklHi67quAAsBLjy8xbNn2qV2L+/ya8L+Gj
	CzPh+rGS6MeVHYi0fDS3TYNZIwQCUwgsneUR+9JEQ4Ucw5C4D4PCzJb5z0vYs4QJj9Ngf3D2OtU
	6un0/Zye8IledxC2PN+HaTbhSiLD8hPfU5hHsvfD0efbq4ECElAKTa+ZtZFUbUXtouVn3oZ50WV
	LFCl+KAZJWqSbzTMs9SJSnuhkMb3ksEs9c1i5UGD3/Fo2/aYh8w8=
X-Received: by 2002:ac8:7c4c:0:b0:509:3f5d:4fb6 with SMTP id d75a77b69052e-50957ba7484mr165093911cf.14.1773662749680;
        Mon, 16 Mar 2026 05:05:49 -0700 (PDT)
X-Received: by 2002:ac8:7c4c:0:b0:509:3f5d:4fb6 with SMTP id d75a77b69052e-50957ba7484mr165093061cf.14.1773662749103;
        Mon, 16 Mar 2026 05:05:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:45fe:3ba6:f90:d951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273d9sm46468513f8f.34.2026.03.16.05.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:05:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:05:10 +0100
Subject: [PATCH net-next v9 5/6] net: stmmac: qcom-ethqos: split power
 management context into a separate struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-qcom-sa8255p-emac-v9-5-c58934e76ff2@oss.qualcomm.com>
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
In-Reply-To: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
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
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4863;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FNVr79Fi6sLZ+qldLv+chKiF5qjCh0lSqoNC0bsdcWI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt/IIT8poUkTMwCdDoAqbmTNuqoN3k68JOFFxl
 RLzfgKVKIWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfyCAAKCRAFnS7L/zaE
 w0K2D/4rDGSTW0SD1QyIyyfWah8lyX6rA5A9XyFngToSBN703DgZMDNxYkUeXeaO/SjXmif2Rcm
 OObzFgkf7GTijwxglaizo6Y/hywgBI7dMmaVNl9j2+5oF3++AMNlfsr/AT2s3bQtpgKEmyipQ6c
 9aDRKwIipEeGEratxlc6mHDPicA7dXVwKDrzk67depSo/fuJjnCim5/FHA/QBySqVcNcLH3D218
 Rssqe4ejGkZcv0TQgFjh2zBBAWNSqpHIxNenriZBsY6dR9pH76Uzm12ESxwaCrY7/z2QG43RO3Y
 N91qkaKLR0a9FI9tXbRhbmHKd8tNojtRsSu2n4jF+i8QvsMhm2WTlLBSnHjDhesrLrcES9fkM+N
 VnrWOh622GFNqlRI7X+3D1YxkjoJz1xVic/3EOypyDur1VbMk18dFaYPmhgMTfEO41ivU2CHqgR
 XlYuo6VLOjn5/8FVaimtnNGGHf21jpTXVVrK8e9WSojBwnRN0FfYtRLm90dB5FKFfaotMb+Spfz
 BuAIY3gGvycrCxyhL8y4mFQdPdhmsQiGBkCSUXsWFh+JeD0RbqCD3juKRHCepuzDEvS8lTdrJ/J
 ZgaFYz2x7XAp7j7NA53BEhQH7ojIeBiULr4X7eXdvolOLzeqa8fqp/sr/icnIetgM9z/F/5Y5If
 4DQ1nQx0YViO78g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: pMsz-1IaR48BRcGJ__P4HgKcXiJl1bue
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MiBTYWx0ZWRfXzQP14moWMQUo
 22HKpxc4xLuSWLn7h5blaUsGw5ztaAEgQREQERQt7qvWHiyRPAemdKOKIegkSbG72UG9KOGtqU2
 8DP4OW5eUqFKVlMu0V+TFodq2008czAEBSAXmTNZCKf+9cbGbC6UqELxy4OjYyEgnjX1M4lwvCg
 Ic3sRwums7iA2NM9dGEeKu/Mi+twzU3zQ9JI0FDUHLTFPdlb+QtwmJmD5U8GslLtE+W8leOd0VC
 cetCF6wtotBhhrNEsG5cY6taYIIrtGbpXzZ+VWW7WNkbA8SEZ5a2scrBrCVMVnLkmek3WkJARjJ
 eSPhULN1Echp+zYh90ssFif7UchTs+LFgv7Dd5GrzzB6i+MoR/C9+E1PKKQdOW6aVqACJMVS5Zq
 tMnBOzXvBb54dn+qakVT5W0XIidwKdU2oqMBkJrHDZcMGmLfGsl38fUffIotYX0uCZskYen7OlA
 WGj3MftvMkTd2xFcPrw==
X-Proofpoint-ORIG-GUID: pMsz-1IaR48BRcGJ__P4HgKcXiJl1bue
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b7f21e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=TTAMOEIJuQy2Ho-tp7YA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_050551_776839_0B976E55 
X-CRM114-Status: GOOD (  18.92  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With match data split into general and power-management sections, let's
now do the same with runtime device data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 40 ++++++++++++----------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index cbfae18773c1193cd640f07824f5a66d68f9634b..f32ff0d9ce513d8270c8db9c549a79778549df59 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,14 +105,18 @@ struct ethqos_emac_match_data {
 	const struct ethqos_emac_pm_data *pm_data;
 };
 
+struct ethqos_emac_pm_ctx {
+	struct clk *link_clk;
+	struct phy *serdes_phy;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void (*configure_func)(struct qcom_ethqos *ethqos,
 			       phy_interface_t interface, int speed);
 
-	struct clk *link_clk;
-	struct phy *serdes_phy;
+	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 
 	const struct ethqos_emac_por *rgmii_por;
@@ -194,7 +198,7 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	if (rate < 0)
 		return rate;
 
-	return clk_set_rate(ethqos->link_clk, rate * 2);
+	return clk_set_rate(ethqos->pm.link_clk, rate * 2);
 }
 
 static void
@@ -670,13 +674,13 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	struct qcom_ethqos *ethqos = priv;
 	int ret;
 
-	ret = phy_init(ethqos->serdes_phy);
+	ret = phy_init(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	ret = phy_power_on(ethqos->serdes_phy);
+	ret = phy_power_on(ethqos->pm.serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		phy_exit(ethqos->pm.serdes_phy);
 
 	return ret;
 }
@@ -685,8 +689,8 @@ static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
+	phy_power_off(ethqos->pm.serdes_phy);
+	phy_exit(ethqos->pm.serdes_phy);
 }
 
 static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
@@ -700,7 +704,7 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 
 	if (interface == PHY_INTERFACE_MODE_SGMII ||
 	    interface == PHY_INTERFACE_MODE_2500BASEX)
-		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+		ret = phy_set_mode_ext(ethqos->pm.serdes_phy, PHY_MODE_ETHERNET,
 				       interface);
 
 	return ret;
@@ -712,7 +716,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -726,7 +730,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -819,9 +823,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+	if (IS_ERR(ethqos->pm.link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
 				     "Failed to get link_clk\n");
 
 	ret = ethqos_clks_config(ethqos, true);
@@ -832,9 +836,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(ethqos->pm.serdes_phy))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
 	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
@@ -859,7 +863,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (drv_data->dma_addr_width)
 		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
+	if (ethqos->pm.serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}

-- 
2.47.3


