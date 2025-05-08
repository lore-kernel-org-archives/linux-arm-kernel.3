Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F121CC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVeaMIyud27ACIV2eA06gPP2ZeLSokpK9pE1Ha/4hoc=; b=4mANxXR/Q/2yFSuHY+zYwrmqCb
	Xlhe44xgX6fibM9zD70W3ZG7OXOzhVZxyLXtMLecm5+753vDho9qLqTKpKFOQMreK82DaD68zbscV
	ld+gATMyirAxobTV4Bh6i+6+w33ugfAL/Pm8Ka3TQcqKrAKVw/Zf9f1oZgAI3geoBcWmfNZaZLphe
	EMKMIBO2M4n9mVImtyBl6ciFZZnILJQjkZ2Km8TgP/vMe9zXBixh6RluVDkW5CfdJWbwAewcX3qrG
	F88u8Wcn9EAQ7GsSgzquytJ0bKlg5y2WH7xspkNyvmzQrUQs+wil31vuTngkqLZ+Dh2Bs6SYs5UQT
	6m3RmxKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD36k-000000017nV-3LMV;
	Thu, 08 May 2025 15:24:22 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2WR-00000000yy6-1Ofa;
	Thu, 08 May 2025 14:46:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746715602; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gOgETbXPdjD9sLzY1UiXI2wgJt/e+pCrZbIV/+4fJ4Pbeq93eSIbG3OUNJOoya5QVFUsk8W53l+waxHm7mpRl0XXaHW0nah29+7/laHfwJH1BHewn/K842SMT1PNqZj+zSblKwGw5O8qxJ6sD8K337SEtoxIXRk5COMNfeWpfT8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746715602; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DVeaMIyud27ACIV2eA06gPP2ZeLSokpK9pE1Ha/4hoc=; 
	b=NGgGe93I/YCs12ddBhPrGOykk3RHe7X9GYml9NzbfJUH6wGROI63Pz84OQ7dzBp1L4XUSzKKIIbyaYIOTiVtdZMBVVLRyw5XjxZwNp/44sBjfwxG00DCM5kmONTDcaUHkOV09kODtnP24cz+1Lr2oBumwSZcB4dHY0U4nBtKDa8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746715602;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=DVeaMIyud27ACIV2eA06gPP2ZeLSokpK9pE1Ha/4hoc=;
	b=BVdZ4iOzDUQ6QlTqroB0R1STrdfAESXp0+JIzuZoeVq/xJG+LlAYW1v0o/2dyE19
	8EnZaxnyxpRaRnXSOjMj6kpYTk66Z4T9bUXjABzB0PG22sxLilrqWo2QJVekS5Su8KI
	+k6AxV1YVD4KRckZdYrYKcXKYwY0sDUvonKbFVk8=
Received: by mx.zohomail.com with SMTPS id 1746715600309765.3309141837468;
	Thu, 8 May 2025 07:46:40 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 2/5] arm64: dts: rockchip: move rock 5b to include file
Date: Thu, 08 May 2025 16:46:35 +0200
Message-ID: <4719179.LvFx2qVVIh@workhorse>
In-Reply-To: <20250324-rock5bp-for-upstream-v1-2-6217edf15b19@kernel.org>
References: <20250324-rock5bp-for-upstream-v1-0-6217edf15b19@kernel.org>
 <20250324-rock5bp-for-upstream-v1-2-6217edf15b19@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_074651_445083_D427EF8C 
X-CRM114-Status: GOOD (  16.14  )
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

On Monday, 24 March 2025 18:04:23 Central European Summer Time Sebastian Reichel wrote:
> Radxa released some more boards, which are based on the original
> Rock 5B. Move its board description into an include file to avoid
> unnecessary duplication.
> 
> NOTE: this should be merged with the previous commit to ensure
> bisectability. The rename happens in a separete commit during
> development because git does not properly detect the rename when
> the original filename is reused in the same commit. This means
> 
> 1. it's a lot harder to review the changes
> 2. it's a lot harder to rebase the patch series
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts  | 52 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi | 34 ----------------
>  2 files changed, 52 insertions(+), 34 deletions(-)
> 

Hello,

this isn't evident from the diff, but the move + these changes keep
vcc5v0_host_en in pinctrl in the shared .dtsi as far as I can tell. The
follow-up 5b-plus patch has the correct pinctrl as an override, and so
does the regular 5b for its respective vcc5v0_host_en, so it can just be
dropped from the shared .dtsi pinctrl.

Additionally, sbu1-dc-gpios and sbu2-dc-gpios need to be moved from the
shared .dtsi into rk3588-rock-5b.dts. The rest of the usbdp_phy0 node
is fine to stay in your shared dtsi, but in the follow-up rock-5b-plus.dts
patch, the rock-5b-plus.dts needs the sbu1 GPIO set to GPIO0 C4 and the
sbu2 GPIO set to GPIO0 C5.

Regards,
Nicolas Frattaroli



