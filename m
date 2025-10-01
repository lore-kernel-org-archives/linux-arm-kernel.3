Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292C5CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 20:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jElQQ9PX+0V5sqeyNaST6yqqr8qfdCvwBoU7CLgEs94=; b=4gHIOfgN4q13+FhnGFn59eF2yG
	XkPcMan/NhIZes/3eaWo0jiA3STNlPdC8zWa+CJCSBs7XWDmmM9lXmjRQ9l+jFM13A4UhwLGqxB0P
	/Bv9ABy8K4on4SRsVDo4CYsgyV7Lx20oZtn37HQdgIa1VpXpsMMY97YjCVciBd5Ak/nys2it3NrNb
	PWBPej7ij9cdOaIqwBEaQy5a7EBe/upVH05R2fJsR0AUWrniMpBn50T5rxHeMTuzpumwB1LnlSExH
	BRwRYE5Sy9yfx4FADdviAiT7mmO3TaFcZ233zgHEwWcUSwDelgK+Pbwxn6Si1KCApeYkCfIrtczmM
	RR0NL1vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43oZ-00000008wlz-0r4w;
	Wed, 01 Oct 2025 20:52:43 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43oW-00000008wk8-0a3h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 20:52:42 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A1195140017A;
	Wed,  1 Oct 2025 16:52:38 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 01 Oct 2025 16:52:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1759351958;
	 x=1759438358; bh=jElQQ9PX+0V5sqeyNaST6yqqr8qfdCvwBoU7CLgEs94=; b=
	qK5+6bq0zPVE5zIunXwsiFzMIVB099c8exml7+QJApsStVDdbbDWgaVQSDTQnI7r
	gPGXnDoCrASbuDLpPHjZmkm9kDuQ2v4+BMAjKi2EO6HqwXqcerTyIxOnRcZ+GxH5
	GsQ34wKFRmQzhsNC/CWen/PWosSbYDuoc+5bdlmxvxXtg32yyPdE9JUlRw96C0rs
	/tbdvuBMqa7xQ9ZzyK1xcrxm+IGZ6PbG9yV/KoIxcFvr4RTVT6MCUlGtK5qqvnJY
	2xtgbX1b8ggiT6HRs5OtLBxbnnZVoYfNE5OJhvvq8H+mZuceqI/0OTHP3aSeNxKc
	xnkpwmaoCRWz1q4xpk+r7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759351958; x=
	1759438358; bh=jElQQ9PX+0V5sqeyNaST6yqqr8qfdCvwBoU7CLgEs94=; b=F
	373QN7NihCkOrI+VN9YxZwLwhdUmhD7cRKlbHXdY7wMh5rTjXycKcYi2ZZRXxn8r
	dn35QppbjXPmPivf0v4KwFWDOKWxeAn+CYHDAK4hYKKByUFKRNJO8EmK7wN8wS1o
	dAPECR+dMRqrQwO35w6/HJXtQFEGjH8Zp0T4ssmtmr/0zBBlKk4QZJqjrodwkY0h
	X+KR5hWXy1TKbDF/GVx11U2WCRcLHDUEgkqJ9hlKZRSU8qa3/o4LsMBWhkl6Rfhy
	TEaBXr2j1NcsH42hnWM1UJALR1UtF/xqtoLklkxx/vg7wz1IFerG/RWn7MYYoxXl
	Cs7bjj+woEDbpStaE4WIw==
X-ME-Sender: <xms:lZTdaJETKfO1qfiNxl9hZ2rQ7rCxr1MtK1fjha8scMrDKBn_qc_gCQ>
    <xme:lZTdaJJuTBNbkXKVPInsj9UuTeCnEiGf-1UNNmE2zC1iRVGGJDmuigBBdOJinnaF0
    q5dq_tzQqyMcECrCayTsSU8bsJxIRoRxusM41rbNKzTEhDD6pvIPIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekgeduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtth
    hopehrmhhkodhkvghrnhgvlhesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthho
    pehrohhsthgvughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtoheprghruggssehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnrghthh
    grnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhrihhvihgrlheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorh
    hg
X-ME-Proxy: <xmx:lZTdaFsErVrRlEn2dHr66ucnD-LOgrU6d9vsAe2CXLj-Nrd_wL8bLg>
    <xmx:lZTdaM8k4xrN4C-HMtQOuo0lUlZN9t8w6NA3LLJuqVePmcDHWfVAqw>
    <xmx:lZTdaETlupRQZ-Ph5aEzaBK_F6MXRjnbVEVglO_Y8kf6VEdthIU7PQ>
    <xmx:lZTdaGVJunJInLI4WJU8QMslHtjuGQrt4N2SwyKhv65TSyk1ahwgLg>
    <xmx:lpTdaMnySD3-diLxf8np-sfjgq9uwp1H3sAFgrQJ-xcXmwaaf6xkUKrd>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C1C5E700065; Wed,  1 Oct 2025 16:52:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AOvO0JZNdWB-
Date: Wed, 01 Oct 2025 22:52:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Franz-Josef Haider" <fj.haider@outlook.com>,
 "Linus Walleij" <linus.walleij@linaro.org>
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Eric Biggers" <ebiggers@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Steven Rostedt" <rostedt@goodmis.org>, "Kees Cook" <kees@kernel.org>,
 "Dave Vasilevsky" <dave@vasilevsky.ca>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, trivial@kernel.org
Message-Id: <6d9bb65c-d693-4d99-8183-b605cabf9380@app.fastmail.com>
In-Reply-To: <VI0P195MB273993B2928F985EAC763375EDE6A@VI0P195MB2739.EURP195.PROD.OUTLOOK.COM>
References: <VI0P195MB2739D000BD1BF18B3B718F93ED1FA@VI0P195MB2739.EURP195.PROD.OUTLOOK.COM>
 <CACRpkdZbwuf2Fgtq+jyqzqspb37-P6X4O9xqkG-mSb+afSjh3g@mail.gmail.com>
 <VI0P195MB273993B2928F985EAC763375EDE6A@VI0P195MB2739.EURP195.PROD.OUTLOOK.COM>
Subject: Re: [PATCH] ARM: Make sure CPU_ARM940T kernel can be built.
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_135240_664009_7162B971 
X-CRM114-Status: GOOD (  17.47  )
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

On Wed, Oct 1, 2025, at 18:04, Franz-Josef Haider wrote:
> On 9/30/25 15:09, Linus Walleij wrote:
>> On Thu, Sep 25, 2025 at 11:33=E2=80=AFPM Franz-Josef Haider <fj.haide=
r@outlook.com> wrote:
>>
>>> From 33ce5a26ef08199625bc5bb01a176047bfacff91 Mon Sep 17 00:00:00 20=
01
>>> From: Franz-Josef Haider <fj.haider@outlook.com>
>
> Hello, I have done this change because when trying to "select=20
> CPU_ARM940T" from a Kconfig for a device with arm940t cpu, the build=20
> ends up failing with errors like
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/lib/ashldi3.S: Asse=
mbler messages:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/lib/ashldi3.S:44: E=
rror: cannot honor width suffix=20
> -- `rsb ip,r2,#32'
>
> With the change I am able to build a kernel which runs on a device wit=
h=20
> arm940t cpu (with the patch "ARM: Add missing mmu flags entry to arm94=
0=20
> proc info." which I've submitted as well. And with the necessary mach=20
> files etc).
>
> I can elaborate on this in the commit message and also adjust the=20
> condition to include the other CPU types you mentioned.

Hi Franz-Josef,

We removed support for ARMv4T NOMMU a couple of years ago in
commit 2f618d5ef5dd ("ARM: remove support for NOMMU ARMv4/v5"),
in order to simplify the Kconfig CPU selection.

Adding a new platform in turn means you'll have to add that
infrastructure we skipped back then, and the dependency here
is only a very small part of that.

Do you have a public git tree with the rest of your patches?

     Arnd

