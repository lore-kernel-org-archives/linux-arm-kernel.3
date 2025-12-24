Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A0EE776F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 16:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EmCW2e2cZq5LAOZG/KkHZlKm7P+Jz8pzs1nJQI7KyZs=; b=VCgMSv3nIA4VAmBZ2x9GIqc0wD
	fgtECDX2AqcHka68N1shuKQcM1XKtem3qFmwO3rh3ZGXbUQDcGwXxXO1dLC3yXP2Bg1LuMQ+llhbU
	tm44rcpc/1trZztuO+mU7AEmJLVKRx/E8EgZHjS/NafO5tMoLENHJIBsuiqXLbrTZdOJ62KkkDDsj
	szymHMtBbr0xitB4UjqjaoUD9gX3yuMfZMq25knYKMdur/7r3QPrJdoap4D7X+RiudXN1QtyBiErs
	aC/ssclcLbFkKxUI+YFTUcgpn8QxqaFHtElmEIm5ETjyjUIiDsna9rz+n3docoD/kV/ZlJNvMAySz
	VR4kKmUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYSCM-0000000HG1H-0jNJ;
	Wed, 24 Dec 2025 16:58:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYSCL-0000000HG12-1q3K
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 24 Dec 2025 16:58:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=EmCW2e2cZq5LAOZG/KkHZlKm7P+Jz8pzs1nJQI7KyZs=; b=OlDMPFKHigCkQ2Zvm+Yr96Wi8o
	o2E4+9tgWPnqoP4m8joTnypJiDx5aZRXbYcKoHi13XnjBJ9IS4BZFLELkF3WN2JGN2RMPWNuRjZvg
	aeJnteZ1QT2cE1RXVWi04zdcpv1cUp5lHJpid9LsVV0INupSgl32kJSWsX4lbaI959uraCn7P8WS9
	seB16Mjt1nofoUrnn+cYQQthtE3ZdQZyvHY6DC2BVxkynNlQIXrIVKUyJwnrfzeMKLeCBYRSTKgON
	Z1TSeVqdA97zmjQ0IvAnoe9Hs+pCwDLUcnU/ATFzwx92Pks3EId2ayH7R767qxxyImKB2DQcE4pis
	QImwbrlA==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYSCI-000000003HA-1LJH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 16:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766595527; bh=ye+C5uRddAqNX5xzzwVvISOeNHQJNiRYm+Gb5ec+iL0=;
	h=From:To:Cc:Subject:Date:From;
	b=TnEmii2pRmJiCzVgsCXlv1ufwc52f7BrI3VTZHT3+QWI+kbSHX+Bi+A4+TC0zMB5H
	 9bbP+833IPPXYkQfFqT4S1L80UOPY28sI8In9csJ5RgNG5bo/Qrf5+5OqXuZbZk1sa
	 bOZYIoZ6wOMP5gg6ktgPYrd6nv+AeU6qYjTlX1F16hvV0pjqaCAvs0ajKuQT8HFqa6
	 pvHdqDJTGwUfaNB8JzyeQOeNxJBNyzoglkC4s6lF2nycuhBc/oofkCrPykKA9/hFsT
	 bF7ETEPxxWq93EA6Ad6h/tVbMCWU3x2+cKaujdK02jHGWxDKon3KNcLKgQ/wSNc6tF
	 TRHITWmRGhqsw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id D37E13E8A84;
	Wed, 24 Dec 2025 16:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766595527; bh=ye+C5uRddAqNX5xzzwVvISOeNHQJNiRYm+Gb5ec+iL0=;
	h=From:To:Cc:Subject:Date:From;
	b=TnEmii2pRmJiCzVgsCXlv1ufwc52f7BrI3VTZHT3+QWI+kbSHX+Bi+A4+TC0zMB5H
	 9bbP+833IPPXYkQfFqT4S1L80UOPY28sI8In9csJ5RgNG5bo/Qrf5+5OqXuZbZk1sa
	 bOZYIoZ6wOMP5gg6ktgPYrd6nv+AeU6qYjTlX1F16hvV0pjqaCAvs0ajKuQT8HFqa6
	 pvHdqDJTGwUfaNB8JzyeQOeNxJBNyzoglkC4s6lF2nycuhBc/oofkCrPykKA9/hFsT
	 bF7ETEPxxWq93EA6Ad6h/tVbMCWU3x2+cKaujdK02jHGWxDKon3KNcLKgQ/wSNc6tF
	 TRHITWmRGhqsw==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 4DF5F3E837D;
	Wed, 24 Dec 2025 16:58:47 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] ARM: dts: lpc32xx: minor updates to NAND controller nodes
Date: Wed, 24 Dec 2025 18:58:43 +0200
Message-ID: <20251224165845.1261926-1-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251224_165847_885325_B1F015E5 
X-CRM114-Status: UNSURE (   6.57  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_165847_885325_B1F015E5 
X-CRM114-Status: UNSURE (   8.23  )
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

The changeset contains two minor updates to NXP LPC32xx NAND controller device
tree nodes.

Vladimir Zapolskiy (2):
  ARM: dts: lpc32xx: change NAND controllers node names
  ARM: dts: lpc32xx: describe FLASH_INT of SLC NAND controller

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.43.0


