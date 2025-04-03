Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C9EC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 06:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zv2Eim6EJxK+6ui7lY93m7UU37Cs8RrVaOWKjl9KmMc=; b=xN89QyJsqW/PFJEef9J5axLIam
	yljm3T10n5mponOJuD1pDazUVtWVY0TLwiZDmd5tzqvJ7fc0yJ8gjNFaFL815srD60/rAlaGErAKw
	C/DdtwMe29RVullcGkfMX5GrOIwHCjl8WyLKh+7lwaIPIzcgzsOzf/eFdG1G96ZFva4PmDe/zNzKo
	F34iDd/kZJNL8IlOwNS7RuFw0IXvD1/N7H4pUxIQLBASJcnSk6tmdjnFep+Sk+xmVAptxRstQRH2v
	7JnWALx/gHErSW5soicwAYFNvcIRw17ozoYDGuwGEsMJ6xsgTxL8nosk1Z84FW6QczCR8rtrpJ8tS
	u82E0OOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0E6A-00000007vV8-3ZEy;
	Thu, 03 Apr 2025 06:30:47 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0E3m-00000007vDe-3PaE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 06:28:20 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso504611a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 23:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743661697; x=1744266497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zv2Eim6EJxK+6ui7lY93m7UU37Cs8RrVaOWKjl9KmMc=;
        b=gTP57W52RDl1tTCHPnSV0Qn53l16CoImW9yuav4sGlDJ9P3m68WIhF8WOYmLa3JGY2
         9xg23V8NvxKm94ZZZSP/Nm33cw/wjek48y0y/6fj/FnOokm5NT3IpSxg/68FZ9m/1hWZ
         wu5ro/6MoVXgueaIY9HcTFYJnp0o9la+kA9yrjdJl9eJSH9anrtYqSY5VIjcexO2izo8
         6puBRZAVCbngfl30T1ccCffdzaJLIZEu+BM6QVrm7aoxTAOWLTA6h2ddrGCq4RFqVp/X
         WNv2sjkAlfRgad/7nBLJXptgx51zr+t6gcX+GL2shtd+F8xayO7gafQ3ezphY7KCXn3Y
         2AAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743661697; x=1744266497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zv2Eim6EJxK+6ui7lY93m7UU37Cs8RrVaOWKjl9KmMc=;
        b=grFFcvyzahKCQMTcXVGg0SdXjK04ClSe7Dsu8oVLTAjZHqbLobYRXfz6NFBlo+uwPs
         Gy3xlQ0R4qQY0U8Io8d21iUO3tYjl6tFi/6x0D4f4eD4Xxhj0nC2G8S1X7hpXmfwzEMn
         ap9jOPLXdtjywVWmDsxWemSnMRRAFj9MqbikhYDoffDfDgonTFa7pkU7hHEiD6vruO92
         fmGx8vJPH3TiERVRi8J6Wi4wPr2NCJqHyLT4EJ6rCfcynfmms2LyNKYAg5XyRpsdCdVH
         tGAcgW5rT2fsZDI1JjsU9H7MGawJjaCpYtdBHqPvI8Tca5ml1DVFhyobB5SR44TtLgMz
         VdgQ==
X-Forwarded-Encrypted: i=1; AJvYcCViDy9zCkeGCb8Ik9Vf9it1Svf2VQCv9S+eB6ffgW71pNKcugkPUbYUQ+TLQxxOGEm9P6c5vpfaDJ8Fmi0BWWjP@lists.infradead.org
X-Gm-Message-State: AOJu0YxMiRUImeVG2/k/tmt1tazFLjVZQ/Y27lPrryuUMYrNWtcMWtBt
	QVLUPaRfaRAkvDRyP0EKVxQCCXF49UNlgcs1i7uq3mnpsgflWaay
X-Gm-Gg: ASbGncsVnP9gvyTpTmiuYwh52TV8q0vKdqT1IthA/YMpny++850OLgyrVykVWNLfz3Q
	CsmChbfu9MqiXfyssL2jP52GZMOmt0Swjd2HiFq0qKoZiMXY8U+m2Xvtby5zX0z/eprr/PEaXK+
	9oZEQql1r31+/xtGMXPNeckQ5dq59yPNMq8Zv156wL+0E86YIOsGHX3HhkIabTz2asmkDFMiZgl
	D5CGpf15JVb7BjTjwd8gVUmkTNJ0AE3YM51QrvWG6Qg/wNQiAvFjxWd+VutTa5pBL1vAazM4IAg
	L8YNHE28OkjCIWGbcNQX2IVr1LlHq1vxurUij0/YZbEd9eSiNCcMYWuq1ehTQZ5jQnYNSWk=
X-Google-Smtp-Source: AGHT+IH3/7oQDppEuWcYDFvnSNSVp2KWqayWvGz4NpuF6q5e1fxmt66vYC1luZBtdcGvzxbf+Tt5KA==
X-Received: by 2002:a17:90a:c88f:b0:2ff:5016:7fd2 with SMTP id 98e67ed59e1d1-3053215e085mr32933013a91.24.1743661696860;
        Wed, 02 Apr 2025 23:28:16 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057ca5163fsm926950a91.19.2025.04.02.23.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 23:28:16 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	sugaya.taichi@socionext.com,
	orito.takao@socionext.com,
	u.kleine-koenig@baylibre.com
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v1] serial: Fix null-ptr-deref in mlb_usio_probe()
Date: Thu,  3 Apr 2025 14:28:08 +0800
Message-Id: <20250403062808.63428-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_232818_850156_9ED6BC9B 
X-CRM114-Status: GOOD (  12.93  )
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

devm_ioremap() returns NULL on error. Currently, mlb_usio_probe() does
not check for this case, which results in a NULL pointer dereference.

Add NULL check after devm_ioremap() to prevent this issue.

Fixes: ba44dc043004 ("serial: Add Milbeaut serial control")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/tty/serial/milbeaut_usio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/milbeaut_usio.c b/drivers/tty/serial/milbeaut_usio.c
index 059bea18dbab..4e47dca2c4ed 100644
--- a/drivers/tty/serial/milbeaut_usio.c
+++ b/drivers/tty/serial/milbeaut_usio.c
@@ -523,7 +523,10 @@ static int mlb_usio_probe(struct platform_device *pdev)
 	}
 	port->membase = devm_ioremap(&pdev->dev, res->start,
 				resource_size(res));
-
+	if (!port->membase) {
+		ret = -ENOMEM;
+		goto failed;
+	}
 	ret = platform_get_irq_byname(pdev, "rx");
 	mlb_usio_irq[index][RX] = ret;
 
-- 
2.34.1


