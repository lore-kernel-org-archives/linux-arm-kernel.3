Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055C7E9410B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 10:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUMtD88AdGpX8s4OOc8iMm1yt6OaFYCq7BaaMzDEg90=; b=qJBIAp6MlZC95/1P7M2IYPrAg+
	rhrvTF7QSHQAZtBDXSlQC7Kawteh2EJR7faidB83u+RLAF/Gh0tdkM+tWPfOq/ANPOam1MLc4sS4N
	SmfklSq0zT0AC0mY0/4f32woUYmtc1GYMDla+kfUiecleV6d4737C3OSopeL2TN05/aSdRfeh8XYd
	AmggrUcACNfNW12Mx3g99SojqiurrhKruTXl9jBcRZa6GxJPxpUBlikTUMrFDR/FCBS2Zmss7G0o6
	E/bHYOSe1AaJr63Pevj8IBXLi+rOvRwonIHMsE29prT5KnoTBzQ6OIxy3xBcg6LKwBrjgha5aM87A
	UkvI6HKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcRp-000000084S0-1rmE;
	Fri, 02 Jan 2026 10:31:57 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcRm-000000084RR-3X5O;
	Fri, 02 Jan 2026 10:31:56 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id DDCD9EC009B;
	Fri,  2 Jan 2026 05:31:52 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 02 Jan 2026 05:31:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767349912;
	 x=1767436312; bh=cUMtD88AdGpX8s4OOc8iMm1yt6OaFYCq7BaaMzDEg90=; b=
	jGFXaUJbwqcPteJhWuVBhXcv8RAwsMWr32964lXm1uY1QLhYOA8cWftHHKf43yhj
	yXc+vaWfGTVRNpqbQpdBle65CXYc+Rtt6sJG5rYKxulQ82gWDsMPHwquMWO7my5h
	uC7IL9D/BCilZov4t+klsW8WXI+rZbyhQVrvWiYStw7Tgdl2mOfl/ajmCe50kPxm
	msChMrujypgo4hkHo1hkK4dvNVp0miW+2hJH4PKPGgvj59TiAq2Lv9hnkce9mkBh
	2RV2yPiHOMhWZgEdC/Izjz+qaZQDzfgNYCZIRekQ/q+jf6XhWqMYoOI5QYf+0+l0
	naxmV4DL9+zUlMZeBOZH+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767349912; x=
	1767436312; bh=cUMtD88AdGpX8s4OOc8iMm1yt6OaFYCq7BaaMzDEg90=; b=J
	RHc/9SWZSN5rsHd9oSi0N7Q8f981/MO8Y9eTxO552Y1Sf+svMNaqRDmAJzDYjKfE
	aiudOE4QIiCaKNzasBQ5JD+PrcdoY4m6kUuh5xAbJENz4qBtTh3zeFTU/HuGdSS/
	al7DWk101ftf5p9siYkiBBzFVP8RfKCI3oFnFn285u61gHwSGNh5pckSxFgawUVg
	blEsg5CaoVO9UMQzTDDKG0Wh/WizA3lpCw0ulPjM4yyZmR7oYcNJRnqc7oyxq1ll
	JNlo+X/zujYfhm5V/ZYd0cJNOpiVi0UzxL5FPf24a/TEGySsizfIZkawQlMWbV8J
	WRSMp/a2PoB2rv9mR2BXg==
X-ME-Sender: <xms:mJ5XafaL0-7xllO4Nl9Oa7lV-NdvZHadLwpMg8cZm1EuY48JA4oCuQ>
    <xme:mJ5XaZNvKPZYVXFhOhErKhPVUzsP4ccEUkMMjp9xuVbbLxEaga7JqRRAqtqdMCPHE
    KxIqPUiuF1zcdB48hZKT1uDhCRF-MKCc-yYjXEQ4OTfr7SEdewAWgFM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekkeegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtoheplhhinhhugiesrg
    hrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopeguihhnghhuhigvnheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepvhhguhhpthgrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehthhhomhgrshdrfigvihhsshhstghhuhhhse
    hlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhi
    nhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnh
    gvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:mJ5XaRxLBnij4XmWE4Jry3SpX43BpY9ulvxMtOAzbaIYjrfDNs2jOw>
    <xmx:mJ5XaQ1iF-ZxJXtDqyE_siS19FPwJqTe54EZcJUDqVjSw7hFHXxAEQ>
    <xmx:mJ5XafoAhIYqiN8YjcrQLwwJ2-JRi6ywCpN-E-vQ0F7SevBEavykJQ>
    <xmx:mJ5XaWCGbdLwfRZN9hCFfTxoJ2vlSj4fenrudfav8i27qGkn5mgEpg>
    <xmx:mJ5XaUfE3WiNbOhqCTf2y1uUzGKe1M0j8S9tOfoAI6ho15TaPhVFp7BW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0607E700065; Fri,  2 Jan 2026 05:31:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AbWOAV9uh8L3
Date: Fri, 02 Jan 2026 11:31:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>, "Dinh Nguyen" <dinguyen@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-Id: <0ae2688a-5a22-405b-adaf-9b5ad712b245@app.fastmail.com>
In-Reply-To: <20260102103913-0420048c-d2f3-431b-8bbb-5962a1553aab@linutronix.de>
References: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
 <20251230-headers_install-config-leak-v1-1-efba5c58073d@linutronix.de>
 <9ecebf46-c230-4074-9001-7ba9d65634f1@app.fastmail.com>
 <20260102085226-c6463fff-042d-4654-8721-27e995f06c7c@linutronix.de>
 <20260102103913-0420048c-d2f3-431b-8bbb-5962a1553aab@linutronix.de>
Subject: Re: [PATCH 1/5] ARC: uapi: Stop leaking CONFIG_ARC_HAS_SWAPE reference to
 userspace
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_023155_444017_B9317FBE 
X-CRM114-Status: GOOD (  21.53  )
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

On Fri, Jan 2, 2026, at 10:40, Thomas Wei=C3=9Fschuh wrote:
> On Fri, Jan 02, 2026 at 08:55:10AM +0100, Thomas Wei=C3=9Fschuh wrote:
>> On Tue, Dec 30, 2025 at 10:23:08PM +0100, Arnd Bergmann wrote:
>> > On Tue, Dec 30, 2025, at 08:10, Thomas Wei=C3=9Fschuh wrote:
>> > > UAPI headers are not supposed to leak references to kconfig symbo=
ls.
>> > > These won't be set when building userspace. Hide the kconfig refe=
rence
>> > > behind 'if defined(__KERNEL__)', so it will be stripped by
>> > > headers_install.sh. The result for userspace will be the same, bu=
t the
>> > > exception in headers_install.sh can also be removed.
>> > >
>> > > Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutroni=
x.de>
>> >=20
>> > Acked-by: Arnd Bergmann <arnd@arndb.de>
>> >=20
>> > Same as for the nios2 version, I think the nicer solution would
>> > be to use the asm-generic header for uapi and move this one
>> > to arch/arc/include/asm/swab.h for kernel-internal use.
>>=20
>> Ack. (...)
>
> This doesn't seem to be true. ARC does have a custom C implementation =
which
> according to its comment is supposed to be more efficient than the gen=
eric one.
> So I'd like to keep this as-is.

Right, though I see that since 767a697e7576 ("ARC: retire ARC750
support"), all supported CPUs do have the 'swape' instruction,
so I suppose we could just as well remove the CONFIG_ARC_HAS_SWAPE
symbol and just keep the inline asm version.

I also checked that for -mcpu=3Darchs, the compiler uses swape
in __builtin_bswap32(), but it seems that there is no mcpu=3Darc770
option, and building for arc700 instead gets us the external
library call, which is likely worse than swape.

    Arnd

