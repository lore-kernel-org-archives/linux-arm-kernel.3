Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E71CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 17:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AoNTFArShrIuErsfoUzGL9W/LuOVl703X8/dX7lKLJs=; b=0/uyiABDEJwAmJXC6sWyyVIZE2
	wlIKHHc08aGVm6R4JQfTwJyEX9+fwXnEi2iQ2K88SQYOrO86qHZTeXupWGiLP0+d3I+MLrQM5u/dv
	BZ5Dw5Zc+vJFl66AeCNeQ2fq0nINx5GFFjivJjK2tbr/fh/yz6FEJJrywckvFhT6UTBGd6AQO/1MG
	mdShLoqCIJnO73WTgTrsMpkVzwTAxc6eKh8ki+FKUvCxC4nnC0s03Z4iLI3K0IS5mXQkrt0fg7Zui
	UykmpKmlnpropHFEGviQPzcDkOvr/K+0oEfeau01B6vRQXpchAnz0j4xk7NnFBoA/8FmHt7FKg5eL
	hOxU6zEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGghi-0000000Dlvp-3SkR;
	Tue, 13 Oct 2026 17:54:22 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGghc-0000000Dls0-2otl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 17:54:21 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6f74f6b46abso1111123eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 10:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914055; x=1792518855; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AoNTFArShrIuErsfoUzGL9W/LuOVl703X8/dX7lKLJs=;
        b=FkGSM29xykmIGfJz44XDc3zveAvMgS99nR+EdN5pGqBqMFgIYniTgMzru0soy1Uswx
         y4bwvF5PK3z3Kov5m1DCWPmwWJ0kaSIW/7xCVsg2TMPDO7f71Ea6ffY21Z8sQcGccHeO
         KUTNR9GP/Vdn1MrzG3hdo7oSU8Es2TS9N5H2EyY20t5pEGd4weMusmadOIgnZ0vUYt7y
         sDMEt9DqZuTfuSQ6gRKFTubnahn3YdRfC2qt+exK27HlORud7mimLQUrViRcyISipURV
         dpY1To8ArLNvVRcIAuGHGKCrYvjexfh6RccnGdCs6DAHTwebweEPHjadWhewZOAMd9Xj
         Z1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914055; x=1792518855;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AoNTFArShrIuErsfoUzGL9W/LuOVl703X8/dX7lKLJs=;
        b=D9+2fT52bwMk0hHGXlq/BHfE62Xng+JqWXnoJALzBr1cCA2Ul9xuaWpqGnQmIJAybG
         0KQl2Wl9aKXmAaGAbylhpwiZto3YnfW698NSwEqT55fJ4YiBFWvy7wBvkMNxM9fMcdC2
         Iugvb81cEpsIe2uQfQvNkG6IjZp8rdaImk/r2ojljAIfQcgaCfCEPu4Y8BVePmnp0alL
         p5lW+/g8/shjILQZpsfUCp4BUIOpOWCYiwDr17wQVUWfQ8ynUploK5/hbwkHA/USf2QG
         xztpRcAEXWBG8Wb+2ka5c/6+500pHMAtLtAnWgIdjDe3VVyEwgA5CSgzxuO0lZ4wRwTP
         j0aA==
X-Forwarded-Encrypted: i=1; AKwUvBzIiK4v27dEacGJGknVUQHupcVvMyTNx7PLoAmQhCO3QNWp71i2ZUcN8O220TKc6XgeLpUPbD0RF3H15QUjubDx@lists.infradead.org
X-Gm-Message-State: AFq9FYJrJfKBoIQwbjdRue6/hTu1RmvgvcvwI8l4691tTnTVJhAxfwwf
	sxXVC4UJDgwQHGPxmF8yfNJeUsIWF/JSBFWHrd7jP/NiyjjqRDKzXJor
X-Gm-Gg: AYBFou0Ckxe95FbYi7Ei2+qldLMvG84VY4YHFuQFu46yH+Wh1J8ZygegZV5qwvJ9Cdg
	qLatHeMzo3+VcdOXp2KrF8JHoMrn6eRIwTPtyPgZrBRwTbn1llOrArj14e5QuPufuZ8mdyikgXg
	SLbgljJq+mQgSwdgwcsbp/pxV+f9vKt7U7RVaTVtnhLqLZIM+NwBMdtHbxZsXwvRXKGn8ff91tc
	+9vp3Ybs/IJvXkYGWfSrRcFkQna++1r/CDO00GyYRNXG2PGyrwZUS9K0j9XK69mlyrHRwmEhEt9
	Pm6Ruti1hpD5jytOJjDDZdrlAMiqs/kvDrQCtlGTZnt+CruqQcQpPtZEkqkfJUl6z03v4gJZS6P
	nSo7n4bhxjySE/DhprauRPuQ95SBphLwebIFOi2XIc60kOA8gbWPv1WGyATFJAAs9pAe4dHk9LS
	rHwhmsfYtBu6zVHklnuXDN/iJ6h0zGIfP2AzIbztvecV7PSLW2rWjQ6RXgN6CoEJHoRibe9/dI3
	0/ypEwz28NpTsdJujdobd3Cu3w+RG8NABV8bQ5+w9m+G7TngaaOLlzjNIIN4sDprHccTs9Pioa2
	3JgjMczYX1IthdNl8H09LPx8nj+4LrfNxFmOBpwVjmItQJsCTYwnEoLizpPLpyLTNryLnJpRJbH
	2nXrPIUBAjNcPCi3lmhZJt1jZGMJPiA6Q
X-Received: by 2002:a05:6820:a292:10b0:6f5:467a:aed2 with SMTP id 006d021491bc7-6f5467ab923mr3853137eaf.5.1791914055335;
        Tue, 13 Oct 2026 10:54:15 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfcabc34sm277356fac.15.2026.10.13.10.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:54:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 13 Oct 2026 11:54:13 -0600
Subject: [PATCH net-next v2] net: stmmac: leave the datapath running for
 normal-size MTU changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-stmmac-mtu-fastpath-v2-1-1e4ce8137689@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OwW7DIBBEf8Xac6kWg2PIqf9R5bDgJUYqdgLES
 hX534vcnnscPc2beUHhHLnAuXtB5i2WuC4t9G8d+JmWK4s4tQw99ie0CkWpKZEXqT5EoFJvVGd
 xMkYqpkk5i9Cat8whPg/rJyxcxcLPCpdfkvn+aDP1DzsqLPyaUqznDgc3oLQOZXBWa+XQEmuel
 KYgpRrIIBntzeGaY6lr/j6ub/KQ/ftyk0KKMI0qqNF4HOXHNVH8em/jcNn3/QcZJUMJDAEAAA=
 =
X-Change-ID: 20260930-stmmac-mtu-fastpath-68813ead3b90
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolai Buchwitz <nb@tipi-net.de>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105416_745193_EC0F3D49 
X-CRM114-Status: GOOD (  15.80  )
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

When both MTUs are at most ETH_DATA_LEN, the receive buffer size and MAC
receive limit do not change. Update the MTU without restarting the
datapath.

This also avoids rebinding a live AF_XDP pool to a temporary RXQ. XDP
rejects jumbo MTUs, so all supported XDP MTU changes take this path.
Jumbo transitions still use the existing reopen path.

Found by source review while working on the stmmac MTU/resume recovery
series. The fast path was tested on Allwinner H616 with sun8i EMAC1 and
an AC300 PHY. The AF_XDP scenario was identified by inspection.

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Target net-next and drop the Fixes tag as requested by Jakub Kicinski.
- Clarify the standalone commit message and how the issue was found.
- Add Nicolai Buchwitz's Reviewed-by.
- No code changes.
- Link to v1: https://patch.msgid.link/20260930-stmmac-mtu-fastpath-v1-1-fd73f378c071@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 56d89a696272..50eaee656cfb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6257,7 +6257,12 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 	if ((txfifosz < new_mtu) || (new_mtu > BUF_SIZE_16KiB))
 		return -EINVAL;
 
-	if (netif_running(dev)) {
+	/* Normal-size frames use the same buffers and MAC receive limits.
+	 * In particular, do not disturb a live AF_XDP pool: XDP does not
+	 * support jumbo frames, so it never needs the ring replacement below.
+	 */
+	if (netif_running(dev) &&
+	    (dev->mtu > ETH_DATA_LEN || mtu > ETH_DATA_LEN)) {
 		netdev_dbg(priv->dev, "restarting interface to change its MTU\n");
 		/* Try to allocate the new DMA conf with the new mtu */
 		dma_conf = stmmac_setup_dma_desc(priv, mtu);

---
base-commit: 05b5019b01fb9443b09ae4ed34af1135a80a84c8
change-id: 20260930-stmmac-mtu-fastpath-68813ead3b90

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


