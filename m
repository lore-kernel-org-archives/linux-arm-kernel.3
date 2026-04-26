Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70FFFF8850
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 21:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2f/xxCVhn8u14pobySK1w6AYfG4EprPsl+SY3WJGODc=; b=127fkWNM3Eexo/6N5HYr+YNfz6
	Gbf8Jsg3DAi4c8lSZluc5IgZLwzIzPMZocx4ZSHMY9wk5VpvO4/plTpvhaN2AJP4HzNIMZYOiHM6h
	7XNjNLzszpIBNf0e5TaN40DGxFvIyz0Q2RsNKgSfYED3qvW9+Ej28jewRaHYOvl8MTwo6q9A83usL
	Ml9jwkOEZMBKLhyb1ASqAu7ixcQ8otQGml18LQArMgNHAhuapo6pcm0twlSJ4pxk3q9y3UyuYQwJM
	UoPLt/V0/a1UORfGNhcB+2g6HewNd7xTjtzW2TUijqHYaJAx9GLK432MFt6YOKEM9Gr2fTRVfnQDt
	2s0u6N+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH6sQ-0000000Fqyf-1VzH;
	Sun, 26 Apr 2026 21:18:54 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH6sL-0000000FqyC-3Vl3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 21:18:52 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2dec803f9f0so5369746eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 14:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1777238328; x=1777843128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2f/xxCVhn8u14pobySK1w6AYfG4EprPsl+SY3WJGODc=;
        b=aThg7Vj70peQAqg5CRRkMdpFoIhe5mCfbNwzKG+dE/ql3vcgB2bX/c0JtbnAIwuty+
         bkN7wab7djZuiM3kCWiG3cdg3sOFzoenscwVIR3pz2X195A3X1rBRQRQIJVMBFQhRzwb
         +u+LM96fblAPvWzG9aHteSeZ739tPjhvTcJxJuaGxrQWM/2qBX5hkjxlsiCG6H6sgaNW
         VbCZeZm4GB+h6ohqXJUfTnqrcPtCcrzS2KPEPnGZK+JhECXu07Nc9blvT1Ysf+tK0lD8
         PDHenzJFD22AklCiG/dUIXeCVqiTxlqsqDtSwQpPNKy4wB0mMmDrZZF6qSBSX/hbWpkm
         pIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777238328; x=1777843128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2f/xxCVhn8u14pobySK1w6AYfG4EprPsl+SY3WJGODc=;
        b=m1mvsKINGe3V9iZDRlcPPsh9gpQX4PcnNAwquyfteKPfH+Sjc/lXAk8/NjQ+cqmXFI
         BPkFr8mwFV1Wap5QI7/14XyHAhQ8x9f/a+MWr53J4HTuFAO8CKmjUzxGRL5sJpy4GS+G
         bJ/t44keyjyIfbH14CSLxPRJC6Iy6AT6q1BNk0tVFsKHrcJhm6HHfAX/+lwADnqmKJhY
         vm1cjqVoAKcYApUANyzSBEdvK9KSbM358Vkj2Mg1Nu1oxvMs3/k2yp434fRwRoSvFbxi
         O6QoM5JDflmFCURJZ+yZMC3FJ2SY2zVQo+eTPotHkok2/fNx2rf4he8NFxKWxJL2CshJ
         TKJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8sp6Yy5mQ1CMdX/b1alYKLfbFkZABPUcpBJRwN0XPmCaIZZatjVQZCsDTRUr7sM1qwR5pdhktvuN4wR0AMfULf@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0B8GOt5PE2YdiCDOXsGC4qR25Tu6l0RIhrJiwVaJpt+c8104x
	4yOudRVUUnTGLKm+MtqJIdAWkhMGTYLloGxUWTbl/NqhtLtgJxuZ/mM7/usyN+eJpUE=
X-Gm-Gg: AeBDieta6ZsK/G84IalZzeWwWaDkIHboyGfcvUJ2v4PxfhWdVSVV/HI8Qa2IpoWLN5X
	IO9E/U5CXwi+goGgORT4zr5cMkOiZvkrECtPFGvcve8pl0uLPVqtWHM+XKVGKSosLQ3+fci8P5X
	IHZ3YCPjsLKbXVRNK2QA8FeIVjPIORU+MgvhhNRSNjyvHtreHR+hb6gYcIi+jIEVRvCJ/IsoyUF
	rhxlvLzF/sjzwtpcBFOx3tEKm2FzFqM1zvZuKj6KEbHeZFnByAfWj//G2/mcDB7dzEvoHz2kCaK
	H7/2XlqT910Ma4Z7TkvZeMyeBOzlKnZdANk4xPOl/R78MVJ+OXgqQ9r/4NlsvLOp7+2st8DcX3n
	PUaTYCPdH2THP9g27KShE+dcsqg5heS2sSj4fgZkQK/9qAF06y70sDratJxZL/ZKn4yqn7M3iOw
	LR4H2WF5lGJLtbGAY0iX/7Z+gv7pJgqCo=
X-Received: by 2002:a05:701a:c941:b0:12c:87f2:90af with SMTP id a92af1059eb24-12c87f2925dmr9336512c88.12.1777238328189;
        Sun, 26 Apr 2026 14:18:48 -0700 (PDT)
Received: from eileen ([38.10.153.31])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccce0f5sm40799122eec.17.2026.04.26.14.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 14:18:47 -0700 (PDT)
From: Caio Morais <caiomorais@usp.br>
X-Google-Original-From: Caio Morais
To: andy@kernel.org,
	dlechner@baylibre.com,
	jic23@kernel.org,
	michal.simek@amd.com,
	nuno.sa@analog.com
Cc: Caio Morais <caiomorais@usp.br>,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org
Subject: [PATCH v2 0/3]: fix unnecessary includes and add missing ones across multiple drivers
Date: Sun, 26 Apr 2026 18:17:59 -0300
Message-ID: <20260426211834.3318306-1-caiomorais@usp.br>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_141850_423747_CE8E0526 
X-CRM114-Status: UNSURE (   6.71  )
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

From: Caio Morais <caiomorais@usp.br>

This series removes unnecessary includes and adds missing ones as reported
by the include-what-you-use (IWYU) tool across different IIO drivers.

Caio Morais (3):
  iio: adc: xilinx-xadc: remove unnecessary includes and add missing
    ones
  iio: buffer: industrialio-triggered-buffer: fix includes with IWYU
  iio: common: st_sensors: fix includes with IWYU

 drivers/iio/adc/xilinx-xadc-events.c               | 6 +++++-
 drivers/iio/buffer/industrialio-triggered-buffer.c | 6 ++++--
 drivers/iio/common/st_sensors/st_sensors_i2c.c     | 7 +++++--
 drivers/iio/common/st_sensors/st_sensors_spi.c     | 9 +++++++--
 4 files changed, 21 insertions(+), 7 deletions(-)

-- 
2.54.0


