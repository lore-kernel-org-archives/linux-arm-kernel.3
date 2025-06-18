Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E71C71155
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 03:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1AwwVl5J34oJoBmS9eZWUT+dg5sJUr6+s7pSO+AbC4=; b=EJ35NRADAXm1VL7v8TnCNI2Kh5
	3x2vQU8vXJrXC8v1/jap6pvjdpN8/UW/8qbL38nTL/l6dpN47lK54t0lYxec8AZ39fj1MWvIh7uMZ
	35aAGAQIjqQdjr02jWHzrFzWy7LqzoGGpDH5biSf3OkCEqFYnVlOra4nNE4zQumOM1y1Usa5Mn7NO
	wsJotmRPc3TH9OxoVchG4QVdpHQdVpdn+4jn2y8wx2pjtEbjnyJUn6HogM2tmklc51moCvp71d1f2
	B4jc7xAl43kNiZfxkLAYk6MKwxwsIQQ6nwg07EQIBBotCNvOg6pc2RMcRt/nt9DIRfhAVgBgeWzjs
	4O27hBmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRj3F-00000008rmI-0PGT;
	Wed, 18 Jun 2025 03:01:25 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRiu1-00000008r45-3aGu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 02:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750215112;
	bh=D1AwwVl5J34oJoBmS9eZWUT+dg5sJUr6+s7pSO+AbC4=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=VHF/CZyzUlu1fWRJQyr6aBvgr+jSpBFyJ6XNTq/nNjBJSHXOnL9vcWJBoeuYLAsed
	 e8VqQeS8Y3yPl2+PHmPu5a58y3mtZ//ultIggqnNgLlp8x3HDLwbwPYKNpJbRnrdVL
	 oAo8rTJlt16aqFsXrqau31rwx9KDX9Lc/ji+0BkZB6Ak7ggCx6Q4CVVNOID99L38B3
	 Ud92uuywCuBgjB+zf5CVuCRaBZb0h0DK9+9KaTVQONynupPDFDJYDMay3oS21v9Cd5
	 3KFEMFLu+ktnLxwrtJpDaU9B1Zy91QEDqb6kNXrM/MImnxeeVdxQbjiQxl54I3ca64
	 fpRkdJlMCs0nQ==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 91D13640A0;
	Wed, 18 Jun 2025 10:51:51 +0800 (AWST)
Message-ID: <eaba29c18db8883f88e5e105f905a735a0087a3d.camel@codeconstruct.com.au>
Subject: Re: [PATCH 6/8] mmc: sdhci-of-aspeed: Add output timing phase tuning
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cool Lee <cool_lee@aspeedtech.com>, adrian.hunter@intel.com, 
	ulf.hansson@linaro.org, joel@jms.id.au, p.zabel@pengutronix.de, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 18 Jun 2025 12:21:51 +0930
In-Reply-To: <20250615035803.3752235-7-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-7-cool_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_195154_084582_53C0F071 
X-CRM114-Status: UNSURE (   4.19  )
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

On Sun, 2025-06-15 at 11:58 +0800, Cool Lee wrote:
> Enhance auto tuning with input and output calibration.
>=20

Might be best to squash this into the patch with input phase tuning?
Why split it?

Andrew


