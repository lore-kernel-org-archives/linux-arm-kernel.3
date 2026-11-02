Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50198606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XDBvlpRr;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ovKE9H5/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L8S/WNv20+oRCfncRZ/tZDNWMqkqP07ca+Q4m2HbqFQ=; b=XDBvlpRrg+/jaMrqvtVUMtcQ8H
	eAj0cBi89Gp++MV9yVaXDWCjJgcudzP7tgZvJE/tDC883BTfmj8PT8VjmgUXiksbP1+V5hE0aVrog
	u9VThY/4scCPnPhqJ9b0tuctz0nmRzaqVguGXlo0xYmLRNvukGGxnaY9Tw3YA4zkVnin8cwN+Ht1L
	/CGwvhSa9bDCpgUKuN4BkUWkn706LBpNY+119jhTUriTaFMNyTawLIwbwZyeFozNpkyKRBNe7FJh+
	F5T68L0aSs9Wrg6oTPlsfNIal7qXAdmih08sxkKZeW9va9t9qbtKoJ1mntGRVmUugouNWcle3ej+L
	sO2YdQMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxxx-000000008RC-2g36;
	Mon, 02 Nov 2026 19:45:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxxv-000000008Oc-1GtR;
	Mon, 02 Nov 2026 19:45:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD5C5444CD;
	Mon,  2 Nov 2026 19:45:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793648710;
	b=RoE7yxmdxNU2D0/5MptQ2cFt6gW2ZISN+3CFN/iYZcmuHl6T8lfpEwvnX99Pq2fiE8kF
	 cmKaFbK6wUm6t/80DZWXlJwgPR+5JBFk3pNYSzTkWcAf5htenkNIKe3DVuM/+mOpOZKYM
	 gODm3X6t2jwmImdlAqRPfM8BtLHkYZdTw0i8LP9o8/CioVolbKeZmqyQvZhyQchjulg75
	 15W1BeG6c0jnTGWrxBUgO8YA7wseyA8JG6vG8ji0vIionyt2cQ8EI4A3MbHpGeaZuKsnc
	 eTFbnAEKgYECc8/Wev8EDdn4gYKOmqcTYW9VgCOL49WKEo+TyoyqtOyXxkb7jejeZ3g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793648710;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=L8S/WNv20+oRCfncRZ/tZDNWMqkqP07ca+Q4m2HbqFQ=;
	b=qAS8v+RHTip523kr7tOVlOGSmtbtKsYvIqjKWq/IiwzAY10Ugy0PpFgwAMLpRrKaXYTb
	 KIN4avjqDLoJPLcZPBafRXUpvBorXBibzy19AfojdVM0aiZ6vcfVDPTFmZd3hu1Zw1KSp
	 eW9T42P1LZSDqBaeJjL3t+jaXZVj9vozvMDIqJM9/wq0KZLuQOy4aPA191akCkwWWjRrX
	 5lWSQye02qYvzruJJXXRy18YW9ZlgG5GPilMMtFA2I9sfk4EkRuCLMeueU46f+UkkiK1n
	 qs/2SymlFVlzEv7ffLbgnV8QfmciH5TQ+E8vYtD6aFYSq6Q8DHmW1mDnhCWg/3Dq9vg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 653401F00A21;
	Mon,  2 Nov 2026 19:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793648710;
	bh=L8S/WNv20+oRCfncRZ/tZDNWMqkqP07ca+Q4m2HbqFQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ovKE9H5/8bRH+IwqzRkqrTNc32Aig9302FYiLFKN7IGc1HjdgbPSY1yfRJV3W1SXH
	 UJMRj5sNEqCWquASKLbdrTud4ueQ03fSeOLRI0mc7qDuJ0sRAJVSXm5R1X1jzoWVEU
	 juVRt4KtNGq/cca4HI0BwUt8Trok6irOg4n4MidJz8i+eSUAmPxSflKXgJ26nhSkU8
	 rHR0qsX0AUe+3MS65E7Qc3skAvwPUUhzHXNPZ8QVn8oDHbohmY5jz9n+V3Hwjj3954
	 4WGTpswgrkx7pcRiNJf3HrSfuorkgrYgCjgS7eBhOed3a2733BL/cLrqfJeIgSPN7+
	 gfC9XYNu+Rv3g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DFE3546612;
	Mon,  2 Nov 2026 19:45:08 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Tue, 03 Nov 2026 03:45:07 +0800
Subject: [PATCH RFC v3 04/17] dt-bindings: mailbox: add Zhihe A210 AP to
 E902 mailbox
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-a210-scmi-v3-4-ee6b31580808@iscas.ac.cn>
References: <20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn>
In-Reply-To: <20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Icenowy Zheng <uwu@icenowy.me>, Inochi Amaoto <inochiama@gmail.com>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, linux-clk@vger.kernel.org, 
 linux-serial@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793648705; l=3069;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=1bSlRTbJH+ic/kKX/KZWwqkpU0t/w8ZHzrQrtqPAxps=;
 b=Mbtcx9ULN3M5M1BOVXKIfPa7Ysmpnzr8bxJu9gjIiuQ1do9EqmOCy8wBUewlfmylGO/UUQaq/
 l54pph/+wc9CjpX/G9HOZ8YL/V3ckKuglIBcUS/6Ezcani0vj4mFo1y
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

The Zhihe A210 has an E902 management core next to its application
processors. Each side owns a mailbox block and rings the other side by
writing to its slice of the other side's mailbox.

The application processors ring E902 through their slice of the E902
mailbox. E902 rings back through the application processor mailbox and
writes INFO0 or INFO1 there to say which of its two doorbells it rang.
The doorbells carry no data, and clients such as SCMI keep their
messages in shared memory.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 .../bindings/mailbox/zhihe,a210-ap-mailbox.yaml    | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/zhihe,a210-ap-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/zhihe,a210-ap-mailbox.yaml
new file mode 100644
index 000000000000..7d7ab1c550a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/zhihe,a210-ap-mailbox.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/zhihe,a210-ap-mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zhihe A210 application processor to E902 mailbox
+
+maintainers:
+  - Han Gao <gaohan@iscas.ac.cn>
+
+description: |
+  The A210 application processors and the E902 always-on core each own a
+  mailbox. A core raises an interrupt on the other side by writing the
+  generate register of the other core's mailbox, and can leave a value in one
+  of the INFO registers there to identify the request. The application
+  processor side therefore needs its own mailbox, which holds the INFO
+  registers written by E902 and the interrupt status, clear and mask
+  registers, and the slice of the E902 mailbox assigned to it.
+
+  The E902 firmware keeps both mailboxes clocked and out of reset. Their
+  clocks and resets are not controlled from the application processors.
+
+properties:
+  compatible:
+    const: zhihe,a210-ap-mailbox
+
+  reg:
+    items:
+      - description: Application processor mailbox
+      - description: Application processor slice of the E902 mailbox
+
+  reg-names:
+    items:
+      - const: local
+      - const: remote
+
+  interrupts:
+    maxItems: 1
+
+  '#mbox-cells':
+    const: 1
+    description:
+      Doorbell index, 0 or 1. E902 writes INFO0 or INFO1 of the application
+      processor mailbox to tell which doorbell it rings. Only doorbell 0 can
+      also be rung by the application processor.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - '#mbox-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mailbox@320000 {
+        compatible = "zhihe,a210-ap-mailbox";
+        reg = <0x320000 0x2000>, <0x311000 0x1000>;
+        reg-names = "local", "remote";
+        interrupts = <336 IRQ_TYPE_LEVEL_HIGH>;
+        #mbox-cells = <1>;
+    };

-- 
2.55.0



