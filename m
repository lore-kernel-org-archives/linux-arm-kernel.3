Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8C2D2FEED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 21:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRY3d2qgp0x7QYzcmqCOxlY9T2DP5Au2s4d7dlDz17k=; b=EHdaya4X/E24BVptLzuAsq1ovU
	C8sNJsFW719YABPwbBQ9Eh01cnPIYwqXmke5xfa+0yzbN5SeUM/E1rziE75gs63zEH9uS9tWPaKw3
	UQMwm6nfRXOMYgcZQBlVSYO8xDNL0JsDECK8/MqKSQGFqZ7PSGeC+kvZCbxWwBGcb0qxt8GSzo8jR
	U/MCs/664ByoNEWfCuL0ZTU+tQHII/BmKgHmjzoNNfUYzm2+Kj1PrQ5nAFV/N71aNy/Q0M/QO2Ewt
	nT+I8nx24WXvpK/yVHCxLCmBoLwVOvX17ELQUJpc/jmEZfhhsBVPvdpJFVV4MF+NREzOIKBJDtwag
	Of17SFvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqtz-0000000F4nH-1X5V;
	Tue, 27 Jan 2026 21:47:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqtu-0000000F4lz-2klA
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Jan 2026 21:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QRY3d2qgp0x7QYzcmqCOxlY9T2DP5Au2s4d7dlDz17k=; b=ERUlltMUcoDPvlmASuziMiknmR
	VXenBEpAZ+AzC+fA3R9xe3cI/jkFCFIvl+46bQqQcWtsZoHVz2bELaZB7wceQJwUGycpiBCxail67
	pMbCur60nO9V6ttHa5ER/8zIrmlbQoYmff0Urncd8ee2JjK1XleFPH69bejPGZNH5J7CxZCq4meLW
	qJBfj2EXgazLuFp51VYmnatdQ65aFA5T01n2rAWsE8ZLBvdLMFoLQudf4jjxr+tEKC2+btiquKCP/
	pgqRjE3WzO3szLTBkgXSe1yacRMbOIz3DYcb8b1rRaVnV07CKw9StjBTr80qmds8xuIJteaiG1w9g
	VJwn4X0A==;
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqtr-00000007eef-22OQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 21:47:05 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 863FDC0010F7;
	Tue, 27 Jan 2026 13:46:59 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 863FDC0010F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1769550419;
	bh=HTp+Do+BE5EGcVI/v3yRKJyoUKPYpIeDXAWsrGMIs+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JL/m4LRoHff4Yo/FCjV4dCOBQYkMHaUEBiHdlEVKXOc5CBzgp0ZanD+0jig0AY8IX
	 8sz4TfM5lQsSvYPkg0AZbD66m9AmmaKDuo3CVwowxMdroPAYY3du8W/xtCCcnjuu3g
	 Xvh78SO3TFvIh6oa2zwcj7MnbraxNJWYKSQF1bGM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 6743D199D1;
	Tue, 27 Jan 2026 13:46:59 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v2 1/3] gpio: brcmstb: correct hwirq to bank map
Date: Tue, 27 Jan 2026 13:46:54 -0800
Message-ID: <20260127214656.447333-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127214656.447333-1-florian.fainelli@broadcom.com>
References: <20260127214656.447333-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_214703_802941_F380851B 
X-CRM114-Status: GOOD (  14.18  )
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

From: Doug Berger <opendmb@gmail.com>

The brcmstb_gpio_hwirq_to_bank() function was designed to
accommodate the downward numbering of dynamic GPIOs by
traversing the bank list in the reverse order. However, the
dynamic numbering has changed to increment upward which can
produce an incorrect mapping.

The function is modified to no longer assume an ordering of
the list to accommodate either option.

Fixes: 7b61212f2a07 ("gpiolib: Get rid of ARCH_NR_GPIOS")
Signed-off-by: Doug Berger <opendmb@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/gpio/gpio-brcmstb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index af9287ff5dc4..2352d099709c 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -301,12 +301,10 @@ static struct brcmstb_gpio_bank *brcmstb_gpio_hwirq_to_bank(
 		struct brcmstb_gpio_priv *priv, irq_hw_number_t hwirq)
 {
 	struct brcmstb_gpio_bank *bank;
-	int i = 0;
 
-	/* banks are in descending order */
-	list_for_each_entry_reverse(bank, &priv->bank_list, node) {
-		i += bank->chip.gc.ngpio;
-		if (hwirq < i)
+	list_for_each_entry(bank, &priv->bank_list, node) {
+		if (hwirq >= bank->chip.gc.offset &&
+		    hwirq < (bank->chip.gc.offset + bank->chip.gc.ngpio))
 			return bank;
 	}
 	return NULL;
-- 
2.43.0


