Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0D4C982CA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWwi8XOZ6LU+PxR6btCprbkiTyl3Q4dICGc4z937Hmk=; b=3nE5VbGO9yb+BYGkrPdQOWCVib
	5Dgd8Cit7Axn2qV/7BH+KMyboZMRlmHIUAsDYxL3Lj/J0pus/vyWFBWjTIjsh++GRduIwdKhy2bNa
	TwztrpfnHIczLD//2e2IhbVKYJhVtHNy30FMscHTgeWCt9HaUKtXOqrlutTcVg+Pjp1/mjJWnyFt5
	itt/6KT+qDRvziTr8p6BOcZMXaaVy3yK/nLTHzPi9hOT5s+k6cDLtyFUlaxZiUTbjZZwLuxFvZu5X
	tJKAkm4vV0rCDZZhx8WG8Q8RLI2cJVWOpUhk9hkxRJxUkxqzHbJ4aXRbd6keF+iEpO8a1NNz4vnI1
	0gXQyQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kYA-00000008eBH-3Dc1;
	Wed, 16 Sep 2026 07:59:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kXf-00000008dxW-1A4t
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 07:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SWwi8XOZ6LU+PxR6btCprbkiTyl3Q4dICGc4z937Hmk=; b=AGE5/jykzddzpuu7uXk9g7gdIa
	a3pUZniEybjXSeJYOfyA6yPj4cHfmH4S36/YnC8qkXLvrImGy4mrjg313eBY+pDTXpwC7RsyzJykd
	L9K3JQANPfE9FS+FFuHswbnYlB8cblW5GmmezNgquVHlvmN+QGhBRECBP7RKtA25URq3KwHZXptmJ
	VZyal9fGdxeGigEPaByzQ5aUvOH3ctYq1dfhWxieivvYW5NNULaGj/0uhpCwTa18isW+gWxyEQzDr
	1qmIiPwMNXwK1rF956kQU9n6aqJ4KpyYQpTODiUNos7vnLHVIoXG+SzYaxteRKSLWKmNH3HnhnRFp
	YGxPHRaQ==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6kXa-00000007bXz-1Wvr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:58:54 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so475269a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 00:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545528; x=1790150328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWwi8XOZ6LU+PxR6btCprbkiTyl3Q4dICGc4z937Hmk=;
        b=mYVxphmz8b5k7JGYa+15NPC4fVE3IeBb7MUflwapPnILRJ+C62RU76twDOZrzSLc1r
         /z4iGoYXi1bPxove+DzbEgGoo47RcVsDlTISzDdlQY0afd3Gv30poGddOhe0daSdZ+x2
         3ksMruVr3MJnBvVXelUX8/2VWMj/pdmD+u4r0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545528; x=1790150328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWwi8XOZ6LU+PxR6btCprbkiTyl3Q4dICGc4z937Hmk=;
        b=yXkFKZuLZf4vxYO3cy6Ih3cR3PogRF0Coeub+pqykZH1PS0yie0aL5QMB0eFY75QM2
         ukhKlQbp/s7lkvbxUeEOwBKYKNLCgPsoKxfrSQVS8FrmeTzy2LBGl+1E/KG0wyYZG0X1
         pIa9cf3hDM9zWMp44bWuvXJyjqMmMYZJnPR096PX2i7Hk1a5tHueCOh410Ouut8n2aJW
         2VM3BSLyIIKIa+JSWKpAT/YuYbmLIi+xBhmIsp2r6I3wRVoibgXN+C5kKgWz0wLz6m6I
         4oQxOVRPavhGyDcrz9Org5iQDGb2Detgge/5RBYSJC3nNrYKZIV7ryBgaJjGbqEqk1Vq
         h/kQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTIwtNvPegu4WT1jce22PS7+CqrdB2ukTybojtp/T8e8d80FIa4ZnjfeYcWeRzKCDtBKLd4naxKyEj2fVtG8ud@lists.infradead.org
X-Gm-Message-State: AFuF++m8e8N85Y90LbSVInDdrQzslJajO1mMjCBxPCMNRxa7Wudu9I7F
	4yMRCFy3tzDPGp05XS6nInKWLYdlqSd2sKEloKOkA88k/TwhMW03AjbbHhzbtTwraw==
X-Gm-Gg: AYBFou36HNQCZMZlEKNGxU1sB0Z9atsK/ehJief6WTMzlioQ1uVFU0RezAsIa/HwSSY
	zFBnjRzuLB94AL7UzrWkCOmD+WCHauI58xBgb5QwEAk9uPaNwV/mh4fVuxStzC6qjKO5+Wer7Sd
	R/f+CYLAfonfgUfZPT+1ypY43lYmvj/qpdEYWYHGPjlGi2EzDJ/K42+YfoFpInFofeo9ckUfZWI
	mM5JxmUehJAm8SIfp5QWg7wGr+0wdxinYR2Ih+UDf5syzcz9pg3ST/OPOZcQwSr8mdmC4QpStN+
	y5k6/D/zEKBAITgnLr57QEV0Cf2cSBNhgVbfn37bURdPH2lBdwavyudePSOSoz2NUkcEUxN1e4n
	lh3YNiFBujkI5KoP+GjDtBQcrJ4WaHJrJiARPe7mQtMQWiyhskZck4Gy23vZICI0NYzOqGrZgvc
	XyTxVlmsbhOBrVfUiHCUiEi4ORk+AuymuEzUhsnvlCKsrX3f7H4vjPSRXYyLcuYNt91jXpAesY1
	NlygjK/d/7OpyOwJHc49e5T4+20WTJfu/DGdLX9ZVhQWQ7fsSWJgSvOCNjjeNg4XPSF
X-Received: by 2002:a17:90b:39a3:b0:39e:233f:cee9 with SMTP id 98e67ed59e1d1-39e233fd063mr2563733a91.11.1789545528600;
        Wed, 16 Sep 2026 00:58:48 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:47 -0700 (PDT)
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
Cc: Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v9 05/15] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Wed, 16 Sep 2026 15:57:31 +0800
Message-ID: <20260916075745.3549953-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_085852_515414_A40F972F 
X-CRM114-Status: GOOD (  16.80  )
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
index a4ec79a06a5c..707eeee198b0 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1875,6 +1875,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2006,14 +2007,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
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
2.55.0.1032.g73a4cd73de-goog


