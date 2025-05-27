Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99B4C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 13:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JprIsYNIPoxyHns3ZiuAwn+9eyHxv4Lgti7x5LNjShc=; b=480MGQkjklGdYtcyBzUvl0TRxb
	twgOuAEnWTyhi/QV/GHy3sAkZifbEUEOSao/lXk112VrvPQrT3Fy60bEApG15Ukaj6lsaMqw0LmgE
	V1CYeBoZRaR3jWuxDLXowo2eXXbuzIXIRJ+i43uf8ZAVAf4kfkRTJphJvLaU8RjNrhdnWFwQ2ugM4
	FQNADNyHKiUGm4ehd9ynp2f34jSh+qJZQEjPzLgBdadczjXozJtmgdF1fQyZDVDjVBnm8DeXY8Csi
	C0zVpOmWog3/+PdM47mP/Ia93uGgtnZHlTrgkXDMl816WTSmEO6mAz8j7djO4jpjGEWN4M7Pq0+eu
	/K6wT4VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJuOu-0000000ApSW-0ipN;
	Tue, 27 May 2025 13:31:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJu9K-0000000AnCQ-1x2Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 13:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=JprIsYNIPoxyHns3ZiuAwn+9eyHxv4Lgti7x5LNjShc=; b=AF
	uyeuTyib24Ok9CdkIeRRn5HV0GkV8OSq1pHQwE4IYQ/1T77StuvLRzK0xL6saABwYOq1/invOrr6w
	JkSMrI+UIJGylzyvyvztiUG2E4YKbkQnWL+uoAjE9+XYPk7eHZ4y1B1ZIrNa5ZL0y53W5rYGZarIK
	rWstZv6hJ1yQVQ8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uJu8u-00E4ti-AJ; Tue, 27 May 2025 15:14:56 +0200
Date: Tue, 27 May 2025 15:14:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: =?utf-8?B?5p2O5ZOy?= <sensor1010@163.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, jonas@kwiboo.se,
	rmk+kernel@armlinux.org.uk, david.wu@rock-chips.com, wens@csie.org,
	jan.petrous@oss.nxp.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: dwmac-rk: No need to check the return value of the
 phy_power_on()
Message-ID: <7bde400c-add3-47c7-bbbf-311aa8270ccf@lunn.ch>
References: <20250526161621.3549-1-sensor1010@163.com>
 <be687d2d-4c16-46d6-8828-b0e4866d91de@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be687d2d-4c16-46d6-8828-b0e4866d91de@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_061522_505920_58B2C3F2 
X-CRM114-Status: UNSURE (   9.92  )
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

On Tue, May 27, 2025 at 07:43:57AM +0200, Christophe JAILLET wrote:
> Le 26/05/2025 à 18:16, 李哲 a écrit :
> > since the return value of the phy_power_on() function is always 0,
> > checking its return value is redundant.
> 
> Can you elaborate why?
> 
> Looking at  (1], I think that it is obvious that non-0 values can be
> returned.

Wrong phy_power_on(). There is a local scope one within the driver.

	Andrew

