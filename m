Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A825C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=za8CBxsE9T69C2XsKn0gVUSqxGroUxY4SBbYQfviVss=; b=KaWNfuePkoeU0zcq3rF0KvLbA4
	CPHxV8tZpd2RzJIs+V7psWvs0mjVhfq3OMZIuSCPxa03QFAP3GL6Jj4MULRVAyGeNLmJmO1wS3A4i
	GpathEajOvVWyYTH90v28PQhvr54FhE+mK/1PaU5iWL9dU5voSE/+2FdY4RRDSTBZZEUY3FbdBV6Y
	2VriOwwgcdq+vVFXDuWXuPC2pYiwAz3RIz0kITdEgTvvIbc7F6fXpRzC40cxa/BFnwkH1QVC6/3tK
	0yy2u5rez7/+sXg85lMsflWOcpAkrQ4OGM5SgpJZ9b55jE2Q+uOLNXKw4e5C+lAgD+Tl/Y9I9/ZBm
	CF+n5gOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhHq-00000002lMQ-3K4I;
	Thu, 28 Aug 2025 18:23:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urewf-000000029ll-0fjZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 15:53:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4917F40489;
	Thu, 28 Aug 2025 15:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854E5C4CEEB;
	Thu, 28 Aug 2025 15:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756396428;
	bh=HIE7vqMsij/Ls4YiN95VhdIT8axgc9qXGGvTPolxats=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PQwXLrgmKhXTFOf7XrKvFJ8D5HLs1QsafBd5GCtKgqt4XMNk+iqcgQKgscEhs7Cxn
	 wfGHdeyoUu16GP4ifwquJ5PEZtKdVmTaCDzAMxT77dCitX7rHiUiBrGEGPZe10BtGb
	 rK4w/dKfDrzDjydwGkdu4t4rhfEWgusX0fAdBzo+qvXTSz5RThgp8w/n1TTPT+9uTZ
	 EpjsbXTvYddyBlf4eUQCJUT+rdzaqE/UQMJqJTeTgSBlziZqrCOVJoJsRaO0cN0qpp
	 zOhJcwT2G0Mcu/cw+3PGATyDkN4PBukG9z5VUXqKBJIZqRbgyK9FmVisxAvaVT/iAc
	 Xu+UkdF/jzNTQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: lkp@intel.com, huaqian.li@siemens.com
Cc: baocheng.su@siemens.com, bhelgaas@google.com, 
 christophe.jaillet@wanadoo.fr, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, diogo.ivo@siemens.com, helgaas@kernel.org, 
 jan.kiszka@siemens.com, kristo@kernel.org, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, nm@ti.com, 
 oe-kbuild-all@lists.linux.dev, robh@kernel.org, s-vadapalli@ti.com, 
 ssantosh@kernel.org, vigneshr@ti.com, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
In-Reply-To: <20250728023701.116963-1-huaqian.li@siemens.com>
References: <20250728023701.116963-1-huaqian.li@siemens.com>
Subject: Re: (subset) [PATCH v12 0/7] soc: ti: Add and use PVU on K3-AM65
 for DMA isolation
Message-Id: <175639642101.69919.15722042082613439643.b4-ty@kernel.org>
Date: Thu, 28 Aug 2025 21:23:41 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_085349_223565_07C3FC18 
X-CRM114-Status: UNSURE (   5.97  )
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


On Mon, 28 Jul 2025 10:36:54 +0800, huaqian.li@siemens.com wrote:
> From: Li Hua Qian <huaqian.li@siemens.com>
> 
> Changes in v12:
>  - Fix Sparse warnings by replacing plain integer 0 with NULL for
>    pointer arguments in ti_pvu_probe() (patch 3)
>    (Reported-by: kernel test robot lkp@intel.com)
> 
> [...]

Applied, thanks!

[2/7] dt-bindings: PCI: ti,am65: Extend for use with PVU
      commit: 57a48a2619c5f99d48748f9c34db510efe5ee7c9

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


