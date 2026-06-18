Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5040CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 13:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tT13A6NAYZuTx/YyXo5jPcQ9raZMcUWUjalNNtxI2PQ=; b=1IgHaZWUWwnHlfnJpl/Rn2reJU
	/I0NR1cA3UAX9V7JhWEknVJ9sRUNKoKAqmZmwclt71cxE4whY+xh+yxSkweIbWLESSSxETUwWD2jl
	HNfwFBcAKa5y+HHkbMB4GUlL+iUk4dSu5E+78QGqLsS/lmQlzz7FO4urapBkZbXCE3Q/iU79IN/Tm
	cRpW3hOukRLjOKvWG3yy7wIwAQK7IMaN75h36sCcEqQYtZY4+7PdmcAqxkGLN3JmFLlRAf0Pa6Kq8
	qlJNzi1ezq6w0fekXks9fqspGrZWrTMU3Nkfg0r6+qRprMEQ0fz4uAb0isf4y/SQiUzKII5Zsjzk1
	z/F8ixbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCgq-00000001LwR-1t0V;
	Thu, 18 Jun 2026 13:21:52 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCgn-00000001Lvm-2QW8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 13:21:50 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c88d4606ec8so457807a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 06:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781788908; x=1782393708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tT13A6NAYZuTx/YyXo5jPcQ9raZMcUWUjalNNtxI2PQ=;
        b=XUmWbgfSnrLJQ2nncJ6yw//9wuqskvAHSMnVsW1UECu1dDryPG+q502N/Tgs4oe1h6
         IyX27NtYX3b6uY40xhbsgLMJq+yS+Q5A6wENppf53EHHks9yRYssI0HwQeyVHnUxPwMI
         CiE3n4aZEozCXOy9gatxP0S3FnIjjYKyJKiS/E62vubmqmjQ4Zn6fx3SHliBsM69gdC+
         3F+qvC3Xl1v1HtjGvnZykDlCNMKCVHg5Mt5qJEg+mpX9W3Ln382D06/fuVMscPWTbjGL
         vfIKGv9yx0fUSpLIZbCC30Oamc1STH65xIPbqqCYvB/GiY/U97CAFPBv1fKPcXXeoylA
         807A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781788908; x=1782393708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tT13A6NAYZuTx/YyXo5jPcQ9raZMcUWUjalNNtxI2PQ=;
        b=N2N6dGL0XOyBT9yWJLZeIVhVLyLlM8etifxIQaEPJPgXLJk4R0tcEJbLHe9F8/dnfi
         jPiLbHdGjdNBoF18VAsu7ODTc5fV6HSQFRDhlnWlWwu+V8vQGPTAVq8VAV6nltHJ+YlT
         9mk7kkirmVR3V9BZEgSQBYSfNNkuUtVQ/rxlW8N04o/iSY8gH46jt0ZB61a4yPDaFgW4
         7IBx392/X47+iJKxjDmOwPN78A8PGykV1gkucfGow06S0A7z4aF3ufCkxM6qJJ6JyfGK
         RqBea2Zb232+naU41ibASn4poQH7lzCdF9WTwwXflOcW8wV9XxTvfjh4eAvM5t9KlEd4
         akOA==
X-Forwarded-Encrypted: i=1; AFNElJ/q9PyzI8jtsR+yer8dZaFRk8kVy3bKFAaYxwQ0s1fsIGQKCU5/W40QGe6jvqr4c9fmfPK18lacEtsPMCYYF0UY@lists.infradead.org
X-Gm-Message-State: AOJu0YyIH21xmcY6aDPREN9eL70rELnHy4L/f0baVe3QPgMNOWCPQTdJ
	CvMEwHHZonYTltT6sPD/hJGxoq8OGmTr6gIbCHZ0Npr+/l4ch8PrHNPY
X-Gm-Gg: AfdE7cmMnY2D30Pi5IVijuI0DdCcT3UMWq0gDXC/ND42rAWxVXkNDDysABEPAT6zuEF
	OHXiMHdE+KBXNConOZoNWH6TZwOnnlGI2Yx/cqn3swUrFxcUIarrysEICgczwXmsFpAMQ2BzoEm
	nAzp3c015VqYrrRscf/pNyNVAwnpQRD5jNPpIe1NyJ29Ph//4Vsu/3tRGhMOl1twMT47Vj24BxJ
	60a6GpyES5A8rqts516Rxu8Lj4LxF0YXVmAncHOuWBCkIm9f6WV6f9kqCqmFeTLS2Diahkl2FO3
	I4Zw2ETBHmVBpSwyGxZDZG5gU5ttt5RixUnn81F+PNb5RINEjAs+7/QcwlXN9KojzBkwudWQ7cI
	FKH2fgo8SsDUmfIWG/gwFpAtpCFg6plr2N6BwLfkEiwIkcG7/99DnqLvSEwOlP5hZ49Wwc8kiG6
	o7zMreuKdSxHf+dayon+7/ts3Viz3XEducP3m6RuG8
X-Received: by 2002:a05:6a21:a89:b0:3b4:6265:3788 with SMTP id adf61e73a8af0-3b9e7bdf93cmr5194540637.21.1781788908183;
        Thu, 18 Jun 2026 06:21:48 -0700 (PDT)
Received: from steellegend.taila75641.ts.net ([2401:4900:1c19:e45:6f99:fe25:8bbb:3a22])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661b5ccafsm17676098a12.2.2026.06.18.06.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 06:21:47 -0700 (PDT)
From: Uday Khare <udaykhare77@gmail.com>
To: andi.shyti@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Uday Khare <udaykhare77@gmail.com>
Subject: [PATCH 2/4] i2c: sun6i-p2wi: Fix device node reference leak in p2wi_probe
Date: Thu, 18 Jun 2026 18:51:39 +0530
Message-ID: <20260618132139.11114-1-udaykhare77@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_062149_619777_1E0B28F9 
X-CRM114-Status: GOOD (  11.92  )
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

In p2wi_probe(), the device node reference obtained via
of_get_next_available_child() is stored in childnp. This reference is
never released via of_node_put() - neither on the error path when
of_property_read_u32() fails to read the 'reg' property, nor on the
success path after the target address has been read.

Fix this by calling of_node_put(childnp) on both the error and success
paths.

Fixes: 3e833490fae5 ("i2c: sunxi: add P2WI (Push/Pull 2 Wire Interface) controller support")
Signed-off-by: Uday Khare <udaykhare77@gmail.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index dffbe776a195..1ef0e82eeb63 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -220,10 +220,13 @@ static int p2wi_probe(struct platform_device *pdev)
 	childnp = of_get_next_available_child(np, NULL);
 	if (childnp) {
 		ret = of_property_read_u32(childnp, "reg", &target_addr);
-		if (ret)
-			return dev_err_probe(dev, -EINVAL,
-					     "invalid target address on node %pOF\n", childnp);
-
+		if (ret) {
+			ret = dev_err_probe(dev, -EINVAL,
+					    "invalid target address on node %pOF\n", childnp);
+			of_node_put(childnp);
+			return ret;
+		}
+		of_node_put(childnp);
 		p2wi->target_addr = target_addr;
 	}
 
-- 
2.54.0


