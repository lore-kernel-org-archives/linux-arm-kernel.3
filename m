Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D11CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 02:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4muAkhfm5VzCuxMXlVVQ1rf7i8L/csvKiPTRJAXnMMY=; b=uL3Ix7jhW5C/maXqEFzMs/nQuV
	+eUb//2PM+/GfiA9PHOkuYLrDWAxscJ2AXRM8NK2cdMifXwpXy7U0qPhyUc0aBmMyhO/cvCv69v6a
	slW1PvNTybIwHJtXsxxdRcxU7ujwnb1TJJT0ncXw0fa2h64eQEXmG/Yvz8YiRLledZnAVDeC4U0/c
	gZcn44SvVPBMbKwNXFvWisDHrIzRWR5qFPZmN7KRqxqAFM7Oj42CEkKt1GW1I2FyQvijDlRL9VPew
	lPcdSYYFbvPOcFcTqtkqqmOVH69fp39f3EW9zav2eX7rjVMXQpka2O5UB5UG+N/sMFINc8sJC572K
	0AcF5eBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwmu-0000000ALUk-0bJ8;
	Fri, 26 Jun 2026 02:59:28 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwmr-0000000ALTS-3z26
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 02:59:27 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c7f11150cfso3603945ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 19:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782442765; x=1783047565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4muAkhfm5VzCuxMXlVVQ1rf7i8L/csvKiPTRJAXnMMY=;
        b=U3HWehyDPxNU2m7A8EkOgZzZ7YTD0BuD2qr1mts8C34C6vYh8UcPHJGSDnMqSnX/dp
         o3mMcIzykd82JsYvIfDKdJJXQ3VvTwYu0ZmXBQrAnzAaKX67KyiMVBL7xy1A3VvsBJSC
         bHjvtBvZ21moCX9IIuKDZXbmnMpj0fVvffUU0pbwh+G47rP0MxErMlfdY4NSeXpkT4BB
         7ekGBc4ZK+lZ8sKzKOukWVvCNr721sF2+9zVmyLDREK3H4mc0PMOi99MPtR4ehsfLlbF
         mXsdYdw5vFbAznzJQ4SNrD8m2orGorxcAtGd5c/GFcbOb8ZvjzL1oecEkp0XmMMqDHU5
         wXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782442765; x=1783047565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4muAkhfm5VzCuxMXlVVQ1rf7i8L/csvKiPTRJAXnMMY=;
        b=r0Mu+4qRk5Gvcpt2hHUxAhgrWxk9kA5EAQPK/lw3bZDXluqV6im0Qa8Ai224MKT3xm
         qKdDXDcMR0IU0u3kDoVs8gTcGvDxh00aAKbXlcwvWiS/ZBzZ9M/12b7GKQZzOyTnZg41
         wJF6Tpvv19C0b6op7ZiwTArGYYE06Ai+EAtUgkSq7FrSa5tBNdSmLpDQuT05W9Py75Fg
         l+tk+YR3G1/plM6hLK0gvqUDKjPnCG3jmfvYbxWyusZoi4fCK8wsMBQOXiYLYWzWYFW3
         CMOWvoBgustuhQSxT8rB8UNMIDRt+f5HL+K6/eUBEib366XYn331UmwdN4B04NlZ/zDk
         G4jw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/IJZQ7BwZCcBQr9M2ESycP3GOgFbTGM0mVt4QamyuW4keaWiQFk2O2TJWJAYa52fvI6aGyrhsjlVXg05i8TzD@lists.infradead.org
X-Gm-Message-State: AOJu0Yz28dG+oIJE58IgACcXR/pXbX5BycboFXdKSeQE2hUVd7oqoYlE
	NSZvgtrdD5EBfrJ/aQhsRiO5Ge8MpLO3vm8Z0JQmBQqpfusq1PTTWC+d
X-Gm-Gg: AfdE7cncZaqhZmw/BRG8cuOJN3zedshqd/6C86mpIrbrZ+XIEZQKyMtv4B+B01O90UX
	7vA3eLuFavp+wm+rvLKvR5sJ2b3vzZFVHZ1pdsENk5lFISH324F5dTNGflM/s+UGbhW8p7O55OT
	GIGTRKz8m1ESEZKT5OgkEb2s4kTW1AaUEYxf9ot/ynX0s8xzUTMLRDUhfkGNTNinIaMDXMIttTD
	+NmtemkYU0/hPRZBhp49WMOuONurooQR1xc0MFLwI9n5DwPZhBUXfKCUzSlaZZRN0snOik3EUnp
	G4PUR90ASM0rkPolfs2vfBMHUbyRLPmc8DqoDiMlIDyZgirUq3GPgb30wVafHTg6By41wTAENpB
	FpGM+zqFg8PgdXDFn3LCBcbbg4j81qn/bfv1DbtlqzvlNIvVB7sCl7UpqGtK4nT50UoQliAx59U
	doXcjrTo8/QYU=
X-Received: by 2002:a17:902:e545:b0:2c1:ed61:36ab with SMTP id d9443c01a7336-2c7fc73b73dmr47872215ad.19.1782442764905;
        Thu, 25 Jun 2026 19:59:24 -0700 (PDT)
Received: from archermind.. ([182.150.55.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5afb1e0sm31252535ad.29.2026.06.25.19.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 19:59:24 -0700 (PDT)
From: Liem <liem16213@gmail.com>
To: frank.li@oss.nxp.com
Cc: Frank.Li@nxp.com,
	andi.shyti@kernel.org,
	biwen.li@nxp.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	liem16213@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	o.rempel@pengutronix.de,
	s.hauer@pengutronix.de,
	stable@vger.kernel.org,
	wsa@kernel.org
Subject: [PATCH v3 2/2] i2c: imx: Cancel hrtimer before clearing slave pointer
Date: Fri, 26 Jun 2026 10:58:46 +0800
Message-Id: <20260626025846.106157-3-liem16213@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626025846.106157-1-liem16213@gmail.com>
References: <aj1UR5ddawsdMbZC@SMW015318>
 <20260626025846.106157-1-liem16213@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_195925_991031_86E8CF1F 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

In i2c_imx_unreg_slave(), the slave pointer is set to NULL after
disabling interrupts.  However, a pending interrupt might already
have started the hrtimer (i2c_imx_slave_timeout) before the pointer
was cleared.  If the hrtimer fires after i2c_imx->slave is set to
NULL, the timer callback i2c_imx_slave_finish_op() will call
i2c_imx_slave_event() with a NULL slave pointer,which results in a
use-after-free / NULL pointer dereference.

Fix by canceling the hrtimer and waiting for it to complete after
disabling interrupts, before clearing the slave pointer.

Fixes: f7414cd6923f ("i2c: imx: support slave mode for imx I2C driver")
Cc: stable@vger.kernel.org
Signed-off-by: Liem <liem16213@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 17defb470776..f02c216ba299 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -959,6 +959,7 @@ static int i2c_imx_unreg_slave(struct i2c_client *client)
 
 	i2c_imx_reset_regs(i2c_imx);
 
+	hrtimer_cancel(&i2c_imx->slave_timer);
 	i2c_imx->slave = NULL;
 
 	/* Suspend */
-- 
2.34.1


