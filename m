Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322D6E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1nGZRsdGmqVUL1npTJ8LurygNK86mgh5TM5QfJtPsQ=; b=zfPp8TcsCz9zjnstPJBF3cOAsv
	eftYxW/p2Bfxr150K9w3vPE7zm+JsJ4idJ7tc/bqmptPG66epaCebedWXAa9jA+j36C9Bo4LAvFl4
	oV9wWTjO6ZOLO0DlswGqU35qOR0Kry5iIxbcvOhvbF3RW63wrX1Bg7wFadnyxokU6hUwQxR5KljNc
	mKJZowePfeW3Z6CAjF+f2Z/4BcAT95ONSmld0bRhS3Dsn0rvL6K8rt+GgeNoOviuxQ7Mak9AdpsGo
	++2hzpjUgnMt0nNEvL1tLBMOEZT9Cajwg3mhZHRYD/sGkepOtyOQ9hcbFYkuOiIN/T0HbmxVbwCAu
	kflKrfEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVkw-00000008Xxt-0VeA;
	Wed, 08 Jan 2025 13:05:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVV7p-00000008Psg-36rX;
	Wed, 08 Jan 2025 12:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y1nGZRsdGmqVUL1npTJ8LurygNK86mgh5TM5QfJtPsQ=; b=xBu7aTtVOAVDd5SQ5o8zbWQX7+
	Dblc24NyX6lBrscMsgnEHkE5t3tdLWlNLuWLUhLay3HB71/4h6NCgOrOC5q53ARwWg3kXu2ZbWIWB
	jtKYql+xbRIn85Y1WXZk+KhGBImNQmAOqkHslPAKu5N6kIe6utAwYsPATwly7PmWXb+od6D/1jD2r
	Ckjk0WKeQvWzAUe/IazBwUygv7wU/k+fPJdCNROFA3sfpsSeABwRiRYSXVJIn/d/uW1KfbB7QEhcr
	fMJMBUHnXs9dNwZ1fWxiY/NbI1tE71hc7yBp755PKg13PY6tKs0UdykTLywdqQ9nSqz09QCrnTU1A
	Nh4niR2w==;
Received: from i53875aad.versanet.de ([83.135.90.173] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tVV7o-0005gn-7p; Wed, 08 Jan 2025 13:25:28 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: anton.kirilov@arm.com
Cc: Heiko Stuebner <heiko@sntech.de>,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	nd@arm.com
Subject: Re: [PATCH] arm64: dts: rockchip: Fix the SD card detection on NanoPi R6C/R6S
Date: Wed,  8 Jan 2025 13:25:14 +0100
Message-ID: <173633908212.2779821.7921893226618386547.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219113145.483205-1-anton.kirilov@arm.com>
References: <20241219113145.483205-1-anton.kirilov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_042529_790280_B1ED954B 
X-CRM114-Status: UNSURE (   9.04  )
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


On Thu, 19 Dec 2024 11:31:45 +0000, anton.kirilov@arm.com wrote:
> Fix the SD card detection on FriendlyElec NanoPi R6C/R6S boards.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix the SD card detection on NanoPi R6C/R6S
      commit: 95147bb42bc163866fc103c957820345fefa96cd

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

