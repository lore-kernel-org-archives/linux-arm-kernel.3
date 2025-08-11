Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0F1C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 11:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZpFd1p985Zt2FE0ikX1FewH4hrglpUtZfkFtt2DZdFk=; b=hOmHoOXIpgkJgEtTDQHYNjhLGu
	UCWJFizwAPJpa0RfMAGDkoR/4E1+CoOtxiaNeJBpVWkkcB6ITvKmLFnXpXRY8QdEjt+gXX1miB1Jf
	ckTSMLA1OUKHfQ9clXQ2co2Y7+FrTPzu7vNB+7NkkrnYoJ8idQlFfjYwLnsjGoTotkH/9855h1dd+
	znEW3TfaJs/Gj4uqGWpKGd4WRtqPqai+WXoCDfsuDCuwSZ+nvU3suswdAaJx9uBs8R1LuHg+BX69T
	r7YNRTxY3VK2Eg/T/bzS21PpMc1bGgEz/PV5e3qrmBBqPWSiAlb0/cvCzhQk4Vbf7aCb0QP1A6Jgi
	KenotOAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQpT-00000007XvH-0dAG;
	Mon, 11 Aug 2025 11:36:39 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQSS-00000007T6D-2TTY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 11:12:53 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3b77b8750acso2527451f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 04:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754910771; x=1755515571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpFd1p985Zt2FE0ikX1FewH4hrglpUtZfkFtt2DZdFk=;
        b=JlhDMhG34RJ/++kJhq0EuqQjyx6BVoeyFd+gnBM7OjssA0t8DG4cPZ5pkdjUHJi8jD
         6cjdi9GPLJvhLfDVqZEFDYUP1TqjuqFEEwtOh7tGV2QlchV8VyU3eKkqGI+gZB+mM98U
         bbW/dgVkn78WIxUpLCDf5nhYBx7or+LKk+uCyMRpsA/Htr3VBaR7BYThcmCHXJ1vswYE
         r/2soDK4nTzR0faA8bevqXi6cPumDcMAmLZ+UxeFjZQlsd3XND0Q3zpcP6t0kpmbFWAz
         dfkWv+ZqIw7P4lC/BOqfQTmfiMsFjZCMPZtMjjXibpdXW0XHS8ZONVBOn4fP7osDilTK
         CIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754910771; x=1755515571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZpFd1p985Zt2FE0ikX1FewH4hrglpUtZfkFtt2DZdFk=;
        b=DQziynfD/Qo0bzeeVh7UoLBC0t3YcYehTu2SDXwA2kKkw17etePLReHfopfSTvP9tM
         7A547AszkaooKzqCZOhNXJc0DnRYCg/4j6TFa55iDPhcy22XMXoP6gckrg0EHPwwQ2aJ
         mNOxvdlviO/3PedwnPwCBoO1KJO7WZ3j54aVHWMYLlfgG//HBL1iXJfERgpG+8CNkWeL
         1UuERww4/A+0nkGLnv4spMiB0J0cuVTOqf88FQipRmL2161bQnjaYxe/3ccxrTCbcgmG
         yLP9bMmBEaxqO+IYb/9OgmYgD0okPp42QLKNxINYXUURrUTldSwm4I6Mj9lFy5beYpPX
         3p0g==
X-Forwarded-Encrypted: i=1; AJvYcCVpb3A5MnsQmMMLQLjpsBk3+i5XcRNss0OsD5NsCaXXlbgOjMOyXM3WcxjGpVRdPAkA+r0Ynhrl2j8dnHI6vulf@lists.infradead.org
X-Gm-Message-State: AOJu0YxlXNMedrmE+gvxuitltI5CfxKiULaz//siFDSao/gGs51ZZTAI
	ZYO+KNUENoepxsXrdH4KcSnjXN2BmAXkQZgaZwFF7L7uEQ4neMpS9sQU
X-Gm-Gg: ASbGnct/olqEwjsOXSgHV3YO8RnOGrWQnGUZBwZcNY5sYrP6lFhJT9VmQCbgyY5VubY
	StZEbPH2s0qWJMdL5qF+093dsq00KRPOtpbuOGzAcJjOmPb7zy068iJnBPAg1mitbcC07bIFWhV
	9JtRoXtonlW+7U8gz3wDsnC20Pr4X0/NG8zaadNabMuf1jwwXWhK7+81UhjcQz5142wxaBv/Xqj
	grI2ITI+xlJGSfp+kBiEnHGc9fNEVDo5UepIZtb9qfJel1DApEnftUjFW/4nt/9IGs2jdf5T56x
	Zdu4zQZ0i2le1iZ0XdRxae2yI/rtgBRPB+RiTRDDUR5IxIsFCQvzx8KvWKI5jXgH1ZsjfxeXyIJ
	IHTvVD4jERfJWpo6CiMVS
X-Google-Smtp-Source: AGHT+IEgnc5QqrRg0lz9+OdndWHdvt/rKwyilSbik0M4f9+GbjXlUx7jAfvxAzW/AxvkKUcd3R5bIw==
X-Received: by 2002:a05:6000:4308:b0:3b7:915c:5fa3 with SMTP id ffacd0b85a97d-3b900fe7e69mr12080048f8f.24.1754910770430;
        Mon, 11 Aug 2025 04:12:50 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3abed3sm40116248f8f.10.2025.08.11.04.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 04:12:49 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: stmmac: make variable data a u32
Date: Mon, 11 Aug 2025 12:12:11 +0100
Message-ID: <20250811111211.1646600-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_041252_628578_DE0326D1 
X-CRM114-Status: GOOD (  14.10  )
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

Make data a u32 instead of an unsigned long, this way it is
explicitly the same width as the operations performed on it
and the same width as a writel store, and it cleans up sign
extention warnings when 64 bit static analysis is performed
on the code.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
index 4846bf49c576..467f1a05747e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
@@ -251,7 +251,7 @@ void dwmac_dma_flush_tx_fifo(void __iomem *ioaddr)
 void stmmac_set_mac_addr(void __iomem *ioaddr, const u8 addr[6],
 			 unsigned int high, unsigned int low)
 {
-	unsigned long data;
+	u32 data;
 
 	data = (addr[5] << 8) | addr[4];
 	/* For MAC Addr registers we have to set the Address Enable (AE)
-- 
2.50.1


