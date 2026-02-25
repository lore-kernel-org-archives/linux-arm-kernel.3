Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB83F55437
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 01:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cwYJHg4wGWkgrMlcQ8jMhd6hHhhZUwlGae/uJKXBKA=; b=s25TlzFh7j8EnNa7xR0QPKwTrN
	z2/ZtjAQvqNZAnC2XtuX4VVIe4ni1/ttqqYOK34W5asQU1ADsQ4A+4H3dBA5XTaQ5f8aFTxvs0ak2
	ZV6nlHX4Pbrv8x7MHlZixJb0LOiNIFba8j0N3nPcPEBnQwW19KsrbXiTRTUeIalykc9w7+GMpcG8n
	ctXqJ8A2GN0Ysf8lksTNmgvTfPxkcZCxwNMvYJZcbdKeiw0Znb1LY9zw2CgglhW6Nz+/nVsLcyYBt
	l+E7SPJO18J+n4CwxVDhMic6jj1WMET2+Acmjlcp1xNxt9TMEkDzfoqa2PWJGnI3vwo8S3JHpxXnH
	Mookoryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv3vR-000000032vK-1A7K;
	Wed, 25 Feb 2026 01:42:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv3vP-000000032vD-1X4j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 01:42:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 59EFF6011F;
	Wed, 25 Feb 2026 01:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F808C116D0;
	Wed, 25 Feb 2026 01:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771983770;
	bh=/qQjUHwquTb5CtLX9o/HbDuVUMkNhBPNqviYoX0oBfw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QEkcb6Tuc0iKl2UxCSmBYbFxw6qntU3lrFUzz4BKQxVoE9/YYNWT13kCfD4+AhcOF
	 RNXlrph3ieqUNHcte7QZ87XLh2tsRGENgva3thu2q/nkJRKuE3q47jCIQkliGFm9Kv
	 sq1FfjwOOVMorQuiiicy7NWc1w2BvMPUqQIcQcGupVdgQ0pq4njJEbLAlx48vxgerr
	 oDaAVWjutWpizzMEuTlc7KgWABpP9CPrjhDQZjss2qV13HhaoTuiHE2Hz6J7E/FEQ8
	 7QThnNxxgGnhXAJSuXnN/ZYqUgNHMSLtIm2nrpf2ZPVoLDIE++SerUtJdGBy+OCh6J
	 fenqV6kLKwnuA==
Date: Tue, 24 Feb 2026 17:42:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Frank
 Li <Frank.Li@nxp.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Mohd Ayaan Anwar
 <mohd.anwar@oss.qualcomm.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 08/10] net: stmmac: qcom-ethqos: use phy
 interface mode for inband
Message-ID: <20260224174248.09dd1cbe@kernel.org>
In-Reply-To: <aZ5QmRjp_78ZT_Az@shell.armlinux.org.uk>
References: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
	<E1vuSL5-0000000AScX-2wuM@rmk-PC.armlinux.org.uk>
	<20260224171052.27bebff0@kernel.org>
	<aZ5QmRjp_78ZT_Az@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 25 Feb 2026 01:30:01 +0000 Russell King (Oracle) wrote:
> It doesn't. The code ends up as:
> 
> 	switch (speed) {
> 	case SPEED_2500:
> 	case SPEED_1000:
> 		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> 			      RGMII_IO_MACRO_CONFIG2);
> 		break;

SMH, sorry for the noise..

