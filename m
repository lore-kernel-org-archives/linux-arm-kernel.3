Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C5BCF9C47
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 16:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsMajEUtn4/PIPVU3EK/fabJxMg6APm6DHZn336SXNM=; b=a9eYwy/bSjPcS0fY2tP7WXwMIJ
	Oep8FGVS5bfmOEvgsIEp9qzi1lvt08Br3tbOqS8UDp8g1vI0JKgiL7g147nZR5hXRzf2IRsL/jePx
	Hw9JI7nV97rqgzX24abzH3DWlNL6THMVW+63mOH/NKeXQh8JEpJEK5lLmpTwYQ82xKTScXt743rMi
	J1YdFZEC3Ez/5HYBSHnlxNgnxYq3wUIlRqRCq5TZryJ5nfw95ay7o4Kc5W+jScAGvZYANTJiUiYxa
	hz/2acCG02Buh2pPaEWTYbtUpXsWYRe3PQPK2Gl511pi+m8LD2D5NI3GhA24BvtWgplsKx5yGd9TO
	Js0HFYGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7g0-000000071q9-1bnP;
	Thu, 20 Nov 2025 16:38:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7fz-000000071pu-2ZDo;
	Thu, 20 Nov 2025 16:38:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF394601A2;
	Thu, 20 Nov 2025 16:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A184DC4CEF1;
	Thu, 20 Nov 2025 16:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763656710;
	bh=U5v+Xdb6isW2T2yhaiZW6oLZADrqcJmiFKaIUQrAziQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cQsF+f4UQkx2EydK0A+yiV+xkUdnzq9e2j+gWXRw3hFe0dOxIB/ZdrYgbynALGEQR
	 tbYuvORrrO+6t/2QHjxeV3Tkbl9D0EwrPDYJqcZN6WDd+D9lCT/QldzV5fym7YmJe9
	 U3poS2sL6zEQQodGlhcv3nXkZR1YNtwLn6U6hdgSGcwWF4s0jZA8XPpMrhR098UcWA
	 aICFRSqzg4DUszENG988Ur8pNtS0HjNRydEwlSMmE1i4ZkmL1tURB4d/g6neG2kuN8
	 2fT/44yEs5PPDNov6WS4D3ne1LPexa+LzaEVw1vhNsOtVTak0MjZPtw0ik/a2kNxgZ
	 PCmzTlSzTqPTA==
Date: Thu, 20 Nov 2025 22:08:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org,
	kauschluss@disroot.org, johan@kernel.org,
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v9 6/6] phy: exynos5-usbdrd: support SS combo phy for
 ExynosAutov920
Message-ID: <aR9EAj82IiLWFQ-t@vaman>
References: <20251010070912.3758334-1-pritam.sutar@samsung.com>
 <CGME20251010070106epcas5p2a7e051ce5edc0768e5a5d3b3c267f984@epcas5p2.samsung.com>
 <20251010070912.3758334-7-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010070912.3758334-7-pritam.sutar@samsung.com>
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

On 10-10-25, 12:39, Pritam Manohar Sutar wrote:
> Add required change in phy driver to support combo SS phy for this SoC.

what is the 'required change', would be good to describe.

-- 
~Vinod

