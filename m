Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1409DC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 23:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Bl5lk7GtKJUn87j4SLMbzfc5HjmGwGRh3/zLnBPvIAQ=; b=cZRocatleLucAA
	iJSBJUrjTzV3tDtNu2t3HyNst5p/P+ac+PFyWZWbNeNUbWBh/N6S2x/njbVb1SjeBSm6t7K3dYaQ9
	DpyoqJI120LqOmfGVCjqT4vPkDSm9mOtO6/Uvtf2mKUqNULuli/Q/Gmdnvzz3CsAfapDKX31sZekt
	6iMQ+88PhYuTqvdwtQMXoR8CzcBVo6cCPsxm6rcBvq8laK+Y3FizL9HfeLG5TsxNdUBItOJOmG/31
	+w4maaqZwxpsaOsrepXIejhjV9zYL9WVxOZ0A/iMlskvcUlXPg0YxyXN61ff7sX8mBu0taRPzku/k
	aaur0REYS5U27V6A0kRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9KI-0000000G5kj-2ICr;
	Wed, 15 Jul 2026 23:47:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9KH-0000000G5kX-010F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 23:47:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 215C960054;
	Wed, 15 Jul 2026 23:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D4A1F000E9;
	Wed, 15 Jul 2026 23:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784159257;
	bh=Bl5lk7GtKJUn87j4SLMbzfc5HjmGwGRh3/zLnBPvIAQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=T+t9BbyH/xH5eCUFOoC7kkJIlgvKdo+Ku+RFk+UbSXqwismvztyU1uJjx/qICqmS8
	 QvO7B8sM5QeI2opwEKmvQC4yPbOmdP4N6cKRYX7vRjwwL3NcMIvpepZIETJDV1zpgP
	 XmDE8ft22lJBNGenY9+yBXmAEA0HGqFaMiTzCoHJy1sjHckpdK11yfAx9JHKDCETQN
	 m4LhxZHVyK/oCyCApXzQZFHgzprgyE8EMCfcsPBNWMSBD+94e8rxS6o2cMc48iE2pe
	 DUFzXLoPeCMpVK88aihoRHaxPaeAOdJ2tYluLtlJkN3BWNgG/yMkvjz/L0PyEEYYHf
	 DlaDnDB+4R8yQ==
Date: Wed, 15 Jul 2026 18:47:36 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, leonardo.costa@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev, Sherry Sun <sherry.sun@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Richard Zhu <hongxing.zhu@nxp.com>, linux-pci@vger.kernel.org
Subject: Re: [REGRESSION] mainline/master: Apalis iMX6 no longer boots
Message-ID: <20260715234736.GA288957@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629143439.361560-1-leoreis.costa@gmail.com>
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

[+cc Sherry, author of 610fa91d9863, Richard, Mani, linux-pci]

On Mon, Jun 29, 2026 at 11:34:32AM -0300, Leonardo Costa wrote:
> Hello,
> 
> We are seeing a regression on Apalis iMX6 where the kernel doesn't boot in the
> newest v7.2-rc1 (it was working before, in v7.1). The device tree being used is the imx6q-apalis-eval.dtb. The kernel
> configuration used is the one shown below:
> 
>     https://gist.github.com/lcosta37/53efdb2fb6e6e0fc05437c7e53b47737
> 
> The kernel logs stop almost immediately as the board starts to boot, and I 
> don't notice any difference in the logs that points to the cause.
> 
> Is this known? We are seeing this behavior on all Apalis iMX6 modules, though
> we don't see it on Colibri iMX6, so it is not SoC-specific.

This regression is listed on
https://linux-regtracking.leemhuis.info/regzbot/mainline/ as being
caused by
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=master&id=610fa91d9863
("PCI: imx6: Assert PERST# before enabling regulators") but I can't
find any bisect or other report that specifically points to
610fa91d9863.

Can somebody confirm that reverting 610fa91d9863 fixes this
regression, or at least that 610fa91d9863^ works and 610fa91d9863
fails?

Bjorn

