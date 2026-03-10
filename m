Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A230EA8550
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33jPbzlWeMQan5XZ6y6WfE7m1EsEV0Da0Wn6BJa6sCw=; b=OfbpBqmeahtJ/bI+BIhPDhzobF
	Hn4iqP4W9tBCjuXkZjjrIWFXg59AuWmRfZHG9dRWF3Q/arIVt5qMy9BTI9cWexm5chENbZNpOek7G
	ohpob5L0mGk/weO5Ler6piHWgmyvtmhj8WatD14OzJvk9qo5Jgp7+hovKcZvQfhrbE+08TMd+DtrB
	/3K21bclwvOMdXPnvvp1txRuiCufWpd0HzAun/izASbRcwmU9zlknYim/2Y/b3FZxXvWS+5Ln5bWi
	PlNm1hLG3a7QVZWpcQ/ki13/Re3FwYbnCUxHqZDAczUSVwa1Z/LxKfZWuRtmNmV1X4+swtHZo5SaH
	Zzw4t04g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztPt-000000095pH-0OLp;
	Tue, 10 Mar 2026 09:30:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztPo-000000095mr-40IL;
	Tue, 10 Mar 2026 09:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=33jPbzlWeMQan5XZ6y6WfE7m1EsEV0Da0Wn6BJa6sCw=; b=PkLY0hi1Q0VDo9mU6ajgfQNSfS
	kAlJ6bo+bSB+9pfO/jHPTPyFvchNshlw7fZNdGDNXAige34XAFGxLZ2vL3b3/nm7yzcK2Da3Mfam3
	WAx+0g+ITQKAEwToMBk3umTCqbsaSjIn12qHXt29Q4/SAVy1yTdogwVCZRM19769ALX2/tqRIp6J2
	ZdexIThXY82TVdSl4MkrE/pKaM4fmTN2LlifOf0GloJH0RDibxXxJXCWxrcNe6WSSBq4gMNIgytul
	/FqmME1bwbTW1pl/+ZgPpV6BgL5L98DtYnhyFkl4MYsYJK4IBifQ1YYkDZSPG4rkfXd9NWUmuH/xF
	/+rTt6mw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztPl-0000000E7oW-1luF;
	Tue, 10 Mar 2026 09:30:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=33jPbzlWeMQan5XZ6y6WfE7m1EsEV0Da0Wn6BJa6sCw=; b=eIPS7K/HQG/f6MHSpeVoR45sjb
	QucjZyqPj4vp2WCj8LUSUqBF3xCxUsdS3kO2dQBz5XSIxrdqLXi/eMMQcpWN9U3tUS191FlEPD2AY
	qCAUmjNI7jBqs9ibMHXSrFV1CXytOMwZyYXM2ofSt/bc6KMSnnVSpU8ckij523xddu4YqSUHG00By
	WlQ+6C903zK6eLs93qektCyPnDX/cRLZwz47rYVQoR6KNulsQinzTcK3i1Ab1nGBJLPTtcpYQr/lU
	Gj1K5LBL+7nlucgGU5jEwMh1aFySNxJmVqe4T8c4w4sm3ZHIA/QNewOdIQxHMO3d2lw//w3rXMJI1
	79Icifyw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <diederik@cknow-tech.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Samuel Holland <samuel@sholland.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Maximilian Weigand <mweigand@mweigand.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hrdl <git@hrdl.eu>,
	phantomas <phantomas@phantomas.xyz>,
	Dragan Simic <dsimic@manjaro.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Enable GPU on rk3566-pinenote
Date: Tue, 10 Mar 2026 10:29:52 +0100
Message-ID: <177313498973.2340533.6039251344596922355.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305120620.173600-1-diederik@cknow-tech.com>
References: <20260305120620.173600-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_093009_567616_2109456E 
X-CRM114-Status: GOOD (  10.58  )
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


On Thu, 05 Mar 2026 13:05:40 +0100, Diederik de Haas wrote:
> The GPU is most useful when used together with the EBC on the PineNote,
> which is not yet described. But there's no reason not to define the GPU
> already as the hardware is present and could be used without the EBC.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable GPU on rk3566-pinenote
      commit: 82c68c62bd8d64785c42292449688fed4d2c284c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

