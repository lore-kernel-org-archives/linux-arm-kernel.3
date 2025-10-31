Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7265DCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6q2NkSh6EvEes0ee9aqz6Mk5HT39PLgzFSFsdCKynDs=; b=nn5i2rIso/HLCBeekkvASTMo4u
	KY7YEyBwGXMvJswsbim/qDYZuKGa/H6zxEPaRwWZI2oLB7+y74EogIM8s3Id1UHhEZz9or2C2Xjvn
	RynDasreEf1ynYhDkE16zcNkBCBDzY2jrzgUHZ+bwbgnIoASgNi9bI5pPJ+r4v1H05NtbrBtrK2sM
	vo1pBS5ohGPBR/r2Fb9ByjVpYOFNnJ77TOVdcwvzYKcFOJwHMgJsBm0+wHwogpzCdB9z0eMwnsfUN
	nSV6+1AGGEwVkUUFVIJEkUNtEOZzIB0k8SXXQEMrZSZkgUMfMuLBpOKl8VjoiVXLopkPi4F6JH3gL
	3I4Hmu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsqo-00000006TVX-12iJ;
	Fri, 31 Oct 2025 17:23:46 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsqk-00000006TV1-3ESf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:23:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ED47D1A17C2;
	Fri, 31 Oct 2025 17:23:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA21560704;
	Fri, 31 Oct 2025 17:23:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA61411818007;
	Fri, 31 Oct 2025 18:23:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931419; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6q2NkSh6EvEes0ee9aqz6Mk5HT39PLgzFSFsdCKynDs=;
	b=YlG03qKIoTkx0feVDAy0QuYyShELPfDSt9dm2JX1B05UDHCWj5nH7jgEye1xe8foK1ArFS
	w+LkB3eULvCLBCTNUc3wexzM1e7QDQUSgS0WdruZ+YnMTO+tNTSRk23eHLLfByCqxmOp3J
	G0wtaOfTbEHPh7Kpf4anCpcDZly2vO6YtjJQAShmKJ3fw/eJUOhpoX2XdFvLCgg9z4zvE5
	EIaxNViXFpcwm4uthXkR5iSwjmwxF56sSddmV6rx/0BRXKFwdW4fCq8nJbGU4Okbmr1v4D
	p5+0hBVVckTn7apqyBwcnrQz5fu/VYW91UEVXrm/bKuxs1pkyTEITX/exEcWuA==
Date: Fri, 31 Oct 2025 18:23:34 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, Marco Crivellari <marco.crivellari@suse.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Sunil Goutham <sgoutham@marvell.com>, Richard
 Cochran <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 5/7] net: thunderx: convert to use ndo_hwtstamp
 callbacks
Message-ID: <20251031182334.41cb5156@kmaincent-XPS-13-7390>
In-Reply-To: <20251031004607.1983544-6-vadim.fedorenko@linux.dev>
References: <20251031004607.1983544-1-vadim.fedorenko@linux.dev>
	<20251031004607.1983544-6-vadim.fedorenko@linux.dev>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102342_948204_4AB4E8EF 
X-CRM114-Status: UNSURE (   7.10  )
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

On Fri, 31 Oct 2025 00:46:05 +0000
Vadim Fedorenko <vadim.fedorenko@linux.dev> wrote:

> The driver implemented SIOCSHWTSTAMP ioctl command only, but it also
> stores configuration in private data, so it's possible to report it back
> to users. Implement both ndo_hwtstamp_set and ndo_hwtstamp_get
> callbacks.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

