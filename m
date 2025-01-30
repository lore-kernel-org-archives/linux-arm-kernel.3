Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A4DC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 13:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qhRbu605zRQmNnQr5f4yNDwmxxb+PPe4g8I5X68vQg=; b=VJeXlfFRFO02WIjo7y8yyFlXGc
	po/Vd3jlzeuN4DHv8HrDi7ej5ogoIsJvYO7JYsLRoX7UudKcn0anNG48LX6tmSYPt2FiYph0bqeUT
	CfmKdD1uJBpq5DxkL8gNSB5k60obVHf0NjSZtxWTEzyVTNHc9L0GDkVKHdL74UiqRuIQ6+TR0Gehj
	LXhjUfojesPABn4xwrJ5cpN8RMTw4HAJ6G0X3Oj508JUQLmlaNsO2tBZqOU5FbrbGfmf6QJfGs4rE
	HqTYmHTeSNY/1653b3LXVBQMEAOZi6Go7MPtBtA/ZEIBivdvLWarP3mpbpNJUlmrzbEuvL0Svi/gj
	1HWIdnPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdUER-00000008oct-081V;
	Thu, 30 Jan 2025 13:05:19 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdUAZ-00000008o2H-2DWW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 13:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738242079; x=1769778079;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1qhRbu605zRQmNnQr5f4yNDwmxxb+PPe4g8I5X68vQg=;
  b=NwZqyzSyMM5eX49ivPuxL0TBvqONqLK0euqFjwCn1U/VhurJCAGtAJVQ
   kYXPxyGodWZfcbL7sLo44MxjQVjJ0NDOehQcZsqrLibWq7k6AhTplIJ5F
   URXE5Hwl13jmwQYM/+eAYRvqI8tYI17m3ANj6DecrW7moFvi0yCr4oUgS
   Aj9Hxzd5FgUzos8OEceFRlgoo9adbC323Lh3y+tBS4rXMH0DrA9w33tHb
   7AIHrk1lpYdQa1GyLekmCIFkeo0U+mmJ3zHjI7jb4j2gYjmxOiUTw0bNE
   uv9Nb/nOFkjTjMluhs6a8QxYt6L2B5ABpVTTof1zoqlpwrTRDO4308w24
   Q==;
X-CSE-ConnectionGUID: JJtIfw3ORCuByqg3pGf1Qg==
X-CSE-MsgGUID: 4kNxiujQRCCAMM/dMkGYkA==
X-IronPort-AV: E=Sophos;i="6.13,245,1732575600"; 
   d="scan'208";a="41374603"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Jan 2025 14:01:18 +0100
X-CheckPoint: {679B781E-55-1CE016C0-E589DA3E}
X-MAIL-CPID: 98CB8C2355A9D21FC1577AA8A1651977_1
X-Control-Analysis: str=0001.0A682F1E.679B781F.0017,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 239971675B4;
	Thu, 30 Jan 2025 14:01:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738242074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1qhRbu605zRQmNnQr5f4yNDwmxxb+PPe4g8I5X68vQg=;
	b=P9QJefT0IPrYF3Smx7qjegIOujC1UdIQEbRkT1xuE8bxTOBvLsqHGEeFdzscAwcDJ+gPGb
	KhIWzDI0KjaHF5c5j839jT73xUxiBsm02iB7yk8iUQ9MZ5WkNsGpPW8z3ES3OlYLCJxkuW
	HXffa0F/I1ilKFp1Re9HSa9rEi7YpsFIxQuUPcW97pguod14f+wOP212efR6FeMjeBD753
	TXnXa2unORAgGjIoydKlpc9jGkc7Jr5HImyeJvGzIBtFaT0i8t9E+/HjJ12qYjMkDUKAX8
	wFITMOScrgV+WjGgf6CdSduR2v1THwCDpXYoVWmol7A+MM0toQlPZuLP4xZkdw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] nvmem: imx-ocotp: Sort header alphabetically
Date: Thu, 30 Jan 2025 14:00:59 +0100
Message-Id: <20250130130101.1040824-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_050119_869327_7659D8A3 
X-CRM114-Status: GOOD (  11.84  )
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

Move linux/delay.h to the right position.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/nvmem/imx-ocotp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 79dd4fda03295..c5086a16450ac 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -15,6 +15,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -22,7 +23,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/delay.h>
 
 #define IMX_OCOTP_OFFSET_B0W0		0x400 /* Offset from base address of the
 					       * OTP Bank0 Word0
-- 
2.34.1


