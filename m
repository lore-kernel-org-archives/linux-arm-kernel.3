Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D81DD6C2AF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 22:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOaB+mblNl249+MePTU1DE2MN9+1aEVwNpuvl7SsLWQ=; b=20esnzRXGocvR4h1OfWwrAIZKV
	sK50NEmVGfrmzQ5Q4n7f/1D66IRsvHkcm4V1g268I1pq6y5YTgFof28u5umREkc5tkpDwgHnWQ6BP
	EUEWixxkOp5rrQWfdACsvq5AQF2UToGpWt8J9GdGfb0ykOz3KFCX4FLIsmPSUywEwyCEhSOuNbhvD
	lXRJg2Q3fquNoHr9HNrFjcQkrkBb8d+hWrK9w90TP92jD8uw08yS8KXypFn2JugEEwub5GGCORBh+
	O7XnTSDF0zB5MYyz9P5Kg72nuI0X3Xb2kaB+bSn4bEjO5t4wxOC6suwxfNvyNLm5KdbFqDq9D5LqB
	Q62NUg6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDWmV-0000000Dttz-04mX;
	Tue, 19 Nov 2024 22:33:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDWlY-0000000DtqQ-1DUa;
	Tue, 19 Nov 2024 22:32:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 08677A42E4B;
	Tue, 19 Nov 2024 22:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F92C4CECF;
	Tue, 19 Nov 2024 22:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732055531;
	bh=GOaB+mblNl249+MePTU1DE2MN9+1aEVwNpuvl7SsLWQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tNJzz5cSc9U3/7Pl6b52akZ5MJrLaUc0TAcPYt+Tauiu3FHuog/wvq7keYws8WD5v
	 sC+L1gpt5TDaJYQqtUONPr1GSLhK+S7d8z8j3u/fUZCF16klistlTCs1maNHiaHbuT
	 jLP4Sv+8s7SISlv1MYlpxT594OfiPPUJRHMPnmEeMyr/ovPXorPvRngPYSJ6z1WJM2
	 Lsd4e76Ler0cQkH1ylJYu9Q6X/WFLOEDMexBBYVET2iRSZqdf/0p2Mr3G/xvnt36N7
	 44DjDAm/pym5C8eSJeG6Z6EcZk11NQJp6JEi5tyDKFRrZyT58kgBDNa3zJsZ2cpWVp
	 f+KAhm7pC0YUA==
Message-ID: <38e3593a9bd02fbdbc23b677eda57108.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241118-pcie-en7581-fixes-v4-5-24bb61703ad7@kernel.org>
References: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org> <20241118-pcie-en7581-fixes-v4-5-24bb61703ad7@kernel.org>
Subject: Re: [PATCH v4 5/6] PCI: mediatek-gen3: Add reset delay in mtk_pcie_en7581_power_up()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Helgaas <bhelgaas@google.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Krzysztof =?utf-8?q?Wilczy=C5=84ski?= <kw@linux.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
Date: Tue, 19 Nov 2024 14:32:09 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_143212_388451_2384B25E 
X-CRM114-Status: UNSURE (   9.24  )
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

Quoting Lorenzo Bianconi (2024-11-18 00:04:57)
> Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
> causing occasional PCIe link down issues. In order to overcome the
> problem, PCIe block is reset using REG_PCI_CONTROL (0x88) and
> REG_RESET_CONTROL (0x834) registers available in the clock module
> running clk_bulk_prepare_enable in mtk_pcie_en7581_power_up().
> In order to make the code more readable, move the wait for the time
> needed to complete the PCIe reset from en7581_pci_enable() to
> mtk_pcie_en7581_power_up().
> Reduce reset timeout from 250ms to PCIE_T_PVPERL_MS (100ms).
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

