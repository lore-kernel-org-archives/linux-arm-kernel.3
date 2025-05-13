Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB63C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 08:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcS65UQA7FFYTs5bK+6Y4euPE4rS0+rTQjkMqtZppV0=; b=tjHOWydYxtQP5BtnyWijyjllQB
	MdPgzGBFH3oC53/d58L9XE1OewUzcX/REo/qHbdo9KjiDXHhpX36dmn2fsKoTGVyvQY7SRMmfWC88
	tTIJJ9Asyq0yDEKokns5XMNUtUo+aYE1F7bjWKq05GLzaBVyrnGWmUh3sRN6F2S3sU0a8dOMfuiPh
	SaAz7aS99t1Nqyu/2H3SXAniIbGamGcI/2zItO/PzB1dUOMz72wr4m1aioTQ9SpmofsVJKAF4pgDQ
	QhfajjJ8lldxWcKWHHswIM/LQdR6L/orLVMool2gFSDR7ofEz/GcOukbjRdg8aTt+Jp+AEojZW37h
	6tIix8UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEkep-0000000Bj0L-3BzZ;
	Tue, 13 May 2025 08:06:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEkcr-0000000Bik5-1Rte;
	Tue, 13 May 2025 08:04:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 60EC560007;
	Tue, 13 May 2025 08:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131B3C4CEE4;
	Tue, 13 May 2025 08:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747123472;
	bh=7I1gwSaGTujG4gf8FypyquviBk2E4QA6iyS8EFE6L6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pYAwYSA98xROfFniPKW3Fnq8c74xOH7tQB+7DL1Y3zkoNSUZa186JCYkIIk7ybc78
	 7AbBU7MdRy2DIyGDFmaL67xunDbaKOH+e49iBT1rl38dlT7eXLtzI7CwfKdBPKzKMz
	 NYF9WFAsOL28v3+dWBFFLxX7AH9Bc3wffNb3cnv/7RBbOkniVAw03ynnpN42vMcEy4
	 CqQQBhbnGtNA8ZcO3oukS9kXVQWDWe0gJRRikY2FbxSbgUiLCHbKiGxJOAtoGM+GJM
	 tGLoKBIu5QCyByqotji/y2HAziWoVDAk2DJ7knsHN3BZxI/ELVUPPeR4oA351WZ0pU
	 ZlYmsSP8YGZvQ==
Date: Tue, 13 May 2025 10:04:25 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	heiko@sntech.de, manivannan.sadhasivam@linaro.org,
	yue.wang@amlogic.com, pali@kernel.org, neil.armstrong@linaro.org,
	robh@kernel.org, jingoohan1@gmail.com, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 1/2] PCI: Configure root port MPS during host probing
Message-ID: <aCL9CStLrGEY2MEH@ryzen>
References: <20250510155607.390687-1-18255117159@163.com>
 <20250510155607.390687-2-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510155607.390687-2-18255117159@163.com>
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

On Sat, May 10, 2025 at 11:56:06PM +0800, Hans Zhang wrote:
> Current PCIe initialization logic may leave root ports operating with
> non-optimal Maximum Payload Size (MPS) settings. While downstream device
> configuration is handled during bus enumeration, root port MPS values
> inherited from firmware or hardware defaults might not utilize the full
> capabilities supported by the controller hardware. This can result is
> uboptimal data transfer efficiency across the PCIe hierarchy.
> 
> During host controller probing phase, when PCIe bus tuning is enabled,
> the implementation now configures root port MPS settings to their
> hardware-supported maximum values. By iterating through bridge devices
> under the root bus and identifying PCIe root ports, each port's MPS is
> set to 128 << pcie_mpss to match the device's maximum supported payload
> size. The Max Read Request Size (MRRS) is subsequently adjusted through
> existing companion logic to maintain compatibility with PCIe
> specifications.
> 
> Explicit initialization at host probing stage ensures consistent PCIe
> topology configuration before downstream devices perform their own MPS
> negotiations. This proactive approach addresses platform-specific
> requirements where controller drivers depend on properly initialized
> root port settings, while maintaining backward compatibility through
> PCIE_BUS_TUNE_OFF conditional checks. Hardware capabilities are fully
> utilized without altering existing device negotiation behaviors.
> 
> Suggested-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---

Looks good to me, but since this I'm the one who suggested this specific
implementation, it would be good if someone else could review it as well.

Reviewed-by: Niklas Cassel <cassel@kernel.org>

