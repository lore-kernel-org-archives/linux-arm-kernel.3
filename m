Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84BDE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 13:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdYG3515FjwwJEDl4jTuSFQq09fY6x8Appn7iagJwnA=; b=qIptGRunQ3/S/IbFdh64qb7LQk
	lUU7W2ng9DCbqgmKDJWH0Bm7Ed8WwRBfXBph2ErOPMh6JrkE/0t7GWkaZquFDYphIqEj18iFl7vQu
	n1VYnvBTM+tRGhfXe6eV9JtLpq7Q7Uu9mrND0W3ysSUC6Mco38IYlgeG8ViIDquGeP0oyMtWEZmM5
	kFpbM8dqWOO7vy+G4R7s8J6prE2jqrlYQejnWJVjuw23i/8vwBWOK+8rHkeClMWMb7sAJjJxn8sIX
	7x8q9+ni6RWBG0iXFpg9jvh5R1GA8oQjo/FJdguXMxibkBuRioJv2GGkKyU49TEmnkKnAJdY7PXqF
	hHqwngLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCOP-0000000GGAo-06Jj;
	Thu, 05 Dec 2024 13:59:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCKR-0000000GFAL-10BN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 13:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733406939; x=1764942939;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=0oKgcrkZi8Q7zAmrkKmMg4EAU89Jf7N07xhOp2/GiHA=;
  b=eUx3Q1Xqx4Y0Km9TQYE/qTTY7zoYQuab34gZHaWu7B+EmnleikMIxPmx
   Hcf0EtSXUE4qJmhFsmxNwVM4AnjOr7xS94t2StIdIJxhiMAL4KgT+Zq44
   SEQKJcr0jPSfFK+wcQwmQ9g/e1IxLbQfi4/Wv/2odAZ2cwG6bARow/0Wz
   qJ0Qpv5BWNq+CyjfYNoL+F31ATyTYy7g/9PqnRbs9/KrJ7yQghU3te9uh
   wXATL5y19FrYa3FWJkWpbXx64YgOFe8GBEAYk+Rf5ntof3KJKf6/2+ktk
   70X2LkCOKXihuoNycwik0JHh25bp7rTf7W6V5Fjvh1g03UjJh8HPNCyyR
   w==;
X-CSE-ConnectionGUID: 7ioOcpSzQfuJnUZ0WQ6I1Q==
X-CSE-MsgGUID: 6MGhBgw7Qlie2uWE/2VadQ==
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="34869392"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Dec 2024 06:55:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 5 Dec 2024 06:55:33 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 5 Dec 2024 06:55:29 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 5 Dec 2024 14:54:27 +0100
Subject: [PATCH net 4/5] net: sparx5: fix default value of monitor ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-sparx5-lan969x-misc-fixes-v1-4-575ff3d0b022@microchip.com>
References: <20241205-sparx5-lan969x-misc-fixes-v1-0-575ff3d0b022@microchip.com>
In-Reply-To: <20241205-sparx5-lan969x-misc-fixes-v1-0-575ff3d0b022@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Richard Cochran <richardcochran@gmail.com>,
	Bjarni Jonasson <bjarni.jonasson@microchip.com>,
	<jensemil.schulzostergaard@microchip.com>, <horatiu.vultur@microchip.com>,
	<arnd@arndb.de>, <jacob.e.keller@intel.com>,
	<Parthiban.Veerasooran@microchip.com>
CC: Calvin Owens <calvin@wbinvd.org>, Muhammad Usama Anjum
	<Usama.Anjum@collabora.com>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_055539_350598_F90EC3B4 
X-CRM114-Status: GOOD (  12.21  )
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

When doing port mirroring, the physical port to send the frame to, is
written to the FRMC_PORT_VAL field of the QFWD_FRAME_COPY_CFG register.
This field is 7 bits wide on sparx5 and 6 bits wide on lan969x, and has
a default value of 65 and 30, respectively (the number of front ports).

On mirror deletion, we set the default value of the monitor port to
65 for this field, in case no more ports exists for the mirror. Needless
to say, this will not fit the 6 bits on lan969x.

Fix this by correctly using the n_ports constant instead.

Fixes: 3f9e46347a46 ("net: sparx5: use SPX5_CONST for constants which already have a symbol")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_mirror.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_mirror.c b/drivers/net/ethernet/microchip/sparx5/sparx5_mirror.c
index 9806729e9c62..76097761fa97 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_mirror.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_mirror.c
@@ -12,7 +12,6 @@
 #define SPX5_MIRROR_DISABLED 0
 #define SPX5_MIRROR_EGRESS 1
 #define SPX5_MIRROR_INGRESS 2
-#define SPX5_MIRROR_MONITOR_PORT_DEFAULT 65
 #define SPX5_QFWD_MP_OFFSET 9 /* Mirror port offset in the QFWD register */
 
 /* Convert from bool ingress/egress to mirror direction */
@@ -200,7 +199,7 @@ void sparx5_mirror_del(struct sparx5_mall_entry *entry)
 
 	sparx5_mirror_monitor_set(sparx5,
 				  mirror_idx,
-				  SPX5_MIRROR_MONITOR_PORT_DEFAULT);
+				  sparx5->data->consts->n_ports);
 }
 
 void sparx5_mirror_stats(struct sparx5_mall_entry *entry,

-- 
2.34.1


