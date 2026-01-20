Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A13AD262A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 20:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6EvQ/5He659QnltZ2hQ5JWhAbcs5AVgWTzcueB+MkM=; b=qLPwbL4i4jzSwtpIhocTnViZnR
	fLm9eGdhnny8ZwDPVS1hYd0IgYvtbmyxCY+piHYJyTGjyfbwt7uxyRSikdCQTHqfzdeikijZABQqk
	sGq2oJie0OoH1foc0CFuBVzO/WCWMLogwrRFXKerjtuJM4aHJD3CSCYjuSEnL9GATEKN4YS2YoFeq
	3P0IHGJFyowriR48ikDQH9fsJ56aJwSoRSFOkpkERjbXdU4E83Hx1z6Wnqx+QGHC4br5Mw9iYYVvl
	65znV5JzaXeCBzEDlW2Mw5qF2C1BguC2wtuRJE/yFTxDOI7TDGhc1N8RHqhJTtTsHG7DXBcZKrgtf
	6Lu5INsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIVP-00000004RlO-3aQF;
	Tue, 20 Jan 2026 20:39:15 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIVL-00000004Rj4-01wD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 20:39:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47ee807a4c5so44044765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 12:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768941549; x=1769546349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6EvQ/5He659QnltZ2hQ5JWhAbcs5AVgWTzcueB+MkM=;
        b=KFLPm0NRyME90Vh7z7p9S4qhzD/9PSxQvp9QUdhfY7xV5+LZuOqhQY/Zr4U70VN6XN
         XMZO5WQEwb9kjZ8mhYAhzxJdJsEDBmYaT7BiorRvIpIlKtBm3SJ3rU/8WWf5pBQ9Al8J
         s9kYXxBjmWVR9H3VuyHna42RruJpK4SkQvC6PS+4aAnkfejPwMMVFHKx9eNwza10KbHY
         IMMyRCQZdoNFhrZ2YpNd/XTu2a3fGH+pLdslhcXRemCVRhjHMUgkHHwc+FlfqZdB2z0y
         XWVt0JLNYPZL24jAlrskQOfkoFXL6N5SwrkuWyZlaZg5fHwczXvkmyumCZkLK0wvftZB
         SVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768941549; x=1769546349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u6EvQ/5He659QnltZ2hQ5JWhAbcs5AVgWTzcueB+MkM=;
        b=ZZh/pPwTNQglxSy0Ua0vtJ2t2GoAnQbG+6V9itOW2hQ4uFhylqqh4Ah+q+nkfckNGT
         beqhNtezfMpfKGthlFlEKnmiaCtcR49MIYCJrxEf4lvDRQe/63A3T5N7oc+sebnQ0EUf
         z5Mo6u6uJVSJIlRVWvDiOEQR7bOpnaTy+MM9eh3PVNc7IySjF6wsn7rltq2wPZpKaEt7
         Cgid/2JlwFU31R50+h9mxSgU9nf6NN04bxpntPPP7lVuUqPbVjOnyFiK913c0iiIpcie
         1mEJ/fMQnatUQgknBtnasEZ1F6bjbbTPrzwqCWeIqI3ErMeJo53NPrnmR8M8QoXCEHSh
         d3Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWKaUFNJd62mGquoKo+2ZCqvUYMeQk7Fu/nvr8G9t4wESuDZ1i9D8IU2+G67BjQn7FPwuDBtCsFo1NU+Bla6yiN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3/fH123OdcgLFvS8qze79CHThgJgdcSMDmrrXxOGcmm1LQyvF
	jrDYZ3nujnCNH7WAb+w3M5VFk2CX8dl2sIvEgsSjlqmqvIdwdFmHzpe3
X-Gm-Gg: AY/fxX6SovxHnO18pHOuiMi2/1vyZXNcjwrySWFXcWcAvpiml24cV2XBU4Y4JPfUZsY
	7aQoBxrUT0dk8/WlpS8C1a+laRsh84urcYLHvxs5CAQLwGdg6Riask9gKyoUpMRmkoWV2d0yJ67
	1cAOZ+HonG1DojR84ukEWd4QHn5RJL0Fyt3Ng0zK6znYFfz8GXJj7HtG8iRr8/yMimfU0EumrIG
	rftDgAodXaUp0DFfCUec9nr1356Dhkg/oa1BuIza9/LclzW5Rx3lcBhXF4HARUOK5K3QwgDoOb+
	efBQon3D4mPLHL01IvS/SVLWOVMhg5Kdbys+eKzHB/z8C8KfdW3QtFiF27wUpzRm3s6OBw4eEii
	fWl69pIPrchL0ZA5/SyjcLjnTARnKabfORTaWaPctDgpXVcnDisp4B3HPCaWxEgfgAUwbQBV8ys
	Deq/LCfzinCya6PGvXKzk59TNK3Dw=
X-Received: by 2002:a05:600c:4e0f:b0:47e:e779:36e with SMTP id 5b1f17b1804b1-4801eb0375amr194243815e9.19.1768941549092;
        Tue, 20 Jan 2026 12:39:09 -0800 (PST)
Received: from eichest-laptop.lan ([2a02:168:af72:0:378b:c660:2f9c:b651])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042c3a7c1sm850425e9.13.2026.01.20.12.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:39:08 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	maxime.chevallier@bootlin.com,
	francesco.dolcini@toradex.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH net-next v3 1/3] net: phy: add a new phy_device flag to keep preamble before sfd
Date: Tue, 20 Jan 2026 21:30:02 +0100
Message-ID: <20260120203905.23805-2-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260120203905.23805-1-eichest@gmail.com>
References: <20260120203905.23805-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_123911_051480_5A197A9E 
X-CRM114-Status: GOOD (  12.03  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Add a new flag, PHY_F_KEEP_PREAMBLE_BEFORE_SFD, to indicate that the PHY
shall not remove the preamble before the SFD if it supports it. MACs
that do not support receiving frames without a preamble can set this
flag.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 include/linux/phy.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index fbbe028cc4b7b..a978173c0e2a1 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -802,8 +802,9 @@ struct phy_device {
 };
 
 /* Generic phy_device::dev_flags */
-#define PHY_F_NO_IRQ		0x80000000
-#define PHY_F_RXC_ALWAYS_ON	0x40000000
+#define PHY_F_NO_IRQ			0x80000000
+#define PHY_F_RXC_ALWAYS_ON		0x40000000
+#define PHY_F_KEEP_PREAMBLE_BEFORE_SFD	0x20000000
 
 #define to_phy_device(__dev)	container_of_const(to_mdio_device(__dev), struct phy_device, mdio)
 
-- 
2.51.0


