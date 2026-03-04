Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2268BEDEBFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 00:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uq+Zu8LykB2khmPRxrzoypE2Ot8bOB1NxKiqjP0T/vQ=; b=ttZvoi24UePhhWpRKe9+BSKClj
	JNg6bwvkhQlYO16YTe1z0BOFrPNlQP0XLl65DDOd9+3zdqvEVJIISB9ruSbJEN7Fyw6lPoIyA1hUZ
	/x4B5pvrfht/uXatQ9QgKjxksc8QD3VUag3RDK/hIfNl6t5fwT1x2TuGJUpEEzDpFPjKByud6LjGG
	G6hr9fA9wdGBGX9wRcWqPyehC8hjyhYlSxxBkhuSVXSrGHr+S7gOiucO17mK7ircGraJmYGABtJAC
	blNa1+bjYAOIPQTmd7U3rdm2HKN+iazSH2vvx5kttPA6akOjvKHsr3kUn+62+BJ7hUL5cutCNVakH
	7NJckAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaZz-0000000GCSr-3E5c;
	Wed, 04 Mar 2026 00:59:11 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaZw-0000000GCOs-2eg2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 00:59:09 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so71621805e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 16:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772585946; x=1773190746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq+Zu8LykB2khmPRxrzoypE2Ot8bOB1NxKiqjP0T/vQ=;
        b=Bf2KPCDTuThFhivbBkdejvm0dO5uT/hu4zDEKR+VHCEYr1THOuonYtcvL26moXUbHR
         vykWqQdOU0GZGAKYpVIGvk8Gk7ZziLkPS2t1HegSHyw24wYDY/GiA9G2oJHRETZdC6l0
         pvq1rSGKFDtl7FwtiK7ycvjrp09MMqGu8Zk71vy4FuCDkseQwybHXllYQJW91l89v6jc
         YSGZ5hCUYWrag9uL/mievs3nWZcx5rjLVivbKviIusgsiDZEmcFXJQuUHJQpS1lsANbu
         OAmihgPlofwVJ8gOKVsw98r7wBiDbEyuYHZ5NbIDGIl9GvN6IrphmIkGy3qkrutKRrYx
         e1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772585946; x=1773190746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uq+Zu8LykB2khmPRxrzoypE2Ot8bOB1NxKiqjP0T/vQ=;
        b=vb159u4cUvRoK41Sd6N2Mdyk6eNhgLekL8e63Hpk9n/AMGeerGeaJssWyg7wKO+Oe3
         NTOiAh3bqjw8iwKpKaX9TqYlbJNwFJfvHvnP/oQxDGCBNkWeAb9/Lbh55J22P1iIxRMB
         j3zTzi0Kot0sU1mF7Ure24fdNVL5EJflW8ZOE+osHgaYAWLIeTBki8ZFMEjoQaYL1s4L
         HgCxde7iAiqws8ZaCmTnOe2MeLO+erqG9t7wMkkhDzxNWtrxnTVBJ5zmlluRPl1C2GGw
         r+l6u/TGf0Z9MQITRicTpVd8V5hkOJGJCiydSRtrYAP2hwetrTNgTSGjjIcKd+gWPU4D
         G2tA==
X-Forwarded-Encrypted: i=1; AJvYcCXiElLmebedmQth5nqirGpKvWDjH2eCZSOxhp5y2xhsfnZ7Mf64SQbEjS44Twp82vxeewPDQQbwWUmtMIlSznwi@lists.infradead.org
X-Gm-Message-State: AOJu0YyNZogUQri8D6baFVwdlRKGa9+c9KXLMIwib/5dwg2kBR0hGqE1
	Woc6mtY2TqtjzHiiCFeLOw9VDLwxC7XfccoHGboKeTCnQIpwiPJYf0rECbgJ7g==
X-Gm-Gg: ATEYQzxKHKtSOyoqQ+e3JddZWRi09DeEAD09jK6St1JCCg9dNTpvCH4j8VrMRVquZUK
	LdpUIqZG5VfGuY2tNXfJ5h2ZeFFtSd9L9bbsAtIESBgTi2DyHA+FUThg56QhbF47A+Gu8qRoB1S
	/LUx893tCMyIEA6Vvif5PpErBPsiyIabrX7eLLCDumxYKgWMPElZ4GMQT5oXeThhPE3lFVlAlOg
	NmEGNQM/f/20drggOZ/tU2bRqLrilI2UOreZD6tPksfOjAXfYKEF/wp6hCV7HyNDSpRVPiBCXBk
	trRI4DL3mt1I97Y0digHWVBBU5wfUZwJLD0MaVoGzXUHpQsHQJkWgf1+xVjFIX8nox+AREaWodh
	hU0s19AMt/VcdBsORfZB8wCg29F+r/+iDwl1orfMtcr73J2NGRmYu+MsNJotlziXyV9rzj2KbDm
	KEo7gg1k4ygyOILfER4VJJyBVnalOrmzpnLwi90rsVZlnbaBtfARZVRrY=
X-Received: by 2002:a05:600c:3f0d:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-48519889a49mr3172975e9.20.1772585946112;
        Tue, 03 Mar 2026 16:59:06 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4851880724esm26927575e9.9.2026.03.03.16.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 16:59:05 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/4] dt-bindings: soc: Add bindings for Airoha SCU Serdes lines
Date: Wed,  4 Mar 2026 01:58:33 +0100
Message-ID: <20260304005843.2680-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304005843.2680-1-ansuelsmth@gmail.com>
References: <20260304005843.2680-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_165908_681221_2751579A 
X-CRM114-Status: GOOD (  13.54  )
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

The Airoha AN7581 SoC can configure the SCU serdes lines for multiple
purpose. For example the Serdes for the USB1 port can be both
used for USB 3.0 operation or for Ethernet. Or the USB2 serdes can both
used for USB 3.0 operation or for PCIe.

The PCIe Serdes can be both used for PCIe operation or for Ethernet.

Add bindings to permit correct reference of the different ports in DT,
mostly to differentiate the different supported modes internally to the
drivers.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 include/dt-bindings/soc/airoha,scu-ssr.h | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

diff --git a/include/dt-bindings/soc/airoha,scu-ssr.h b/include/dt-bindings/soc/airoha,scu-ssr.h
new file mode 100644
index 000000000000..a14cef465dad
--- /dev/null
+++ b/include/dt-bindings/soc/airoha,scu-ssr.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_BINDINGS_AIROHA_SCU_SSR_H
+#define __DT_BINDINGS_AIROHA_SCU_SSR_H
+
+#define AIROHA_SCU_SERDES_PCIE1		0
+#define AIROHA_SCU_SERDES_PCIE2		1
+#define AIROHA_SCU_SERDES_USB1		0
+#define AIROHA_SCU_SERDES_USB2		1
+
+#endif /* __DT_BINDINGS_AIROHA_SCU_SSR_H */
-- 
2.51.0


