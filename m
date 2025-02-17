Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B54C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 13:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbeb5r83+UPFkm2mU3wjQcSB1vvJRZ9Ts2ZaqiOY/R4=; b=EVeJWHVMWrIUNhRjc/4WhGoebE
	SyZndVjZ+guestxSRC7UcNojMCtUXF2DgsNzSLE+++H4XfwUpAnHfYuVzV28sc6uy6jFj2mYBnnpU
	HgA+3e5gNK1si6sTalcakWftkivkwpwW5dZZsrWpe3V6IqJiLV90J1bFaiQNOY4cNLPDuIG1FY6DH
	S/1RxgkIuGXjDPM+Ho41D1WDohYQXgCKQ83/pRADyiAZ+Q0ThvV2oJblV5tTSrV394KUyKr+Avwsv
	j0phkcC7BQ5JTW4ol6nQdjsfgROwZ9o0eqghrvoGqFU9gx+Wjn/ZmIt+/csEUgocvz8Un0X+0gm9E
	cMf0Dk0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1CH-00000004fd1-1Zi4;
	Mon, 17 Feb 2025 13:30:05 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk13T-00000004dJP-09rb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 13:21:00 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739798456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gbeb5r83+UPFkm2mU3wjQcSB1vvJRZ9Ts2ZaqiOY/R4=;
	b=d5jB0xJXoTyTwgDgL40gNhL7fZs+btbkLpIzQuu38ljnPA9b8w2LA9NKyfifL3mJAc6Qvp
	pytLIsp+wLaDrsxRG+VuqR+9kGoIEPU/McIAAJzave9ybBFeZfiF7SvbgM8+hdK45EdDA1
	vDDV/yaRJ8BBYDptzZo7G4TzopIKPhVaVW04/M3g7MraDIzgWaTfeRxD/OKt7Gy2/dkUqI
	acYCFbyMEwkKDlq97wNKNSCMIKrElxQZ5ybAcfO8hpJbZTH78k2mgB9tfK1RkNqVWqtqWQ
	wViguwAAJ6gVlzu0oZfvG7m0mT49vsQJ0gY8Umg9WD8zOMnxGUyZcKg4T7h8LA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739798456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gbeb5r83+UPFkm2mU3wjQcSB1vvJRZ9Ts2ZaqiOY/R4=;
	b=mubjWXn7gLl3dddAC7nuohS/Ogk87r44F8Bri2mDA86y1PwASaWyFRvyb9d4TXLF4uOwFq
	980OJgClFJ/NavDw==
Date: Mon, 17 Feb 2025 14:20:52 +0100
Subject: [PATCH 2/2] usb: dwc3: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250217-restricted-pointers-usb-v1-2-78da55158832@linutronix.de>
References: <20250217-restricted-pointers-usb-v1-0-78da55158832@linutronix.de>
In-Reply-To: <20250217-restricted-pointers-usb-v1-0-78da55158832@linutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739798454; l=2152;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=NmTXArkbCsEGtrZw6Htg9wNi1YzBDBTbhT9Se3ioLsU=;
 b=DUElj98qKMcAbor1XcE693UU/tdrxjutcIGl4jtddyzHWb5R/Rp2abI+G1ZDv4QsZvtvFvqKW
 Xwl965q69SOCkAFoEEjVju4vIpz3PWYgAn+5cAoqErLd5rY0HeX9UO6
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_052059_218626_31E9E26B 
X-CRM114-Status: GOOD (  10.52  )
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

Restricted pointers ("%pK") are not meant to be used through printk().
It can unintentionally expose security sensitive, raw pointer values.

Use regular pointer formatting instead.

Link: https://lore.kernel.org/lkml/20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023@linutronix.de/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/usb/dwc3/dwc3-st.c | 2 +-
 drivers/usb/dwc3/gadget.c  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index ef7c43008946e15b72d88aba4941dc52bf0788d7..5d513decaacd22de15825dc061c2747cf09fef07 100644
--- a/drivers/usb/dwc3/dwc3-st.c
+++ b/drivers/usb/dwc3/dwc3-st.c
@@ -225,7 +225,7 @@ static int st_dwc3_probe(struct platform_device *pdev)
 
 	dwc3_data->syscfg_reg_off = res->start;
 
-	dev_vdbg(dev, "glue-logic addr 0x%pK, syscfg-reg offset 0x%x\n",
+	dev_vdbg(dev, "glue-logic addr 0x%p, syscfg-reg offset 0x%x\n",
 		 dwc3_data->glue_base, dwc3_data->syscfg_reg_off);
 
 	struct device_node *child __free(device_node) = of_get_compatible_child(node,
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index ddd6b2ce57107cb62c5cec02eae3fe3524164469..7ea1dcd07f02999c913f1520ec05bbcf1a43d8d5 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1971,12 +1971,12 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
 		return -ESHUTDOWN;
 	}
 
-	if (WARN(req->dep != dep, "request %pK belongs to '%s'\n",
+	if (WARN(req->dep != dep, "request %p belongs to '%s'\n",
 				&req->request, req->dep->name))
 		return -EINVAL;
 
 	if (WARN(req->status < DWC3_REQUEST_STATUS_COMPLETED,
-				"%s: request %pK already in flight\n",
+				"%s: request %p already in flight\n",
 				dep->name, &req->request))
 		return -EINVAL;
 
@@ -2165,7 +2165,7 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 		}
 	}
 
-	dev_err(dwc->dev, "request %pK was not queued to %s\n",
+	dev_err(dwc->dev, "request %p was not queued to %s\n",
 		request, ep->name);
 	ret = -EINVAL;
 out:

-- 
2.48.1


