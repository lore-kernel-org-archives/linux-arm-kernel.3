Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E16CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWZo78uZLO9q9vWWBKEXkIUVsNTzy7SpuJxIMn96d5Y=; b=iPByVZ7l9ukczfourKXbzA6tPy
	vWTU+8UB7uJQgCHkEn+KuIzTkKF0vZyI7F0Pl0IMfMi3yJpldPnf/0aBRQjLzRJKJL45jWZOY67zx
	cCTT6FiN4fVi2dONnUAGO1mbSWkTVPc7RMVIMPMOGWVfHUoZQIbOdLKp5CsyAilCwhyat9V7pRXcw
	duNmLheBnz4p07aHZJO628zh1yBYRKP863Izf8U7ZipqvB9EnWidjHImUh1Tneoe3VvUnWdR2F9oL
	v/2Kw6KlMWTbxrmrmRg2sV8UYr+kHlzFbuuH0LqGWHlTesc146EI1gH9uybfvX00y4yIZrS5c+E4Y
	gtFB9csw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM7Q-0000000G7F0-1nqq;
	Fri, 05 Sep 2025 02:24:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuLaC-0000000FqYx-3350;
	Fri, 05 Sep 2025 01:49:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 730B840391;
	Fri,  5 Sep 2025 01:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41525C4CEF0;
	Fri,  5 Sep 2025 01:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757036983;
	bh=Tu8dRLxfbouCfnvyFL1u/voFfdEj304GNbmJcjKPnMo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=arHvTfHr/x83tMaViDMhKMfNh5iHY6zBLv7spcIACyMHnOMYBO1aY1QaWGpRwfSCD
	 R40gX0f7KdksFVTam2Hvz4prnjP85wymEqPryhHgLM61yBNfezir9fdfqFL5a6kR7E
	 9XnG0cP+YN/xe09/qPyTKtFb2+fkvHpancnN7Pswh4nmR8KqfM3mLhvWYxKP/EEC7w
	 ocADly8+wcqAFffq+RHCroudIfMa7Md2iEXMGAL7u8Y2JP9DWVXHfun4TbfcARzozy
	 DRRBC14cxIg8PsjwK4oX7iuDP7JcTjO41WrAwTbI5zi9opR0+2u9PP66rkHpD9tdkj
	 JGCjdifIG8/fA==
Date: Thu, 4 Sep 2025 18:49:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stanimir Varbanov <svarbanov@suse.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Phil Elwell <phil@raspberrypi.com>, Jonathan
 Bell <jonathan@raspberrypi.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 0/5] dd ethernet support for RPi5
Message-ID: <20250904184941.207518c8@kernel.org>
In-Reply-To: <20250904184757.1f7fb839@kernel.org>
References: <20250822093440.53941-1-svarbanov@suse.de>
	<06017779-f03b-4006-8902-f0eb66a1b1a1@broadcom.com>
	<20250904184757.1f7fb839@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_184944_793698_E97DBB33 
X-CRM114-Status: GOOD (  10.70  )
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

On Thu, 4 Sep 2025 18:47:57 -0700 Jakub Kicinski wrote:
> > netdev maintainers, I took patches 4 and 5 through the Broadcom ARM SoC 
> > tree, please take patches 1 through 3 inclusive, or let me know if I 
> > should take patch 2 as well.  
> 
> Thanks for the heads up! Let me take patch 3 right now.

s/patch 3/patch 2/

> I'm a bit unclear on where we landed with the parallel efforts to add
> the >32b address support :(


