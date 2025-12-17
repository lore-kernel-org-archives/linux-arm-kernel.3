Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3453D65528
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K04ow0eNGFdOpSpME/SmZeUSWAE32cTHhjE42HTO9TQ=; b=39qQ9IF6m8AkdAJdJYjR+JRr82
	0nqonr9QJTQ7LsSZt7xLyFlrY1vLJemi+3crdQ2PGTC51GaXOqGMk3FH0K5Iie6gzgpSgy0oLBfan
	G7TZO34d0a78IpAKrS6miIlzsfAYE/DmLwG2UQf/JTbfjKIVjjzLepVVTybEnDAWaq40JCCjxRhJP
	7JLGaQ3PGq1AcQDXVFOZO0VtbiQilvCBOR4uZzw6dhIGaFfRmPLj83xfYhpJ3n7wtZbb/5nFRTCw7
	Bap4y2gjQsw4oajiyQRAA9Q+nVgDIvdj6tK8WUabQ/SMzUfO5r24KJvwMf8dpnEpMwHDrwhN70h8T
	We6zrhdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoVj-00000006Vr4-2t23;
	Wed, 17 Dec 2025 10:11:59 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoVh-00000006VpH-1rHB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 10:11:58 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a09d981507so3515295ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 02:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765966316; x=1766571116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K04ow0eNGFdOpSpME/SmZeUSWAE32cTHhjE42HTO9TQ=;
        b=BCCM3oIAngZl4BhSc9ReN2w7CDl1pq7gegvAQiOCjoUKXDieV2ij4j4ni+NI2WiZrI
         GUzODFP8Nfga8tSl3wLxOpIphGDAuFpWA0yXIOPEIMjrnEjgZCZedevyxcXeNDTFGiYh
         eDhdtNoReW/F0suG/7pa6fcB1WcXlD9RBeGjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966316; x=1766571116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K04ow0eNGFdOpSpME/SmZeUSWAE32cTHhjE42HTO9TQ=;
        b=waK0ku8YG6zNdDhmQAEZSMoJ5MF4rP3Nutc2lxUSAP+v4cJ9klTZHXtwDQD3OczYkT
         BSbRjKfls4xRMVWUVjxW7f008ykbKwzcGYeVZaC6KwS34bZ2tJnokqFa8yJ8TCYKHhlL
         gfSqo2qLIaIFy2IXwbTLHWo+7CGS0oH3974nugVCX8QUAn3Bzo3QhpMULI9Sv/Eryykc
         9P9iwXDnOa3fq1N4yvMWmZfsG472UmBJT60pzxjMFQxTVhVyRY2NA7UvK9JlicqX6zcf
         Vp0MckgKXdL8hSNmB1DLHmVPKMcw2B+f+M0JF6Kmj0ovGUKn0iKrOgF2ThKIz5NN2npp
         8IRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQYcBCfXIb2BeIyZRdgiOb3uLhOBBZcKMvdas7SmD/MY/zmgHw30RNUVImDR7wHUofS6DyXY8ua/VOdyGi4E4T@lists.infradead.org
X-Gm-Message-State: AOJu0YwXfp4760QE4+WaU9t02+bJTLtX/uloFWT+rmqoVvcZgRCw37pf
	G5nQUD99dJrsHr/6DwFr5qZvXXSv9L6pr25eiATPhiB4vAZj1GAJIgYZcRigRfnFoA==
X-Gm-Gg: AY/fxX65QHjYAVO1EV3uG97/7/fK5BOfh+9lL01/FjUgYyqs72a3Czk2W5uwfxrXTFU
	4KTmcwTVrhB4P04rXMuHo9o/WtASW1TXuX/Q1fRhhQfMa1dxDWW1voJc5YLxBDB/fIzonQbvEHq
	wKJZTOQL8NxRLeVuZ5a38ZQvYklQOn00Z9/VRoqEcgSyNyi2mwhQFF2OeABzUn14kqpb7DevSAB
	XKUWRuiBUoMjvSuSj7VerVCA0E7PblKxYitH3Ee5NyuP5XT1dtgVoBqNAw+BxpCQH7gnHemYnic
	YIsLWLafq6ZyddraQngLM5qEFEs6YkaVcFSOn/ZrATCFPjiZh1dGV8lZvHZj6d31WPd9uLOOzvH
	09lZiH936Zh3P6Je9VmuuLY8mIImIbihM6AXJmFxIty3l/HqACHTjsM9039utb5rAPQ/WbP+vNM
	nmABAjp5Z4kwV+v662Au49SXiaXg1NooAozEnOR0ALuKQzxlblalk1In6jZB/eoKNjs9Rz
X-Google-Smtp-Source: AGHT+IH9JDk9/8ttnmED8uX+Mmzi2jbUa2ALm/TceQ9Kmj2oqUNGhg7IR2LAST5VvPsW7hnAHuK+Yg==
X-Received: by 2002:a17:902:ea0f:b0:2a0:9238:881d with SMTP id d9443c01a7336-2a092388d07mr158621885ad.15.1765966316255;
        Wed, 17 Dec 2025 02:11:56 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:201d:8:6cf9:c1ec:793:b8d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0cf143804sm102912045ad.73.2025.12.17.02.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 02:11:55 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: [PATCH] spi: mt65xx: Use IRQF_ONESHOT with threaded IRQ
Date: Wed, 17 Dec 2025 18:10:47 +0800
Message-ID: <20251217101131.1975131-1-fshao@chromium.org>
X-Mailer: git-send-email 2.52.0.305.g3fc767764a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021157_518972_E43962DC 
X-CRM114-Status: GOOD (  12.30  )
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

This driver is migrated to use threaded IRQ since commit 5972eb05ca32
("spi: spi-mt65xx: Use threaded interrupt for non-SPIMEM transfer"), and
we almost always want to disable the interrupt line to avoid excess
interrupts while the threaded handler is processing SPI transfer.
Use IRQF_ONESHOT for that purpose.

In practice, we see MediaTek devices show SPI transfer timeout errors
when communicating with ChromeOS EC in certain scenarios, and with
IRQF_ONESHOT, the issue goes away.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/spi/spi-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 4b40985af1ea..90e5813cfdc3 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1320,7 +1320,7 @@ static int mtk_spi_probe(struct platform_device *pdev)
 
 	ret = devm_request_threaded_irq(dev, irq, mtk_spi_interrupt,
 					mtk_spi_interrupt_thread,
-					IRQF_TRIGGER_NONE, dev_name(dev), host);
+					IRQF_ONESHOT, dev_name(dev), host);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register irq\n");
 
-- 
2.52.0.305.g3fc767764a-goog


