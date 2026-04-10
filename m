Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55015F45A0D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 22:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=03KDR3YJYERdvAhn4kP4FR9bT80SF8m4Ixv4eGYeKDU=; b=WFT9fbCE0fMhfs
	ekZlKQaTe5BSHzNqVUwFzlENlqqJtfPU+NIWIKSJkwEmnAQWtQfUbezx84HJ7eplNmOE0Ig+YlPjJ
	QY61jlU9tWMfL7zsDeOxB+UBqMj3WzhjFNcZZhHLGceIS90gbXJO50kMI0TfxPksQTaRYeXfI5kWB
	vYLu1yrsmBOekPNAaLPAzlgHOnPDza9lJiDsjqeNWFxBevJydlSEeELNZHBA8a7K2sgavhIOKJnm4
	nRQlr430g71iTrErdYn+R94LOz1i4opeBeUATLDbhTNbJ0cNZ058yXO3yognN+/Cd4O79s5Xq62mu
	MCq+7sPeSLOzYauUTnzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBKjS-0000000Ctwl-2Fun;
	Fri, 10 Apr 2026 22:53:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBKjQ-0000000CtwP-2wJ4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 22:53:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B97343FB9;
	Fri, 10 Apr 2026 22:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1193CC19421;
	Fri, 10 Apr 2026 22:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775861623;
	bh=9VBjNQAzbB9vwgFa9GsT6+N9W2jFYIIY2jEQ/4Yjw7E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=JlDXbIlbK5X40pJZvtF0DRYkDEl98GwzuiRxiheKDsqyaB3Tmemx7eemj1/VWTZtd
	 O50M1m/s7YWxzlT4PVxQB+OXsHFxvsOFWVEKuEASn1qzDyIiNdBmSQpyoptDTtItn/
	 fziGS/McdLELE72g+lmuXFc3SPDW7ulyP5gVM+jju34DQ9L6IbPiYYrDzWfCRAX6ds
	 zvU4ZpefRlXXQEeuD4G+xDVGr+Bcw/M80+N+ORk40JJsMkX4n6WgRuKcRj6ocNQbDy
	 6kKvOkowpl4YDki/Z22Hd5lVxjf8tyIpR2JBKaWfMYI3oDFVhgCDHb2TNMnhPJIEJa
	 PbAosXJR4dLpA==
Date: Fri, 10 Apr 2026 17:53:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "mani@kernel.org" <mani@kernel.org>, Frank Li <frank.li@nxp.com>,
	"jingoohan1@gmail.com" <jingoohan1@gmail.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v1] PCI: imx6: Add force_suspend flag to override L1SS
 suspend skip
Message-ID: <20260410225341.GA598942@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB883374CBFD3C97CE54DFB4C48C5BA@AS8PR04MB8833.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_155344_781238_08F020B9 
X-CRM114-Status: UNSURE (   9.35  )
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

On Wed, Apr 08, 2026 at 02:38:35AM +0000, Hongxing Zhu wrote:
> ...

> One additional note regarding NVMe: ASPM (Active State Power Management) is
> disabled locally on i.MX platforms for NVMe devices. This decision was made
> after encountering a system hang issue similar to the one reported by Hans a
> few months ago in his patch listed below.
> https://lore.kernel.org/linux-nvme/20250502032051.920990-1-hans.zhang@cixtech.com/

Where is ASPM disabled for i.MX?  I don't see anything in pci-imx6.c.

It doesn't sound architecturally clean to me to disable ASPM based on
whether an NVMe device is involved.

