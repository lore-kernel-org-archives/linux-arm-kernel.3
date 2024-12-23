Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F024E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 20:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcyyU+gwx+/hVJClIB5L3k+I+5jTEMi2zqT1DW4yDiw=; b=uze2vWMY6waT/Fmq+Jbf+QvSfS
	Gun1fEzYBlbR7aFkj66dPaGROYQreIbNTu2IQeFbMrvoLM9b4ClqJRu0P8qE2JPBV/vaBd0pZhYQI
	hGI/ltT7ssW6UNVhU3Wnw9mTlKp1JBNuu9rdEEp+fKPoIiZUjvAfFiZ7fAKerffYoD6QRybjVBfMI
	sEGPnYUY16LrSucGNJPRKzitgMhegsUyAXmRuYfn/6R0bBEb9AQ89KStRWhb7apOTX1WLvpcaK5i/
	GbSBRROxLaoFJtVpovPdPEFoTVZCsa7Y2KFtv0BQ1wqljIPA0uC19t1z8yUlexJr1TUzr+1CPAgnf
	BCZAKQsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPpSm-0000000Ajzv-23rl;
	Mon, 23 Dec 2024 20:55:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPpRZ-0000000AjnC-0qfe;
	Mon, 23 Dec 2024 20:54:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BE0295C53C8;
	Mon, 23 Dec 2024 20:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28CC6C4CED3;
	Mon, 23 Dec 2024 20:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734987264;
	bh=NMMtTTxdzJLwiKMxV+CYvOfL5ZFO48bV3CdhVJI34gE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aUB5a1yXiMwZPIGTyk+izkH/ShpjHcOdrTKB4oIAbQd1FntAk76oJfDOXe4dp0WT2
	 4wL40jcrxAGXkVwac6Acd2fffMI5wrdoJKaWnLve3jk+MF2OAHXtv22nqelpggGwPT
	 ZwO3TkWjCf4ZrupDLAmFmRGxbID1M5tx24EBvMWmQDMM5V3Wfz4/zNe8i+nvTZCyju
	 RM5FnAmGSEBis0mVHp68SxXtzw9lTvkKB69zuoPTYnGm0j5UuQJ/Vyn8ubi21wBEH/
	 Sa/MvoGBlBW0mPBBmdNRYL3xUZjbzp6Jzplf3B5Gvuiw6pYGkfsfP0PiQlrv0BlZYR
	 PEN6Jh84UGZIQ==
Message-ID: <94021cd67e259722e10ac7db2c987b6c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241217-clk_bulk_ena_fix-v5-1-aafbbb245155@collabora.com>
References: <20241217-clk_bulk_ena_fix-v5-0-aafbbb245155@collabora.com> <20241217-clk_bulk_ena_fix-v5-1-aafbbb245155@collabora.com>
Subject: Re: [PATCH v5 1/3] soc: mediatek: pwrap: Switch to devm_clk_bulk_get_all_enabled()
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Helgaas <bhelgaas@google.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof =?utf-8?q?Wilczy=C5=84ski?= <kw@linux.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>
Date: Mon, 23 Dec 2024 12:54:21 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_125425_286267_FAFC90F9 
X-CRM114-Status: UNSURE (   9.49  )
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

Quoting Cristian Ciocaltea (2024-12-17 13:41:51)
> The helper devm_clk_bulk_get_all_enable() missed to return the number of
> clocks stored in the clk_bulk_data table referenced by the clks
> argument and, therefore, will be dropped.
>=20
> Use the newly introduced devm_clk_bulk_get_all_enabled() variant
> instead, which is consistent with devm_clk_bulk_get_all() in terms of
> the returned value:
>=20
>  > 0 if one or more clocks have been stored
>  =3D 0 if there are no clocks
>  < 0 if an error occurred
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

Applied to clk-next

