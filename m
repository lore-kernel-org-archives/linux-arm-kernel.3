Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68CECD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 01:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJ+38FTwss9ygHui1gfTl6vP2WH2KcHiorJ0gzERMpo=; b=KWhEEt0TFVM5dU91PpZLOkZS9J
	hTDeb5t6MRTvqIH+/HFd09q/3GljIiMrcFPiR4TNQz3itddO7GXJ5GGGwYaIZMGWU5VotouOGWO/q
	IwvXHSz2jRNAQESDOAY1B+C9dlMYgvMxiEhEPbfRsU/R7CDZD7QEDQAGQutI2fzsZFBaKFdcXHAAc
	tQyG/QT2iBfT1cMqJqd5Lc02el5uY1CLymbabPlFNxcoqE2gZtCkG5J4IxW+FFS9y17s3zJVSB8Tv
	ot2bpo8E32LAojjA0FgZpsugqDQkKFLojzR5kzbVlZ4FZ+qQ8SVMdNns5yDb77INm78JCUlTqgv7H
	RZTD5yEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIvN-0000000HTaq-3MA4;
	Fri, 05 Jun 2026 01:00:37 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIvL-0000000HTZ8-2EHp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 01:00:36 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-4863eae453eso644406b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 18:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621234; x=1781226034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJ+38FTwss9ygHui1gfTl6vP2WH2KcHiorJ0gzERMpo=;
        b=OOVzsQKrQkTOjmzFohTzfYggIlM4GI+W05oa46H7x3x8MW0pct+6+0WMaHnGu9x5pH
         QCCA+2TpXFqncilHOoFisBTomyEBn5gS8SOQAUdHHUidhzBf94GIakAndr+JQZUJLqH4
         sL/EO+0tD8cAGOjgDXC+6rVULUUE9JdYonAtfQhOMF2FJm9l7PbkgOp3ptN1Yx2qGwrC
         RxSlRdj3J08sdTyBmsUTFgbk+pN+trdtLMt9t6eu3yiW/zMSY7cHkVXwS7YGflDsVaBc
         NxsnIwbgFE9wWMYXflVQCkByJGIGrrk17peZ6rWPjqFAFktUMThl0xz4yjlVM6LsEyPq
         SUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621234; x=1781226034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJ+38FTwss9ygHui1gfTl6vP2WH2KcHiorJ0gzERMpo=;
        b=FkungUqV0g9Mqa3be8bkQOmG+T4NiF1WtC3osXhDVTxoUiU73+XNaLUi9OEdniPWLk
         ZzDNjsJvPt2emCH09W5p76KvjSX+fPWvWgpKeQTVfYIYOwhX/ryVqFReTIQ22wcyBXHj
         52ePXnrKr/1Le47ZYB3wBQnEGQ4gqCeW9BxxJX57/2TWYZq4TZ9SXD5sm4PH3BwVj67u
         dso9Q9vp+85KqfVNII4ndiQOLrYr81fgkRx/cJbHrfRIuEeh+Y+/Kol/NcHOwVs6KrLe
         Hll4a+rzzxQzbOZJv/m4cvnD50wi+gSQ8pWGmE2Z2DND17pppvUtu+E7m7bhOC6LfcEh
         Ljaw==
X-Forwarded-Encrypted: i=1; AFNElJ+QPJL0zoUuBY3XeF95gFjRV6GGsCMWH4F079iboNgY7bUHMRTs95WTZ3JAPavz60bsPiIgxjvRrg/PfNiBbmSC@lists.infradead.org
X-Gm-Message-State: AOJu0YxhQcaWWZErVqQOTjD/tWFdpaMistljwDqze1TCXdz9BI5Oh0+l
	AsvahlTaeyQH9UjJlIsS9nIht8sbglbyP9GFVTFiL4/IcS4ITUPy6WzGzNA43v98bGU=
X-Gm-Gg: Acq92OGA63RbO4N1B2pRSi//PV99nzxPZeWOHzaG7PpIFDmtVb15MzsK2UsVtNzNSWx
	KBAXPbCjDo+vYdoGDJJRyWBd/w8IATUgNdDZMeWzd5OwhaCPENP7AQLHn2ZjJSIinBitE1P1H0B
	2IfHpYbZ6DPX9NV1P+pb/8xe4dOhD+d+W3VN52x3J2yQSts/BsFYZdVeBNXs3cakI564V3MMyqb
	oGHXUoY0ClRDwVC7oHsFBdG6FXuz+M/FWtYf3p/n/7Ddrfzp/tSU1zkwEciifihsHTRYqHC1o4y
	s4e8uVXqSO27+nCBUdMp9kNhDD5473sxv5+xyNpPavqZ9KCa4+u/g/PvAq2QlwttsgwISSWA1r0
	hgR2wSqVsIYYu4c+31je0xKQ9AgG8cTtye47mPPQcbOR6aVosMhu0fvFxY9DRUXLsXwHlrnuYvP
	UZrCaf4tuZZoBCrKRHC+Q7h+YoBGUaeD+o4YADXg==
X-Received: by 2002:a05:6808:1b25:b0:486:560d:aa9c with SMTP id 5614622812f47-4868dc63516mr816744b6e.15.1780621234618;
        Thu, 04 Jun 2026 18:00:34 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:00:34 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 02/14] net: phy: qcom: qca808x: Add regulator management
Date: Thu,  4 Jun 2026 20:00:09 -0500
Message-ID: <20260605010022.968612-3-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_180035_579691_385F7099 
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

From: Daniel Thompson <daniel@riscstar.com>

QCA8081 appears in embedded board designs paired with GPIO controlled
regulators for its power rails. Add logic to allow these regulators to
be turned on during a probe.

In order to avoid the complexity of tracking state for suspend with and
without WoL we take a tremendously simple "always-on" approach to
regulator management, essentially relying on BMCR_PDOWN to conserve
power when the phy device exists.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/phy/qcom/qca808x.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
index 8eb51b1a006c4..fc3f2cf2e55d0 100644
--- a/drivers/net/phy/qcom/qca808x.c
+++ b/drivers/net/phy/qcom/qca808x.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <linux/phy.h>
+#include <linux/regulator/consumer.h>
 #include <linux/module.h>
 
 #include "qcom.h"
@@ -178,15 +179,44 @@ static void qca808x_fill_possible_interfaces(struct phy_device *phydev)
 		__set_bit(PHY_INTERFACE_MODE_2500BASEX, possible);
 }
 
+static int qca808x_power_on(struct phy_device *phydev)
+{
+#ifdef CONFIG_OF
+	static const char * const regulator_names[] = {
+		"avdd18", "vdd", "vdd18", "vdd125"
+	};
+	struct device *dev = &phydev->mdio.dev;
+	u32 count = 0;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(regulator_names); i++) {
+		ret = devm_regulator_get_enable_optional(dev, regulator_names[i]);
+		if (!ret)
+			count++;
+		else if (ret != -ENODEV)
+			return ret;
+	}
+
+	if (count)
+		fsleep(phydev->mdio.reset_assert_delay);
+#endif
+	return 0;
+}
+
 static int qca808x_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
 	struct qca808x_priv *priv;
+	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	ret = qca808x_power_on(phydev);
+	if (ret)
+		return ret;
+
 	/* Init LED polarity mode to -1 */
 	priv->led_polarity_mode = -1;
 
-- 
2.51.0


