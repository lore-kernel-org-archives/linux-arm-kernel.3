Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CAEE7AD4B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 20:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8H9CbZ0djO0P2VCynZQfOaeiOGjymF2bzz3E6rnd/4=; b=S5zRX0oTaZiTuIMMjOdtAt2GFo
	YUAOguwbbjkYf+IMSf9nCK7q0r08IfTMssQnIxGGdzoVuuX6tSGc4JzkPuFFEuAQ4lF/Als2rfYRi
	ZyQ7G6f4vGFoHqUSVDhr+xHEtWIwPfmz7tA7MM0hba6Bn/XZHNVaCDPY/fdPzJcQs55oHXM624tY2
	4raGUyDqmvYdEHN06uQFbQCPlZZfWG/9PRECFD4ggPAoFyur6C7NDZLcmgpmHT4FxFgrBey+t6Phd
	CaRQ6SdPHFWbN4Rh5ynoTkvsiQ29QXRoHeZnuTKJhvI7txFjNVzW93ABPx+Wt7/yhzwOmtrYdVkaI
	6ZE0djVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYs0k-00000000fpw-3A0T;
	Thu, 25 Dec 2025 20:32:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYs0j-00000000fpR-44K5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 20:32:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C41660010;
	Thu, 25 Dec 2025 20:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E902FC4CEF1;
	Thu, 25 Dec 2025 20:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766694754;
	bh=OlMwKRemqpxu1qixxaUujZZmxWqSk+fU5T6TjQIfHes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6VDcYXtHs6fSm0cvzASNAmckB9F9WPZrJj6GFS1DWeG5AyUtnRS+HTxeEn3lfE0j
	 X0mk5OLc648E+zRf8EuPlbe4TQjE9uTUaOHE2z+vIO9ZWoFEXzjBUIHF9CG4dzPQve
	 v83KQkZpwBtEZofvB9fY2BqXuG53ojlepTiUErcgXxbaMiU8EDiz5Q7rpj3SvwxMIA
	 wcqT0kw6j7feBvZO7hZ35tl45EOx8RVFm5K59tqICB2GXAgBdzsEOQf6hJnpK1sT9v
	 SP56DGjvycoPe2bHyASKmklE74IU5IZSqnnfhTjhhOa8oWJicVV2cLVw9to6ctdIHr
	 qTvx4sCsAld6A==
Date: Thu, 25 Dec 2025 21:32:31 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, lee@kernel.org, 
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linusw@kernel.org, Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, olivia@selenic.com, radu_nicolae.pirea@upb.ro, 
	richard.genoud@bootlin.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	lars.povlsen@microchip.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, luka.perkov@sartura.hr, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 06/15] dt-bindings: i2c: atmel,at91sam: add
 microchip,lan9691-i2c
Message-ID: <plir5hx4hpgrj4emspyu3wyvpnax6zz6tlattwq4l2ye3hohkr@ysbjwf2p53lh>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
 <20251223201921.1332786-7-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223201921.1332786-7-robert.marko@sartura.hr>
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

Hi Robert,

On Tue, Dec 23, 2025 at 09:16:17PM +0100, Robert Marko wrote:
> Document Microchip LAN969x I2C compatible.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

