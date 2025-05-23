Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3712C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 18:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JJwM01LkCG/wusxvlnvQDOvG5IwrdgN3kZHNf6HM+ro=; b=YtIz+R0S297YzEm7rwN7uoCg4r
	HOBiQNOf1rPx8XoSJcGw7eUZqrXcrXIydVTEsmFXIV9cFIZffw7nZZkTz5TycEo8r+g61Q9fi3Lhk
	eWGbv0ylph1tsFuR8ro/QQOxrU5/wI/R8kOokvPgItu/VPsDXk5ikIQuZp1nL0Av0gzm+qcU4Hkzl
	LailT5DaAVxtrmBBdg7J3HmqGdM4XFOJ3eUNHa65ra2TAe5CjsmLh8FDlSdtB9ZgJUrAx+7F4QtuG
	O15+Fx9qvAVtxRCY1dl0drUvRvEy0w6K22Vz4gE+rmfMKvJyr5cvdbMn3BAx9xYvBKZ7E2Ys9kbz+
	5jgRV7gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXRK-00000004j73-1syI;
	Fri, 23 May 2025 18:48:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXNE-00000004iao-3uns
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 18:44:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=JJwM01LkCG/wusxvlnvQDOvG5IwrdgN3kZHNf6HM+ro=; b=pVoqRoO7FZCCte3ayaQhYdN+T3
	wYzkDO6ljhSM56hxQ/eQeEhb5WTH6max7TNZTirbI/tE8JCBjSa/7JNBZIQAno+w3kRwYzFxpQ33A
	/rTnXbFLgxt1oGEitbwCFv810YjEGgY1vLK+OoQ6+Y6j42sJwopgEjh7WVX7WpgHFgKbl+L/1NXko
	ih1/9sbbPitDiZDmlJGfRdv8pkx2TWMU912lHGQ/8J8/rFavp5XbNJ3BO7EPgkOjJefl1RiE8VqhN
	ZCv7evrd5WTCwLCExbxltWgcr3BLDJE5ZXjvBxTV3vuy3TrydaxaR5F6boHvr1Uxt7isLJP4kWZu0
	DjzkHJow==;
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIXNB-00000001MnC-2JPz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 18:44:03 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 600D3C001532;
	Fri, 23 May 2025 11:43:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 600D3C001532
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1748025837;
	bh=JPmw13LQjUX7dzgaZHyy9hQs9P4b4WDlWaBHH8jMG7Y=;
	h=From:To:Cc:Subject:Date:From;
	b=TUHGx0fRw9QmtMB9S/6+P4mM7cQRL71O21/8jEVoq2Y+kNSldPXCeI//4SHWomPtj
	 rT2fu+uS6B9kxmOz1d0caEmIAogNHn+5th/1a+yPuFB/J7hGxAQ67cSiYXr1IyZBZL
	 4eE6NCOtOyLXjvQUZ0uptYiCnDdW9kO9nbAOxMNY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 00B7C18000530;
	Fri, 23 May 2025 11:43:56 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: justin.chen@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH 0/2] Simplify compatible matching for brcmstb_memc
Date: Fri, 23 May 2025 11:43:52 -0700
Message-ID: <20250523184354.1249577-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_194401_852659_8E159C0D 
X-CRM114-Status: UNSURE (   7.71  )
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

Since the conversation died off in
https://lore.kernel.org/all/20241217194439.929040-2-florian.fainelli@broadcom.com/
here is a second attempt at addressing what I understood from the
conversation back then.

Thank you

Florian Fainelli (2):
  dt-bindings: memory-controller: Define fallback compatible
  memory: brcmstb_memc: Simplify compatible matching

 .../brcm,brcmstb-memc-ddr.yaml                | 51 +++++++++-------
 drivers/memory/brcmstb_memc.c                 | 58 +------------------
 2 files changed, 34 insertions(+), 75 deletions(-)

-- 
2.43.0


