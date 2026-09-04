Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B9DC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 09:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f2uDduOSprb24UTS5mMjO2bGXJg9YYeJ4jGweCvX+II=; b=ODP129hlqJvRhPuyCONZ86l2GK
	TJ20ItG+cw3k750NyfRrv+KQwrGdEsxzVGuEnSTvCogFLO/aZDWGgEsCagZBoZdwAaGzIE+kiB2yJ
	IZmCWBc2sv47DRfZRuxadsIffK53VIepXZEZmCpEz7QuT1qUlJCje1VIv8IzKdroWZfZSTq7gc8ZN
	aP8DcRcYAQ58EykSnsiS2ZbGcl8AjgZ3/CaIIiC1tebSJObOg2wPtJv2k9Hon7GF46t1wyzvt9zj4
	Q9/md2pIeiaMNBwOXKNdqPniKhMjDosG5KB80L6hwI6Le8u0+vFzCraEx6/kiYjMttD7yrT1j1OR3
	c29+wMLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Pyk-00000001Uil-2lj9;
	Fri, 04 Sep 2026 09:12:58 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Pyi-00000001UiI-10er
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 09:12:57 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-398a5aad413so593189a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 02:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788513175; x=1789117975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f2uDduOSprb24UTS5mMjO2bGXJg9YYeJ4jGweCvX+II=;
        b=Mnyf2yPNlYwcVjl0bTiVLSQ/rx5eM6YILowmK0il+I2s1jmnn33rrp+xrHbU6ZeNli
         kPpK9GklThpbKl2rGhY6v+zEKfsqs6p6UIw7cpB1bl7vu/jMmo+rNaoCkyl1DmvvIa/b
         6O3v/m7kTh/9713nBlznbwigMcsOCPI4r3QLZa96JtUQQnIJmk1i60xeQiLkY9r3FMPu
         KALTEKfoXfPp/Jy1rWIhIG2LjmCMBp/cZwX9MIPr8ipit3bm5M7cyxhBP+RFypFkOnFO
         Z28YjKKpb9lTob16kiJm5953kwdpT74bDNg7B9WAk+70m+x2X2p4ulLuPAHtmeGJFA0q
         0qEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513175; x=1789117975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2uDduOSprb24UTS5mMjO2bGXJg9YYeJ4jGweCvX+II=;
        b=PPnFPMU7P8MKY5G+3+UaZPaY/rC+7U+qHBPioRTFXLTNgVTF6ZZ5MAlAKKCOuPuJ1x
         CFh2UTYeIitLfE4HzMlEBFTPkSZ/HJepTDyhkXQUgStWB2hMXsl5zFqRuYWidbt5VNmx
         t+NBDr1TJDmieRUxzYebyqD72b+jgn48gKUJ61DNWXUEmieuw/yrtBZnzAXfZ4dnituU
         R9Fg4b1tiATh5BluRPSsMP1GalEdL70nHCnOm/6dajXNoSrIz/sL2WO7P0QzzUfuYXQ4
         tJk6FtelfRPjcvSLGqPxJmae9jDpXMfw4qvhXT0W3tUzsGtNToL31Nb/VOw6CzK5ryM6
         JFpQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1BY5MZo0kyQbOK+zNRedDQ50HPkqd8Rg0mnLllcWYBDXhwFzaut9yJodJkIF71r0fkWeQVhL+Z73Cby7Y8n67@lists.infradead.org
X-Gm-Message-State: AFuF++n0YGhM3N1xN/cfUFOaOD0rzWOxnOVPTj6Px2SpQXSoFlSNlI1X
	ymUyGRF3LbN/pdEtDFH44HM65SAyQv+5REP+4tur7wPaqP7QouVA2xAE
X-Gm-Gg: AYBFou3U1iGsJji9rG5vlA5BQx6y342w2L7F9pl0+KA2wjgux0BxURfFO9rXl1DXqNo
	h0IT8ZJ1zLNArRuZSmKDXNomEmaaaZMPtT1uS9BYyeJs6B/9TFWFBVXmezYMhQilfalA6rfGfar
	0olu+TfFjWVzlsVdSDO6jrGjOU4Q2EvtR58tDaXdBs7AHaMWeoF62vSsDX6LpmEhUq+t7JckSry
	4INu1wRb2y2CIo5Ce4PL/MWQUOv7jWSjJjABqOBgEevXPn1N8B7YE8wy+6LEd8z0SoFm+b55G7D
	48kbP3OSr91/G6vjoGTWRUPJ8ihFBj83OQfXWmOktFiGbBk5d0U6DXIWU4dVA3to1T0gKuW10aJ
	Tl8ajfN8wOr7L91sN/JZau99uROMe0Zg0dV51yNKXHEtucglZUzUvYsj8qI0RPlTvoC6ssMO9Gd
	FPycFcKs0gUL7MzK90RFqKJ840maBG3B5KPtj5TkiJtwmva40jHV1iTFqVISOsYesOghEaSDNTp
	PidRH1K6mzwhkmK/VCuwdirMZtQ+6FF8vXfWgthie2CF1LfNmz6S5JBAqXiLJV5ky7qeqsynlun
	O62h
X-Received: by 2002:a17:90b:394e:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-39b26272d76mr7654274a91.12.1788513175260;
        Fri, 04 Sep 2026 02:12:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612d3f1sm3443708a91.13.2026.09.04.02.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:12:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] remoteproc: stm32_rproc: Propagate errors from optional IRQ lookup
Date: Fri,  4 Sep 2026 16:12:30 +0700
Message-ID: <20260904091230.58665-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_021256_279616_8C0132D8 
X-CRM114-Status: GOOD (  12.74  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Instead of only checking for -EPROBE_DEFER, propagate all error codes
returned by platform_get_irq_optional() other than -ENXIO, so that
failures are properly reported to the caller.

Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add Arnaud Pouliquen's Acked-by tag.

 drivers/remoteproc/stm32_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 1fe4cdc0a13a..a47e040c6db8 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -675,7 +675,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 	int err, irq;
 
 	irq = platform_get_irq_optional(pdev, 0);
-	if (irq == -EPROBE_DEFER)
+	if (irq < 0 && irq != -ENXIO)
 		return irq;
 
 	if (irq > 0) {
-- 
2.43.0


