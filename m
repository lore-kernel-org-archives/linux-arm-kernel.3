Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DA3CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYYX9NwLUP4rFqvakVHrp1Kb1i3tLTyqtPoxV/1lOfk=; b=Z37yR1JQbyOkN1FzWOYTbt7bnk
	J7mkforv90uiQytdgq6XFUeZ8AY+cVj3PYJqBYucfsbXFJvsCyp7GQtyYFq+rQ2E6a1xpPzDMdIZA
	Qjiy6rhYkKx3BWY7/diNmVmL995QRCb9atWUPcdHyc3bikmzxLTl77oFJaKlbWng+e6X/uVNyyyYY
	8Pzc1fMeXryHkaell9Kg22X0lQPscxXCgzOLnBS/X8O9U8uYzlrlAOnflIdPOV94Id0isBBIA+P2s
	EE9AxYZYWoXiinMuBfAOihTRrXqZ8+GW7rg+1EM3IFWfPgGfJJTM/cUSB+yYzZ0RlHdL8FT3sIfWq
	Jgy1Sjyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVH-000000075bt-3QiG;
	Wed, 10 Jun 2026 08:41:39 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVF-000000075ZH-1NE4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:41:38 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c0c3546924so43236515ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080897; x=1781685697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYYX9NwLUP4rFqvakVHrp1Kb1i3tLTyqtPoxV/1lOfk=;
        b=mFbubaU7Y3Y8JXQwlzh3kUeq/ffNzG5XHYdAOX3h2dDboH/2UUbd31Fb07i40Wnd2/
         sx49NjQtcgFVy3MJtkxiyGBIJN+fHr6yv80l4TBZO4HPrj8ELnhzp6jBpwztmvzaV4Op
         MATg3LXjwufSlutj6XBUA0/+qdDbkmYXJXVbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080897; x=1781685697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BYYX9NwLUP4rFqvakVHrp1Kb1i3tLTyqtPoxV/1lOfk=;
        b=MpeGwbRDnaz9Q1srPTcZDNxiq2WwhnanebNRUgPo+lNCaOAm+roEyAfAPcSDe2wPSS
         I6QKwVwhfkFV1dSYADYVJsW0LYotzkMc9tQzwojhfQT40K3aiGq1fQHA48970qaDDO4S
         B8BzlwAHDdspQrJIKGrJ/4IjVpMs87WAnKWzXWz4hFNAzW84kzWycLwBui2AiJjGYRRQ
         D/EgZdliu7eLk2a4oHjwfCFjZsMLRTJN9JPiT+j5QuR7c4ZSJlHXK8v819sobdnXqCMh
         5RW3wYaVI5P0wkGaUfHbNv8gZKjZ2gWsy94X0EsbROFL8zFq03dVo/M2pTk+MfURuJ62
         Ecjg==
X-Forwarded-Encrypted: i=1; AFNElJ8F91EubQhQ4deuOsyvTt6EawuleVIGNW+wdrSKWTQfoJPISlAoswef3NbuKDA7NS2naQuS1HIIWxb5RugSKmpq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5kT6WrflTzxsOiW02We+e02lNY2dY19w9dZaIvuQpmgkz2pUU
	VySRlgAWX11EOEJlGWl55NvVqx0cJkTgsQidaJmMVCekLS/bQJVh7VnEuOJKs9PcPw==
X-Gm-Gg: Acq92OFbFzQu1qteHbDwIuRork+ZyAtSxfNvamBMaTmAP1t4YRQgGYVtsuhKkZpEDU5
	PTZLjlRapRptfEmcsNNCwSItJhGnKBUwbLDA9sghK24A0oHRXG5aUgDQYfNGLp1TTOAYLFJnbK3
	KwKb4g8VwHIsNFy3W2EigyW5ZTB8EyEc9wYTtFglhjwDnZLE4B7LArsYowMO3AdpsAU+rPpqUIE
	SBsj5af6zJW6QU1y3vQJyFfI19NCGX+GW5H5s4BM8T2ON0+pVVVX9YAg6MteuFkwUsSwMj/6Yql
	1/WV0nv+PaFpHp+I4K1049LZuo0Kq4LLCipo6VcMCvzTndN0a5zObG0UlDwDe6nQ6AASN99Q7Lk
	gGxFunn64FeSfz0D5lCHc673LqCQGEjgKmH/GWkRCdhttJ39kQ5xNs/N8xq60otCFJZxBAXVnW9
	Pyx2FbAoYsbiHuwMGfdMvFVgMJrIHebkU6kbSi6PSEPT8NUcSjTZW8QnRhEjyADslABhWDF4yQt
	+k94eqayyo6KMgJEA==
X-Received: by 2002:a17:903:1205:b0:2c0:e5ee:f55e with SMTP id d9443c01a7336-2c1e80f9b57mr283573295ad.7.1781080896672;
        Wed, 10 Jun 2026 01:41:36 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:36 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 04/16] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Wed, 10 Jun 2026 16:40:38 +0800
Message-ID: <20260610084053.2059858-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014137_367873_4B8B620C 
X-CRM114-Status: GOOD (  15.96  )
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

The addition of power sequencing descriptor handling in the USB hub code
requires dealing with deferred probing from pwrseq_get(). The power
sequencing provider may not yet be available when the USB hub probes.

Return the actual error code from hub_configure() when it fails, so that
the driver core can notice the deferred probe request.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved "int ret" declaration in hub_configure() over here from the next
  patch
---
 drivers/usb/core/hub.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 13264e86bc6d..985551d013b2 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1874,6 +1874,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2005,14 +2006,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		usb_set_interface(hdev, 0, 0);
 	}
 
-	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
+	ret = hub_configure(hub, &desc->endpoint[0].desc);
+	if (ret >= 0) {
 		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
 
 		return 0;
 	}
 
 	hub_disconnect(intf);
-	return -ENODEV;
+	return ret;
 }
 
 static int
-- 
2.54.0.1099.g489fc7bff1-goog


