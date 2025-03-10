Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0E4C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 15:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K14g7P5Sc0PtDGYG0K97zMcD1wLmc9SWms5AZ+7zf6U=; b=T07AMKINIZbl5s/S5ccCKD5AxD
	WlAC5M4XiObDHsGsItGoS7CnuT4ZzbYhWXJ2BZklZKBW3nsFMbBKD1ScW1XiKuUxqu+sQQzr9WAJh
	cEGWddy59CYT3aVJLCc8FhysoVh1+g7uVkege7/Fdg5fdRhqIPQ5/86Cn+yTT0EJyoagnPB6F4y61
	FqlUGiCEeNrO4MGLvwJr2vIjOabBgHpU9HzgwAuxSfxUXum1Vc9++XuQwlfQ3otHSbegaRa75yPiI
	5z6N0SvXgWwHT9b2Br2BNWooLMAq/Ioy8JEwss4U7vy1DueQT1zqy7VNb6/IevYByFOPlnrJT80vJ
	HQMjC7EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfVX-00000003IOI-06Lp;
	Mon, 10 Mar 2025 15:57:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfD5-00000003CVN-1SX2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 15:38:33 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741621107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K14g7P5Sc0PtDGYG0K97zMcD1wLmc9SWms5AZ+7zf6U=;
	b=ogurQhMQelGRkCIAZJ4P6n1THgbSalyU4S35z+WCTF4GYkCYuWeG9rs9xK1P4mXavCpDFa
	VW9mPenIxwXWRlRofe8qSx1Y0rJuNziCufpEe8WQKocoii89Z7lg3hLWfPX2BIzP59lmxl
	kcZer8d/acvYycW3BcBYCKwvZanzCVeeYq5QVDzU5m6xiHcefzSOFRqDUvKcOl2CfyZTOC
	m+s+iLLh7V3n4lzP3RQW6uq3sqLj/g91wsX6BhznLyYR+8C5wf6H9TyUDUqHHs+otaA6+w
	DUNl4e+52esp+3xVjECU4H5jmtsjjE19ZDRQQ8JNjuPeGKiVjMFj4Q/vaBTFpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741621107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K14g7P5Sc0PtDGYG0K97zMcD1wLmc9SWms5AZ+7zf6U=;
	b=lO0UrGtguucyRqXXsvhFDCbU594/VCO662mMwOebhwaT29nXqgsBBpk49QdHSZTXI6p+Ci
	8sfOZnwHR0STmkBA==
Date: Mon, 10 Mar 2025 16:38:24 +0100
Subject: [PATCH v2 2/2] usb: dwc3: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250310-restricted-pointers-usb-v2-2-a7598e2d47d1@linutronix.de>
References: <20250310-restricted-pointers-usb-v2-0-a7598e2d47d1@linutronix.de>
In-Reply-To: <20250310-restricted-pointers-usb-v2-0-a7598e2d47d1@linutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741621105; l=2586;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Nu0N+dD6APuQdLDWm6wIHVPj7WkCuoQLnQ5wWO5nfTM=;
 b=tlLMau6RpGLelX0xHjgc05oEUAK1+WfYuqDerDGMsQPeFxlMW2j6X66HABJ8+rbIsoPILb4Im
 /iIEGCY7TfJCBMLMNmThhuP9ukor1R55YOrlhka4s+6tBm0+GQ+Madc
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_083831_553929_E6BCE17D 
X-CRM114-Status: GOOD (  12.32  )
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

This is a revert of
commit 04fb365c453e ("usb: dwc3: replace %p with %pK")

When the formatting was changed from %p to %pK that was a security
improvement, as %p would leak raw pointer values to the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
On the other hand, restricted pointers ("%pK") were never meant to be used
through printk(). They can unintentionally still leak raw pointers or
acquire sleeping looks in atomic contexts.

Switch back to regular %p again.

Link: https://lore.kernel.org/lkml/20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023@linutronix.de/
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
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
index 89a4dc8ebf948244a719f21cbbcce565cc1d8610..9a1ec31b6ab46077d3635d1bff3fa5b362bdd9ba 100644
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


