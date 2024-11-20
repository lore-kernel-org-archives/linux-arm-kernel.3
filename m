Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3FBD6E2B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 04:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22Pb0xyAbFBgiBPWl6KARML2Z6bek2t466sfMUumy1I=; b=STdoWsLsqYZAL05xlwH69Pvt6f
	jSI2xnoLL2bjwt/pYTsWfYAGqsl10FsSIjYun0PH3O4sJHHRZcxE3XXRD+eknjzIFUzoFe4k7rLBU
	sjfOSo1eIRx6E376HAgqKDRZEsg/3DaRAshS/ZEWThOOy406Lbkw4yDry1MfPAFhtUaqEdMb8rtIm
	EwSNOnaFMdD7b4tWg7FkvX/0OZXLhVEq9eO7btVeItX+TFMtJXi9G7DQcZAdokkTiBS/eLOekTviM
	CcQpIHLXU1Md8cKlT8QqdhYTZs3bGsh3lSV24f44xavQb1TYAc1HGu2a8WKPlhuoecZHyn1Ij9dts
	8Jkmgufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDcZl-0000000ENdC-0Mru;
	Wed, 20 Nov 2024 04:44:25 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDcYp-0000000ENXp-30ZR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 04:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1732077797;
	bh=22Pb0xyAbFBgiBPWl6KARML2Z6bek2t466sfMUumy1I=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=LDURYvZ9kRvVIXv7xCSSyCxOM5f3lAAm1Q4B/2z3fwKU4kB2xIPyNVb1VgLSOpML1
	 D3RrL9Rp3w6bFh05vQRMeclYwfWjWSzKc4xvEw+Vc0ZDX8gdnlK7jaqSpOBvTFnrBW
	 GH5BRw9Eh/CG7U4rpzFRlzEu4lVSBQgZjjlxwgjONXKXNZu82oiHQ3xvU400zrTHBk
	 KGZj2FIcwA2AYSrcP1AeUm3KMIh8GRLcUhA6t6p/7oD4xMmCh5xzj/F9FZbMNxLC7I
	 tkIl4ekrG0ai4V/jKlANbGJtp+Cj7Mh+miwIpfnMCwPq6ed12BqiCvH7++7H3YgiiE
	 5+Bl7XNiRKjoQ==
Received: from [192.168.68.112] (ppp118-210-181-13.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.13])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 398DA66403;
	Wed, 20 Nov 2024 12:43:12 +0800 (AWST)
Message-ID: <d28177c9152408d77840992f2b76efe3cb675b7a.camel@codeconstruct.com.au>
Subject: Re: [PATCH net v2] net: mdio: aspeed: Add dummy read for fire
 control
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jacky Chou <jacky_chou@aspeedtech.com>, andrew@lunn.ch, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, joel@jms.id.au, 
	f.fainelli@gmail.com, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 20 Nov 2024 15:13:11 +1030
In-Reply-To: <20241119095141.1236414-1-jacky_chou@aspeedtech.com>
References: <20241119095141.1236414-1-jacky_chou@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_204327_996546_48A7676C 
X-CRM114-Status: GOOD (  10.43  )
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

On Tue, 2024-11-19 at 17:51 +0800, Jacky Chou wrote:
> When the command bus is sometimes busy, it may cause the command is
> not
> arrived to MDIO controller immediately. On software, the driver
> issues a
> write command to the command bus does not wait for command complete
> and
> it returned back to code immediately. But a read command will wait
> for
> the data back, once a read command was back indicates the previous
> write
> command had arrived to controller.
> Add a dummy read to ensure triggering mdio controller before starting
> polling the status of mdio controller to avoid polling unexpected
> timeout.

Why use the explicit dummy read rather than adjust the poll interval or
duration? I still don't think that's been adequately explained given
the hardware-clear of the fire bit on completion, which is what we're
polling for.

Andrew

