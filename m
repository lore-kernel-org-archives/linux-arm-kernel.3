Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F68C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 09:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j92jfO4LoHBrBVcgVWjyDzmS4B6ISUjTP4JNI211h4k=; b=Kek+H9pSOy3DHupzNMTbnLE7Ia
	mrwV78BlPAhp43wAlPVRZp23+Me0YvZizKHYJeNGF6J7xbXlA1zILMpU81w+nivY0++OJVTEUSk3o
	iFjGTpulToPXSqKGN/xomw8F3wzpIq7mn8IAfoHyhAY8qdMSF1sEV0uRtQlwmF8vOw+7NK8zay9sx
	2wnQi5JRFKs8M94/YPjjUA0XjOPPIdg6e86x461t0suDTtaleTkcGlnq4UeKxld+nTsN82ljY9+zG
	vnvnXXEZZJ5wQPP/bBTv7RmkrnJBb6UDlWMczILEMCgvPyt5/Je/UktMaLOWk3/oZNxjNp3/97AgP
	yZVXW9dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Pwa-00000005pyE-0UN1;
	Tue, 15 Sep 2026 09:59:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6PwY-00000005py2-3o31
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 09:59:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 07C3B600D1;
	Tue, 15 Sep 2026 09:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915CD1F000FF;
	Tue, 15 Sep 2026 09:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789466353;
	bh=j92jfO4LoHBrBVcgVWjyDzmS4B6ISUjTP4JNI211h4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gOPu7nAvhsCyIbszi5xZpf7QmIji7ToUQRY3z9kPbY4F3w9R405IyXG//Hw1FEdDt
	 QAUrKF4dte0ZbhlTaiURlll04j3CsAvRTWZ8F8xOYWpDcjPYjAnUSUiETJ6270CBdx
	 rP1770tauIGZkrv2oNKLfQX+UmP4nrQMw4FWnLQ93HgKY2x7W3I+XGQPnuSKPn2khP
	 sh61GUuZF3hqyaWYTaatJnVGnKxSoErr+yFO9wOEZdeH0cuSN7GUENrCBDlvxPjycW
	 xP3+zuWMU49+9pe/l9PzqmfSHzOxTnRbm2I0uDsWkK5HoaYtAk5ar3DEpjuD9WOQTw
	 C621nKFrUAPQw==
From: Niklas Cassel <cassel@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Lee Jones <lee@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	Baokun Li <libaokun1@huawei.com>,
	Dan Williams <djbw@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Niklas Cassel <cassel@kernel.org>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-ide@vger.kernel.org
Subject: Re: [PATCH v5 0/6] ata: Do not release the host resources twice on probe() failure
Date: Tue, 15 Sep 2026 11:58:57 +0200
Message-ID: <178946628793.756083.10484116126177085687.b4-ty@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915084127.692494-8-cassel@kernel.org>
References: <20260915084127.692494-8-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1191; i=cassel@kernel.org; h=from:subject:message-id; bh=od9GhuX9XDh70gNd4qvbWE+jAaCyAXlo03Vtr9G9B84=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGLJWij2ytuLrtd182pCj4Hl0ILd5EHfN/nRZIYYPjydOv HpM+MCpjlIWBjEuBlkxRRbfHy77i7vdpxxXvGMDM4eVCWQIAxenAExk7R9Ghg2rznPudVqUvTPr etCaX0d2cr3kLmbaPdlU3nLmoZyP6yIZGTb5HgrclVeorlk6f87rf1vO/F2vc8PgdvWRDEOrTT7 zCtkA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
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

On Tue, 15 Sep 2026 10:41:26 +0200, Niklas Cassel wrote:
> ata_host_start() registers ata_host_stop() as a devres action as soon as
> it has succeeded:
> 
> 	if (have_stop) {
> 		start_dr = devres_alloc(ata_host_stop, 0, GFP_KERNEL);
> 	...
> 	if (start_dr)
> 		devres_add(host->dev, start_dr);
> 	host->flags |= ATA_HOST_STARTED;
> 
> [...]

Applied to libata/linux.git (for-7.4), thanks!

[1/6] ata: ahci_st: Do not ignore errors when getting the reset controls
      https://git.kernel.org/libata/linux/c/c74ee923
[2/6] ata: ahci_st: Assert the power down reset in the probe() error path
      https://git.kernel.org/libata/linux/c/91e0a745
[3/6] ata: sata_fsl: Fix use-after-free of host_priv on probe() failure
      https://git.kernel.org/libata/linux/c/70b11967
[4/6] ata: libahci: Free the IRQs when activating a multi-IRQ host fails
      https://git.kernel.org/libata/linux/c/34a4a344
[5/6] ata: libata: Do not leave ata_host_stop() registered when activation fails
      https://git.kernel.org/libata/linux/c/d2f97700
[6/6] ata: libata-core: Fix the ata_host_register() kdoc
      https://git.kernel.org/libata/linux/c/52d19459

Kind regards,
Niklas

