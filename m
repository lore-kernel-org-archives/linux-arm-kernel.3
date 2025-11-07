Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3C7CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jn/Od/4YICRZnXAyEJg+dgWKk8kIueyrVLZ2I+p4YAM=; b=FeYKAUC+oy6SQT4OTKKTp3ii/O
	gMFEARCWy9LqO4O3yMAaiPyqaGzjPvQyToUbUCrlBFWnmXrjlZUSZDw54O6I9FpydeqqH0phqJ496
	8J0AUaQYiHBkxsIv3mXlWzDORfROxTKhAyWqlUdpCmrd1fIXXxhjKOCQJ3R4nr2hdCwcziL7uvPBJ
	grHTKBoFd4faj2J8VlDrIjgbcyR2es4KGXIi4ea9ubdWr72+d9u+tGTBtZkFet1180QsPY/jra354
	9Zd9XmKb/MpLVvUYaJE2mn/z7qGN0/454AgM/Xs5Al3aKbW/Pv7CSNPWzkrsMcTlrpATF7QEwit2V
	JFvYlxrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOvq-00000000362-0aSb;
	Fri, 07 Nov 2025 16:03:22 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOvn-0000000032i-0k5Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 16:03:20 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so649907f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 08:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762531397; x=1763136197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jn/Od/4YICRZnXAyEJg+dgWKk8kIueyrVLZ2I+p4YAM=;
        b=SXenQJy/o3b3/qaCn2bgRs6ONDxGcIvBKjPa/eE86N7Y44Iw3R569x9UVhmutQm5fh
         K/4yI6kzUBovn9jU3AQJOhLxAWAjh+Wb2erbzvgYEBrwxIqE/7aUJ9wQEre9wP4/Zft1
         g93l0rsD92921vESPe8i/mVyHYqJeiQvE5H4G4mUo8CuCwbI09QXUeH3rcYKt6vtWmZS
         zArRothlwzvvsPw2WLVjrSGL0L9095A+5KVlGD5gD8YxLVTG73AgX1YpLwwp8sTP/I15
         8Q8J2wDXbbPEV+8rap3YzqLSjcKBgkL5Czfdp1jx//6x2H7GeVhdY/sgdsUicgqUP74O
         1Rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762531397; x=1763136197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jn/Od/4YICRZnXAyEJg+dgWKk8kIueyrVLZ2I+p4YAM=;
        b=OFTkOc0HZ6u7Y9IUUjzTX5DJP0SEHmhUXfp9GgFhdqCxfRy85TteibeghFZU25ov0B
         1SVTIeUnP6951PJhEIEq/ChD/8ZGCLi2xEXx/RjS4fXTeJdNriLExnih27PZK5ipreZK
         wFLu0lNfvWRG8+SlUOx04j6xcEvNVQXf8e0LcXlxsi1O+dAnpZQf8regOykEMrAvsQd6
         FFXil7+eCg9FfwgEvNLeq2LxnSr21ojsLUOc6cfWwFSTooq4l1dnpan5MjmB4yJ6pe4w
         jLLj0o8v3KdTqE1Bc7sywKZAKnQ4tytMzPNCu1Xc4wOqf972c/1mq5CddutRcvFJD6ik
         EKDA==
X-Forwarded-Encrypted: i=1; AJvYcCW793gEylH3HBmZRgaPwgjhNdX5yPrT8zhr/JvtYiahCpZbHGjYsyIErGf/QRXQ/OJQf8gPVQkYCuuxWyDgSUbA@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4Lr72q0XKPHGoUuTUWydeo76sCcH9kzMbUnQv3ieLQfBdrlPA
	cz75GnWU1fYhtmNmB32zBDE0OUoKITKwk4hff+4W17uhoDF8HDQZnpV5
X-Gm-Gg: ASbGncvRkmxoNpTO05J1ZSBLngX1GIpf79P75daOVNXQ8mABo3XF5vZsJXerZWGxURN
	K22zy1Lx51L4XApAVBiTqQvrVo5Dmp3mcxjZthaZfNZSMy6T+dbFF89g1E1qsLoe5wLM5+tNply
	XrsTrpugmrnMWH7+Pzff3D/BKJ64gtVV2MuhtKFLQrRXjPw6HVM9vor3PMwbo2Y7IyDGdCMFe0F
	MLuVZYfdcFp+v7R20R124ymQ5Dw4fQIzZUuXGoBMJZn7PJvhP+e35hov7I7LqB/BLVD3nTY7eOA
	59gUN/HMxTOGYR/KoZjNEvlPRJyz8XfvCO+xhqpGGbaeTZW2TMQSA9Op9LmBzphS4GTKjNu19DS
	W7U5gtBfwPjXDvKC7uqUaAfJLH9W+nwtrZ8stw0qpU6gRYAwZ2/mWP4CeCUnVZX8h0XgzHNeoUF
	pYn2BzBwlXNnIFOK/HcY+mSUQN0yowIw==
X-Google-Smtp-Source: AGHT+IFlyBZfNRMNXVV5qUwRTFWSjWoXooTbJycgw3IhWharvD9aJ29E4znbDQrJZiQenU37vZU4XQ==
X-Received: by 2002:a5d:5f94:0:b0:428:1475:6a26 with SMTP id ffacd0b85a97d-42ae5af41cemr3864192f8f.56.1762531396986;
        Fri, 07 Nov 2025 08:03:16 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42abe63e13csm6058016f8f.19.2025.11.07.08.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:03:16 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] dt-bindings: soc: Add bindings for Airoha SCU Serdes lines
Date: Fri,  7 Nov 2025 17:02:43 +0100
Message-ID: <20251107160251.2307088-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251107160251.2307088-1-ansuelsmth@gmail.com>
References: <20251107160251.2307088-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_080319_231678_BDCFDD63 
X-CRM114-Status: GOOD (  13.19  )
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


