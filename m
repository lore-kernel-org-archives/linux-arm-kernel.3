Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7AACCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuFuN1oxKEfnvw+6wAwkdT8F1FrmY0AhYnpatZF4Q4g=; b=RkkRfga4LtiCbUxcr8yK/0AeB8
	cmYphu4FkhaGagG5dVbi0wBvw6+EM6tF9o+rWnQBdkq4GztWaKvpqJAoRoA43hyObXGkV2JD9ocBR
	rQ4urrSS8yvN1yxraGu/XkzF4thySFPzMFWoVov1SlOnaO/rot3a7YDhn7iuqt2t0ZPtZcSxk9bB7
	gMQgN1lQDW6wtI/9xji6KhWthXpPks5CwK3O45TNCJyYzbzs8t8WKaUmJtfNmRnb0Wwz/K0Ig6gY/
	lw2/cdbBmFD/pIwRWg4Bj1vTGEXiEu36eUXaDzKvARZIuiCQ07fYf37schQfccIqtpYGks1FSF4wm
	YEeQpeGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInMo-00000007Vlz-49na;
	Mon, 19 Oct 2026 13:25:30 +0000
Received: from nimiomail.com ([217.160.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInMl-00000007VkW-3PXm;
	Mon, 19 Oct 2026 13:25:30 +0000
Received: from nimiomail.com (localhost.localdomain [127.0.0.1])
	by nimiomail.com (Postfix) with ESMTP id 4BE2981700;
	Mon, 19 Oct 2026 15:25:24 +0200 (CEST)
Authentication-Results: nimiomail.com (amavis) (amavisd-new);
	dkim=pass (2048-bit key) header.d=gluon.es
Received: from nimiomail.com ([127.0.0.1])
	by nimiomail.com (nimiomail.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ui28TZHKyGdY; Mon, 19 Oct 2026 15:25:23 +0200 (CEST)
Received: from DESKTOP-2QFDG0H.tail76f4b.ts.net (21.red-2-139-241.staticip.rima-tde.net [2.139.241.21])
	by nimiomail.com (Postfix) with ESMTPSA id 9759680C3B;
	Mon, 19 Oct 2026 15:25:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gluon.es; s=default;
	t=1792416323; bh=UuFuN1oxKEfnvw+6wAwkdT8F1FrmY0AhYnpatZF4Q4g=;
	h=From:To:Subject;
	b=IQHUfwV7yw62rgNEWUYH5woMq0H871U/xN3bYCH7ngoEoHNNMv3dp8B3yKkAdnggb
	 j4iBG71UuvYWMD/rVCCUxbl90rY5iUD1qTyX4cQBDjYaOXFyo/um0fR+3gFEbJQwI0
	 xqgUfd5e2AZ6mVl6bFWZobgfmRQsdNnFOcV8Jg5LinGWEpXBg3XQMbqxujyx9F1yTl
	 dnQPOe+yousYddfhp/5GizNy0ow0A9r4DPvdVqSaDXCHWLEhnFNhbS4UhpVspUwlNn
	 McBMAgrBUSGZL31Kx4f9aJiflrQ5ndzcYMsmbHJCWPXaETXpWj5Cdlug/vece4JjNy
	 Del2rES0Q9ytA==
Authentication-Results: nimiomail.com;
	spf=pass (sender IP is 2.139.241.21) smtp.mailfrom=info@gluon.es smtp.helo=DESKTOP-2QFDG0H.tail76f4b.ts.net
Received-SPF: pass (nimiomail.com: connection is authenticated)
From: Miguel Jesus Seron Gonzalez <info@gluon.es>
To: Dongjin Kim <tobetter@gmail.com>
Cc: Chukun Pan <amadeus@jmu.edu.cn>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Change ethernet TXD timing delay
 value
Date: Mon, 19 Oct 2026 15:25:13 +0200
Message-ID: <20261019132513.879-1-info@gluon.es>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aKU1rJKzkkS4P+VT@anyang>
References: <20250819075522.2238643-1-tobetter@gmail.com>
 <20250819151019.877709-1-amadeus@jmu.edu.cn> <aKU1rJKzkkS4P+VT@anyang>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <179241632328.1079602.4812919760712785367@nimiomail.com>
X-PPP-Vhost: gluon.es
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_062528_307601_E782F8C4 
X-CRM114-Status: GOOD (  12.22  )
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

Hi Dongjin,

On Wed, Aug 20, 2025 at 11:40:44AM +0900, Dongjin Kim wrote:
> Thank you for suggesting me to try 'rgmii-id' again.
>
> I'd remember that 'rgmii-id' didn't work with the very early version of
> the board, however your suggestion works. Let me test the change with
> more boards and submit the new patch when it's done.

I ran into the same problem on an ODROID-M1 board marked
"REV 1.0 20211112", an earlier revision than the 20220613 one in your
patch, running Home Assistant OS (kernel 6.18.52). With the current
tx_delay = <0x4f>, about 6.6% of all TCP segments were retransmitted
at 1000 Mbit/s and larger HTTP transfers stalled.

I tested Chukun's suggestion (phy-mode = "rgmii-id", with tx_delay and
rx_delay removed; the driver reports "init for RGMII_ID") on the same
board, on a 1000 Mbit/s full-duplex link. It works fine on this early
revision as well:

- 3 retransmitted TCP segments out of 24929 (0.012%) over 3 h 49 min
  of uptime, and no RX/TX errors
- 90 sequential requests for large files (22.5 MB in total): no
  failures, 1.4 s in total, the slowest one 47 ms
- 120 parallel requests (75 MB in total): no failures, 1.2 s

For comparison, tx_delay = <0x35> gave 0.03% retransmissions on the
same board.

Are you still planning to send a v3 with rgmii-id? If you don't have
time for it, I'd be happy to send it with Chukun's Suggested-by. Either
way, for the rgmii-id version:

Tested-by: Miguel Jesus Seron Gonzalez <info@gluon.es>

Thanks,
Miguel

