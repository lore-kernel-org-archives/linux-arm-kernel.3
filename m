Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EE2CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uEVCQNe7Z8PP1dj2Uy0GdUcjkY+sPIZ5Fatwms9mp+8=; b=wnsdcOhlcDRYhx0vnaSdxR+iyZ
	JdcHN22yO8bDFdOqP0C/mk1wlTmp56wJaaUZfTqTiBIfC5QZ2CKKnoEz7jiw89UQHyj2ccZ0mNVhb
	35AUbf4vb4fhTesDRFpBMVabjjfoNN2JKFCelzRLRRXF3U104XImzxAnX+jrkIPhd8a7dy2OSvgOQ
	lYsg8VxVKawYnC/8EaQtNwCDOJ91hNttKXFd7En5SlZqKO9RFMSvN04VRcY0e2vAiGeOcKoLxj5Yt
	h4t5nsPwBuB24QOVzwZpvjYHcf1swtv5hnQK270tlp7xf8ttA+TN6N4BrudFUbzWNZs3s7pBSVvj9
	lrGxVPZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWfw-00000005epW-1D1l;
	Thu, 14 May 2026 14:04:32 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWfu-00000005eoT-09Td;
	Thu, 14 May 2026 14:04:31 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wNWfa-0000000043n-073v;
	Thu, 14 May 2026 14:04:10 +0000
Date: Thu, 14 May 2026 15:04:06 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
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
Subject: [PATCH net v2 0/5] net: dsa: mt7530: assorted fixes
Message-ID: <cover.1778766629.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_070430_076868_B873A6F1 
X-CRM114-Status: UNSURE (   5.46  )
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
---
Changes since v1:
 - rework patch 1/5 following up Paolo Abeni and Sashiko reviews

Daniel Golle (4):
  net: dsa: mt7530: fix FDB entries not aging out with short timeout
  net: dsa: mt7530: preserve VLAN tags on trapped link-local frames
  net: dsa: mt7530: fix CPU port VLAN not being reset to unaware
  net: dsa: mt7530: clear flood flags on bridge leave

Edward Parker (1):
  net: dsa: mt7530: untag VLAN-aware bridge PVID

 drivers/net/dsa/mt7530.c | 165 +++++++++++++++++++++++----------------
 1 file changed, 98 insertions(+), 67 deletions(-)

-- 
2.54.0

