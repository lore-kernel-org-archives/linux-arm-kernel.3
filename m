Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74B1CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 12:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSpZvDklAuE7Px+3pmBQmNRMPaP/hmhQOnKgPjG2M9Q=; b=aep2Lw07uIDNlebFsH4nl097Fq
	PSQVnMi6F7VmA8XrjEGOAK8RhmNMIRs+I34eLEOWn8NE6zBTJEUkd6W5TjJOlWD/cWisCqArVwyw2
	jTdxn55PzxaMlyeMxsgPBZ0CGfe3XaemS1riCRQYMBbLrAWAAH/5mCrGihmGIUt/DmyRRQCsaXiWc
	++MSiuqh3IRfarS8cpV+kJj73R8XigNXaJaXGWsTY0U5Z8rpoRJfMVCGBGUCz0ZQYY7fo3GUjpKbX
	uPIpBEpfuz6Z2y28vNIxyyLVW2F7YYDF8LtOGX2rGPjqb8eL8BHYVGIj8N+dCd6tv85Ofu/Ean1Sk
	vnugmPjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyET-0000000FRnZ-0WXE;
	Wed, 14 Oct 2026 12:37:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyEQ-0000000FRjn-3czD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 12:37:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EC005g2087981
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 12:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HSpZvDklAuE7Px+3pmBQmNRMPaP/hmhQOnKgPjG2M9Q=; b=X9h8osMaq9D2iy0z
	2PFcQUD4l7Qq6HwRsE6sklUHygN3xTYsLtJv/3QFURff7GmrxJPUqFa3/taifgY7
	cor4ZebDvuqyrYmKTP9av8sjIqANT1vJScz98DPcCpIo2MqH0bXGiURQGyRyPesA
	sQ02BXTdCGyED5WI4uE2KVkDjNPPkb+ytUE7GJD9RYmATyxLNCW1xQ8IrCO2adG/
	ZKTPbV3JXkHLgG2jqz+1p4eKORYqG+rFZHh5yqVhFgfEQyMUOzOJinQ/xAV8ORr/
	1CpcI9HFRGnVIF7zfV72FM0xJ1MpNH2/ok8q4RGSAkhnYdVqcTUjfd468+0oEiqq
	JU9vIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49jubd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 12:37:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so1112255485a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791981437; x=1792586237; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HSpZvDklAuE7Px+3pmBQmNRMPaP/hmhQOnKgPjG2M9Q=;
        b=CN/6/FQ0yTJCM68udW/9yRoTx1UeDbMiyow0Z7P5Nb/XBAOa/lbjo5R9a3r9SI7cg6
         XMzcnWeaQMK+m1agIu7Zr0UQauk0ypYXU2GIDr7kBHIuAfsDFCTH7ditJZjRwqWe/3xl
         c8uLi5sAksHqEmSyRPfN7331WC0In+FfqqlOnh0dfgcWrC004Jicn10lI29XltH8i8sr
         Rcwo923hba1A6L0pSlUrTLjQhoXWsm91RAOegBNQrqQOdi/PHT5txTu01dEu6suOHw5M
         oeE1kAQPnrItQ6Ec4BGsK9b78DsipLlO0a0GWCUS4lVhfUxOZ9T6hqnQul9v6Bj3A5sD
         Ezvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981437; x=1792586237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HSpZvDklAuE7Px+3pmBQmNRMPaP/hmhQOnKgPjG2M9Q=;
        b=wZlWfsz16J9SNUxqCD0ipz5SWjNBgbtfFm6rrweTzDZH4r3r78UYd5eOgD4lsyKefK
         vupE5JhU/hjr65hY8Izz2tI9ZyL62SgfWJhR58Q3Bxwr0ibqb/iZwkFW8frp5AiJowFd
         1HmwOWoLSfHKPLf6/iKMMiBrxmSSmLum240q+OPL5UrcvzSy81zgvkWS8wYOoXIBuOG3
         8d4KMD3I/63T+sg0BRWj88qHiO+DtzglAkWD6X9HDq/DpHt5maWmGWHNPf7SnwViSIH1
         kS8ODDn6JvDQa5mrsgw19jEey0nIsJFjx5xbxEcg7KTb3uBsKWTZ37prN04D38ArqnjQ
         ObFA==
X-Forwarded-Encrypted: i=1; AKwUvBzRPaUqnA3RJ9J/t+BfT1qpC8mi0D76+0/TLG/wv5SNvzFra6KSRZlvpTSBMtuYG+C8GZ4lfRMJ1qGhQPcanY3P@lists.infradead.org
X-Gm-Message-State: AFq9FYLJu9zIH+xyajFwYg7Seey+s/PQNLWNJ8j3Bdhdj5d/7nY2QOnA
	kWnZdK/HNBkTtrDCATiSz+xrATUyqluegb5rRndzFJyVSWWI9Ma/CWWJyLdTZ7lPKEz+7fOniwZ
	8+REp4f1K0LD2ABgshP8WOgP1UNBeeIWVwuJLP135vud5mvfM0MIumPIDOeLfVuBh+IhS9AlSHV
	ndeQ==
X-Gm-Gg: AYBFou1bCL8ynWCqUurt/o295vFsfi9BipdX90lmwsRX6ay/VDPXEdkhhAE29cXOMPB
	Qm+oi9CBRgg7OjkJWkdEHQGeG1KW5MLIR2etNvrnwU+RTNkGtqpz+HDBNc62FbheEUBA3iuASup
	DyAnM83Dmw+XeHDQ+JcuwyvxStoxJIyx4/aeMdRmFjJxe0idHEWKlhetdo7YaYeA+AMqs4XCMnK
	tspoejUGwMVo1Z1X//jlX38cfqLjLZzGju9YjlckThPjaU0ECts2nSJawK/KZlSaJLT1p9mGo2n
	Kfv5M3ctwc7fWeSJnIhZ+dUlk8uEEgZKByXwTfKYuvhkw5sDqK+riPiXTMJWhg+r4zpYPh2wBKH
	zRqw2N3RB9Ld8/LOmyfPVR7sBkR7q
X-Received: by 2002:a05:620a:4611:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-93ebd0c0178mr2571768185a.3.1791981437390;
        Wed, 14 Oct 2026 05:37:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4611:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-93ebd0c0178mr2571759685a.3.1791981436618;
        Wed, 14 Oct 2026 05:37:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f318c31sm206122615e9.3.2026.10.14.05.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:37:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:36:42 +0200
Subject: [PATCH net-next v16 3/7] net: stmmac: qcom-ethqos: set serdes mode
 before powerup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-qcom-sa8255p-emac-v16-3-0266c2ead980@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
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
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=J9yeJClaAz5Pqb+CQAyiL1LQKIlwch/5HMt+VwNv+30=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz3dnI32DHykdHRara4SxS9EMHllBi8RbNpVvb
 4nM9bknjESJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas93ZwAKCRAFnS7L/zaE
 w7dVEACYXQEJ83Q/QRV92yGB7cs5znjC4RvZ8Gfcv+TeLoU4qXA+kMEYugpyaPG1/YjlURDT2ZB
 uAFF8SeBV8Ul11R3yaqpMOdy/Hl7TvT/EtEzZ6o4dzkfE58+4KvCKwJGZiv7Kd8yfw6QS5+a/Lm
 JKKUte4f8WA+SI7SpSpXO2blXJ40JKryYVK5Dy9F8cFK69kDBxcOC0goo6+j3BCbH4ZKku0y4Tv
 HeJ3OWXpkVz2VhcBFRQaWC3sDZ5KsN+DSaQfxTNsgnjI87WXvtyR0M7msV6/0tqCSoIDlN1RjOT
 6JuM3kGD9PqzYuwRy7zmFVsVpLou1oeZpiQqHwjBPHYfgb3SHhtRI4bqhqCvmgqoSWuOF87veTz
 Pcs0S5b6MwESHuClnn0DEXVm+/SOqqMcDXz9BHQERa3gYzglJxWogGmTU2ALIMst4s4GqhuoJ9l
 zbE+Y5xRLfDEJPwI3Tv8OJVjNwhUe8PwTqsecOd2XC0cep7xtLfwFnFmlXJ3b/hLDdGxFzkhRv6
 SGcerBJ4NUdI9sNVqm2xZJ0aRfmhaw5oqL7FnYYlHX6NQsHMkiyiBC1Y4LNYg1vQZ40YDfx5Dgo
 gsQgc+L+xsjrtl8c/6ZfmSizWS0cJ3hykju0KOVf1Y0iqcifh1Ug1TdZlU6TK+tol6J7O3QeqRi
 SK++5yF89e03Oxw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf777e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX6I0WER4M4r2y
 Y9qmmJPGfW5JJ0p0OsSZFGxAwIcwL/ahT6t4FLha4gqAv4VMm1zlFLoWD75Rpy7JBNU/U3V61LN
 u+NpkTWbay7pB8E4hPJLEG0beTt95qrzYoV9fgDnYJq6HVJupvpNoP7fukG+qRej2SniGwoPHhm
 VvhSbvbQMA88YFPCYeiAG4n4R3TTG+f2cUY9i4jb2ilheSEb+Xk4h14XFc3gJGUjfqRTQh5Nazm
 qS8FaDzZh/V+o392dUtgUsyo3N1MRLPCHMbPWTNbpZInMGk5sH89kASApq3+ENzTfyLaShgDrRf
 wrb5dlslOG63Rz5qo5uD6hW9ue54RL2UhU+KFOkcyCzGjDhXCQuLEixOEh6EwiJEANiHzc9yjGS
 DpqwneNwErj/CTu4Kodye+uFkv6wudYBZeDI7n0q6Hnk77iRig66e0/xmymHXXMmQrZMDiEX4zc
 jlJrTDzR1uOkTWjQ1jg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX6kAV/BVtSumC
 Vu5KV3wT4gYm/Dnu6/6Z9QEZlZbarX35pYJUtZFyBvuK7ACaWU/qtdU+MJGsiwuPmphdPUtoY1S
 +lnTm5ajfNCWE/Mwb+UoKda2lEoCfEc=
X-Proofpoint-GUID: tJU7yFrCPjpfej6lt6TM_b6NUoxg9-dR
X-Proofpoint-ORIG-GUID: tJU7yFrCPjpfej6lt6TM_b6NUoxg9-dR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_053718_928907_8A3F3CFB 
X-CRM114-Status: GOOD (  18.32  )
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

Call phy_set_mode_ext() before phy_power_on() in
qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
SCMI systems this is required for the PHY driver to select the right
performance level - which translates to the link speed. This is done
ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..e2e611a4d2c06bd567e9d5e353b3a4893623de6c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -601,10 +601,22 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	if (ret)
 		return ret;
 
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_SGMII ||
+	    ethqos->phy_mode == PHY_INTERFACE_MODE_2500BASEX) {
+		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+				       ethqos->phy_mode);
+		if (ret)
+			goto err_out;
+	}
+
 	ret = phy_power_on(ethqos->serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		goto err_out;
 
+	return 0;
+
+err_out:
+	phy_exit(ethqos->serdes_phy);
 	return ret;
 }
 

-- 
2.47.3


