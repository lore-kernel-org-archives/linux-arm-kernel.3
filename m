Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5280C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 12:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZE9T3uXnqG2GViNG4d7SHAAqEGhToFsltLWTVb8ftpk=; b=BQrH3v1zxIXxQCGv4itCmGy7Ir
	i3ShBFDDJWQx+JmzYcwXL2hE9pD3FfSmiWFKJOzY7+aAOAOF1nLDiUPEL4l5S9/8sh9WBOq6CwXhl
	pNJY+pYxGJX295Vq9qaw4vKqtQ5cGns4Q9GI/a0vMTnFbIfwYZJhbNicEc7DB1IxSnoASoxlpLPUw
	REEktMGI/S406LN5GyjDeLycemv45Dmez8PuYb+YwKnIA42+nhNe0Vp16QnUSri4miwenSw/2ghU9
	uBqfNV322a1N25nRgn3IDU+GUdbv1rOX66wWCF4xt79lvbHGeBfQkr3LThmYPujfCT0S+aHec4PXx
	dvutGO/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyrdJ-0000000GBrN-1pYV;
	Sun, 30 Mar 2025 12:19:21 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyrYQ-0000000GBAJ-1kAN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 12:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ZE9T3uXnqG2GViNG4d7SHAAqEGhToFsltLWTVb8ftpk=; b=mbe3VY
	QGY3uN91DQY6IoP43Jtv6/9xePESy8hVfqkryW3X5k0r0cQCEKaSEMKf4Xt3zVNU
	31E6Xx1KxvSuESWLbT1qCppOawA2TRNOCLowv9lhjeD/d5a39iPH782wx1v+PJvb
	LQ8HiHvkMbp/gP/555Z5vAyP74VDGSFESY3nUWqKUjS4oNm8fSV6jZ39k/+p9UrE
	Up3NnivLvrp6oJkflq+UOrS03LY/vu3t2dQqQdN3a9vUEA//WG0KeqSS7u8eah1k
	4ayrqGtawWJFhq56l5S7Qg2PKdQUswahmOR+3TRi0uqRVHegWsc998EHraV6Vk8W
	3eTUHHOy0VQrzQbA==
Received: (qmail 855778 invoked from network); 30 Mar 2025 14:14:15 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2025 14:14:15 +0200
X-UD-Smtp-Session: l3s3148p1@1P/2PY4xsnRtKjBa
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/5] ARM: dts: nxp: lpc: fix faulty ohci/ehci node names
Date: Sun, 30 Mar 2025 14:13:25 +0200
Message-ID: <20250330121326.9069-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250330121326.9069-7-wsa+renesas@sang-engineering.com>
References: <20250330121326.9069-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_051418_724404_7A704CA9 
X-CRM114-Status: UNSURE (   9.87  )
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

They should be named "usb@".

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 974410918f35..41f41a786f9d 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -94,7 +94,7 @@ usb {
 			/*
 			 * Enable either ohci or usbd (gadget)!
 			 */
-			ohci: ohci@0 {
+			ohci: usb@0 {
 				compatible = "nxp,ohci-nxp", "usb-ohci";
 				reg = <0x0 0x300>;
 				interrupt-parent = <&sic1>;
-- 
2.47.2


