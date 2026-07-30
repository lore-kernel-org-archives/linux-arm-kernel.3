Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29D9C54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IidZjb6Sk1gCBpTKPlKzd/sIpZV6ZnvffkT6vIVNonY=; b=xF1gLtAZG7wbuSu+v2wk06IRb1
	L+GICtHiEjdQHCxPjgD3mYPxVsZ1VIr34riWpnzW4lD8UzzzdQIMPUpL5pP02bDg8DVS6L1x1nfLX
	wzr49uoIIED/gE9ad1uGQClXK9oxuiVxVI+Nkf9pKidk2HzTvwDU18ycS3eZ8XVYDAek6JV/YF99O
	dCM4aN/AHOqIa8BdQ2XIoh2xsO/dUCb0EsnRS+AEAVH2aJGIcRC2L6oInNw7xoKcH+sJ0U57pGYcK
	+2K0hjKsNeshcBWn3TUtr0cUdiQd9VPLnwDwSDcd6gsvQ4C7a0bsXQi4qZBjFrBwOiO6iOJxsKYYG
	eX0WJ7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNxg-0000000ACCN-1Gz3;
	Thu, 30 Jul 2026 10:26:01 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNwu-0000000ABbM-2wR7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 10:25:17 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49553515a8bso23423435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 03:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785407111; x=1786011911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IidZjb6Sk1gCBpTKPlKzd/sIpZV6ZnvffkT6vIVNonY=;
        b=mAVgbuGhr6362l8f60v184bcjEg6aQ8efrwrEEj+d/ylnLgKhHBWj67VL9KCp/C/Hg
         jwuHi/C+XgAf21eOGOw4mSj2D05ZHzftn9B+F3LI7gNKxMm6SDtQKFeklxaWR+yVrbHD
         ldKr69Ha6SLNG2u04bHC79cjuKAVHAZv1Xlf1CWll3wWUTJgbGBmf+QfFjsWTZor2XZ9
         ZvJcO6K7YGNXEq8vbS2tvzHhh1hQl6eCN6jC6uHEOTQ3rWh7hU3bmQA32Oxau4ko49uO
         j7EZGeCanwNLUojvX0j0VCAkFgBt4jlP25RjXXuIYKzVFvHkiv14SMEn8wPgGW+HpArj
         J9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407111; x=1786011911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IidZjb6Sk1gCBpTKPlKzd/sIpZV6ZnvffkT6vIVNonY=;
        b=BAQkoHr2BcXXanpxWM2W2jjU3lGnw+cV2oUw/VlYgwRZ4AWl7OKJpL2VO2asAOimI5
         udC48mc4VeX2AxglppsvrpMX1wgaeuOjQYfYjvTVYZV7tewSgaplyFrcD97mW7Y2UVUV
         QzWjNh9UllIsvy6c8y4SguUSJMopbdUje9C9d6m+t4wg/RFwFIRp6XnSI1WbVjZe+hHL
         4WcDTAtbppM605EUt0uSaeZfyOJ8NlqtBaho5BstojQ6BcaKl5Q3YRTZNjHO7R8O98Mm
         zebc31sCMGX9WEuiBEdvUgchRe52snZWpGsIPga023CtX8dMv65UDSCVhv2MmLPJy5Ld
         K6eg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+oKlAtCUZEmxmL/ioPgFSVuOmRsTc/nCaR97K+gLFC3v7DYOShqUxeysE3NfTXfxRm+Js3ntHMG5W9oPjxc4n@lists.infradead.org
X-Gm-Message-State: AOJu0YzdOiOcUGE7L2Y2z+3E/j5VQFpAGiuyZ0zgC13Pri2T0N2EOQVB
	QbdOVKKJArCeUMOua3EjQ2/0iUEl7Dt19BcxZBdtECGXCPmJcwl9kg1z
X-Gm-Gg: AR+sD10FmpSPSb+rjMcz3tlLMtq+GTshtXdk6lqRnoGo8MOTS4JtHy8mR9+RSj9mLxt
	BoTUmIVXdbuKZhXiYgojGx3tRQOmRujAFQXPJ5T5rCxtiuqp/F8vtHBnH2DfKUtV4AzaluAz3dk
	el4UJR1Wb8LbSTcKh63PgPBDPiXbaFyMHh/LbBznatAwgWLXZaWKjvAE15UaFfDTQtjrko4swsO
	SziVZUgFdJd0wmUNk33QoNXDmDH2Sw9mEQL4n+Bhc0JqkDdcPTWqONy1C+PlDfZiFQybBCeSVwk
	K2PpahKputs/veBnGHrc/DoHaWVzpDCIIu9ZtlcUnd35ramNZKvJiA7mPaysjgcvHmyO64K1Xgr
	qdMb61n8P4x52JYq7aFJ80E7EfmiDSjAJuWObQWCjft/iG2pD/RIS+uZUFDQ8x7zlVuacdIazBk
	xKUBGbQ4TARhooXvNR1ArhBPTRUPoLSggznbZUmSJVHeGP6Jg8v156tiNBy9GiQMQD0ISG9p2K/
	a/Ssosq5GVUUG2/TJIqrokbpsf5ipV7MaqTw2uJpeaNdXojuWqm9A==
X-Received: by 2002:a05:600c:4fcc:b0:493:c773:c3f4 with SMTP id 5b1f17b1804b1-49800ea1af7mr28621295e9.22.1785407110623;
        Thu, 30 Jul 2026 03:25:10 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-498011fd5fesm44720295e9.7.2026.07.30.03.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:25:10 -0700 (PDT)
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
Subject: [PATCH net-next v10 07/11] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 30 Jul 2026 12:24:18 +0200
Message-ID: <20260730102444.1967900-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730102444.1967900-1-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_032512_759183_F42914D8 
X-CRM114-Status: GOOD (  10.37  )
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
index 3d17b7b143c4..3ea995241522 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9697,6 +9697,15 @@ F:	include/uapi/linux/if_bridge.h
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
2.53.0


