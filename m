Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF8CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIPzSOSmEgSlPbbHnLQTuNk7wFwXE1tCgOgnbQmEXEY=; b=uNMaT+e60MsFgajUG4tA/wkn6y
	ILL7oc5dI2Zmx3c0ArSpf9vl2DD9vi+KNmjXjGZzWHI68GAjGfR5i0hxy4N+e7Ld9pD7n7wwvw4O4
	VFSgsLZcT8XAqjjcoRTSeFtBT3FLtXCjktMmDviKiV5kki5+8hW3kcamXLqkbGh1Tz8DhkNhnXMH/
	0CvFqWnif9Pqd7EtwbI5unJ4AlM3h+nzGyCvKY12LrEW4xSw/+mMrqRy64w2qV3I3JYa6JnzYmeKI
	3hMOZN7rYn4+moxW9/qV2BiHXk3cWu9y7II1GSnEXqsCDQcSN5TY8mC1XOdLCM1OIwVtCaS7IrND0
	iTD45knA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsmu-00000006TGk-0uRP;
	Fri, 31 Oct 2025 17:19:44 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsmr-00000006TGO-2mp3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:19:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 181E9C0E958;
	Fri, 31 Oct 2025 17:19:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B64F60704;
	Fri, 31 Oct 2025 17:19:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A471C1181808E;
	Fri, 31 Oct 2025 18:19:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931178; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YIPzSOSmEgSlPbbHnLQTuNk7wFwXE1tCgOgnbQmEXEY=;
	b=mryXkMDZusdBUIzKHnaJf9tjD7jnW1iTiBKtQ00qkL4IO9C+Jqz8y3m8jsUlffpprshxPM
	+0nODBHwJNrqBkm0onaBK8Eejo4cN9qix5TyIf+ba89pi37WIBKOQXrTvXSH1v4dbxTf1s
	Cs4kTOkskVRYtlWkkpGImyTgLoXZjYvqM5UbMhbGNlfqoqt7mFxazrVAf7KSc1xBw7RadH
	Sns2ser7H6oT8PCR5c85v+RvqGlN9rRLeZJEWoCMaGwrXLlyQqIJOiog32JhjYS359gVXL
	OX4Xap1bh3ejYJPRHhJkIDwSjgUcKPKBaKndJbAUTchS7342OVOYy1wLwt/OKA==
Date: Fri, 31 Oct 2025 18:19:34 +0100
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
Subject: Re: [PATCH net-next 3/7] net: liquidio_vf: convert to use
 ndo_hwtstamp callbacks
Message-ID: <20251031181934.0dd056d9@kmaincent-XPS-13-7390>
In-Reply-To: <20251031004607.1983544-4-vadim.fedorenko@linux.dev>
References: <20251031004607.1983544-1-vadim.fedorenko@linux.dev>
	<20251031004607.1983544-4-vadim.fedorenko@linux.dev>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_101941_851484_94574E61 
X-CRM114-Status: UNSURE (   6.92  )
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

On Fri, 31 Oct 2025 00:46:03 +0000
Vadim Fedorenko <vadim.fedorenko@linux.dev> wrote:

> The driver implemented SIOCSHWTSTAMP ioctl command only, but there is a
> way to get configuration back. Implement both ndo_hwtstamp_set and
> ndo_hwtstamp_set callbacks.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

