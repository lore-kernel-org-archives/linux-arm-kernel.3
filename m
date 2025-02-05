Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB68AC02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 10:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDare0wXthcUSCxt8tJMhXyNRKnHO97BD3ndLeOmDBI=; b=io5oJV72PEi6dF3Re+2X+1blCT
	9MX8IsB8mvy5hPyaZcAUPAgUzdNkbbXZJ9XQCiyH2FdBhqLBkcRZjY/kOgGrZp37cJ4Q5u4tKP+ZW
	BK0iOYX4vRwx1OEBeLrXmLwqlB08iHyFDeJ1W0DGwyznaXL0uvhfO9mPHKKWRRjS6su7ERZ3hPANQ
	EUplSOPbf3RDu4I2YaasnyQje0vWP23vWyrYXkEwzyK4nh30m96z/bO1rNWM6j2ftDbbYGTw9PjCK
	YqbTHtUqdZmYqTzKcZhtGkOF4PoHVC5B75pcvWVi1AKxXxl2VCvWAUexWYpC3ZYwipX4b/Nv/dHj3
	RNfSEOzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfd1Y-00000002xET-16jx;
	Wed, 05 Feb 2025 10:52:52 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcyr-00000002wku-0AkM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 10:50:06 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id A2A45A0530;
	Wed,  5 Feb 2025 11:50:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=SDare0wXthcUSCxt8tJM
	hXyNRKnHO97BD3ndLeOmDBI=; b=OM7D9kN/qdhvVKfFyRJIY7EmIiYKzs5biVhP
	SYV12ZKf8A4UtWWnswMGsznVS+CQBPHxIRhewTGcXK8mhHG6OXTKX1/kvkVk+XQc
	mX5aZd2TQGnB5YFahlKb5/hUevWts/95fdAim5TAiQVHurym71JkR0bE8WvIkWjE
	0NUIiBZECxHwT6iCbeXeDb1aMmwY5au9rfSZTHfe6JO5jN0AfZuOpWVL/f1E+71o
	656E7X4y06qx9PexxX4e1xR1rjP5q42VM0I+hYMHjuWXb4neA9+QhwL1VDDGLmVF
	CQkB1aewiXM39KNJyrT250wC7DAln3HGhklq7fwbA1ZdDNNg68byIqtDKTxy1kAL
	iRTQs/nWds0fATuIJVHJxSepyhSQgrUf/ZnXX1WUoJ/ALNa+hpz+t7TN+Etiiz4/
	pAHKQiBG8bvTCkCYbvxbdO3q2p4n5MVRpp3q2yRE4n9cdfg36dEGYieizSgmsoTd
	hG4hV4XPM1LajeRt4rX5hKfT+Jhigek/NbBofCSkQN9pwNHsm0hEnlJo8B3rkajh
	MUI+Z4EgwDyOQX1rdQHuaPJkkvNvYvdqFQrKnKyMv2A9E1Uj+OiJ4uJq6fPIbXlW
	WU3WK5PUa5b5zep4GitPl6jF7sfLcNSz8NwxX0jgXxbYScYtcekYwt381Wn3BY54
	yPyfLmI=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Kamel
 Bouhara" <kamel.bouhara@bootlin.com>, William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH v3 2/2] counter: microchip-tcb-capture: Add capture extensions for registers RA-RC
Date: Wed, 5 Feb 2025 11:49:54 +0100
Message-ID: <20250205104957.95236-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250205104957.95236-1-csokas.bence@prolan.hu>
References: <20250205104957.95236-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1738752602;VERSION=7985;MC=3452472733;ID=233959;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94852667264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_025005_232210_385E033E 
X-CRM114-Status: GOOD (  10.70  )
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

TCB hardware is capable of capturing the timer value to registers RA and
RB. On top, it is capable of triggering on compare against a third
register, RC. Add these registers as extensions.

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---

Notes:
    Changes in v2:
    * Add IRQs
    Changes in v3:
    * Move IRQs to previous patch

 drivers/counter/microchip-tcb-capture.c | 58 +++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index fef4bb69b486..1445ac512c52 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -253,6 +253,62 @@ static int mchp_tc_count_read(struct counter_device *counter,
 	return 0;
 }
 
+static int mchp_tc_count_cap_read(struct counter_device *counter,
+				  struct counter_count *count, size_t idx, u64 *val)
+{
+	struct mchp_tc_data *const priv = counter_priv(counter);
+	u32 cnt;
+
+	switch (idx) {
+	case 0:
+		regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], RA), &cnt);
+		break;
+	case 1:
+		regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], RB), &cnt);
+		break;
+	case 2:
+		regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], RC), &cnt);
+		break;
+	default:
+		return -EINVAL;
+	}
+	*val = cnt;
+
+	return 0;
+}
+
+static int mchp_tc_count_cap_write(struct counter_device *counter,
+				   struct counter_count *count, size_t idx, u64 val)
+{
+	struct mchp_tc_data *const priv = counter_priv(counter);
+
+	if (val > U32_MAX)
+		return -ERANGE;
+
+	switch (idx) {
+	case 0:
+		regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], RA), val);
+		break;
+	case 1:
+		regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], RB), val);
+		break;
+	case 2:
+		regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], RC), val);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static DEFINE_COUNTER_ARRAY_CAPTURE(mchp_tc_cnt_cap_array, 3);
+
+static struct counter_comp mchp_tc_count_ext[] = {
+	COUNTER_COMP_ARRAY_CAPTURE(mchp_tc_count_cap_read, mchp_tc_count_cap_write,
+				   mchp_tc_cnt_cap_array),
+};
+
 static struct counter_count mchp_tc_counts[] = {
 	{
 		.id = 0,
@@ -261,6 +317,8 @@ static struct counter_count mchp_tc_counts[] = {
 		.num_functions = ARRAY_SIZE(mchp_tc_count_functions),
 		.synapses = mchp_tc_count_synapses,
 		.num_synapses = ARRAY_SIZE(mchp_tc_count_synapses),
+		.ext = mchp_tc_count_ext,
+		.num_ext = ARRAY_SIZE(mchp_tc_count_ext),
 	},
 };
 
-- 
2.48.1



