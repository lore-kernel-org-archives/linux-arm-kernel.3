Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F596CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 18:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVzOoLNEuPfZZT/bNo/rgtUOyCTzQansB3UIDE8kQC0=; b=Vbb3TXaiLOZOpJ9jOU1KNyAmJ7
	9FxQFixajv4IFWptgAPjtX7sAzjebGmnNo4qlu/24mWFxoU7bUZ7K97/9nbveci6xsyyie0hnBO83
	xXlCn1yLAAXL3PKYUo0K8T0UT90kRTzDgaevwdjigcssljkDN3DsrAsDRhCfuQVXVId1lSRFCBvnz
	jfv+i+r77TUHHgUt304h6WuBqjiIMieNXJwFYVpVX+o8ovkDYKbWbjXWsIhph7BupeP98cMxQHYvm
	55je+rJPg5SQra84+uyXs0uV/4WWCPpvYaWtZSIGqPpiaG4skionPBVI8rWIIlJjE0oACoMoqriK7
	AWy84w0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkHa-00000009tOW-329K;
	Thu, 11 Jun 2026 18:37:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkHX-00000009tMh-3pqL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 18:37:37 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BISXf61302638
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eVzOoLNEuPfZZT/bNo/rgtUOyCTzQansB3UIDE8kQC0=; b=F5iuHgXgf1aSnynX
	P0axqcV/oPzWvCV+xrFy8Yb39DCbQeQiEeyihNrwxlea301CnoMJ2l2boBAlm9Tq
	7XeMKgdqY4Dy/UAmDLJhMy+zADavzOwUjaqoesTGJJZYXUbmdowcGLgh9iLa5n2E
	/zaLl7u9Z/MlXSGq/hPEvbdjR/vdkNj57Or1TgRCEjeM2nFsuTUEzhaIpvgN7Qkr
	+MIIn0DDoL86GpPgH0mA9wXl+TdHQCeghEovmNqJGgJB+h7QdfbVXeEJyrAXut/h
	ZNoRplB4M//3aShd7eOuoBxHBm7GuD1Lj5VUuqiPsDblWBqF8gvjVMYPlBp6unki
	hRqDpA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6ud4bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:37:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c860544c077so119090a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 11:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203054; x=1781807854; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVzOoLNEuPfZZT/bNo/rgtUOyCTzQansB3UIDE8kQC0=;
        b=Dftrnp11uVimBgCpgDSDwrrpTtykpeSNi55SFPIUtMlRaSnhFVWBIQlXjZ+Z9wU4pF
         p6+PNKKNhka1+E358T5H8hAQTKrfASX0T8PvOfcgo2WPv0ybiX/t0XWA6AwRiHmNYQOt
         uNkVh52FEkE4+7v9P4H3VOaMcirKpdaU+ky02yfDXyB+/aPgBCE5jzUDtvzSLQhW7vqM
         Hq+2P+rNz61UgRpY95q4Crv+neQK1wN4fefBiEsF29kvunCMDIXmcBY5exQdEYYSd1IE
         4QWGeZIl3YVykgsH1HfuFAsqBjEmKv0/yprfaw6iS4htqSG85njEWSDjXZBP0rvaxbcW
         9HFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203054; x=1781807854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eVzOoLNEuPfZZT/bNo/rgtUOyCTzQansB3UIDE8kQC0=;
        b=tCj7+xHuAtUOOXOnKU3K5R6yCIl7zUvNQYmGkKQYG9IFZ0ZsLxpdemosPMVFdcUmki
         ckme02D9ju3YUVs+zvurmzFpazcp46fW7WMGgDS83GuVg5Txpkq8ELz5JqVE9nxn0rQD
         MewcWqnxYt+8JxR10FPD4au5i+7FsLDXwK8mVMKVy11tCwCdg0LB1fvzB1BsghN8qd10
         VhvkYrj0zuuBNBWNEuptGL9tHxsEP8O40RB80ncB3xeWO5tYP6oHT77erKowz7Mlrd/O
         S5A8hyc60WLlwHeWfLndabTdW42D6SLF2XEnqZ74qc22Jf4m3tcQbFxU2PYaMXKHaNu/
         OSQw==
X-Forwarded-Encrypted: i=1; AFNElJ9KKXcfWdFZayVV57jY2ixe9Ebuvz9JfPLKTNMZrdRKJNDQqpU7jtlFTCWGYda1rn5ZhVvDOclN5EvBLx56PuvW@lists.infradead.org
X-Gm-Message-State: AOJu0YzU2jyEa5pNlpdSC3YSOXV6zbsMT4P5+ybBWIHa6PBf32duiXgZ
	OJBMaA/yDExw5xgCt7enma4oIq5WbhjTb6OvEX+nq7OVKAJtN/DIGBdmAZuDibxBzDwUOu1RMvW
	C/6CzF5vq64kZtVqMNAwC8w5renoYz+8OlLOTQ0F6jrFhoB648In9wP/7Yi4oZawcLOa7ewzXwF
	tlmQ==
X-Gm-Gg: Acq92OGoLvjokEypIrRm+N+mU+5FaGUu3GVKXh3jrbWFDH64I4LdQd177OIlywd8mJg
	ZfXujy+NwZDvEo8zYWppHBFekFuGYQ6akb3sMCCa3G9iSgkWDQFCq3r/g473VR1nhvRyLqi9a9L
	SmjryJL9ONudrIJeKV0L8q3O6/BUd/TBBDlH0GfPwBhM2mSH3fAJZdqy65l0Acna/zk9h+hDUfF
	gfIltoG9Ab/yZbUzez9M6ZUWV8M9T0Hmzbm3nn0fingI8u3aqashM+yvzTJDpyouKff4CRRwACz
	ZWCzh8n9vd83MmSbhlKUQKrL9qo0PTg4IcnhLGplxgIdE07lmWMGZalQXeEz06VyQOZptFJMU24
	oYSguPQUsTAmvH2vgEr4eDMClKi3jYpsCe47nNgMjwbEP88Brc4k=
X-Received: by 2002:a05:6a00:4487:b0:82f:9407:d167 with SMTP id d2e1a72fcca58-84336e079d6mr4799941b3a.38.1781203053915;
        Thu, 11 Jun 2026 11:37:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:4487:b0:82f:9407:d167 with SMTP id d2e1a72fcca58-84336e079d6mr4799886b3a.38.1781203053392;
        Thu, 11 Jun 2026 11:37:33 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:33 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:06:59 +0530
Subject: [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode to use
 DLL bypass
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=4799;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=GtqYv8yTeq4PzlXpWMuFX96v7sPl9ApaMmizTH0wFJ0=;
 b=A+o89b25yP5p1Mg5UsjerNAHlaA07dc6XakrqeXi467eWa0RjVcP6DjQXPcaF1Q9iH4lXirnO
 FRUuZjNj+8eDbM88yMdkC3X/Cmd6n8mAbCu9bcJ0Qil2xlIc6WbjsXV
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX7RnrxmnQMlpQ
 z1oHBNvJH+BFSdzxYCnSHK15pC5+f6bojF1HXrmYpn1ql6xHC8yn77lbOPV/EBr4aAm6+d9bNSL
 UVvFtHuZJuC+luJm8zQLtbKTkc2/hzo=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2b006e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vSCEUKm3QqZMBpSZvnQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX+oVyAeH+QA4M
 dxaq1cqGzNfwHlHW/X5YrP++xP/3ihF9fI7MiuxT5gJa5ZF9paij0XVWeD0cSBZaQWxZ9yNyER6
 +y3BCVWjr5/G4dQjhTZ0W0gCvTcr7JdbwqakAPwLn6ivwxpV3FtuVURhs+N/ZuCMmu4WUb70CKj
 rWVgHPj3GenyydnFOSFo/CDfy7gQQrR3BC/rw9TygOBSJ05rrElGfnusx5wgYhrc1z+1pSjNC7n
 CWc5XoqgVnvT00aWlw1bGFJoxwaIz8k89zTb7eYht/QL0OE61lxJUTjC0CURJ7twEeyipImWrwR
 o316WJKnw+9/dt4e6DJ43yoMZVpkK7LlZNtdNhAYYz3x2UyiFEz+7lrpXzxIdBYce+Zi5D6zvUv
 yvCR9DtJI2iTFwDpz4x0bLUWGIB+VXG+BQ2zjb5OTFF0M2NHnEgu3yA3kT3vDSeX9FrdEckjLWP
 xG7fO9WiasuzZ4WXktA==
X-Proofpoint-GUID: s6jbpm-nJP8Rwm8FmiohksTWk0DWGD-n
X-Proofpoint-ORIG-GUID: s6jbpm-nJP8Rwm8FmiohksTWk0DWGD-n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_113736_079825_9024019E 
X-CRM114-Status: GOOD (  20.16  )
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

When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
the MAC must not add its own.  The driver currently falls through to the
generic DLL initialisation path which programs it to add a delay.

Power down the DLL and set DDR bypass mode for RGMII_ID, then program
the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper.  Also fix
ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
100M/10M, and remove RGMII_ID from the phase-shift suppression in
ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 65 +++++++++++++++++++++-
 1 file changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 44270c25d874f72e7f971757fec659d36468c315..bec08f1eb8cb41484ba3c91c77393e163e7fd071 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -67,6 +67,9 @@
 /* SDC4_STATUS bits */
 #define SDC4_STATUS_DLL_LOCK			BIT(7)
 
+/* SDCC_USR_CTL bits */
+#define SDCC_USR_CTL_DDR_BYPASS			BIT(30)
+
 /* RGMII_IO_MACRO_CONFIG2 fields */
 #define RGMII_CONFIG2_RSVD_CONFIG15		GENMASK(31, 17)
 #define RGMII_CONFIG2_RGMII_CLK_SEL_CFG		BIT(16)
@@ -183,7 +186,15 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	if (rate < 0)
 		return rate;
 
-	return clk_set_rate(ethqos->link_clk, rate * 2);
+	/* Clock Rate Requirements:
+	 * MAC added delay: 250/50/5 Mhz for 1G/100M/10M
+	 * No MAC delay (DLL bypass): 250/25/2.5 Mhz for 1G/100M/10M
+	 */
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII ||
+	    speed == SPEED_1000)
+		rate *= 2;
+
+	return clk_set_rate(ethqos->link_clk, rate);
 }
 
 static void
@@ -405,8 +416,7 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		      RGMII_IO_MACRO_CONFIG2);
 
 	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
-	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
-	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
 		phase_shift = 0;
 	else
 		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
@@ -475,6 +485,40 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		      RGMII_IO_MACRO_CONFIG);
 }
 
+static void ethqos_rgmii_id_macro_init(struct qcom_ethqos *ethqos, int speed)
+{
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+
+	if (speed == SPEED_1000)
+		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+	else
+		rgmii_clrmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+	rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN, RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL, RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP, RGMII_IO_MACRO_CONFIG);
+
+	if (ethqos->has_emac_ge_3)
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_setmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
+
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+
+	if (speed == SPEED_1000)
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_setmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONFIG2);
+
+	if (!ethqos->rgmii_config_loopback_en)
+		rgmii_clrmask(ethqos, RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+
+	rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP, RGMII_IO_MACRO_CONFIG2);
+}
+
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 				       phy_interface_t interface, int speed,
 				       unsigned int mode)
@@ -493,6 +537,21 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 
 	ethqos_set_func_clk_en(ethqos);
 
+	/* For rgmii-id mode, the PHY should add the required delays.
+	 * Therefore, power down the DLL and program it in bypass mode.
+	 * Program the IO_MACRO as per the settings recommended by the
+	 * programming guide for bypass mode. This will ensure that the
+	 * MAC core doesn't add any additional delays.
+	 */
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
+		rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
+		rgmii_setmask(ethqos, SDCC_USR_CTL_DDR_BYPASS, SDCC_USR_CTL);
+
+		ethqos_rgmii_id_macro_init(ethqos, speed);
+
+		return;
+	}
+
 	/* Initialize the DLL first */
 
 	/* Set DLL_RST */

-- 
2.34.1


