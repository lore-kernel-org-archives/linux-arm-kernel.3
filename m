Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D92AC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 21:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oSfONn5Yz63lyUzLtV+gfMtS9ynEzwvoGCshYVSCu4=; b=EfGiNhZ3KvTMW6qfI7EhkRk8AD
	s6q6i08K7DmxGIKufYDls1a4dmkTaCmZEKZRDFLXws9oj+TK8hqbQYkr2akP6geccIgT0uY79pIu2
	kdrlDujKTVOfks0ZWl2PWgNuUb5O7yKn8kbIyt0n2WooQnkE2gmqHLca/g2e7DN6SdJ5YUw2Fh80S
	+UG5JRmBd42kjzkLVTHA8Fo2nmisrhh7GFSNaAkqK2+NBElfqDc0DFjxwirA8Ba46+N90VF40hZRe
	gYsJuU1u8yZz+fwDdA6olE+ifeS+PJy1hOAqyhdhZwH1txBYRe0gdoFQ5+l5LSuKOshxWXswDSDNK
	CDzFqQFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXIB-0000000CsyN-0pza;
	Mon, 10 Aug 2026 21:12:19 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXI6-0000000CsxS-0bF6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 21:12:17 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 6FA341F8D1;
	Mon, 10 Aug 2026 23:12:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786396331;
	bh=4oSfONn5Yz63lyUzLtV+gfMtS9ynEzwvoGCshYVSCu4=; h=From:To:Subject;
	b=XWTnSgQBHutL2fKLqJf4aoRhkbR7qWiLGZcae4flULuRgn7Tb2aM5hav9mSUzoGMU
	 ur+BfXUM/0J4oYdc1GRs2qSoVMPymIeTZ5toEAc21RekgM4zhNRRR7/uOC6hjYqu3q
	 72IXMHiR5hqiDLOghTTwNzGbiwY2Hcyi2zZda7RWS2vA75r3FRiBi7MY18UtAqE7j+
	 ld5sGLfTehy8Q7Eq18+tc8jCdRw0HvThS/I611mRCR+vaZPuxMIEQcH9AtxnX59u4t
	 2+dnSc9VXLRFqg0Sd3GPt5u2tKSPrbXmvA+ZACLkKpDVJanaGlD6+HotDsa208IQKC
	 OLBZwUxNuPlSQ==
Date: Mon, 10 Aug 2026 23:12:09 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	regressions@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, leonardo.costa@toradex.com,
	francesco@dolcini.it
Subject: Re: [REGRESSION] mainline/master: PCI link creation fails on Apalis
 iMX6
Message-ID: <20260810211209.GB4821@francesco-nb>
References: <bl7i3obu2clzsgeoct2a4mtfhv6typcjdqmgneropf3hpgwve6@n2m5uhlduw57>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bl7i3obu2clzsgeoct2a4mtfhv6typcjdqmgneropf3hpgwve6@n2m5uhlduw57>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_141216_043485_934A1BF9 
X-CRM114-Status: UNSURE (   8.28  )
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

Hello all,


On Mon, Aug 10, 2026 at 02:54:45PM -0300, Leonardo Costa wrote:
> We are seeing a regression on Apalis iMX6 where connected PCI device
> links fail to come up at initialization, as shown below. The issue is
> not on the devices' physical connection, as they worked properly on v7.1
> and are working on other stable kernel versions.

just to make this more clear.

610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
introduced a regression that prevented the boot. because of that we were
not able to run any of our test in our CI/CD

commit 7678e81498e2 ("PCI: imx6: Fix i.MX6Q/DL boot hang caused by improper PHY power sequencing")
fixes the boot issue, but now PCIe is not longer working


Francesco



