Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4620FC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 23:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGcuL1ZJ6RVaONcJJiN1h0QlP/SsYqFMDoH2EucUXRI=; b=V1NAItvf9kquTR3CwF/Bhe1/YG
	7JAMLa4BRA53EMZhriPH53k5jbX4RYWx1pBYcGbDVNr3dfv+ahE70gjARlTh1WRgUZUXQ7MLG0OcX
	Jy4f6TSDc73JsI8P9eHg+rGCr2hA96I5Enwq3jBQPdMHT+XyU1cBKzgCF30iJ/awvMEAjN/ygJjkN
	naiEAXmtO5HUX28bBzozSEl9jsRlfcLRj0QzstM53VzdVstgCAgHoxXfBjVprKbIJmCoWWYpunbAT
	CQUPGIdHD5VfykcrohjQ1j2RLq5B45h36pEtfLYXeV3qvxECRzheqVwi4klfh4rBk6kRqY6t/wVXh
	c4X8ZduA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sSu-0000000CLls-24nM;
	Thu, 24 Sep 2026 23:02:56 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sSm-0000000CLYZ-0XY5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 23:02:50 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d3920so2332305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 16:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790290966; x=1790895766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jGcuL1ZJ6RVaONcJJiN1h0QlP/SsYqFMDoH2EucUXRI=;
        b=HINEzT0Egs5H1y23QEdCF5weyQgqNV4/VQfwdA15klzuFHT0gc7Iab+EUclECS1CBj
         W6DKT9vbo4KA2SxzL6Ex61pnCSfVVf0gVtJ3DmOvtts8KP9lpdSUln/tAJeswW00B+uO
         PZgia761jlOd8TdnmjV0oS9moB6tsZE8xFsR0YCnd+LtySmzTrxwwuitSCXuow1AAkUa
         Pmj/kdFw6AiM/e0BbkCb7vZAzQ1f/FVoXy5YC81a4wCJZAxTlnv1kcAm4DX/CFBFOtoh
         nPZXwkqkesQXVBhdbUyENukGdTbGqT3bpcFC+09AqL65HxO1AaLIh3oebG93Gsxrqodh
         mKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290966; x=1790895766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jGcuL1ZJ6RVaONcJJiN1h0QlP/SsYqFMDoH2EucUXRI=;
        b=cE7NCipuDB//driC6HclqS5cOg/w00nIKL1ecF1ZOogUkJgOLVT9e2/GM4Fiuh4JJo
         W9A8AdGeg/FXhf3RNfVVrxemHz+zDccyZY0IrYedlvjWD4RIi8emqdG42L3CZOzTEBqb
         LeQ4YfpjvIqyrmPXWCcwXwJKfQ0AYcq/KqCKPHBZhY5NPumY7QnuwcmfGKYZRloM1H26
         7+m9dDWFSBKmst1E7GPQmcDaFrCr+HMw6cgTEHcRQ8c6ndpN77lVcYxcW0NAxfy+4wph
         QuLVLjh1rei+VISjsFkiP80p3IoISbEs2ZUUn1wg+irE7QLGZrrd6Jww1si0jo4l7scT
         gcYQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5U1lriYQOQYO6UuuCvZi6vfiVWzM9cwDviX7/MUq2scK9CIoBUzhAPoMT8pxr+iKHnMqIaQT0+0414P1lDr6o@lists.infradead.org
X-Gm-Message-State: AFuF++kGRqm7dOnnbizuWubXl5J3YDikbqWhoK55gdfF4Pv0bwJ9STfR
	cjHJjRnz/ylf/94S/NimsPL+nJrJJ3utrjn7/rKB1CCnTn5jkO+5qSa7
X-Gm-Gg: AYBFou2SVUjVZJcNOZaIuSwqZjUvTqBIp90Gotqsljwqze7hfTn+JsvZ4VYcE98+iod
	Lra5vsTDAE8MNGfh4j+ovqL3+C/mr+jhQncxB2aBwJ0yidpmrIXOSJYpOjOQve86XBNl1A3jIFq
	oOP67qaRq/z2UN4L5jn9n8n2y7bjUlAH5C0PcS1Y3hAWtkp+G8XveiRWdHqewoUfPgxuJemJ+ok
	2O4pmIbrZl1xyHMLPMllKSEOBWecErkl1gKtsr+mKRolWaHHJXYGatzsvZMvGhZRI8YFiObCgty
	dz+hM+cd7ladIEfSQ4MZoyfPv47M4nN2xk2xp4EocWzm10EazcetT38jbsM1kGLoqeUtdD1FHmF
	vLVdcjVOMLQtZfnFXk6lsWhtGJakSu3mMMK0Hyaoajb68Ff28D5MCP1KsY29cvxD7A2U4zlMyl5
	PILJpUiNdmEi6zn70FfKCC1/hUMFY/mfbq3Lme0Ny911i5StXqondfaY65k2Is9fv9E7ONIdoiy
	C37jXUYMsIRRdAEMFO/UQUVIL7kn6FAy6gK+7H42vUP0YXE/XdeDExAplIC76wt
X-Received: by 2002:a05:600c:37c6:b0:49e:81db:4926 with SMTP id 5b1f17b1804b1-49fe66ca0d1mr65872935e9.5.1790290966498;
        Thu, 24 Sep 2026 16:02:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbe57sm12288175e9.13.2026.09.24.16.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:02:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v17 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri, 25 Sep 2026 01:01:49 +0200
Message-ID: <20260924230211.11519-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924230211.11519-1-ansuelsmth@gmail.com>
References: <20260924230211.11519-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_160249_312260_A890EB6F 
X-CRM114-Status: GOOD (  10.78  )
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6de1ff058db6..a572e845b8a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9757,6 +9757,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.55.0


