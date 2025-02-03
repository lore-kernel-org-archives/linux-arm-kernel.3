Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A97C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 23:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSZ/0D/GvfWlH19Kq19UGDnykS7LxN48BD0TUfFfmXg=; b=I/wCQbcMTzCz9vFaUicAy9nFVE
	56HKifkkY19ROoq2rh7uF7Vy8qV+9WV0P4j18bldhRZvPljafjJdYiuKMYL8zdB2rP6S4e9pvRBDx
	Kkoub/TMhMuSYU5Q2msdoU6YbAv2A3Gy77ZoSwz7HEMtndJINx+K3l/7Eie5sW45Oe/ol1dWPwyyN
	/11GpA6RVyq4dvTjswizHhZWW96zwrn8OCCQqOpJLA37h3GJqF8oOPK5yG9bLTWvwgQSWfvdlFl9o
	DFPOyu2LiJRWY85VtOyf0Lc8lL8HpFWaFPUCsdCEFayapclIf2n5RUqunkJzgBRpIEQ+UNmWHIxEp
	+cfyF9vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5u1-0000000Gt5o-1U2E;
	Mon, 03 Feb 2025 23:30:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4r2-0000000GmOj-2u9Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 22:23:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE5D65C60F4;
	Mon,  3 Feb 2025 22:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C93C4CED2;
	Mon,  3 Feb 2025 22:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738621423;
	bh=QDO9GVeXAOaaRZkSWSLtvHPPP50q6hnF5jk/+ZuAFCo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=odAS0O7+0BpU5Lz+GlKYMGQ6c4ARoLckDjtLnhs8REL6A5uZgF1zTxV5NDNXJD8om
	 M8fSprvOVg3y5Fr9qU/2ggqb/XMEPTVVcO5GS/cP5vbjoJ/FaBi1czc80yrdigPSaU
	 sht0CkU3zWTLkYPlFF8eRXXnEGVC9YAFsqj3S+jtwd8OdbiQUJXAmK4YZ8og5R2SnJ
	 ZrJ9dSpKHeNgb/Q59p2FDVNYhY3x9S6FOslm2m88S4Ob4Ah44GDMJFp/ZzloWLRqhc
	 Fi1sDvBpk28JWpKvKy3s42spNVNCkwNjQJPf4TP1C2VfsZhqjXveKY1PLInfYyOKei
	 f5XmO3mH2VpOg==
Date: Mon, 3 Feb 2025 14:23:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Steven Price <steven.price@arm.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>, Petr Tesarik
 <petr@tesarici.cz>, Serge Semin <fancer.lancer@gmail.com>, Yanteng Si
 <si.yanteng@linux.dev>, Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH] net: stmmac: Allow zero for [tr]x_fifo_size
Message-ID: <20250203142342.145af901@kernel.org>
In-Reply-To: <Z6Clkh44QgdNJu_O@shell.armlinux.org.uk>
References: <20250203093419.25804-1-steven.price@arm.com>
	<Z6CckJtOo-vMrGWy@shell.armlinux.org.uk>
	<811ea27c-c1c3-454a-b3d9-fa4cd6d57e44@arm.com>
	<Z6Clkh44QgdNJu_O@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_142344_779048_288BCE72 
X-CRM114-Status: GOOD (  11.61  )
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

On Mon, 3 Feb 2025 11:16:34 +0000 Russell King (Oracle) wrote:
> > I've no opinion whether the original series "had value" - I'm just 
> > trying to fix the breakage that entailed. My first attempt at a patch 
> > was indeed a (partial) revert, but Andrew was keen to find a better 
> > solution[1].  
> 
> There are two ways to fix the breakage - either revert the original
> patches (which if they have little value now would be the sensible
> approach IMHO)

+1, I also vote revert FWIW

