Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2469FC4450F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qntGnCl+gT6W1uiVWS/FnTVD+JK4eRGvEYcVVrmUZCA=; b=Q45hj//o73ZOUNbF8xLWI39KYG
	W6KIBSukoeBGj+MMCT7JkCJvraqtpCnZ5HUnpzqVPrQgWzQK+jsflDPVLkXJGfADVGT0My8XVQM2H
	VH+uKYPoLl1O7Q6lheEdcVgQzmeN3+cKG82hV0uab7sxSZL8lEkR2GFpPXvUa1O+5a6ews/LeBa5M
	2u1zo38M2FnEh37WVEhP8IwRRJdcnxg55z6BudlqGKIhogUmZp89ACyf5uRXaC1/yQZOvkYbpeekL
	mEeGfrQ44nW7y+cS3iwOXrwkuE/c/QNS9JIyp93mBeCinyc0nzNcA5ir6Ea3GgMizmXqSITBNkg/L
	i9hAkVDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcYa-00000001LbA-3PWF;
	Fri, 17 Jul 2026 07:00:24 +0000
Received: from flow-b4-smtp.messagingengine.com ([202.12.124.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcYY-00000001LZz-14CI;
	Fri, 17 Jul 2026 07:00:23 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 1B85A13002E3;
	Fri, 17 Jul 2026 03:00:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 17 Jul 2026 03:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784271620; x=
	1784275220; bh=qntGnCl+gT6W1uiVWS/FnTVD+JK4eRGvEYcVVrmUZCA=; b=J
	BLoI68myrgucyxqyHvUUdXgtieHcXz6tu4wfoJJr2vUYTU1wcHa4IsfaSsWkYnMB
	qQ7IW6BVmmgV0twuWgVCzyUwcbpL854/sxUEGPSVHjNvl2WdCTjBcrn/vYXIO/7F
	7YzxYvFPUL/RVlGiieEOXwNNBYX4nEYiilUSREz5fxIAfnIedzJV4uOeml+IITYr
	SMYuuIxtpNufRh5OyI/Zqudrq7z1gW4Egq7yiWDzRXTAXTZl99XbOP3b/FUaJsh5
	2dVId5QOQQpROv1UBnrBZqxuu5kZnegorJGZiA4syg+Gd0vxBCWPoAkIk3aqGsdm
	ocyL38M6smBzxlKfXbZ0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784271620; x=1784275220; bh=q
	ntGnCl+gT6W1uiVWS/FnTVD+JK4eRGvEYcVVrmUZCA=; b=edUlfFzg8xaRSO3ok
	qaeoF3EWpZWNEbeOtVZhOjjHx0w9iWdpfsrDKm0agPyytxd6SosiX7/kioapKxm1
	O+/9W7puo0J2hyZ4EAOuPyFWFfFqPZMPBotBgC1m5xF8Abvy4wmkkSA++FjDdL/u
	gWPLD4sfeN941iW8WoibpN5TVOuH8mx/hy/XLD2R/wWywghT9MTSGNo16EvjkbrQ
	CV0HGCsUqycnil098QP4vax2JwCGwgfVWaVv6fQZpXzsOR0IUYWIxwESeYN9Caio
	L19vdTlKteMmiTjq/f211NFQvUp4tRGAlN0fHipGX8+615qLalYh7hE51+e1JQ6R
	/FHVw==
X-ME-Sender: <xms:BNNZan7DxMjDq0XYrs2VqehlWq_P0WU7_3KVBgyH--2cz3tNZ8cTcw>
    <xme:BNNZajTv_BFl1eZsu4lLdNd1NV9h1QmtyVpgyX5k5bF6uscDhiaLtzmn3vx0-Icsi
    A313bE_skJyvn5sbXwUNRpr8Mw3h33RUqb5RbALFzx_WfaswfzI8Q>
X-ME-Received: <xmr:BNNZaquyegBDlwx0TIMWmHRr3v1xEVsWumJfZ_sfTT5TXW3E9yMg0Opp8sh59ObFYnDTePMWiLZnHcretCM>
X-ME-Proxy-Cause: dmFkZTEHWYijIVn5Hjmw1gGNs4YgontCXsF2NkmQQZU9ftMEh542K23DBiPfFKZ1WNd+jZ
    y2yluKGWQV5yyoYOo69k1CpzzNQKPcTniEC5PSYE2qnBokqhAOpAo1V3aURJV8OdOYq23r
    PArI03veB1OMjIaAJ/XHKxXS2Q0Sn2Bm5Cc+S5BchXxm8Ht+sv8f8F474Nlm7o9mS0TI+E
    ETLnOv/kO8+zlZUhl5+8mYNDBFsstvrHyTn9JsHO5glGo+E62uUi8cmkfsltXhwLeV+VYd
    4YeC6Biz74FTqzFaf3nkXE8lJmdInDvAnSWCB65oeY0T5VoiGlL5IAX0AbrH6vTIj1O0iR
    /j52j+0d7oi0juD1E2unAh2pJW4REKxwGJeovXyQF2RZZwcJDvdc0nWne7KR7fYLmc9nKi
    DS2NgAVTv4qwdC+u/+A1R5mk3i+0vTdjs7N/7w6BNjP9+I1X+fumeSlrUBzxVst7jrbe1e
    pAyRfre6lPCt2VZ36zyCbiuBBIAcYHHI3411vgQeAHDSsR9hSbCsueNWnEDKmasicXtr1P
    58LcrHgGItRLS3Ln8LpxH9S0NVqMrrvcVa/Ttwi8M6qy5Gy/DDVQMqKPR7PL5mZNgtqRDZ
    YMdWBiScyT+cbqau43e8mpPrYd6Lkm64diNqlhxVxGnk37lSyhBqnw5FlqZg
X-ME-Proxy: <xmx:BNNZal9U1dV78LlbLnUyEmvfNN3UqKb1A0C0Rf3idjaWNGGZgCS_Jg>
    <xmx:BNNZajxRIHiL5zFXH7qKiSqqlYqIAzolQLH0qK7weGHdA_Oe_lSsLw>
    <xmx:BNNZan_KuCdqf-yNdYecaj_qn4_Lye5L-yeBr366_1rZY_0Fme9tLw>
    <xmx:BNNZahM1njhAl-DW8ItLr9HgUx0i5ymQSoxuASNODF4IhhjNP8m_aQ>
    <xmx:BNNZajpzzrU09M2IdHDIOWE5syTrehpp-M2UDdwQs0p9xrrGhNgrK4zn>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jul 2026 03:00:13 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: maxime.chevallier@bootlin.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	heiko@sntech.de,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: stmmac: dwmac-rk: enable the reference clock for output mode
Date: Fri, 17 Jul 2026 19:00:11 +1200
Message-ID: <20260717070011.2629800-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <a1e6cf0a-a243-4739-8563-be385add37b2@bootlin.com>
References: <a1e6cf0a-a243-4739-8563-be385add37b2@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_000022_335722_F7679923 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

Hi Maxime,

> So the statement "For RGMII, it must be input [...]" is now incorrect :
>  - it can be output for RGMII
>  - it will be 25Hz if set to output, from what I get from the commit log.
>
> Can you update it ?

Done in v2, added as patch 1:

  https://lore.kernel.org/all/20260717065933.2629501-1-gahing@gahingwoo.com/

It rewords clock_in_out so that for RGMII, "output" means the SoC drives
a 25 MHz reference out to a crystal-less PHY. The driver change is now
patch 2 of the same series.

Thanks,
Jiaxing

