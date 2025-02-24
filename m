Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70632C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58xlCHbpuFuu6NEK7mQTtjo5dZN5K3aSWLH55ULoARQ=; b=cRsa0NuIgluZqzHVn0UbonNAbg
	Un3lChba0n1YvYtgFJ1jDT5G4qLauteMY5Gg3HnryNq3s+dBBNBdDOrA3sfVOz4dKkvgLc1FaE8MK
	E5AbmyZq1z1qJPbV2fC/n8L3uZQmkAyEns4IiNyZCcuLbE7LUeBTe9sAzz04Ijbk4bTO8XuUYVXnQ
	eAC9AebnGthLqsWGCNe8dsfaf0tGJkssNnoKLqBtiuhPh+6WmyzEdjJKeNsm0yX2YetOZnY0TaQbv
	UoNFfXFA6xJxNt61d1+WWlUTmB/rk6Y7+QyxeNHehavY5hQAL7dZIQqqnvX2xlnbJWMOSHcFTPkJw
	XFPlOhZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmV2n-0000000CyTU-0Gt1;
	Mon, 24 Feb 2025 09:46:33 +0000
Received: from smtprelay0011.hostedemail.com ([216.40.44.11] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUrO-0000000CwWi-0foU;
	Mon, 24 Feb 2025 09:34:47 +0000
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 8E501508AE;
	Mon, 24 Feb 2025 09:34:41 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf18.hostedemail.com (Postfix) with ESMTPA id 2B4DF2F;
	Mon, 24 Feb 2025 09:34:37 +0000 (UTC)
Message-ID: <26d2832ce7aba1c919e8dcb4aeb8fa2abacedb01.camel@perches.com>
Subject: Re: [PATCH net-next 0/2] net: stmmac: thead: clean up clock rate
 setting
From: Joe Perches <joe@perches.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Jakub Kicinski	 <kuba@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn	 <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Drew Fustini	 <drew@pdp7.com>,
 Eric Dumazet <edumazet@google.com>, Fu Wei <wefu@redhat.com>,  Guo Ren
 <guoren@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo
 Abeni <pabeni@redhat.com>
Date: Mon, 24 Feb 2025 01:34:36 -0800
In-Reply-To: <Z7w3QhcYhrzQk_5K@shell.armlinux.org.uk>
References: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
	 <Z7sJHuiqbr4GU05c@shell.armlinux.org.uk>
	 <7bf9577f4b6dcb818785be73c175bcd19b3b4f0c.camel@perches.com>
	 <Z7w3QhcYhrzQk_5K@shell.armlinux.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 2B4DF2F
X-Rspamd-Server: rspamout07
X-Stat-Signature: dzm4ebumxtwbyyqoo1qbgsybk7dqegac
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19mBx6pJ7hyud4Lf2EQyjPbmTA3e2vOugg=
X-HE-Tag: 1740389677-133558
X-HE-Meta: U2FsdGVkX1+5N1cDj+qw+umh28c+txKOgSUaaH0dqayci6ieB+Ae13yavbq9POxom5oeQHC4HdNuhPPmPXsSLd6Kpm9LqlFkdNzx1GkHImNhRB13sgX3E9525FyqznfvneP4+hF++evJu6CNqffpmVg1w5vIQJ+eSmDnBRBIPwqGHQV6wa9+r8Hijv8uD4Dfo1v9G5WQdMJJm96RAmQlvhjafuvnyZ1wBKpVJ4TTz8WQv82S2MqdXywz7IMMkS6J6OyG/v4gKkMIIPJ5J5Bnzf00AFODjrS82yb8FceibNoD+TOsaVTYKq/b47q0Xaxbrvvw8gvOLc/eYvRxvrTBydl20Rd4LDryFoqCticI/znHw9PE2ecmGNR9vjhgtjLr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_013446_257935_58E93B0F 
X-CRM114-Status: GOOD (  18.42  )
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

On Mon, 2025-02-24 at 09:09 +0000, Russell King (Oracle) wrote:
> On Sun, Feb 23, 2025 at 06:33:44AM -0800, Joe Perches wrote:
> > On Sun, 2025-02-23 at 11:40 +0000, Russell King (Oracle) wrote:
> > > Adding Joe Perches.
> > >=20
> > > On Fri, Feb 21, 2025 at 02:15:17PM +0000, Russell King (Oracle) wrote=
:
> > []
> > > I've been investigating why the NIPA bot complains about maintainers
> > > not being Cc'd, such as for patch 1 of this series:
> > >=20
> > > https://netdev.bots.linux.dev/static/nipa/936447/13985595/cc_maintain=
ers/stdout
> >=20
> > Additional maintainers added or missing?
>=20
> Let me be clear - NIPA is not something under my control. It is a bot
> run by Jakub on netdev patches that are received by patchwork - so
> patches that have been emailed out, and thus contain at least the
> To:, Cc: and Subject: header lines, possibly all header lines that
> have been added such as Received: etc. I don't know what it actually
> does.
>=20
> Now let me restate the problem, because the answer to your question
> is in the problem description. Here's the short version:
>=20
> 	K: entries match email headers.
>=20
> Here's the long version:
>=20
> If one runs get_maintainers.pl on a patch produced from git, it
> comes out with a list of maintainers. In the case of dwmac-thead.c,
> this includes an email address that contains "riscv".

Yeah, I got all that from your first cc, thanks.

Which is why I suggested that the nipa bot use
get_maintainer.pl's --nokeywords option somewhere.

I don't use/control/read/write/care_about the nipa bot either.

cheers, Joe

