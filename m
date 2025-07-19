Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D6DC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 13:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2w7YNdeV3UKe4gbJgUahKR4SR/Wo2xZsY+ZJfiRzrE=; b=NKzVaHghVEano7fQ7FdOvJcwkc
	RGLzIZ/fz0qRVh3ZxVJT+S+7ltwG/V78+sJfcpgFxIlO+sk4lXPd0FCXTMLlfU9XesCObvU0+WocM
	BtjG+jM1gpLubBEXypfAGm/KC1PUUrX+NgiPUcvjKaBukEURiUAKDQFKjeqcfsltFlYOdi6zuU6IQ
	+pbAg3b3a3ZiK+r3EEHQbVZq8FcZZpPbCGJNEmu7jE2WMr1VY9Hgi14ElPgcPKkDcNlZfEYTRMX7z
	cfeg+iVnK5ye4sHIbZ0TBUHsb+ao25gmGxQLOAPD0w0OQv6EGImb0pKcJMyim4nonMA21mOsHhdGK
	Us0K1TUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud7Ea-0000000EHOS-1HPE;
	Sat, 19 Jul 2025 13:04:12 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud77A-0000000EGSm-0hCo;
	Sat, 19 Jul 2025 12:56:33 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so20613945e9.1;
        Sat, 19 Jul 2025 05:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752929790; x=1753534590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2w7YNdeV3UKe4gbJgUahKR4SR/Wo2xZsY+ZJfiRzrE=;
        b=JrLABwRepIDmYCdHkFT3tTJdbri1fG9Lkpsw28AdjyyumWDLd/7q6NEXi7YmapjfnQ
         XRnTxkhvHz6mBcXU4qWFqc+PbeF5hMufP1NmPZxzhMcfJiOq2OR9KSa1LHsNyk3NrvSx
         wi8S+HruV1wsskGsouyuYSfNWKn0G/fMH0HgWe6uOB22t0XjOxetSVL6DJKTcdVFCbj1
         kuthSEQOl0kLvCE/YM8ojEscuG1ZO0zVzG8fh+AL53FBVN/Cf2aAZrAD9LUSehVlbO/l
         EsoclA0ERDZWrCzNNGKWzzdvwpQOjh8WacMdejzCSu5Vtt+o5rCXLloiLwvisht3Pdot
         Wt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752929790; x=1753534590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2w7YNdeV3UKe4gbJgUahKR4SR/Wo2xZsY+ZJfiRzrE=;
        b=pLZO9l6bksEgE5D84wPvn7Jb4PvAcf/5VhEzOtXdlbnT8FW69VUN9MGLrA30/Q2jSe
         ynoGZYyIP7ctlo2egYd1CG8OUwcsRzEmP3a1VGyMvJ3bfDQOAkTffCEl2mHDNkDymyQN
         s4BxwdJq8o5ZtlxfYB9F4neLLJ4yctc3n+Q9fukx4L80wt8bUaBPVzkCXEq5Plp7fNkA
         da1gNo0EOnTbLALzhgMEXpQH0H65AM2cw0WkC4Hb0KZ/skWARCdvKNvMDklJwHBMhKz5
         kXL6HYyjsYILW9k8O62m2uFmS1xxfKUumuqOyqWiogUOEeGZwvX7lM0ZWf8d8+0hccsJ
         vEQg==
X-Forwarded-Encrypted: i=1; AJvYcCW3SzYGozj3HuapyBlzqQ4NfTUZFyoSQp+e3N9Zl5K6TarCLejep6izSAZXX/W6KYe79bQkBbFHzrvO0SVUhH4=@lists.infradead.org, AJvYcCWifkOq+wbwvn1rtEfanuMMLHW7wDPi94ncMWrWi5Ia+B/e/fhgsqiTf4wjwDiorBXSE+sWnhVNq0f2U4XibsRm@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3TWlRg9Em2Ho6lsz29G9k57lSqtT83iyuHy1IkdKdyG2UCEVC
	iCyMFcyw05rW+NSHRVDLdK1CsERm1J6eGvylaKaVfBGyiPkf1/IlXPoO
X-Gm-Gg: ASbGnctl9kVQm7OzrSZKR49aBiVrBupSACoaGxXpltJkxBUGr27g894I1HQ5x6cSiG5
	YexXnpFoXODKg5nas5A/GixMXbOO/VdJN+3hu5lj6vmG900m+xxFOnzSBJL52XXAum3dNAY8HTi
	yjVpTJzUIAGyATiRLVt+AORgxYvQ4MJr6xvoSCqfN6cY/uVi6aprS2OMR1VyKQMlELlPsnAfUQ8
	6JK/b/026oxcOvQYqz04ertAMgc4kQopJqLGE4zWBx4FpVmtejv8wfTgh47L3vkaQjeYsYEjeHA
	YMriyEcPDAVaFFn8DASqczuPoFBpN9kI7s465SaswLmehYU901lK0QZeHffw7Jwy44jwAxWJUm5
	DFPe8/D0w0qpyXwzqQ93Gnqn+uF67jzQsXeNMUFinnAG7h3i/i7bCe58X4fMad1v7b7rPkx1JCz
	fJ
X-Google-Smtp-Source: AGHT+IEO9YWESJShcqk3FC7Utf1NPhIrZbrIwKsGuQ+IRsKWJH3ytffL3q840LYxpCzfHn8RWeT7sA==
X-Received: by 2002:a05:600c:4e8a:b0:456:1824:4808 with SMTP id 5b1f17b1804b1-4562e2a5c56mr119864705e9.32.1752929790243;
        Sat, 19 Jul 2025 05:56:30 -0700 (PDT)
Received: from Ansuel-XPS24 (host-212-171-170-230.retail.telecomitalia.it. [212.171.170.230])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4562e81ccb4sm106688005e9.17.2025.07.19.05.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 05:56:29 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/5] i2c: mt7621: rework cmd/wait OPs to support atomic afer variant
Date: Sat, 19 Jul 2025 14:56:11 +0200
Message-ID: <20250719125617.8886-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250719125617.8886-1-ansuelsmth@gmail.com>
References: <20250719125617.8886-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_055632_207451_3EDD53B1 
X-CRM114-Status: GOOD (  15.72  )
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

It was reported the need for atomic operation on some Airoha SoC that
makes use of I2C bus. Rework the cmd/wait OPs to suppor the xfer_atomic
variant. To support this it's mainlin needed to do the readl poll in
atomic context.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 59 ++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 2103f21f9ddd..c0e13f9af3e5 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -67,14 +67,19 @@ struct mtk_i2c {
 	struct clk *clk;
 };
 
-static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
+static int mtk_i2c_wait_idle(struct mtk_i2c *i2c, bool atomic)
 {
 	int ret;
 	u32 val;
 
-	ret = readl_relaxed_poll_timeout(i2c->base + REG_SM0CTL1_REG,
-					 val, !(val & SM0CTL1_TRI),
-					 10, TIMEOUT_MS * 1000);
+	if (atomic)
+		ret = readl_relaxed_poll_timeout_atomic(i2c->base + REG_SM0CTL1_REG,
+							val, !(val & SM0CTL1_TRI),
+							10, TIMEOUT_MS * 1000);
+	else
+		ret = readl_relaxed_poll_timeout(i2c->base + REG_SM0CTL1_REG,
+						 val, !(val & SM0CTL1_TRI),
+						 10, TIMEOUT_MS * 1000);
 	if (ret)
 		dev_dbg(i2c->dev, "idle err(%d)\n", ret);
 
@@ -117,27 +122,28 @@ static int mtk_i2c_check_ack(struct mtk_i2c *i2c, u32 expected)
 	return ((ack & ack_expected) == ack_expected) ? 0 : -ENXIO;
 }
 
-static int mtk_i2c_start(struct mtk_i2c *i2c)
+static int mtk_i2c_start(struct mtk_i2c *i2c, bool atomic)
 {
 	iowrite32(SM0CTL1_START | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
-	return mtk_i2c_wait_idle(i2c);
+	return mtk_i2c_wait_idle(i2c, atomic);
 }
 
-static int mtk_i2c_stop(struct mtk_i2c *i2c)
+static int mtk_i2c_stop(struct mtk_i2c *i2c, bool atomic)
 {
 	iowrite32(SM0CTL1_STOP | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
-	return mtk_i2c_wait_idle(i2c);
+	return mtk_i2c_wait_idle(i2c, atomic);
 }
 
-static int mtk_i2c_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len)
+static int mtk_i2c_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len,
+		       bool atomic)
 {
 	iowrite32(cmd | SM0CTL1_TRI | SM0CTL1_PGLEN(page_len),
 		  i2c->base + REG_SM0CTL1_REG);
-	return mtk_i2c_wait_idle(i2c);
+	return mtk_i2c_wait_idle(i2c, atomic);
 }
 
-static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
-			int num)
+static int mtk_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			       int num, bool atomic)
 {
 	struct mtk_i2c *i2c;
 	struct i2c_msg *pmsg;
@@ -152,12 +158,12 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		pmsg = &msgs[i];
 
 		/* wait hardware idle */
-		ret = mtk_i2c_wait_idle(i2c);
+		ret = mtk_i2c_wait_idle(i2c, atomic);
 		if (ret)
 			goto err_timeout;
 
 		/* start sequence */
-		ret = mtk_i2c_start(i2c);
+		ret = mtk_i2c_start(i2c, atomic);
 		if (ret)
 			goto err_timeout;
 
@@ -169,14 +175,16 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			if (pmsg->flags & I2C_M_RD)
 				addr |= 1;
 			iowrite32(addr, i2c->base + REG_SM0D0_REG);
-			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 2);
+			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 2,
+					  atomic);
 			if (ret)
 				goto err_timeout;
 		} else {
 			/* 7 bits address */
 			addr = i2c_8bit_addr_from_msg(pmsg);
 			iowrite32(addr, i2c->base + REG_SM0D0_REG);
-			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 1);
+			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 1,
+					  atomic);
 			if (ret)
 				goto err_timeout;
 		}
@@ -202,7 +210,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 				cmd = SM0CTL1_WRITE;
 			}
 
-			ret = mtk_i2c_cmd(i2c, cmd, page_len);
+			ret = mtk_i2c_cmd(i2c, cmd, page_len, atomic);
 			if (ret)
 				goto err_timeout;
 
@@ -222,7 +230,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		}
 	}
 
-	ret = mtk_i2c_stop(i2c);
+	ret = mtk_i2c_stop(i2c, atomic);
 	if (ret)
 		goto err_timeout;
 
@@ -230,7 +238,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	return i;
 
 err_ack:
-	ret = mtk_i2c_stop(i2c);
+	ret = mtk_i2c_stop(i2c, atomic);
 	if (ret)
 		goto err_timeout;
 	return -ENXIO;
@@ -241,6 +249,18 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	return ret;
 }
 
+static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			int num)
+{
+	return mtk_i2c_xfer_common(adap, msgs, num, false);
+}
+
+static int mtk_i2c_xfer_atomic(struct i2c_adapter *adap,
+			       struct i2c_msg *msgs, int num)
+{
+	return mtk_i2c_xfer_common(adap, msgs, num, true);
+}
+
 static u32 mtk_i2c_func(struct i2c_adapter *a)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_PROTOCOL_MANGLING;
@@ -248,6 +268,7 @@ static u32 mtk_i2c_func(struct i2c_adapter *a)
 
 static const struct i2c_algorithm mtk_i2c_algo = {
 	.xfer = mtk_i2c_xfer,
+	.xfer_atomic = mtk_i2c_xfer_atomic,
 	.functionality = mtk_i2c_func,
 };
 
-- 
2.50.0


