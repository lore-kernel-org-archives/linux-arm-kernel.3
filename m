Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E271061B00
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rhl9jJbj83XKenC1wFQ6AJb5lTkoiegir05EBEKwX8M=; b=I5hYSKjIMnYZxYCle1UNOSc3TX
	UTJ1skBCRv2jOHo/j6avA19crpHmElErmsNemrOa/vEKiS5yEYoRBWm9lXemCtrBjvPm0XPdc9R1s
	ZbPqWK4cDNer3ELH0aK+8qzxVc5Jp/OnvwNNdBmyKt84Ecy4ARN71HE54IMrpBEFeBiKKXgP93fOe
	kHuFXGpFvuZhbTPBj6UJZuVrZ71ZhOvYIjW59UFmHkzSbbhi8kv1/11Lqzzxj7XmzUyZGIIGkalJ6
	d6IhGQyxRGt034n97xAkMUJhIy8Np+AWjdUQjXSvUgqaVG/2kbqeBDrze89oRnYdVl8P5BADQGxpE
	s+yzMbNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DhN-0000000BRAo-3SVD;
	Mon, 30 Mar 2026 14:34:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DhL-0000000BRA4-3GpE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:34:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 465E540604;
	Mon, 30 Mar 2026 14:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711C5C2BCB2;
	Mon, 30 Mar 2026 14:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774881275;
	bh=XFbW3OPLdCi1ZAlwx9FYjRr2sYDqqn6iZv2QrJ/mhJw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=vBGRGKw+SUiNNUtRjzg285uYUGcjD6TH7ycKy/0fbBkHrmLXhvi99srkkaTjbln2E
	 UI9bBZiHwqk6BUsaDrFaPobV8wSiq4vVMScPzSC8dfMKmrba6SUVlJEuRFCYEU7eKS
	 1N9u25lynesssKYTydDLvn5sRjWBNkygp18H+TeLlZpArDq/eV62Az4JCxtvR8wpzX
	 wWE+6247OIaoMa+iYaYrk1a9zZXN6QM6laQkqhmVocMKH4pQZBMU1L5ugO5XP3KMjt
	 LpwEDEDZG8lcnCEcOw9lwTpzbfcay+r/FmhN3Je7TFSqaWs6FKwOgdqnzbnN+Ba1lL
	 p02RxQqVMmUgw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 16:34:29 +0200
Message-Id: <DHG6WEZC6VWG.1B2X6VGTIZZI0@kernel.org>
Subject: Re: [PATCH v4 1/3] kernel: ksysfs: initialize kernel_kobj earlier
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Daniel Scally" <djrscally@gmail.com>, "Heikki Krogerus"
 <heikki.krogerus@linux.intel.com>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>, "Tony Lindgren"
 <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>, "Dmitry
 Torokhov" <dmitry.torokhov@gmail.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Arnd Bergmann" <arnd@arndb.de>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
To: "Bartosz Golaszewski" <brgl@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com> <20260330-nokia770-gpio-swnodes-v4-1-b68592e977d0@oss.qualcomm.com> <DHG5WQI26R5U.WTZW61VKJHF5@kernel.org> <CAMRc=Mf3oWtrcdR+g69b8y4K-gwfMe+3LNMYQ6c6M-hw3Nh+Hw@mail.gmail.com>
In-Reply-To: <CAMRc=Mf3oWtrcdR+g69b8y4K-gwfMe+3LNMYQ6c6M-hw3Nh+Hw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_073435_835263_D7968E7E 
X-CRM114-Status: GOOD (  11.92  )
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

On Mon Mar 30, 2026 at 4:19 PM CEST, Bartosz Golaszewski wrote:
> On Mon, Mar 30, 2026 at 3:47=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
>>
>> On Mon Mar 30, 2026 at 2:40 PM CEST, Bartosz Golaszewski wrote:
>> > diff --git a/include/linux/kobject.h b/include/linux/kobject.h
>> > index c8219505a79f98bc370e52997efc8af51833cfda..71b9086621c35b7e4ef99b=
9d3b6707db23faf58c 100644
>> > --- a/include/linux/kobject.h
>> > +++ b/include/linux/kobject.h
>> > @@ -219,4 +219,6 @@ int kobject_synth_uevent(struct kobject *kobj, con=
st char *buf, size_t count);
>> >  __printf(2, 3)
>> >  int add_uevent_var(struct kobj_uevent_env *env, const char *format, .=
..);
>> >
>> > +void ksysfs_init(void);
>>
>> NIT: I'm aware there's also all the core kobjects in include/linux/kobje=
ct.h,
>> but maybe a separate header would be a better fit.
>
> Do you mean moving all the top-level kobject declarations
> (kernel_kobj, firmware_kobj, etc.) out of kobject.h into this new
> header (ksysfs.h?) along with their init functions?

I think the top-level kobjects are fine; it's just ksysfs_init() that someh=
ow
feels odd to me being placed in kobject.h.

The top-level kobject do make sense as they are the base for a lot of other
kobjects being created by other core code.

Whereas ksysfs_init() is a ksysfs specific thing that is only ever used by
init/main.c, i.e. other than the top-level kobjects, it has nothing to do w=
ith
the kobject API itself.

