Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FE5C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 18:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnT7h38wk2Tx5Bqn00SrYumy1xtf5pPAUEWMtYlgi4Y=; b=ChhqfGHudXkskn56pOXxfSYcyI
	6ZpFUaKfWQz9sqz2tp2pvPUFxGJaL3Lob92raAoguiD3HUdKnYdMQophEwW0ljWPrsAIEtSY4C19h
	l6uokeNCexi2td6l/0PGP4ekFIUhS7JCvd6TBzXePI0kQxuiFTTQiWa8j0gTuAuTR5afB9K1bFAZw
	HiPfuNcE4Mqf+yoCGIalSVb+ZjU3cw2B4WErUCauIeiJQgd6zjh29AVhfEgL7SYZIAWBqhyYY5SOl
	vucOCA81vPZ/xFMEZ6FsLo/uaRoSPo8Pcn+9TkaTyzK/jRtJ2iUGqIBCMaEIDClRM0qTsOv3lLgai
	kN5aKpHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trL8b-00000000wKz-15F4;
	Sun, 09 Mar 2025 18:12:33 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKuw-00000000uCi-3ysB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 17:58:29 +0000
Received: from fedora.intra.ispras.ru (unknown [10.10.165.2])
	by mail.ispras.ru (Postfix) with ESMTPSA id A693540CE19F;
	Sun,  9 Mar 2025 17:58:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru A693540CE19F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1741543100;
	bh=XnT7h38wk2Tx5Bqn00SrYumy1xtf5pPAUEWMtYlgi4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qk5TaXam7vZF3GgpvkRfqvLbrNaaBXTYxwQ2PnwjMxP0NxZcixpuFHZYuV/384Q67
	 XphwSpNWgRDrkbxhvL3udAcIWhSCnDIbJTZjUIBRkixDEPNmBkYCij3qgn5Au7BD71
	 akkY0I+ZIlwqkUB2zWFjhMxJ+OizZ4ckjvcUP5ZE=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Peter Chen <peter.chen@kernel.org>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Sebastian Reichel <sre@kernel.org>,
	Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH 1/3] usb: chipidea: ci_hdrc_imx: fix usbmisc handling
Date: Sun,  9 Mar 2025 20:57:57 +0300
Message-ID: <20250309175805.661684-2-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309175805.661684-1-pchelkin@ispras.ru>
References: <20250309175805.661684-1-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_105827_562973_D0F5109E 
X-CRM114-Status: GOOD (  11.65  )
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

usbmisc is an optional device property so it is totally valid for the
corresponding data->usbmisc_data to have a NULL value.

Check that before dereferencing the pointer.

Found by Linux Verification Center (linuxtesting.org) with Svace static
analysis tool.

Fixes: 74adad500346 ("usb: chipidea: ci_hdrc_imx: decrement device's refcount in .remove() and in the error path of .probe()")
Cc: stable@vger.kernel.org
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 1a7fc638213e..619779eef333 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -534,7 +534,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		cpu_latency_qos_remove_request(&data->pm_qos_req);
 	data->ci_pdev = NULL;
 err_put:
-	put_device(data->usbmisc_data->dev);
+	if (data->usbmisc_data)
+		put_device(data->usbmisc_data->dev);
 	return ret;
 }
 
@@ -559,7 +560,8 @@ static void ci_hdrc_imx_remove(struct platform_device *pdev)
 		if (data->hsic_pad_regulator)
 			regulator_disable(data->hsic_pad_regulator);
 	}
-	put_device(data->usbmisc_data->dev);
+	if (data->usbmisc_data)
+		put_device(data->usbmisc_data->dev);
 }
 
 static void ci_hdrc_imx_shutdown(struct platform_device *pdev)
-- 
2.48.1


