Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C43D5E381
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 22:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAHRAxJSwzztjtgUr/pm/xjqAckdpHljo3U56gQulB4=; b=hIKWME98wdLHhJbvVZ7eQ9GjLE
	Vn2A4XR5KggvCU2oPYFad18T99eMTOhi4wv3juQACT/DW/TkrW2pc+Z17dwvYtaGvEnFns1zkiP/q
	B0yeuxv/z7E1u88S9pKw0VVnIUbsKRBFGC+Oyx128ucV+PFyl7lKkqFcy0klVSLastIN52J2qN7Fe
	cpEejq5Iexmkn0dqnqYDd1/frE6Cch2tha5JvvYUg0K5t61h78qiGa6GedDKpPqXOw/NA/oJ/Rrxq
	YT1szV7emGWgSOECzQmA/kKYgtLuyQ+baDNDuf81s1IbG5daJbrUj3Yt8wxz1dKcf5JECmD1aJDeq
	ydBEfjcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9tjo-0000000E2WZ-23p0;
	Sat, 09 Nov 2024 22:15:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9thp-0000000E2N6-1t07;
	Sat, 09 Nov 2024 22:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YAHRAxJSwzztjtgUr/pm/xjqAckdpHljo3U56gQulB4=; b=b7TmA8P+zt9VVlbT2CbrQ4yO/i
	iyWxPoOmYtOwbclzs8HBS5o68gZ8o4VPcQpd1EY3ctT/uXvME2u/hwlPfliGg/etMRE9167Y76CNB
	1JBKRxzjnsSVYSkbfYu1V8+haNISofv4oaacnXdMgnUu90rHTPVR3r+1eNIauR7UF7vtl8hyphT3P
	4BUH5/mJ/1pp0STTyUbctw8EnOW6jfd1/ixLgOUElr97+XLfBHOaNA6hOsRSLvYUjbzQ4qVWvFjZN
	5YkTeZVrINI5F0MrtgWyAFqbHnhXlkPBLS9HUwdDf64yTL/P3TffVrRg9Kj+Gq4sW9ISHAek1eR1X
	9AnBu1Mg==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t9thh-0000Br-5E; Sat, 09 Nov 2024 23:13:13 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Algea Cao <algea.cao@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH] phy: rockchip: samsung-hdptx: Set drvdata before enabling runtime
 PM
Date: Sat, 09 Nov 2024 23:13:12 +0100
Message-ID: <1876958.atdPhlSkOF@diego>
In-Reply-To: <20241023-phy-sam-hdptx-rpm-fix-v1-1-87f4c994e346@collabora.com>
References: <20241023-phy-sam-hdptx-rpm-fix-v1-1-87f4c994e346@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_141321_542715_91391203 
X-CRM114-Status: GOOD (  11.10  )
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

Am Mittwoch, 23. Oktober 2024, 19:29:54 CET schrieb Cristian Ciocaltea:
> In some cases, rk_hdptx_phy_runtime_resume() may be invoked before
> platform_set_drvdata() is executed in ->probe(), leading to a NULL
> pointer dereference when using the return of dev_get_drvdata().
> 
> Ensure platform_set_drvdata() is called before devm_pm_runtime_enable().
> 
> Reported-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Fixes: 553be2830c5f ("phy: rockchip: Add Samsung HDMI/eDP Combo PHY driver")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



