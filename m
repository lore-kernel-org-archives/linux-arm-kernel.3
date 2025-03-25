Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F71C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 11:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=awf9MvvKMjSOrAlGvChuLJ8AFD7kCHAnylIItOBTw34=; b=MBLyvwKN1tMIoWVA2Y0X71ykGW
	wgEvv2NQjSiAwMRT9gWSlIr3epeLQeUg6USiQSG20Ia7tWddzHuDE+R2d3KX6rxtOPXv0zhDoaxr1
	yGK3L32ckzMuwl34Y6E6ARIrwmELCvB3kppnYzuxFBda9LXi4p0XT7VEBzqtD4DXl0Wk13nr1VNut
	YdJDlVL9nNKGNuGHU02M6gu9rdVJVYSTjDadkKoHo4Qulx2bpiXWeYinuAj3Elt0J0k56Ok4eBls5
	0GDd8BE4W7F3qR7RApphx764aIJzwnCmMSjfrKZ6JqbVlST8VCZV4iyF1/uxQsry9nJSz01swW31V
	6xVP2F/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2DV-00000005bj0-09Xt;
	Tue, 25 Mar 2025 11:13:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx27k-00000005aWu-2F16;
	Tue, 25 Mar 2025 11:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742900830;
	bh=L6stbKrSJItr4b97Xxhs4L11+kqiuh6UY41CNBNHrRE=;
	h=From:To:Cc:Subject:Date:From;
	b=cKKkKRJU324QW2eljbzVlG3gkBQzcjDClqBQy9fPsTZLmOuzG8KhOm+D35N5Lq3be
	 mhbyotG5G7LzurKTTOxhZJmtW/zzwxu0rcZr96XgHC2BQL/AXP28vXR7a68z1s7ZTj
	 KkKkcTMQzunPKU7KIP1wnbgndCQxjyPG3dNJom383RC7pb2wNDHGMuC/K+ZAoW0i/Z
	 vnC/uBtuM29bkJBnLA5G12TJsDqxlt6ysOeLDM7z1iTk+XJLQyIKPdbKSryRsYhFP7
	 ut5N4QXYTjVD9U22cL30Q8hIYkq/9+HeWI/7lMaMI/SH1xJxT8/4YaNsNf3ujMz5WL
	 e85Ed0TLJjZ5Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A01B117E09D6;
	Tue, 25 Mar 2025 12:07:09 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chaotian.jing@mediatek.com
Cc: ulf.hansson@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	axe.yang@mediatek.com
Subject: [PATCH 0/4] mmc: mtk-sd: Cleanups for register R/W
Date: Tue, 25 Mar 2025 12:06:57 +0100
Message-ID: <20250325110701.52623-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_040712_746091_D04ADF65 
X-CRM114-Status: UNSURE (   6.86  )
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

This series adds missing register field definitions for the MSDC patch
bit registers and aggregates various register writes into just one,
greatly lowering the amount of register reads and writes especially
during the controller initialization phase, other than the tuning
phases and set_ios for mclk setting.

While this will have a performance gain, that is completely ignorable,
hence this series' only focus is a cleanup and an improvement in the
readability of the register settings (as those now have actual names,
some documenting, and no magic numbers around).

This series brings no functional differences.

AngeloGioacchino Del Regno (4):
  mmc: mtk-sd: Clarify patch bit register initialization and layout
  mmc: mtk-sd: Aggregate writes for MSDC_PATCH_BIT1/2 setup
  mmc: mtk-sd: Do single write in function msdc_new_tx_setting
  mmc: mtk-sd: Aggregate R/W for top_base iospace case where possible

 drivers/mmc/host/mtk-sd.c | 207 ++++++++++++++++++++++++--------------
 1 file changed, 132 insertions(+), 75 deletions(-)

-- 
2.48.1


