Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CE4C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7sB1dmuD3GoUpGEiENNK8mtmzVT+tPo02Qc2OEU6BSI=; b=sVRuJNETltKbT4w87PRtX1VS20
	GOmKelxTdXqIUqi+8S0LhbXg//7ajIxKt2SefN7U33bLCNZ9msWtDUZWMyCF8czie9SsgCahY/lUh
	MZ1/Jd7YKxE9w99mlrsOOz5o+DR9ugsrombcvE7NtZUwAAC6QmbuxlI53IWaLYV4dD+0LPEI8tYwI
	1lhyzWkhDbu/cr6mHsm43cdVdue/NRKEnmv81x2UdLQUKE+x9+kJKbK6nmPdhywcqjeXO/LNV+My1
	HIIBO0n4wBt8+9Od+1il6cIb3VT0OlOwB1R7f2Uau93vs6j4FUuANngSNVmPPp969Ho1oGUdtVELC
	63jNteeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7D6w-00000007C79-36nw;
	Tue, 22 Apr 2025 12:52:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7C3S-00000007022-0dc6;
	Tue, 22 Apr 2025 11:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=7sB1dmuD3GoUpGEiENNK8mtmzVT+tPo02Qc2OEU6BSI=; b=1le15bX3kNYT4sUNY2Wrjt/GOy
	ii2yyzYgWEbcGsSzMMBiQ+xE+hPzZwy8wUPqDMJEYntpikNZhzaXLFYecyMRHkQyjoPe8iIhrwKDE
	Ec8uTlmACS5xjGK94UqaO/TiTKUepSRje0NVodc+Vag4d5CYTfdP9egLdQFqHPtxBncnLeHmb3+nG
	qrhWQPKlZ63/m3gUBPMDeBv+glssWPXZHqLfJefm3WpMIUSzj7NH6BnmRZWd3D21X3381/PYvUJn1
	MgImJGhPrbFMBsW6YI1N7d7GgP7FioNbCJauCmJ05CR4/YwFl/aksPkTXqz9tACb+JMoeNobg391G
	fnzu0iwg==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u7C3I-0002kK-4j; Tue, 22 Apr 2025 13:44:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	andersson@kernel.org,
	Simon Xue <xxm@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v9 0/2] rockchip: Add rk3576 pcie dts nodes
Date: Tue, 22 Apr 2025 13:44:24 +0200
Message-ID: <174532226023.263993.13596887054519094900.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250414145110.11275-1-kever.yang@rock-chips.com>
References: <20250414145110.11275-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_044446_187253_6D1817E8 
X-CRM114-Status: GOOD (  12.72  )
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


On Mon, 14 Apr 2025 22:51:08 +0800, Kever Yang wrote:
> This patch set adds support for rk3576 pcie by adding the dts node,
> and this series is a re-base on v6.15-rc1 and collect tags without code
> change.
> 
> Please help take the dt-binding to PCI tree if there is no more change request.
> 
> Thanks,
> Kever
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: rockchip: Add rk3576 pcie nodes
      commit: d4b9fc2af45d2b91b1654c4aaa1edcb4dd8f4918

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

