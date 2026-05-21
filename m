Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A854DCD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFf1Uwc1wFfrjp8DZawjtw8U6DafQ9Z9e4+vgFSrgIo=; b=jDpG7nhOdRd5D1wSwNCenPLmzY
	wub9kYLUEreny2c2AKrJilVvzXVxF+j0EnBqJFsSZjBDTPTPTo/QNDy2PfQTtLCI16zPQznaW4+Sk
	NyLeqHEo9yY/dvUUllBxS3FZxE+TBiG5vAMgAm3OgGZ7FuzSw8ve8eDtoJTD54LsT+3LrrUWdHbWw
	J2oX0KVBunSSi9w2gfE2pdaGXu1u1sOYstuhO8SZ9n2hA0x4IXsv/bLlR9KN5vFsfVTXX3t7zk40O
	gPEC+UMEWVRwFC8rpazGDTh/P/iw3qt8Gl1IOVacZ/9lOL+4Bf5gljI//cP3F/TRNwNqgfmAhB+tq
	GCian+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4uZ-00000008EEC-49nC;
	Thu, 21 May 2026 15:02:11 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4tt-00000008DcL-3Es6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:01:32 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso81786725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375688; x=1779980488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFf1Uwc1wFfrjp8DZawjtw8U6DafQ9Z9e4+vgFSrgIo=;
        b=pydaN2tb0D8pg27VYRnbuEE7ukc1ifNjMbkBNG7w0cfx5Cnv+0HaBurJ8fk7ZB/60s
         H6oALIAsB2/bqbA3L7utlU1t7tRsJM6VwfCVfUNSVYT1tfgQUzLJSIX3aE/wZ3XD/vxn
         CSMMRQQXy6jjafLA6PLoHmUWl/lvoioYimh8y9yGlHhJiUs1vgI6lODZWSIvRJftEaZi
         kX5pkVm9KmzsCBZX6Fnye+6vGcjHWarb2VZk31Q5bO9o4JfgavbmZYf2bVgNXM4pVfbO
         Nuweu8rmn8Kw/yXrfmWZBYup/EG5LQZBtAsuGWBQgg0o39z63OFnFiUloAuGC/W1p/tq
         qMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375688; x=1779980488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cFf1Uwc1wFfrjp8DZawjtw8U6DafQ9Z9e4+vgFSrgIo=;
        b=j5LY2/4llsjunrQxZjXVYwv3vtzuubBz/IxeBUwrBKQPxNjvCiT5w7CTsSP2hNcZtl
         IybaXO+0DVGEAv5GNh6hoj/25QSKaNJ6MPrD61EsAtKbfmaehDh02qavNUFiONrKg7GC
         pQiBJwri+i+x6W/kB9dPYKWPLE9XvtDJHnfZH02obrvMIh6fgxhegoGjYX24wdCyPO1u
         2Ih5mkBd+zfCLAi/OLJoPpB24veq79uKfFClF2XqJeJFCqFnl8GUcJXZwmLaAsmbrzAn
         +Dg8gZzK5UcuoRBbajpQB+CnBN5I1MocPHAexCm/GZ1be9ZpAMHGdlgodUyRw22WfVvp
         IQ5w==
X-Forwarded-Encrypted: i=1; AFNElJ/9Y4I49yk7lSNba2/qcnGx4a450+NKs8P/YgeFKfar1ApJbRYIuVv7NjLUGhuW9/Jbsdirvsizo0otQETuQTPj@lists.infradead.org
X-Gm-Message-State: AOJu0YyCPgOu5rptPldTAidEnQL62TyGJm/GtMTG6Q/XgvQ4WdGElhAN
	bHHIj0gaHslS+JRpN5riUSGg0pijYCKqb6EAAH+3cRcBnKo0p5fGV2Hj
X-Gm-Gg: Acq92OFo+DLAkdflMxQBUIN3zJMvSwmr0gSv1t0aBNUABZXDo1rHXjiQc1QvK59Gz4A
	9ofxIPL3ZJvyBmDd5AAZv8Ogkv8wvs2wcTUhLsMFN2cPiB/KSKTiqKM19FyxTQZZQKwt7HGGG3L
	9RodyD+TwMbwHU0j37Y/MheccjkwjcuiZiyhohTe9MWFk9B5yI98iJL076M6+kiNnhRRy0x4+Ig
	ZYNo5Bq29L2fcRwJQAIjiSXjt5KFDxRAN8lWoPlXLeW7yrbvYAO9vDnLLLKXN8pWbsmgGVJoZiP
	GdIZPlmozWjRtG0F9ixsyvg77APbkqihmSbtPqmKTqBSTAtWndk86eWzu7dj1kW47Tp2ObGpzhD
	1jeSSU2K6EjSGk/sZmRDmBEd8mdjw2vjm1p6MLNJAmw04BQ5uKu3uRkL9w1IJP0/86zb2kIav/j
	SdGZq2oex6qa08vNSZ4FO6dD6PFzCVqRylscQoKYJw1g==
X-Received: by 2002:a05:600c:1796:b0:48a:563c:c8c5 with SMTP id 5b1f17b1804b1-4903605ada2mr28491725e9.8.1779375687960;
        Thu, 21 May 2026 08:01:27 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:27 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 13/15] dt-bindings: display: panel-lvds: Add dual-channel LVDS support
Date: Thu, 21 May 2026 16:00:49 +0100
Message-ID: <20260521150038.103538-30-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_080129_833348_4F53A1E5 
X-CRM114-Status: GOOD (  11.32  )
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

From: Vitor Soares <vitor.soares@toradex.com>

The panel-lvds binding only supports single-channel panels.
Extend it to support dual-channel LVDS panels by referencing the
lvds-dual-ports schema when a ports container is present.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 .../bindings/display/panel/panel-lvds.yaml          | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 7ed0c486870b..45183a1439ce 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -82,6 +82,17 @@ required:
   - width-mm
   - height-mm
   - panel-timing
-  - port
+
+oneOf:
+  - required:
+      - port
+  - required:
+      - ports
+
+if:
+  required:
+    - ports
+then:
+  $ref: /schemas/display/lvds-dual-ports.yaml#
 
 ...
-- 
2.54.0


