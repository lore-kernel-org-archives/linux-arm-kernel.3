Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0201B104C00F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcH6Lc40kzSRAoAYXb6qtKvvgyxtQF34YwNbavKNGPg=; b=dR2xcsmbgXfEnki4XlObsTLtXc
	0jYdcI2WqTiqgBt1beh1gFZd2/kSIEHajcIFvdK4Bxq6R50ovMyVz5X7BXwArmPp0t3DqImzQcNyl
	QzKccHDyN+WOIymhXre/nbslWCZl2a+48f7BtIU99tbe2hK006qs26EOtQxtrgB7TaQl01Kq6rjfq
	D08nVTGLXxqJpTJXawgKzJwWpS7ffmHycWC9YlkfIYRy2/9NEUZCwMJYd5AyEXICNOB8RU8xpGurE
	G4ccBdo70oZOLpWQLn3aqrzRWQGodlh+zcuKTmWdRbC2fdmteEgQjCTPjmxJnzdoapPMwlb93ncR1
	MM332CIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0HI4-0000000BSjv-2WTQ;
	Wed, 11 Mar 2026 10:59:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0HI2-0000000BSjW-2gBs;
	Wed, 11 Mar 2026 10:59:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5145143392;
	Wed, 11 Mar 2026 10:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC28C4CEF7;
	Wed, 11 Mar 2026 10:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773226785;
	bh=NWbVZd2f0Apk9phlC10/UOc9VRa5mnywdugFB8KMC/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NbuVPsolvA1iCHiziVg/YQZCU8nhtZ7WoL4OFlP5RwLzgJ8ArrunKkEZlqWrbRaYJ
	 VBk5Qtaoeroo4VTY/puOUUpEjex4/xAumktU9Ae+/edkR6rDma9z09ZqbhCgTo31EQ
	 JEIqOehOcaZ9n1lsgkD1NfopjyxKU5sCeljbyZDIQLdA20XdghhTsG33WMey843qNw
	 XFit0QD5CNRi0jSpy/KZS+o5+dHVLz7VUn3xoVdN/fB6UYfebbTRY40RPHjVab1VcV
	 Nx0myWJYpWKDdu9F9IEEE3t2zkSfCp/e7g2nXtc74xksA0IXjdRxu7ZQ5ncFzui+VT
	 ncZE8tHF0hEwQ==
Date: Wed, 11 Mar 2026 11:59:37 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <abFLGRn9TYrsycRs@fedora>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <aHoh1XfhR8EB_5yY@ryzen>
 <aHokdhpJUhSZ5FSp@ryzen>
 <tujurux64if24z7w7h6wjxhrnh4owkgiv33u2fftp7zr5ucv2m@2ijo5ok5jhfk>
 <aJ743hJw-T9y3waX@ryzen>
 <lakgphb7ym3cybwmpdqyipzi4tlkwbfijzhd4r6hvhho3pc7iu@6ludgw6wqkjh>
 <aLmcO8ukT-CDZMuT@ryzen>
 <mevtdhght66tds7yhmr5a6xg5a75fb667b6lyvguoxqexmc74p@mroqidhzptxk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mevtdhght66tds7yhmr5a6xg5a75fb667b6lyvguoxqexmc74p@mroqidhzptxk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_035946_701354_F09A096C 
X-CRM114-Status: GOOD (  15.13  )
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

On Tue, Mar 10, 2026 at 07:07:39PM +0530, Manivannan Sadhasivam wrote:
> > 
> > I tested your patch series + your suggested change above, and after a:
> > 
> > ## On EP side:
> > # echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
> >   sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start
> > 
> > Instead of:
> > 
> > # FAILED: 1 / 16 tests passed.
> > 
> > I now get:
> > # FAILED: 7 / 16 tests passed.
> > 
> > Test cases 1-7 now passes (the test cases related to BARs),
> > all other test cases still fail:

(snip)

> I guess what is going wrong here is that you might be rebooting the device
> *after* restoring the config space in 'slot_reset()' callback. So all the
> previous config space contents would be lost and the device would've started
> afresh.

I'm confused.

# echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
  sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start

Will not reboot the device.


> 
> I don't think we can restore the config space after rebooting the EP device,
> because host has no idea about it. It can only restore the content after
> recovering the device through platform specific means.

Am I missing something, or why are we talking about rebooting the device?



Kind regards,
Niklas

