Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9483E9E2E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 11:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukbEN640sLCWjepQ3oOy/19KEzPFUeSNtmy3J6LTRuw=; b=PUMv1Ai0kRl052rMikL3GD4ywX
	KmjX+L3kHHysoEw2QTvZA1201jwv7Dm4GaRxcHO6GBtsaeKW5cF1eglO1UvVVJm8/9QKgvtwyduVW
	k0mVATX77MmexZm2J+xg6H1mR0ZEatkQsl+QbvBNnxDPSWUbJfFzYTTfwzhvX8XHh5+teQzx2BksW
	i1wgMR42kbgxgyE8YnXvsbmVsKPcNavxVSzAiC2YK/q/yRVJXwKt3tMfytVrKL6M3wm6Dvu0KnKYx
	BSoqt8clf4/sM1soA5/6zgSairQNnKFcO13dvnz8yX8Bk1dNkiWi46OvpAMh4Mequt6Tven2y+WzC
	0VedlYJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq8fc-00000000aaY-33P3;
	Wed, 11 Feb 2026 11:46:12 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq8fZ-00000000aZw-16y9;
	Wed, 11 Feb 2026 11:46:11 +0000
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 21BD41D00183;
	Wed, 11 Feb 2026 06:46:04 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Wed, 11 Feb 2026 06:46:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1770810363; x=1770896763; bh=ukbEN640sL
	CWjepQ3oOy/19KEzPFUeSNtmy3J6LTRuw=; b=D6P9gLkfxYzKfsUf0CAG8VmOmc
	eJbuwBPDfvJYEDMb2oulNIqbvtpsrgFFuHJ4tOfjjecFZGZ5mLbn6TBLYgV/6Sjv
	skPR67hPYHcWxpgA7VD+1o1GkWLv9GFPl2wdK24aQM6iT/87Wo7X9Xj///a6ilMH
	/6vbIRJlMOwyD8R5YRWVl8UrEp6gZMBYAYv5SHpBLm3ES210Hhv7kurNtwbW6SVW
	wmX+5N39X+0Yr4VgIUd93pZpfvCwqHNG3jsk+jviHLzlf/9Dv3mtulWr2Qd6c+V6
	wv8PgDJLaxgJKxcpWnWlrk7oWdamcch8NTV/oO/l0TAKCkXLOv+v6GbJAqtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770810363; x=1770896763; bh=ukbEN640sLCWjepQ3oOy/19KEzPFUeSNtmy
	3J6LTRuw=; b=u1YJ5WapTnOO51LbuXW87gB9hcscNuECThY7V6wxz90dm115w7c
	K7cYdhXPPy9vJGVPvZRt84jkpeR8kfnyjERL7YQxRyk8veqImnEVJ0MFkzrms8e4
	Kr4/bzXZIzG5CHId/McTed7M8gyjqid5M6L/4adY9F/m+O7gba2CLnB/L+etMiL/
	96d02g4THzrHOl/mSRH2mRvbgvOMCaFje/0t4KmE9MBcvDNK5o19TcoQJszcDmW9
	oS+/qZEbDg9DRQirz+CPrQZfWCkJjXtr1kX8tAr5Ti3c4Oz695oLjwMkHKZkIdMN
	SGMAItjkFgMhmC7n6JE3QWjG0kMUJWn9Xcw==
X-ME-Sender: <xms:-2uMaVBCbfr859cGEbq5QpG7w_o81C00UlHrFHns-aDa7_Y4aeU-CQ>
    <xme:-2uMaSkXQtqXsj36Y7Kk5Dr_7dWnVUlIF13FaOWYChiX4W9WU990fZni76g6o5ep-
    89sUhxhJDv656qa1o6RU3zUlSefJWQQoLdAHWH03KCSxoUMLiQuHWc>
X-ME-Received: <xmr:-2uMaWxwS8pLkK2QTg-yaSmu99IAdBF6VRf2r5Xj3rlnmYSVMVZ34YF8bIxnlvHpF98GHcaVFdI-sU2p3N-y7z6b7ijKT5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtddvgeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujggfsehttdortddtreejnecuhfhrohhmpeflrghnucfr
    rghluhhsuceojhhprghluhhssehfrghsthhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepvefgtdejgfeugefgffethedvueeigfegteduffeftdeihfduuefgieelteekheeg
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehjphgrlhhushesfhgrshhtmhgrihhlrdgtohhm
    pdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehhvg
    hikhhosehsnhhtvggthhdruggvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhn
    vghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrhhotghktghhihhpsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthht
    oheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepphgsrhhosghinhhsohhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhgvghhr
    vghsshhiohhnsheslhgvvghmhhhuihhsrdhinhhfohdprhgtphhtthhopehsthgrsghlvg
    esvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-2uMacQDmam6Ndluo90DoSSA864FB_o7xtOYntFtqf0478uILqnJ7A>
    <xmx:-2uMae9Ad0hpCRjGR50u68RSJo8aR50evKXYSrIMLK6rbTHJXIcwJw>
    <xmx:-2uMaatdKf6p6Cy-_xx49pF4AkcKypYFnHsTXozPWg7lht9t7SvK1Q>
    <xmx:-2uMaWPUK4iBXdUci29oRFj4fciIDYs-kLRBr_JDKASAnGUmAAdZDQ>
    <xmx:-2uMaUsoCZr9j0XuJpu1tJMAcY6fId3JDlqUQWUbeVEP8CzFyi-Z0N7R>
Feedback-ID: i01894241:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Feb 2026 06:46:02 -0500 (EST)
Date: Wed, 11 Feb 2026 12:46:01 +0100
From: Jan Palus <jpalus@fastmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peter Robinson <pbrobinson@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	stable@vger.kernel.org
Subject: Re: [PATCH] Revert "arm64: dts: rockchip: Further describe the WiFi
 for the Pinebook Pro"
Message-ID: <aYxrhXSLHcAHavAd@rock.grzadka>
References: <20260210120142.698512-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260210120142.698512-1-heiko@sntech.de>
User-Agent: NeoMutt/20251211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_034610_102710_DF2B452B 
X-CRM114-Status: GOOD (  17.01  )
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

On 10.02.2026 13:01, Heiko Stuebner wrote:
> This reverts commit 6d54d935062e2d4a7d3f779ceb9eeff108d0535d.
> 
> It seems there are different variants of the Wifi chipset in use on the
> Pinebook Pro. And according to the reported regression - see Closes
> below, the reverted change causes issues with one Wifi chipset.
> 
> The original commit message indicates a "further description" only and
> does not indicate this would fix an actual problem, so a revert should
> not cause further problems.
> 
> Fixes: 6d54d935062e ("arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro")
> Cc: Jan Palus <jpalus@fastmail.com>
> Cc: Peter Robinson <pbrobinson@gmail.com>
> Cc: Thorsten Leemhuis <regressions@leemhuis.info>
> Cc: stable@vger.kernel.org
> Closes: https://lore.kernel.org/r/aUKOlj-RvTYlrpiS@rock.grzadka/
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../boot/dts/rockchip/rk3399-pinebook-pro.dts  | 18 ------------------
>  1 file changed, 18 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> index 810ab6ff4e67..7c23971920f0 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> @@ -883,12 +883,6 @@ vcc5v0_host_en_pin: vcc5v0-host-en-pin {
>  		};
>  	};
>  
> -	wifi {
> -		wifi_host_wake_l: wifi-host-wake-l {
> -			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
> -		};
> -	};
> -
>  	wireless-bluetooth {
>  		bt_wake_pin: bt-wake-pin {
>  			rockchip,pins = <2 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
> @@ -946,19 +940,7 @@ &sdio0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
>  	sd-uhs-sdr104;
> -	#address-cells = <1>;
> -	#size-cells = <0>;
>  	status = "okay";
> -
> -	brcmf: wifi@1 {
> -		compatible = "brcm,bcm4329-fmac";
> -		reg = <1>;
> -		interrupt-parent = <&gpio0>;
> -		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-names = "host-wake";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&wifi_host_wake_l>;
> -	};
>  };
>  
>  &sdhci {

Although it's pretty much obvious feel free to include:

Tested-by: Jan Palus <jpalus@fastmail.com>

