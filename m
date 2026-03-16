Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADB4D58B36
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 06:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xykCT9BKujCqkA2IArKY3bjqd+RsxJe4XdOgeQgUVOQ=; b=bpeeL+vsxAZdw9zuKvVKKbX+YK
	N//RBPyFUlNiTj+qi4pueXtVYoDA4CQK3ilGuwNsmwMnDO4Nk4dVXzcURXwuX9GLJQO7aC6sbNVkN
	P/Vb29wi9EFA4ShxAA+nb0az73u8LASg+Qd0lduc/FehJTZ8qAhCZ2xImIBSYHBZOb/qnKKANqONK
	IXqpGvMjvAjmv/OkOVgiqiYacqQwo+n9rL/0gZWsi9ohMJwltAoxy3EoRNYgUHV0FU6s3O+38YgpN
	YVwIIZEuMW6LBd1yJIA1ZqVUT8bgpHfFhKP1An+IfJSjX/7MT0agsXsYlDsMrcUk/kWwUYO80B/B2
	7gfv9dog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w216H-00000003O5g-3suD;
	Mon, 16 Mar 2026 06:06:50 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w216C-00000003O3D-0kod
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 06:06:45 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a13323ba85so4831039e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 23:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773641202; x=1774246002; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xykCT9BKujCqkA2IArKY3bjqd+RsxJe4XdOgeQgUVOQ=;
        b=Z7CxkrdrG6McK1F5Nw7zWF3jJeyhjwfdgiaP8OLUp37p5z/5kjSzzhpNHOC7/A/x9D
         LjAX/Vs7oy6LUvxU4RbIW9DH/ZhTh4kE7hpANKXEErIc9qE6TM+O6QkLIcCqn1+FnYj+
         sPFOoWjh4B4K7vqVh2BiCvo2HN0UJJ8G8iLCtDWvQDeR2qGKUDom4Q8VoRJ20LiReKq4
         zuLPBOzrHUFekLw9UoAspAJ/OKY5+PqOgzSp8ce2FFwCSD8w+8dF8CzPB1VuhBDbh3Fn
         bMUkqW/1rQvLDPUZVjKWYCfjLGiKyEbU97cvDUF7PwPdjI+CeWMFAiu+jIa6QpIcxrTN
         /7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773641202; x=1774246002;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xykCT9BKujCqkA2IArKY3bjqd+RsxJe4XdOgeQgUVOQ=;
        b=q8ZyRw0gwNWyDgLM1Wg+o1teFw6UZ1y0MLmJzWLQehOk0g+LQNwgPIY2STBe9sfPRx
         N+nHK/oK3SX8BhO0+3oyaR5Um0VvrFuRKasfjfAPi7l9NTqkBZlZQHfmHpFrxKi+3Kvt
         b+F/Z8jrAHgTJsf60bHNLTqaJICKSr0g57oNw1ZTIlHbqCn0VnjBSncgKWH2ibW0HXEx
         4raeO4/Ec2PFZHRt33dBYTENjo/7W8brzSt6wGOuK+D0CquP4zi0SHalmi+m67vKKeDr
         guSu+aqRG/Xt/3Koz9Zl3SFsy0zYJ7EyEzo+o3f0ZTORfEk3wSExD8lZ1E9CKL6akmgn
         ZG3w==
X-Forwarded-Encrypted: i=1; AJvYcCUudMvQD0VyOYyp9klBms5+B8yqwNqHsqaPvtavS5d3egtJwS/7qD9q6SxqPCgUOvJ93FeEprzQ8AjKcR37XevF@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj1LH8UsMPjWPA/Fv/we0RZ5SfkE0tHP6+hGbCXY7vAKQOcnj7
	C2a+RIm3lCcUlKHcvGLGSGUYJ8X70MPVc5StNCkZ0t10QsmxwQfsxuD4
X-Gm-Gg: ATEYQzyXYJVobOT4NNTcu683YTaN5LU/syoNTBY4qrm2abYBGJoKpJJrM44yZVfrvFJ
	DCMDtWNJXY4TT2bPu5ZWWtD+JYQtv9gScQ3CQ7/WzG3fDa4UHYBnoGxjVU6TaX5vilPNBWhV9YX
	DCK1A1/nzmft5DR4gWIPRUDs31CvWelgl4ipYk2uJGAz4XjI4m2iLEHkRxlv1aEe0STXnwoN7QV
	/snD25VA4i1d7XQXUZt2p9BXAscINA8ZS1Dnf4GsqM2cBKATqVKnSvnO6WqTotWAixnHGP0hP4o
	BqXwSGjx6/VipzBQ1aQVCldhZoIDa/c31oMnruB+llRP+rWRX5u/aRwTfib/rjeDcTUVKWhxwYR
	wnWqCfZ+AHijqyx+HpSQbb3FBleV8Cb86GxzI2sOlIhGLMbC3z2F4xFobUk/ATtyCOz6rWIrdpr
	RiBb83DBi6hvTjp8MqjV+EPuTa
X-Received: by 2002:ac2:428d:0:b0:5a1:1862:67a0 with SMTP id 2adb3069b0e04-5a162b2fa48mr2657409e87.45.1773641201430;
        Sun, 15 Mar 2026 23:06:41 -0700 (PDT)
Received: from [192.168.1.161] ([81.200.11.23])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d61f1asm29442921fa.2.2026.03.15.23.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 23:06:40 -0700 (PDT)
Message-ID: <4400f95392163ddc3997cbbc0b298f50910fe6f2.camel@gmail.com>
Subject: Re: [PATCH 0/7] soc: aspeed: Add AST2600 eSPI controller support
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor@kernel.org>, aspeedyh
	 <yh_chung@aspeedtech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery	 <andrew@codeconstruct.com.au>, Ryan Chen
 <ryan_chen@aspeedtech.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, 	maciej.lawniczak@intel.com, Mark Brown
 <broonie@kernel.org>
Date: Mon, 16 Mar 2026 09:06:36 +0300
In-Reply-To: <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
	 <20260313-energy-casket-ca8adc1f1fd1@spud>
	 <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_230644_259111_8AE982DD 
X-CRM114-Status: GOOD (  18.72  )
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

On Fri, 2026-03-13 at 22:36 +0100, Arnd Bergmann wrote:
> On Fri, Mar 13, 2026, at 17:24, Conor Dooley wrote:
> > On Fri, Mar 13, 2026 at 06:07:35PM +0800, aspeedyh wrote:
> > > This series adds initial support for the eSPI controller found on
> > > ASPEED
> > > AST2600 BMC SoCs.
> > >=20
> > > The series introduces a eSPI controller framework for ASPEED SoCs
> > > under
> > > drivers/soc/aspeed/, adds AST2600-specific controller support for
> > > peripheral and flash channels, defines the corresponding
> > > devicetree=20
> > > binding, and adds the AST2600 eSPI controller node to the SoC
> > > dtsi.
> > >=20
> > > The driver is intended to support host-BMC communication over the
> > > BMC-side
> > > eSPI slave controller present on AST2600 systems.
> >=20
> > This all seems to be in the wrong places entirely, shouldn't an
> > eSPI
> > driver and bindings go in the spi subsystem?
>=20
> From an initial reading, my impression is that patches 1, 2, 3 and 7
> should be modified to use the normal SPI interfaces to implement
> an spi target driver, possibly a combined host/target driver.
> Reworking this should be fairly straightforward because the
> interfaces
> to the SPI core are well documented.

Arnd, that's would be nice if it would be standard SPI device. But what
if eSPI would be a bus? So, I assume all other which lying underneath=20
eSPI would be much easier to implement as standard driver data set
SPI/GPIO/I2C with something like devm_regmap_init_espi(like for i2c/spi
or anything else) for example as common part for these drivers.

Thanks.

