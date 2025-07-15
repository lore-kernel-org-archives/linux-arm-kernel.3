Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DE4C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 11:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEqVl7UTU3h8kIn5gNcr2TqpCsHuRyehsMYidQ99ptk=; b=uKoUbM7FlMAMIOpntFDi/kSpqG
	jo/nJmtCyRAA9TdSeIkww/YGT8z9YzCVX6VW1fCUo7ai9SJeBFswShHF1K8opJgk7r+XJ4OlSkE7n
	TKoSZ+GfDWGm0fjTIqyTK4aR4cLDIxshO1awY+vkoe+8uzWBpU/JMLOwZdKb/uPD6XwxIbuKfuOC1
	yL5UUmHFzsx1efOlXChjmqli+V7G8sOK7bYIbLjAp1FwboMThUrE7xZgD9LMiIPxuovm3ev73unt8
	KQjIz9j+4GZbs0notbNaJ0fMOtG0imbKR9WJtLJrweq0W2B/2uOuL1qZTD4wHcjMGvsLrpLNYfgoW
	SNfKQW3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdW9-00000004u4V-1y8L;
	Tue, 15 Jul 2025 11:08:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdRs-00000004t8q-30zI;
	Tue, 15 Jul 2025 11:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=pEqVl7UTU3h8kIn5gNcr2TqpCsHuRyehsMYidQ99ptk=; b=wyWkt5FS+IPee6aBG5i6+WSE9Y
	hfqG4TkExza4sbE8Pdeb+WY6+o+b5r0OhUFePlSFGQCFTDeN6Or6qrzt4N2ZgMlH2PTgsA8vctxqF
	g9aa4GE2dK32gpVqQi8qvGUNL1YgDIuDx3qbXkjGyjXvqneYr5qzP+7L52ifCCAM3ZnZF2KUgpw0J
	pbKn6DF5rLazeeE5jwi1z8yP8Axkf+umkvkH80xggIQg1KNHvwMbcs4Wr/pnxDWW1hDnKjrBQfJ1K
	yqufcjGTfSKtA6nA3Z3PvtyRfHQ4RZRKC9cFYPe+rVKJYEe1Jz5WBZfqeleacV6xENmzNAtrN4TeD
	mqZhWf4g==;
Received: from [194.95.143.137] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ubdRd-0000L2-2C; Tue, 15 Jul 2025 13:03:33 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 00/10] rockchip: Fix several DTB validation issues
Date: Tue, 15 Jul 2025 13:03:23 +0200
Message-ID: <175257739695.2521784.1985937428277626271.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250709132323.128757-1-didi.debian@cknow.org>
References: <20250709132323.128757-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_040348_754020_A35B6002 
X-CRM114-Status: GOOD (  10.53  )
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


On Wed, 09 Jul 2025 15:15:13 +0200, Diederik de Haas wrote:
> This patch set fixes several DTB validation issues and consists of 2
> parts:
> 1) dsi refactoring
> 2) various low-hanging fruit
> 
> ad 1) The display/rockchip/rockchip,dw-mipi-dsi.yaml binding had:
> - #address-cells
> - #size-cells
> 
> [...]

Applied, thanks!

[03/10] dt-bindings: display: rockchip,dw-mipi-dsi: Drop address/size cells
        commit: fd5fde69fd413b03e25fb3b8e2ce375c02e74b0d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

