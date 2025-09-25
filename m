Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60E6CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 17:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PIlcFjgZarxyQX8tYvIklpcjXgHmqqeObMBPb5M0b0s=; b=xN4vETP/Z+FpRT/fPV/Lj7OwnY
	Rsv2tlq4ez1CF3Ra1c1T/T1Kikv7SV+wjF1O/dyacODLCt5B+2SEHxemGuvR0l9w5sfBUs2tOYvPo
	S8wWaBD3CeH/oKhTnPZn/Y6LGKXwy6TvMOt/5hyJfscMK+oSJqNX04m842Ql0zSU0kw5ugJCGV7//
	zBFbaDrjJNE1dn92ig8d9g0om68XS/pKlSU9jRtNxE/mAe7Ah3lgaMGV/XjvjckILRzqF8FMqLJU8
	s/kH1rKgrkFZsq9ug1VbCAr75mQxSS1NjJ4GUTXR/Whx10wJ0GXlTRtJ73JhxTwqL7zPViVxOGi7v
	BjCqpqyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pP7-0000000BNK5-1yOM;
	Thu, 25 Sep 2025 17:05:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pP5-0000000BNJP-0Swt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 17:05:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C6C5843E1C;
	Thu, 25 Sep 2025 17:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1758C4CEF0;
	Thu, 25 Sep 2025 17:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758819910;
	bh=LiqXXsioRh4a6BaPKJmLKa3mWFCksTvXxuDRwrP9b84=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=i0whetM5glZXecBehF4IA10tgLqJ3l80Bs0zH+sw0sCCjJyBA8uzJevBKBEHvua+w
	 dVNKpkBGITnUp44lN9rtOT1TncqjPQ/IqRUT2MgpxUsmTBmuX1j1nr5Cek7mGSDeuj
	 a175Ms4RJR4An80EjBmH7dG/RtleO7UAmLr2wcbZYnFGSlQXWJv2KLL6xf/VrCfSwe
	 0RmrNhW6K/M6z8v+EnkY/YORlbIT8c7xKLnKYIsqMSzXJBLx8n1SCUI9Pn8dQb0vEV
	 4dw0Fiw0BCTHV01jxhhHoHQ8SGoqKq+wix0sgj7FNJ83echucxEM1rpd8g7+122lNG
	 wt2qw8vHvmI8Q==
From: Manivannan Sadhasivam <mani@kernel.org>
To: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de, 
 lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
 bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, 
 Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20250923073913.2722668-1-hongxing.zhu@nxp.com>
References: <20250923073913.2722668-1-hongxing.zhu@nxp.com>
Subject: Re: [PATCH v5 0/2] PCI: imx6: Add a method to handle CLKREQ#
 override
Message-Id: <175881990427.392988.6937520327985325506.b4-ty@kernel.org>
Date: Thu, 25 Sep 2025 22:35:04 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_100511_182966_58188807 
X-CRM114-Status: UNSURE (   9.12  )
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


On Tue, 23 Sep 2025 15:39:11 +0800, Richard Zhu wrote:
> The CLKREQ# is an open drain, active low signal that is driven low by
> the card to request reference clock. It's an optional signal added in
> PCIe CEM r4.0, sec 2. Thus, this signal wouldn't be driven low if it's
> reserved.
> 
> Since the reference clock controlled by CLKREQ# may be required by i.MX
> PCIe host too. To make sure this clock is ready even when the CLKREQ#
> isn't driven low by the card(e.x the scenario described above), force
> CLKREQ# override active low for i.MX PCIe host during initialization.
> 
> [...]

Applied, thanks!

[1/2] PCI: dwc: Invoke post_init in dw_pcie_resume_noirq()
      commit: 27afd094ea4be542594058d685c7af4654ab8de7
[2/2] PCI: imx6: Add a method to handle CLKREQ# override active low
      commit: dc853fb85d6b90e0805660c1dbb38ef7641af839

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


