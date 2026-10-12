Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B087CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 07:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0X2fplabp5QOh4xkFzr/FigCgPmHhH9f7OOGboLoAI=; b=yniKc8XAkoNF4NW3oosIeK/Oll
	VMXv/0WzE1YGvL+Zv2d7L2HSV1zdMiRsOu/8M3wHrWpHtL5YV2Obf8iLXBzUB5MItnZ9jxWzHoUnw
	vVj19I+6myi4bn01SECMZUSWREz/ks6M1y9yJfnixWUEgXQ2MvwOujklbV/SVFSRIP6wdFo/zZqXl
	hIJUvGWjf5jFhlGj/REMcF9o30tRerj8bCxpeZ22/F1NuxVkSN8GM6T8Fx1ZekT/uCmcfXEfIYHzK
	HM4eKVpV0cNXvramfA61qqOzEnwGMh8XDEeUClergKqROjh+SxcBmjp6kP6TfgTbEES8XEQ0jISnd
	Y5QHskkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAPt-00000009pnE-2qEh;
	Mon, 12 Oct 2026 07:25:49 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAPo-00000009pl8-3ZLx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 07:25:45 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1475656f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 00:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789943; x=1792394743; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0X2fplabp5QOh4xkFzr/FigCgPmHhH9f7OOGboLoAI=;
        b=OOkU+pfDmB9yCL2ZH72k9adKJuEX/haQAOTZhERHFnF9R79uPMxP7phajIOIPOiLH/
         HLwHnF2WkodULGtDwA8D5UmSeG/Z4MOJ4xXUbvSXlnj7ndA2ZEa3LYDl5IQUxpZhbNeu
         Efgoqzt3/ROh9BsXhSVaNNLusvVCq+T1sUsvNSiFC/9NF5khUrfSzP45ReOEolJL4jo4
         ITJLh/bPkpDX6MdXCjKzVwpKVEFmA2jZ4QpUJEDw/7trBqSZX5xoYV+qiCqn+24EglQJ
         pIJ57w3t0R3YOCn3BMsdYjR41ljiJD7Jb8pkhLJ1lFryVd6vceckMSWw5Z9h+BUHY48u
         pQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789943; x=1792394743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0X2fplabp5QOh4xkFzr/FigCgPmHhH9f7OOGboLoAI=;
        b=pg4VGCrQ6rZc2mot31gs5/JU5A9OZeQkKprbqV7rW4C8Q357cmSIx6zw+UD2nQ29LI
         ZN9uhkcBl3qJlmmIkQEBGmUzO5yMMf2MNMJFf/G0Vzy5nMdM136u267KnwIIq4GiVSQj
         H8sWfw3Baejd/fBiCqnrN6/jI+BfaIF5uDGlQFXPBpl9D2kD2P55qTKPqftEsK3N+7Xh
         5EnKyYkxEk629ItoMD4UKw+H8kPlknQtnoUltwCWGftTOUCNC09XLJlcF3j9c75KT6x4
         cBCoH94xRUO2bJgdaAb9IJ3kBcm2dok94zORiy20Osgq6hPaNXM6BWfamcWjipLF2jWn
         wKrA==
X-Forwarded-Encrypted: i=1; AKwUvBxGlNzH4iLwBT5l06eVbeTVfQOQXu7TLH72zVK9CiWiiNwyoCWUQHPQI8dWMIBfjmma/7QOr1cXbOJ+oOGHOc1L@lists.infradead.org
X-Gm-Message-State: AFq9FYIITQIohJ/sUW6FNACso8LlbG9cHufumLYZ45Z0ybrn23W9KuG7
	hquK8UejDMebSPALKTlwCdAWOGwzmnSOfkaXINRuQhBjqT5i+v+ULhwj
X-Gm-Gg: AYBFou1+E9hQHgOYBjEyOebJy5eCHYqEWgEy3gBgob4dysONWDmy3UM7y74fUN7qHBm
	XWR3H49VJDrJAz3mS7blS+gFi4RuTCrPySuZYQpIg1/tu0dD6rsLoWfEXZi03Nv4S0Og/7nribM
	eG4iAOSOzeAvPex9bZUBiQWG3Z8qkhoPXulQgr/SHCbTW+7UfzGlS7HXBmsLsFDlSgIAPN4Q0FD
	O5Q/FQ4BZirf9NlbOabh0Ds2D6KKgZ3Re18NIT1vrByodqQsurMpdUQ43qhCeBzFRxdAv4uL1gF
	7xXpS4yR7VKfm0mEgoXqJpyqb7BdQsGwQmkM4wnZS0qmZsDWs/WBhbUPdNOfIC72FcM4UHvggLM
	zoOFxB5tOssCJpXng4F25nOwA08Q4dbttg5vnX+7HsTFS2TWiGEU6VZ+axeTwYguUpHnjtk1JrZ
	ZhR2mZM5TMH8dF964Ujytc910B0pFauZcqEKlUQWb5LbimjD4EFFp3V8g91gWKR601ni+dc/55U
	R4+tMLE1Xi22GBaGTz97mcuH8CZ8I4/ygI3nXrrv+8iFs66CB3G446yNdmg3ekM
X-Received: by 2002:a5d:43c4:0:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-48dbaae8e33mr12493470f8f.37.1791789942797;
        Mon, 12 Oct 2026 00:25:42 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aadf9bsm17523377f8f.29.2026.10.12.00.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:25:42 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 12 Oct 2026 04:25:23 -0300
Subject: [PATCH 1/3] dt-bindings: display: bridge: simple: Add the Toradex
 Apalis iMX6 VGA DAC bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-v1-apalis-imx6-enable-vga-v1-1-8905d8746504@toradex.com>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
In-Reply-To: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791789940; l=1045;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=O9xo6x/Vsususv0Ua2eMzb6/yhBucutOa+18ozmEW8s=;
 b=37sR/q4rsvp8/0G2BU7g+IBhwPmrrzyaZ1/VxQrnHcJjiWbLbf2XnbzLTPJEjCxDGsQuZuSjh
 HbRJlB47ZlZCC13TAqoR4wM22Qy2GtPBeeyW86uPQBEWd2NKM0i3WS6
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_002544_913580_6BB2641F 
X-CRM114-Status: UNSURE (   9.58  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

The VGA bridge on Apalis iMX6 consists of a simple resistor ladder that
converts a digital 16-bit RGB signal to VGA. The VGA output is gated by
an active-low data-enable signal.

Add a dedicated compatible for the bridge, since the generic
dumb-vga-dac doesn't describe a data-enable signal.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 7636c24906ba..a86231a4a908 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -37,6 +37,7 @@ properties:
           - ti,opa362
           - ti,ths8134
           - ti,ths8135
+          - toradex,apalis-imx6-vga-dac
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports

-- 
2.43.0


