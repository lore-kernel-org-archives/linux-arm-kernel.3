Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E358AC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 14:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lIUhvjDQXmA8N0+09UM/IwuxvLo1nT1l7VBOZy79DE=; b=I9CbCrAuZMd2PrkBkSjwR4kGtS
	ONdOkOKXiRryQbSJGno9v7I5AjKc+gHcxEWjIb09x5rpIVClMxMXoLUukEf44NXCy2kUL8tI+h05S
	rwoG9MVbeRoK+/typAwnllj+xaA8F/sNHl/lPZxVAl/onX0YELX1ukjAiCsfIW+YfEBY2mUgkXmM2
	t7gqU1t66jAi6AQYjmL4MsLpgo2Tfx2N3gOeu/zaFDL7kS24piwdTEmMMluTdfEqFkw35QoixK+IJ
	20HsZkJhV4QCG4i/ln4XcDvJFVdkVGQhNqXxcbuG4j2pV8YjD8tnHyAWd82WgtVCmsNDMxFgNDsMY
	lCO7se3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmD4q-0000000BHzt-0S23;
	Sun, 23 Feb 2025 14:35:28 +0000
Received: from smtprelay0011.hostedemail.com ([216.40.44.11] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmD3K-0000000BHuX-29sH;
	Sun, 23 Feb 2025 14:33:56 +0000
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 3AEDFC2A6D;
	Sun, 23 Feb 2025 14:33:50 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf19.hostedemail.com (Postfix) with ESMTPA id 9D56620027;
	Sun, 23 Feb 2025 14:33:45 +0000 (UTC)
Message-ID: <7bf9577f4b6dcb818785be73c175bcd19b3b4f0c.camel@perches.com>
Subject: Re: [PATCH net-next 0/2] net: stmmac: thead: clean up clock rate
 setting
From: Joe Perches <joe@perches.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
	 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski
	 <kuba@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn	
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Drew
 Fustini	 <drew@pdp7.com>, Eric Dumazet <edumazet@google.com>, Fu Wei
 <wefu@redhat.com>,  Guo Ren <guoren@kernel.org>,
 linux-arm-kernel@lists.infradead.org, 	linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>
Date: Sun, 23 Feb 2025 06:33:44 -0800
In-Reply-To: <Z7sJHuiqbr4GU05c@shell.armlinux.org.uk>
References: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
	 <Z7sJHuiqbr4GU05c@shell.armlinux.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-Stat-Signature: esw3dr8mhka38dy95jmw4hywg8muj68u
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 9D56620027
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+wRTpTpK3yZctHayRKM8k2m6yVovYm8rE=
X-HE-Tag: 1740321225-99173
X-HE-Meta: U2FsdGVkX18tLefx9AGTjZ0jhquEbj97fUAGJuLtZQssX3hWFu5sggBKHI4DwjWn8Zwn0QpW3Qr0HmBXP3ocR/MHKikZ9oAZK2xrnR9ATgzsWS1svxwvKnlT9OoQm5zxwAd/ZvqtW0AzDPqtc7FJP8cp33TVipXmpgupjKGtdNm8SwEeZaEALT3gFjUOydgga8gwmPF+qQG/2CHmqq4HGIIp4ZOJJjRR2ZedoQ80uSlycAsw472d4W8xMshd4NzXp6DYOxPADh0pAXMVHh37IPsPhCUT8YcB6bGYItqwGeOZ3/iGOfn9LRbizQIKBTGHXFkaAqVaWP8zsH3fGG8hmSj4Hv7mOeLeo/OdWEF/C68muP3EJXVkcAgoX9U7poXD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_063354_608356_E196CC23 
X-CRM114-Status: GOOD (  10.03  )
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

On Sun, 2025-02-23 at 11:40 +0000, Russell King (Oracle) wrote:
> Adding Joe Perches.
>=20
> On Fri, Feb 21, 2025 at 02:15:17PM +0000, Russell King (Oracle) wrote:
[]
> I've been investigating why the NIPA bot complains about maintainers
> not being Cc'd, such as for patch 1 of this series:
>=20
> https://netdev.bots.linux.dev/static/nipa/936447/13985595/cc_maintainers/=
stdout

Additional maintainers added or missing?

> So, it seems running get_maintainer.pl on an email received from
> mailing lists without first stripping many of the email headers can
> lead to false K: matches.

My guess is the nipa bot should exec get_maintainer.pl with the
--nokeywords option on some pass it uses after cc's are added.

Or are you suggesting that lines that start with "to:" or "cc:"
should be ignored by the get_maintainer keyword test?


