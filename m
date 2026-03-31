Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E71AFF60FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrlo1/06i5C9ew3nub10jpTmO/v04D4LwKJlpGHKq2k=; b=NnlXRnIJa7RtWIXzuopEf6GLH5
	eY36sI/X4c88KrQ/MlaIo3lDLgjpqKZBUjdVhTMrPIkDpfJD4B+fvbWl2dSkAJvcP/mq++AW5D9JX
	FpUJK+UxZ+vsXVxWgfHtaXrlQFAlOVvdUA++zt+ziiMfqyLaUdf66k8KIgB865U6tQwF1P6iSgD0a
	q8jTY2k0VsKJBLO+MqeLQKflVvQE2y8/4/gzGnOUMZvCIKmfTQSVTuWvNZ9KdMUEC7feTuBVI9eQw
	JFXVbEhKMCawqkrFYhZDq9gJ95gZWSu9X6A3wkUdk/hUHKxwc0uySt2ttgrP3yz1cLTxVlGv/AilN
	fpW5I3EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Wc6-0000000Co8j-3xKt;
	Tue, 31 Mar 2026 10:46:26 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Wc3-0000000Co8K-0H3K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:46:24 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 25ADA140021A;
	Tue, 31 Mar 2026 06:46:21 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 31 Mar 2026 06:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774953981;
	 x=1775040381; bh=vrlo1/06i5C9ew3nub10jpTmO/v04D4LwKJlpGHKq2k=; b=
	mRrnY8osI6EPQePOnpxn6Q6oGtFatl/omdzpYt+iORQe47DMY6r/uV7XXGsD+o+p
	RfL8clJ0onOJvVheqDkPhZLATaUEYzXgxH2hBBySwqH/PPGwn6TjPcadRQPtQzeh
	Hl5LoTkJ0yobMEgl53ep9mZ95dnjxYE8BZ9YhL4IuTrGTOpoUCubH15Tw94yyx1J
	uinJngequ8qwtfr9cvpLd1UPCvbA2EDSl4xutwzwr8L0QkLUZHw7dogeQHSyOw3R
	E1T7lYlKWaHQpDbcs/JNj74UaqKHPuIb1hxblC9L1a4dh16EmzBME8quvWg/AjSW
	OLJD/y5DubNV22R1+MLrBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774953981; x=
	1775040381; bh=vrlo1/06i5C9ew3nub10jpTmO/v04D4LwKJlpGHKq2k=; b=W
	rIebXdVCdqVTbsfnguGJHZzTdHPXOoobRVg3n7pRg46WJgDT0BcpSQEciP/8q8I+
	+sTHJ/WULgxZr9O7BiUytBX5IHoQRstwVbeqCX739+yMFKPduR+Ov76KAEdUsbC4
	sNkyIbdkqu1eazD/tMbJaZiuKmaaL9ymMWPMy7Fs2XXVcxHvrLKgKJDibIydafMg
	5AEZsB6m/trpvq+E/T0/mj9en2mnU3uX8Xx1VeGLnPn7OEKe0AfWwY6++eE6WvzR
	1bRH0YMv5kOd0MfhZWGDGSU72cTVlDifyOHd/8YUnkbZxUReMXr3Qw2IOnaI+ame
	HNRVVDzr2/6VXVxNOoEew==
X-ME-Sender: <xms:_KXLaUOzOl41gXrppOGzdJEakVPF0nVaHMpDjoH34Q8E2xGVJ_5w8w>
    <xme:_KXLaVxZXxPOprNj-UKSrKR2Bxvb8lw9K0uzr_m72qdmKy5aPGjcEh7gjBP-fjDUQ
    OIaBbV_4i6-bXmSXn0w2AFp08-67D9EyAsq3x4NOXt2gIkm8ZdMx3mL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghilhhouhht
    mecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepofggff
    fhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceuvghrghhm
    rghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnhephfdthf
    dvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnug
    gsrdguvgdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepthhonh
    ihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgs
    rhgvrdgtohhmpdhrtghpthhtohepughjrhhstggrlhhlhiesghhmrghilhdrtghomhdprh
    gtphhtthhopegumhhithhrhidrthhorhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepjhhmkhhriiihshiithesghhmrghilhdrtghomhdprhgtphhtthhopegrrghroh
    drkhhoshhkihhnvghnsehikhhirdhfihdprhgtphhtthhopegsrhhglheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:_KXLafdtk9RfqHL6pop32XWDblppKH5t9b8sVkhS-0adMXbJtrfxbA>
    <xmx:_KXLaSYTfp-xTxcmQvM5MEm5VeA4i29IKqofuJIqWNUGSduqbmZXMQ>
    <xmx:_KXLadDDocDVPYgh9-sD6ecvzE-WSBmDEviWKGVx2N4mBNyXK9cfBQ>
    <xmx:_KXLadJGVlQmKuooOLdsWRO44dZd-0lNmCDO-DtFtzCbyk-S2B0Jjw>
    <xmx:_aXLaejtodMhGwAk2rti_uyVWD2Mae0pDssGf1wdxsh6jX9EZiGmzKX7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1E787700065; Tue, 31 Mar 2026 06:46:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AFr_uRj1O5Ps
Date: Tue, 31 Mar 2026 12:45:59 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Daniel Scally" <djrscally@gmail.com>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
 "Tony Lindgren" <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Bartosz Golaszewski" <brgl@kernel.org>, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>
Message-Id: <9359e475-fc8e-4d32-9ab4-383710170553@app.fastmail.com>
In-Reply-To: <acuMD7Oly4XWW4n8@ashevche-desk.local>
References: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com>
 <20260330-nokia770-gpio-swnodes-v4-2-b68592e977d0@oss.qualcomm.com>
 <acrcDTPpXZ_5A4D8@ashevche-desk.local> <acruxMNdnUlyRHiy@google.com>
 <acto3TE1AR8iTzF0@ashevche-desk.local>
 <DDF494E5-C188-4A86-AC02-265B6169B591@gmail.com>
 <acuMD7Oly4XWW4n8@ashevche-desk.local>
Subject: Re: [PATCH v4 2/3] driver core: make software nodes available earlier
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_034623_174033_800157FA 
X-CRM114-Status: GOOD (  19.57  )
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

On Tue, Mar 31, 2026, at 10:55, Andy Shevchenko wrote:
> On Mon, Mar 30, 2026 at 11:52:34PM -0700, Dmitry Torokhov wrote:
>> On March 30, 2026 11:25:33 PM PDT, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>> >On Mon, Mar 30, 2026 at 02:46:45PM -0700, Dmitry Torokhov wrote:
>> 
>> The code section will be discarded when the kernel finishes booting so it
>> only increases image size on disk. 
>
> Almost true. Interesting microblaze case, where it's not discarded.
> But I can't find where it's actually used on any architecture.

I'm pretty sure that is just mistake

>> >A bit of archaeology:
>> >
>> >The first time it appeared was in the bcc2152647b8 ("Import 2.4.0-test3pre3").
>> >Then somehow spread a bit (but not much).
>> 
>> And it shows how useful it is. Maybe it had some purpose a long time ago, but
>> at present time this code will never be executed since it cannot be built as
>> a module.
>
> Are you sure about definition of __exitcall? As I read init.h the macro
> is defined when it's not a MODULE.

I also tried to trace this back now, and from what I found, both
the __init_call and __exit_call annotations gained __attribute_used__
back in lniux-2.6.0 as a way to prevent both gcc-3.3 and gcc-3.4
from warning about unused functions or discarding initcalls that
are actually required.

My best guess is that __exit_call should just use
__attribute__((unused)) instead of __attribute__((used)) and
have the compiler drop it from built-in code instead of the linker:

diff --git a/include/linux/init.h b/include/linux/init.h
index 5db55c660124..ad5c19763034 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -47,7 +47,7 @@
 #define __initdata     __section(".init.data")
 #define __initconst    __section(".init.rodata")
 #define __exitdata     __section(".exit.data")
-#define __exit_call    __used __section(".exitcall.exit")
+#define __exit_call    __maybe_unused __section(".exitcall.exit")
 
 /*
  * modpost check for section mismatches during the kernel build.

     Arnd

