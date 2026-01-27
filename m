Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3F2D2FEDE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 19:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BOcMCCe4WBFvFzXAB+tiWNFCRlcVsrdBoIuT6Wq0ec=; b=0fe0jUE3dc5+fubOCis9oUVs4h
	dGCXFgpblnZabDU3nroHnBIuhcrWF+F8J33T94Jf6MF+pI/3FSU5OV+ounDc6R/uXdIt0SpOkzqUA
	UfJtZtjrVfEb4UQDjgA/ZWwUNJSLIT+MVVNQvgvBP/PO0h4r+UxQWIEHbzn7TcJTs48LuzbLbh7CB
	+FydWe0Mpi7HB6JtdLAiywekwbvSr+PVAelIvSqr7TwQbUY0QTeH1Zd5g3N9ZtVlhPIpw8Me2f9SV
	L3xAtj+ICKAva6v5nG3OC2xMzq/8uEV5lVeVfVKlmuHR19neKiJfMCJgXy7obS2iOQqT0/1K6vdhM
	A1nu/U3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoYN-0000000Eu3R-0jkG;
	Tue, 27 Jan 2026 19:16:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoYF-0000000Etzg-1YU8
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Jan 2026 19:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=3BOcMCCe4WBFvFzXAB+tiWNFCRlcVsrdBoIuT6Wq0ec=; b=Nc1FGyZxK/NSDGj46Eijvb113N
	EG8M+WWe6zkzDSr6kUmYt3BlEWRxZuV2/++PInhVvOcqsO2wNfMkqsXpU9dnxfFLC506rB9Ar+Z4C
	LRzZi622EM9fVsNTwVjZHiwCvfovtAkEsQ5WawiLULHMLP1RIXErumN5yDZcgJgwhivL2YpA4HX+a
	u8aC7QlWDsevwYkrQ6dlEk1dpe5m8JUg5wCb6Yn3T/fKaT/u8G+4Z8FI1BwQ6EcODUVj3EWAqH6kf
	unzJq07HDVIhLp80Pdm9SGDDL+wcSdlJKZwpf6On2alUUu8W43MCaY359kv8Js9NRCxa9dyLl4lCd
	Q2mzSt1A==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoYC-00000007URD-2Vxc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 19:16:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4801ea9bafdso24957435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 11:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769541391; x=1770146191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BOcMCCe4WBFvFzXAB+tiWNFCRlcVsrdBoIuT6Wq0ec=;
        b=ZqJF3yUbPo3c89Y2nprsBAG1WCPkUcQ1orq+YuEDxpPArK44YfOQ0RbChtkuh2petD
         uez6Crwin/49meIqZOpZviC/+6pahohpMTAZeIOB6YnAyYMYO981T44tvEAYXSsAQ0aL
         1O2j2AyIeyz2JBFkPb3aQ90uWkHxAZHtIAHeqUk8FDoYoikDP3MtItDSXzdVi3rcndba
         E9Iq/5f2M6CKCWnth5W9l1HNEHcr4M7WAF9f8VQWOYsajzXUTvPz6Th3Vc7Vy/7gCQbv
         yOwXKi9MbU2F9mF0AhKQ7+A5qyEIZJ18/N97Tv0DZwZh3POzGiH3tnX6P6skZhfMdpt4
         9eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769541391; x=1770146191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3BOcMCCe4WBFvFzXAB+tiWNFCRlcVsrdBoIuT6Wq0ec=;
        b=AutuACQSWmFi3KlXo/yUSJR5A3B3f2zfbdvsXsud4QltyLI0u08mrn0VgULRfYiQID
         ErbQVcAsjlKnxgflNHLwgDK5z+8HsKh3uig2J9MYo0KbioInVi01wwWyAdMHFqEkeqKa
         B/8jJEhZWHWrqwT3EvkRI86IM3AttRIRlDi0+8DjdxWyFr9kEW3Uv9KeJy9k9DWxnqNo
         vqDr2flfpZAsHbfTnSsqrZH/9zr03xHmfgZJQeapJNpezWiYgoqcNeGUZshP7eAp+LOt
         TRC+/x+KivP9ds9IKWr7J2v25q/k4UtajkHxOTA0o/qMjNaQnR7jBjm7VzAXj//hnrFy
         XjCg==
X-Gm-Message-State: AOJu0YwCFJTHlnRUfz5XV9yHLIuelA0B4YWpw2bwn7nhLl+csWrT0b7n
	9lkcWfeVTJoLAiEZW6WmxI5Wo7uLctyeGJPNbuVaSO5geoQEYhThOZ5dv/LcVw==
X-Gm-Gg: AZuq6aLFUIB42sQ/lEOS/bKxYngrKhvALcA6n2doweYQwExFI2LKDlFIhKu5Zm+06kS
	XdLe4LWmXyu3SzZGhdwzQkrLVfsn3f5wZssHypbosoMJqfG1VvqbHcRBpExiFadvVht8rkcnKdn
	WrW4rOBBCLGuJ9HEOfv0aGjYU3eW+jRBjKSR/g4sJVW1MqGFG6ZF2dT6qJ2QBolpL7p4H5ew+/9
	ynRjlL9qOfn2hjRpyQsrnEReqaEH/vlrEIYSAce8kG6hVf8lV8nwDmPaSx6CFRYV0DJRN8wgexg
	mm1fVKU11CYHqM+TxWY2jlhXdIUgeoKXoK0OIb0Fn3ebV4YScwi1k/PhtRdfXwjVtoo5DEvkRv7
	7MUdX4kCMq7cyUcO1T3t7in83B/fSuGUr+hVAhEfgtJggt24f1EcYdrA9t7d+DjN5K67tvzABYt
	nuSL7kwqGq/vim6SXkyMmPIloy
X-Received: by 2002:a05:600c:4f82:b0:480:4d39:84b3 with SMTP id 5b1f17b1804b1-48069bfabe7mr37919655e9.6.1769541390838;
        Tue, 27 Jan 2026 11:16:30 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806df6056esm931525e9.2.2026.01.27.11.16.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:16:30 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/6] ARM: zte: Bring back ZX29 UART support.
Date: Tue, 27 Jan 2026 22:16:16 +0300
Message-ID: <20260127191618.551317-6-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127191618.551317-1-stefandoesinger@gmail.com>
References: <20260127191618.551317-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_191632_720046_1E4D8DBB 
X-CRM114-Status: GOOD (  13.96  )
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

This is based on code removed in commit 89d4f98ae90d. I did not bring
back the zx29-uart .compatible as the arm,primecell-periphid does the
job.
---
 drivers/tty/serial/amba-pl011.c | 37 +++++++++++++++++++++++++++++++++
 include/linux/amba/bus.h        |  6 ++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 7f17d288c807..a59d5e158daf 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -216,6 +216,38 @@ static struct vendor_data vendor_st = {
 	.get_fifosize		= get_fifosize_st,
 };
 
+static const u16 pl011_zte_offsets[REG_ARRAY_SIZE] = {
+	[REG_DR] = ZX_UART011_DR,
+	[REG_FR] = ZX_UART011_FR,
+	[REG_LCRH_RX] = ZX_UART011_LCRH,
+	[REG_LCRH_TX] = ZX_UART011_LCRH,
+	[REG_IBRD] = ZX_UART011_IBRD,
+	[REG_FBRD] = ZX_UART011_FBRD,
+	[REG_CR] = ZX_UART011_CR,
+	[REG_IFLS] = ZX_UART011_IFLS,
+	[REG_IMSC] = ZX_UART011_IMSC,
+	[REG_RIS] = ZX_UART011_RIS,
+	[REG_MIS] = ZX_UART011_MIS,
+	[REG_ICR] = ZX_UART011_ICR,
+	[REG_DMACR] = ZX_UART011_DMACR,
+};
+
+static unsigned int get_fifosize_zte(struct amba_device *dev)
+{
+	return 16;
+}
+
+static struct vendor_data vendor_zte = {
+	.reg_offset		= pl011_zte_offsets,
+	.access_32b		= true,
+	.ifls			= UART011_IFLS_RX4_8|UART011_IFLS_TX4_8,
+	.fr_busy		= ZX_UART01x_FR_BUSY,
+	.fr_dsr			= ZX_UART01x_FR_DSR,
+	.fr_cts			= ZX_UART01x_FR_CTS,
+	.fr_ri			= ZX_UART011_FR_RI,
+	.get_fifosize		= get_fifosize_zte,
+};
+
 /* Deals with DMA transactions */
 
 struct pl011_dmabuf {
@@ -3081,6 +3113,11 @@ static const struct amba_id pl011_ids[] = {
 		.mask	= 0x00ffffff,
 		.data	= &vendor_st,
 	},
+	{
+		.id	= AMBA_LINUX_ID(0x00, 0x1, 0xffe),
+		.mask	= 0x00ffffff,
+		.data	= &vendor_zte,
+	},
 	{ 0, 0 },
 };
 
diff --git a/include/linux/amba/bus.h b/include/linux/amba/bus.h
index 9946276aff73..854c962d70f5 100644
--- a/include/linux/amba/bus.h
+++ b/include/linux/amba/bus.h
@@ -103,8 +103,14 @@ enum amba_vendor {
 	AMBA_VENDOR_ST = 0x80,
 	AMBA_VENDOR_QCOM = 0x51,
 	AMBA_VENDOR_LSI = 0xb6,
+	AMBA_VENDOR_LINUX = 0xfe,	/* This value is not official */
 };
 
+/* This is used to generate pseudo-ID for AMBA device */
+#define AMBA_LINUX_ID(conf, rev, part) \
+	(((conf) & 0xff) << 24 | ((rev) & 0xf) << 20 | \
+	AMBA_VENDOR_LINUX << 12 | ((part) & 0xfff))
+
 extern const struct bus_type amba_bustype;
 
 #define to_amba_device(d)	container_of_const(d, struct amba_device, dev)
-- 
2.52.0


