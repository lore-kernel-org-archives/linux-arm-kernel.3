Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EDCC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 19:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DYFrXGjlvtshGh6uTDLzwFW8Ia3Piduo4Mx7nxDTOKY=; b=w5WWOno/nxhfpUcCqdf3wdhxll
	38SjCzDTSuDffZLJeM8ZJBSsr62vsYqLzwcJjm91jNq/zrw8sKfgLHPk1yRnozdLIipJzQ5kGrMeY
	5+05wEbk7843VuN1+oF+41Zx2ZSIzxh1MrtHMnxaKgJwHyZIhcd4BNZnpGPWJ5ZkE5DzPohZXLBu0
	un6S34e2EDNxmwBzyOqZxZpc/UKuA8UlE2TpsJClqkMUXFSWyyPT6WXS2tAuFVuGmE6EBgcn+PBpv
	lmq5SdPUlk5XYzn41x4T2L6O10IxK5v34Tfq3zpvC6HDVrGLs5RKtMZiUchgEUiaGFBSKlhpY/fdE
	ElPQ8THQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Hmj-0000000CL0H-1tlF;
	Thu, 17 Sep 2026 19:28:41 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Hmh-0000000CKzl-1QnW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 19:28:40 +0000
Received: by mail-qk2-x10.google.com with SMTP id af79cd13be357-93910ad2273so146093485a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 12:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789673317; x=1790278117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DYFrXGjlvtshGh6uTDLzwFW8Ia3Piduo4Mx7nxDTOKY=;
        b=IeqSrEFXEn66PA4rpm3m9rWUnBpOfVRZEBzJ1HSBn/g4pRCqGB8fC5RL7p1XsL6AVP
         07wpmEVYGG5KeHObZAjuCCQRJ0YIRRfj0O5Xjl+wIbnjbP+zP8V2LyyUq0MCy5usG101
         NHeOtzG0BM+GrrnpAQqzKDpbmN0w61crRRYIs4AZwO/O8ntRUN6HASWbj1dt1hsh6awU
         rHEFhOSj8yzkqesKx/g1Ulnv+o+tj+KjcKFJy7kI2un9ahf5GkCz37Zd3Lz9j4SHGPvq
         L2lGdVBa0aP26ve1VxRD32Ev2CGqWMfRYzfMfmCzhN38DAb+L+aKBBnnoEty3n9IEmqz
         XC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789673317; x=1790278117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DYFrXGjlvtshGh6uTDLzwFW8Ia3Piduo4Mx7nxDTOKY=;
        b=ukmYQhOv9KAt+NdR6JBvfV0RGP+U/YxIWoRhHSoBT7z/xrKKiju8v40DjBjqiJiNWU
         XbtpMmCk1V8UgziSTWB2mcjFVNs5qKeaZoMl74gkqkia3txGxitAXmwj/OyxGZtQogS0
         QIsY5fCfF63OF3qw43fBtw0W29L7NtJ979uYgFI6GcGspB6ACFyRMcM0zGkPYLElarII
         TP2jfHdySS4WMtfN88Qo222Ev/cSDSU6gR42immiaiY1IIzcRIAhrQ+LVSjVkHDfEx+D
         V3uvt18bBPqroga6NSXcytUxQWRwNM4hpjSxTJrW0zVQ3CGdrMwisfzOYcW5XOgRwYBv
         7dLA==
X-Forwarded-Encrypted: i=1; AKwUvBy+mjKKMPMO2lUK4AHoOykUWKzZTkUhFjf4DtVcC3SXNkL08HFD+Wl1QbnJXZzlgh17bh2x4cq0FgTBMPA5U7Nq@lists.infradead.org
X-Gm-Message-State: AFuF++nQ6TprfdvTbTKCHqWNebF0JH1+jhIUJR+FwErkh2yBX1wX+Sxf
	2skdtxgc73RrdXGs2WnflBNAytdj/H9Zi5NnBljwZ411A1t8XbvF9LA=
X-Gm-Gg: AYBFou3E31V9ej+ptzykMpcGRKEjIcMPL9VF1R/anUbKe8nv/67paSqayE+R8hv/tnn
	JjN3LkKdqrK3wrU3OhBvmcEmY8P2jxwTq9BiaYe9Ie/kzfyym26QJQ9Lr2bGKumi6QEs2CXyw7m
	tlGE4JaHW2vqGD4ypHpHDq2DfLpdWAxP/OJ18C43dBlmojbW2LMjVOmxMj5HVV4ld7R7AHz2OAO
	qldFyEe/KA/10sZAoGSGmHBX0NJBrMnz6ybUOpUiLcbuwW7sYY13Kj0inBWeec19soF857CWMth
	E4b8srjAG63J9ykF5h6WJuofawq9RVOBPHtN+LfGJKf46TiOjk0QmGFeIDmEqNWkVVxmCAQZvm5
	ey9FwMbIbbRojGc2WsUTBOb6AsiDDvL9PASvGav86MX0zSu1ajNgcNL0EfCVHTgbxsGnzGHhmFi
	tK50z8apiMPu32AspKzMPYgk+ivFRIRDvxzM33i6i7xNymWPQQP/tRYMh5gnzA5PfhtMWSLUhrr
	kN/mz51SbhZC2EeSeLWKRfDmdAZp1/OFzQl3Uu4GIdI6H3s6aGpiwBVBsrddCyKjaHsnRhx+IPX
	oxTePqhKWk/BvqL+Zj3BCypttVYCFddrI0fq
X-Received: by 2002:a05:620a:6cc5:b0:939:ee44:36bf with SMTP id af79cd13be357-93bb785b995mr1306780385a.29.1789673317506;
        Thu, 17 Sep 2026 12:28:37 -0700 (PDT)
Received: from localhost.localdomain ([104.39.169.225])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b78255316sm525568085a.29.2026.09.17.12.28.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 12:28:36 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [PATCH] net: gemini: Free the shared queue after removing the ports
Date: Thu, 17 Sep 2026 15:28:35 -0400
Message-ID: <20260917192835.58126-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_122839_388878_FA1C235B 
X-CRM114-Status: GOOD (  13.71  )
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

The software free queue is shared by both Ethernet ports, but each port
remove callback frees it. The parent also frees the queue before its
managed child devices are removed. This can free the queue while a port
or its threaded free-queue IRQ handler still uses it, and free the same
allocation again when the children are removed.

Keep the queue owned by the parent. Explicitly depopulate its child
devices before freeing it, so both ports are unregistered and their
managed IRQ handlers have been released. Disable the free-queue
interrupt after those handlers have drained, since the threaded handler
can re-enable it. Only clean up the queue if it was allocated; it may
never have been set up if neither interface was opened.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 4d5ae32f5e1e ("net: ethernet: Add a driver for Gemini gigabit ethernet")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/ethernet/cortina/gemini.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index 4c762229ce42..e493d495f2ef 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -2364,7 +2364,6 @@ static void gemini_port_remove(struct gemini_ethernet_port *port)
 		unregister_netdev(port->netdev);
 	}
 	clk_disable_unprepare(port->pclk);
-	geth_cleanup_freeq(port->geth);
 }
 
 static void gemini_ethernet_init(struct gemini_ethernet *geth)
@@ -2656,7 +2655,10 @@ static void gemini_ethernet_remove(struct platform_device *pdev)
 {
 	struct gemini_ethernet *geth = platform_get_drvdata(pdev);
 
-	geth_cleanup_freeq(geth);
+	devm_of_platform_depopulate(&pdev->dev);
+	writel(0, geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
+	if (geth->freeq_ring)
+		geth_cleanup_freeq(geth);
 	geth->initialized = false;
 }
 
-- 
2.47.1

