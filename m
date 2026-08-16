Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90275C5DF7A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 14:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEfY0WKHFZWFlZvlZ6DrZDRwUYw98lksOKl8DK8DS7g=; b=39sC0SEt4SXIUQoY8gJ2FRUPJ0
	ToZXjlb4b14l2YIp8yEh+gsptkMSfvm1hHmwEMkcnojgpV4UN4AGZhr7K6Ow85514ZRLScWI5XWr9
	g7dwEfdZernGAw+y23/lY6FsxoBDvhzZSXHNuj9wjb52vQl6avwLwZGlCf33T807Bei+5I0KpCC7Z
	vscppu5kptqeXXEqhHRbKsZbwMIHaVbHOGZtF6s0tOEmqPbDgC+7OBtvLH2gBR4ZXwLtc7S7tfbGm
	SHN7QIJ53Bre/Hjm3S/5iI/Ww0jDHs4D/IQwL/Xd2pPvmnJdfg36ICsZfyqs3d5GeMfGUPlk+dpC6
	tDHSTfJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvbV3-00000004oLe-0avr;
	Sun, 16 Aug 2026 14:06:09 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvbUw-00000004oJZ-3fKV;
	Sun, 16 Aug 2026 14:06:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=XEfY0WKHFZWFlZvlZ6DrZDRwUYw98lksOKl8DK8DS7g=; b=i4toc+fx9Wv8ZMHV08VulARQHd
	dJM7x4oLgQAA++Zld588tuG2du+Yt3r6zXPH/BP8cLh2TKl9dNf5qdrGtoBiaJr4wWr2wa9Dpspk0
	2UT0rnUINOrJHu6aVLu41gSMJWCSsIcTojFkZrlMTRXeerlamby4tCHxnOfK0mEhvTLTlXScxAYXy
	U4FOZkQ+aWyM9KHxYVr5hs0uzAiD6ECJrh/mst8iHEePM1L4+SHHAE34Gz/eUgDPno9kXmlUL9KP6
	JvVUPveurGpwsWc3zb35kK3b3xFPTAbxK1Vrp/+quVlsDWV3XQhQ7NeZ0rYWSvOR+ITVJ3G7oYwI4
	AwCgoNPA==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wvbUu-002tuI-I2; Sun, 16 Aug 2026 16:06:00 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sun, 16 Aug 2026 11:05:41 -0300
Subject: [PATCH 2/4] dt-bindings: display: bcm2835-v3d: Add an optional
 reset line
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260816-vc4-reset-control-v1-2-896444373716@igalia.com>
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
In-Reply-To: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1041; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=3hhlZ1Fi0jWDKXWe3uonqCke0ZqoqeBiOykrMppuuAc=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBqgcO4hSm7N0GRYiFkdoVyEWuLx4nSx1hqieNg0
 UyQXw099RmJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaoHDuAAKCRA/8w6Kdoj6
 qhk5CAClAo9OtDmH5mNxDVvKPWpRHNCkQ0lMXBgWANZksoO8zvDPtAib5FEnw8Vb36POjk6kPQ2
 hUFmupFYf/52evpXdxi9Z7kfRaRyMvpsNTUEucujZwIbK2mdh1chXO0AX+S+tJbCROGA6U8+2W3
 hL0PHOtUKd4ejGPuawbbSLgq6XC9xGcceoioFd8mGf69fP1BaB81k5m6f2VZeoeGemRwQ9+Qr3v
 JJrPSDXKI66is2LnjCj4erhvRB7KU/QfcrsotKwkvImniwh/gIdG+O+24RqX1Y13QXLrI5zC3ym
 dwP7JpEhKWhFv7Qe0UFS7AxtuSLN3fkz9tq9BQ47skHmXJ0C
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_070602_929366_D2F4F4A1 
X-CRM114-Status: UNSURE (   9.18  )
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

The BCM2835 PM block has exposed a reset line for the V3D block since
commit 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power domains
under a new binding."), which allows the GPU to be reset without
power-cycling its domain. Document it so that the vc4 driver can use it to
recover from a GPU hang.

Keep the property optional, as existing device trees do not describe it.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml
index c55a8217de25..1063e686647c 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml
@@ -27,6 +27,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.55.0


