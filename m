Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1907CD5BCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 16:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HgFJtnSFNiMRTC4LNx4NYBSkAMmh+mNS1Bra8QUfICc=; b=VYXsIw9m5Q0YDHwGnKU/6QpwoD
	a1WBnC+UmEferxTD2lpMt7YhZB/wALmnSYLECjRSRwzzcF9TormZrmDRUOI9aXwbnrXw3qbaHivH4
	Yv124z3aDmaMP/XHVEuYObXN/7g2MMYl961rH4lOVzfB0gnzrO0XEo08sqPG6MV7nV6gkG8iJGLwJ
	PIN8n28/p+gTxk+QE1GVa66X9k25ZA5/gG1rcM19VnA76y6VgeMSR8qm2V2RMBDiDTlnUlpiPkEQ0
	u6H0PShqPAWUPIDL8CW2DVRkVKGvI4S9nBnheEs3W038fA0RAZEY2KZYsnRvrGujJ9ibilE+KLoj9
	2M3+cOwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRYOI-000000002SG-182y;
	Mon, 25 May 2026 16:42:58 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRYOF-000000002RU-1r0B;
	Mon, 25 May 2026 16:42:57 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BE89D27171;
	Mon, 25 May 2026 18:42:45 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEVQqbO9kel7; Mon, 25 May 2026 18:42:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1779727365; bh=nNMX0r52iXD5q0YzE2K8/63rE+wmM6rfQbTC8xHdIE8=;
	h=From:To:Cc:Subject:Date;
	b=HZ4LR5KkdMebppz5VHocasrJtT4+D1X/NaRhwlcWhjcPfZ3/PvAd5wOV8mThWiOut
	 fxvoyHy0LPy8/Nz6gRMFiobwqS91mgi4wcpq3S1WK83Yaa01oGEEt5jBOJRTQnl5C1
	 4xsvTyabXnjlFcnjBRn1dYdxTUvvl5/OeK8GkwI9oWJfcbAOOjHwr/RMEjBo8mBJEM
	 e36ylwIUeLl8XpbLesxNL3S54q1z6NYl+ifnf3nRKcZO9DhtQVPzvzk7LFViF+aHpS
	 8MY5n5Vfx7y0GSSHXDHh6eaYfE3hoOCyiLhZcbeXFTsWudMmbd7DOSFug30i/R972o
	 5wyWw7y8jrlzg==
From: "Marco Scardovi (scardracs)" <scardracs@disroot.org>
To: linusw@kernel.org,
	brgl@kernel.org,
	heiko@sntech.de
Cc: linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <scardracs@disroot.org>
Subject: [PATCH 0/2] gpio: rockchip: fix resource leaks and teardown bugs
Date: Mon, 25 May 2026 18:39:37 +0200
Message-ID: <20260525164230.43307-1-scardracs@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_094255_912064_7454C13E 
X-CRM114-Status: UNSURE (   7.65  )
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

This series fixes several resource leaks and teardown issues in the
rockchip gpio driver probe error paths and remove() callback.

The patches included in this series:
1. Convert the main clock (bank->clk) to use devm_clk_get_enabled(),
   simplifying the code and fixing an existing clk_put() leak.
2. Fix several teardown bugs and resource leaks:
   - Fix a reference leak for the debounce clock (bank->db_clk)
     by properly releasing it with a devm action.
   - Fix a potential kernel panic on module unload by unregistering the
     chained IRQ handler (rockchip_irq_demux) in the remove() callback.
   - Fix an IRQ domain and generic chip memory leak by calling
     irq_domain_remove() during module unload.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>


Marco Scardovi (scardracs) (2):
  gpio: rockchip: convert bank->clk to devm_clk_get_enabled()
  gpio: rockchip: fix teardown bugs and resource leaks

 drivers/gpio/gpio-rockchip.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

-- 
2.54.0


