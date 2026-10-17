Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BE0CCF2C7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 09:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfckEl3IcnVkY7Pf4v4qvGlwsl6ZKzWvWMhQSdWe8vs=; b=TEMa3rkmKaHmiDxcJjMAgw+tw0
	QYmHPe9W81yw7E3HWoW+/E1BX5K6wS6Utd0pImM2wLcasKk/qwAJ8Y0O0jwWciPUWJELw0WrmQuo7
	p3WEDopNt9/5C0tyuSzxkRNIcQoaPEwaYO7U+BkyyRam4wD75GcofTgjzO4p1fVrkUmxbh9fd0VsT
	9IVMgJNBvemxQaVlB6y1XG8LnXaBl3yU1QCXCJ3B0+5NyeZdULBLkEyiFGMODKKwkRQWwxI0RBFUs
	IwlZxQ4naVxHLNYq8ID7S7DvagO7WDY1ie5hTLp7E4II7sSo+YOKPSCVtKqEZUUXNiE+a+9bwyDR1
	7Mu0aLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0zP-00000004dSY-3XOQ;
	Sat, 17 Oct 2026 09:46:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0zL-00000004dQQ-09pr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 09:46:05 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6o2Zq1402798
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pfckEl3IcnVkY7Pf4v4qvGlwsl6ZKzWvWMhQSdWe8vs=; b=kxjV7dJxLjfKltNO
	I9ZYvpzv8Uo+msNoR4Nu8NQXvYhOazPFTl/+h+0eVCyRBBu8pwohXTCrVzkN2QlL
	wrmA+EvPVbt1j1Lb2A36//RnGzTR+D8hpx0IvKX7Ya6xVlJ4I9MzpJQFOyiJvVHV
	Jb3sX+J4PkD24zKRZQKFKdkEdUwZVZmrPk6zIShs00cAwykU+lCNBMhxzAh1Fs3s
	HFM46dRTwJSN52QNMVBg8pdoI9ZE4dZkEoOrfOzxZzqMhReK6h1E69mEnPl+u27t
	HiUflN86VPH6AtCQNPQ6Mow6UGg4wLJvMRwbS1RRNIobJecxRanEv8oYuvwV7bL2
	fPcXdw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys0sau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:46:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so2584308eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 02:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230362; x=1792835162; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pfckEl3IcnVkY7Pf4v4qvGlwsl6ZKzWvWMhQSdWe8vs=;
        b=FZb8WhHTL1FMLdCJzJ0SVLpLhQr6P55B7Zhko8d5g7j/LRtZIjy7EAxE8TXS2o1jEU
         I54jsJKDr174fzWZyq77xWLtIrvsNFdusnebBUz2/NIbCwCu0awvCCEJMiOtsEWpfXWQ
         uXGK2MmL2+KUdGDHlF6cQCEX6xI1oxqnYeZOLgeRJhBZ1PuTTGBpfuI7TpVmDyrBi4W3
         ad1pdR+B9jkxgpPOUvkw5p/1efgrwpuErPzRBurVbeRLSFWbcsQxyYoz65c4yDTgNyCY
         qq5zxXNERy3h61ijuB3MUmXUaJy91RA8NgvWDl8dUnIWrBTyvR1l8c7P8nM8VY6/TfB9
         x6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230362; x=1792835162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pfckEl3IcnVkY7Pf4v4qvGlwsl6ZKzWvWMhQSdWe8vs=;
        b=WA/hN56FHtKTr4e0I5n/UFgU0CmW52sTF5blnjU+HPMbfCwVyrD6yEDi/n6T/lE0ET
         vJ2jzT8+n8pupQzrXf71RimFHjaPYf2ANePeAJWy4ORkWo3Io/wHKJPP1ASOo3b0A3LH
         4G/vW9KlWH2HQHla4PpEUYDPXbdwE2xbWP8+gBwbnyS6xiaCT6axo69CTCqGBS3TThGM
         YkAyVe6JnLsgdqbbtTdNLf6C5qFrn7ILgnGNKJl/kJkAIIzwwBIdfvJmI0+tnCDTcGE+
         E+dmJxoJw8gRTp+BNrXadqnBZgOesvwpyV+VnaunopGeXP275BHCyHI4Ad2MfwTzQZeX
         X46A==
X-Forwarded-Encrypted: i=1; AKwUvBxGQKi3XxEuHzqw4oI8KT3Ad3SFZpXIof4hDs9Rjjf01iwSqBtfoIbu/5IUbR4bICmjo89gpbp+Xicai/9g3bWx@lists.infradead.org
X-Gm-Message-State: AFq9FYIpdyJTdgBKcf26yTbbp/8MJthjV5VvWsMmp0V+xawoQX1f50M+
	rb6F2I7D/ZXY+ny8W6ll2U7EbjKjiRDqnKra34zGGIrYQE35p8P6HHMwVF1+pSOvzcNbzZp8Er4
	VvK/8SXhb0vWNnCTsO2LX31Gc07d+Qf+12luDPRZmQxBTt5kw7HbT7n3DlUBPGIbl9J2sefEitp
	+SYw==
X-Gm-Gg: AYBFou1NrbJb8321DZxADuSFJRpWvoCon6aE2ZcWD56ksPEScSEK4gw39Ol7GROGY2D
	mO8P8+EEvnVv5czpjbw2ynVita2I3XeBqRxpfZqmCFZQCjvXAKCrkora3Yj0mAUFhGMkHrFOWsg
	+oAV/wMEf012ZUkYYZzwkPw31m2r4XAhUTQ+udVoa3wGQJF8iSxuribGwwvGs5Og07kkDOb6arH
	+Cw+ufm/NdWwvYT3vJAVxsXnmDizELD14rMbczhKvUESvZ8CM2HO8QqULCNmXfrvbiEZIuYOIPf
	WziEEGoqnCYI2wY2bFO9zxXIJZBFaAMlVfeZFKUgWE7fb7Q2vZED9gNg1ubexHFBX4aJXNKc5V4
	EhrAPyLHtvrUDerx56pA4GapAVi4ymQ==
X-Received: by 2002:a05:701b:4205:10b0:13e:5a50:1e17 with SMTP id a92af1059eb24-1850ce9ee29mr3318604c88.3.1792230361869;
        Sat, 17 Oct 2026 02:46:01 -0700 (PDT)
X-Received: by 2002:a05:701b:4205:10b0:13e:5a50:1e17 with SMTP id a92af1059eb24-1850ce9ee29mr3318569c88.3.1792230361204;
        Sat, 17 Oct 2026 02:46:01 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:46:00 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:14 +0530
Subject: [PATCH net-next v3 3/9] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-3-26a8beb44b8f@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
In-Reply-To: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=1980;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=2bHle8usOz7stMcOKjPW6Ck+8BCsQA4wAp3DcdmEdaY=;
 b=QOBNjUqJrPp7d6DBkbNll45dJKWWoPDuA9jG9TR5UBDh+gHQv+n9pBRxzKj/0AxrjsTqZgZKS
 JPMRXXbf1exCvJmlgRIiyi19zvKQ6GzVuUPNOolfs4gFjlp5n2Inh3n
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX72+KgqojMOrr
 fVBWPLLQkf0pu0IvIFMu7x++taqrMPeyXEykMwQJoc97l1ZVmuOUSNbWZLgY9b5/CkUGURs+vfM
 T39/z1Jb1ALiDZggAjahu0XYhPERj7bjv//mKkbhJ7rVR6Cu5TSeR31JkLCnASDGXIpTc+lzTsr
 iAQ1GsV7Tc/3s9r9VYqV0lTFC3t5gm3mbxCiQAq8EePxK/vZHRcZbXfi7ABNC33G7UyLQsTDWdO
 VjVbzWQVhaBPFnOh3pTpIcBqTYGrkJ8o/2Jm+qzqK3tDkTcGnBRRgrYd7mL93wGuABuKmydyV6B
 Bjv1m/54E4qPP3lyd1MMFXAH+/X3js4JDRvY69em8a+LGk7nOUYdmgictWuYzI0i5SZpdY1F39A
 8f4A6PBq2xE2gKqMURMQPVQc/rPEL17/InIzqyDuaUFmkMPzBfH1trH4OWgCyYcfbE2/gR7rzrP
 Qgg//wfUWZQS8igYU/A==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad343da cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=Vjzh3eGJV6Wj_RHhdNYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: HiGhVEiMAJ6TWH6M0IlzTP1gKdfRIDSD
X-Proofpoint-GUID: HiGhVEiMAJ6TWH6M0IlzTP1gKdfRIDSD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX+3HsoblBQ6/A
 WVM9AnlV104o40ZsGmA09hPlqEtSsxiBLo7lZVWPksQag4QyuSoyMPCwrgRRCDAWGVlwEvu4W81
 r8auQucLwgjYTercKzTvbiBeCA89cuk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_024603_096349_FC7774CE 
X-CRM114-Status: GOOD (  15.54  )
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

The return value is never checked by its sole caller and the speed
validation duplicates a check higher up the call stack.  Convert to
void and remove the dead code.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..44270c25d874f72e7f971757fec659d36468c315 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -371,9 +371,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
-static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
-	struct device *dev = &ethqos->pdev->dev;
 	unsigned int prg_rclk_dly, loopback;
 	unsigned int phase_shift;
 
@@ -384,11 +383,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	/* Select RGMII, write 0 to interface select */
 	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
 
-	if (speed != SPEED_1000 && speed != SPEED_100 && speed != SPEED_10) {
-		dev_err(dev, "Invalid speed %d\n", speed);
-		return -EINVAL;
-	}
-
 	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
 
 	if (speed == SPEED_1000) {
@@ -479,8 +473,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 
 	rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN, loopback,
 		      RGMII_IO_MACRO_CONFIG);
-
-	return 0;
 }
 
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,

-- 
2.34.1


