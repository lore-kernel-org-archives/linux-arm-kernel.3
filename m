Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B25C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 11:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=; b=Myq/pS+2tEFopkgO4Gyo8v+yBT
	pQKFlhoY9H5KDIJkpUdpO+N5Jzxh9LZyA1iCe3Kxw6axTz3Ne8ZAcmwTTsiIfFimRaz6Zf5kahIED
	mg9ZA4ULKQPdHl3ghOt5EYpEFhIWa16ncrHbK2g+GvABlYAg4gNxdZuOEAw8NL5KsyKLN9tvsWakS
	pCT8g0hMDByruZtRK8LS/n7pWpTj7NCicjAt6Jb1N0dWnItP/1Wg3V53f3NTW4xy6nKQ0209Mdm5Y
	eyoJykTaUKhI3Yq4prIcyo4dbJ5QOl68yho08Ed0T+6ybApdTuAzpRS3laYkPzObDo+MuRK4Ynklu
	Emco/2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weABV-0000000ESDS-201n;
	Mon, 29 Jun 2026 11:29:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weABD-0000000ERfh-46XC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 11:29:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TB5jud2729668
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 11:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=; b=VME4b6pe0s8CuQcT
	zb9F7XtQFAMjYW3UUW4Xs4rfkBOz89g3rI1FkLqhocUuFQ1NshWQ0OfLcdrSWGv3
	dCDKd9Z9myw7SA2E9nxEVSL9ookplm32yU7k3WCOX7lJGwphKL9ZJsOG3Agr7zm+
	RuuuS1+5w9qaXhUyF2bxnoBO0dTpAoTF+pTkoLxhDc1FLbTtwsMDq+k3aCcfQobP
	sIkguaOaDTYm9E/Ac5kRS+b7sFym7konv97/6OSBPsAvUNzevqbzP4vjmd1K6Z2X
	1FKX4LqzVeWDz7KkMOgN6mtZhd9U2vCEAtQ2LuHqm3fbIFpJ4JO3QSWN/+dwaFxu
	oy9rxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qha82mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 11:29:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b2ccd7971so596260185a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 04:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782732574; x=1783337374; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=;
        b=K7PiKchacreYjcrD13OQatfdVpjUl4OtunIpvmny0kfc5btOKOKr0zVE4ihjtpKQFO
         kAOsGHhX0CwdqDqpD5dZhib+qRCgo+4p6PZOTfR7G71tQ4Gxg7y2xUvEGOsrkMz65fff
         AUW/qlPEPw065e5Byp3FHHUySDwtAGY/OxGHPih/mlvnjgd84QSZ4nm8Fmisv/wmUiWw
         mvQAduMFbzWd/VYf1vpZHKkZZJcogylOhluzWdjjGaJzhXNHPV2trWe5slZKd3lh4Jsm
         Fk+mvJDSKNqaBbNDQACvG4EKgpH2nrG6LW9fPtWL2F2TfqgDyHeTAMkoWe4F2gE6lflq
         VV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732574; x=1783337374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=;
        b=UqPv9YJvBdcgnMnJs/rztJkNjBuNpqouU13E2rc11ivBKJ3AjuNFP+t54IpqA5lgpj
         vYglvprRSFuS+YvNpiFvu4PD0QxsQ7GZ2gxHWuP4wOVafmI3UyP/kV7VHVYPL9/92VUk
         7IPIcHrjDkLovG9yBXDeS+FPjb61QB1R44bIbCzACmr7pEWJAS9Wf3vzD1oTjDRbwr49
         HpAxB5MoXNDFYRs9182YRbeotaBO97kGHRLOmDme/8nvdAbP8Tjb3ooqkhNoACOL02DG
         rCgf8IuVWKTCdLUDafGbsgSP00jX/szeVURIbwTyl8/oFXBiWmnEchzIcd0EqYRYzoTT
         hAkg==
X-Forwarded-Encrypted: i=1; AFNElJ/4nuHxUoDjVEsk+K0QgQU492PmCXhvZS54NEuJjKoWYS17jnprdW1t5GrRS8TFyzxX8JniP/yFPpdJDCEf1/lr@lists.infradead.org
X-Gm-Message-State: AOJu0YywOPeeoFH5SBuUTnmoiUuspIt/JlzhmAdKbB2eDxABoswATOMg
	tc0MwNy1AUlZV0sBK3nLHDhk1Ov6Wz+zMMkl/mM3g04P/ilmNuGsiOoawVeUKUHneKY0iqWNt2G
	b0fWSoqSW5Dp5B+18ol3RpYuS1/g3rzGyuLRDyWYGCDZK8FvyW4W1nUsroCCZzh0jNTYurDytpz
	VGMw==
X-Gm-Gg: AfdE7ckxSQS1+fOoLxmhMwqFjQwx8TxBKxPkUHPC1+xMn4jIEKV0ucPnUmRbjO1Zr+X
	ONL2KdfYchX6vY9XqLripu29+OFB0bOLUGcmUh/U5fNn0l84mDIv0b+HyBNn+EAslI7Yt4GZj7v
	OfjOmN2h0ZXJIoba1qEltIuSeS7BPQhUALfJql5Vkh4ynIH712cfAtJDmHmmZeJDuOsutUQoQkI
	vbxtnjWIsYqd1w4ZlWc9ee2FP9jMumqiaYdDlic09qRgY8af4zIteb1bUW8swCJXS6hRUeFDZbq
	wuebbD/XYkjNWw6Uz4aXZoyNWr0oiAaG3GuECvgRjXPQDtJyeCj4lBkBtFCxfjYRSYFImcHFpj3
	EtEzsX2BWAoZ0tmt1dYJgNLtCKHEbo6adaZQ0yVX2
X-Received: by 2002:a05:620a:6910:b0:915:b852:435e with SMTP id af79cd13be357-9293a9a0911mr2438680685a.14.1782732574115;
        Mon, 29 Jun 2026 04:29:34 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:915:b852:435e with SMTP id af79cd13be357-9293a9a0911mr2438669785a.14.1782732573277;
        Mon, 29 Jun 2026 04:29:33 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46d86960983sm41936351f8f.4.2026.06.29.04.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:29:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:28:53 +0200
Subject: [PATCH net-next v11 7/7] net: stmmac: qcom-ethqos: add support for
 sa8255p
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-sa8255p-emac-v11-7-1b7fb95b51f9@oss.qualcomm.com>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5134;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zlpwRA2B5tVQ/D/s7B0Bufz2lMNZ9fNOyqanrb1FAug=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQlcEanL1FozExLzbB2CNw7QgHT0+vuG3E3TYv
 vlirghb6BWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJXBAAKCRAFnS7L/zaE
 w545D/sFwyf136vnKWGIWE5mFjoPntaYvEb9XbIPHbPDLyLyBE5XGa4vL8daVHrE9ttYSHHicug
 cgto+b7tNG+Fdgv66ccpX/OPFJ288VrdQXu08TFHm8rbVuAwdJVGakFZDQM586+nnFtHX90FFCJ
 IYbBvmkPtI4jX6tVNt04onvWsH60gsbQaOJ2sXc0qrzlABFC3ZDyWCOnuHSjyptruZk7K1KOgTR
 np3KO1nttnj3nBFUVaVmgnFkKgpzwvqrkGPbEPX5mhvla5xe5ixRTykZ9dRDNi3KhhJeSqvrHpW
 mvjIt+lhH2YYRzTQ8pbVEdXw+wLTE+ix41vqVoQBPDWLcRtOOIsBA7gZln2tlyHeHabfa3RAxl/
 4K4gfxWbVNQDSX59JsK760mq7/UOtG9vZe+0N0RD45radrnHGCDyXrGbnLjrGr8vg4L07SXkfAU
 TrwHAdR+H/fNHAzriC5y+8lwoLcVl/eSl6fBwEMJzTRhcpaUbUBvHhCCGI78tyBUS3/43Ssrlg/
 yhK/f+h2j9bAwb2MebJspnvTZw1oALLO48vK6Bi+MBekjlSHXyEkVAtHaK/9Z1HPp5S/9vvAf6X
 a6YOb07mTXouuxowjFQ+eSdQ54brBkbr9MQWCJxU34Rx3HFTBWgtURBW7cuivUHI/CzFRWHbF6D
 tQOXj/IRERuPa5w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: ONSQSlCJluYPhzjzRZzd8YFhj12jEKXz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX7gRQDDHX6scf
 Q3J6HdFGMxoqvF6ZzxFoVh+ytTNk6u/G1Rlvog96pig56PFJXNG0aqmfGVuDPUWwMjpDZZON3Gg
 QQkTwZg8vZb+n6dpQcmzoxAmduaYdM6L+jj8ON7hlP/7j5tlg4YxjVd2BIZ2AVP1TTXr3UOjwQD
 QtXCc91kmYLybwebB1B3dGnxj18hfyTO4A+by6L55cYCJ5PcR72GPjnnjhsEaDXJ5PgE+5kLcvi
 xHCjtuZkmhtaXTKu/fPi6JO9GpDqwG2CV56WroGjan24YH40oyC9B0xbAzxYilK0X37p7MffA7F
 ujTLdvInHf71uK8X+LuD+eU4cjWBM+ffBZ4arFZLD+6FIQPUtkqqkmns7ojWWQ+MON3ofsAZjYm
 9ow+6rn6Bu/xxcGXFzbhHxNAN2p2r9XkQ/UfbTC+PXI+04bz/DWePDqgd/lKMZC+vR6+7rL/9BT
 Ymy2Q2pmyT3nPD7OjTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX/BHGp0hgUU7W
 O8T31gG/R3RVY84WUh6XbCticcJbZwnA0l+ZE7r+SxLZCO7XIZD5QwP9fzNgojqpECJ5XAPoCCv
 +arppeBUXd5GaOPnKAdBje+1LIS3VgA=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a42571e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=RTgpwGSXUauNkVmvBPUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ONSQSlCJluYPhzjzRZzd8YFhj12jEKXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_042936_146871_21CF3CD8 
X-CRM114-Status: GOOD (  24.83  )
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

Extend the driver to support a new model - sa8255p. Unlike the previously
supported variants, this one's power management is done in the firmware
over SCMI. This is modeled in linux using power domains so add a new
emac data variant and a separate setup callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f379570f80680e96f027873cda6a6bca398e22dc..47175670a32631369a2cf8b00388d9359513e090 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -108,6 +108,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
+	struct dev_pm_domain_list *pds;
 	const struct ethqos_emac_driver_data *data;
 };
 
@@ -206,6 +207,8 @@ static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 
 static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 			     struct plat_stmmacenet_data *plat_dat);
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat);
 
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
@@ -310,6 +313,29 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
+	.has_emac_ge_3 = true,
+	.needs_sgmii_loopback = true,
+	.dma_addr_width = 36,
+	.dwmac4_addrs = {
+		.dma_chan = 0x00008100,
+		.dma_chan_offset = 0x1000,
+		.mtl_chan = 0x00008000,
+		.mtl_chan_offset = 0x1000,
+		.mtl_ets_ctrl = 0x00008010,
+		.mtl_ets_ctrl_offset = 0x1000,
+		.mtl_txq_weight = 0x00008018,
+		.mtl_txq_weight_offset = 0x1000,
+		.mtl_send_slp_cred = 0x0000801c,
+		.mtl_send_slp_cred_offset = 0x1000,
+		.mtl_high_cred = 0x00008020,
+		.mtl_high_cred_offset = 0x1000,
+		.mtl_low_cred = 0x00008024,
+		.mtl_low_cred_offset = 0x1000,
+	},
+	.setup = ethqos_scmi_setup,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -749,6 +775,62 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	return 0;
 }
 
+static const char *const ethqos_scmi_pd_names[] = { "core", "mdio" };
+
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat)
+{
+	const struct dev_pm_domain_attach_data pd_data = {
+		.pd_names	= ethqos_scmi_pd_names,
+		.num_pd_names	= ARRAY_SIZE(ethqos_scmi_pd_names),
+		.pd_flags	= PD_FLAG_DEV_LINK_ON,
+	};
+
+	struct platform_device *pdev = ethqos->pdev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = devm_pm_domain_attach_list(dev, &pd_data, &ethqos->pds);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to attach power domains\n");
+
+	/*
+	 * The SerDes lane, its clocks and the MAC AXI/AHB clocks are owned by
+	 * firmware and brought up through the SCMI power domains above. The
+	 * MAC wrapper itself, however is in the kernel's register space: the
+	 * mux that feeds the SerDes recovered RX clock into the MAC's clk_rx_i
+	 * is not configured by firmware. Without it, clk_rx_i never toggles
+	 * and the DMA SW-reset polled in dwmac4_dma_reset() never completes.
+	 *
+	 * Map the wrapper and program the same loopback/functional clock bits
+	 * the non-firmware platforms rely on (see ethqos_clks_config) so the
+	 * RX clock is present by the time the DMA engine is reset.
+	 */
+	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
+	if (IS_ERR(ethqos->rgmii_base))
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
+
+	/*
+	 * Run on every runtime resume, which stmmac performs after the power
+	 * domains are on but before serdes_powerup() and the DMA reset, so the
+	 * wrapper is always configured ahead of the reset.
+	 */
+	plat_dat->clks_config = ethqos_clks_config;
+
+	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -836,6 +918,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_v4_0_0_scmi_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},

-- 
2.47.3


