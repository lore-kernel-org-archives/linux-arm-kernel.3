Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84050FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ewlfab5TlMI3g+5lyde8COFy0B8myj0hnkYTWeKU9os=; b=n+JkjrU7/vddmVvLIsTQcqX5Bh
	jbrcg2r0evw5hT5MB2DRHJX6K0DRPqAvbzvX5GgLl4sr9/6jstsucqTsOwnK0acT064xkkbZbsQOP
	jo/AljVA+Wa0O+Q6cJATvk9sTABfhu7+NFEx5qV4u9xFFv6oERQeOpFNqORDZ69GiC6/gtvYNvqh9
	sjrftSxMJXaHukAykZc8fv5Fyh71e9vDpQyubGEFvVnJC9N1mpX9palo5TrIVoR9BLUKvLedRDpPv
	ZSBEdmLTz+j6LysOFlu1CgXIHKAHsrIq266xuGMHLmAciMIA6P1NvpqbRP3fC8E7yqaPqSK1Ku+Mn
	GQU3Ed2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGZD-0000000GTGC-2O5j;
	Tue, 05 May 2026 14:16:07 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGZB-0000000GTEs-1J6O;
	Tue, 05 May 2026 14:16:06 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wKGYt-000000008Q8-0upW;
	Tue, 05 May 2026 14:15:47 +0000
Date: Tue, 5 May 2026 15:15:40 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Edward Parker <edward@topnotchit.com>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net 0/5] net: dsa: mt7530: assorted fixes
Message-ID: <cover.1777986341.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_071605_352931_FECD4F01 
X-CRM114-Status: UNSURE (   5.69  )
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

A batch of small, independent fixes for the MediaTek MT7530 family DSA
driver, addressing long-standing correctness issues that surface on
hardware with bridge VLAN filtering enabled, on link-local frame
reception, and during bridge join/leave transitions.

Daniel Golle (4):
  net: dsa: mt7530: fix FDB entries not aging out with short timeout
  net: dsa: mt7530: preserve VLAN tags on trapped link-local frames
  net: dsa: mt7530: fix CPU port VLAN not being reset to unaware
  net: dsa: mt7530: clear flood flags on bridge leave

Edward Parker (1):
  net: dsa: mt7530: untag VLAN-aware bridge PVID

 drivers/net/dsa/mt7530.c | 153 +++++++++++++++++++++++----------------
 1 file changed, 90 insertions(+), 63 deletions(-)

-- 
2.54.0

