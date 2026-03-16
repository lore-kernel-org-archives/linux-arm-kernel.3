Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B9EF46459
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 12:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=; b=IDGXrzDmnKlaq1be4Rn4n8VJ8K
	6DyJKyCdCBgnuKcHuDYeVFNVnZwnEoJFb/IBDa5JCenBT6A2Btm6+T9PkNH/hagD6swct6Ie8xlLy
	egr9nPQ0uNurTds13sRF3RFS2w9vKWkdqJ4vwhRiRKWzD5QBsoy0S7rH1VnOhz5Ki8AR6diNDYV/W
	lqoZMnf4twLyRmH87fdep+ce+FPVaAgzvU1XtAv/SjqdqMxGgLQWNvupLfztp7Fcyhrm5N0/7VVz2
	l14oU4jtgtfJ36Vh3htShXj/OwJMVh1p0lLFXe0/WzGNTs49TGaOKRmKyyauBwxKnp76GS6uAGb9K
	nf7NPXHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26hj-00000003smY-2fHM;
	Mon, 16 Mar 2026 12:05:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26hg-00000003shv-0vkR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 12:05:49 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBjg791282074
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 12:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=; b=pWohj5OkCVNuv7KM
	pcX5zRTmSz08iVsJofRQs6bshQLQOoRtpVo4lt8OkgAS5ytGeomQdtnbgsPIiIjE
	ebJrpv4eUbRhpGq0/3EUn8YCcQ91EVjqhf7ZTrl90Qalv8kApiAh4odcD3x57ZHJ
	Mjq31SyWQ8X1hOGqhwS4sO/S6myNJlE+8H+s7cmrd6r90P9WAQDG1+e9UJsJtWVI
	ktUPr8OwQB25pm0mwGJWu/tWEvISYqHcd4OCSLRPbJd455OKBtz/7JzyJQ69+iSo
	qKmqtxT7zahYK/zpcr4qYMp4NuYoYpLDeUGACcMr5TDyf/wFuXDao1hUUuj10fCy
	rD5kJw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc5g79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 12:05:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c5976a8eeso21946656d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 05:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773662747; x=1774267547; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=;
        b=ZWvvJ6SWxM+kRaozBKplboWOH6lrxjhENli41r+U1dbP1879majV3VZZ8MBWQSsgoK
         stsWeo8Kw0Gg7H5mMVSG4A14hhOrQaXOJRyh+1ezzbVq9tGpjh5BTfm9HsvNcdv8pM9v
         hfUF6AatMnSFvxVcxWvo1ewJGzi0+cN3p86CUA4QepcHFToHPU906/jScHdZgK1iHxdQ
         DCf28PyUuiCo96imxmfzxGl+LCONOHV+vSAkB0O+jWgBTnWkTJki/RdMJuCbl+fGrImU
         2e6bxmE6PMYB08QLDeoqJ30QGZdWqQtM1hP8pNTUwxlbipvXnDpEAcTVTxRG/hVbpiHf
         USlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662747; x=1774267547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=;
        b=GqZTLMRrXd/sKg5dWz6mzLp3ioT4Ue44z3G8a4clXwSxezssyl8EMTEUSHqdQ4AqPJ
         6nb5jLecEK0U7ETHJ7zhukdpRYdlIp5OD88D1AajeborCvCr5FUiUxwsdGg37ivx7XNK
         GI2pnVmV8tYUoFnl6DxtvjAhMlGFUJ6bphtSUYNdjzxToVK/cDlNqS2+Z7ZoKcXsMAlG
         a+0qttGFQ6YYymvJYLehuBrJYnXTkbNLupCEfW+WOrGotJC8OZFsShIvVw/3qogZlkfj
         DP9EGAvgvZ5Uo+Asq7QNamdlv4yg05Fo0ADFau05r107x0vd4pJf5YlqzDHjhECEU490
         AkWA==
X-Forwarded-Encrypted: i=1; AJvYcCVWqDAKa4AssXCmo+I4S4XLBnO2j+ueftlLricU5Ri6RET8YBr44z//1K38aZjBnK/lL8N+a6y4toq8OvmbBJ/8@lists.infradead.org
X-Gm-Message-State: AOJu0YzvPF++kG27QJXdJESXo/VsMCvSp2RrslS2r4e3pAd0pU/fnmCH
	LrOUgGHRB+o59m7QbyQ+UK+tuE+PqJsjjUmmZBW9PNgWliePFv5fgQ7xhDgU/ibS+N+sHOqElGM
	pGGfqbtnvF1WnpiCPmG+GA6V+g20FD/RMfJR8UjTF8yb3Pds4RGcw8LikXQUFzvFSambiCIVrzz
	Scwg==
X-Gm-Gg: ATEYQzzBnliaETX10S+XJ2REkcehLwDtR4dIj+t27YSN1Jjl+NDx2c4K+XkK7Y9j3ls
	IlGS5R4kyvveJvTmfWDhfJTNd5fQlI4CxV3JZPiw4h5XqMNCT3avZCA+CTUEqLvHWHQGAX6P4aN
	6/kHE+ugC/Hl+I6cMdhlDQioMUXkLywD/8ryXwxDRagwbQGYksUdz6Yodope0ioHIG+30xr7WXM
	HJVw+wynkzFVKHAwB0bdnHslGF3Vs3Kp5g5W32nr6y+1EEEjr1ZE/4xfkQINjVBB7uTkfd9pLfJ
	+xOS5wp4IPp9u0qBNWaYZcteU7A2+Oldws0CHe93wTm1OWLRTeZ37fqw6mS6r2h3shBc9qIceWN
	A06am0mk6SMKXfc754zlIy2rT6onKZWvvo3G4xnoVUqqbOUj4wys=
X-Received: by 2002:a05:620a:40ca:b0:8c6:abc5:f169 with SMTP id af79cd13be357-8cdb5ba0d89mr1602660485a.73.1773662746680;
        Mon, 16 Mar 2026 05:05:46 -0700 (PDT)
X-Received: by 2002:a05:620a:40ca:b0:8c6:abc5:f169 with SMTP id af79cd13be357-8cdb5ba0d89mr1602654885a.73.1773662746194;
        Mon, 16 Mar 2026 05:05:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:45fe:3ba6:f90:d951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273d9sm46468513f8f.34.2026.03.16.05.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:05:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:05:09 +0100
Subject: [PATCH net-next v9 4/6] net: stmmac: qcom-ethqos: split power
 management fields into a separate structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-qcom-sa8255p-emac-v9-4-c58934e76ff2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3509;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hJGGsrAtahyuAplrTDgGRPmhh8bkkO/cgS9bRedR9Qk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt/IH7+UzksxcBqpQnoVfm94yesTehZL6KZa/o
 zJAXvOazA6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfyBwAKCRAFnS7L/zaE
 w0DvD/4kVc12bfMNOItY55yvgMugKA5cgssCjAAELIhilzqsOtLF+QTcauo3L1I4XkAxCeu8HnT
 YLVxoD5YyVO1KrDNdPN/7uMPGxXLeHm4YFHm56SH134R5E35bQmIJQphjvYQ4rPyafNHeIocA+M
 gTNt5zmtV9Lgg+dKckIxkmpgzdM5u7IeAONHtRFKLUK96ZdEJeqqx4qUq0x0RNMayO5tg4B/tyb
 qPozJZ0U0fzmcKSUV+vaNUgjWVw87V+bRr1UmREmSNLBjUxehepEZr8meRGeGbL2lZPcyovttRK
 YPgjYDgYAs1nqUbvw3SEW4h9pYidZpJR5x+rNeLZLJ4hkd5ranw/yW4/aHyJKNfYzS+NnXkR2nj
 AMUO0C/1KBeZ5/9Ij0f7zR5jVSCA0142W2M6reVXXATjqjnmfwYrplfZHqkhQ31cGReOb+/+rhH
 2SO/4iApf3mkTtyd9q/vNkisn3oyvw7aonZ0zIrVOYSeo+EiCPPC3cFe6biaAl6QQwWSVOR1Q4h
 fTlX8TjeiplK96fSAqsISmDmbgtxtfjj+4ZG2Fa5cloAnl6uW3rT/AXDzEvU9rxosWdvI/R7QWz
 O1Y5TdzAK9dlH/v3NPiseZjs31VVohvZU4FQdkq8oPp5+SUaFvTBjgLGoCfbdY3eNpCl0O4aayy
 Y7sbsvP+AHLWnMA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7f21b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KCp3k1edx3YIq9yPN_4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qpRf5H82r5yAxyH7DwtT61kdkwhl79RD
X-Proofpoint-ORIG-GUID: qpRf5H82r5yAxyH7DwtT61kdkwhl79RD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MiBTYWx0ZWRfX4A6/cr6Z/wun
 v3g8S6UMMDvAp1JKYgQPoavHDkph6LLoYUo+XRys9PJrHIVtZUTGo5c63tatyc5sL6JVDTEU2Ph
 INmDazZT1gs4+qz383PITadn7rWUgAc+10OPdz4cKGbxx7bln55+GlZjhQhB6ctf+ET6/6f9779
 5culJ4UUJRMvDHSEYykoGS/PIV6Bd2ogp43HV7fDeGOPkXE4Cim080eGrkcUZ21HZGtMQ2U460Q
 eUWDe8zlNB1Z/h5O62Mp9FjuIoD1Zmd0sj2wEb/YT2el21Fg1d4itD53fyJm1//sP8EPOdvJcn5
 JHbuN7NExYRCy69eTTOsM8bMKnbiLFDVIcaCatJCbp6ZoS3PRWk9X2YRWNKlImiILFEoGbMPnQg
 YtjovtoirGetG9GYO9Z/jxDt3gCCaOY3qC7808m7VOdYLRL53DLn/bYcBnn7WE+d0rBZJisEFDQ
 5JBbftjca5+8lqzp/iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_050548_314166_B46DE4FC 
X-CRM114-Status: GOOD (  18.65  )
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

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 8fda6c128117d7f5b1dece68c919f2a09a511210..cbfae18773c1193cd640f07824f5a66d68f9634b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -92,13 +92,17 @@ struct ethqos_emac_driver_data {
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	u8 dma_addr_width;
-	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -301,7 +305,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -322,8 +325,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -749,11 +757,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -800,13 +810,16 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ? pm_data->link_clk_name : "rgmii";
+
 	ethqos->rgmii_por = drv_data->rgmii_por;
 	ethqos->num_rgmii_por = drv_data->num_rgmii_por;
 	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.47.3


