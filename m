Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43296C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 23:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmAu67PdIVI7V1UutpEDvX/bujznCInbK+OAzRMwn/o=; b=Mk61EqZCqkqUw0f0Bc9jmwYRO0
	1AVoHwUG61yjaI0cww355LJNwv2aj1K5vMkbY6NSs9iqPxGZA7+dEKqnAfs6/BgnXsbHlZySFk248
	+KlSTAzyUlk+qMTlz7HSn487FD1bnjjjtcuvxLofToD0OftQXwdlVExUmJ22JW7hC5eWdUCPb1iiJ
	WmgFc+FvFpVEGLhlK62u8Vvn1jJHNwh82IA0mm1NKxaQm4OR7BWFNvWoom+tfCfQQnI9UGh2+V3Y/
	TNB+KGnWFWA2dS2QX9dJCM0JFCrfPcPnO7EtIgZR8GjzE/kPb4ASffsvimjASo2FVaZ13MguFl3P6
	5ROAPOzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zQo-0000000AGso-0WGM;
	Wed, 16 Sep 2026 23:52:50 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zQa-0000000AGar-2xRk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 23:52:38 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48439feca17so207657f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 16:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602755; x=1790207555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tmAu67PdIVI7V1UutpEDvX/bujznCInbK+OAzRMwn/o=;
        b=qD9AzMv3PPZGXo8RtZ0fnfMPIAm7ahwLC9Oy1iwd2DvR6EsawZkmYGvXjfo3PeOyqY
         2e4ip5lsvLeA72FgATT9oD02j7Vl/DvxsCxGEVWkP1hdSYuM5t5dILOaxF118ly8RJGp
         2Ux/ZKpEeyex7VeMxz9bJ0rI/DXDQ1JOWjMpupLQsPDumvLqzzhm9iKJb8N7RMjpF+sx
         gQOzi5N/2ExRnnWclsyEhPw3JGe3Nl0Z31PHS//Id4bLbxkiobmvA9mmXa8Vu0f9CJpq
         p+XbP17XUhS6E2uEffEEePDxI1teTo+IS7NpnDCP8UTix4OWpxbY4QRMk7+hF38ToPli
         bnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602755; x=1790207555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tmAu67PdIVI7V1UutpEDvX/bujznCInbK+OAzRMwn/o=;
        b=qmYUnPzBanfapy6rHXZTtKaFJgzUBzGrb2SVEfG8nEQC0dHRbNu8DYuBO4dMVQUvkk
         xHrN/NJm4qGHh/knqXoeOTw7OQBWW14zjqYe8d8y6N1uAKbbfXCmUeM/vhgHiqtgx8eD
         A0KqsYGF9umQv+7rWUJAGaknk3hf9OOgaVhOyYzO0pIRTIvdyF0gLwib70vNOtTtHLIZ
         toKccR2S92o/549i9udW1VcIrtNGd4wFclybCUqa4ZYhP4+sglWMXZqF5MrBtA+2m+hK
         /W0nKof9y3j2PyVW8JX5xcsH9fHUvtXV4co3kmOuREJgBvzgJ9InrywDcnS499oKxehk
         WN1Q==
X-Forwarded-Encrypted: i=1; AKwUvByt1BIc6TCx8leImP4XtINtxbfm2gOR2a2+JdgVTSPgWtvQBXB7SKahV+em3vc5jjGxqrHjXDcM3WsZzRyS0BJ4@lists.infradead.org
X-Gm-Message-State: AFuF++khFn1u9nwT+mwe0lNC5uAeIXeHBI34IbpNJB2q5MmmAOCmNif9
	q68yr+uJHcePB6qaOXMScFrzFB0jeG3cjan71st6im/nOfoeAIXk/dmf
X-Gm-Gg: AYBFou2lHU9Q70nxYEChkLTSly2x2/gWQ3ybzu+MYXfUHIlP0n4qYYg64+rZHfnqrDE
	KTsezHfKvOq2vpe7X4RYwGWJye7xAjZRwBD83tajcggQgggITTHbxEBOA75vtqisRIqep8MvZQK
	N9stGe2R26gHGA5MosJ7uIki4pRd9neo6gWOXMs9c7dGFPkEga392w35NIvu2jVVVLOScSEucCl
	FJscQQ06x8Fvh/d5QwXZZS6toH33sXRYVIs1uUdgOz5D9rNOi1b4GC7orJfYpZIBAVIyvJa91rI
	llNpGJNqIyxnoPWZ0Av9ZLproXVlYr6v218XAAMaqXAv1IdWMeJMnd1FtDIzgWOLEPn1hHp/qVO
	IIuEcyLJz/cPeouC5wGIqx+bqxghxClWtoUuN208bk3uOSoWpw2+aXsrH70oaVfomeN8HvfYtMH
	EEFnfiNDD3OxQcmucDfobFfLNulDc4tvLmIFRzVSwbuX+tvbtfuNJxH+qoPIR4AjkywbHuG80mo
	MCycSd77o3ey5KJ2nVuFw7hdDHTzzjSdx+o4wCJOcar69Fc3L33BMEC80HoInE=
X-Received: by 2002:a05:6000:2304:b0:487:b32:9d6f with SMTP id ffacd0b85a97d-4870cf25729mr5407208f8f.22.1789602754931;
        Wed, 16 Sep 2026 16:52:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm11861104f8f.1.2026.09.16.16.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:52:33 -0700 (PDT)
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
Subject: [PATCH net-next v16 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 17 Sep 2026 01:51:34 +0200
Message-ID: <20260916235200.20712-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235200.20712-1-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_165236_768461_8DF071FD 
X-CRM114-Status: GOOD (  10.56  )
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
index 0e04d92d1b09..35e20ddd018b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9755,6 +9755,15 @@ F:	include/uapi/linux/if_bridge.h
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


