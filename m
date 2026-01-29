Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC85D61033
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TF8JgnJjP3MwCPu1WCIn/bHY9tGL0Ps0MgNVk/UJcAA=; b=SVGuPxODFZ1i2rkcXkPoaRTiZs
	XLqPKWWKiz92OjAP4N5Uwqs+yE+o+rHQh1teAbdXTL3QdxaV+H7yAky5uo2RJCNIJIoZEOkbawb0d
	JhqIPPvchdS5pmsvh5Z1YI5QmdJJPg8Oqe6gjzOx36bkUKItotOU+JQ4lAXz5+Bhzj0JmII7SDfvZ
	4JF7Nlf/F442u5Utc4WD1mPrJxhpJubS9ogKr3xm9J8hoexk4+zg7dHY8INwFcqyJMXwxsBfgQpb5
	sr9XlBqnmGO/YnWz97nuDXemWrUqdKs4TOhHAZn7aAgAQehKDge4wjACsJlyhVL2dEnWiKvkzZcr+
	aCZ/1HIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVly-00000000QT4-3yO7;
	Thu, 29 Jan 2026 17:25:38 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVln-00000000QDN-10qk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:25:38 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769707399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TF8JgnJjP3MwCPu1WCIn/bHY9tGL0Ps0MgNVk/UJcAA=;
	b=bxe51VTne6PAUnEHSsR5xlFrzoUdmewfCiBqJfHClN6TTC/C5hcpEKBTbJyiR4740jI5qQ
	MxMrBgJgXhRJYpMS5E9GHU3/7kmiEu5fRtbO45BdITYMg8gnKIrUvyNpfa9heGvyectkMZ
	fmkCmyfYsikoXQQiLBDSxDIN+ikpfTQ=
From: Sean Anderson <sean.anderson@linux.dev>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>,
	Takashi Iwai <tiwai@suse.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] ASoC: xilinx: xlnx_i2s: Discover parameters from registers
Date: Thu, 29 Jan 2026 12:23:13 -0500
Message-Id: <20260129172315.3871602-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_092530_630183_F0BA5C0B 
X-CRM114-Status: UNSURE (   5.85  )
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

Xilinx helpfully included a read-only "config" register that contains
configuration parameters. Discover our parameters from this register
instead of reading them from the device tree.


Sean Anderson (2):
  dt-bindings: sound: xlnx,i2s: Make discoverable parameters optional
  ASoC: xilinx: xlnx_i2s: Discover parameters from registers

 .../devicetree/bindings/sound/xlnx,i2s.yaml   |  8 ++---
 sound/soc/xilinx/xlnx_i2s.c                   | 32 +++++++------------
 2 files changed, 13 insertions(+), 27 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


