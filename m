Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD99C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 22:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iLHxmEFEAAhUWHFz+6vyD9YF+Shz/3zBH9jPJj0HIOA=; b=GOJThKbiPYaHPAQ11GJYE3QHAJ
	yzy1aYSfon5lonJpiSt8GoQGVESYH/7Eh8oCtjDBGVCENStVIcSAkYNlxbPpG8bEPvZQQ5ruPCsPp
	TSP642PGOFET3tZ9xKeCUu0JRT1npYvXddqHJf0D1OH1LF2ATqhwS2Zx3UwWjrAuGsm4CAiDl9kGB
	bzUpDgD9iPmZaceNj1t4iRnAJ2u/q3Gnt6qshgr2EuKA9Ecld6PM1jN4f98puVBdqT9dehEutpmcX
	jv5tEAJF40PWJpoU9MMikCBdGDsH/F0f6sfDu6XBf6XpPFRlPcJaSotVxr7fcXGgvcdq67AF2gAjd
	LuJtVzzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjlYa-0000000DOnr-04iM;
	Tue, 14 Jul 2026 22:24:52 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjlYX-0000000DOmy-10Uy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 22:24:50 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38101f85591so39738a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 15:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784067888; x=1784672688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iLHxmEFEAAhUWHFz+6vyD9YF+Shz/3zBH9jPJj0HIOA=;
        b=Oh5Wcwvdd7Qf8WelfFy+tpXRxhg3UGF1SqxDFw2qKR8qcQT6besWo0DZYmlz1toMUj
         G41pYuW4vqL7PQasRSds2oQyXfifE80MwFDorLV+EOKH1w9XMf5B/b2aFYXcs7ReMeCN
         LGCg+FyPGvuM9Qpc4BbzDzIaXgGPznWKzPymA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784067888; x=1784672688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iLHxmEFEAAhUWHFz+6vyD9YF+Shz/3zBH9jPJj0HIOA=;
        b=RGIFdgPnHTMhiHdJ9JKFdt5j2ReTOsFAb48wIflTCN6flYm4LNgGzTi5U+4lgXdrK8
         lzT7kfIPO1ibPfZX5RnvfU6APF44nGJG6K6DbE26SGitB6h+vVdZ8sPk5W/VkVsJy/rz
         7ZWI8yhQfe0SPuTxFx3t/z8lszTuZskYUrvr72GIL7NYTUq8ibneFjDRuAn13Rpo8UN0
         vdEBfRzDyMcmPXCFsBxL+hxn6/KvNpCfZ4v5m3xaCqQrs59dNUQgjQ9sk5v4fcNShR++
         FxIBDPH3h6cjBGFWKC2kkueoHOSPXpcPeldwJmd0Z+uS1admVltI8eqwPpNNqmcr1UNo
         PaUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGUZRpeidvS1akgqhphB+GngS2i17JxPviZcsCHcWLFGYryZkeIDcEb9gSbgPuL0K0LOx6U2DcutCB+s12sjFx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/F0H8HAuSVzdxQLGaGwTEgV1RQQkPL51cfLlVeLvBIaHBNN7d
	XxEKCPAPjRXxeqeOEAIhxxdo3FEkLTBpKhbGMp/XlGwVp9zRYeTQK6KiO7co4pQpwg==
X-Gm-Gg: AfdE7cn684UkdINho8NfflrGZqChaGx6zTKGRaPOxbR064bWSH/Nz0AmEjCTQYsyTu2
	/QlKJQNkKYEhYriOyvJejCK73arDKOj1YqiDSHmxmPhvW7m6RbzqiBB67bu3nFHB0+wAFH92x8d
	6y8DbkH7p5sP9oecB0F1xgFE4EhXmaLcGKaRnafnnqy1YUaZfIZHXNpn17qkmJdkE6w22KLdt7s
	s4qX32KNX2n2/8r8CogdQYcRbVTs58NkmxZF1Lbsk0XA0J1n5d5j/ZS1G8bkCJ/4yg0ees2nuBQ
	fIJ6kFyukwuHoIL/lt0uylEyT8VZGZj8KFcEVoyjd9kctwoPzYt5EOU6PlJIub2yE7aOryPEtPn
	6srsgY5qOGE8PMm+mreopA4QWvohPurVQwl38+7TWKjR7JyBp2K2iJa+ytYkw0reDl+8SOYwNGF
	KF5jZPoli8Uswy5YPjwvFoA4JtD6yRgeOmiIh8vFJCRfe4hyXj63bqBgNYiJ2kRfQXUfrYIQ==
X-Received: by 2002:a17:90b:2401:b0:38d:9eda:fa04 with SMTP id 98e67ed59e1d1-38d9edafc8emr12968752a91.2.1784067888503;
        Tue, 14 Jul 2026 15:24:48 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:32cb:eed4:7c:dc87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm76540741eec.9.2026.07.14.15.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:24:47 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>,
	Subhash Jadavani <sjadavani@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Lucas Wei <lucaswei@google.com>,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
Date: Tue, 14 Jul 2026 15:21:45 -0700
Message-ID: <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260714222338.2965707-1-dianders@chromium.org>
References: <20260714222338.2965707-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_152449_354380_C9D39431 
X-CRM114-Status: GOOD (  32.92  )
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

Introduce bindings for the MailBox Array IP block present in Laguna
SoCs (AKA "lga", AKA "Google Tensor G5").

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../bindings/mailbox/google,mba.yaml          | 216 ++++++++++++++++++
 1 file changed, 216 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/google,mba.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/google,mba.yaml b/Documentation/devicetree/bindings/mailbox/google,mba.yaml
new file mode 100644
index 000000000000..6c4505a369e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/google,mba.yaml
@@ -0,0 +1,216 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 Google LLC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/google,mba.yaml#
+$schema: http://devicetree.org/meta-schemas/base.yaml#
+
+title: Google MailBox Array
+
+maintainers:
+  - Douglas Anderson <dianders@chromium.org>
+
+description: |
+  The Google MailBox Array (MBA) is an IP block in Google-designed SoCs
+  starting in Laguna (AKA "lga", AKA Google Tensor G5). In a typical SoC
+  that includes this IP block, there are a number of instances of the MBA
+  controller with each instance having slightly different hardware
+  parameters and intended for communication with a different remote
+  processor.
+
+  An MBA instance has a "host" that is defined as the processor "providing"
+  a "service". This is typically not the main Application Processor (AP) but
+  is instead some specialized co-processor in the SoC like the Central Power
+  Manager (CPM). A processor (like the AP) talking to the "host" of the MBA
+  is a "client" of the MBA. A given MBA instance only ever has one host, but
+  it may have several clients. For instance, the CPM (an MBA "host") may need
+  to send/receive mailbox messages not just from the AP but from other
+  processors in the SoC and each of these other processors can be "clients"
+  of the same MBA.
+
+  The "host" of an MBA instance has full access to everything in the MBA
+  instance. It can access its own private set of "host" MBA registers, the
+  "global" MBA registers (if they exist), and all of the "client" MBA
+  registers.
+
+  A "client" of an MBA instance has access to the "global" MBA registers (if
+  they exist) and one or more sets of "client" MBA registers.
+
+  These bindings are focused on describing the MBA from the point of view of
+  a single client.
+
+  As per above, a client may have access to several sets of MBA "client"
+  registers. Each set of "client" registers represents a logical mailbox
+  "channel". However, because each channel may have different configuration
+  parameters and a mailbox "channel" in typical usage means one of a number
+  of identical channels, each channel in a Google MailBox Array is typically
+  referred to as a full "mailbox" and the whole collection of mailboxes as
+  the "mailbox array".
+
+  Mailboxes in an MBA instance have these features:
+  * 1 to 256 32-bit words of shared memory.
+  * The ability for the client to ring the main doorbell of the host and be
+    notified when the host Acks the doorbell.
+  * The ability for the host to ring the main doorbell of the client and be
+    notified when the client Acks the doorbell.
+
+  Some mailboxes may also have the ability to have counted doorbells. This
+  means that the receiver of the doorbell can tell how many times it rung.
+  This is intended for implementing "queued" mailboxes. See below.
+
+  The MBA hardware doesn't have any specific directionality. That is to
+  say, both the host and the client have full read and write access to
+  their shared memory. All mailbox instances have doorbells going both from
+  the client to the host as well as the host to the client.
+
+  The mailboxes can only be used for communication if the host and client
+  both agree on conventions. These conventions are described in the
+  device tree as they describe how the remote firmware is expecting to
+  communicate.
+
+  Current known in-use conventions:
+  1. An RX mailbox with payloads that are of a well-defined size.
+     On mailboxes of this type, the host is the only one to write shared
+     memory. After placing a fixed-size message in shared memory, it rings
+     the main doorbell of the client. The client reads the message and Acks
+     the doorbell.
+  2. A TX mailbox with payloads that could vary in size.
+     On mailboxes of this type, the mailbox client is the only one to write
+     shared memory. The client always writes a payload to the start of shared
+     memory and rings the main host doorbell. The client then looks for the
+     host to Ack the doorbell. The clients of the mailbox have ways to know
+     the size of any given message.
+  3. A half-duplex TX/RX mailbox. This is a mailbox that can switch between
+     convention #1 and #2 above. Since both sides write data to the start of
+     shared memory, the two sides must have some convention to know whose
+     turn it is to send a message.
+  4. A "queued" RX mailbox with a payload of a well-defined size.
+     This type of mailbox is only possible if the MBA instance can count
+     doorbells. On mailboxes of this type, the host is the only one to write
+     shared memory. When the client doorbell rings, the client reads a
+     fixed-size from the next "slot" in shared memory and then updates its
+     internal state. The shared memory is treated as a circular queue.
+  5. A "queued" TX mailbox with a payload of a well-defined size.
+     This type of mailbox is only possible if the MBA instance can count
+     doorbells. On mailboxes of this type, the mailbox client is the only one
+     to write shared memory. The shared memory is treated as a circular queue.
+     The client writes a fixed-sized payload to the next "slot" in the shared
+     memory (where the slot size is determined by the client's first transfer),
+     updates its internal state, and rings the host doorbell. The client can
+     keep writing more messages as long as the circular queue isn't full. The
+     client gets an interrupt when the host Acks a doorbell and can tell how
+     many doorbells still haven't been Acked.
+
+  Conventions will be supported with a small number of properties specified
+  for each mailbox.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - google,lga-mailbox-array
+      - const: google,mailbox-array
+
+  reg:
+    minItems: 1
+    items:
+      - description: Host registers (not accessible to client)
+      - description: Global registers (not present on newer IP blocks)
+
+  ranges: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^mailbox@[0-9a-f]+$":
+    type: object
+    description:
+      Each sub-node is a single-channel mailbox.
+
+    properties:
+      reg:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+      "#mbox-cells":
+        const: 0
+
+      google,rx-payload-words:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maximum: 256
+        default: 0
+        description:
+          The number of 32-bit words in each mailbox message from the remote
+          processor. May be 0 for doorbell-only. If not specified this is
+          assumed to be 0.
+
+      google,mba-queue-mode:
+        type: boolean
+        description:
+          The remote processor is expecting the shared memory to be treated
+          as a circular queue and that there may be several outstanding
+          messages at once. Only usable on instances with counted doorbell
+          interrupts.
+
+    required:
+      - reg
+      - interrupts
+      - "#mbox-cells"
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - ranges
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      cpm_ap_ns_mba: mailbox-array@5240000 {
+        compatible = "google,lga-mailbox-array", "google,mailbox-array";
+        reg = <0x0 0x05240000 0x0 0x00010000>,
+              <0x0 0x05250000 0x0 0x00010000>;
+        ranges = <0x0 0x0 0x05260000 0x00020000>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        cpm_ap_ns_req_mba_client_0: mailbox@0 {
+          reg = <0x0000 0x1000>;
+          interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH 0>;
+
+          #mbox-cells = <0>;
+
+          google,mba-queue-mode;
+        };
+
+        cpm_ap_ns_resp_mba_client_1: mailbox@1000 {
+          reg = <0x1000 0x1000>;
+          interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
+
+          #mbox-cells = <0>;
+
+          google,rx-payload-words = <4>;
+          google,mba-queue-mode;
+        };
+      };
+    };
+
+...
-- 
2.55.0.141.g00534a21ce-goog


