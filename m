Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D02DD262B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 02:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuXy/cX+McuEURHXGPyqZ+VaHcxMh6LN2RI/K3jGixU=; b=lN2IIXpdes7ij+GQxUWSw2T3Xr
	fGiZ7BltiTee6EeG0VZH4GIlNiyzaQGFFPTkJJesOB49DfutbIZngc3xng8S/VHpZPtrHBbzCysOk
	3qzdlG3mC04XBnXZDKxYyL0+eKMeIrEPEAtD5vWy0Db9KfCeRN0ebBCbvfXIyaimk3V+eQ9Nm5z5s
	eOIbuA1vgdkvHaxWSLojm3/DfQKasapApsBAsXuVV1JZdaxozc7StBkRyNanhjQsyNkPqRXeidROi
	Uibwhm6wzoakrqvSQUdti5g+KW5cqZ08y6Kk/nKaaHtFcxrZqODW9eUiB5V1W5E38KHm98JdIiWP+
	4Y9CGMIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viO7Z-00000004nkd-1D42;
	Wed, 21 Jan 2026 02:39:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viO7W-00000004nk7-3cjj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 02:38:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C48143D20;
	Wed, 21 Jan 2026 02:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD04C16AAE;
	Wed, 21 Jan 2026 02:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768963137;
	bh=foy09YRZdpfh+UcvVsh4GRT12EVN+LC1837tCHo1aB0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zsc44AFdV6aDzxB8ptj2ODzyAk7zE3+OCht8aqOT44hN5GbKU+JeVpIbIrn2g/GN8
	 4/fLK+lG8MCcwcUWkqCxxClmt4EX2qoraqPd/JAeH1SlBV9HKWW+58XoYxQRkGK02U
	 /016TPWTUAhYJzlFkKtl3gm4wDQNZMMX+hJtuoOIESP6Wan3HxnFcZ1Hy8BjAFDHjd
	 GEdyz6rTKNlkUZs0XDFRNsIzU0BoVZ44kHTR3qmB3Ph/PObQMuPxJA5kyq75BLCExQ
	 C66UzmFDFHMukn8rFhja+D6XJ2RQZoTOSMedQitO2/WKhsPfJOS6nM2nEMQ/cIseuz
	 7fh0vyKP4VmCg==
Date: Tue, 20 Jan 2026 18:38:54 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net,
 lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com,
 pabeni@redhat.com, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 linusw@kernel.org, olivia@selenic.com, richard.genoud@bootlin.com,
 radu_nicolae.pirea@upb.ro, gregkh@linuxfoundation.org,
 richardcochran@gmail.com, horatiu.vultur@microchip.com,
 Ryan.Wanner@microchip.com, tudor.ambarus@linaro.org,
 kavyasree.kotagiri@microchip.com, lars.povlsen@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 luka.perkov@sartura.hr
Subject: Re: [PATCH v5 10/11] dt-bindings: net: sparx5: do not require phys
 when RGMII is used
Message-ID: <20260120183854.7d081aec@kernel.org>
In-Reply-To: <20260115114021.111324-11-robert.marko@sartura.hr>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
	<20260115114021.111324-11-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_183858_931351_A1BB453B 
X-CRM114-Status: UNSURE (   7.14  )
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

On Thu, 15 Jan 2026 12:37:35 +0100 Robert Marko wrote:
> LAN969x has 2 dedicated RGMII ports, so regular SERDES lanes are not used
> for RGMII.
> 
> So, lets not require phys to be defined when any of the rgmii phy-modes are
> set.

Applied, thanks!

