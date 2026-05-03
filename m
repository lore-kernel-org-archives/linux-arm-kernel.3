Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5DCFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 11:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08lnOfw+N7cYSHg172MWt3iibjXFJDLlfSbC8ADxRWk=; b=WSTr2NIm1Hh2/BMTu0WtOcpiGK
	AxNc9Bl1iboigXp2xFFd6sqy0HTSl+O8JuqrZQOGlxUN/Dj32ZhIfebChsN2EMNcia9Z7eiBbvMVG
	WWMof/WsEI7snOTGjUICdxWdq8z4qWON5yxJ2j0Bk/s+FB5YUrXaHMAxA0/tiOY7dg7tY33MyF+ij
	ty4T0ewBiP/hiBdNRGLe8y3VRS3rcsZDvwCxReN63SfpeVgAKLVr3kyeleV3WRj0L2Zit10fFHfcI
	k0l5y8bbO1SJTxDwq3fnVH125twnvwRqx4+/an9kEF34nnF2P86aJQrE1NeIQxM0WP0yyZHtC/y8K
	81QvJ8xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJUf1-0000000Aqrq-07GA;
	Sun, 03 May 2026 11:06:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJUez-0000000AqrZ-2wTQ;
	Sun, 03 May 2026 11:06:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C93F360120;
	Sun,  3 May 2026 11:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CDBC2BCB4;
	Sun,  3 May 2026 11:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777806411;
	bh=YQOeN5BLc+pPy9v92y0mrqvir0VtBXLhse/m+6gpt68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sY0hxcxN2yrN+m4OPBZeYw7pWttaE94uan/AjdsPJ22WWMqj9w+YEXvNrBN2YghwE
	 cJif5MIeR+0k7UfKSilTVqQhmEJUMrx+fb0GwFHigphtEtCBViuKon7aTuj1jPnCsz
	 TxrwxKcvkMXboPsYcpBKrWuVSAZaBLUdMfR7Kffaa/QYtuxzBhCETgsZC51q3kD9WD
	 xodr5pu/pX/B4QQknUmOuKJawGk9ol3G4gpmuMcDVidKp7AVgweAX93PJFAG2Ezjty
	 CUWvVeyxRci7R8KJuv4D8Avt2l7290SzMvkXgoTNe59gXbsOSoM/CMpwUP51m8Mqxf
	 o5PliNtcqHYnw==
From: William Breathitt Gray <wbg@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: William Breathitt Gray <wbg@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Lee Jones <lee@kernel.org>,
	Damon Ding <damon.ding@rock-chips.com>,
	kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	Alexey Charkov <alchark@gmail.com>,
	linux-rockchip@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	fabrice.gasnier@foss.st.com
Subject: Re: [PATCH v5 4/6] counter: Add rockchip-pwm-capture driver
Date: Sun,  3 May 2026 20:06:43 +0900
Message-ID: <20260503110644.462016-1-wbg@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <q0kG3ZZyT92lQlYsvZD_qg@collabora.com>
References: <q0kG3ZZyT92lQlYsvZD_qg@collabora.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=758; i=wbg@kernel.org; h=from:subject; bh=YQOeN5BLc+pPy9v92y0mrqvir0VtBXLhse/m+6gpt68=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDJnfdXSjr+uG9LolLH+69rEAp8L++Qpsv/iEOfd9/7FYO 2LLJdsNHaUsDGJcDLJiiiy95mfvPrikqvHjxfxtMHNYmUCGMHBxCsBE0l8xMnTNE9hydJfidDbB cPdjUssKRfzfqV9z5XlTyWx3+odinREjwyLnzQ2Vefe9l7o67xPmtlsRfTpUcf3xbRJmKg/1F7m vYgYA
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit
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

On Mon, Apr 27, 2026 at 07:35:32PM +0200, Nicolas Frattaroli wrote:
> On Sunday, 26 April 2026 12:55:20 Central European Summer Time Damon Ding wrote:
> > BTW: Is there any user-space test tool similar to libpwm for the
> > counter subsystem?
> 
> I've tried looking for this as well, and couldn't find anything. If
> it exists then adding a mention of it to generic-counter.rst would
> be in order I think.

Fabrice Gasnier added a Counter chrdev userspace test application to
watch Counter events; it's at tools/counter/counter_watch_events.c if
you are interested in trying it out.

I do need to update generic-counter.rst to add a few new things we've
picked up over the years, so it is on my general to-do list.

William Breathitt Gray

