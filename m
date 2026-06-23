Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B1DCDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 19:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cd2toS9EVtCpFi8pDPSG86Zuz4knsyDYVlmhOocX+b4=; b=Uin6gQAU515Mo1SDBj41aFkCfX
	32/yNsZKcJFRx9ONr/ajnss+KNu2jcy/dpP8f1s0ah56INSIXYqjSTNyyHgAbwMZD1zhOd7wPszhC
	DiMHH6+eTvROZ2YMDHdE59uJt1LZeGP87jWmrP5cXR3qIZIWVTXHp1qTZisaGqpvkoOF4u70uRs0G
	8XKlKjyjKORAd4LFYq0pADUeHz/EL/bIO/Fs09xoVgp6VDKCQzBCLQB+AsSinhmY1DSZoWGEi5d6R
	7uECLTmxRUtZU1daQowmIpSThyIIPRre8gKZOHxSr5Jw6PscNvzmMsmfPMOPvym9XL855C87hxZNi
	MMf3X3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7GS-00000006oSs-05gO;
	Tue, 23 Jun 2026 19:58:32 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7GQ-00000006oS6-003Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 19:58:31 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-139cc9b208aso547098c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782244709; x=1782849509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cd2toS9EVtCpFi8pDPSG86Zuz4knsyDYVlmhOocX+b4=;
        b=fYIgZs/rklZXW6KLjvfdEG8tquEF9hrRYKDjswrE6w2b7mzJHhkbuV8e6tlXBf4djJ
         iuI2dJnZ3xzSxv08U5sTBqPFT7q9QHJufZQLR3YrjphLjDZgOGoGwhEsFqlhPe48J9Bh
         Z5059EJH5b50HMi1JgV7bRk4Txag/oe1cbMO8ZXQZyGrw/y9aRLRjmIpJc5K534ZQF+D
         K5t7ZEDfEY7LMwIp7RfLFBJ74NzOU9Pw27vL5ZE2CNbMo9WFSYyPo5WA9jUTULEJ+DFO
         MG7/4diPCmLg+AIpcPCnt6QBG0LskASf9fOvuIcolckQHH7Ykhy7xNZXH4CRSnN1d04B
         Xp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782244709; x=1782849509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cd2toS9EVtCpFi8pDPSG86Zuz4knsyDYVlmhOocX+b4=;
        b=qfEsgV/e+3xD6JAJZdYxmIuyaHfZ2y7XoxcCmu4oS68W8jGKFcqLHmtfCw3GFZpKMN
         YFnTuANkWxIOvA+ZvY6WafGcnEriGdn41q/Ernpt16ZMWaXrxtHG/cT1OoG/80mi+Z99
         IU+HQKxu/20g/iXIaDc9p/x89guCjOem1M6xN6jbFT9dr24Gr5+3X5SgMMOCtyuqbpEl
         4z1jxppwmN4t4o/pt7ceB/yRnsa3eLtBO2VagyMCcIa2a0vm2solplG52+vJ15X1JnUI
         cJ+Yt+uAmuqvBZpCyDoa9N/g4R0WSPmsmdjxbeppdmYSZ38VU9Z8/IswtX1rEDebw9Q5
         GF5w==
X-Forwarded-Encrypted: i=1; AFNElJ+OqCKCOvFH3DGgsidfG0h16UTG1BmjYA0F0z1o3qmbmG1gyzA9g+2mDejS07V1+vbyEWglN6QJcqDsVpI/eIU2@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu4ZTYe2vXboE+yxgRwGyj++KJPcEM8UXRRSXrOyHJCkFF+hEx
	zleiMgLiESJPq/syyaTRgYpsfapT0BIsCpxVBtw6lXa3hBzb92Tyhm0P
X-Gm-Gg: AfdE7cnFRpbkEmqYKbRBEchu4GazHKWsCjcLqReY3+VV7pqsp+dQfMqgDZCcHWb+B4/
	meZRBpmfYMX+KcCg+Rd6Fek3Horc72lvkhTFFgHPby8KVjgNDXa76FxqFBMnZV0XqHSTSEPa2hW
	ysXm2newer2Pyx7XPyDOMUWy/iy0oXkBQb6ohqq98CXOy8XFek3+sNFIjpkLcQ5mhqeYZj0MQpy
	3zhAWTv4nbmLE9NmJThNHWBjk3BEuwlHfzcQzcKC/PB1Ha5cp4WtpskByHGS6zoJpzBx8tHkEx5
	uHbsJqlWTRYJJUQPBhg3GwaYIFuOWrUvh76Fn7nb/shdvPqJnz7s95e3q5OTW646Lbp7P7XwLKC
	/2xfsQrA/cdOduQjhGoA8oRNdWVdWqEglHoSWg8xrZxvTwrx4t4oFprIt37Mx0s0OZt9F50aU/j
	i7YCvwbIepMkJHD0rFaKoaRvPh/8t3xFZvmMjXf/fGNYAPy3ahxvA3XnGJplGLHjeov+eaFWrfN
	OoQW9KwInGLcdqRUbCTQEMVBx79SDFdnOcmSbVjrmM=
X-Received: by 2002:a05:7022:69a4:b0:138:49ea:f487 with SMTP id a92af1059eb24-139d0c040f2mr216795c88.6.1782244708943;
        Tue, 23 Jun 2026 12:58:28 -0700 (PDT)
Received: from leonardoc-nb (201-68-197-145.dsl.telesp.net.br. [201.68.197.145])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add85c40sm15730896c88.15.2026.06.23.12.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 12:58:28 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	thierry.reding@gmail.com,
	sam@ravnborg.org
Cc: leonardo.costa@toradex.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/5] dt-bindings: display: panel-lvds: Add compatible for Opto Logic SCX1001511GGC49
Date: Tue, 23 Jun 2026 16:57:38 -0300
Message-ID: <20260623195741.495734-3-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623195741.495734-1-leoreis.costa@gmail.com>
References: <20260623195741.495734-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_125830_067268_5B96CDFA 
X-CRM114-Status: UNSURE (   8.88  )
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

The Opto Logic SCX1001511GGC49 is a 10.1" WXGA (1280x800) TFT LCD LVDS
panel.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index b89f86bc06837..8382d4920bfd6 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -58,6 +58,8 @@ properties:
           - hydis,hv070wx2-1e0
           # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - jenson,bl-jt60050-01a
+          # Opto Logic SCX1001511GGC49 10.1" WXGA (1280x800) TFT LCD LVDS panel
+          - optologic,scx1001511ggc49
           # Riverdi RVT101HVLNWC00 10.1" WXGA (1280x800) TFT LCD LVDS panel
           - riverdi,rvt101hvlnwc00
           # Riverdi RVT70HSLNWCA0 7.0" WSVGA (1024x600) TFT LCD LVDS panel

