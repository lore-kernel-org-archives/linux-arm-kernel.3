Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8995C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 16:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=BqNAlk7rXAlcVOFBgEHRS+hiVmaJg6AYHU2f42U4Q6g=; b=uUpxTWwaFoXnBx
	658m3Jp81lkrKUzVHny05/oJbyQ7bofD+n0kmzdPP3grE5AJ3V7tAHf+cGMTRUFzxqxCH2eaU9IX8
	xWCuGqIcJ746mht0qTWpbn0UZ1vF+Ua+6Uu/qLsZHEJsjavSHL+bofvp51FZpmfUL2gzniNMCIIMK
	W6ZvjQnqLt7LlOG1Q8Rs0qHMtmwiAA0EAahBg6mE6QMpDQ6CmzYlA8uwRBKj91f0fsL7476+J1hTi
	neaqaSITGT0zU7oYCay/V8rldAzZ2DzsPcHk2YbtzchLOeLmpPH6MqbI4YHcGTP6DuDu8kCDOMih3
	6dJ5GurYZr/mkNBTauuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfNo-0000000FXJK-17kA;
	Fri, 21 Mar 2025 16:38:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfIZ-0000000FW6m-0Vk8;
	Fri, 21 Mar 2025 16:32:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4DB8A5C6DBE;
	Fri, 21 Mar 2025 16:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8A2C4CEE3;
	Fri, 21 Mar 2025 16:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742574762;
	bh=BqNAlk7rXAlcVOFBgEHRS+hiVmaJg6AYHU2f42U4Q6g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=GWoVjPcUuHiSvan9BqoVytjybeH1rUYg6Q+hO/Vd8LJ81fsr9P2d4YUocxgn0yxOZ
	 vczmYLN/eMzwLzMenjR6rL9ISgVan1byWsapnm7/+8jovi5/0TVoqOBzphXfdRZP/9
	 w+hwUmW8i4EEd0yY3RiyZkFu9lz2xJVZwyv2ES9vVQuf6Lm2/kBK81xGm5Pwrkm1uY
	 4f+tNNn3LiTNdgSJWwIb+XaXhGXbSVt3Vldxsng0Q2xexz7cGxbu1Ykk7VDMy6U4Pz
	 66ndKB4t+2pqvev2lAQwD9ltJHIZmKS5WyIyZdgCMEdKE+ve/LRVNWSdJhzdeDZcFT
	 kQeu5OA4CGdZg==
Date: Fri, 21 Mar 2025 11:32:40 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Toan Le <toan@os.amperecomputing.com>,
	Joyce Ooi <joyce.ooi@intel.com>, Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Michal Simek <michal.simek@amd.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 07/57] irqdomain: pci: Switch to of_fwnode_handle()
Message-ID: <20250321163240.GA1130095@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319092951.37667-8-jirislaby@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_093243_202327_B89E08ED 
X-CRM114-Status: UNSURE (   7.53  )
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

On Wed, Mar 19, 2025 at 10:29:00AM +0100, Jiri Slaby (SUSE) wrote:
> of_node_to_fwnode() is irqdomain's reimplementation of the "officially"
> defined of_fwnode_handle(). The former is in the process of being
> removed, so use the latter instead.

I'm fine with these and happy to apply via the PCI tree, but it sounds
like you're planning a v3 with a few updates, so I'll hold off for
now:

https://lore.kernel.org/r/4bc0e1ca-a523-424a-8759-59e353317fba@kernel.org

