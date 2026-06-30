Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55421C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 21:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kfP/+/XzENqIHs8vBadMsBN8LHk8zW+7QrwYcaSOfQs=; b=lPxlmUGlU/N59HRZYS9wEdwogs
	tsQqXbE6zoHgyM3jmzWovYdGOXRvp12qQ/yYoIZ+cTfgXcII/HSA7R8htWW1A+ZklS+yTgI47C8h6
	1V+bdrumoOSoXH47QpVYHjDWnE47m+TOrdHRL/kyiiL9MDaijJWfDbCKK618tquargmEtrL5BXkxk
	HW53Ag2LAAQrxK673YJJRC7jTMs1OiI1ocoMf2WdoPCpihnn1SQavSUrJmH2nlcndnAV1TbDnQfFB
	KiVCA9zZAlMTWmjlzI1xqT3B5D//D4q7PsbTv5D96dzxIRfAc2UjrIUoPehfLvsWB4CbBPvRe6fDu
	0mq6k8SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegCM-00000000GJV-2mXM;
	Tue, 30 Jun 2026 21:40:54 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegCK-00000000GIb-18Or
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 21:40:53 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-92e53230b82so223035385a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 14:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782855651; x=1783460451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kfP/+/XzENqIHs8vBadMsBN8LHk8zW+7QrwYcaSOfQs=;
        b=k3z7UVjbyIiBpu1oUyWmPUwkvj4/rg0Y96L1rELN9AoCEW5W2kXTgEVOdynXAzxQME
         jUbVGXsQ1edupW6t4NIL/N81qM3akcbLx1Azwib6ltX2qfyfgqNKcehScGnIv4UhSJDy
         Qk+LbZ3bEHDphzlPJGQtpF7UJZee2wOBvj6Nw0gDVoVOFRYuJE6oZWuD5I691JTHybgz
         9GE5TP3VUiOp1Lk8g6YMrbv0rVcnfaZIzjp8FoowDk2v5pQlkPn7Cz1fT2AjFbLfrNgH
         2FJqjQF8Aa9GnP91159N3nD391ZI5nIDG2R+hQfYGs90jDqHkqueT6GYlzwG5W5t+cec
         iDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782855651; x=1783460451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfP/+/XzENqIHs8vBadMsBN8LHk8zW+7QrwYcaSOfQs=;
        b=Af0kZH4A7e8hrnri+pNBdGjTJaI73pw8H0dRhwNWvX+yGFG2GKBXtdwbyVYhDmTgcf
         YGy+eQ59wOFS43FeVLMhFRABfN2iIH1Z8aSztKnAUHCerOqwtpYlJI7vAQSF21X6WyHD
         MAJ/JtPRjlr/u/0RD+KywE1ZZfA+QUBN5xJ+Bbo2vON/ccehVhbQ1cMqGTaOmSUiudyx
         +noZJBh2o/h9DnGyKsY18FxZXfboRqKMJ2RnlgPVBmloY01Wh3OPxf2PgLnttAxHpl+A
         qnaexiN7ByyVPIyazKuRfCjS+INIeJsESaEVtY6jds2xkILwSe1gZQFYrN3iyP4QW2qq
         3bDw==
X-Gm-Message-State: AOJu0YzICjyKkfq+tZQptszKn68ZzSAaTJmL3o4quReXH9U3ayhrb1q7
	59RtYUkFNYM1ls/b2tSqr7K7xQA90K8y8G0+fUaLFxAEhwvB0mtWIvur
X-Gm-Gg: AfdE7cmFM+0FWDY5rTe3C5CIUoXry0/c0iFlajzIAXD0e/BB/WT9uBEK379jfcuQlZV
	3p1qHjfsO8C++ePI2p7LBHqCH/hZSA91RDNF2oYtuNU63a3Oz1KqV7AHqRJVJJMoGK/+AAOV1BQ
	fRTRTSFXvS4MHMEkCnNs+GfVvw6ZNMM1My31WoQ0GoIAiK1RXj7iwnBEXB+7nZOtkv/cH8mWeJA
	WVRBcq6Nv6H66zUlO/yxhPVSD35OaObLKPfkNeMpJXMz1BUPjPUjz4EsU6TVneKbgdBTgMl/c1a
	ZoRgLfLWdrd25FHysEFOOp5EvtaHCfJY9/ABP5eZLQGd9caTgAK1sHlOVf+Pj8N+QHpgma1uvEB
	pmjQGErHlP7tS3AsrmT9eYMxbvEvh87sQZmm1OtzwQtWxtqAfFke1FqgeyHIvmf4KR7Sqxw47D9
	RwMvZN1uCTgwPXqGzKk3smrIwNJP7qdf6QEf8OCnju
X-Received: by 2002:a05:620a:1a01:b0:921:83c6:f948 with SMTP id af79cd13be357-92e6249fe05mr848255185a.6.1782855650630;
        Tue, 30 Jun 2026 14:40:50 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e6213bc35sm341819685a.1.2026.06.30.14.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:40:50 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] serial: ma35d1: Fix OF node reference leaks in console init
Date: Tue, 30 Jun 2026 17:40:43 -0400
Message-ID: <20260630214043.1887351-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_144052_391704_8661D49D 
X-CRM114-Status: GOOD (  13.62  )
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

ma35d1serial_console_init_port() stores matching UART device nodes in
ma35d1serial_uart_nodes[] with an extra of_node_get() so that console
setup can later read the "reg" property.  However, the stored references
are never released after console setup has finished using them.

Drop the stored node reference after ma35d1serial_console_setup() reads
the "reg" property, and clear the array slot to avoid leaving a stale
pointer behind.  Also release the iterator reference before breaking out
of for_each_matching_node(), since the normal iterator advance will not
run in that path.

Fixes: 930cbf92db01 ("tty: serial: Add Nuvoton ma35d1 serial driver support")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/tty/serial/ma35d1_serial.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
index 285b0fe41a86..920fe7ff5083 100644
--- a/drivers/tty/serial/ma35d1_serial.c
+++ b/drivers/tty/serial/ma35d1_serial.c
@@ -608,8 +608,14 @@ static int __init ma35d1serial_console_setup(struct console *co, char *options)
 	if (!np || !p)
 		return -ENODEV;
 
-	if (of_property_read_u32_array(np, "reg", val32, ARRAY_SIZE(val32)) != 0)
+	if (of_property_read_u32_array(np, "reg", val32, ARRAY_SIZE(val32)) != 0) {
+		of_node_put(np);
+		ma35d1serial_uart_nodes[co->index] = NULL;
 		return -EINVAL;
+	}
+
+	of_node_put(np);
+	ma35d1serial_uart_nodes[co->index] = NULL;
 
 	p->port.iobase = val32[1];
 	p->port.membase = ioremap(p->port.iobase, MA35_UART_REG_SIZE);
@@ -648,8 +654,10 @@ static void ma35d1serial_console_init_port(void)
 			of_node_get(np);
 			ma35d1serial_uart_nodes[i] = np;
 			i++;
-			if (i == MA35_UART_NR)
+			if (i == MA35_UART_NR) {
+				of_node_put(np);
 				break;
+			}
 		}
 	}
 }
-- 
2.43.0


