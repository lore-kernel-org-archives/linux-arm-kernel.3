Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7E1C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 13:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dhwvLZ3lMVhmKEnca5rP7c57gf2pJHeBmKdCsIIeL0=; b=1m2DOoJiiTf+rqD/Ctwry83KYW
	eTf/cpq3hb5q5js6HCJXAyXE/aiZBycNOjU/qLaUMOxUwsNdnQmUMM+uNClb213s58ZrDyr8yw/XZ
	qGYSakmngrxmfqjbsXafMeu50uDbnZAWGeKtiDNG1YkOv/fOW0Qew+IKEYpGELu59qXV1yB7Uiftf
	u7AKXzt4Tq+HltCaMgP9nZdpRA0GPFIiSK7y2efl/mYGJhD6L9DsD+svldL7DBApfIgLcuCGY1rsa
	EsMgwI/Fn9qXNr3XIcV7/3BLkj4rVCZbsqAzgXSzNT+WltI1DON3yXKsGbCV5jb7JqCxWhItIYP9e
	yT1Cng3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYDX-00000000fFx-35xS;
	Thu, 15 May 2025 13:01:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFY3D-00000000cxn-3HkU;
	Thu, 15 May 2025 12:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=2dhwvLZ3lMVhmKEnca5rP7c57gf2pJHeBmKdCsIIeL0=; b=lQdljp3lEee35nVJq5VsP15Ac0
	G3TV1N3nN47hq4ycpzthNv2Y4tRkox9fkOdp6bOQY2CT728MLhVqQ8ALawdPWo3zPOhO0XO42KSUm
	u0Riq4EB4PdDqO/6oTdXb2W3TjmhWZBJFRHSvhgqrCzn7wvC8bwBl2NWXDHAm7jzX9IZyqrvUpVJE
	IUxjNlLkgeGgWQHyM6lalXF0QKD3i098rkQ2mbjAytZ1/eSwkuKC+aJzeMBzKQi0fwYxbSQYXozwM
	C2EY9zh7h9BMdHlQcxj8rDlfIBCz/yntxH9AKv6tinjh1F+NsRfbKbZSCvoErHVZLA1e3rzo9LekK
	TvpW1NZQ==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFY39-0004ph-BC; Thu, 15 May 2025 14:50:59 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Klaus Goger <klaus.goger@theobroma-systems.com>,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	stable@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: (subset) [PATCH v2 0/5] Fix onboard USB hub instability on RK3399 Puma SoM
Date: Thu, 15 May 2025 14:50:45 +0200
Message-ID: <174731343062.2524804.11565347943974455778.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
References: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_055103_819662_6F8C2657 
X-CRM114-Status: GOOD (  11.32  )
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


On Fri, 25 Apr 2025 17:18:05 +0200, Lukasz Czechowski wrote:
> The RK3399 Puma SoM contains the internal Cypress CYUSB3304 USB
> hub, that shows instability due to improper reset pin configuration.
> Currently reset pin is modeled as a vcc5v0_host regulator, that
> might result in too short reset pulse duration.
> Starting with the v6.6, the Onboard USB hub driver (later renamed
> to Onboard USB dev) contains support for Cypress HX3 hub family.
> It can be now used to correctly model the RK3399 Puma SoM hardware.
> 
> [...]

Applied, thanks!

[2/5] dt-bindings: usb: cypress,hx3: Add support for all variants
      commit: 1ad4b5a7de16806afc1aeaf012337e62af04e001
[3/5] arm64: dts: rockchip: fix internal USB hub instability on RK3399 Puma
      commit: d7cc532df95f7f159e40595440e4e4b99481457b
[4/5] arm64: dts: rockchip: disable unrouted USB controllers and PHY on RK3399 Puma
      commit: 3373af1d76bacd054b37f3e10266dd335ce425f8
[5/5] arm64: dts: rockchip: disable unrouted USB controllers and PHY on RK3399 Puma with Haikou
      commit: febd8c6ab52c683b447fe22fc740918c86feae43

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

