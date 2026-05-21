Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6171FCD5BB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kx4NrXh6e0d7nDyJTPlJmHDbVsDuIXTB3GMJlYOnaS8=; b=yEYJNvSFB2R1fpTd4YgxIb+Hrn
	h4eA5SbaHWXtAvXu+c557N96EFo/19B5YgWjBBd/eHD+NxrHdRtS/KIrIFp+INpV0gzWISf8wdF6G
	u1NbJzoP0i5q0h2vaGvoamslY7giOsnGqzI0I5klwoN1apTcuDY76EA5OqCUUdshf1nFLzer0byfB
	pS63GbsqisD8W5k69t/KG0s8dKL15/Vc0TlFoPEj3nOJSjha+p1n3ATigpmYwauwWf33ZZBF6eJp3
	qSJ/mi2GFAq3waYxMnfv/LyNhuqxzq+oFIuVCFbwRROIJs5IsvFrGsf2/5Y78sm90BT60OBfmmYXz
	p9Mv3FWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4td-00000008DRz-3d1B;
	Thu, 21 May 2026 15:01:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4ta-00000008DPI-3Zxi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:01:12 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4891b0786beso43512755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375669; x=1779980469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kx4NrXh6e0d7nDyJTPlJmHDbVsDuIXTB3GMJlYOnaS8=;
        b=TRJNDqjNvLDsk2G3tXKUBKQ8Rmt2q4QY5bhEX9vyJoOJssWJyrdZIn6YVFblv9pxWG
         nUOJFc86Slh/MkaD0Fkr7Z+SzT0d7ZimNRUdALuckMb1glsZOjCSoNr6RbP+dxzHuOCj
         BR3IC28JWHB0dI606fHPiBrUxdQjGkNGHS0xSawdootj+NOOeaY5NT2tSwk1AeWq5ZHG
         HWEV2cBpgYtnj3btU5Uwppcp/J3YNoseTj0zu4w0Jq6SnB9TCUMCrBRiSXme2IGZiJYD
         c97XCNKdqJ0oyErIIiLfNZyfivdwQmFEUTKJrA+E0oc323G4Ne3tO58sXzxMdkOKygUZ
         /MIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375669; x=1779980469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kx4NrXh6e0d7nDyJTPlJmHDbVsDuIXTB3GMJlYOnaS8=;
        b=DuxUyt3ak9Fi61/dbDzLKDeiQ5YwC1yuHw8bsTX8gWxzsI46XKJQytX3qB3WlB0BWc
         YVV0hWhRKARGn7h02phnmPoq2JzjdlmYFP6kbTXAwwDkDwIKalyVlgTahGD8FdQ/K/fA
         rWxQKxsxeLkNdmTt63xzAorwpHtkvhdYbaA8S6ezpmIe7cDPtzQgokm7sTiuNWH6Ks2t
         n5ekMzwEmc6roBESQSaEZYyJTH5KABth+xj9GNpcaXE4t8LSyJJFLeMUqIm7y8Mhc/Ra
         D/QQnCuo9BB0Uc1CFaeZffAT6mydiUBMVawt1d45s5ExH9QWudbsNCg/OPy27/KJssIZ
         rvlg==
X-Forwarded-Encrypted: i=1; AFNElJ/SAY0z+mFdYUxz4Jt01s3xXmLhM4rPDBruU9w/DnYXcgPARxMOT2A7AZ4/oKAXn1D5i04RLylH55PHbvEYzt1f@lists.infradead.org
X-Gm-Message-State: AOJu0YyXFiBr+NLp3aLfnJ4mLK7Wv/xwysPLsnJBRFLkZavsUXDnUEMP
	jKLh38fL4w/KyJhIi858V6wXh+3BQwSF/r6vpaK6HMMWnoSaHzYIb7a8
X-Gm-Gg: Acq92OGB1mb38+CLWwNIXVcZBwNRRX8dupEgvqfqlCiBLdpC9OmwBT1tDF+OLgGj9T+
	bTNfTO6L3wl1+AM94BMkaydNhiZRnMrtiCkpvE3msSO0t6uTIaekFr6drX1uFCzh8XL4hoNLaAK
	WajXYO9I4TXDumC0sFFk4WL1ybCLyYwVuA+nVkRuW0znzucDFCIhPVjAOKQSlcUDMArcdI8i24e
	J+p7HWI9tbxun6xU+6NI/lW2hXXevE8lE5bIRsVg+c1cICzXAdtlFUR+LYuGKGtzWFwbB1aMidz
	lJ4cUXFNmXxuZavNVBoFzpQcJnabDit7qGu3XSxACH6UYOZm+ol1dShDDZpcAErlMINxviXtCX5
	opVj2jgyugI0a0+bnuDavcK8OPY/GDt3RcTtGd7V1zHKzV7Cj5+rG8jNYbKJsX5ksynzDNLRYQz
	XMQG+SWaZyPu2va0OHU7Y95uvd5dNysWH0Kd2eoooanQ==
X-Received: by 2002:a05:600c:4e8e:b0:48d:c0a:3813 with SMTP id 5b1f17b1804b1-4903602cb4cmr54844565e9.3.1779375667684;
        Thu, 21 May 2026 08:01:07 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:06 -0700 (PDT)
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
Subject: [PATCH v1 04/15] dt-bindings: vendor-prefixes: Add Riverdi
Date: Thu, 21 May 2026 16:00:40 +0100
Message-ID: <20260521150038.103538-21-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_080110_905121_360AB038 
X-CRM114-Status: UNSURE (   9.41  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Add vendor prefix for Riverdi Sp. z o.o, a design and manufacturer
of TFT display solutions.

Link: https://riverdi.com
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..bac056d486e7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1403,6 +1403,8 @@ patternProperties:
     description: Embest RIoT
   "^riscv,.*":
     description: RISC-V Foundation
+  "^riverdi,.*":
+    description: Riverdi Sp. z o.o
   "^rockchip,.*":
     description: Rockchip Electronics Co., Ltd.
   "^rocktech,.*":
-- 
2.54.0


