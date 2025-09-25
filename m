Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D060BCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 21:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPHMj71ylaA/Pst6CfYJPDLa58yFoMZJIXza1Geua0w=; b=NiKl72g50iBoPajolefPfhFI1w
	9kf4L40rMO8k/sR/f4iIionKaHXPmf2DXOlhY7XL91+hyAPajJ9XVCxaFe8QpcHKPoUClWkHiA9jn
	xtbKevbYtyni4yjTLBcA2UUZStmsaYEeZMA3cpw3fsNyFSq9JAhj3IABmcotfCLy7A9gKe/ZAJ4R1
	pJj6wGuBuYcoHABbUhUZr4750yU4/nMWVGTgyisklPk/0DlP44INuQpu6CLz6WtMMmX1UIpEV/423
	BH2lWXNG4QsSWdpxzi6oMZxN3aYv2wU/daY9WmirEDNYCqK8A0rXgCLoq7vaz1hV+r3xUNAZzLoV7
	OkoK4M0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1tAw-0000000D039-3DZx;
	Thu, 25 Sep 2025 21:06:50 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1tAu-0000000D01P-1wu9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 21:06:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-transfer-encoding
	:in-reply-to; s=k1; bh=xPHMj71ylaA/Pst6CfYJPDLa58yFoMZJIXza1Geua
	0w=; b=ZaOfW0TajNUTRaQQdd2bpuhhw8JNGjznHVqn9Y+v090V/IwPPai/3t4Ej
	tHfhqHd1oCLVIGFkRLX/lMOoAJR0aUtfjeI2Q4kbWgLER/+XB+Vdv2cBtQr3R7m3
	lu88er7bZ1KKVlEq/tIXSBlfLjSMODSYBR2DXxQlDFyB/4lt4CBZhduc+8AshyCM
	gn/+Z7FsTwYQmg4+usYXG2pNJSM/sMNwLbpNHTc1JVhg6UjVSP+rAMqUrZ9BC/PJ
	xJPfEWXnCi2n5aDZQkRuaADDQyHlauOOIvgtV0sNH8Hio2v1GLeQoFV3u61fmdNF
	VtXtIk0gP3BL6v8RnNcy9v5xE7JQw==
Received: (qmail 2015546 invoked from network); 25 Sep 2025 23:06:46 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 23:06:46 +0200
X-UD-Smtp-Session: l3s3148p1@LY3Fi6Y/esgujntx
Date: Thu, 25 Sep 2025 23:06:42 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Qii Wang <qii.wang@mediatek.com>, Wolfram Sang <wsa@kernel.org>,
	Liguo Zhang <liguo.zhang@mediatek.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2] i2c: mediatek: fix potential incorrect use of
 I2C_MASTER_WRRD
Message-ID: <aNWu4hC2Yer7c2kG@shikoro>
References: <20250906082652.16864-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250906082652.16864-1-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_140648_784492_135F4938 
X-CRM114-Status: GOOD (  12.43  )
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

On Sat, Sep 06, 2025 at 04:24:06PM +0800, Leilk Liu wrote:
> From: "Leilk.Liu" <leilk.liu@mediatek.com>
> 
> The old IC does not support the I2C_MASTER_WRRD (write-then-read)
> function, but the current code’s handling of i2c->auto_restart may
> potentially lead to entering the I2C_MASTER_WRRD software flow,
> resulting in unexpected bugs.
> 
> Instead of repurposing the auto_restart flag, add a separate flag
> to signal I2C_MASTER_WRRD operations.
> 
> Also fix handling of msgs. If the operation (i2c->op) is
> I2C_MASTER_WRRD, then the msgs pointer is incremented by 2.
> For all other operations, msgs is simply incremented by 1.
> 
> Fixes: b2ed11e224a2 ("I2C: mediatek: Add driver for MediaTek MT8173 I2C controller")
> Signed-off-by: Leilk.Liu <leilk.liu@mediatek.com>
> Suggested-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Applied to for-next, thanks!


