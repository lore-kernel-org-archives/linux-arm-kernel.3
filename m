Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291FB606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 21:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sPCYBa2/;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ygw5KiOL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=; b=sPCYBa2/mmoqt3
	w/F5c4OmWHp68KA/rqceNxHjnEcbNDODciO5sd+trX1zD9r7aA0FghbinOuQK01i3UaYkcNC6dl/B
	ifnAi+tQ5wmMlJ4P5nPtgOYPlmsHIBwtCA4k9T8owp2biWDRumE4MDAG4FqNMHHCJE3jbu3bd4w2P
	V+Tz/ORJlWUq9tAd2+krNQQOVKcc5oVqNwsOxdFlpmef96NYFITwcWjwmpUYFoTYbYe+EK+bUKWGu
	sdQpbXc+d2rwhYnMPG87X5CB7p7ozmWxW6wANczs2pqQET8SfL4Qx6gx1xqts4dJbFc0D1wIdxMo4
	ek3VSphhCXgJkkg74pQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRzH-00000003H1S-0hWs;
	Mon, 26 Oct 2026 21:12:11 +0000
Received: from mail-qv1-xf61.google.com ([2607:f8b0:4864:20::f61])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRzA-00000003Gz5-3Zlu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 21:12:06 +0000
Received: by mail-qv1-xf61.google.com with SMTP id 6a1803df08f44-91c2fc03880so3952336d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 14:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049123; x=1793653923;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
        b=i/hHvKKJXnJIADMn7AiDYk6v7XS1MElaivGnfT8nxTsiwvnHiew/3sMcHsKBMIN5y7
         BE8V4wH/H9dq+ukGkTapW2F6c5DgrhRJpYS5D+gI6Xo81o1M2Qpm6ZXts68qV0eNv6hn
         01sCo+QS04Etu3+4ufscaygSSF23dWnVXGHjhAu4ATQ5l23y8GmRUEjrW1+ZWita1sgJ
         zTgPD1MF88x1HJmJ9yevmbPgRFZorWx52XysxLOjKdXAnPOHs8h97WJ0pDZIUXafaLM2
         DBbRV8GJ8wi/KeJ9ZX/EHQsrRpiA8fJUWKyGnGBqps9dlojRUd4IqLYybgZYOGavp0h1
         ty2w==
X-Forwarded-Encrypted: i=1; AKwUvBxwObL8q47wp7gAYn6jIYfHhBabxD7WJWOL9FzNxcMutviAQQcdMEKUQfFsmQUHrwtCX6viWymdScwQCRGvslf0@lists.infradead.org
X-Gm-Message-State: AFq9FYKZDARmiyjv6ReTEluPXWM2GgCM6TPICYRk1Blsb60yhyVUCZJH
	hi3bnyAFVNgxH8y8p+0ISzqjbosUuru0Pgj2dao0Q61yA0LL4AFfH/xUDnYnoAdfkZqp6+9TsSv
	NSs/tu+GyRUyTJ3+fbwdAOHsuaIf/LABdY1l5qJslYy3E40mUmlfoeED4PHlgfeb8Jyi5i2kDTy
	IKPOrpxOk6RDw8F8/euANiEr2X10S8PijTvHoXtdB07H6AflV5lPBsouu7yxpLliKqRbzcya3BQ
	+wXS9B82eIOIh0/sAppmULtOyGf92nOQcqxjg==
X-Gm-Gg: AYBFou18zqspx7k1LhACFXLdpkqKcTCWpSX+rqP1H7xWH2mDtkNn7EqTvDth3YxICNV
	iwjGTWU3hVRMt3JgYEqGz+Y0wjSWE6XZYq3GF6m0OOs//WXdHXmE81R0/pT0ZPAKGhSu82+Tq6G
	DDrAS+0IvWyzZhpJavOGJ5T9bAUMn4sIyAY6DwpboB//2y4bW6JFXujxbcqyhTLFGcej2OhIY91
	V+YnxPUojWIriLjaGl5R1BJglJ+fxgPcIpDUI01xa4PVCK8VBFwmfJ40UoyTNHMhgvH6C9NkTOv
	FifEnTWbTJSTycU/JBIHOZsawJIuzUF5/gA6uf8BQCg3ANCBhLaUIRMGdcEmfdcZSs2Yr2wnD/Q
	1smPXHKSqiof/oZZtJXayW9nm2rRjUw09kx40vM5S/uxFZlVue8fm4kcQruBK/jNQ94hzxtkC9j
	VKVTc6+bl9ogjLCOoJ/KKinedt5knbmgPGAfdxiMNd
X-Received: by 2002:a05:620a:1793:b0:93f:1fa0:9f27 with SMTP id af79cd13be357-943f4ad5cb9mr177996885a.29.1793049123549;
        Mon, 26 Oct 2026 14:12:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-940f068c2d2sm127605185a.11.2026.10.26.14.12.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:12:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-151dcfb1569so170869c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 14:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793049121; x=1793653921; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
        b=Ygw5KiOLn6iZ0FGF52E1018pGwoh83KN0T04+hmjl9aiQOj6e/nIycTM0m/Z05T4fJ
         wEJ5quqZv4w2ErdSnVLQgxI4fickQ63LY7JR83kG/9TuIbSXAmfXhGWwVPjIW3rqvKpj
         c7GzPzEQf36N5wjCV8iYySvKCysQeW9GsuNXE=
X-Forwarded-Encrypted: i=1; AKwUvBzZsvl1cuD+lq5wawrPcl6g9U1V2KQo3Dtcv3xQ6fVUl78NL1+Mox5GdBZWqfvbesiFoU8SpcnKauOheD+hyFZ/@lists.infradead.org
X-Received: by 2002:a05:701b:42d1:20b0:158:b944:b15 with SMTP id a92af1059eb24-1a3c6150260mr1039950c88.22.1793049121337;
        Mon, 26 Oct 2026 14:12:01 -0700 (PDT)
X-Received: by 2002:a05:701b:42d1:20b0:158:b944:b15 with SMTP id a92af1059eb24-1a3c6150260mr1039903c88.22.1793049120586;
        Mon, 26 Oct 2026 14:12:00 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm31915678c88.11.2026.10.26.14.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:11:59 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-perf-users@vger.kernel.org (open list:ARM PMU PROFILING AND DEBUGGING),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH 1/3] dt-bindings: perf: Describe the Broadcom BCM5301X AXI PMU
Date: Mon, 26 Oct 2026 14:11:49 -0700
Message-ID: <20261026211151.3212237-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
References: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_141204_904350_882A95B2 
X-CRM114-Status: GOOD (  17.92  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe one APB register window per AXI Trace Module. The counters are
have no overflow IRQ.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/perf/brcm,bcm5301x-axi-pmu.yaml  | 43 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
new file mode 100644
index 000000000000..686b20d4cd29
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/brcm,bcm5301x-axi-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM5301X AXI Trace Module performance monitor
+
+maintainers:
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+
+description: |
+  The BCM5301X ARM subsystem contains three AXI Trace Modules, monitoring the
+  two PL310 AXI master interfaces and the Accelerator Coherency Port (ACP).
+  Each module has its own APB register window and fixed performance counters
+  for commands, data beats, channel activity and stalls, latency, and cycles
+  with outstanding commands. Counters support local start, stop, and clear
+  commands. No counter overflow interrupt is provided.
+
+  Each node describes one module. The separate ATB trace output and its
+  CoreSight connections are outside the scope of this binding. This block
+  is distinct from the BCM2835 family AXI bus-watcher performance monitor.
+
+properties:
+  compatible:
+    const: brcm,bcm5301x-axi-pmu
+
+  reg:
+    maxItems: 1
+    description: APB register window of one AXI Trace Module.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu@19003000 {
+        compatible = "brcm,bcm5301x-axi-pmu";
+        reg = <0x19003000 0x1000>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..b97f22107fbf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5220,6 +5220,7 @@ M:	Rafał Miłecki <zajec5@gmail.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
 F:	arch/arm/boot/dts/broadcom/bcm-ns.dtsi
 F:	arch/arm/boot/dts/broadcom/bcm470*
 F:	arch/arm/boot/dts/broadcom/bcm5301*
-- 
2.53.0


