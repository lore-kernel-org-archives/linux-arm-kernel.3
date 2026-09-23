Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDF1C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gGv4RW/KPav2gQfSDhKD53xcmE10Fw9benIy8+8ItU=; b=Gb5gk4DeORY8S/ffTBHzF6LaBU
	jBGWq8gBWAPb+LFhJ3ygJsD78f80eiqYa1MF+I+h4dqnTnEV435W2GyzUNscoik7V2EBQKB6L3G0g
	bQq7DQPTNZQ38kqdTN+ggLgpZeimD2IzpRGUwShWFwMPmuKe9WvVDDzG9IQoyFaS7fMmJZoidoXaY
	HXrS6LKmSjxExgj0bh8rxU9ZBr2XwnqYgXcbmW6IlS3gtf8r3SfkyYGxNoA72ij7+9xgxa7zGm1jJ
	R9rGEehv/u5VgGh3CZ/ey604wxZ8DDFGQGrF5Ze4p7TOsCO0r2anjP+gHLcJnIU+7ZbK+XsfF/04R
	j4CsZQUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9P0Y-00000008kvE-28O3;
	Wed, 23 Sep 2026 15:35:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9P0U-00000008ksC-1fyn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:35:40 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbbS23772266
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 15:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9gGv4RW/KPav2gQfSDhKD53xcmE10Fw9benIy8+8ItU=; b=ZFKjuO+W/WjJvmGg
	OUC9G6pvJHI+5uSg98l+xDPOYVV+JpUsY1USYaxHRdQRisjjI/OlVvBaxTwr4NRn
	z8IZph4TNZSpL3SDkck/OjiVy+h0kgWTNitZpYnxU7/fhnSIlFwKcM4uJgYxHnzC
	Cttme2QU8lnbJMuBi0Qsxg0ZIX9I4xva1eWC+F5i3P3PhEXyLr4BN+tkOFIGb208
	qIY1yEbbg/DUuJLGSxpWzhJyg8hwKyIq9vyDpDi6xhyQc6e9nNPp1a1sDR1GNLxp
	rQpkdvsHaROlwB9eMRzuA2AODf/E24LTqdGdQguaq7ewaEQ8O/m6K1aqbbx0VjQl
	qUeUgA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb6134m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 15:15:30 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c9a93f5f3aso1321209e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790176530; x=1790781330; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9gGv4RW/KPav2gQfSDhKD53xcmE10Fw9benIy8+8ItU=;
        b=bY303IrVQ7Ab8/DJITqKlRf4sovZHWGFT9yrPk7QGOkaENDbUtkRBs0hf9X4EqLlRD
         BB1TlB7J2JdB1C8JVeA7D0YmnNA2AwPY9E5cdwUki83AzWcckt6Pq8gncPuv5r7f6Rdj
         8QkyznCSNA8oWgPwL2kT+z2+hgJg2SMIr/UPz9d8ceoqZH5rFlYP3mB/veKX97VUii32
         CPXyJvj32WAx/ZXmm0XDsmCfWIxq05eHhpMXzEa7M0crK3JVE5ahURPfrtTR/CpHig2c
         YsSQJ8zSITQSUJ003jH1zoERcfyk3v2ltDJwzoYauPrXMlK9bbsTpud1rWYTOIFfXOUW
         7s0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176530; x=1790781330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gGv4RW/KPav2gQfSDhKD53xcmE10Fw9benIy8+8ItU=;
        b=2nSvAgGy2MhH85jQcUiTewHiwxYas3arefKeO5QBKiDa1ldaHhPghtPWTC6rXmF/Y9
         E0Hbv0ze3kbjfRtQpoQu0bZXjDcWuVv0kg4lvgg3rkEV0DJByIaESWmdQab8dXDbJBzk
         9pU9skHJSI+H4A2tz1AVJW61fr42n+PeXuEeJ8vrCCYTLYX6mNyEdoFaA/yrKEQz8Xbo
         lJ/J4mZeMbzBmNGLOd0vUKwuac5I2L/P5uCfVIWPHhCXO9rqIhQ4ukDT5djxyj6S0ehM
         VjrXPVcTqmBkdPs3NDuJPUtvLKBkGeCA3EavA2mN7vqmnj+PcQouCp6+eB2QGf+nrD5O
         9NuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKZ4gFYyu9J3XZmKqagzoO1TT+9FidmXqIv55dPHoUp3o2CoFqaWvwGXKYkaNd3QLseZcyG1v+kzUHgH9Yima+@lists.infradead.org
X-Gm-Message-State: AFuF++nBpmC1TA3+fCZEvZfMvYi80NJHzOuT8nb06UCfp2Df0xkFbxPC
	1C5smvTqolcHy7nKwolqXNvbf21TchtCMoCFIz9CjavI/cVLPGq5TkYLuFehVo3IMYRfExJakDo
	mOemJV+zqoUlVYLapVsoqEsnC9cyBd8wen+hpLbnqb02pcChE+xhWVDo/dwmLDcHCqcchEKD/fR
	GogA==
X-Gm-Gg: AYBFou29Wbb+wQvkaHJX3QeTjSTdUTJraRYLeI9kkf0p8YqcJ2ARud8Qhwen8+hZ99V
	4W4QqqlIg2CBWoNKcGIPQ++R+kldsdYT965OjPV++lJ/cg5qB0A1y55ZGxHoQDDM6mHeRM8A+rz
	W9BETtssyJROUZGIkZSbcZqRyEoK/CCgNd8wf3qpW+uvcTENyrrVgWsBQljvU3zUpKl0YK1Pr3J
	oR2SENHuV07nBEhSWWn/5GNvZLnPXbcEoIpAvT43THTu2Q1JO5+2Uj7LL61uNC6QwG55cZ/hyq2
	/yhreekcPLvxqhgg8XxReiCoHuI7sLXQZQ0CI2iNdfZNMw6fYmrIaZlN0/5t0XO9jG4p1EG0xiY
	JGbNRiN2rmh5jWF35VeLZ398a5UMI
X-Received: by 2002:a05:6122:2907:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5c9f159bce9mr3537713e0c.5.1790176529595;
        Wed, 23 Sep 2026 08:15:29 -0700 (PDT)
X-Received: by 2002:a05:6122:2907:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5c9f159bce9mr3537623e0c.5.1790176529155;
        Wed, 23 Sep 2026 08:15:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm55126325e9.3.2026.09.23.08.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:15:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:14:43 +0200
Subject: [PATCH net-next v15 9/9] net: stmmac: qcom-ethqos: add support for
 sa8255p
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom-sa8255p-emac-v15-9-e82f33720737@oss.qualcomm.com>
References: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
In-Reply-To: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6330;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UGHFNsex6g8X5xVVwk+2JQcFTMSBk5UzaI5QwWng/ec=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqs+zsy822c9Upcjc3fWGOonm+493ecsXtKHWTy
 hldO8PYvW2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarPs7AAKCRAFnS7L/zaE
 w0a4EACP/rciP5pBNKDp/2I+HbmSnRxi8PQfuxVKO2rORNBSmMNiZcdJVegAOH8J5guo/HKr2F6
 Ww4oRSGLDyFKLJZA3hcEk3/OHR9ed6hhHggIQpVfzWpya1L+88OIeKzU90TWSjiq/YZC4YPzgtp
 HUmehsJwUnbMGGnJIvT5dfheltTL/cbsWDCOcxohurbMCDx40zxXhx5u3LuCcGQmXZB0C4M6mrx
 ScsQlwXliFtTYHcrnm6eP7g8a5tuecKuf5DnCEHCV1NglwXBqUijBp6uZezqwXuwiGvt+/IOXQt
 VIbzlrouxhb67nQqrdrQgwVB5fmtfYZtW1YA7Ogm3vmXepy0RYEmVi65BKIIL1EPzF8Va/o5JiL
 DUNFSPVoQfH9RDPBf/X3CGIwXKrVtthkweor97tELtT7AVMrGN3CWPeVKun6U+ASEPDvuvqAOdT
 dKFsxpeRSA+EnFQ/WibNDHQrdkLvrnSknSiNf26FL7dH6x+X/6Pq1K9d3kUgiV4h4ZPSdL8H/Th
 poi453B1SDwkxO2iwf4HOegf9ki+q6x0jIsbes+eAfSn6SV1Yk8p2leXHk2mMRlLTtvJG/xtnas
 LUyzQk7BwE033n/HGlfWD2xUIrzUvdMGYznk6oq35if4+LwhFrXikvckFT7fAl566XMbCK5/Mhc
 233/lUFo6GVU7lA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Ig_CMNtzQvwGNnI-bRPEU1FbMcSOzdjj
X-Proofpoint-ORIG-GUID: Ig_CMNtzQvwGNnI-bRPEU1FbMcSOzdjj
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab3ed12 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MNMbB-VoU2yS88OP0PEA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX7BuNEzfeHKd9
 Q9JJWFzYDGbm0hEgDLFb5TqhzvodUhwh24OXPO4oYakZz3N1WmA9HXfTUYw0WrMXlwHJnAbf4OZ
 lu0Uc2zyEjxbpg/mvSLppKeMwFIo8XQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfXwMWhXIayM8mm
 IQdr/yW4qMge4AqriUGiw6K5QFd2X1l6owtngyo8P9GhgKMoDhjX3z0lJrS82IvEaiYSw0kT3g+
 sQidBJ9RGOijpmGipMQT70+lX0DWJdYyzQShvqZFAqsWRt63CLZ/gNz4URKerM2X5jvU8/BK1zs
 +HKaSwIRJEOivZZ0kKae3GjFigY1BXUnAq4wDHkkKr+rhYzDg06insd7upQ2bZcazmoHPIPBLYv
 JxAWc1N0+mTQPuoOq8Q6uIi9NbKlOB4/hn/bpdUUKyzneM5hBVglHaJIg2GovbsjTwJtNam0iA8
 7PtCnEZ43x53mkw6TFhJK/maJndBbgPDv6Cn2kxsMiHA+NDP0OP2bWIypi21V7HAhl7mJ10K1z5
 1oKOPyUkhwkRESGxxV69hZ1NGERg13X7l/8zUGAVljhZ/zC6GxStPkHbmPG7073Yn9qfFxjuGi1
 kxPpe0ZcYc5/CuyAudg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_083539_132875_E5699C7A 
X-CRM114-Status: GOOD (  29.44  )
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
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 509a5368e69a8fa440bf3b4f58f7b09a683558f3..3d4bc950a72ac0d0d9515bf9148e865463ddc0a3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -98,6 +98,11 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	/* Fixed PTP reference clock rate, used on SCMI platforms where
+	 * firmware does not implement the clock protocol allowing linux to
+	 * query it.
+	 */
+	unsigned long ptp_clk_rate;
 	int (*setup)(struct qcom_ethqos *ethqos,
 		     struct plat_stmmacenet_data *plat_dat);
 };
@@ -108,6 +113,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
+	struct dev_pm_domain_list *pds;
 	const struct ethqos_emac_driver_data *data;
 };
 
@@ -207,6 +213,8 @@ static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 
 static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 			     struct plat_stmmacenet_data *plat_dat);
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat);
 
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
@@ -311,6 +319,30 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
+	.has_emac_ge_3 = true,
+	.needs_sgmii_loopback = true,
+	.dma_addr_width = 36,
+	.ptp_clk_rate = 230400000,
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
@@ -756,6 +788,80 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
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
+	 * wrapper bit that loops the PHY TX clock into the MAC's clk_rx_i -
+	 * needed because no recovered RX clock exists yet - is not
+	 * configured by firmware. Without it, clk_rx_i never toggles and the
+	 * DMA SW-reset polled in dwmac4_dma_reset() never completes.
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
+	 * Register clks_config to run on every subsequent runtime resume,
+	 * which stmmac performs after the power domains are on but before
+	 * serdes_powerup() and the DMA reset. This alone isn't enough for
+	 * the very first reset done from stmmac_open(), though: probe()
+	 * fakes the device into RPM_ACTIVE without invoking the resume
+	 * callback, so whether clks_config() has run by then depends on
+	 * whether the device has already gone through one real suspend/resume
+	 * cycle in the meantime. Call it here explicitly so the wrapper is
+	 * always configured before the first DMA reset regardless of that
+	 * timing.
+	 */
+	plat_dat->clks_config = ethqos_clks_config;
+
+	ret = ethqos_clks_config(ethqos, true);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+	if (ret)
+		return ret;
+
+	plat_dat->clk_ptp_rate = ethqos->data->ptp_clk_rate;
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
@@ -843,6 +949,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_v4_0_0_scmi_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},

-- 
2.47.3


