Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173DBC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 01:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITf6no6wB7oYYT53ITMZgl1OL+FCjLKzAM5fnbJXjDk=; b=cMda6nI8QmqkVOQy01TFPgy7se
	BXjtzBPT7lMbdhuBg6YerFmNUICmxxEEoY1ezIuQIVxYrvnZMbzNfSy0tYWJosMho3W1BnsvtN2wz
	OjqOvQUH1w5r7V3X/LEgzrUSVGGN4Du9C5QILm6ShHbVIHTnyyjxCxoOR5x+XdTIQj2abc/53FQfC
	4wO46MEIjYDRHexsPiPTjuNPfhL/JH6BJ5/sSmYvXvZCjUNKG6RQQYNxgrHpXYHZPT9/fUNnNeK0M
	gUJgGQJ3DlJRbOJM6gvfKruqF5cL9HaFrUszh/BpcR+GSVsTzCv5W4Lgq5QxKkkYI6tlNtVU/7NTO
	rP3yRkcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9BTQ-00000006pLH-3Ve9;
	Wed, 23 Sep 2026 01:08:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9BTO-00000006pJz-1awa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 01:08:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MIXNi8268290
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ITf6no6wB7oYYT53ITMZgl1OL+FCjLKzAM5fnbJXjDk=; b=jzpgNFTdU68jOBjK
	xDF8ju0tIID9eu/mXx4W6ha7GMJkCKuW6a1MJYfXDxPjGy0zaDrC7GueCdsLMA0k
	NOn+oSYyibSkNRqRJAhwQD+Pe+6A/krgZWcYMYrwwdut+ng3kAYvaWKrr8pBdhBD
	30IdMm7PLQptX7oIGMGveEBxD9JKBySxQKGuqLe9XytlDKGZ7uuukyCJb/NIInUh
	zVriGDl8/I2QkyBhj4V2BuXPsWN8yMsTVm8Y59cREvJ89IF/Q623O9u+7ue9JWp4
	6EdM7/WDI9ORdhGT8v5lR7H+lbwXCRWfRNcesVPnOqp52a7kQ/8vchRCRnKMjlqM
	KGZlKA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c1gyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:08:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33bb08e80a8so369911eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 18:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790125712; x=1790730512; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITf6no6wB7oYYT53ITMZgl1OL+FCjLKzAM5fnbJXjDk=;
        b=Bm8Ed2uFks08PyLFX1qLZrJPSiPYZ6ppg1zQLM0fdJDdh7GlldXwhsjXVvzGNcR3pj
         sS4SJke/yWpZBqk9DOrS0PFtuUTzj3LIcZbW18Qw21WwakhqX5Lay8sO14IfmuNIwCYi
         mbtqgOwU0GF0CYrp7S1bdhCTV6n/8YuAzmNl2b9BXneA8LFMpvakQ2JnySOB6LmnejB/
         mCKqG1qGzEFPnutY0vNbMGB+wnrc+VNz/rNZ1va1GAncvGUuD3SZYL2AuIqQEYwfuimI
         pykTMYWIEBMx87QBjrwGyv74viVrrWHfBxiupmyfsvn73ByIlj2TCBRPZo0bPC9Me/zN
         hvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125712; x=1790730512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITf6no6wB7oYYT53ITMZgl1OL+FCjLKzAM5fnbJXjDk=;
        b=mSdYjgcrhpsolEev5vJ6VfJJK0DSk/L6Uw7LXDl86JHB0U0mABH99BvtCGwfsCvXsA
         CNF00ccTkBxqxMIwmmh5jGTfrCU69ilA1g9qucrFFJN1XBWcPM80L8g7rBuOQCJP6bql
         z9mmOreOGoQGuyG6+RzSiDMW4/7lo760lUldUvOq9OKCtwsNd/DgpAvwMzMzHVOhQ1vc
         +lfHJoH3TGL6gli4qcAkVLzgnHYnGOjW4+DQgCn3UGKaUmCXOR6yklwarn46OEh1tV7B
         Ey1Bh06SryQf6K8IqDcBFFU5NQ8mCJMIHXPUQ7WQRs65pBjGGVM7jQYyvkAmrp74k3+P
         qvDA==
X-Forwarded-Encrypted: i=1; AKwUvBzvs0lbZ+tQ1h55HAtOnM19RYHUdDEyZUFnDIk6jk5XCip7kz0PGYAwNuvCPXO1GCY8CnSmFp2IcKSEDr8QbcOQ@lists.infradead.org
X-Gm-Message-State: AFuF++kk217ppmkjG00IOfgw/8hNoZKuxXLNhTuH52qA6ZyKIXvOBMY2
	o+dCri0U1SCoVwl/esexRrkPJfakmNdtwypY3WR5z8rAI2YxpaFV7LpVvUFrH4mEY8blbkJUZQP
	YoWU1oPFHUnZCeGeAnTPcVVSb6KtN3TY3Z+6J4CHqhSGELWYI+d+Iy+9QCvnnE48goHi+z3NMaS
	6YUQ==
X-Gm-Gg: AYBFou2VMIoOdQg8uwifOt/2ZO1bm8zoSn0IARNUtsKRSohoNWDYIsU4iTbAZcw7ajb
	qk29CMJdbQ/Pr7SHeK4cCGFJKChykWcwLUYT5M0c3lnTUgvabucM/hRsqemkBhMOvhR3YktiQYf
	Ocs4DgYTHpWtkIHmjNeKav3FhC4zgnALqEM3IPerZoXtUy3zLi2QTnLFC6zN+HC9XuucECgd76s
	qBWm/GZWfE7UPQdi/p5Txtrq+E73JUUwuOXh58R2mlviOf8zolPLQUzFRJaHmwrHzI4hRSP6RJa
	kyB/ebyV3a6qrThvMIBBTM50b6LHLNcW+g3trmtZ2ndkrIXZ5P9Y6IAuYjJHROMPc8h0jQbKs+9
	xPV8rgKMtNkl5i+/3GnmBjg8L8M5t
X-Received: by 2002:a05:701b:4184:20b0:143:6328:2a93 with SMTP id a92af1059eb24-144f8da1343mr1183118c88.10.1790125712072;
        Tue, 22 Sep 2026 18:08:32 -0700 (PDT)
X-Received: by 2002:a05:701b:4184:20b0:143:6328:2a93 with SMTP id a92af1059eb24-144f8da1343mr1183087c88.10.1790125711497;
        Tue, 22 Sep 2026 18:08:31 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98ca0edsm1651831c88.15.2026.09.22.18.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:08:31 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 06:37:29 +0530
Subject: [PATCH RFC net-next 3/9] net: pcs: xpcs: add custom platform
 register accessors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom_xpcs_nord_emac-v1-3-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790125674; l=2649;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=vTpkG/qLTuJE+J7YjR6oDiP44e7ht3jSUR2yy/OPtwY=;
 b=qgcKAJR8ofneY0NWHELelT27YbbL+m9wsE/nUE+ou70S3/HbqNREQeX8dBZXH7l8lE0lM0FZk
 AfvkZMxnILNDRy9ZfoNRRuaWzPFygF2Ey5jyOZFwKgQyjr1wOs+4kqD
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: YElVVA0itMJRYkK_6yw4KkLsuhFV2ZtS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX2CZ3MfkqLBVw
 JIJ75PHr89Yz3/Ly1gg3Beqwce+uMtCOmwpedXKSdf+tN8VtFjAxr+G9qT7CzKqpMgHGoY7xvgP
 rMHgyDgolXnjHnJyMYhtyK0sM7EtF90=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab32691 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vuQw3E1rjvSkk4ldrVgA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: YElVVA0itMJRYkK_6yw4KkLsuhFV2ZtS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX04msfQF8VSI5
 Xnko/Iz+D2BM5g7V7/Q4S03ElCWgngcaEF+R9/xfEouy29jy7+bTXQp6EkWJgUWT5fFlQ3m53b4
 4fjUJFdW+chzvbDXbhESd/QvoB3CTaiQIsg/IN0nhvkOJGrnCWllbCtv2P6WGiB6A6HSCtXW3Qr
 52QmJ12aMyy8BMXpFe8gJYpdR5C9oLEoranrJaO48/W4VUIPC2KWJspoWmHbv938dVz5W12LiXQ
 AXp772ci2BKhYNinoys1z9miOtldNaTrPyOPFof57wrorVmh0Lr3WU3AkZFsEFI8GICHk+aAXxD
 Swd9/5MQyGtXksqokndPpPFA5RXNAYDFukytnYMvfUbGGgJDpa13zm5IfAhaGDfroWSFveuZCM5
 Pv8zPzc33O40NssV+CPGYq3CI/090L/wuStFvL0qnnpXJ6LFMedqXcxYA/PI+gf/u+LeTlR7wBK
 lR2w/bG3z66I513a10Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_180834_543740_1E6877E2 
X-CRM114-Status: GOOD (  16.68  )
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

Some XPCS integrations do not expose the standard direct or indirect
register layout. Allow the platform driver to use optional register read
and write callbacks for both Clause 22 and Clause 45 accesses, while
retaining the existing access paths when no callbacks are supplied.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/pcs/pcs-xpcs-plat.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-plat.c
index e669a7b248ac4677aeb5cd1874108f5c87f837d2..e78a233fb198d940951064a71e8597c6c666bc9d 100644
--- a/drivers/net/pcs/pcs-xpcs-plat.c
+++ b/drivers/net/pcs/pcs-xpcs-plat.c
@@ -24,8 +24,16 @@
 /* Page select register for the indirect MMIO CSRs access */
 #define DW_VR_CSR_VIEWPORT		0xff
 
+struct dw_xpcs_plat_ops {
+	int (*reg_read)(struct platform_device *pdev, void __iomem *reg_base,
+			int dev, int reg);
+	int (*reg_write)(struct platform_device *pdev, void __iomem *reg_base,
+			 int dev, int reg, u16 val);
+};
+
 struct dw_xpcs_plat {
 	struct platform_device *pdev;
+	const struct dw_xpcs_plat_ops *ops;
 	struct mii_bus *bus;
 	bool reg_indir;
 	int reg_width;
@@ -169,6 +177,10 @@ static int xpcs_mmio_read_c22(struct mii_bus *bus, int addr, int reg)
 	if (addr != 0)
 		return -ENODEV;
 
+	if (pxpcs->ops)
+		return pxpcs->ops->reg_read(pxpcs->pdev, pxpcs->reg_base,
+					    MDIO_MMD_VEND2, reg);
+
 	if (pxpcs->reg_indir)
 		return xpcs_mmio_read_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg);
 	else
@@ -182,6 +194,10 @@ static int xpcs_mmio_write_c22(struct mii_bus *bus, int addr, int reg, u16 val)
 	if (addr != 0)
 		return -ENODEV;
 
+	if (pxpcs->ops)
+		return pxpcs->ops->reg_write(pxpcs->pdev, pxpcs->reg_base,
+					     MDIO_MMD_VEND2, reg, val);
+
 	if (pxpcs->reg_indir)
 		return xpcs_mmio_write_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg, val);
 	else
@@ -195,6 +211,10 @@ static int xpcs_mmio_read_c45(struct mii_bus *bus, int addr, int dev, int reg)
 	if (addr != 0)
 		return -ENODEV;
 
+	if (pxpcs->ops)
+		return pxpcs->ops->reg_read(pxpcs->pdev, pxpcs->reg_base,
+					    dev, reg);
+
 	if (pxpcs->reg_indir)
 		return xpcs_mmio_read_reg_indirect(pxpcs, dev, reg);
 	else
@@ -209,6 +229,10 @@ static int xpcs_mmio_write_c45(struct mii_bus *bus, int addr, int dev,
 	if (addr != 0)
 		return -ENODEV;
 
+	if (pxpcs->ops)
+		return pxpcs->ops->reg_write(pxpcs->pdev, pxpcs->reg_base,
+					     dev, reg, val);
+
 	if (pxpcs->reg_indir)
 		return xpcs_mmio_write_reg_indirect(pxpcs, dev, reg, val);
 	else

-- 
2.34.1


