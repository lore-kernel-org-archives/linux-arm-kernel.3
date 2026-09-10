Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A203C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 11:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mplGPur00o+D+27OSx5XrYI26Zqpnj1a0Qt5c10S33g=; b=qLrhhzoAiYq2aMG2mY3p861SwL
	OEKveaOEkaqwd9XZ4ptY2lM4IjeHxzWl0+44n7laWilOcwOP4PzTio+g5Tul4pY0sZFqH4u60sFpN
	q40I51SRwFpf7uPzAhkKpSpu7pl0+Gmak3bu9vnL91T/U3VdfJylvNMH9S3t5pK50jqIHZBWZio2a
	MY44VNU/lAUNonqDo64O0yiX8K/Cmwu4pHDFyWTF1s0IRx2l/KyypYgHyb71XmbCNR9eNiHw8KSbH
	nK7IRcJF/FhuiVu7cr8iwT+3P5+i3HRt+DFJ9t8b/yQeI0NJG5dToQIwkxyz030RavF/mCpwR09cf
	Vh44hr7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ck3-0000000EBIL-1Tgy;
	Thu, 10 Sep 2026 11:14:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ck2-0000000EBI3-1gqL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 11:14:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E68242B82;
	Thu, 10 Sep 2026 11:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E911F00898;
	Thu, 10 Sep 2026 11:14:48 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
 robh@kernel.org, bhelgaas@google.com, rjui@broadcom.com, 
 sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
 rafal@milecki.pl, florian.fainelli@broadcom.com, arnd@arndb.de, 
 Semih Baskan <strst.gs@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, rosenp@gmail.com, rani.hod@gmail.com
In-Reply-To: <20260807160526.379-1-strst.gs@gmail.com>
References: <20260807160526.379-1-strst.gs@gmail.com>
Subject: Re: [PATCH v3] PCI: iproc: Use the EROM outbound window on BCMA
Message-Id: <178903888862.11065.11723994266855849894.b4-ty@b4>
Date: Thu, 10 Sep 2026 13:14:48 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Fri, 07 Aug 2026 19:05:26 +0300, Semih Baskan wrote:
> The PCIe outbound window base on Northstar depends on the PCIe Gen2 core
> revision. Revision 0x01 uses 0x08000000, 0x40000000 and 0x48000000 for
> controllers 0 to 2, while revision 0x07 (NS-B0) uses 0x08000000,
> 0x20000000 and 0x28000000. Broadcom's own driver branches on the core
> revision for exactly this reason.
> 
> bcm-ns.dtsi is shared by every Northstar SoC, so it cannot carry a value
> that is correct on both. Commit 767012397976 ("ARM: dts: BCM5301X:
> Describe PCIe controllers fully") gave the controllers a ranges property.
> The commit shipped in v7.1.
> 
> [...]

Applied, thanks!

[1/1] PCI: iproc: Use the EROM outbound window on BCMA
      commit: 552aa843e4c5aa92012d8c55df8471e6c5ba621c

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



