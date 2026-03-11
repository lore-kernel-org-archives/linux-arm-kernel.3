Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4751D1125854
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 17:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQF4J0Ck1r7kMaq7FizMxZ4LkdIkOnUWDeejjTapamY=; b=DoWZh8EjXl2LxIO1/6zAlfQXEI
	/qO3trXVJHNAEstlqQPSMX7ynYWXmr3836FUt08rvNuxu246aPRLpWuYUHoPe8iI32Axifkh6LK5H
	72FjVtJI78NDclcikPn122jupRzMHFO/GOsLEdhiDI2wjwFfR0F6JPcsmZh1IYM0Q8pGP4CCNI+zi
	WeWz1pEPm+4L0iVmZzJmbx/0ABrh/VsqPy++cK1n+U2wMWJhHYzma83L80mUfVFUWDL8HNVgY3vP2
	sKHUTFgR5QQPEmeZtgdWs6MeLvifv5zXnFaK5v2/REspiFvUslFdrToaRzuadxJ4TkNs6+6d4TLJe
	ohD3SfSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Myw-0000000ByKx-0lis;
	Wed, 11 Mar 2026 17:04:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Myj-0000000By3e-3ToP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 17:04:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BFp11B3602016
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 17:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQF4J0Ck1r7kMaq7FizMxZ4LkdIkOnUWDeejjTapamY=; b=k3+NlWJDG2n56Rsw
	Jf6FiJMeTBiIf2bx/JtNJthrmX6U1Jf11uZmEY5vORES4wgwmrr7T8kmuFk+T8EG
	dOrQlILvdmJL2bKtvug+tJOaboCH8jYBs7B7YmseDytbIJmLnTDlgChqKufnRHR+
	s6zoSQyvPC0uPJTDg79d9/62w5kbkL/JLHO1dbi0iLQlIRSorujgVAT9YkVLMqhx
	BfX55/m4is8hXQFUEvPNEDkKlFJqde5ecnYLBLkaWGKLsRBnJDQbX0MgiqiST81G
	ohcrdgVmQvrnL2+8vTma0fVnpijzmGasAA22pc+yfhVB25ExLozNCyBTPNebGM9l
	ht759A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cubd4r9nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 17:04:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509011403a7so6294911cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773248652; x=1773853452; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQF4J0Ck1r7kMaq7FizMxZ4LkdIkOnUWDeejjTapamY=;
        b=SDGdwWNNuTbFikn5CWfn93l7RE67WGXJwzdNoIyAaCZlfToB/S5wSNaFDpsDFj8XbY
         K5+gVui/VNaZO5la3Otr/fq6ZFf5NfissNdNPzBLmxFx7Q41uXpwL04qlCB7kCEnUzE4
         0gwtYjrTlwVvsEqX/kadvnThjurArodHmhvT6v9hJgPyDRWiWuo+pNvBOgZUOaQ2/Vop
         lZhMu3ANr18LxehogsgauKdKeznvRF//fwCTQsaTmmtk+bERaeJjO42cMkfHgTQPHHGi
         r31ZoA3P+ncR2fJ3EJCStWwtD/8QbDBkpdta1ky6wB/K0SRW+g3Q7TUwGYANPDypkDzR
         7Ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248652; x=1773853452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aQF4J0Ck1r7kMaq7FizMxZ4LkdIkOnUWDeejjTapamY=;
        b=cka1+xZeInUfL/+HKGQx2vFbkMj9MRPJUHHabHblMdSJ9UTFY59sEpHwEUthh1zUmf
         jvAfAOYBZZS2RjJnOaiJ0PsjNEdPbuTs0YQ6SO8nf/PhiR5wgxk0QKnHDJ1BiL2AQi/n
         mrhMudFA7k99yK55zsXhqxCWPZJNkdZFcM2kZY0BAGV282dbjTKt2buGNp8krJ0vfL3k
         rZGxoTFzc2x8d8uNU5GZtFhUhqM8Nu1BXw5LgH3C5F8FPG4HKG14noF5Wby6dOf0xiAe
         eTmfe5bIJfR7C3pULZhZgC3GpH2givT7hN4fG0BsACvTVoP1jUL6DQB4XFh6AuxCaMMu
         uMLw==
X-Forwarded-Encrypted: i=1; AJvYcCUYn7gQKEDpK1KTKgd4hF38TCjG8X+2F0xzLGt1raJoYKCg+IWGDWSSfrEKw0rHoWwcJS9EXkTqDQg3iFVsrW1G@lists.infradead.org
X-Gm-Message-State: AOJu0YxLvQIN/VvOotA+c2BPsT6u+hk3vOtbdVihNmjOTCXDQG05SQvW
	RUa1kyKqTqvoy2SgATxNN1dXoSh0dHwjR8oinySd1/NvlmaSegs8xH1585ZP49yyQlcicLMTu0W
	05S4aVCzzDRyPtpzuEYCKYoXi3xSYIjEKbv+jEZZYlZti777Mir8+xokpLqY6CG76tDMlgJlEgH
	D6dA==
X-Gm-Gg: ATEYQzySQdHS5WF1kmpmwMxxNmClG/lQ2VuhjQLSyXs3ahKlb/B1MSFSsbwof2JE9oE
	12F6fop1aOfyp+OiIKg2p9LQOnswKkdpoeiA31/jZCwpR6TrX9FYzqwDkTspMwFNatkWwXxTsPn
	EZBkO2oqK5zzqeoDbd5jLEiae2qLlyfTxiY11TLrLzPKH3D8XnERbzPmNYVM1BgzDyFSaAzQiU/
	nAMdTPOo6ZgZb/cunAjmQys8lFI0M3GZ8TgE4dv2oUcqzqKiP4Um7E3LB8IN+okDWmWWztkeABJ
	a+8EZPLoTvF6SWvfTYtrg4M1CIxYSq0GgJL/d2uazejef+eE/DHqwJJPa2jhNtUUcVUWZrMJOOC
	9R5X7sqBnX6rJBQZBK+lBCLI+NblBCnhOIZ/TGdi1ozOP/lwIIAsq
X-Received: by 2002:a05:622a:1a84:b0:509:2a55:9c5 with SMTP id d75a77b69052e-5093a0d96e7mr42568941cf.19.1773248651828;
        Wed, 11 Mar 2026 10:04:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1a84:b0:509:2a55:9c5 with SMTP id d75a77b69052e-5093a0d96e7mr42567921cf.19.1773248651224;
        Wed, 11 Mar 2026 10:04:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3a92:6740:d71b:5056])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ad1e4esm167993075e9.8.2026.03.11.10.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 10:04:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 18:03:39 +0100
Subject: [PATCH net-next v8 4/6] net: stmmac: qcom-ethqos: split power
 management fields into a separate structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-qcom-sa8255p-emac-v8-4-58227bcf1018@oss.qualcomm.com>
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
In-Reply-To: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3541;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RM1fjAFF4/rBfKY3AWIWw1rUVlUS0NVefDoxG3ay0KY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsaB28EUio5koyA3lZhJISL76YdBlUdjqzECUz
 1BUFVgZwEOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabGgdgAKCRAFnS7L/zaE
 wxgSEACWWXRhsAqQ2n30DGIRpoOVt9yJvPksATliMt9oyQ2CJaSny//RPgS2Z52xWGcqHWKF2S4
 mYAm90ZApw+oAbeilIiVVdFqGrko/4CClxLfiUhx3sCGy+C2OfwB5M2DxGVSP/E0qiCW3WrMEBY
 V3u5UMZuB/y9GSpC387X8pkKgI5uvbYAH3cCBSYUOwtF5Bj+Dx6SpyGMruNJ2I/dnJvx/Qasxwx
 y5i6I+Yr+dPZetjrh7PDWkdDKmHI0JibzdG483DWl8QhLm/9H0rMqxjfv03aoHh1tng2/UNR5eR
 CSOwHfShWHabG0o304fwxWCzHsbAGfgGrgKXRw+yvbmw9+Vjw2Yd3+5BwpYd5aXNcI6ZUdgWMs4
 /WMf7YVs0A54r6VcXyJNmK8JQ2I8oVBAg8OnGbe9gCNPkxUTUkfa50ktLARUFc4O/tV1jmOl8I3
 zkiG/m2XPKWlWLlSN1ThL7P21d2Vhlm6Ht0mfFfHqtLnILW8ivqyRUg9G4R3XLsWpFAcJ1WkU7G
 5rTkVCcdFh1hnrl180/4XqFEOcfhtfP25wN0ZOMe9Gz5lThl9zDxDke0ATRfm7YvBdjW8upjvwK
 NyIueR490SafzehM4vh3O/O+lsAUsEC8YK7IzLo3d80oPtpVGEmRm4irEOOmuWl/wK31Ijhp+b5
 f/6GvPkzZB6eDCw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 2aSQCAYoFLQDgbbeG4b11LRKYW6wPv9Q
X-Proofpoint-GUID: 2aSQCAYoFLQDgbbeG4b11LRKYW6wPv9Q
X-Authority-Analysis: v=2.4 cv=QLBlhwLL c=1 sm=1 tr=0 ts=69b1a08c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fthQcs0maGYz3WdgJrEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE0NCBTYWx0ZWRfX61TFXXkzT44X
 N6LayAgPfDpNycrX2jLYdZ+k7mgmDMCfHM0xYBVsOgAIhVqsLNr9HF5x7SyDnDkaN2QyYPT+DVE
 YnR0NB5q0nCyJbWp0fCYEPb+z3tAUof4f3BudE8eEPGSLEVoiAHYu2pQ+HME9r3lcewd/S8JaeB
 Ogzodftq3trnKilPptT6RSDzjvUuhr93Gw8iBPQLtPmozGvIE/TBpolS11F+l7YztfM32yNZMVr
 GxU8hcV4XY27CRpVPnjzYS8hw8y1bR/3U16xYdVgLkXbCF48ZiSddYgG7OFx41KovqmQpNMGDFk
 wegCO8YDNFRczY6wU666iRcW+r7Rp0dTJ0/WgQDAmq5FnIyT5K7DwoAhaFx+m/OZa2JLlfCmK72
 GAYlnTp2lu3pZqqye7clhngdmFkSfJO0Hh3WoS0uwPbKMiK3HMEhrJam0NPaZ4uojGDbZOBzQpb
 /r8YxYcyciK4SpWe/ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_100414_041119_D3D0D6B5 
X-CRM114-Status: GOOD (  19.11  )
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
index 92fc1fd0b4a1f85fdca7ee6f2c78b88415ce440d..2166084aac999a38367af4294129f925391179de 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,14 +91,18 @@ struct ethqos_emac_driver_data {
 	unsigned int num_rgmii_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	u32 dma_addr_width;
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


