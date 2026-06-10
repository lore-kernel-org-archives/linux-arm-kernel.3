Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864D1CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 11:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qi4w7zRN4FtxkA4S46A60IGs8UNJ+c8S4k9RcdkfCmQ=; b=TJKGE8mUi9Des6TS+E+uw0Kf0f
	6ycsDS7Hnts0Hvcijj2jbJnLlvdLDuEjhbaihk+sGRX/eT2y/sD6Aj23XUKykz2+ay3oDO+dMgXD9
	2P/vaeTtbhbFs8c1VbLuuNgXTCLP1A1jAmRPG73DywVrqDjtGLv3/cTkEEg7unULDnljPz3wJeBrW
	eTvObJD5lhSTrKKlhhWhZJGbpibTw7DVksBd/fiZ6WLx9kvF5T4/kfEP0KpsYzIilze12oNTsbedg
	qDTPsgX4475w9bZkUiq/dwn6EBg3cEFe5jPDtLJ5b5ETnAO6v+zdLbqePNcSLWYQPaQZlrzxEvsRo
	LTcU2VGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHXv-00000007aFm-3uWJ;
	Wed, 10 Jun 2026 11:56:35 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHXr-00000007aCO-1w1E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 11:56:34 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c86484d35d1so298879a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 04:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1781092588; x=1781697388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qi4w7zRN4FtxkA4S46A60IGs8UNJ+c8S4k9RcdkfCmQ=;
        b=wbhnj/S5VYjwCskp1RAYKdzS60VMadnbVKvz5xIrZPRhkNv4a29bbB8IuUOHcad4z7
         617qzB3bLCo781p1GKeSBx2BTi3PSPR1ClVDpmoYJBVAm3sa57aVvqSIgnO4NLakrJO/
         0zHlNMl1JRwsrAHadE/HnpI4tEZ3WRA3pZmRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781092588; x=1781697388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qi4w7zRN4FtxkA4S46A60IGs8UNJ+c8S4k9RcdkfCmQ=;
        b=PJTSZCPv41BTlZ4XI2fiLS8Z9TT0QrfnMuNTolLxSzm13ptfC6OFVGUBxMpQH6VLU/
         5ID/kBlkweP9Nhx/qX1C/4T0FfI8ZgGmZPpom1hk8lK2JdIjqqMlxPm5JJuX7NK/tf48
         7qBR1UHg1ap6FiUZIKsBNfobFgTtBMfhrA9/dOUylXXUCPqWXn+QCpvPPuNRAyjk9viN
         L5XjnQjh/021kP7l/FaxpwNOHaBR4wZTUIGRHIno4ATOPWWDRbhJWF4/MjU/733R9V28
         lsFTcEajILSjWsDK/0dJhGamVo0zRosBlKzzPdynVme7s+ZPzzU7i5zyUK8W0g676oKF
         cgOw==
X-Forwarded-Encrypted: i=1; AFNElJ9JvmbZ118u1LlV8ckku2JHNIZea5Y2SnXaoDMyNC+VTZm8Ptxj2CRkvQ2NQBQxRExy2Xy6sqITXS6v+aeZFeVW@lists.infradead.org
X-Gm-Message-State: AOJu0YwEg9NkXvCQkyR9phaz/AGcOrf01zoq3IlwYupv9H9mheG9VxY6
	9iNfQgJhvSZpmZJy0P5oHMA0KqjvWZX3b9zUEEjdRHc8VcV8ClOegAANSBOwJ2jFN3k=
X-Gm-Gg: Acq92OH6WuDZl8iZrk8dB1U3u8wE3xF1koORiY68/iRB4tfcXL1KStcwF5oN6L3Rz9o
	mrLsJF+5iwImYxPOsy/PRcFNLZ8qRzomO8H3ENjPxtfobNCHqzwrsvPIQAwn/p0Bq62d+hqr57C
	4L/9ndn6kWdl/Dfnmh7MFcZ8/TxK/A74ts0USenKcTiSjRKC0vX+6t+miv7EHeEtpBw9YYaie8e
	wvsnlgol3tMVimPi7RoqwbtQh7MFgLSFg3dZov/D9o+zGY6tNi4/2oZ/xJGymFy8FwpF/83p3PK
	BvpqfMJypMR061Bv7RRlH3DsXKr5CdwUefNnGXZJNW3Xq9DafLk9nlNeU5Ui+QkcYDryifpWG0U
	NblrFKC3q7tEYf5sVyD7bDy0QuMxp467bCPD3DL8N9uZ2BJC7Nns06Qbs079vQCbNnsYy0gYy4K
	MayP3Efv23l9EXW8pNEzAHCH6R3yZdqVx6pJIioabuoVlD7DRzi4S1wylS057YIPH/2xc=
X-Received: by 2002:a05:6a20:c793:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3b4ccd7f6femr29605015637.16.1781092588202;
        Wed, 10 Jun 2026 04:56:28 -0700 (PDT)
Received: from nunu.. (nunu.snu.ac.kr. [147.46.112.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04a0e9sm18300516a12.13.2026.06.10.04.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:56:27 -0700 (PDT)
From: Jaeyoung Chung <jjy600901@snu.ac.kr>
To: Mark Brown <broonie@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Jaeyoung Chung <jjy600901@snu.ac.kr>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sangyun Kim <sangyun.kim@snu.ac.kr>,
	Kyungwook Boo <bookyungwook@gmail.com>
Subject: spi: uniphier: KASAN wild-memory-access in complete() on early IRQ
Date: Wed, 10 Jun 2026 20:56:21 +0900
Message-Id: <20260610115622.773149-1-jjy600901@snu.ac.kr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_045631_667206_5B698569 
X-CRM114-Status: UNSURE (   7.39  )
X-CRM114-Notice: Please train this message.
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

Hi,

uniphier_spi_probe() in drivers/spi/spi-uniphier.c registers the
interrupt handler uniphier_spi_handler() with devm_request_irq() before
it initializes priv->xfer_done with init_completion(). If an interrupt
arrives after devm_request_irq() and before init_completion(), the
handler calls complete() on an uninitialized completion, causing a
kernel panic.

The probe path, in uniphier_spi_probe():

    host = spi_alloc_host(&pdev->dev, sizeof(*priv)); /* priv kzalloc-zeroed */
    ...
    ret = devm_request_irq(&pdev->dev, irq, uniphier_spi_handler,
                           0, "uniphier-spi", priv);  /* register handler */
    ...
    init_completion(&priv->xfer_done);                /* initialize completion */

The interrupt handler uniphier_spi_handler() calls complete() on its
done path:

    done:
        complete(&priv->xfer_done);

If the device raises an interrupt before init_completion() runs,
complete() acquires the uninitialized wait.lock and walks the zeroed
task_list in swake_up_locked(). The zeroed task_list makes list_empty()
return false, so swake_up_locked() dereferences a NULL list entry,
triggering a KASAN wild-memory-access.

Suggested fix: move init_completion(&priv->xfer_done) above
devm_request_irq(), so the completion is valid before the handler can run.

Reported-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
Reported-by: Kyungwook Boo <bookyungwook@gmail.com>

Thanks,
Jaeyoung Chung

