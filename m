Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E13CD98E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 12:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=; b=r5u/mjs/DaBn1Si020U0jxxrfY
	74ENmUPVc2lzTckELLUoUeHrBRCMWMEn9fCDvaoPJhRAUXCfVXk+04KBxQN3KC6EP9/eQ1cxXl+sl
	kKQFl+p486+Oho4HEzedCmKcW1Emevj7cfwe71rgsf+5HKG1zcObInIah2LIDtwmHkxNMlXenDpLM
	UNys6CL443BDVAOTeqnq8Lb2gCnnRciN3RL+2DwxWXkbH9w9ZwIDxcmVQC4N06CblGve90ueepCJM
	FejlUE2I/8iBw/dLVUI8sR5t9NWoe/ZIJpoMhOiM3reowI1U7rthr00+abTTbX0F6k1bTXRZP0ACR
	18SL5HfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6T5-0000000EBnJ-16MD;
	Mon, 15 Jun 2026 12:31:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Sm-0000000EBST-3CSP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:30:50 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so21353315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 05:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526647; x=1782131447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=;
        b=YVbmy/I2vAsLOk3WBEnzOJW8kswwSqSaM5ILaxhIEawle1KDqZWGOBfxyU82SZ2Gee
         tP+77sPEuvEv4wjJpCIJJhc3xts2/thjYWg87JhM/LPcYJrRGTOy+1G90t+3PsmRPTCs
         hfE1/shtbY+SHJspMQFNM0afRCAR8/WQo4KlzMucnG5lvBy6lcjNOa1zVdLy4w/fA3Q+
         0/x/FA7HRw9w1Ja2uDJaVnULu2XmhLp+5dCEzfDuhVk7qg5Do2B9tZcUVuG41VnuDuDW
         yzFpXzy3yBKnD6aaw0cyekQXaXUfuiSHBeBlzY1yIw7ed0u3806Rktka8ECMaSYPQomf
         yqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526647; x=1782131447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=;
        b=I+YDD6GAQ4IXd95C4P1ivG6C+OAQTVJyFucvGRZnfFr/SN8daUPCStpxwfZTt4tBNl
         hywFhIDnykw15a4TX1G8iaz4fsqBNHeVTEbO+cxpz5VuMglxmjVr5dxI3dofqPccKfiN
         E1oaIokEhy1KxxOoq2zCLtU0SwV7iJ/wIpPYhFaQGjxApGXrER2vds3VSl2Lq3iuTpRU
         D4FN5S4i3JgrqKjitJhZa6q8U7SDiGdxVnxGspHouJLkmEWVhMW4S6SZx1467RrMmEn4
         ksNgrX/zZ69H4AwDJK3UUQNp0lk2Slrj/JyPQRBaHg+FBwOEJdljq+a9OECBZyM0rW4a
         w+lg==
X-Forwarded-Encrypted: i=1; AFNElJ/qN4z4OT7Y76rk48z2grojM1X+ikXICpWNz++WPMBmKmnz/fBPV05E22rihKRzCrtEZoOlBq6ids6Vh4sOltk1@lists.infradead.org
X-Gm-Message-State: AOJu0YwbgIbdtlUNirBBA2NGahraA2o6ocJ5sP5NJcRB0kTz0Jd1bTyg
	fg2u65pQRlGpa8bwyVYszvMqZ/wFJGe5R0TyQ8o0AITMDOPQQTyW9M2m
X-Gm-Gg: Acq92OFNh3DE8zh5OswNmbdPqCkz6zLOhXYCAwVlhjF+64jqehXX/mexCDqbrTjPNx4
	BJduqUbkeY1TnqjmHGXf51Y+jQybpIWdjzfheH2zxyDn+iHKV9jwEKAIAlGuP/HBeZeaP737L03
	2reQYSPkLXqz25DY7qBiPmftaGt3BN0K4xuGml6hSTeSpbmn8RcNK0q+c3veXL78zilPIvO3/BB
	O/icEd8Hn++y6UYykZ8mrFkO6iQxWi8eRD0CH+FC5Z2e27CtFr3FgT4fonDyB8ptaD9aWm3IhOq
	V956fg0xjAlwZ/tovs6DLlVnT+AvWjdH4tU5oE0uWXHwtlIJRf/9Ra43uBoE/zLhRNLDfqSPyDg
	GcR39tydi/DKqK6gxp28IPu7wLeejBqPMwZ2UDRtKF3cB11EsUrQ/gm+WZZuGurGrvcS4KyODjr
	qGiQw7pXRRrgc022EalSnd5j7NgG0c6tcOdfqh4f4XUTghU//yPipgu0s=
X-Received: by 2002:a05:600c:800f:b0:490:b06a:649e with SMTP id 5b1f17b1804b1-492201436f9mr121572525e9.25.1781526646890;
        Mon, 15 Jun 2026 05:30:46 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v7 07/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Mon, 15 Jun 2026 14:29:43 +0200
Message-ID: <20260615122950.22281-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_053049_126512_9C18E877 
X-CRM114-Status: GOOD (  10.42  )
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
index cc1dde0c9067..ef3ef5096d08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9593,6 +9593,15 @@ F:	include/uapi/linux/if_bridge.h
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


