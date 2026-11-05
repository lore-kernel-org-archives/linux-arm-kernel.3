Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8957D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g69m1CoR;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ly0t1MS4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7U59FMNX4DCr6XqUc5APtHx1j8o76nRw6SIZUCXGvNA=; b=g69m1CoROsBNK0IxPAByW6Hl8g
	luhS7JhypEbKWmb3p/GV6UbxEZ2f/LhtGQeanqaCWJ9fzPokGoGeea909D0f8HtU4lbRd5Ma+peDs
	q4ERHHiThgj0t9TVPxsbY8se2vD7flMDLorgQ3VrlTguhOPh+dUrhEsV1lQYxfw0KJrE2dybRDYr+
	0l6tvFFmYXdtvAYyUnf0KSaNdYFivTMK3gUY/MgbSrbCHugngRcIvR1q437w+0nrkjZP8VjBaKvH9
	PHzPIpFEAbBw9nBhGD3gCdmPLhCnO+hoeg7VB0N3xlUCI0xLBwPu9bDqmyU6adjM/+jB4Q0ueDAHm
	pBYySSCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3Dm-0000000AMQM-0hhu;
	Thu, 05 Nov 2026 19:34:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3Da-0000000AMNv-1YXn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 19:33:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BE283600E4;
	Thu,  5 Nov 2026 19:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5501F000E0;
	Thu,  5 Nov 2026 19:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907229;
	bh=7U59FMNX4DCr6XqUc5APtHx1j8o76nRw6SIZUCXGvNA=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=ly0t1MS4/AHH7UPM+wnhImzJvbHZMROuabv79AZ9ia99QWiDYcKc869bLL072lhCy
	 tD3UZUZ8LW9ESLmNA2fvQmqG4KhCwP3lqk2w+U6hab8vVBb58TwthzkvIDhEuQqhMG
	 zfn+tuSuvCjLTCFYwj+fJjNnJwjOknyIEDLjrKf0QNnnDLjunb/QPnbqfCqwpeTeSX
	 R+rPOSQfUXTVntTw3+5ytfINs+HCviXyLlKqgAlM3ICOmmFLuoWwaJLynUU39YLABK
	 QU666843eHrMgP2kC+xJGycPA//PfRwnAJ1b/Drke3/AQ04GWYB2iwNaf4zU/ASHTe
	 F+VxOCLel0uUQ==
Date: Thu, 5 Nov 2026 13:33:48 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Joshua Peisach <jpeisach@ubuntu.com>,
	Michael Reeves <michael.reeves077@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: pci: apple,pcie: Add compatibles for M3
 SoCs
Message-ID: <20261105193348.GA1552413@bhelgaas>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-apple-m3-pcie-v1-2-e00a72a604f8@jannau.net>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 12:35:59PM +0100, Janne Grunau wrote:
> The PCIe controller on Apple M3, M3 Pro, Max and Ultra SoCs are
> compatible with the one on M2 Pro and Max. Add their per SoC compatibles
> "apple,t8122-pcie" (M3), "apple,t6030-pcie" (M3 Pro) and
> "apple,t6031-pcie" (M3 Max/Ultra) to the bindings.

Subject line capitalization for *this* file hasn't been consistent,
but for Documentation/devicetree/bindings/pci/ as a whole, the
convention is "dt-bindings: PCI: ..."

Since these prefixes are so long, I would reorder "Add M3 SoC" to the
beginning.

