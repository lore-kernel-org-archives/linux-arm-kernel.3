Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECF6CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AYpwkW+4Ys917/EydI7IyjwDelI+NEoif5xBlzzE0Q=; b=ql85AM8msSKMV4voUUrAsR0ZGw
	MXGdWT6wRH92n9PS7/P7fC2ntf0WJLjaKINGgyWVU237Xb+YvjS94iKYNKkqGCxF+zwvdADv0CCSN
	9r22YpW5cml4noPwzQJ+P7VcgIMZo+cTvqoG9QAxOCA57nyGmRzZUsC+Ib740V5Xqfx5yqO29Bh/4
	Fv54frU2hhDnkZDA9l8yThdgoQwnyS+MoyV9FGW5mTEjJLwXxpEwjEq/e9ejlQX443Y/c6RU5gTsK
	iSvgmXMQntLYFb+0RjXNXjw1yrf9Kl0sGK3xWesY8Cloyz/LI22N4xhNIW6fW5XyDsQl4W2FLJPym
	mOUt9dKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphm2-00000003zFm-4Aop;
	Sat, 23 Aug 2025 06:30:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRcY-00000002azB-0VPu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:15:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 830CE43288;
	Fri, 22 Aug 2025 13:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D30DC113D0;
	Fri, 22 Aug 2025 13:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755868553;
	bh=t0S8VoLjEG5TZjjggFVPP43JdfXO/Pppd/IA/GIc10g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B0x3Cq6dz1yCCPcx33e6Dr106jKGWLypvcT9jzL6hw55CDS0+YsHnc3ZNIlTXa76p
	 WncZNqibOD9REKi4e7TKxFweIySV4CviPiIyTX7ICc+VdTSM7dK98IqEr+CfkdzhVc
	 HLuqV83rXdMY8vX4Pk5RtxNJcfaxEylezdwxh46w86wrrNIbvVLF7TNurbAReC9wjH
	 rZII6F4g9IoqSwUJAJVJSdabdwYJIia/j1qlGFVq3Npb+I8uK8zSDEzADgSB0b0foE
	 rtvjoq23Cs++wVsbq1hGeCBxYAvfWHXMUeJlFJeVXCoBf6Yzvoxnog9zG6xf+EUfaA
	 zMbrek0qXH0Mg==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v1 2/7] dt-bindings: mfd: sl28cpld: add sa67mcu compatible
Date: Fri, 22 Aug 2025 15:15:26 +0200
Message-Id: <20250822131531.1366437-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250822131531.1366437-1-mwalle@kernel.org>
References: <20250822131531.1366437-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_061554_186939_4E6254B4 
X-CRM114-Status: GOOD (  10.21  )
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

The Kontron SMARC-sAM67 module features an on-board house keeping uC.
It's designed to be compatible with the older on-board CPLD used on the
SMARC-sAL28 board. To be prepared for any board specific quirks, add a
specific compatible.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../devicetree/bindings/mfd/kontron,sl28cpld.yaml          | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml b/Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml
index 37207a97e06c..400f56d6a231 100644
--- a/Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml
+++ b/Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml
@@ -16,7 +16,12 @@ description: |
 
 properties:
   compatible:
-    const: kontron,sl28cpld
+    oneOf:
+      - items:
+          - enum:
+              - kontron,sa67mcu
+          - const: kontron,sl28cpld
+      - const: kontron,sl28cpld
 
   reg:
     description:
-- 
2.39.5


