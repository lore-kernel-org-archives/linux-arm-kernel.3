Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E859CE7A97
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 09:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iCcUl7mObBKcyatST9e6V4eam+xl2MxsbVpgWLPjrOk=; b=kjuPx/uIPq5bApoduLJURrmpH0
	Iu1qUfEJowfOrpK/t67LD9FxXUiE3hWadGSL9I959AUSyNUbnjSyL5ZhBbCkglX1XNseOe4daqVbC
	EXH3PsGfiKCLZFA8SUVvPtpzyPowBe5ADr7z1Ho7Ha4TrJ5biYaeeiS/QmRuHbLH9HqRQNOXo0B9j
	mrSCoOztg3JC+NM+S/cbqLl2PDWUf65pmKJBc9g+1fe/6LB+Sbg8UbPSKDUpKjFFWGuXFCuxl9AU4
	YTVoNRTSwQdTGc30X+M8jaF7Dfv1WpB0JMwGd2kARqNulAFDm1CDt+0BLOz3jB/y/nbNPqIDb7DhD
	H6ivFhbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpoY-0000000Brj8-3Uo9;
	Fri, 14 Nov 2025 09:09:54 +0000
Received: from mx-relay50-hz3.antispameurope.com ([94.100.134.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpoV-0000000BriC-0IKG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 09:09:53 +0000
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=iCcUl7mObBKcyatST9e6V4eam+xl2MxsbVpgWLPjrOk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763111383;
 b=tT9065L3gJenlWFIKFRnHsY7FrlPBgoHMqLiWsQrSTYJQppfg5U6qRNJixqZU8+efqw1eg0K
 fLyY3Kpj+cNz2ag5JpScu9FgzepoS+oYoe2P80AxNuCRN0NBYEgv2SiZrTV2GxzrUQNqsgkP45Q
 wp9t8TJ9hA1hFLRU2t/426f5fKiIrMvl4oq8ln7fUkadZZRx2tg+zwfymwUcBI3DKhE+wZ2yDNB
 WwhVIxqT00YILQhoAGV9PdQdWbTdunPTYxh19ydP6zXIWreRqBYiJWBQxuBEg0lqa1qSWMo7Fxl
 EweiszWagDQTngRJ20MH0nYUMtrZPC2Y1TtqUSEYvQbbw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763111383;
 b=BrwntfhugQiJYWe964vEbJ3oqA7St7j6iIsQ1eAk10nN+fxv1mbz6BEW6pEVfuWNCRznZskn
 KLYBA+DWufGFjvQzQrBdlIp45QHfe44NLZuM42zDH6sxBr3fj/gw1uyXHKo0L76TtF6oLaeuWrB
 TRiyE164kWtukaS1xppG2WzvmpjHtPYL8EQG7j7vGD6IUf9lkMo2soefMILfC6OH1+uXcl8NeS2
 SgU1ruyPK66vvuZGM3mQu/GQavE12RifsZxr+0SEjdZTVwqTkbpmnYD6mdU45c3mehZ6NEI0O6E
 AinpALGfU+iS7VXYmvv8ZKTfDaqPg7tsxXDh+tdYXz2DA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Fri, 14 Nov 2025 10:09:43 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 479EEA40F56;
	Fri, 14 Nov 2025 10:09:37 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/2] clkdev: improve ID length error message
Date: Fri, 14 Nov 2025 10:09:32 +0100
Message-ID: <20251114090934.1471533-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4d7BD14nV0z2nHBD
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: aaff629fdae590416fb6f4fa6334fecb
X-cloud-security: scantime:1.892
DKIM-Signature: a=rsa-sha256;
 bh=iCcUl7mObBKcyatST9e6V4eam+xl2MxsbVpgWLPjrOk=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763111382; v=1;
 b=WzZyjjJ4h7RCYNCDZprTbx/9w9Bts/NFZm/NZomLGaAyR3fwVi4OCc1OTjbbHteAG8AaMawh
 q9ARlKubThR1NCcqdBqCWrfA7od4f7QBwXesTQ9BEDhsFeY86/aK79WHIdeJnlJkpx0xxXzchZ1
 zmXOCNMd22H5aMmY8C9KFdr2MjMALHNZMH67rJxye5+ZqLRd2G4heDbtTgFxPsdxfS+OBdrHqEY
 MJmH9MqoiDR3010TqfQ9+JR5SWPeAoMzdpl8rwhda/bB6z4451ZTGPmAV5PvO5AtsL8z79w/Q8M
 lUE9BbtXwjIm0rqlRY7wsCbdbSEo1GH5Qn0mtlWtSPWUQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_010951_358335_3B608DFC 
X-CRM114-Status: GOOD (  12.94  )
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

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

"is greater than X" is very unclear if you're not familiar with the
code. Change the wording to "is longer than X bytes". In addition, add a
space between device and connection ID to make it easier to determine
which part of the ID is responsible for the length.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/clkdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
index e0bede6350e11..f46324622cca0 100644
--- a/drivers/clk/clkdev.c
+++ b/drivers/clk/clkdev.c
@@ -201,7 +201,7 @@ vclkdev_alloc(struct clk_hw *hw, const char *con_id, const char *dev_fmt,
 	else
 		vaf.fmt = "null-device";
 	vaf.va = &ap_copy;
-	pr_err("%pV:%s: %s ID is greater than %zu\n",
+	pr_err("%pV: %s: %s ID is longer than %zu bytes\n",
 	       &vaf, con_id, failure, max_size);
 	va_end(ap_copy);
 
-- 
2.43.0


