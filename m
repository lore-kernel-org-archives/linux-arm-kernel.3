Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F36CCF2C7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 09:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jcjbR8An16SR3tP/GJFloko/bvbeikqy8AxazhWq948=; b=vy3tnmmvevBDqrP1XGj2ZxGRKe
	vdSp+DVuQKgawnJcwFVSBk9Dc9gbC0l+N3g5oCA05I/h5qVdsFYlJGuJQvfG/oAlXyIWfx3EaGKWX
	q/fQysRvpKV0Y8Jlcgo9AezSAkA7qyOKKCELvd5olZGZk8y7sUm7UwJIfGrUfVknrq9tLIdR1wlQL
	z+NzzaklTSHiTLWDli/G1lh7b0Z9zJEy5z1NROF8/MlKUf+3ljv0FGsYWiWnrRYqnWFQQfXtzTfEf
	a1/dkuDLaZaf9YGPl7uIMXSlJ6yu5wCNYxpGEScZY5ittDig3mslbyTdrt17yw7cDD3bOzfGYuc1q
	+TWpgLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI10L-00000004dvj-0sFC;
	Sat, 17 Oct 2026 09:47:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI10G-00000004dsF-3WZP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 09:47:03 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6o4K7813241
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jcjbR8An16SR3tP/GJFloko/bvbeikqy8AxazhWq948=; b=jd9hXNKAnoAHYnvp
	UHBT2ccQ94NXStz29JbncN58ob5j/+V/7QFALT3RyO0krTVQOywkCKQL/IIjZd3U
	Pq/iXiZe2QseoYB2HWiq2ykUlUmkFIaxGUUNYMDRLIt7/jg9NZjZzP5SzVW+gCJd
	KSBZBqfrKbjjgXjyhCpXGx6DIxE7g88JPpLGPfhLCgSgjXg8NaH7IGWmG+kuIzNj
	S8M2221cD9TpCqtJli3RpyFWwTeJzsFgRYEfLHJ5OsDEkFcumxpFgvCqaCPjLtaf
	rNQN4Y5xoBjbpvnLk7T5OBdDBeWuMzMBnqCSALkZf2hwl7SOaMrR65x7qWf/k8aW
	rz9tRg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc016grfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:46:59 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so2510964c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 02:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230419; x=1792835219; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcjbR8An16SR3tP/GJFloko/bvbeikqy8AxazhWq948=;
        b=LX+l1xl58PWxBeIwv3vVhzyjts+VKHaZy+GqSC3uBoKavwszTS/DWjIyhAdUsKXyhR
         dRKMNraoI1z1lnmwDh/CCJGyp1OYeV+0qojS14wtunB7s1MQmCFR8ww/0SftdlSm9vLL
         omFYVbMiFnYUU8h/cmPhsXt73FzsOLbpMDa7nbmmhcXEvXsgnAQ7YPggnlKhDAeS15bY
         1xQu73wjc0l9gUEOD5dFeYiSmIIIPjcI4oIPOw0a4VS1WcrhHf6pZW2ps+Xxj7DWzP7e
         br2JqjhDY1S2uZKICL0JnR/8GlC0xPP0O/i8SuNSRe/f19B0bHCf7sBNGWT38rM1bKKk
         zAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230419; x=1792835219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jcjbR8An16SR3tP/GJFloko/bvbeikqy8AxazhWq948=;
        b=v9EmDkuw5vLGuMlXPQqiVlWmGKSoBLnbeJfzgiBT5l+0QFtJqgBSJbtvAYLNU7VHWx
         uCIFvpbuwKw9Sqfywj+Bons2Afy3ViWPFrBxiaIg2g4ksG8s2DECQXumngvnrGBla42H
         Sy46mW4m7eSBWPSt3QJ+FdWa0EB2sLvD3/4TLVihK4+Z+Fuztzb7D6RzKnc3QqeQgdcn
         LmDL5EFwievDoDL5yaXnbMpEyGyPujMMxsJL6pX/CYOO39rMs584lxB4qxso/6PU23Jq
         3W/JaWNwoKrgSJO6UqDPLTQ4P+EyJeC7ZJzWtT3yV2Vao0NercjZcJdFXFWoFm0vkevX
         OWpw==
X-Forwarded-Encrypted: i=1; AKwUvByrWKx1iE9qjwOufz7EH9YifsJBeCksH4JsIh9oX9E/jDqBaPuifpqucwSe1675Xl7g+FssHagW/PfY5+ny25x5@lists.infradead.org
X-Gm-Message-State: AFq9FYJmFSjVjuhnHnoyQs0nfQ5EATqtsj8zKbOYtmUGkbrt2icX0KLX
	BGR5p762+D6du008xf2Jrwc+bcy/B8oW8274AcUdQYJdXNSKurNc+YibXxv2Gk9HB3ecGeplO7/
	8b9BFjqhfjUJWYB/3wqZQvw4gx53qARqIF4UF6OWyiKUFAu/Ny3YnkCz8NJECi+vs3ryndabza3
	i/rQ==
X-Gm-Gg: AYBFou1FL1Ul4WMgSRwtj3OfMsbok4ij1q1KwmRfyut1Ef7nc7R30ld48juYxhhFTwE
	+6CYF+j+Ih4/6zJQFhB2nBXQdEhHHtldTtrW6Oodb+cTUF8Vt+P4FkY3013vL//xuMKsrGO5LFC
	O6kEOA+jSHC8lFwIrnZ8P7aaewZZpWeWJ3KJjc9Eux8kRLTgDe+AFL+G2GcAlxP7hXWrkF/Nffn
	RGXQeMPwgwuMLX8oJJ5BwguHi1jUiuarUu0/GLPq/UNdN1uYfa2Cr7lcPwi31+07y77oT1bwWl5
	N8dBhS5XEkXZ33eECazGpsEAQ6odJOSCb8+YTKxHFgXturgHK62K5jS/669/150uDF8s2i8vu9u
	UZxVJBPPj+qSRZIvd3bEdV+hkrElsKQ==
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr3772632c88.26.1792230418732;
        Sat, 17 Oct 2026 02:46:58 -0700 (PDT)
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr3772587c88.26.1792230417954;
        Sat, 17 Oct 2026 02:46:57 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:46:57 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:20 +0530
Subject: [PATCH net-next v3 9/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-9-26a8beb44b8f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=2359;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=LRWhJyRn3PkcxIWYRNNivl3BW306tPYAnRD6RQt/jf8=;
 b=8irhRRycJY4lMPeMj+cjkHGT1y1OlkmuNDgvS66f2oU8rsvggEAa5HJEeCWPbUqMEr3ZUG3Vi
 bxh4S3ShekxCm6dM/rJVicTZxfQe9mMakJ0qVXvyZC4RUafE1IliZuw
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfXyB+BKAMdGEan
 rrJn48mBnbpYOzHhdV9kOuYe2F9g0Gxk5lMoMYVyasDEzsjXicIdHbhy06yjRjZw9OBeL4E7P6i
 +EWXc9YfR8OCzR6F37622qPuNXq5LA4=
X-Proofpoint-GUID: aNc8lNGinnYHcTwVRdC78z92-HWCz94H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfXxaqIShBhexXq
 Idk1FAKR/CRvUoxZbnYR2Q4S8igGgR0r1p3K/wTNgDeA45RC5uCKTTUY4l0zBgWaEEAWnJMJwql
 4y17TNf+2FNeoEito3IGYhA48u/GSsiq5OJvaxxXkBRpVq8aDEsH3Bbb2Pw9cTLeiJANueejDc2
 IbYyRrKWxa1Fjq/NYnkXXT8ov6RgRUxRKuRSy36uyiB2D594wyZ4R2jOFs8nWoF+oDLoulMPIPn
 8k3dsF82DkuIyZ9c+JxD/z+lZNeLquuTByRJY/4EwTr60BTlehaOUpi17I+7F6ZhPpb83hDoAFZ
 L3o00WWROjdX/nTnfy34BYKNqtAIaYEIZNDNUbbFHWepV3glv4TQA4nBuawEFnza8qGUnuWXDKS
 LmtwhbZt0/YdLcluOu405wY5kjo88Jxt7FxZMBrfWkxem44kYR8wC9knYZdDMlxAvZ3zUS9H++h
 JoPaIKc/Re29cj+gImQ==
X-Authority-Analysis: v=2.4 cv=COm/zhrD c=1 sm=1 tr=0 ts=6ad34413 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zfyZ_crbsqx4_ZaO5ygA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: aNc8lNGinnYHcTwVRdC78z92-HWCz94H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_024701_099039_909BAAA1 
X-CRM114-Status: GOOD (  15.65  )
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

Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
GMAC IP, similar to previous platforms.  Register qcom,shikra-ethqos
backed by a new shikra_data descriptor that enables the three NOC clocks
required for DMA memory access (axi-noc, pcie-tile-axi-noc, stmmaceth),
and the 36-bit DMA address width.

The NOC clock rates are set using an OPP table. As part of the NOC
clock voting logic, the qcom-ethqos glue driver takes a second enable
reference on the "stmmaceth" clock, which is already enabled by the
stmmac core. Since, all three clocks must run at 120 MHzs, managing
"stmmaceth" through the same clk_bulk path keeps the rate-setting and
enable/disable together.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 9c602755532e141f4b822721686b1481b29b7d4c..a4e083a8517d095e5571b1340f9dd4b5e0c6e81f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -307,6 +307,22 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 };
 
+static const char * const shikra_noc_clk_names[] = {
+	"stmmaceth",
+	"axi-noc",
+	"pcie-tile-axi-noc",
+	NULL,
+};
+
+static const struct ethqos_emac_driver_data shikra_data = {
+	.dma_addr_width = 36,
+	.has_emac_ge_3 = true,
+	.noc_clk_names = shikra_noc_clk_names,
+	.num_noc_clks = ARRAY_SIZE(shikra_noc_clk_names) - 1,
+	.rgmii_config_loopback_en = false,
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -947,6 +963,7 @@ static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
+	{ .compatible = "qcom,shikra-ethqos", .data = &shikra_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
 	{ }
 };

-- 
2.34.1


