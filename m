Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6D7FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 12:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4HsOGoXcMVel5UZKKUbLYS7YRDhsp4Nm+pDK49IhB6w=; b=REmEExk4Ncs8i8xWUowbfJxMf8
	l4/qMJluQNY59dlG5DIN/2PdnLufTMG3MMLBNgVJxUmdSu783JWmToNfxu1TW/zJzLWEB3SZvixBK
	bd3D1DlBnqD4bDxMSeh7rOKUmgNFlrZQG1UckFvG7saiIQl3xmzD40aeCKwfZ523BGD46XHblZXWd
	Il/dhmP/IpDkR9qssHO0GJeqEU/Ghun38XB0ta04D7EuTUOaxbnXhFG0nYbdahqqXdrf2et530uil
	p3TfSHc9Fq5DXzkT/gEeuvEa186q/eRWE8M+VrhMTFe5bvPU489RAKssHP9LS6asmiGljCev8llaX
	381eNsZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGyqH-0000000FYF1-3nKT;
	Sun, 26 Apr 2026 12:44:09 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGyqD-0000000FYE1-1ky6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 12:44:06 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c795f441ff7so6420479a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 05:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777207444; x=1777812244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4HsOGoXcMVel5UZKKUbLYS7YRDhsp4Nm+pDK49IhB6w=;
        b=W6zkYrYiltrkCM8DqpTYV3JabetwF5SI7Wc7DOMoT8+sR5ze8lBwI08HdZrQXqVnmu
         aLifIZoxftokT4mdpXQh1vVfpcT9J7qztsFpqGU3km+NXWk47jHlC5vTNXJfiDMsXRgl
         mJGjRk38AQ8OWyZ/qroUSPzFkfFgbM1PFUXitWRapUOPK7qQRLq6EyrB67Wgo8Dn0gLa
         Bj/3ukstLD9kwBWA6y6lrMmNrYKViLpL0fFgP0aOC0+JZe9LC20GlUPISC69mj0Nn1/4
         XQn9xo92fvdYpjlyFg0NY8uDeW0dBIjMC/VhTYCV+MOtwz7GHLEvj3PnMf9iZ6GuQVFi
         A56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777207444; x=1777812244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HsOGoXcMVel5UZKKUbLYS7YRDhsp4Nm+pDK49IhB6w=;
        b=QBNvHYtdy/ikCANcdz5NC2hDi75Z/DqYaT5DkZv713O9EgV4Kr7ebGsAdUttwlErKd
         SxFVMcRFI0zRSEYFD5UB0k7yrZ07Q39lC4OG3JCQu92W7DRYymaQro9+ztwYPI3dpwMQ
         4HKIRl0GwobhwXsAXXExlzt/NOjj0F/qJX+Q/Xpc7yhzRUa1t/IHfIERZJBmFjYuDQZz
         wJp+uYcUGUAEpjzVi0Qexk4iQLp+4FLif9vQkLv1qEug+cO6L3LI0q91jEgoSB+PJzzJ
         IbN52FaCYqEiOqVuN4p/dJ9xySxgbNzvuo1hc36rNDj4DldhmZrMFMCxHs3GPShSEh7b
         2WiA==
X-Forwarded-Encrypted: i=1; AFNElJ/NGZISiZMzWMI+scj2I35wYYL0coWt2bUf4cz8v0xgXzCr2ARFueB4xkWaSqpsjl1kicfxHBFPf1vlYC3Ziequ@lists.infradead.org
X-Gm-Message-State: AOJu0YxlegFWtT33pKz7Cn0Z2iHHVbrY2/sQYHh9CaDIxrepbnTFW9ru
	A++E6DdM7UdJudk/1Rw+AIhR4k5AHyij7lDAaN2ssr7W0GIQk2ssmQw=
X-Gm-Gg: AeBDiesYLX4ZQKBjeji+m704hhoQ1XTR/6fMJyylJ3U3HYRZROwMw3dGP1ny4a1NpVI
	mLd+izImXTZJQQEZIHpj/BpX/gi86ND9B3k24QQq3sbssYUe6Solr/dmsYlTCJinNydwGkFPgTt
	oruSYaMnjEOGeUHXlU8+ZMjHCGVSHsk11u1ARfavr+C5G/QtYUuZ0qtsFPEIobICM64G71v7wr2
	KAoBWvTd8eXhQR3FUhHu9/6cG+khUu6YzcwOrEi/hesW787XHgRb7AN7+kLGVbqj9VCZj/f9kHf
	SdAFNNlskvTt4HG9BjHPegWDp7xyJKh0Fh2XM4uCN454E3iiHXWJefNSX+4gM8MPyyHzQ3xAymL
	yIeOWfCfjIqHgw8V2JNHCqsX/6N9qzXDrXyp3T5696Oia/cz6MRwmGFEnw/kSfblHc/TkLPi+Cn
	dt5By0lSPb7B1xU9/5NErQmh/XD3Jf7E1EbD+vxmv7sgemkUVCbKv1L7xFTFuO9gtgBausaHhB6
	pspPcHoiZ0at9EUslLeYrlca1nFjE7l7gzxIudIa6B/Qyk=
X-Received: by 2002:a05:6a20:e211:b0:3a2:ebfc:6bee with SMTP id adf61e73a8af0-3a2ebfc7c17mr28544615637.41.1777207443705;
        Sun, 26 Apr 2026 05:44:03 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7977031729sm23122558a12.25.2026.04.26.05.43.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Apr 2026 05:44:03 -0700 (PDT)
From: "=?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?=" <mhun512@gmail.com>
X-Google-Original-From: =?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?= <pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [PATCH] media: stm32: dcmi: unregister notifier on probe failure
Date: Sun, 26 Apr 2026 21:43:49 +0900
Message-ID: <20260426124353.38916-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_054405_464997_003FE408 
X-CRM114-Status: GOOD (  12.27  )
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

From: Myeonghun Pak <mhun512@gmail.com>

dcmi_graph_init() registers the async notifier before dcmi_probe() toggles
the reset line. If reset_control_assert() or reset_control_deassert()
fails afterwards, probe returns through err_cleanup and the driver core
will not call dcmi_remove().

Unregister the notifier before cleaning it up on that error path,
matching the successful remove path and the V4L2 async notifier lifetime
rules.

The local history only contains a Linux 7.0 snapshot, so the introducing
commit could not be identified from this worktree and no Fixes tag is
included in this draft.

Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 13762861b7..200b498127 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -2063,6 +2063,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	return 0;
 
 err_cleanup:
+	v4l2_async_nf_unregister(&dcmi->notifier);
 	v4l2_async_nf_cleanup(&dcmi->notifier);
 err_media_entity_cleanup:
 	media_entity_cleanup(&dcmi->vdev->entity);
-- 
2.47.1

