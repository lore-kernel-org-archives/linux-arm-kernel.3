Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD1AC61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 02:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbE6ygLElQTTYS/K7ZqBXF2buqZVjb40e1vBsSRV3Do=; b=NaHffiixsvy0t8Axp2Lcjqes7W
	fdPO3fMCSo3O2ZSFtMV5fZP8msWkHVcsnNCmo2PXXqR7LugCEmeslOu3aliP7K+j0YSB5qo9sLtC2
	QrtVZR2MYOtI2LOAPeD788Mooex5QLH7hDJa/ek73oSItEDnZeelS9YOxlU3+xKnjBarcO2WIGTdp
	QbzUzJ11ze95kFq9juwB/CI1JpBWqSoPZ6SRpssYZUELpwbCj4T3hK1Cr3c/+2cJIaiF9kNFpv0Fg
	Ufv9j8g2TYGn+q4ecTL9ozQOwPen/WNFxechfnI7vZERxtR6qb/mcjU9Ut/YWAGRjIiybB/vQaq6z
	kgueB0dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0rzi-00000008NBB-1UNW;
	Mon, 31 Aug 2026 02:43:34 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0rzf-00000008NAq-1smI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 02:43:32 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-81e6f0b4610so26772117b3.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 19:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788144210; cv=none;
        d=google.com; s=arc-20260327;
        b=BJ7Pa81L31jP0iFLztM2FkZ6937Va8P1VP7OHWmtiiO7G9I57B1yt8pySISBRSxyXa
         6bK9TiPVIB8s/0fW9fdmVBwtNg0CFHi1VC5brPpe/+sZLO1KmU+LQFFo+QFhT/8Xro6m
         CRj2cSEI5DeT67fPbM9Rh6Tq86u9U6he+gZ8dTDun1Yxatj6MC4/QQ7NZXIYooziLgGH
         NVuOCqIvYCW4CjJV+fAPxUriiI87PLHV5jmljSS8rwVyt10NRWkTpux8ZDouq+yqHfPs
         OZclBFhQKHgvoq1hqipNe2RPm8wdgRa/oIxGGXC7DMNWIB5FM1T/gSWV21XoEZNcfwb9
         Mv9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NbE6ygLElQTTYS/K7ZqBXF2buqZVjb40e1vBsSRV3Do=;
        fh=6JR6ssse1weeFf6mEA+bufvc2ytMhEhZURtWOxRT10g=;
        b=so8UU9R051nSJSCG2Gu+q1oPVlpFCAi11cOMFBF5QLxVAgNeyH+/gETJoZmewBbWrg
         Clct5poq1mbtFyYb5fwMr2yNpBwchdA4+KukE2xu1mDvryhneeCZ5tFk2LJiFUYBqf6W
         T6OudErNU9Mrk4dC2yDn8eI3YW7s5DlKQ+xqwipl4a4C7jTdtP7nik7BpG/hfBPZ88wW
         GVxdnnxZl4yMGMscuoxq2SxZaEc0ag2frBf5q+xTBMz8x9vsT3dH/o4gv6c2slw7RGxW
         RtO87JFPhNZ9VLfVM2Sat1urIR0KkYJomMY20aczjljJzBu67mwuz03iOSPc0ay28Xvf
         8Pig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788144210; x=1788749010; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NbE6ygLElQTTYS/K7ZqBXF2buqZVjb40e1vBsSRV3Do=;
        b=FMvkL6M1LO/b990IHJhBGDXzyZfwZwC8Cl1417fExQkpupfEskSMNXQ4WNgiUucftn
         DiJzrNQjvVN46FwOCJXhfXy2XGg5CuF4pUGZuVMnKFaefJpizuXZ5Wk1NqYTj6fi+FX2
         wknGzXXcye6/z3cM+BgpPyRd65WagRdRyDrLgw765vAb+wfgy/Q88UEdsK5rem9LPGbS
         Zc1c5BbP7y/7E1lpHEkcQfe6xVbYe9wicNGkgePzW7tpfCORbWI7MbD6i6K81wFCaPSL
         ItzD1ms/I57SrdiX5KZpYHeXtX55TvCtp0/YJY38zZc1YFgoqxq0TtcR2N9Cdy3fL15s
         wrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788144210; x=1788749010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbE6ygLElQTTYS/K7ZqBXF2buqZVjb40e1vBsSRV3Do=;
        b=tAzkcXXdudw6Tq/qR8stvQ/bw37Is8lDS/MLGRzxNPwIht3uky5ouUwHoU0ZnZ+0ex
         uIHXd/BDBRHT3y/+iIunH9dBK6D0Qvg2YHr42OihQ0cclHUneEocqLM6NhHNJm8RCaIi
         blvkI7BZ0AyJEnaQ9xa8P1GduRBaimgfv+RmlxKBW9VxlOPNhUxy+ivpnhbvyme/rH2P
         o+1ZJjKyLjSaTh2RiaQhMjcnSi1qCQnu8cDNnybTeb9acNY7jNuCf2u7eTgmL8PTh+o8
         K2xUF7vbxZTScrBzmKsMOTmWL1tnHBnt3i0iSfJNocGM3RTPsRyaKPRPsMSXG9i+rXEk
         2tWA==
X-Forwarded-Encrypted: i=1; AKwUvByrxau7L/ksfPZuG8OsffURzCSFnvNwPCE5A3yfJcZPxjeLNh9OublelRtLH/Vh6BySt4Fi55u2BDLry3YBB49/@lists.infradead.org
X-Gm-Message-State: AFuF++ltqp5HdoSGanv6QuBHIwPta2cFSF/mKwRqcgXGCgz0hK0RO0vn
	VnaeQBuqIWgGdpVn39cAUVI9IhiVu+03OV01UwnH/IuIqIVgrrUT9WjulOOzclDF/st5eID1YJ2
	bUsxUXEHqDqfeEwzjsptt8pgN0TFzTis=
X-Gm-Gg: AYBFou37X/pCr3KcaO3vqcXear8p5dP2eDMXhWEPkGjS/vGUMdwtqZpaCHxcm5SgomC
	2fzWKdreEC2AaTqVeMfnhSAmt0b32Nd2cbucZoCYxyfv5eYCc4XXSNjmt0jsNxUB+AWr1RBm0Oy
	N00CZb4Ct8h+MY6oYYXBTf6LWdKtGCtBU67CbcvH6lvfP5PSrSMk1bykj8MrkXWmMuaUEjmqjNk
	OsUJl0HHTxunDaTZVYi8DswPBKgj7hD3XE+xYpQv+nvA4lb8kZT3QABfpoFVd7h/0BdTDDPDTzk
	EROk5NlhQYv7gd8eXJF3HsWk6SlO4xYy0cdrtM72lPaMjQ==
X-Received: by 2002:a05:690c:38a:b0:81e:695b:585c with SMTP id
 00721157ae682-8678f0c3792mr241247b3.4.1788144210009; Sun, 30 Aug 2026
 19:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com> <d60f234e-1b9e-44cc-9bad-da79e794fe44@lunn.ch>
In-Reply-To: <d60f234e-1b9e-44cc-9bad-da79e794fe44@lunn.ch>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 31 Aug 2026 08:13:19 +0530
X-Gm-Features: AcwNN1XmXTP91gt09bDas9PoVw9lX5EEpGOPuilZRVTJETaIpy2y2cTeB3EQiZQ
Message-ID: <CAMFFDGi161c0a8CX4DAaRzc66xTG2oRZ7DOgsG7pNRo-YP9-cw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_194331_525225_9BA02317 
X-CRM114-Status: GOOD (  19.01  )
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

Hi Andrew,

I do not currently have the PCB layout or RGMII trace-length information,
so I cannot confirm that the PCB provides approximately 2 ns of TX delay
but no RX delay.

My hardware results are:

rgmii negotiates 1000baseT/Full, but RX traffic fails with CRC errors.
rgmii-rxid passes a 5000-packet test with no loss or RX CRC errors.
rgmii-id also passes the same test.

These results indicate that an RX delay is required, but they do not
establish whether the TX delay is provided by the PCB, MAC, or PHY. I
therefore agree that the traffic test alone is insufficient to justify
rgmii-rxid.

I have contacted ASRock Rack requesting confirmation of the RGMII timing
and PCB trace-delay configuration. I will wait for that information
before selecting the phy-mode for the next revision or making a claim
about where the TX delay is implemented.

Thanks,
Prasanth

On Mon, Aug 31, 2026 at 1:53=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sun, Aug 30, 2026 at 11:50:34PM +0530, Prasanth Kumar Padarthi wrote:
> > Add device tree support for the ASRock Rack B650D4U BMC, which is
> > based on the ASPEED AST2600 SoC.
> >
> > The series adds the board compatible and describes the BMC memory,
> > SPI NOR flash layout, UART console, and MAC0 connected to an
> > RTL8211F Ethernet PHY.
> >
> > The MAC0 RGMII timing configuration was validated on B650D4U
> > hardware. With plain "rgmii", the PHY negotiated 1000baseT/Full but
> > received no valid packets and accumulated RX CRC errors. With
> > "rgmii-rxid", a 5000-packet test completed with 0% packet loss and
> > no RX CRC errors. "rgmii-id" was also tested successfully, but the
> > additional TX delay is not required, so "rgmii-rxid" is retained.
>
> Please take a read of:
>
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bi=
ndings/net/ethernet-controller.yaml#L287
>
> Does the PCB have 2ns of delay for TX, but notR RX?
>
>      Andrew

