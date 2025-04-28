Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C140C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 08:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnmNm7WNI3dN0hZzkI0OO7d/tL89uZg4kPZ2C++s6Ig=; b=XRqiHNfD/GNEn7r8aMHyhoNVIA
	4J0LWZMGOR1ZIQCmHlto40an5yJK+Gv4ljpyJQGS8KyZqbwsQkoUzahrA92SkCMyp4JUO8dZnha2r
	Faic4Mhq9YwK0SXsLSssJmcWnqGx+ZD9Brsquz8NaxtyHv1tqWKEjtXUIpDFW+H7hcMECYIlRNJxv
	AOQkKvpkKnGNdJ7K0AmaY6dzlWLuCGtLSMEO+Nxv3fUHLyasxIm/RDcEkQzh5g9THtMPFIuXtnPY/
	pmHthJ+llwr51FZ4antyu2Hi0ajQ8ZZ6JJEUTxanjAxZnX5e0jKYwNPBlIRIRkNfOh8KmMa73ZosZ
	Eq31HViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KFb-00000005WTA-2MkT;
	Mon, 28 Apr 2025 08:54:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9K47-00000005Uvo-0LJa;
	Mon, 28 Apr 2025 08:42:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LnmNm7WNI3dN0hZzkI0OO7d/tL89uZg4kPZ2C++s6Ig=; b=CXO1Uk9Xj0LQCKde41itDnhIxT
	vGH0l8qjoM0j53itiIYHdzzYDZvgDBjQ+Z1JzI3m0FYIaOBYlzQR+Wsy+0ng4LCQhTZ8b8BuxAnC+
	c1NNcu5O2iIEzzJfk/4mlvTRoAI1gZwOsod2Pz8WXgdzqi0xwU8UYTvmOeNnMQhargxGxR+hBqswO
	p2f4TS2PY1ejdFM0LWE+HkCbwTu/HKcheV3Eur5xkNJtisc5DczE90GxmuZc6k5fQH+Ncg44JbWZa
	cCyr/v99mdYCEDVC6ags1p2fP1pSaK/MFXZz6ehFEB7BJtT2APukeHeYA2geUKwjEoNpfVIrOagxY
	fKfqsEwA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9K43-0000000CblL-3fqa;
	Mon, 28 Apr 2025 08:42:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E8FB44A8AB;
	Mon, 28 Apr 2025 08:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966BBC4CEEC;
	Mon, 28 Apr 2025 08:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745829725;
	bh=bEhWigbCGAEUWFJ8JkgGyCA/a4Jw1TYA21NKw6cRiPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j/Gg3E3fhyeQLQVMiNG1WHtkk53Qf5q9PVGm54dj42RztAU2xCtIsDNi8tWVa33QZ
	 qVaQ0Vx5Thv6Z+BRv8GJDt6m91NDyHFaD+2eyfMDXuQMNfcqBVEiVc/JtADE97rCLJ
	 /1eoeiP72GuEn3gshvawW/CvYdWipskarCM7wH68m+7CRbyyzSvggEiiP5LoM8eJYc
	 MIUExiVVOxLWm2mszicYR4iYigJ9PZ4xvenUIjaQ0AfceCDOqgYR3jSChSSmLLC3mg
	 ztdpKRZYbenHiqWvY9YDuMVOqnb1jOMCvCcZgSy12VlDNSIVef8SW7FmfR9NQE8rGf
	 4bIl3NOmzQRfw==
From: Niklas Cassel <cassel@kernel.org>
To: Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Niklas Cassel <cassel@kernel.org>,
	kernel@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-ide@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] RK3576 SATA Enablement
Date: Mon, 28 Apr 2025 10:41:32 +0200
Message-ID: <174582939239.704591.18413477868629759543.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424-rk3576-sata-v1-0-23ee89c939fe@collabora.com>
References: <20250424-rk3576-sata-v1-0-23ee89c939fe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=687; i=cassel@kernel.org; h=from:subject:message-id; bh=bEhWigbCGAEUWFJ8JkgGyCA/a4Jw1TYA21NKw6cRiPc=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDL47e3WNM4Q6W/6UpNetH99SP87w9LUbD7DNzLnI4wbz XfxunzvKGVhEONikBVTZPH94bK/uNt9ynHFOzYwc1iZQIYwcHEKwEQq7jL8FbKwWjHbfNr8siOi CbMcpWyvMvvfPsXqs+3ao0a9jh+c3Ax/xVfyO7EcLtyfLmQTljxh3Zcs/3TDHFGZkvZD3/tPZNu xAAA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_094212_131045_A607E57A 
X-CRM114-Status: GOOD (  11.54  )
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

On Thu, 24 Apr 2025 20:52:21 +0200, Nicolas Frattaroli wrote:
> This is a tiny series to enable SATA on RK3576. It consists of a patch
> to add the compatible to the bindings, and a second patch to add the
> nodes to the SoC .dtsi.
> 
> I've only been able to test sata0 on my board (Sige5), but the
> successful test gave me confidence that downstream's "dma-coherent"
> property here is appropriate and true.
> 
> [...]

Applied to libata/linux.git (for-6.16), thanks!

[1/2] dt-bindings: ata: rockchip-dwc-ahci: add RK3576 compatible
      https://git.kernel.org/libata/linux/c/b8ed9475


I'm assuming that Heiko will pick up patch [2/2].


Kind regards,
Niklas

