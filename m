Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5633CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 19:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWKotutjFYkP/VqxUCwmViQ7yB9g4hE1fzeaiZxfDjc=; b=bNVbcIgObQv2F0I9SxcaLOgGEr
	Gc3jKGftN/K0ARRQ4fZD/oVE7m4Uty5DC6tLfOWnTHBeVbSK/Ird+fviHSSx/+VNzoGXmXtZYfmm9
	qI36l4YMyudjVipeqXlaSN0Pn9Qv0t2wV5wMqqOYtVUSCxZAVoz3ivyPBCYEB4OBnzJGqpIvbzsll
	T/FcBdytsLaHBBLYFe3vccnnz70v4I9ttpMC1jZRW7Hu/8c8AobbrezCU9gFEgV1hB5zi0vRB79FJ
	SaXprr/JC+ifAI+1XRXZWpTIRCRL+HrRSyawDkzY7pD4RAKVdvlKPvLBoRI0MMTN/CNB2vg+m3+9U
	jfW6eajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMak-0000000A5sF-2CNN;
	Thu, 01 Oct 2026 19:37:18 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMac-0000000A5lI-3Q1f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 19:37:14 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-4a024e16179so4690945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 12:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790883429; x=1791488229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PWKotutjFYkP/VqxUCwmViQ7yB9g4hE1fzeaiZxfDjc=;
        b=GB0JOQtYopv2RJJSKsFVWMAdYa6rJ8LeIrlukSzyCzEBBIzHn849ogc8aNNlG8Q1Vm
         8Ys+Zl9tDCk0GZ/lEwcLAilJ79+g6sE0yl+LNVO7OnBhuAIDw8u8lw1SOW9pfPjIIjpX
         aY+y3YgSf+H8+DbkUA4bZuMyWQZ+i72rzZyR2Rl9e2F6sJN17g9QY3akHIEOk1+qq/+D
         bzEBFcNYIZJS/gXAMSjUbekC+Naux7dTv8IyVaW0Rhmr54T7Qc9qNv0nCI2Hu74628VY
         dTvq6f5eZ7HMw90W7Hb124AiDwiloRi1NRtuGRa8QybBXsasPXj8zY/mzI3SS4RjfJpx
         IdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883429; x=1791488229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PWKotutjFYkP/VqxUCwmViQ7yB9g4hE1fzeaiZxfDjc=;
        b=rnG086WMWUsGmISw7j54kfwIwhO0/gS9Q3cv2ElLAgviFJxt+HqiHscsT30p1AEyb5
         WoFcffbqYlE32RIxwg0gb26+5Y3Ogkmn5CbqjWPZAQMItVP4/VBn61Tnq8yLDE5R4OEv
         hb6uugXrfgGX9zFdDcxizIK/Ik4xJjP2scnP+XBjajxtxNTDei49o2FWYcUqkZMHJWjb
         SfeC3kxNEIK4Cmg9Vx9yvTsViyqwxlqXPQqKXvAjk+xzdZx0hPTmBV9rtGO3VaTnDAzb
         cSRKKCxhTkq6B+nA0NF+4aKj+JD4lYeMfg3ae5P5hBt+SMmhBguK/TOk+9iGFtDN+u6c
         E0Gg==
X-Forwarded-Encrypted: i=1; AKwUvByeuGTrFgHjz2/lVrTA/dZBlMDMzBB+lklEiOEgYLfMjcxAjeS5CANkusb8qrJXxClHCnSblPHeC9puUIbYJSMT@lists.infradead.org
X-Gm-Message-State: AFuF++mAV8EDpKXT5vL4PVsa+7/tKPJlh/uxJZdD5MnQFUkah2Sxizgl
	XNuX6CYDRwok2L6C8c9Wkceh9C7loK2F3j04df2AQj0OoDwDIZhPyzYh
X-Gm-Gg: AYBFou39DmKdxEByY3xNk9CmwywTvPfr7eP7r2jKH7myChbn7mpgsaEruYIle8soX81
	7NhjtodNuwI3JbRtu9dnJc9IeX2578vVsmUBWtfZZUA2sYOraIao/hKVt8+D3LjcjIFhf0kakNF
	NIH+HU0TkMkNsYZXy2XwFfRx1EFrNIav99m6nNId+NCZVsamY9BWtP3k5La9CFiffY6uP2bySvY
	Wgmch9TJeZ26mUzMgVO0nmbkW7eCMOp1uGtWJRntmCk1S2SYUyiklMs9WwQWvMIvIeZoY1oeN22
	ti0b4MXIK75sx3INfe4yhbvso5Dx4fsvLG0WISA7BABQYsg8DN7Jhmsv7UIAHeExXc3iXxDnLNz
	B/8acck+kLSOUDmz8G/3kVgnYHlC9eLmiHAEjN6/5RErVVPyHYFMZwR2YzxyNvUEXSPfqwefzQ0
	vHwtotwjq9dEEiX3WIVDaFbbjy6kPSFPaDoGf+vwxnK/S67TVVSFxR6145w7Um+5sAOMBVep7ci
	WHgkds68/bfE0aX16LdnZZ0aoxBLcv9UuFMHLs0Uxr49GYoq3mxbfKp
X-Received: by 2002:a05:600c:620c:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4a027583fb0mr9480755e9.20.1790883428472;
        Thu, 01 Oct 2026 12:37:08 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02770e8f2sm12312315e9.6.2026.10.01.12.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:37:08 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com,
	pbrobinson@gmail.com
Subject: [PATCH v9 1/3] dt-bindings: rtc: Add missing type to trickle-voltage-millivolt
Date: Thu,  1 Oct 2026 21:37:01 +0200
Message-ID: <20261001193703.734323-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001193703.734323-1-sander.speetjens@gmail.com>
References: <20261001193703.734323-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_123710_882525_57E52E43 
X-CRM114-Status: GOOD (  10.82  )
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

The property uses a non-standard unit suffix (-millivolt) that is not
recognised by the schema tools, so the type is not inferred. Add an
explicit uint32 reference.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 Documentation/devicetree/bindings/rtc/rtc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
index efb66df82782..e46d50b1063e 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
@@ -51,6 +51,7 @@ properties:
       if trickle charger should be enabled.
 
   trickle-voltage-millivolt:
+    $ref: /schemas/types.yaml#/definitions/uint32
     description:
       Selected voltage for trickle charger. Should be given
       if trickle charger should be enabled and the trickle voltage is different
-- 
2.55.0


