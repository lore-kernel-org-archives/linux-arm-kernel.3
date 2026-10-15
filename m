Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1467DCA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 03:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJEWc0eoUwLODa0bYpq9gJ49xJvUkRMXg6H5LcqBKIo=; b=HAOVgonFFsYeMiwVP6Mcpa1mWi
	t4dFS6LArbJ++V+CQ++gdTDdyZzQ1NnlxAoi9/2zTN4ujgXGfXriMA57r8Jc37aRe2JoZFgk+s7WB
	zNjZxDJsvSg+Hnmxlbfb006tf++iaFTHXC3CGfU8gB6OIS2myFFr/nxYQg6zKYMa4V6p6TWzRHk4m
	ie1fBcVfFReH0UkRD9gYi45gBx5TPQ61ihMXrxjTpqlIguQw5Y7nJn79W28/Jqu3mCVvO6OCNNIST
	7LpaplUf7xO7OiPThFY11zwaDDtiBYFvtD7dcRs2BYE+fUstMNIbDr3sPFn9PkS+l2dur5Jz/1Cwr
	zKqQtRoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCa2-0000000Glr6-0Lbf;
	Thu, 15 Oct 2026 03:56:34 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCZx-0000000Glnr-0vdv;
	Thu, 15 Oct 2026 03:56:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1792036578; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=HyjvtTwhbqCnEDH+MM5AHhQ87mjpWDv0DrsKtXsvxuq6lhn5N8rGWPQIDyZY+fAh3AwiXa8Xe8gKNdvpdhizsg3rYIKeozFX0ia2GSRiCj5c2xsb6FL/h3xmfTAbUqDsPQh5Jh8U/yD/0CZi0W8xf58qk9HbFWXjr3xClzlQGHU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1792036578; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OJEWc0eoUwLODa0bYpq9gJ49xJvUkRMXg6H5LcqBKIo=; 
	b=E2eOfspFM5gCwbCsatAD8Fn64RGT0FWn/DZ21T2Vv7mPZIfNcaJBPbyt6tyxbyE4w8/sHczqOnDHrTzd56qEYsQOgN7zpToITst4OEZuCqK8qcKj1HEtzHAJlsP9QHCB44m8hXXcJ/MMGYJJcgDkbp5t2xrV/r3djHvQzPQvJKw=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792036578;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=OJEWc0eoUwLODa0bYpq9gJ49xJvUkRMXg6H5LcqBKIo=;
	b=Akc0haoJe+d24pdB1r5qr5Bcd+Rzg071FeSpZ0OaUBwMo+3lG/uVXD9prR3yw8Jw
	+yU+IVSHY82dU1hfI40eJWMTNT8+27LnGlakJMMMuQtW/TVDIaykx4UkM1jGgrcfk90
	XGvHILAdm1gFbK6VaI6HvHZKz7m07gmIqnLQQt28=
Received: by smtp.zoho.eu with SMTPS id 1792036574971162.77080539620772;
	Thu, 15 Oct 2026 05:56:14 +0200 (CEST)
Date: Thu, 15 Oct 2026 06:56:12 +0300
From: Igor Velkov <iav@iav.lv>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Alexey Charkov <alchark@flipper.net>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH v6 09/10] PCI: dw-rockchip: Add system PM support
In-Reply-To: <20260908-rockchip-pcie-system-suspend-v6-9-fbabcca9921b@collabora.com>
References: <20260908-rockchip-pcie-system-suspend-v6-0-fbabcca9921b@collabora.com> <20260908-rockchip-pcie-system-suspend-v6-9-fbabcca9921b@collabora.com>
Message-ID: <20261015-m1-tested-by-pcie-v6-09@iav.lv>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_205629_545678_85365A04 
X-CRM114-Status: UNSURE (   7.66  )
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

Tested on ODROID-M1 (RK3568, NVMe on pcie3x2) with 7.3-rc7 and Jonas'
EHCI/OHCI clock patch: s2idle 4/4, deep 6/6, the NVMe stays usable
after resume. Without this series it is lost on resume:

  nvme 0002:21:00.0: Unable to change power state from D3cold to D0, device inaccessible

Tested-by: Igor Velkov <iav@iav.lv>

> +	ret = dw_pcie_suspend_noirq(pci);
> +	if (ret)
> +		return ret;
> +
> +	gpiod_set_value_cansleep(rockchip->rst_gpio, 0);
> +	rockchip_pcie_phy_deinit(rockchip);

When pci_host_common_d3cold_possible() returns false,
dw_pcie_suspend_noirq() returns 0 without setting pci->suspended. The
controller is then powered down here anyway, and dw_pcie_resume_noirq()
returns early on !pci->suspended, so the RC is not set up again and the
link is not restarted. I did not hit this path on M1.

