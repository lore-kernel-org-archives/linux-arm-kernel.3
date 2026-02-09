Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0832E78D6A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 09:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldPhGDz6odKYJJYfPklkHhLA78TDu86SzZgRiyZHvn8=; b=CDyvD9p80i/2sLAMJ7tVjmDPjJ
	WfxdwFpsYbIs5bOvlkisKY8Z7AfhYNntDgBp600y/bfWhDfbP8pXbYowgzpCY65Jj0TAsxKEAcxJ7
	GcTWV1Ygz3gKDKL8CrJe6SqLse9PBnHmQ7aH9bh6Ec4ZeEaPxLTs7Ms8xkw3opviDiDfPgQLsYIms
	IZc5idHg84H5YeC6KE2/Sr9QAuTyMSIK2rDhXtZaMIUS1XVVKao8MgvXEHZ7Izkbvuowt2UBROZ8M
	c3GbyXmlzxtgoFhUCL6hU4qyyvzoWrnrdb3AzM3LDFBIR+dU2SstRtGv/daX4rene4Vm7/YsehhIj
	xDfs6G/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNEy-0000000F5VC-10Er;
	Mon, 09 Feb 2026 09:07:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNEv-0000000F5V1-40Ad
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 09:07:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11CC160008;
	Mon,  9 Feb 2026 09:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7710C116C6;
	Mon,  9 Feb 2026 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770628048;
	bh=YX2dlUnFy6z+33Wd41/5d2pf3kMRqAOW/vZQUL0L6XI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rXCpMKG9ftgohCo6zJAAk3a/cq4h/5ZHTZVK2z4PAmybiAC2eNvbFObbxDAOhlJ+N
	 0nLJp3IDDsr2cGyBI8lXgm6aCKUlm+bhT1q63wCU5+xzq4qppYaofzz3sJpBpj5DvX
	 hvTL7mBngd2IQ9boz8RraLah0nSZJ7scLg4EXd0Z0REwj+4OYd3z6KH0YT+z75W7uu
	 6SCFkkOcWZFT2rEJX0MNkv2uY/8MF1Z8q17D2Tv7qW2Iq1R6c9uGDUNwYSoxRURF2w
	 0w2qJL/FMVVac1XZbnxXYECymvBmzNXd0RG2lYiSzZ+FkWH/n2nGxdu4wvFrPcUQrm
	 XfW7Ux4E15JDA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: herve.codina@bootlin.com,
	qiang.zhao@nxp.com,
	Chen Ni <nichen@iscas.ac.cn>
Cc: Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: cpm1: qmc: Fix error check for devm_ioremap_resource() in qmc_qe_init_resources()
Date: Mon,  9 Feb 2026 10:04:53 +0100
Message-ID: <177062782918.3769661.1539202055286384529.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260209015904.871269-1-nichen@iscas.ac.cn>
References: <20260209015904.871269-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=500; i=chleroy@kernel.org; h=from:subject:message-id; bh=p8lgMolzAatri58HbwQzvJCCPq3xAD8+zmQmEpG7lXE=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWR2LjZ3EjSQv9Tbe0Re86g09/2GLIfmeTKyh3drsXF41 XSve7ayo5SFQYyLQVZMkeX4f+5dM7q+pOZP3aUPM4eVCWQIAxenAEzkiyDDX9EVu7UiWYXOb1K7 VTH75AMGzRtpX3w/bTaZ84br34OWldcY/udUesxnOPI6O678Jg/PrHbmHSI5EbvVlIIquqUCzGf 4MAIA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
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


On Mon, 09 Feb 2026 09:59:04 +0800, Chen Ni wrote:
> Fix wrong variable used for error checking after devm_ioremap_resource()
> call. The function checks qmc->scc_pram instead of qmc->dpram, which
> could lead to incorrect error handling.
> 
> 

Applied, thanks!

[1/1] soc: fsl: cpm1: qmc: Fix error check for devm_ioremap_resource() in qmc_qe_init_resources()
      commit: 39676244858f24089f83134bbf975dd31abe7544

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

