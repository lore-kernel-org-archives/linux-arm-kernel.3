Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCB5CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2G5VZLK8HCZ0p1x2CyF5yDVbIltgfNGz0f2AYltyWA=; b=2pgyjU5UB7BmtihJbUHWOVyvPT
	fgWFSIbyv5tbMexNQG5zZV+WhHnkLEooLvfUFIWSjQV1uz4+yZqa+HM8x8t1bCugETUk94mt+rr0Y
	lVStSt6KQlh0r2Zlsa+CgywdOMDYjkQsI8ccwEQ5cgGu19ygK/C2uRk2NaDTeg9IaG9ZpkAbAvWgS
	QR07yCpvg/ef84Uo6VAoUlVoeZgr/p4v1IB8ckaU22UImKV2lY11NSdj7mCPFMSMAH/tc/EWA1bND
	jfD3b/0UxLaq9PiK/2yVbgShMq48s2Ps0JVWYP9LrvhXtpVNKmqgAd7dT6U/ChKaL6f7/3yO7SVQH
	eld6kqGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmuJ-00000003iBN-0PEY;
	Fri, 16 Oct 2026 18:43:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmu4-00000003hu3-3Qfj;
	Fri, 16 Oct 2026 18:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792176215;
	bh=rcNmKpWmTn7+TJeXvWtVirw/uYcmmOwXMSqcMxV5Cbs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LR/iTvUB2PiesU2ocSTLMe7rcti0zwPA5rzdkX8MqPYw5QqW5WVeI2agCM+XOuy0U
	 7p7HzJK2y6GE2SOFlzsDWVDL5Eo3MxZaQ+LFt2/EQih5MScB41KEXY/drj/lXBzB+X
	 qhKx8KyAFvELoNKbAlwwm3ZG61Nt/t8/kSuercjAYGPsFy0/ePoiusnFG55uM8cDMs
	 vd/Fdc1XU7LmyUXlmga/CBDgiKbwaWZfALOQaV/jLvS5311GvlTW8w7UyIoVlldqCF
	 DJ9DdmeVFN+vQZeLmBKsEdPLiy+tsOBtSMdrcBoAm6QgoTzhbxfctSuI9PZ7c+10n7
	 EkNCckaLqfhEQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0900817E150A;
	Fri, 16 Oct 2026 20:43:35 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 693FF480038; Fri, 16 Oct 2026 20:43:34 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 16 Oct 2026 20:43:22 +0200
Subject: [PATCH v17 6/7] usb: gadget: define stub for usb_udc_vbus_handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-6-876f96893e2f@collabora.com>
References: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
In-Reply-To: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrScFYby+uJAZWIY7sw6GUsT0sIvZNldNy8k
 L5xwycZoZ23w4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq0nBWAAoJENju1/PI
 O/qaiO8P/RchQsDCIz5c6MSTQzxEfbvDysNdjQo5ZonsfvVa9IkkyDY/Mw6ctvp8G/nkPiKue3M
 8fP6us/dQXc/wCs7QpwwkejrlRU7zTlbmaSxEl1sHUs1+vkR3eM6o6GOnb5OHHQjJPwRjhujPig
 RYVbz+peaHx9m76zx3wN+D80vKsDoknXZRgIKLhRoxEHNzNrxnxrY5k983cTWKP8h0R3aJveL6x
 dTTwLDMC5OETxEKkvZMgLY2/c9Q+NUfZp7Pb2valgWqVrdKZHeBpsa2fk3yaf8DkGS75JL4ZLDZ
 HNh8sTl6a/fdTKB1pHqOw7rIriz8+ggosrA8MCU+urTsY2ajZ+rujO35a4Zi1jCGY285qUVlxKx
 UQkcJRmvKn8yIliM9gFD6Gl5sX5NJQeGp1PIgD3ppoNhMNEXi7gVkqg1uQbdbblYPBNUm06LMjS
 PurFZp0z34JzlmuRabHHycDZJhPvhfThPvhO2vmhFs4CjfHYmmrsa0If+k9LfF5XH1MbX+hr7lj
 cGoeLlAl/YFJWS3ITMNpObhWwjRxCCjBaW9tp/qGE24oMDv9LnczTeyJTm53qzZkM3doJarxjIP
 Q/0qqIqODUyEEj+zTqBFxNKxEtlp3fykxbP+h38JGYBY/SFvS3GYjMA12RwvyRUfuo0GQcKO/yO
 vKffKxujQujuvJB5hyus8RA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_114341_054092_71036C5A 
X-CRM114-Status: UNSURE (   9.64  )
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


