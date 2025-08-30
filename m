Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB66ACA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 16:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v+iz3NNNgT+vCfHMZV6XaBvyrOJ/bGdYFwfAgtgHmtk=; b=Zu79HlyTYmeA6G9tZqKXPa3rJ7
	ZV8nAGOsjWQATvkn7H9OYXSm4UtDrkVpbbCSjM3MWUzmmQH+pFVve839nDShZ1YfgxwFlrBoWN3CW
	uVNE1xir7cND5xU0PiJfJUbwvaLf14X4w0nk2lnQzVZo+UiMK6KvPkFADdQSJ4Ll95FaiUSahWebi
	IkDHGrkUX17N28v0N2X6cdTMRgzRhfXXEQ7xkmaS6iXlKceYxapS1nNtUhhRqPrveAmFamtqRffS4
	3f6Pg4lpUn/RlaBc9wWQQds859cCen000O731ixgBAAJtnZkfYGpjOoYx0+QjNNecWsy8hK/ApiCX
	uwkcL/GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usNzf-0000000861A-3DWz;
	Sat, 30 Aug 2025 15:59:55 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usNwu-000000085QR-46E5;
	Sat, 30 Aug 2025 15:57:06 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1usNwg-000000007pm-1X2x;
	Sat, 30 Aug 2025 15:56:50 +0000
Date: Sat, 30 Aug 2025 16:56:46 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mason Chang <mason-cw.chang@mediatek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Frank Wunderlich <frank-w@public-files.de>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Chad Monroe <chad.monroe@adtran.com>
Subject: [PATCH linux-stable 6.12 0/3] thermal/drivers/mediatek/lvts: pick
 fixes into 6.12 stable tree
Message-ID: <cover.1756568900.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_085705_014395_5A130FEB 
X-CRM114-Status: UNSURE (   7.86  )
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

Temperature readings on the MT7988 are severely abnormal and inaccurate
on some devices when using the default commands.
Patches to fix this have been posted and merged for Linux 6.17, however,
missing a Fixes:-tag they have not been picked into the Linux 6.12 stable
tree which already comes with the driver support for MT7988 and hence
suffers from this problem.
All 3 commits apply cleanly on top of linux-6.12.y, so cherry-pick them
now, adding the appropriate Fixes:-tag.

Mason Chang (3):
  thermal/drivers/mediatek/lvts_thermal: Change lvts commands array to
    static const
  thermal/drivers/mediatek/lvts_thermal: Add lvts commands and their
    sizes to driver data
  thermal/drivers/mediatek/lvts_thermal: Add mt7988 lvts commands

 drivers/thermal/mediatek/lvts_thermal.c | 74 ++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 13 deletions(-)

-- 
2.51.0

