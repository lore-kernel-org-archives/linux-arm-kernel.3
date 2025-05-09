Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0199DC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d90bdozVEDl17jgP/30NkcxJUSIJ4T84xVCf6HbGeUs=; b=odoXubRdevjTjxdTMnAQU+wp86
	4pKqI5eGdJnJpRI+iGmEBk9Ob09Yx8Eja9TeKyo4TVt8aPBKW5cMX2kPw/cFj7uNzrEvJsOrr1DrV
	OI3qo611yr3QXdn+mC6ptHhC/uhv6AoUIDRVkpv0JU1z7WWwqXE+OiAcqehEMBaI5OIn4rlhr3z9I
	IWrR+W9APQfN60EF72sC4fg5yv/fcGjS05bXY7m4mL2Cfx9jU68XyWPVY+xP6NIGNjiKCQ/sNy8Uw
	lqSsiMcEbdn/wycL19dwefzx+hT/j5nYymI6mOkTesAK/s9Tx2JPMKiZJ4kVNKwZ5jwTcXq57LHkC
	Yyz+/MiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQFE-00000004DLK-3Yyw;
	Fri, 09 May 2025 16:06:40 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOE8-00000003rei-2GaX;
	Fri, 09 May 2025 13:57:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5D1B43B67;
	Fri,  9 May 2025 13:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746799042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d90bdozVEDl17jgP/30NkcxJUSIJ4T84xVCf6HbGeUs=;
	b=oC4jIVadhL3OVUuZQHMzblGENFNnp2JxECtht7zSQrYJ4U/3R6u9zOmCvzfwW9snQQ1lFe
	a6Zm7dfqnpH0AmpUxEpTLuh7hBe8tTIv7itfJlbzjrW2KAUZIMmELfY9t+ANbn5FsU9xT1
	6fJKT68jMunkzO0x5aObyt2WHsMqNn/8TGbWxs1Py0LlTnlqoVzbxJ8iOXpDeTDwoB8742
	UL96robWxijxmxcsKbHT0d6GIpgqZ24R+8m2xUlMhf1KNIGGRN2Z8dkn8DKC/Mx/7VF91M
	wBUVhXjFzpki4cu1UFVgHt6E9voiQDvB7B8+xmPWeJ2dzKssT4PfW1f1ITvsbQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 May 2025 15:53:48 +0200
Subject: [PATCH v3 22/22] drm/todo: add entry to remove
 devm_drm_put_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-drm-bridge-convert-to-alloc-api-v3-22-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Jonathan Corbet <corbet@lwn.net>, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedvtdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedupdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnu
 higqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvth
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_065724_720019_13CE5AC4 
X-CRM114-Status: GOOD (  10.38  )
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

devm_drm_put_bridge() is a temporary workaround waiting for the panel
bridge lifetime rework. Add a TODO entry to not forget it must be removed
after such rework.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org

This patch was added in v3
---
 Documentation/gpu/todo.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index c57777a24e03d91b1ffe04365f7356f2d938befd..be8637da3fe950ddcb65cdcf626bc4b4e6b0fa26 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -515,6 +515,21 @@ Contact: Douglas Anderson <dianders@chromium.org>
 
 Level: Starter
 
+Remove devm_drm_put_bridge()
+----------------------------
+
+Due to how the panel bridge handles the drm_bridge object lifetime, special
+care must be taken to dispose of the drm_bridge object when the
+panel_bridge is removed. This is currently managed using
+devm_drm_put_bridge(), but that is an unsafe, temporary workaround. To fix
+that, the DRM panel lifetime needs to be reworked. After the rework is
+done, remove devm_drm_put_bridge() and the TODO in
+drm_panel_bridge_remove().
+
+Contact: Maxime Ripard <mripard@kernel.org>,
+         Luca Ceresoli <luca.ceresoli@bootlin.com>
+
+Level: Intermediate
 
 Core refactorings
 =================

-- 
2.49.0


