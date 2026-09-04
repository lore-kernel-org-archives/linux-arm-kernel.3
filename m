Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C96C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bo+9+1CvfJ71hhRjJqHX7wWrfIVVnPJvwTAuLV2zMPo=; b=KgrDHg0zGqmxG7YFj2sdsgx3vU
	7rFIyIkf/df8MBhe6sOZ9XDYLyVcHDYqmkIQkBUoBmC6icc4M+EH2J/C3hCD7kIYGhHSSv3Hkk8c/
	ax7xc/Dr/73BFO7Z1HSQzITsaPPnFblJyebuqBYb+PdDJ4raVavhO1l79TOUGHSbLL6lRMPqJLF7H
	lk9GtPWO9gZrz+D1EClL3VklTfm7at7JHNzEVHeRhmXreZkPF/8hdhj+HYUBJc/DAqPUDhArPWdT4
	CWFkchBFB/ij0LDbNH7bJFIsVk+45xPst+rJkTDAwC0NnrkBV0alOSUUnNw5lB+34T5a8FMyiBjCX
	0AuKmxnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PVu-00000001PtT-00vX;
	Fri, 04 Sep 2026 08:43:10 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PVr-00000001Ps8-21Ap
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:43:08 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ceab75934dso7376235ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 01:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511387; x=1789116187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bo+9+1CvfJ71hhRjJqHX7wWrfIVVnPJvwTAuLV2zMPo=;
        b=D8NgafGDE3zh8ilMqZMQ/2Bd2MbGElF2/hF8sljl6zs+vw3oELATJcpZdvmahJxS4T
         YkeVG17MUmkteszHFo2O/zfWgtQMS+bDhDFFCHQmIrDMT+3wgxWyFalQCucSPzqlZD96
         YrPohGnNmUZvVnbpqi1GMj5fUJiP1UHTSFD4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511387; x=1789116187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bo+9+1CvfJ71hhRjJqHX7wWrfIVVnPJvwTAuLV2zMPo=;
        b=rTGCw9d3n69VLxyw/7SdOfXOnlZQDQifubsp6gwWMwa26h6VNR/1oM1+upY1yrE0Ec
         Ip/qbuaxFbZG4Qbl/wSoFIK8JYhafG66dreZLyBPyfXjR6OwT8kbKjLi95ysj0ClzWrr
         x31Y/fhqtNTFAdF63sQSToYKphA1xr/ekPgruA/Gfi1ddDBOI0enFdy602F0e0TwNdgA
         oFeRg2cbK9N6R8Yl5mU+cU4dtRFxx9/SRn7nHh+Wf6/u/pHa6x/TMhfFdwxe3gCW2XB7
         0JbF+RHbskqKNoCcFRwmnip0dcSN3KwwF9exF6uF1TlPYbIZU5N3wamy66xVtjzVkRdR
         kXQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHaw8wPHybHYNwrkchdxvozYvyKkygtpUzxrd9ooObRBHHiubW1wQ372fl45S+hwlVFg9DAtIxHY0gWPgU1QEs@lists.infradead.org
X-Gm-Message-State: AFuF++nN+EpDKEQPKmN3fWvGf+2NiltYa9SXNEw/NMkyiEKwddCPQIPW
	Sy0bAa101bl5N7Uj7u/zDPceY9oBRbQdhRZ+7nQIxq3mwMBNZIP+3FqZJxyai/lJVw==
X-Gm-Gg: AYBFou2OyM41F1EHfeFk2qH0siSL7ARnmzqbjloavKqQpUeD/ak2mXaYtkgtI7ogCkj
	jsbFns1k1jBmvq4TkY4f7EdHTeey2OSok37m4Vsggm5HD9fbPKIbhs1woiLCsgmeIl3oSNcgnqV
	ng126sFnpTqUQ3ZdV+3W2tfVUntmx0C+kJScNZ4Yp9gDNGWCHowCV1CuIMtfJVj995E4+74TdDD
	CJeEpUEpvVAFQCI2cm2x4SgRaXbtPGIRaet5y74nC/Cdgv4D4wnwSPpCdJsdl7fvqRaI42rRvAe
	ONNM6cM11IMp5ubGkwD/I44qBDbe0DD4QYPDwlspliZrqsKkYrhQJF8MHHVkg4LOGxdnhlAIA0j
	6u5NvtZUkUZgnffpGPcLlRRwbPgIQhhgU4RwtcwNTknDvFXOmJhglU7hCihrlZYaUOLMmjN+80w
	aJbMDm0bnoUA2seEK1FUeZIH7fxDdsj7lMbKvfFINcgi0MgH7A6OTSY2GPuam0oxM+1tjDK4mQ/
	NCRUd1SZ5kZpmZM1PZk1PqE0HieWmN8f5SJ1FQ9ullt
X-Received: by 2002:a17:90b:1d52:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39b260d338bmr6986016a91.5.1788511386742;
        Fri, 04 Sep 2026 01:43:06 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:36 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v8 05/16] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Fri,  4 Sep 2026 16:41:44 +0800
Message-ID: <20260904084158.1341550-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014307_522850_5EAA2FFC 
X-CRM114-Status: GOOD (  17.01  )
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

Also rewrite this section into the standard error handling pattern:

    if (error) {
        # handle error
        return error;
    }

    # do more work
    return 0;

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Rewrite into standard error handling pattern

Changes since v1:
- Moved "int ret" declaration in hub_configure() over here from the next
  patch
---
 drivers/usb/core/hub.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 16e03ec8d1ab..c19c9912c740 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1870,6 +1870,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2001,14 +2002,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		usb_set_interface(hdev, 0, 0);
 	}
 
-	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
-		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
-
-		return 0;
+	ret = hub_configure(hub, &desc->endpoint[0].desc);
+	if (ret < 0) {
+		hub_disconnect(intf);
+		return ret;
 	}
 
-	hub_disconnect(intf);
-	return -ENODEV;
+	onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
+
+	return 0;
 }
 
 static int
-- 
2.55.0.979.g7e5102b832-goog


