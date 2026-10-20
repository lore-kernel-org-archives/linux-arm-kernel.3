Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B172606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vFvSs0vs;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=lZozn5LG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3eT8W1wovMahicNrQMVsGghdo6IMiGhCZifPmKN1tqY=; b=vFvSs0vsW8ts0zvNOojtU67aq9
	tZ1bYI6IzjDXm+C7hNFFORl4eyblES5/Cvv2JogxIhJTFClNuFpkQ1v/gZgFVdtMWFbyML6JlbpP/
	0tn3428MHYFczw4gJU7ttFjCEH1/lyy1Hbtc9NSj98t/IclEqDQopEQrumhrsJqIL4kndRFq3OvOM
	2zFmJiBE7hGG/pLCcRapK+sO7lYdF5EQKaY1538VAvucfj2QIvUuoFuWUWL2QKlLwDgQJpia5OCok
	dm/GelFyaAwR8evB/lqsdXVvroKNhVI8cSTVUWpeCOCNPL4w8m7pZu+ARCHVU3i1nNLV9r9BXa2fU
	ldcXridA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzrb-00000008hgf-0g47;
	Tue, 20 Oct 2026 02:46:07 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzrX-00000008hfA-18bG;
	Tue, 20 Oct 2026 02:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3e
	T8W1wovMahicNrQMVsGghdo6IMiGhCZifPmKN1tqY=; b=lZozn5LGTFlQoOFR47
	/K58CQZjn1BUL7GdND2zn34Ji3n1rUOuWuxBC//txmNUXUxpac9lz5fPIos/8skf
	IGIi9ykQalukyei1gVC3N+W+Xusbyvkq1dI4lyECYN0OqB0oFNzKcW/VI4dgt8MF
	Sr5UhOZd4IfpGuA8BZPXQxZGc=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3H9HZ1dZq2OtmBQ--.60682S2;
	Tue, 20 Oct 2026 10:45:47 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Soul Huang <Soul.Huang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Rong Yan <rong.yan@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Nelson Yu <nelson.yu@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 00/11] wifi: mt76: validate mt792x firmware data
Date: Tue, 20 Oct 2026 10:45:32 +0800
Message-Id: <20261020024544.3101738-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3H9HZ1dZq2OtmBQ--.60682S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr13CFykJw1kGw18Cry7Awb_yoW8GFy7pF
	y8ta15tw1UWr4fGws3Aws7ZFyYy3Z5C3WUAF43Ww1Fqry0yr1rJayjk3W8WFW2ka92kw18
	ua1jyFsxGFyq93DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jeksgUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRv7NmrW1duB7gAA3G
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194603_638146_7FEB5944 
X-CRM114-Status: UNSURE (   4.99  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The mt7921 and mt7925 MCU paths trust firmware response sizes before
reading fixed fields or copying payloads. The shared mt792x firmware
capability parser also derives pointers from unchecked region and
release-info lengths. Malformed firmware data can therefore cause
out-of-bounds reads.

Validate each response before accessing it and keep every firmware
region and release-info record within the loaded image.

Jiale Yao (11):
  wifi: mt76: mt7921: validate MCU response lengths
  wifi: mt76: mt7921: validate EEPROM response length
  wifi: mt76: mt7921: reject malformed TX power responses
  wifi: mt76: mt7921: validate testmode query response
  wifi: mt76: mt7925: validate MCU response lengths
  wifi: mt76: mt7925: validate register query response
  wifi: mt76: mt7925: validate EEPROM response length
  wifi: mt76: mt7925: validate temperature response length
  wifi: mt76: mt7925: validate TX power response length
  wifi: mt76: mt7925: validate radio status response
  wifi: mt76: mt792x: bound firmware release-info parsing

 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 34 +++++++++++++-
 .../wireless/mediatek/mt76/mt7921/testmode.c  |  4 ++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 43 +++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 44 ++++++++++++++++---
 4 files changed, 117 insertions(+), 8 deletions(-)

-- 
2.34.1


