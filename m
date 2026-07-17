Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F33C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 06:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lCAqR5Rm8mCHZXxgZtqL7lCVFwer/yTf69BDAsGWbmk=; b=4wHdYLPAn0sgxELD8OMxlrwLE9
	Orl0sN+ftRSx1fq1GTU+8qQPfqZM6NXmFH+tCU2wIQwIKtjnFbimbMay3LJEjiTy+3domVzNu5d/G
	bIRhRmncJraxqMijYUfCM6JdCoT+NXDRYIm4nepsNbL81wYVqCRW9XlVLFsv9mZ5Ug4zMRggKvgKX
	klb00N5g0JpqJoRJuo5wrtfVhaYs46G2sXZIiXs98d/ZAP8P70JcLg4JWTgW4c5YmI+hk6I9DHnku
	1q9+Tybl6tNW+AeGrocVNn6JOiT4a2kXUltwIveVFlSrZzY0sfUrOI0qFuDQcCFmvqIsRx6jGVDGX
	oQY/K5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcXw-00000001LFp-0hEF;
	Fri, 17 Jul 2026 06:59:44 +0000
Received: from flow-b4-smtp.messagingengine.com ([202.12.124.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcXt-00000001LE7-1KbG;
	Fri, 17 Jul 2026 06:59:42 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 5B42A13002DA;
	Fri, 17 Jul 2026 02:59:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 17 Jul 2026 02:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1784271580; x=1784275180; bh=lCAqR5Rm8m
	CHZXxgZtqL7lCVFwer/yTf69BDAsGWbmk=; b=sPTd/WCMEguV5tFjMjkFQMucCe
	cGiss7/ZLaeg57FQzf7r/G9FW7JYQmc2LxHUMIvgmJibARu9Wu0wbvgB8K8fmOYi
	xQK6cxc4+V2wqaA70g+u9L3qFjGLtQ7SxVXS7TJd0rFZjst68MZ6VWiTPAloYFZ2
	87UtxAbRU0zg7KfTd0gxo2dCoV4bdbjtl+qoBtydq5dL9IMbgCvR6YjH3orIswFb
	pEZc5ugHBbzloAIXjOhzOBl9M4QAeoflK9JSKUYpq5M6pLeEjX6wCK6i5hYnjvRi
	AVkgfDdoPZ6fV1uF/qxrTnFbLa9RZKlTfb8H1zOPnXnKRiepJwdqRCVoKY5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784271580; x=1784275180; bh=lCAqR5Rm8mCHZXxgZtqL7lCVFwer/yTf69B
	DAsGWbmk=; b=JeDtUBHJWKqoVLc8VesPQb2ZouA8BwxAu/VcURNo30Aw9fllaN4
	bYlXsA+By6XbFuJKSFKZ/it5JHvhJWwJ5hZffK6b/+nYsbiEV53ENUmBIHK1PfPk
	UtOLo1V4hA4wLD6osQqxI+OYLTY0i3aXNi1KGEwofT3SGFf1mh+d6KyJcVPsRjQ7
	inRA09Cim8uIuKlspnOdN0Ni/SnS2X8ktIUvfzAo8NNjo884GoydqahohOfjW9bw
	4OLe/pqVj6JIivRWQPgMWQum17x2woG73swW6wSFCMhq4rIigWr3eReZqnZngo5N
	BYKdu2GtS1d7rllVQIGgPHTGhQSA68HSBTA==
X-ME-Sender: <xms:29JZajqQ4YUJ5HUrpA-cUo5nkDHFyzrnaX8I0vkmDviVp-JVNyKWuQ>
    <xme:29JZajPkyZ0GfBY9p7PMxUyEOWzPfr__xZgMhtkhXMcAoM92I8DgwJEruRUVhGhd0
    tkuJsaaFMOItuQBtHGKCpcy3M--Em7u6b3iocvcmmxBncmkGcwHZcI>
X-ME-Received: <xmr:29JZapyDUT8QGEwiFpUWt4GjI-5JgjratEh69CgPuBTTZuwKEDY1zcVOmwWURWjw3ywJ5WcsH9llJiQQR94>
X-ME-Proxy-Cause: dmFkZTEUu7ubCZdFG+9LubXLsp86if4bodrZshBKnCfrABtors2cOYlwAKNp6YTEUn7W2y
    16ODixgVH3WyMn5+5i/ROK3Cw4KoZfEYGFEiBLLyaSnL9oYxaeN8JqubIdHRClJC3tFVJy
    Ok9Y2dcCDIrkfnLSQkloR8z/iGuXq3cLm20dyQX5NugQZIpze9fJr8ffIAj/ys5Hs8D0Zr
    yixqLQcyQIIj7q/heInJz9o5gu5LGLWXzZoLylLWWkliLTo+eOqtmflPJJKjNvWrQX5Avb
    HU0Orn3QK+fJsaDaG9EYIxhEkCtNpfM6NWA/LupGw1iMkBeWeitxIlkR+xqz79wsk91lZR
    EFCjRB9nnizcAUBZ9LVHHW7dMrKSS5gd6UmmWnwXJ5IUNC30MNB7IHnKpn/WEvhFDca1Sd
    vmWkkW86ky7MIujO60uKZNrjUWClCKJ44FLGuKTppZhH+10v+NwBGYg7dK18RAvxbYbgBS
    NYD7vbPnr8KQJJk76UOKO0VC1Wz1hdaP95hV3Mzi3Irxv0nlTPkhQ1ksg4O9UwazdFbLo9
    G/+LYe6zY1j4Ro8iD8NH5yavKCVfaUukyv2nncy7CjtguKwtkCebX4uBcB6ipzs74xbQWf
    B86jnTLpRtpu5XZryQ2vTaCPc7kegVh459SqzzqYxA+0oxFTQMOkSnLc5RiA
X-ME-Proxy: <xmx:29JZanxvSa3Ew2OIR4FDXppNlxd3ye4Lh_z8lNG-0ai5dEg5l2JMlQ>
    <xmx:29JZaqL7uYadSm75tHJNQrweIiZE_6lwBQq28MFeN8f28a0hmg0UQg>
    <xmx:29JZarj7AbxreEIQvRGZ4UCzyCx72mEp505GmnFxrRmpgk2pEcvm1g>
    <xmx:29JZajO7nkKmycDFDMOyLCk9-8aqKZ9vCgCPKd5AZcLs0qWZvdpbcw>
    <xmx:3NJZarsdTq16kN-lSDuyAPch-XBm36fVVVXFO23poEoX2aUVpTY0ZElQ>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jul 2026 02:59:35 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	heiko@sntech.de,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	maxime.chevallier@bootlin.com,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH net-next v2 0/2] net: stmmac: dwmac-rk: refclk for crystal-less RGMII PHY
Date: Fri, 17 Jul 2026 18:59:31 +1200
Message-ID: <20260717065933.2629501-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_235941_414019_9E555970 
X-CRM114-Status: UNSURE (   6.66  )
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

The ArmSoM CM5 has an on-module MotorComm YT8531 RGMII PHY with no
crystal. It takes its 25 MHz reference from the SoC (clk_mac_refout /
REFCLKO25M), but rk_gmac_clk_init() only requests that clock group for
RMII, so in RGMII the clock stayed off and the PHY did not answer on
MDIO.

Patch 2 requests the group whenever the SoC drives the clock
(clock_in_out = "output"). Patch 1 updates the binding, since RGMII with
clock_in_out = "output" is now valid.

Changes in v2:
- Add patch 1 documenting clock_in_out = "output" for RGMII in the
  rockchip-dwmac binding (Maxime Chevallier).

Jiaxing Hu (2):
  dt-bindings: net: rockchip-dwmac: allow output clock_in_out for RGMII
  net: stmmac: dwmac-rk: enable the reference clock for output mode

 Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 5 +++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c            | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.43.0


