Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21720CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWzbVqXKqlLhMTXMhWl75I4B1ITnek21sHfRPSvI0hk=; b=YCFQNiPSmQJwkWzm6vxt4Z7GzQ
	w95B9Pv8lkm5T3BZffrAUmL2WVjyFn5lFhF6GRoX8QTZRAQhV2uyn3i+Ibb8vds7atJS37eosDgS1
	sYrGPqlPZrVAvjuqSqmffVuw0Xa7drRKhwKjRrOy8BLOycm47t5BVjOuq/4U8XTrPdVfGBg8BJ762
	SByq0eRw5XKDedLmiQCxwj/YAHd448VFJEvgUahIHBg/UKFbH3j79z+wZzMj3zr8rAQL+ZWQizlf7
	skZYN/NDzq5x8oWqZMHoFPnEnGVs+EWDn9jm9UQcGDNCxx8d4Z42Sz48XCufsidS9F7VAaa0q0W7c
	Y37wUFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bsN-00000009hCW-3jqh;
	Mon, 22 Sep 2025 08:26:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bsM-00000009hBf-2XZt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:26:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C171F601DC;
	Mon, 22 Sep 2025 08:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03796C4CEF0;
	Mon, 22 Sep 2025 08:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758529581;
	bh=iWtix78nYDZYMD+U2a6eSVd9K/58kNpJXIaJTZ1nn0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C1or6x71jBs1XtYbAnjOxV5JkM5KIpJjYhihwE1WvkcHy406/8hEwW9YTEcDzGcxh
	 2WObbfnBRx67JLgV6G8catCybuOaW8qQQKQMUCJ+Du9HklsshamqXe+KoJCF7wcLVI
	 MNH4qYb2jNrA1eQvsrw4sk5b90OY3fqyWRu5JDD7c/FBXYQ2fkxodcfWgCrtBp+lpD
	 AoV5SSmh641jlDI1at+CH5VbphxUDkROYBJTJFor5PtDoyWxkwwJEWUtQb5L3FeE4s
	 4/mmLyL9oXjXfbjhX4jThyWOlmZ0aj+nAMQAbcgeTU5w6rZJvH6f3elE5TaQg5qBhg
	 96LUJT/51Q40w==
From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	christian.bruel@foss.st.com,
	quic_wenbyao@quicinc.com,
	inochiama@gmail.com,
	mayank.rana@oss.qualcomm.com,
	thippeswamy.havalige@amd.com,
	shradha.t@samsung.com,
	cassel@kernel.org,
	kishon@kernel.org,
	sergio.paracuellos@gmail.com,
	18255117159@163.com,
	rongqianfeng@vivo.com,
	jirislaby@kernel.org,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH v3 0/4] PCI: Keystone: Enable loadable module support
Date: Mon, 22 Sep 2025 13:56:08 +0530
Message-ID: <175852954905.18749.5091036983349477093.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250922071222.2814937-1-s-vadapalli@ti.com>
References: <20250922071222.2814937-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Mon, 22 Sep 2025 12:42:12 +0530, Siddharth Vadapalli wrote:
> This series enables support for the 'pci-keystone.c' driver to be built
> as a loadable module. The motivation for the series is that PCIe is not
> a necessity for booting Linux due to which the 'pci-keystone.c' driver
> does not need to be built-in.
> 
> Series is based on commit
> dc72930fe22e Merge branch 'pci/misc'
> of pci/next.
> 
> [...]

Applied, thanks!

[1/4] PCI: Export pci_get_host_bridge_device() for use by pci-keystone
      commit: c514ba0fa8938ae09370beecb77257868c1568a7
[2/4] PCI: dwc: Export dw_pcie_allocate_domains() and dw_pcie_ep_raise_msix_irq()
      commit: db9ff606a5535aee94bf41682f03aba500ff3ad6
[3/4] PCI: keystone: Exit ks_pcie_probe() for invalid mode
      commit: 76d23c87a3e06af003ae3a08053279d06141c716
[4/4] PCI: keystone: Add support to build as a loadable module
      commit: e82d56b5f3844189f2b2240b1c3eaeeafc8f1fd2

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

