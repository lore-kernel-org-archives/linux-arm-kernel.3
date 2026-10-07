Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CD9CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 15:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IVrx7T4/vrI8KI74E9jyOtkR9pHzDOzupXTVhYrmKwk=; b=gBY26Qn+dzkYTAsSO25x0Nk7jg
	0UWapbJLXq1XOdYfuc1pg2amCJxTg956S1NkrtKHdfDUv3VpBEQrq1QN+W1VVZuoKIj6YaVKwD4l4
	YM88DSvHbN/Rwh10bIyXQi92wMFs21QzkjagLOGx/bKcaM7T3cw9mYOHxHV8w3G2k+QhgcDukeaw7
	HNOrSUfiKTK4fEYW2Wy+bLMWEUxNaQwqImjwD33U7fhz60StVEd7XDN5ju6Izw/EiUTk83hZm3ifN
	C/nxw7nLxoMwG+M4i3X2+kCFUV5MCQ9iXHONUxv6TritrqxJnAhkxo/RDGXRtm1YkJgKZ4fn5xBRy
	lmd+N6lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETBG-00000002fvh-29FE;
	Wed, 07 Oct 2026 15:03:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETB9-00000002frF-0Qcu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 15:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791385415; x=1822921415;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=bRxyAyeMyuT8X1aAIHRubCtQCl/UpGFQpunpCnzKtNs=;
  b=s5LZjJfep9gYJmCfCYP343cSgr8xJ2oo9eZHBt0j1pYTvTdg/wXCcb3c
   GLV+9rSA6a2Ya4inN5MWyEoQEUntsRYqGWkfYAX1KN7o60/N1BpX5eLF3
   Xx0P/0V8ip9Z+eu1ovVRbTWK3gHGKRR+HtNVkw24vIjawtvB0yDzNuNhK
   QdvexdFl0XonJj0KSc6HkpHiAYw7kytXRhh8MFvPSMsoOu075sp3/Xrp7
   OLDNo0qx2CN4x0TOpTp4xLXO6pJupG5bHICOepnYu9Nv6YYTFCO+6o2Kl
   gesLVfcWBmkOPnnSnVUSxDoWsXQWGDo1OzIGhRnwEVryfHYEvcv9kexb8
   g==;
X-CSE-ConnectionGUID: lFivHuwqSOyVpuk07g+c1A==
X-CSE-MsgGUID: s4qJiHJATZuOqn//qTJG4g==
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="296120675"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Oct 2026 08:03:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 7 Oct 2026 08:03:32 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 7 Oct 2026 08:03:30 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 7 Oct 2026 17:03:15 +0200
Subject: [PATCH net] net: sparx5: free the matchall entry on destroy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261007-sparx5-matchall-kfree-net-v1-1-c8918685b337@microchip.com>
X-B4-Tracking: v=1; b=H4sIADNfxmoC/x2MSwqEQAwFryJZG2h1/OBVxEV00hrUVtIignj3C
 bMsXr16ILIKR2iTB5QvibIHgyxNYJwpTIzyNYbc5VXmXI3xIL1L3Oi0fV1x8cqMgU8kT8M4FL4
 qmw/Y/1D2cv/bHZgA/fv+AI1UnnFwAAAA
X-Change-ID: 20261007-sparx5-matchall-kfree-net-afabcb3f6584
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Kees Cook <kees@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_080335_219937_2E9FDA72 
X-CRM114-Status: GOOD (  10.92  )
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

sparx5_tc_matchall_replace() allocates a struct sparx5_mall_entry for
every offloaded matchall filter and adds it to sparx5->mall_entries.
sparx5_tc_matchall_destroy() removes the entry from the list, but never
frees it, so the entry of every deleted mirror and goto matchall filter
is leaked.

Free the entry after unlinking it.

The leak was discovered by an AI code review agent, and reproduced with
kmemleak on a lan969x EV board (EV23X71A) by repeatedly adding and
deleting matchall mirror and goto filters. With the fix, kmemleak no
longer reports the leak.

Fixes: 1ede4acf045c ("net: sparx5: add bookkeeping code for matchall rules")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_tc_matchall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_tc_matchall.c b/drivers/net/ethernet/microchip/sparx5/sparx5_tc_matchall.c
index 702257979462..146d7f28e8f3 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_tc_matchall.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_tc_matchall.c
@@ -160,6 +160,7 @@ static int sparx5_tc_matchall_destroy(struct net_device *ndev,
 	}
 
 	list_del(&entry->list);
+	kfree(entry);
 
 	return err;
 }

---
base-commit: 23609bce9e1de525d1d0e73fc68c6e7971d0b49e
change-id: 20261007-sparx5-matchall-kfree-net-afabcb3f6584

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


