Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCA6606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 18:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k0ON80gA;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KzgoVOZX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2G5VZLK8HCZ0p1x2CyF5yDVbIltgfNGz0f2AYltyWA=; b=k0ON80gAmFuQA6KW04nloHI/St
	BRpaH9Mf7BWztLrxqASRhZIslcXxxbWR/h0v7R9vs6Pa9VsdHtpxWBFIXY5g2RC2QpWAVICXBr2Mz
	A14ztkRHvzTx8Tzs9rk/0/CY6LUiKepDGPsi6Devk5pF4Zu8QGvhM/AWrGlbAtYYaBNXEnLnCKhQQ
	z8e7NVOs/cM+1Mo6h+gspYiLtxndvIG907UJxhcUCCJCpvOvsh4wBIl112nBFeJitKSp/ZFsS47Gw
	IUcKZ2hH8Evh0U39kSg5Xfo+Rq3B1A3czLNIj8N8yMWZ6DgYHIXFrxnMMa9iphLjcsQOclPLxr2rW
	TfnVOflA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJahY-0000000CcHt-1Jfa;
	Wed, 21 Oct 2026 18:06:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJahC-0000000Cc3I-3VAG;
	Wed, 21 Oct 2026 18:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792605944;
	bh=rcNmKpWmTn7+TJeXvWtVirw/uYcmmOwXMSqcMxV5Cbs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KzgoVOZXPHtQixXe6jJdotH3nuMS/B7iwJG1GVOM3JYl42TuXqv4dIPhjshUt0/Ky
	 wVnj4CMLmoG9eqDhp9PF4J4VBcj0U/6EG567ZI0C34hAMjlEZd7mKWIzji/hHwHYML
	 6QWRvwnWCS61+nfTtR3ZwNJB80ICF0uJGHSrrWfC0ztqp/3FDSzP39f/Q6CTIgF5Ro
	 QCyEVZcXtFrRVr9GsB+uuwjuXRQ0yP717XZ9BNzO3kLuAai0EnhVvhwYisWfxYLa1A
	 Ke7wd6ISPSry7gqagSCOQnVwzVVBsJPOTr79PsbQ0dVz9l7Ic/x63XI91xtGeIndsg
	 4ZylOEfBEBVEA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF2DD17E0B2D;
	Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6A4AB480038; Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 21 Oct 2026 20:05:31 +0200
Subject: [PATCH v18 6/7] usb: gadget: define stub for usb_udc_vbus_handler
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-6-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=rcNmKpWmTn7+TJeXvWtVirw/uYcmmOwXMSqcMxV5Cbs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrY/vc9xa1w5K+P+9KH0j1yKeiILyDf75yoa
 2JbS3ggb50XFokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq2P73AAoJENju1/PI
 O/qaS6AP/1s3/oWKm6obCCUW7Bs/i3yKaLLUdMMz3Jgk5isaXEX2wW7yxCuZ3e1CM86OqizO0y3
 iuTmRRSrXVqKTqm2YE5Moc+V586H/KLbmS5NldiRMoEOx2ptnMAUOa7rFhhow2XxCmENMSxFq7M
 9kRHbIDeLlNvN+ovsNOoJrBRlaqux+7AkSBchCmiTbat+UbWWI9gkAbvYucyO8rIpu61M6EyCrr
 ERuf3EQBl6PEVeEEuLwf5+9ip4BFZwJTVUk/Ptb9FU6XsvBhaM645stPzjX6OL+HWk1NdDSzpcL
 ZemqaEHkOJGUgYN416iPGEuJ4hiNTu+PXBMrR7ilvvLjwo3VZ3QqqJ8NylqAUUly6AIPU+iWreS
 HoUjvfFmFGrE8a7OtsS925PLkAX2zUIiZ6KN/6yQvRxhXJVuD3sS297UqxfvDmBWZuUQQu+/lBf
 m7i53Na8WV1QbvxbkQruyCjclq4KMXqWM9lWeAAtTH1915ElDcQRl5znkowx3UPnaPyWEG/FbiB
 kvMl6c8zca1Njca0xlWUY3jZHoDssidZ8zMIgZ1A+s3JlWi58oyG5fkXKWdPI7UWh87WqBgcNwV
 ALVkSjv/HCJZ2DrDSx9taULC0TxhaNN5DcWkveIFSPFETrnuZBUiFqhqCOVwABWF/+TXwL516uz
 AsHtt3gkUzYS5Mc5LszUx8g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_110551_030608_2D47CF13 
X-CRM114-Status: GOOD (  10.06  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Platform drivers with optional gadget mode support may want to
call usb_udc_vbus_handler to properly handle a cable being
re-plugged.

Ensure these drivers can call the function without a hard dependency on
CONFIG_USB_GADGET or having the ifdef logic in the driver.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 include/linux/usb/gadget.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 8285b19a25e0..551e71b6eda0 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -979,7 +979,12 @@ extern int usb_gadget_ep_match_desc(struct usb_gadget *gadget,
 /*-------------------------------------------------------------------------*/
 
 /* utility to update vbus status for udc core, it may be scheduled */
+#if IS_ENABLED(CONFIG_USB_GADGET)
 extern void usb_udc_vbus_handler(struct usb_gadget *gadget, bool status);
+#else
+static inline void usb_udc_vbus_handler(struct usb_gadget *gadget, bool status)
+{}
+#endif
 
 /*-------------------------------------------------------------------------*/
 

-- 
2.53.0


