Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FC2CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0eUUtwctLLTRFzKHTHPyx5X72sDCYOZW5Xifc/3/OXk=; b=rYzLR8r6jHtqWkYgS1d6Il+ELW
	E6QTe9cZA+/TBLoZ4ZtF1Qaw95r1AE6cjpB2Sn9WK8VLNhnYImlkCHMMNNaPVfjbRFfQaJe/eBccO
	U9gOXMty1fMNCG6UfLN8/sQeErvDvMKKh+vMIac64/tidXIgSZfdPmOet5TEsuPLW7qqfRD7nhpW7
	xGPumwgdhztFBC6KI3j6G12HGMZUfpkOuHowTCJXCVFaXKlzRkk+K6G2TURsWboyIkLEJFTX46uLH
	HyVrJK1wnZF9u/acV3ydRF3Zk4ivM0QuiTInllJxwEYoXrQjP1D3XH6zyrF8NdQbaTjacAgsVFO6c
	6WxSv5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBs0E-00000005o5S-0oLY;
	Wed, 30 Sep 2026 10:57:34 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBs05-00000005o3e-1Hqq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:57:26 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48afe3b2383so561853f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 03:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765843; x=1791370643; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eUUtwctLLTRFzKHTHPyx5X72sDCYOZW5Xifc/3/OXk=;
        b=kZhMPvfkiWaZmhZG0tuyfwP1nc0S3VoSDlmoL8QPbvw6Onnqy9++L4e9QoyYaOI0Do
         VZyOzFayd4OfFuY8gInLXjb1S/2RZb4jC81ESXergOuUozJIOYu/x48wn8MZ/Q+VXB0l
         ldmPpOVv6jWWHqNOBJJw0Tc9jqsgqX5WEIkXefPDMg9A3Tq8fufwi6kQU0tTinFsOmFU
         FjjyDPQEbxUI1T3MMBUzTruvJbmaukFEmB5p8hJektRBKJe943Ky7WWePqeS0iwqzgcZ
         Vnj7NoHBd/M0TNnOmqott0ljMIf/k+dWeVT5nwonTNyna3652EETKdnaud3WguAAnBtu
         ju1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765843; x=1791370643;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eUUtwctLLTRFzKHTHPyx5X72sDCYOZW5Xifc/3/OXk=;
        b=z4QIxsHSxq/ZJPQSvwzbLkGO26XdXeBJgxy0XI8Bnc0x/5wrTRYgfb//Ijx6mHKwL3
         dFUf0rAlP5VvJyU93V6+TaOwSQ/p7ZVUx15Nhv0RifHV0cZHn50V/v9IppcgJlQASbRk
         Ury3v/abSMkgDM7wg2T2yNQzkC3yjivlONKu4HxJF/TytVdrvCTTKVhsoU+fc/WI9HTC
         6/Dgx1nf3tl+g1l1XNdyg4w/67kESC0hicbsZUtrJzOo1fvbjSq23RXrpG51z7jQjVIV
         SYTgG68+BFnd/zn0U46YuR/uWQWsa0jhgUIHyNSzkL8T3wpCOy0mnGcGptRthrfRiprs
         SLZw==
X-Forwarded-Encrypted: i=1; AKwUvBwJVtMJDwLrLv1rE3UXTDDW/S3dDIAZJ87aHgN9u8fLjInVSnrLt5+RPNFDL0jgoJZ51McSCLMlBpg02ba6j6YW@lists.infradead.org
X-Gm-Message-State: AFq9FYLC0avkS63z+BP+cf885G+7YfPKBj3ka58R7tZJIFa69+knXIIW
	t3+fNVe2IkKfw9ZsTWnFB/SASU5wZQIQQzCbVesCwQjp774HDxdx9C2I
X-Gm-Gg: AYBFou0KkN/vgv+fqLc8/wbTlODJj38tIujuMwzMBC+yNa6xmHl+C2uAaJzgPNS9688
	uRr4SztDC4hZGRxRfUar6m/47lduADHDUVZifA0F8MwKZKOV/UpGM3vL6+W2BtFcYgV5QZv38ZQ
	EOiVltgoqpGJq7cZw5Sfx0PoXPz+GfxMayuIv5V47No7xoUbVkCepLXS/F4IkBenqYy92RQfYho
	LRJFd1Vfv69PwwI6FjqJV4NUM8nmFrg6h9JBP0Sl0DkzyHB53hr/2O1KgYXhR1u68tWbtmXEEic
	uZfFF6uWXA8VTvRTj/Y96+WTRIetYiR9heDZljPeAb0jql9M3OKJgXy89mJYfIdXOgsLWN64r23
	IytrG5TJn5rJYbzNxGgDl4xjgND57WG6S2YwbkRuvx4nBUNf02fuKrwyKIDJJ0gj/3MUgvKFUk3
	eQMzEFH1WuBaa+UxMNH4Maz49VM3OZAqiXRxOUSAx03YsHugHH7QBl2Tl3xSIiMpA5/e6jxiYSO
	MnFsVWDwmocamxB8d1lhaW5orG1GFmp7oCQEnNNbm4=
X-Received: by 2002:a5d:584c:0:b0:48a:eff0:c31d with SMTP id ffacd0b85a97d-48b02525e8amr1894631f8f.38.1790765843425;
        Wed, 30 Sep 2026 03:57:23 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029bf85dsm2852667f8f.13.2026.09.30.03.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:57:23 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 00/10] ARM: Add support for Cortina Systems CS75xx and
 Securifi Almond+
In-Reply-To: <CAD++jL=0Zc939o7UaFgtx+04gLRmgmPVHTAeuW6OS9nPP5Xt8Q@mail.gmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <CAD++jL=0Zc939o7UaFgtx+04gLRmgmPVHTAeuW6OS9nPP5Xt8Q@mail.gmail.com>
Date: Wed, 30 Sep 2026 13:57:17 +0300
Message-ID: <179076583798.3054629.14422335928572048671@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_035725_362543_780BAEA2 
X-CRM114-Status: GOOD (  12.95  )
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

On Wed, Sep 30, 2026 at 12:39 PM Linus Walleij <linusw@kernel.org> wrote:
> Is this OpenWrt fork public?

Yes, it is under review in OpenWrt:
https://github.com/openwrt/openwrt/pull/25033
The sources are in target/linux/cortina/files/, the Ethernet part in
drivers/net/ethernet/cortina/cs752x_ne.c (plus cs752x_fe.c,
cs752x_sch_tm.c and drivers/net/mdio/mdio-cs75xx.c).

> Actually what I'm most curious about is the packet engine, which may or
> may not be related to drivers/net/ethernet/cortina/*

As far as I can tell it is not derived from the Gemini GMAC/TOE: the
vendor driver has no StorLink or Gemini references, and the engine is
split into a network interface (NI) with per-port MACs, a DMA/LSO
block, a queue manager with its buffers in the top 64 MiB of DRAM, a
traffic manager/scheduler and a forwarding engine with packet buffers
in on-chip XRAM, which does not map onto the gemini.c register layout.
I have not compared the descriptor formats in detail though. The
OpenWrt driver only uses the NI/DMA path, all forwarding in software.

Thanks,
Fil


