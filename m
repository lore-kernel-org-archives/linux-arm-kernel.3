Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A4EC44506
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 14:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHkQOAwnqn+GHM2YCaa/ek3hYLA29AY6tEwxhPAeG+E=; b=tOIIyd6GKPbBHdd4J6jOMRDO5s
	CODATT0OaY/o4zpcMHhskBXj7SruHKpxgxE0c/iQzX0kiP4MuE7pWe0wNGZu74or7hrqO+Y/w/8js
	JV+jjCVUV7vB7p8IirZGCrIqxJlQumK0uzmx+5QfwmmwnzSpTuudBpBmgjioTOIgJQLwy2fi9Mka/
	d20DUxGNhLGsjPj3m30tm97b+FsGng/a/NVVEPRTId2Cz3dQ2FFH5gJ6BgwfHIn4cE/Jd1+j/4iZ4
	vyg6LkO9s0Cw7rDpKKU4rvz4E5TcTmcpHIQU3vxp+o7C+IY5IRAoJv/2j/C2vSzdlYHTjnqlj2Lpn
	S1zlIN7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiunn-00000007Ulj-2OQR;
	Sun, 12 Jul 2026 14:05:03 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiunh-00000007Ui8-3sMz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 14:04:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493f60208a5so18392455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 07:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783865096; x=1784469896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHkQOAwnqn+GHM2YCaa/ek3hYLA29AY6tEwxhPAeG+E=;
        b=KSTs5XjmS6WgbHVipO+1P/YUD1MzkyIwwVaZ8mliXz8NOyUCOyGuQibRJr52C1hlQN
         PpAb9aBCL3Bis+qLUS5apnOP0qdqfoQps8UQiHVwE0LQkT5rjdmZhXsDJg0E8sfbQZ+w
         lwcaO3JeomB81/IJO6lch9G0NGruPTST81Ns1ILBE9DwBqpdDfmdgR6e+qYNQ/kxiENl
         U9X9AJm7QVnlGs+VfTkeUu7i0I7hz9pcCPo55+tC1mNwC9hHhYN6xwwrz8gMk/C1TNX+
         OR1I/11g4LpJqBqgz1GBkzAsE8NpBJAiGg8to7j5zFGa16jPZRw9mySxjgmCKx/cG4OO
         NAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783865096; x=1784469896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OHkQOAwnqn+GHM2YCaa/ek3hYLA29AY6tEwxhPAeG+E=;
        b=ccs+0h3TmrYYwiRlkgKx+Zhp8W5A+cOtlnshPaZwpNrc0dWv562ebl959BGy/BsBl9
         O7TIIGfAUy9NHwDXnufokqJZRGfWTvOy7liwp+6SrXQWl0vE/tGlel1EaIHxTjIUlNx5
         /wO/o7MJyDYz0YOU5JrIaNHm7yCNNIIHdELIvDELZQQnJcZecu0Y9KRFxJekVaidtCy8
         AOMWU++yOMgTf2szc7LFNIny6idVEf9GACLoZLJ0ysICBquoWU0yxlCkHW7wdToOoxxO
         ZE7+6+YyqvZi0kn3Zef4Dg1KrBQCpBOQUW1HYo9KyALx659nvPpAfwe70KQ5BDOoSmQR
         3uXQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLwBDr0f01KIRe5abznONTTG+jf5dPkECGaRvwvmHStUrwtTxztrlP6gAVeLyZpcLzJpYhYfoIenVIUOGJVpEk@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi151558d0k2rGvW/mpgrXhmXcziFLgAGc6LGlXIjsW1ENe/l8
	CRSBIab+AV/bxJFNv1OKRBA8SQE9YMj97DBZUqG590of7RrsPdrOOj2B0jQM6c7z
X-Gm-Gg: AfdE7cmMQheCNaTpQOdWuCt2/B3OUxJdFT+3H2yGiP7VSe7PQia8/1RTFn7X3alNm99
	GT3tRv9s4M1C/mxlSIIOMd83W5PVnONNcKqFkfzQyjAZZHHeWgSk5OfasK3nMm6jpubohp9bMsM
	08hCRiIf/krFMiCPZ1qz7y+eJs8dZKrmYaiegPWiBHlStD0inWk/fLG6gInx3okoT36uSJ/8uZt
	b0w9QvdK1EfojPmYYkkgfLNM26qaBJbcaXcJml55VKu13c+ONdG/YsHC4MSOU/WeaDRvGu1p3TM
	VkCQqhIcpPuAKNCrVgwxTSnBTQKBKlA+dJqLgpuzw4rbRU+CQzcssKWBqUpO5plmW/JUiA2dlPI
	DM8rF+XDfC5vphMs+u154Rmh3rtFZ7JG5eCTZEb8chJlu6QHifYJgU5gnE9QC3PCEd5uP4CtYuB
	19kIo5Ft2gCv4NvRyCClQ0AEZA+3ICpTwAH8GRQU/h5HF9l5p5Iwunp0M1nmflhx9J4hwvVATnC
	NlOgw0eu3Uv5LFC3YjIntgWjbtVrDxjdCY=
X-Received: by 2002:a05:600c:4746:b0:493:e034:a3b5 with SMTP id 5b1f17b1804b1-493f8818cb0mr62961625e9.24.1783865096161;
        Sun, 12 Jul 2026 07:04:56 -0700 (PDT)
Received: from GLaDOS.station (122.red-80-39-213.dynamicip.rima-tde.net. [80.39.213.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm76330888f8f.14.2026.07.12.07.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:04:55 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62
Date: Sun, 12 Jul 2026 16:04:48 +0200
Message-ID: <20d42ed8808c477c79b4d45fea6fd474ee42b06d.1783864932.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783864932.git.stefano.r@variscite.com>
References: <cover.1783864932.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_070458_001014_47967F56 
X-CRM114-Status: UNSURE (   9.24  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add devicetree bindings for Variscite VAR-SOM-AM62 System on Module
and its carrier boards.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 69b5441cbf1a..b9da6e62ab79 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -104,6 +104,12 @@ properties:
           - const: tq,am625-tqma6254
           - const: ti,am625
 
+      - description: K3 AM625 SoC Variscite SOM and Carrier Boards
+        items:
+          - const: variscite,var-som-am62-symphony
+          - const: variscite,var-som-am62
+          - const: ti,am625
+
       - description: K3 AM62P5 SoC Toradex Verdin Modules and Carrier Boards
         items:
           - enum:
-- 
2.47.3


