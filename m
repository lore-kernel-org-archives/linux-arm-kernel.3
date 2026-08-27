Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C1DC61DCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 18:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QvdWGn5rqFtTcef6NfYXo2PfwQibN77OSCU6yboIRk=; b=CcOls3+TJFrZxAer276oFDb4w8
	yIuRirRyaJmRA327uvVxt8H4yWaVrYzDmQBhNzAp23B0iNKw754PD5SKlclKYX/Jtvx5lnMalZGBh
	p5bcrrbINEVwVU0l0OiN15SqWzcqaneGtkrgcq0Nfkh+gv1727dwt6HCF5YbZRZh5ZYNAEC2Li9KC
	H5oZyo4WrmjlvyKeW2gAV3uKSB/UR8NiCGGhVyLiku91+YSekjkKgLgn0TtGanlozNbap/+Qf9HVf
	a8JGIcQtZE8OdFqBXsYFmpJ5W8ePmB2or1yIy2KJHvFed3KL+iRxnkscwhbAKkmLIbbzhrRIeLgNc
	IIV/k5Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzePH-00000004Xy1-1i4W;
	Thu, 27 Aug 2026 18:00:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeP1-00000004Xpw-0xMl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 18:00:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXsV04084530
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 18:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+QvdWGn5rqFtTcef6NfYXo2PfwQibN77OSCU6yboIRk=; b=Ppmv8yPKbb9PHUQa
	uo8WRtVl4iinZTO2w9ED9nUIJ8fEyPnMYBqDvE/P7e1vMbyjoWEzFH5549C/TIni
	CGIDYKmn+CnZ2ffU64ONax2SutM9EXNkp6HaAHb0uOimGMXcI71e67HFt7sy23bZ
	m9WqgUocbnJiH6C2p98B8+FluWdmXmRknFm8d/fxJaxHbRneFosHn6lMQMY7/jF1
	UvnZCVUfeUqzImgs4j0ZE39rtYaRYRLlWAAqYFMgZN/TijQc46Lttd5/aFEEB7Dp
	jRxNLA72WAb5X6PCfAgTV2JRuHF+U2WsZvFdiEq4uiL1crN1y9KpFaavKKF+1JLw
	yUUc4Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4game7svma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 18:00:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so403850a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 11:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853638; x=1788458438; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+QvdWGn5rqFtTcef6NfYXo2PfwQibN77OSCU6yboIRk=;
        b=TN3nHyf8DNOEpDsk3BtVgX/zl57gpahuAq22PnGs28jzwULd3RRjhzalhwsSYUpUnd
         lTYM9+IU2osY/CDMrurxDBIdHM16H4OgfJjXbxPOsSsipc27ViMA3tO5ywPFDkGAtRDu
         694WE95FpAQ83hlOm7DeqndnCFGpXIVJ6TNPFl+nWKEPc8hyBVRAK4Hu1BghqJ5Uvny6
         Uf2GsB/qArnC61kjSG11RQDJcLvxPMsp3PnINQhf0uz2q93rXbJ0D8NVUTUBH747CDM2
         Ufti+Dk2TH6hbCnEGuy38LRwId1MFK3jiabXg/zsY4G2UdbkXQ3JTfR3makSpwuCtjQH
         PoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853638; x=1788458438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+QvdWGn5rqFtTcef6NfYXo2PfwQibN77OSCU6yboIRk=;
        b=FBJAGhnLFivj2kYPW8B97AjyagAfspSQ151HpKU7b/zSO0dztQrvIsYVQ6Dli17mod
         Zsmi5CYh5tpLLZ/O/b2/ZBS3liMPqpHL5uYsk27x+6pSohofC2AAzwqR8PB2yIY2KqCO
         h9mteIoVpCFHw070G3KhOglMgFy00KPl4eO6mbemH1IziWsAxedyOmgUYLG4SLYsgVjh
         PJ8u3R13y8SbbQf69PpwbTeBJRjikdm4IFnh4MIlVub2cJmOFQXlEPxFpEncfnG72eXx
         tILFZSrgKPhqZTIszAvCfYzZxoSBZWAs4kB6sFOt+tGuFhUs+5iV/3SmvOYc4I6ggjgt
         2hAw==
X-Forwarded-Encrypted: i=1; AHgh+Rqj4jF+iIFN2Zt6M49tQSqKqwXr56wArSEuYu1aZ77nIhInFgm7W6/LEcy8wOwkN1m1/xsqicIR/0jj9oiJIZ3L@lists.infradead.org
X-Gm-Message-State: AFuF++ktuTkgFwiqoOvzgZ9g2hQYTwiivfkQcWLzgWxDvWETZ85yGS/4
	aydU0/U0s4Dujm8o7BFUAew76TgaVjNLa0cDT5LDCRQjqVhYcXsI53729okZJ36otRwUvlUy8vm
	GKhdY6stbA/SpIyVjJuWLCtiPFbCV9ah55uqUkWJYArL8+MaOzkIsZ0DwkZNcvV5MboG+x6H12c
	Fhdw==
X-Gm-Gg: AR+sD11nGRchHM8XyyyEX4FENdsC1pBAXRDqjn/39ld1yElN+W7fB6fTvdsjzY+7qZ9
	eUBhVmJHj2W4f1k/hagXBqUw6IKBfZt2TE5cJDsEuiv/gdUiIsDebBalRYROZa5s/VY8pwtvIvw
	T3ODsoKY9S8LvHBlYPHbqs6o8DAvf3XsbDx9fsQWeRvohpwrEpmmsUB8yEwo+APKAEve/bIIV0y
	512zdnUKBC3qmtoqVW4QmO8e9EMonXCkhSRl3r+Tiz26HL5zXviGd6q3a0ugocUqZhBgM/GK1rO
	HhtuSCkuGwwGFbZQmR99zv5zPv++C2aLcdgHJyR2HdrIwBcOcdVK3vjDnLlf4j7raGzHSOlj0JT
	KIRar6m43RBjuSLnQDO06jHqgF4vRV9/yqg==
X-Received: by 2002:a17:90b:17c2:b0:396:b918:c2a with SMTP id 98e67ed59e1d1-396d0faa459mr1359464a91.12.1787853637837;
        Thu, 27 Aug 2026 11:00:37 -0700 (PDT)
X-Received: by 2002:a17:90b:17c2:b0:396:b918:c2a with SMTP id 98e67ed59e1d1-396d0faa459mr1358225a91.12.1787853632427;
        Thu, 27 Aug 2026 11:00:32 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm27437523c88.12.2026.08.27.11.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:00:32 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:29:26 +0530
Subject: [PATCH v2 9/9] i2c: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-9-091697dbeb02@oss.qualcomm.com>
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853566; l=3297;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=NjCwN+DsAYC8C+NrLmOLrNQM+M1WYqvKKDKj63mj+98=;
 b=it9A0O4HyitFGzlN8icAAHt99GLQ4iEQWhvQvTQy1VFytbLLTb33k1x+gZt/2GLUyQamW0TmR
 qBFXMl3rJimAGo0vjRZviG9h3ZLpZX8wqYXM1VWD6awoH4nAqu23Rlb
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX1j91RjElzTJZ
 AmlyuohSyioDGba2MkybzSOYbps+s8mBjaYCiWGDcBHXpzoWqC3IfkZqtxPDpN6cVmuLI0qgSyq
 CeYRybhmDWtpalIKm/uBFXKDwe86fJ3cQnOOt7K4COcQZCD/sFIhzjweY8Dfhx4VYtI0DzOOrdL
 aGyOAomyG/Wkp2rwMNWiIZsznjbCTnqXztxCuLGyu+uHyD98hRkUmQytWzpAx2aL50syPHLYxjO
 80PWZUBNaWhEHO0CdgKLXzAnI4YgouAgzGpoVn8R+4TdLE3Mal0sCBG/9a/eQ5YYtk5ZfUFigia
 Iybszz5fFz9xStaWDadUvaWHpxlz453SCyNY0/xiQLkTlVoTMdoTbYhtEBEoo0VbM7QhhFwZ3li
 wrHyxXXkVUqf5XaNWbtXn25YC6EKSENv5pyRfPjdC1pBBFjPHlGORiN0BwRuoP7bPEJrf4/z0Wo
 iHYS7+wwpWjjwjo7Zrw==
X-Proofpoint-GUID: hmZaFQjofadnxXCD_mpMuWvKKs5G9vBi
X-Authority-Analysis: v=2.4 cv=Yrc/gYYX c=1 sm=1 tr=0 ts=6a907b46 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=V8jFpX-JU2fdHFI84kkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: hmZaFQjofadnxXCD_mpMuWvKKs5G9vBi
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX7rwTDvrtJ2uk
 6VmxpuewbS5QCR4C2LX8q8a/tu4OAovr2p9ZvkPMuI4izBVAKzorVbGy0MJ7b3VAG6X6BvUg2qm
 +/uRN11DfRMEGNZMWce1T59L2s/Vt34=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_110039_694137_42023F0A 
X-CRM114-Status: GOOD (  16.86  )
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

GENI resource management may be handled either through the Linux clock
framework or a firmware-managed performance domain. Source clock
programming currently depends on platform-specific callbacks.

Use geni_se_set_rate() for source clock programming and perform the
source clock configuration from qcom_geni_i2c_conf(), allowing the GENI
core to abstract the underlying resource-management mechanism from the
I2C driver. This removes the need for platform-specific rate-setting
callbacks and enables a common code path across all GENI I2C platforms.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 0b178701e1d1..deb0d822290c 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -16,7 +16,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/soc/qcom/geni-se.h>
 #include <linux/spinlock.h>
@@ -219,14 +218,14 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 	return -EINVAL;
 }
 
-static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
+static int qcom_geni_i2c_conf(struct geni_se *se)
 {
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
 	u32 val;
 	int ret;
 
-	ret = dev_pm_opp_set_rate(se->dev, itr->src_clk_freq);
+	ret = geni_se_set_rate(&gi2c->se, itr->src_clk_freq);
 	if (ret)
 		return ret;
 
@@ -985,7 +984,7 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 		return ret;
 	}
 
-	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
+	ret = qcom_geni_i2c_conf(&gi2c->se);
 	if (ret)
 		return ret;
 
@@ -1228,7 +1227,7 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 		}
 	}
 
-	dev_pm_opp_set_rate(dev, 0);
+	geni_se_set_rate(&gi2c->se, 0);
 
 	return 0;
 }
@@ -1239,7 +1238,7 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
 	if (gi2c->clk_fld && gi2c->clk_fld->src_clk_freq) {
-		ret = dev_pm_opp_set_rate(dev, gi2c->clk_fld->src_clk_freq);
+		ret = geni_se_set_rate(&gi2c->se, gi2c->clk_fld->src_clk_freq);
 		if (ret)
 			return ret;
 	}
@@ -1290,7 +1289,6 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 
 static const struct geni_i2c_desc geni_i2c = {
 	.resources_init = geni_se_resources_init,
-	.set_rate = qcom_geni_i2c_conf,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
@@ -1299,14 +1297,12 @@ static const struct geni_i2c_desc i2c_master_hub = {
 	.no_dma_support = true,
 	.tx_fifo_depth = 16,
 	.resources_init = geni_se_resources_init,
-	.set_rate = qcom_geni_i2c_conf,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
 
 static const struct geni_i2c_desc sa8255p_geni_i2c = {
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_se_set_perf_opp,
 };
 
 #ifdef CONFIG_ACPI

-- 
2.34.1


