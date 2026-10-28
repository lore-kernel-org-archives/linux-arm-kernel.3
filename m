Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F99606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 08:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hv4caM/F;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TNjTyPJg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=deVCSELJSTG0pd+EM+rjRQ7hOaUOrSc78SkOky98FUc=; b=hv4caM/FE4MGHTZlZLHIGiv/L6
	HYhHcpoKn/z27scA25gDKY9SxYpjIJOMpUeTm0rs9Yq/VQOt7IDefIVsLG6a8h8H7tqnBSfACZ5Ia
	RzPHFe1J4b7QTDdujfD/LK85/v4ZFGkOuSlJniy9AXLTxFBv6zTV299oqA/2WwJqfmCEKMpIhD5a7
	kiWjKh3Q8CgVLCVholfpUd8MqjaRRaUeVlwraSLTA9J6+Cb/TRHhwWxgxwxuQiFNmyKgDUY7Er9Sj
	GOArInIfjDdkUyU3F+OC5X4snJdOciiKhmEe5wKD6NaYzEYD8HifjJEtbpIzBAL+JrzvWwiIELVQI
	1XB6FUMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLz3b-00000006YjE-3cki;
	Wed, 28 Oct 2026 08:30:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLz3a-00000006Yj2-376H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 08:30:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D1FA3600C8;
	Wed, 28 Oct 2026 08:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F001F01828;
	Wed, 28 Oct 2026 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793176249;
	bh=deVCSELJSTG0pd+EM+rjRQ7hOaUOrSc78SkOky98FUc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TNjTyPJg3lci+OUjJyMViGgrE20q+380VaIi/CjYpQC5o1z374RZYPIPJ2yqfkmlc
	 wd/5pegliCO7WJEuzx92GR+l88DrtSYp2dHqxji4fSBDa2DOPlIVoYfkdFljJsGsGj
	 RauydhoVuFTnr+U8undTXnS4ooc7PY3Y4V2QKYYb1Km7ZBiEu/3KILlqZXx8h9SBUa
	 wqncL/Ifbwn8+UH6GK6tJZT4Y5ykMs96wfQ5GziCl9AQh8mD82ULk1rdaeiBezH82v
	 ajMWCuPnQgnTkxrFULW89bBYV6JBAMb3m5I8Gn/Gstgx/2ZralIoODEG18z5Mnbes5
	 j7dlsBVrO1IfQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xLz3X-0000000827d-0FRF;
	Wed, 28 Oct 2026 08:30:47 +0000
Date: Wed, 28 Oct 2026 08:30:46 +0000
Message-ID: <86pkwuxm4p.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Tim Pambor <timpambor@gmail.com>
Cc: Frank.Li@nxp.com,
	afaerber@suse.de,
	alim.akhtar@samsung.com,
	andersson@kernel.org,
	angelogioacchino.delregno@collabora.com,
	baolin.wang@linux.alibaba.com,
	bst-upstream@bstai.top,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	daniel.lezcano@kernel.org,
	devicetree@vger.kernel.org,
	dinguyen@kernel.org,
	eleanor.lin@realtek.com,
	festevam@gmail.com,
	gordon.ge@bst.ai,
	guohanjun@huawei.com,
	heiko@sntech.de,
	ivo.ivanov.ivanov1@gmail.com,
	jbrunet@baylibre.com,
	jernej.skrabec@gmail.com,
	jesper.nilsson@axis.com,
	jonathanh@nvidia.com,
	kernel@pengutronix.de,
	khilman@baylibre.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	lars.persson@axis.com,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	mark.rutland@arm.com,
	martin.blumenstingl@googlemail.com,
	matthias.bgg@gmail.com,
	michal.simek@amd.com,
	neil.armstrong@linaro.org,
	orsonzhai@gmail.com,
	rafael@kernel.org,
	robh@kernel.org,
	s.hauer@pengutronix.de,
	samuel@sholland.org,
	shawn.lin@rock-chips.com,
	sudeep.holla@kernel.org,
	tglx@kernel.org,
	thierry.reding@kernel.org,
	wens@kernel.org,
	will@kernel.org
Subject: Re: [PATCH v3 11/17] arm64: dts: mediatek: Add EL2 virtual timer interrupt
In-Reply-To: <20261028081716.75598-1-timpambor@gmail.com>
References: <20260523140242.586031-12-maz@kernel.org>
	<20261028081716.75598-1-timpambor@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: timpambor@gmail.com, Frank.Li@nxp.com, afaerber@suse.de, alim.akhtar@samsung.com, andersson@kernel.org, angelogioacchino.delregno@collabora.com, baolin.wang@linux.alibaba.com, bst-upstream@bstai.top, catalin.marinas@arm.com, conor+dt@kernel.org, daniel.lezcano@kernel.org, devicetree@vger.kernel.org, dinguyen@kernel.org, eleanor.lin@realtek.com, festevam@gmail.com, gordon.ge@bst.ai, guohanjun@huawei.com, heiko@sntech.de, ivo.ivanov.ivanov1@gmail.com, jbrunet@baylibre.com, jernej.skrabec@gmail.com, jesper.nilsson@axis.com, jonathanh@nvidia.com, kernel@pengutronix.de, khilman@baylibre.com, konradybcio@kernel.org, krzk+dt@kernel.org, lars.persson@axis.com, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, lpieralisi@kernel.org, mark.rutland@arm.com, martin.blumenstingl@googlemail.com, matthias.bgg@gmail.com, michal.simek@amd.com, neil.armstrong@linaro.org, orsonzhai@gmail.com, rafael@kernel.org, robh@kernel.org, s.hauer@pen
 gutronix.de, samuel@sholland.org, shawn.lin@rock-chips.com, sudeep.holla@kernel.org, tglx@kernel.org, thierry.reding@kernel.org, wens@kernel.org, will@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 08:17:16 +0000,
Tim Pambor <timpambor@gmail.com> wrote:
> 
> On Sat, 23 May 2026 15:02:36 +0100, Marc Zyngier wrote:
> > The ARMv8.1+ based CPUs used in a number of Mediatek SoCs are missing
> > the EL2 virtual timer interrupt. Add it.
> 
> This patch doesn't seem to have been applied along with the rest of
> the series.

That's the SoC maintainers' responsibility. I only look after the
driver code, and rely on people spotting the warning! ;-) The fact
that this has been there for two kernel releases show you how deeply
these maintainers care.

> After updating to v7.2.11 on an MT8195 board I see:
> 
>   arch_timer: [Firmware Bug]: VHE-capable CPU without EL2 virtual timer interrupt
> 
> With this patch applied, the warning is gone and the EL2 virtual timer
> is used as expected:
> 
>   arch_timer: cp15 timer running at 13.00MHz (hyp-virt).
> 
> Reviewed-by: Tim Pambor <timpambor@gmail.com>
> Tested-by: Tim Pambor <timpambor@gmail.com>

Thanks!

	M.

-- 
Without deviation from the norm, progress is not possible.

