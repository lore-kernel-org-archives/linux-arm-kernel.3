Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B6DC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnvfQXUPkCwHc3R1RNufoZv6AlvmQpMN5ddzTcHtCcI=; b=wCy6SimKxNfSNwg9aIsjO6+dtm
	9Px1RwKG2ytfwXO4kwQn+2pnfEn9kOUYI7LgB0F+6685/D1xV/C+MLffTgYjjh662hG/P5Z20R6zK
	DjKRaYG/c/ieM3+cAok+vVY4sgCyX81nGMMr3D5rtdKhQaxR0vj64aII/w5G663jwE8mq2hRZmoNk
	6sVf7WHmzEptr8oGTt/CxrgGMafsUh/qeqJfTspVimUCPaIo/NqTDNIhBSmqTL1Mc69r+7GcFjSVG
	V+v280HPasHRMQUFPoYZkMXUThiK8Ucum9o4FvMxGJ7kAmt5s/5NYzuMTUGOm1aMEo1kZW91Z9AKe
	eATBqFKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsMB-0000000H7U2-3NBH;
	Mon, 03 Aug 2026 13:05:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsMA-0000000H7TM-15q4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:05:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0377143E52;
	Mon,  3 Aug 2026 13:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A541F000E9;
	Mon,  3 Aug 2026 13:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785762325;
	bh=vnvfQXUPkCwHc3R1RNufoZv6AlvmQpMN5ddzTcHtCcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hkx4MKxHx4RRU8jMkJyTzd7B1CWphPwdvmzZlp8h4m36f5TX98ES906be0OTgXhFu
	 vybCQwI6iyxhWdtG8NC30s5kH+6cECzhb7+TkaW1Cm9IXmWH+3nPeQGTbMSf+ijpTB
	 0DM8X4+Vhv88tvPdqiLXVnH6RVwz0XvpR6eQXOUPVHPVgEzX5txpvtcI3asCX5h4eG
	 0E1LlyENt9emBKlVqnZlFOa8rphMOgGacsI4vn/mq3ZqtKOZj/1bx5K7WFIG4l62iU
	 QL1apds50y7j61BWMLRXFl3e2GQdQAEg6HlfyLtbStKe98IzZ/z4eFlVm0u4v77DyO
	 XbHx2c6QZXFXw==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Linkai Gong <gonglinkai@kylinos.cn>
Cc: Christophe Leroy <chleroy@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Saravana Kannan <saravanak@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: qe: check platform_driver_register() in qe_ic_of_init()
Date: Mon,  3 Aug 2026 15:05:03 +0200
Message-ID: <178576221777.155079.6723403896365207978.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731094608.1883391-1-gonglinkai@kylinos.cn>
References: <20260731094608.1883391-1-gonglinkai@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=430; i=chleroy@kernel.org; h=from:subject:message-id; bh=g32TLNYO1Snhhf+BMD5yHtq8V00IAMVJ4U1EuJ7sUBw=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQVTGI7vkWOedJ8xrPLMopCY3rbvNnOx3DF/rnutn5b5 5XH+by/O0pZGMS4GGTFFFmO/+feNaPrS2r+1F36MHNYmUCGMHBxCsBECpQZGa6ybjjQESP46WGK /PMFC87yrW/rXhNy8e2CG8ySKf83VMcy/LO+cy/7oeSGm++eHWabeDRKcN47P+PO0/+dq2SyZyR rdfMAAA==
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


On Fri, 31 Jul 2026 17:46:08 +0800, Linkai Gong wrote:
> qe_ic_of_init() ignored the return value of platform_driver_register()
> and always returned success. Propagate the error to the initcall.
> 
> 

Applied, thanks!

[1/1] soc: fsl: qe: check platform_driver_register() in qe_ic_of_init()
      commit: 060325071fab5d889740f6393e4e8ecd990e6cd1

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

