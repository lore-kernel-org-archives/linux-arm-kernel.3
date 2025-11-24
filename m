Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6B3CFD317
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 09:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0Rfgj366tJxe1xsMBXGVrkz7jJATsofvCJET5b+Jts=; b=a79zhZ4hwqFoywR1JM4DqOUwQc
	p8goCMILOVBy8+VdoZIDHDv1uirAdRZGJLZaUrIphGLZqKPIQOoCQelgn3jc70YRosqS9A2i+Jn8l
	dXxxe4hFa7bVaQowieR2l6kmTPpeJLnUeFT5cQqvzp3mOiEY++9kQrKaTfzXEyiCJFssnkUhNrHcT
	HF3PQrzQ3SvFiZCj6fsQaeCdsaoQvHvr4cf5z3xreSvmQBOiIZyaFrmDPQUrSKMbb7YMFCb1DuD6p
	+WhhsOihV711pOX2/L16dzeUL+675Rqn+rKktdThUervHPCKbEuVxgCDv0J/hRpfEhlbZKMKFMO2C
	T6WKPGOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTCl-0000000BNQE-0VNM;
	Mon, 24 Nov 2025 09:49:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTCi-0000000BNPW-2FWo;
	Mon, 24 Nov 2025 09:49:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86F6443332;
	Mon, 24 Nov 2025 09:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165A9C4CEF1;
	Mon, 24 Nov 2025 09:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763977791;
	bh=e0Rfgj366tJxe1xsMBXGVrkz7jJATsofvCJET5b+Jts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CZQpsh8tusQGHYy87IQbB12/uZyISK2efxLt05bMvy6mIeMUIC1mBpVhhUFerRFB+
	 018dT15yOy/onqeQ6NsERRsh0KnxXLUt/WDGf2qYEchZoF4d36nj6pi6BzcexdSgHK
	 9Nj7vcHtBl7HieT4EBiuSEwooNsa6Xul+5g4gV+ZMshkEFu+BDKuaFLeJtH8clu+/O
	 rtTTxpI+llZ3UZXD225zpleXnnVBGSqr13zMhFImf6b9YqKPkHgpxYuPcljEx3gXnB
	 GLU1VtHBmF2V+ICTZWr/Qohw1/HQpts2pGKioMa6eKGGuvjUnBRE9DjwWJgBK8AIo7
	 EvWRO7s/T7T1Q==
Date: Mon, 24 Nov 2025 10:49:44 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
	helgaas@kernel.org, heiko@sntech.de, mani@kernel.org,
	yue.wang@amlogic.com, pali@kernel.org, neil.armstrong@linaro.org,
	robh@kernel.org, jingoohan1@gmail.com, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 0/2] PCI: Configure Root Port MPS during host probing
Message-ID: <aSQqOHH2VLNNpX3D@ryzen>
References: <20251104165125.174168-1-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104165125.174168-1-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_014952_599949_DF9E87E6 
X-CRM114-Status: UNSURE (   7.66  )
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

On Wed, Nov 05, 2025 at 12:51:23AM +0800, Hans Zhang wrote:
> Current PCIe initialization exhibits a key optimization gap: Root Ports
> may operate with non-optimal Maximum Payload Size (MPS) settings. While
> downstream device configuration is handled during bus enumeration, Root
> Port MPS values inherited from firmware or hardware defaults often fail
> to utilize the full capabilities supported by controller hardware. This
> results in suboptimal data transfer efficiency throughout the PCIe
> hierarchy.

Hello PCI maintainers,

Merge window is opening soon,
what is the status of this series?


Kind regards,
Niklas

