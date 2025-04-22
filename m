Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1525C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZBXPRHY3UE9SrReW3ywpmh7huR69l16j+Wq7+1X+gU=; b=OvprEu8KA08sjNEONWYNKFvTav
	tc3UIcdY3BYl3xw69JvGe9B8exTgl7t1ZS6XJRNrAPAmcO/EYo4J6Z7kbslUwhET7dpwiqizc4hzn
	jT6LrBHQ0ex/nOzSJweiZYix4mOVfUHDRrUPzqvYkr06F4zYshfEds1jE72umjsgexpbarZC+DeZ/
	XX11nBEmQYQzC8WTJWPeksGSDnJjMGixeCJsctUSXksulRZgOZMxyqmaICq8EZWBU3T8Pw8AS1Iah
	thUs60KM+If91iLSav2XOejT8QM7N3vzliZ0VkrABD3Gy9UrclzE3QghKIoOy859qDjn7hKYsMzQ5
	uViS/06A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7B6z-00000006okI-121t;
	Tue, 22 Apr 2025 10:44:21 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AXC-00000006gHB-156R;
	Tue, 22 Apr 2025 10:07:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=HZBXPRHY3UE9SrReW3ywpmh7huR69l16j+Wq7+1X+gU=; b=c2fpnOGYE9q/rLy/8Lg49CeLcs
	yW5x7DHAk16cRzODCRCE44mz+kR1zvcaepbBuPL+D1vkSM4/hI0NZXroFVxi1Qx+GB/EhJVNvqN22
	7h/E+BajWiUH125isixFu8bobNB/O6XZhVe+DWiojffWOgInZSA/uZf3epuUQpuRzYfJQuCnph9yD
	8RmWsXC5z8fCdlGkiecC4s5x1a37sm2ry3TUgI0JdrHr3kSllK+b0IfcWV14AVFuLkkIr6P7t83fw
	645Qniyv4R1rbSJS1zSHD9w95Ec2GVnkS5YJNDr7JhoPhxKMy7S+DITlWSvfH3kSvNvqywSzrVYzr
	7gDnMIAQ==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u7AXB-0001SH-2a; Tue, 22 Apr 2025 12:07:21 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 3/3] nvmem: rockchip-otp: Add support for rk3562
Date: Tue, 22 Apr 2025 12:07:20 +0200
Message-ID: <1834328.VLH7GnMWUR@diego>
In-Reply-To: <20250415103203.82972-4-kever.yang@rock-chips.com>
References: <20250415103203.82972-1-kever.yang@rock-chips.com>
 <20250415103203.82972-4-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_030722_296279_F4E888B4 
X-CRM114-Status: UNSURE (   7.26  )
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

Am Dienstag, 15. April 2025, 12:32:03 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Kever Yang:
> From: Finley Xiao <finley.xiao@rock-chips.com>
>=20
> This adds the necessary data for handling otp on the rk3562.
>=20
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



