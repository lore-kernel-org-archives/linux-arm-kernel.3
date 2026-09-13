Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DF0C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 10:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3swnm2ads6waESiNi1EorXP+dQ0y/SxGczDUkiwUru8=; b=GiEioj2dTNHsJGWrsc0x5tg6Va
	neitwxLEBV2yDkA+ZHJ5MlOmJLMzba1bLhDtslt0sd8WVQrA604u6A9TRBOdPXUUrv3UPxGJd9mgy
	CD3ty8hr17n8TNtBEht7eYJljo2pxQryg9Y8eLvU/GN9AOZfWNRJhzM1x7xMOiTfQBcT8/sFTspeR
	5KIBaMHobZlpMqGDEaWhP+4NxG1DBBHuZXEvR5Co2nvF/1TPbk2hKi6ptbuNjXdfRvIz4oGRe5Te+
	EJBo8i/XQBOp/TUEw6f5KprUG4bTvL95bmx1pW+WETWdmJChiIQDneGGIDJoLKFBkzjyfHYghvdQT
	dKFa9QHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ht6-00000001bZ9-3ulG;
	Sun, 13 Sep 2026 10:56:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ht5-00000001bYW-0okY;
	Sun, 13 Sep 2026 10:56:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A579160DEA;
	Sun, 13 Sep 2026 10:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22FA1F00898;
	Sun, 13 Sep 2026 10:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789297002;
	bh=3swnm2ads6waESiNi1EorXP+dQ0y/SxGczDUkiwUru8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RSlaG9NvRsJEivnVKrbQT0ZibS/3tBev0grAaK1uMlK0Oyhzz2QLu83NhUau+oE4a
	 +WtVNV2lMM7scAOi8ARfS7mm+489GHD2nb3m0OwwxPDq5cERuqi0vKWLXXCBZbt2ui
	 P0wPUM1GFplE3v+bIylhSQk2W8GQZi6Lzt4PdjSRseW7e4Mism6Ynni1Q6n3u2TlCE
	 0sZaURx6AEygSaP9t27sCcou2AP1sbEZKO2/rfOypqitKsbOxTSRrYOhRdVuMOFXxu
	 tANmjRbIalLcCEwPgJvK+3/L4UtauiGaLKhWQOqyJQCjQiClG2D1p0LArNNy67uJ7l
	 TCqr3rCXjlQsg==
From: Vinod Koul <vkoul@kernel.org>
To: linux-phy@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260304041602.7539-1-rosenp@gmail.com>
References: <20260304041602.7539-1-rosenp@gmail.com>
Subject: Re: [PATCH] phy: uniphier-usb3: no devm for nvmem_cell_get
Message-Id: <178929699949.215437.8291797123848780958.b4-ty@kernel.org>
Date: Sun, 13 Sep 2026 16:26:39 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Tue, 03 Mar 2026 20:16:02 -0800, Rosen Penev wrote:
> There is absolutely no reason to extend the lifetime of nvmem_cell_get
> to after removal of the driver. Use and free right after use.
> 
> 

Applied, thanks!

[1/1] phy: uniphier-usb3: no devm for nvmem_cell_get
      commit: b2d5ad12d78a1070553f4cb6bf3315105a3b3da3

Best regards,
-- 
~Vinod



