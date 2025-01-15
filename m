Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A712BC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 10:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OX/Tra+iC1Y8QVUgMsncLLlp+FGKhTu9wrEl8cIWaXc=; b=n8xugYf+1sevIBvI0ByMvSD8Hb
	6f15CsVFMa8UY9MgVvBqglqrhqJpKg0TH7sNLz8J22z8ZULpjEmJFgHDY1du71JCF+ciWN5Z+gtt7
	RWEP7JHJpb6VaYMzKN0x/zFA0J0zN9ZyjgAJg5iI5fsZOFaPn7vIyhS+PjXtOwIh2MZstpIbkM629
	XybeGJp8kyx+leKbX8QhPadzM6isieCzHWEW6V1vvAHSftOU/o0ztGVmEhNUcDsyBqpbse+eRm0+A
	US243yVPDB+gdzYzfWNCc3cb2iCF8iJNd1ymjGBmM8UmT0tdKcpWvP5m3VwioHe/Y5ygIx5l0kUdP
	ro7ulSqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0tK-0000000BYWh-1PqM;
	Wed, 15 Jan 2025 10:44:54 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0oU-0000000BXdC-18LG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 10:39:55 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so1104707a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 02:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736937593; x=1737542393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OX/Tra+iC1Y8QVUgMsncLLlp+FGKhTu9wrEl8cIWaXc=;
        b=O7jhabW89CL72OIRPscDXTkJV6dSrBvY3iTaTThaFkWw2LlAzZgQg63lDUTEXvk9tE
         VSKoGBepbWAT1jJcSuMH8fs8sA2laKhf/u0/R+9TdX5eVGayzsG/h7vavDpjeLXDMNAP
         2ZP/WV1WfIWNCiJRcOGH4+bK5t9dEo4lbVIEYqWo3pQJuyRjdW7hnm5tTeoY2/3W4/g3
         cpDCDuDz5nKj87ccWPIZ0YS7blawV/fOysaMT/BrisJiJJFjVANeOKNvTbIiyVan/N+H
         PmdHOks0E1hXDjDnSTc5/ujM8zBG7jlA/iUxse2Yp6vMyqsVNTPNt7NjDfVyPMgGoa9w
         QH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736937593; x=1737542393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OX/Tra+iC1Y8QVUgMsncLLlp+FGKhTu9wrEl8cIWaXc=;
        b=JtcrZw0YpCfH2d8nYAQyrS3MKA0zG2a5VMwGSmmPFRJSOBJGHQk3dZG43hGbl1MgWF
         IXzYygDgn/ILsYiRf1qtEXN57Mr5KgR6xeG8jZp42AjPM7MQXWSq/kC7IVXfunApqGq/
         l/8a1y+S+5AWdWGjyGuRzv9kcBU6NCSYTj1TA4GBgM3W+zs7Rapnc/B1BOBQsXKHzdh+
         35Vw2rPn26AbFKUNwzcoNB3fP5xQWU08NPNcpJrJReAEgQLo6zPmzDcPqMfe6iDYNzHa
         /Zu3p5XCWOYjrQNIW+FYiBaXkG3cGLKDsz3kvb0hK7nT0pt/rpCJkE671azmTMKCbE7j
         WJpA==
X-Gm-Message-State: AOJu0YzWJAlwJBN1RLv4LrHOGQfj8p5Pt9JE+MxaWA+sbXn2pd5qsjwG
	Jzt4SXCqtDdHYXR6Lm0+LL9lsI3CCTwF7wYyO08qjojXFkckEv3KG7bn7w==
X-Gm-Gg: ASbGncuek3qUILIG5wCM9pIX8M3Q3O5krxIzaA2sMZTOG7HDwhF1/tFHVBC2+CzYq32
	y3RMrE7QNaDSFSi/mbFD3qtNdZNjoKbyyVuKZlbpdj2omG9cyTSSrzf86tpYO+VwFm415Lyz7/G
	xnXzjqXza169Z2ahA/CrRxs/3YDZWSFS2eWxWD1Ab4flqcqCAYauLA8lem3x8PNW4up8fsEeaq+
	NQicyNCbXIwaYeyU6x3gUiJPMY+7gi2g37j6FaBOwTx35GM9vIj
X-Google-Smtp-Source: AGHT+IEKVN7WGT9GPcFhfkZNlMUXgmym0EXxg2Shkuwydza/uh70p46Sq7eJrL7kL3M/TYHp1jIa+g==
X-Received: by 2002:a17:90b:534c:b0:2ee:c30f:33c9 with SMTP id 98e67ed59e1d1-2f728e1cedemr3692871a91.14.1736937593001;
        Wed, 15 Jan 2025 02:39:53 -0800 (PST)
Received: from prometheus.lan ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c20a9bdsm1168040a91.31.2025.01.15.02.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 02:39:52 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH] ARM: aspeed: Don't select SRAM
Date: Wed, 15 Jan 2025 21:09:40 +1030
Message-ID: <20250115103942.421429-1-joel@jms.id.au>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_023954_306701_03BEF24C 
X-CRM114-Status: UNSURE (   9.94  )
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

The ASPEED devices have SRAM, but don't require it for basic function
(or any function; there's no known users of the driver).

Fixes: 8c2ed9bcfbeb ("arm: Add Aspeed machine")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index 080019aa6fcd..fcf287edd0e5 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -2,7 +2,6 @@
 menuconfig ARCH_ASPEED
 	bool "Aspeed BMC architectures"
 	depends on (CPU_LITTLE_ENDIAN && ARCH_MULTI_V5) || ARCH_MULTI_V6 || ARCH_MULTI_V7
-	select SRAM
 	select WATCHDOG
 	select ASPEED_WATCHDOG
 	select MFD_SYSCON
-- 
2.45.2


