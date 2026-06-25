Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E48CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 09:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58+0tcE1xtERmBsdwhzofL6yvn0GjZ9wff4i+1M3Fr4=; b=4bY25r/KwGM/z+iwBlunkybXwp
	AG+GunFunSRrALFbpM6yE1k6UdQIm7P6a4dzVNcS8X87f0iThzzBH6I9FvU01mpUDCix4lqObjXSG
	opWsIvHBL0fiN/Zui5kq/+Im+ecZcAE7kwZ8X7ad+aCwMLHCUKG0tKXCw8KZUOP9G/AHHSR+L0RQE
	+rhxu+bb6q57avfJrKDFGjGaMjr904MJ5h117AvaW2JwDGP/10jZZom3MIBhsFkRKYlJB3YQC4eOf
	5zxxfNLQoz3VbU/4aGUOixM/Gmvfl45eGW6aECYDZd3RQpI5JPZANqKEMjCZH9QiEyASSy2x3cLz+
	Gve1m3QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgeL-00000008w3G-3G7O;
	Thu, 25 Jun 2026 09:45:33 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgeA-00000008vuS-2h1X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 09:45:23 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-37d4ab2e7c5so1801511a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 02:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782380722; x=1782985522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58+0tcE1xtERmBsdwhzofL6yvn0GjZ9wff4i+1M3Fr4=;
        b=g2BFvDi+P0zORbQtVgQUFK1ZiLsCE4Bj8WwgVX7hSrhH7s4asAWODfC1a072eeDGw7
         6XYzbawySvetCqUAQVhX0wmjqXwYrUHKM9n8goCFZWGxxsaMLjdnj/y2TpQ4Bz0scEoj
         PuxCks8FpsLDgUEc0PAa7nGdFIU2nAQDWYhVjX15Vx+Qvo05zP5kJHPl/PlFJQT6KqEl
         wMzIEOaEJBxH63dyI7ERJnK/sa5XDXBRAtGtfs4yzn8UHuBWDJDwEnp9KFgp/wQDk2FU
         red+PRf4xy+XtjPVzh9hM5jiVwoQiTdQvfeKvetz1X18WkfQrQz9vRh/sGmLZ80vbE9c
         GOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380722; x=1782985522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=58+0tcE1xtERmBsdwhzofL6yvn0GjZ9wff4i+1M3Fr4=;
        b=q4HFdRDfVV5lahQoRzvavEIKpSZcwLgFTnfE+rdtfxqtQRnejTjtipNq/CcBf1u2N1
         Xa1sNTLTkpA00Ph2pisQgoryd1akVpMf9/ouVuQRTl3KeXDREGn3pg2gWlRF3itAk4Sd
         RzZou8GDkfTK50fciY3TbiEOq+gzb94chKvL3DRVqqVqIW55PMUWivTYnk0uHraLn/bX
         CLsH0kbtccsPKp3ATTaeCl1YOsvtbq4QJzFQs/D9zLRteI7H5h5FHYqaGOkwABmMOrWe
         Sl/D8TW2IaaWuS86y21J8T5fQAHZ9pdu7fbyvHVu4qVng+ljDp8lE/JkUKfBI11trYAM
         +Gbw==
X-Forwarded-Encrypted: i=1; AHgh+RpHxdNt/diCBJezWI7xOkFzY3xV35z/0YzEH9hMhMjHkJxhrRucsRTVDidjyAmkNs/XJZ/KUFrCUzjrMwDity+x@lists.infradead.org
X-Gm-Message-State: AOJu0YxsxBoWbL3cuOHSOsuMaBZD5xfiuIe89K1GZc6N3zGJsH7UmeO+
	qx/QmoPmH29u1mqAxJeY6tU99Asy+TRp4gJvEJlzbPcyqJKdRTZEk+K2
X-Gm-Gg: AfdE7cmMIcgnXlpJS/1nre5Dor5g9eiHgAUT9IwpPtoOzElQJ6Idom8Q7CSr71yjNxN
	miy6XZzl8+s2wfmYxSkV/BJTOzIOvL6SFRSRAMM9DRajBC76+dYCN3gBtP+EoTmxI2OTTG8cKIq
	JjTRkAM/aig6Z2Z9edA7O4fOus/Pha588cQJeKfr3zgQmBgZoMc6lHglwM5GSOdn1lr2bKD885b
	lX2pKGch3GmYv+b+GdrUgAbJgjhjcT1K8SglcBz9J8d5UZuWCzFtToFtkc7qqzAMlccBs0ekUfR
	0l9LRP2MOykGyNXzG4xag5bnbPt3H0lNlu5/V6WeAqeA3RLeqYG6AUHCAR16LPkJkf78hNOrhnT
	9AU7P9ph0CSUyhd24uF/Qf6boWN0nY40eOOlF28S//52QByG51/XzXQ9su22mcSJQodCFmK772I
	R5kmXWwNA3MfcRpeDCrewSYFAul59rfwJXN0YqJJT8+tHsnKzi4dZy6ZMXp7iQsyOhJtSCHGQd1
	A==
X-Received: by 2002:a17:902:fc84:b0:2c6:afd8:5704 with SMTP id d9443c01a7336-2c7fc632ba3mr20484605ad.4.1782380722046;
        Thu, 25 Jun 2026 02:45:22 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac8c26sm16614995ad.1.2026.06.25.02.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:45:21 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v5 7/7] drm/verisilicon: extend Kconfig to support ARCH_MA35 platforms
Date: Thu, 25 Jun 2026 17:44:49 +0800
Message-ID: <20260625094449.708386-8-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625094449.708386-1-a0987203069@gmail.com>
References: <20260625094449.708386-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_024522_681723_DE5E3CEE 
X-CRM114-Status: GOOD (  12.66  )
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

Add ARCH_MA35 to the platform dependencies to allow the driver to be
built for Nuvoton MA35D1.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
index 7cce86ec8603..295d246eb4b4 100644
--- a/drivers/gpu/drm/verisilicon/Kconfig
+++ b/drivers/gpu/drm/verisilicon/Kconfig
@@ -2,7 +2,7 @@
 config DRM_VERISILICON_DC
 	tristate "DRM Support for Verisilicon DC-series display controllers"
 	depends on DRM && COMMON_CLK
-	depends on RISCV || COMPILE_TEST
+	depends on RISCV || ARCH_MA35 || COMPILE_TEST
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_CLIENT_SELECTION
 	select DRM_DISPLAY_HELPER
-- 
2.43.0


