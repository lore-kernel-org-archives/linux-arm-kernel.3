Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C9FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 10:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l+NtimwT8LtET9ltoWe3CTqwLfm5gKxklcVIjcxmFb4=; b=QjedWrQoiHSYnbIUqg0maQaTo4
	rdRoWx/AHOdfzPStj+MJJxgkejKOKVpArbo3uenAiOiW1NDN9o6FUearYN+BDjXpWmlfYa6BcXggl
	j7GhGpCuB+8bzk24FXR5Nq8axDLY5e9bdSG0P7I3RToSCnYkwVpF4VlC3YoJgw1uvP5QSxuIhv5PM
	Kf7okLk5fRWVqnAvnuaMCZJGa8eWEE8RjEwLgraiGD100k0NT0UACJCGwygg0+1d5BWNEX2LwchMX
	Kz2e8c+AWSTxk03Dcmx3PQzH2NpN9v9FMtcM7R7oT+jUgAXvDdlkZiFfnSYXPF3Ntz1Cir5QRNKto
	Um+cMreA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuU8F-00000005Ut9-3JQv;
	Tue, 18 Mar 2025 10:25:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuU6Y-00000005UJF-0Yre;
	Tue, 18 Mar 2025 10:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742293403;
	bh=cuaiaBEmZrkvp5X3aKQpBO5ytwvUyVSrBJ6UM1NIhYs=;
	h=From:To:Cc:Subject:Date:From;
	b=XZpRy8Pmfg6bVrMTa33iLZFwQtrbcwV+GzjuWghlmwKnAoHM2OjNmPhWQVcq7kPcS
	 mfm0FuVScYgKpNfKuvZ6Z7hwl4aQ/vPdXi3bpbUwqt8Lzmt7uQoJY3dLZRU8rRKUUS
	 R/d5mM/4tyCpThjFA3E1plcPohSn8XxwgCylB0ErmjiIMhigrHGLH41zNkYu0DP1G1
	 bIOYS62dtGgl+gBqnsDQEfGonh/aGqDoCpryb1soZI1Q+8PvAQCWOsO0gYbgg+mtOV
	 lfWrUwTKKEflWWi0ixIRK/ravYOr6tTRFFyMEQJw2u7T7MreH/9PnAM+ShVzF56RT9
	 yRWyNGd7XM3Eg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:79a1:e959:3816:993])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C875517E00AC;
	Tue, 18 Mar 2025 11:23:22 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bleung@chromium.org,
	tzungbi@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	nfraprado@collabora.com,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH 0/2] Use ChromeOS DT hardware prober with MT8192 Spherion trackpads
Date: Tue, 18 Mar 2025 11:22:57 +0100
Message-Id: <20250318102259.189289-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_032326_372880_141BBA02 
X-CRM114-Status: UNSURE (   6.76  )
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

This series marks the trackpads for the Google Spherion variants as
"fail-needs-probe" and makes them compatibile with the ChromeOS DT hardware
prober.

Laura Nao (2):
  platform/chrome: Add support for Google Spherion in HW prober
  arm64: dts: mediatek: mt8192-asurada-spherion: Mark trackpads as
    fail-needs-probe

 .../arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts | 7 +++++++
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi           | 6 ++++--
 drivers/platform/chrome/chromeos_of_hw_prober.c            | 4 ++++
 3 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.39.5


