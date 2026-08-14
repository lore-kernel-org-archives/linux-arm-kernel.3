Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FD1C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 19:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4pFsg5DaBut5RJmYZBe5aOtRtX/aP+9Aa+0P+1l5WK4=; b=IMGgSuZTzK3vx5
	fXY8HoNwz6gV2y1dE5X+EFzOJBjchvm0EyM8ltGfbdsZqBQjFGFr0ybkUYbUNUG98XrtvY+Wqy2Wt
	xwKosZkW3HjRRDOVUSz8zAtrxrorxPoC8jypi7qrQ+yw+th3Q2txE/ts6MqdiETWnatC2s+bZ2aQ/
	cKpU4wK7Th4bk8Lq5IzyEMXYBsrKLoN3e3CuMbloMFRBUcAN8jOgrkX+beh492OzsXnJHldF0ZzPY
	5v6vDy881m0LHZmGmZyhU+Q3+pdQoFEG64vrZRich1gv4g8YVEEnewzcpZdRkXjAi1yTTufk9t9Dh
	eGPde7wwIwy2eg3vAnEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuxs1-0000000370v-2lJ2;
	Fri, 14 Aug 2026 19:47:13 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuxrz-0000000370G-2Hyo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 19:47:13 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-ca12086c06eso1052888a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 12:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786736830; x=1787341630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pFsg5DaBut5RJmYZBe5aOtRtX/aP+9Aa+0P+1l5WK4=;
        b=kcvN2df6EeQfZssEmwjgWGHBHZhdxQ/CEk7XyL9qlROq/K28AkAHRHS981HXgBJAKs
         Y9e9GDV0YB33bvzRTKBwPXJlMWMGqSpla1vl3vSRkMlrJM6diuzi/oiw+WYNTbe85+IF
         UMXdTg0oBj24CqgdJjj9fXXw4gbe+RrIj42lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786736830; x=1787341630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pFsg5DaBut5RJmYZBe5aOtRtX/aP+9Aa+0P+1l5WK4=;
        b=slUn3HbanJR2BZjPA7iZDxAVniAkH09cxBotpdAmWVFiz9He70IfZWlnJm7MkIOro3
         HiYBeV2L9sH12emAjhRCQm/HZXuwG3oPXmb2/CxHTeGmbOPp966bWpZ53zSpIW+p2oRG
         2QkHYrZ/MDOzxHEa8fLbV7+9uXEBfemk8CBLq1TK6kgXAbktOEt9vrmZm1koaYkj+ul7
         tV8sviucsfw7nlrqhKkXeRXKwhZgRfT9+BAyzqV1pT6Dsj/GGvHudXxRUYOG9qjws/1Y
         bL6Fx/LvhHRRrXmf7ZYixzXpkh4fRgIH2bKWd3NJZi92jovuQ7O96rv+XGG/3VuG3D9j
         6kNA==
X-Forwarded-Encrypted: i=1; AHgh+RpYZRWjRk9RI4rrJ1U75ykN8XkDlU3Mi564Xj61odPPt41hKrE6sfoi+/v/sSRdPf0Dy1cY1GNoRjCTINE8LD/T@lists.infradead.org
X-Gm-Message-State: AOJu0YxUqpq5hfcrV/yTQcDpfghuqa2D1Y3Ra/qW04L25zuNX0CxgNxU
	jHlIRhjn5V4afqyBcZUFf733x0i8dyLOYKHmtMI8uwrw9ryp6+blXFhMHNdUswpMrQ==
X-Gm-Gg: AR+sD12hnD7Yjdk1Gv6IffgwZtqu/ZAfq22kKJyeLHZ9St3ZT6Zdrdikes41HeLGXp4
	voMgm4kztLdt6Yyt3Vvejv60QZwcEKJWnWdd0TRZ4eAk4GBKPYR50AU5xGTEWtzbLyLD9QgxMPq
	tMD0j1ao/UJlzZogXyEyVg+8Ft8zyu9GOG5QiLZt7038W5hHh+uOJBvW4iBsC/+22JVqXZFtwDW
	ZXUSkSl6TZvsgk9ChXzrRJWKYEJD3BsVmCKEMe5ZMlfg95rBQUc8EvfA+eULmuNmZkbrBeD0Cqz
	mLGbO8f1MBhgUKSdxh7Srbhxpuy4FFRTSLonVGIz2wc+B7R8vcuomp1HUusHO5x41gWI++yjYil
	gUsxwtsclpuFQGeI10gcMBqmVHGuiwk9fCT6X/FaqmWuQV1cW4+IknrN1e7ueq8nTk0dQVeg+I+
	5xXpJE2AR9iFEXZ+GZI5JaSpmzmVWGrG79UBk3af8JvXOJWhI7FWozujypYbCn4Q2A5dUKXMqu6
	W+xaDTuASHzUzsblm8SOL0yvrdWGMCH926AYV4M5Wibx/k=
X-Received: by 2002:a05:6a21:a4a:b0:3c3:9070:96b3 with SMTP id adf61e73a8af0-3cc71af165bmr10151406637.3.1786736829719;
        Fri, 14 Aug 2026 12:47:09 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:dcf8:d626:8503:b94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm11446346c88.0.2026.08.14.12.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 12:47:06 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2] dt-bindings: mailbox: Delete old 'mailbox.txt' bindings file
Date: Fri, 14 Aug 2026 12:46:12 -0700
Message-ID: <20260814124603.v2.1.I8b3ff71c528133e7d6f81fe926fa39e6451d63fd@changeid>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_124711_640634_10315A3E 
X-CRM114-Status: GOOD (  28.91  )
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
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Thierry Reding <thierry.reding@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, Lee Jones <lee@kernel.org>, Douglas Anderson <dianders@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Sudeep Holla <sudeep.holla@kernel.org>, linux-tegra@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

As per mailing-list discussions [1] [2] [3], we want to delete the
following old file from the device-tree bindings that live in the
Linux kernel git tree:
* Documentation/devicetree/bindings/mailbox/mailbox.txt

The old .txt file did have some descriptive text about what some of
the properties meant. Those have been added to the dt-schema
repository in a pull request [4].

Also remove dangling references to `mailbox.txt` across all remaining
device-tree binding documentation files.

Link: https://lore.kernel.org/r/20260722140214.GA548057-robh@kernel.org [1]
Link: https://lore.kernel.org/r/dc7a2041-50a4-482e-9930-566bb3fd1e72@kernel.org [2]
Link: https://lore.kernel.org/r/CAL_JsqKVjQ2m-dzMUENQry-f_YE9QrYSOKoH9CPj1gjj8XkPRA@mail.gmail.com [3]
Link: https://github.com/devicetree-org/dt-schema/pull/202 [4]
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Lee Jones <lee@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
- v1: https://lore.kernel.org/r/20260804133801.1.I8b3ff71c528133e7d6f81fe926fa39e6451d63fd@changeid

Changes in v2:
- Remove dangling mailbox.txt references as per Sashiko.

 .../firmware/nvidia,tegra186-bpmp.yaml        |  6 +-
 .../mailbox/allwinner,sun6i-a31-msgbox.yaml   |  3 -
 .../bindings/mailbox/altera-mailbox.txt       | 12 ++--
 .../mailbox/hisilicon,hi3660-mailbox.txt      |  2 +-
 .../mailbox/hisilicon,hi6220-mailbox.txt      |  2 +-
 .../devicetree/bindings/mailbox/mailbox.txt   | 60 -------------------
 .../bindings/mailbox/ti,omap-mailbox.yaml     |  3 +-
 .../power/reset/xlnx,zynqmp-power.yaml        |  9 +--
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |  2 +-
 9 files changed, 15 insertions(+), 84 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mailbox/mailbox.txt

diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
index 3c44fe607e12..acdc5c1d3d8b 100644
--- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
+++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
@@ -18,11 +18,9 @@ description: |
   which can create the interprocessor communication (IPC) between the
   CPU and BPMP.
 
-  This node is a mailbox consumer. See the following files for details
-  of the mailbox subsystem, and the specifiers implemented by the
-  relevant provider(s):
+  This node is a mailbox consumer. See the following file for details
+  of the mailbox specifiers implemented by the relevant provider(s):
 
-    - .../mailbox/mailbox.txt
     - .../mailbox/nvidia,tegra186-hsp.yaml
 
   This node is a clock, power domain, and reset provider. See the
diff --git a/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml b/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml
index 87d31963c1b7..f58b0d412186 100644
--- a/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml
@@ -17,9 +17,6 @@ description: |
   hold four 32-bit messages; when a FIFO is full, clients must wait before
   attempting more transmissions.
 
-  Refer to ./mailbox.txt for generic information about mailbox device-tree
-  bindings.
-
 properties:
   compatible:
     oneOf:
diff --git a/Documentation/devicetree/bindings/mailbox/altera-mailbox.txt b/Documentation/devicetree/bindings/mailbox/altera-mailbox.txt
index c4dd93f1fed2..87749d251f09 100644
--- a/Documentation/devicetree/bindings/mailbox/altera-mailbox.txt
+++ b/Documentation/devicetree/bindings/mailbox/altera-mailbox.txt
@@ -31,12 +31,12 @@ Example:
 
 Mailbox client
 ===============
-"mboxes" and the optional "mbox-names" (please see
-Documentation/devicetree/bindings/mailbox/mailbox.txt for details). Each value
-of the mboxes property should contain a phandle to the mailbox controller
-device node and second argument is the channel index. It must be 0 (hardware
-support only one channel).The equivalent "mbox-names" property value can be
-used to give a name to the communication channel to be used by the client user.
+The common mailbox binding properties "mboxes" and the optional "mbox-names"
+can be used. Each value of the mboxes property should contain a phandle to
+the mailbox controller device node and second argument is the channel index.
+It must be 0 (hardware support only one channel). The equivalent "mbox-names"
+property value can be used to give a name to the communication channel to be
+used by the client user.
 
 Example:
 	mclient0: mclient0@400 {
diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt b/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt
index 3e5b4537407d..ec2da5c9e647 100644
--- a/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt
+++ b/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt
@@ -35,7 +35,7 @@ Client
 
 Required properties:
 - compatible		: See the client docs
-- mboxes		: Standard property to specify a Mailbox (See ./mailbox.txt)
+- mboxes		: Standard property to specify a Mailbox
 			  Cells must match 'mbox-cells' (See Controller docs above)
 
 Optional properties
diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt b/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
index 044b17f3a77a..de9fbf722bee 100644
--- a/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
+++ b/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
@@ -55,7 +55,7 @@ Mailbox client
 Required properties:
 --------------------
 - compatible:		Many (See the client docs).
-- mboxes:		Standard property to specify a Mailbox (See ./mailbox.txt)
+- mboxes:		Standard property to specify a Mailbox
 			Cells must match 'mbox-cells' (See Mailbox Device Node above).
 
 Optional Properties:
diff --git a/Documentation/devicetree/bindings/mailbox/mailbox.txt b/Documentation/devicetree/bindings/mailbox/mailbox.txt
deleted file mode 100644
index af8ecee2ac68..000000000000
--- a/Documentation/devicetree/bindings/mailbox/mailbox.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-* Generic Mailbox Controller and client driver bindings
-
-Generic binding to provide a way for Mailbox controller drivers to
-assign appropriate mailbox channel to client drivers.
-
-* Mailbox Controller
-
-Required property:
-- #mbox-cells: Must be at least 1. Number of cells in a mailbox
-		specifier.
-
-Example:
-	mailbox: mailbox {
-		...
-		#mbox-cells = <1>;
-	};
-
-
-* Mailbox Client
-
-Required property:
-- mboxes: List of phandle and mailbox channel specifiers.
-
-Optional property:
-- mbox-names: List of identifier strings for each mailbox channel.
-- shmem : List of phandle pointing to the shared memory(SHM) area between the
-	  users of these mailboxes for IPC, one for each mailbox. This shared
-	  memory can be part of any memory reserved for the purpose of this
-	  communication between the mailbox client and the remote.
-
-
-Example:
-	pwr_cntrl: power {
-		...
-		mbox-names = "pwr-ctrl", "rpc";
-		mboxes = <&mailbox 0 &mailbox 1>;
-	};
-
-Example with shared memory(shmem):
-
-	sram: sram@50000000 {
-		compatible = "mmio-sram";
-		reg = <0x50000000 0x10000>;
-
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0x50000000 0x10000>;
-
-		cl_shmem: shmem@0 {
-			compatible = "client-shmem";
-			reg = <0x0 0x200>;
-		};
-	};
-
-	client@2e000000 {
-		...
-		mboxes = <&mailbox 0>;
-		shmem = <&cl_shmem>;
-		..
-	};
diff --git a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
index 8504ceb64806..7e3b7b68841c 100644
--- a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
@@ -53,8 +53,7 @@ description: |
   ==============
   A device needing to communicate with a target processor device should specify
   them using the common mailbox binding properties, "mboxes" and the optional
-  "mbox-names" (please see Documentation/devicetree/bindings/mailbox/mailbox.txt
-  for details). Each value of the mboxes property should contain a phandle to
+  "mbox-names". Each value of the mboxes property should contain a phandle to
   the mailbox controller device node and an args specifier that will be the
   phandle to the intended sub-mailbox child node to be used for communication.
   The equivalent "mbox-names" property value can be used to give a name to the
diff --git a/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml b/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml
index 079ad977b907..60f0882f5381 100644
--- a/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml
+++ b/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml
@@ -27,12 +27,9 @@ properties:
       mailbox controller device node and an args specifier
       that will be the phandle to the intended sub-mailbox
       child node to be used for communication. See
-      Documentation/devicetree/bindings/mailbox/mailbox.txt
-      for more details about the generic mailbox controller
-      and client driver bindings. Also see
-      Documentation/devicetree/bindings/mailbox/ \
-      xlnx,zynqmp-ipi-mailbox.txt for typical controller that
-      is used to communicate with this System controllers.
+      Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
+      for typical controller that is used to communicate with
+      this System controllers.
     items:
       - description: tx channel
       - description: rx channel
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 8eaa04431d74..e238f100f8ff 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -69,7 +69,7 @@ properties:
     maxItems: 1
     description:
       Reference to the mailbox representing the outgoing doorbell in APCS for
-      this client, as described in mailbox/mailbox.txt
+      this client.
 
   "#clock-cells":
     const: 0
-- 
2.55.0.691.gc56d675ccc-goog


