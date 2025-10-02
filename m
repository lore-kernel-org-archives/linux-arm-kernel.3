Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A64DCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnNp+Qctegu2HELmtHmiLa0Yy0boHIPCdZG0VOVPl7w=; b=paYremd3L4my/mM/WtYy9vDfKv
	4nbWy9BFjFLkC5Zr+XeApw2T1eu/FfstEKKzApqZNO/q56QPLRGDdrMeAackEOx9ahd+JrqS73OXI
	X4HnOiG3MnENr7aCdjMwi2yWKs34ATH6c6K1ltDagGq72OCCaN7dbqYAtAQxWe3awOzRaChr3SGM8
	I3Zfrazh6uaoIYLGw7jk80cHynEEAVOaWPvvQpZQnuA04hz0hAWakqlNL4HquTYsaKJ1pYpfDOvHN
	FZEwoFP7QeIdijFPpUXUJr57Zb4Le73SAkydn5yQeEH7FVHab2gXIaDYYwWVPJg3ETxoBfoKcPgYh
	7dD9OI9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Itl-0000000AUow-1hLT;
	Thu, 02 Oct 2025 12:59:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Iti-0000000AUnV-2VLn;
	Thu, 02 Oct 2025 12:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759409939;
	bh=OY6KJ1cnrmSQKTHuQpxnxgR86H+8o7i/jX5qg0r50as=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GgnZDdYjMGacTTJFQjyv44CoQO3sdnIZbfa7BdrzLSGTYhg3CWOrFw/QrWmj7fEi5
	 MDhTlaFDadOU0FL+ZtmmAikssvsq1n0H7+vH5h+n/IMh7+NoA+aqdkVVLOBosmbJnQ
	 H8i5ntqnyAHsRJHT/mE0zMgm5mZSYjUkupojZ/Y+h/cHgmwEifAfi5R8AIiONWyGFK
	 29swS5AoHj1tVM/jPgnNkcp0Eskg61i8VS6jmkimmbKBgYlys9RbLIgz5/WFyuMdxO
	 ETg8P/Y37uG7ILYFRHzN8N1rSWQW4b6q+cpEDnS90GrJZdDXWd/lTGDEPr6IJgAfG6
	 Q8nIarGZYn81w==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:4c71:ac9f:71a:857])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6135917E0AC3;
	Thu,  2 Oct 2025 14:58:58 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: laura.nao@collabora.com
Cc: andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	arnd@arndb.de,
	bchihi@baylibre.com,
	colin.i.king@gmail.com,
	conor+dt@kernel.org,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	frank-w@public-files.de,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	lala.lin@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	nfraprado@collabora.com,
	rafael@kernel.org,
	robh@kernel.org,
	rui.zhang@intel.com,
	srini@kernel.org,
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v3 0/9] Add thermal sensor driver support for Mediatek MT8196
Date: Thu,  2 Oct 2025 14:57:46 +0200
Message-Id: <20251002125746.107012-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804133035.309990-1-laura.nao@collabora.com>
References: <20250804133035.309990-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_055902_817209_790459A2 
X-CRM114-Status: GOOD (  14.51  )
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

On 8/4/25 15:30, Laura Nao wrote:
> This patch series extends the MediaTek LVTS thermal driver to support the
> MT8196 SoC.
>
> MT8196 requires a different implementation of the lvts_temp_to_raw()
> function.
>
> To support this, the series introduces:
>
> - A new struct lvts_platform_ops to allow platform-specific
>   conversion logic between raw sensor values and temperature
> - A variant of the lvts_temp_to_raw() implementation
> - Platform data and controller definitions for MT8196
>
> Link to v2: https://lore.kernel.org/all/20250730152128.311109-1-laura.nao@collabora.com/
>
> Changes in v3:
> - Make ops in struct lvts_data a pointer to const struct lvts_platform_ops
> - Changed mediatek,mt8188-efuse const entry in eFuse binding to an enum
> with mediatek,mt8196-efuse and mediatek,mt8188-efuse, dropped mediatek,mt8196-efuse
> const entry

Hello,

Following up on this patch series to see if there’s any further 
feedback. I’ve verified that it still applies cleanly on 
linux-pm/thermal and next-20250929.

Best,

Laura

