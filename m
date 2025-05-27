Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8867EC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 11:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9yF1OUbT1bqu1NB/QJlao6B5ghagW3BtXAYQCUIhaR8=; b=TDcMxnlanVlsy9KJ1Dr+EX2s7y
	vjAtI/6VtEnEq05yV0KIv37LOt9o/ycQUrreVWpN01B8sFbFG7uG0qNYyvZybhRhbWVXoKstKsoCB
	VIARX7E1uTZXl72pGiAlBsxioPP4P2kM0fm/f/zo9xJS914QaG6GDvOg1SVZlPF7vxclxT22CrqHZ
	oW3zwnYoplORnhA15ZO/JJp9p7hfLFGKaEnmsxbVArIYvM227yJ1LPq55TBjJB3yAjRm6iB15Iucu
	QfrhTDXRICmMVNNo7ziOi4SnAtfEmdFEU6BYHzd8R4uqpdoLnHQ1Sr+9Dm30bnFKQvz8x8Eb4lx1z
	4SrrBisQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJsv6-0000000Acy5-0CMO;
	Tue, 27 May 2025 11:56:36 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJssx-0000000Achg-2CFd;
	Tue, 27 May 2025 11:54:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1748346843; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XV4cwb62i9jbfKhN5YxgyKOpblJwfCS4esxG/Hl5r6XTpy40Ks+5/1Wxsd4w8d21C6Dp62xx6je0WdS5MTyeykTxg67JcVSGikhCIm/O6cl1ZZ6JGkoiFOXR0Ep/5XhGo05KKyDkggAUIA7oMl05BMaHL1Te9iI7/u/Jf65ZzvE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748346843; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9yF1OUbT1bqu1NB/QJlao6B5ghagW3BtXAYQCUIhaR8=; 
	b=Gfkxm9jbtRrUfZKi7vd0MLCn17HN0fTuH0PE0T8to3nJrkG77bwnm6RboXX0cZzK6YF06ZMxxVs6n/I3rbrkvGBMFvQ3W8erU29SfjqnJnv4+MlS8+sF3NxBKox73Iaj213zsH2AOpiwN953faCyfT69hURKY81Qeyy/gjs3Om8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748346843;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=9yF1OUbT1bqu1NB/QJlao6B5ghagW3BtXAYQCUIhaR8=;
	b=VoZxWQ2IeFTd9cH4jQs4r4SzlZGf39Y8YHF1/y1CWVxa5UISmlLhsyWOZ28/0xhH
	2WMDvv4/ZWr0FFF6+E0hJrKdnOiiKDwITtJrPR87WtwuFTgJ5c3h48Yz34khg77dbv8
	dJTwToJj2bygZxc3nM1BD6O9SErZnnyiv/vmezUU=
Received: by mx.zohomail.com with SMTPS id 1748346840882568.0136270447825;
	Tue, 27 May 2025 04:54:00 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 Andy Yan <andyshrk@163.com>
Cc: simic@manjaro.org, krzk+dt@kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, algea.cao@rock-chips.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Adjust the HDMI DDC IO driver strength
 for rk3588
Date: Tue, 27 May 2025 13:53:56 +0200
Message-ID: <3704844.aeNJFYEL58@workhorse>
In-Reply-To: <20250522020537.1884771-1-andyshrk@163.com>
References: <20250522020537.1884771-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_045423_659666_3A0359D6 
X-CRM114-Status: GOOD (  14.23  )
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

On Thursday, 22 May 2025 04:05:24 Central European Summer Time Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> For the RK3588 HDMI controller, the falling edge of DDC SDA and SCL
> almost coincide and cannot be adjusted by HDMI registrer, resulting
> in poor compatibility of DDC communication.
> 
> An improvement of the compatibility of DDC can be done by increasing
> the driver strength of SCL and decreasing the driver strength of SDA
> to increase the slope of the falling edge.
> 
> It should be noted that the maximum driving strength of hdmim0_tx1_scl
> is only 3, which is different from that of the other IOs.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Correct the max drive level of hdmim0_tx1_scl.
> 
>  .../dts/rockchip/rk3588-base-pinctrl.dtsi     | 20 +++++------
>  .../dts/rockchip/rk3588-extra-pinctrl.dtsi    |  5 +--
>  .../boot/dts/rockchip/rockchip-pinconf.dtsi   | 35 +++++++++++++++++++
>  3 files changed, 48 insertions(+), 12 deletions(-)
> 

Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Quickly tested this on both HDMI ports of a ROCK 5T with an HDMI capture
card on the other end. While I didn't originally have any issues to begin
with, this patch does not introduce any new ones, so seems good to me.



