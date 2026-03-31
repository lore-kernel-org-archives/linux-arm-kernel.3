Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5B4FF60D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 06:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GbP8tAe8emnfrefImNYaY1sC/mYPUiQj77TYwG/NXDY=; b=Elug0j5jiSSA0yf6HJeufydsGz
	yybI+/r9dcbKAwRAT6SEDht9R2mhd7YrfdO+NK/1vPQSFVAY+oX3xsuZgyyeyto1s/5CDYKkjFBmQ
	pLPSRHrbYDoKUqKjA/W7A76USWIFTNzT9cnp9BVn5SiddTsSgPeu5/A4yJ6ZCkDx+s2b417mkJct8
	Difax3K9jNGmZrImihNZXad8UogelLwbGrmWGetWyjlfIREk7Jfni89cFbliSOTsV8SNgmbMIArl6
	RuAWX8PkK733u6AqVG7xklk3pXxcF2aBEEX2O7M1HYLuoi/Wl74aaI342nC1xFEmR73Mw5zJ7ul5R
	F7VtCPlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7SyA-0000000CPdm-3jOx;
	Tue, 31 Mar 2026 06:52:58 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Sxr-0000000CPaR-1ixW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 06:52:40 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-12776bebe9fso114526c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 23:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774939958; x=1775544758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GbP8tAe8emnfrefImNYaY1sC/mYPUiQj77TYwG/NXDY=;
        b=gKZFzxQj9/o6Q2rmMw7KS7nBS5JfU4WEtU2HUbPKvsIZGE9T8VGwuc11gAA4Y9e0Cz
         izsrm+HfBF5KnH7pjjGzu/RosHnBIwCQ7HqVfBp57eL4Cd+lIZvgFL9ew/r7LRBIdHik
         bsbM7JA9oouUPZx7cambtwE6EhjZogiXrNMUp2SFykX/95pA9ex0qmZRlDBRubSUAjhV
         GwRe4vZsK5EqCW2hDsjaYfBGHaFFrl4Cxi1pTNOpkjNzU9pCr2vcDTj0EW9O37Hbe7et
         SPFJFf0rA+TSasB5EuM4ZzV8+uUbyFz9a8sluvAQ3eJi3t8hBqrOyVn3P+RLu3d7PZOE
         s7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774939958; x=1775544758;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GbP8tAe8emnfrefImNYaY1sC/mYPUiQj77TYwG/NXDY=;
        b=AgsmXb4fvhurBBPWEVQAqwGSthjHlFLSyeEFL1ZHkyqqjEiRhGobdLD6l7JhqtKnJP
         HcScHaZ4ovWB0If6jUXi6ySF1SXaI60XDKx5AJw+YUMpP/Xhz04xXuxQCCOrZvef+9eu
         n++kxOnGwXzPfFrUiiBJ9Tm+6sNTxAcZ6IFLvoMGy3HKkZGKRP35qBpngTgUhxNMFkFY
         KZrfj5ProoZk0PShumbUtogdeCHsI4E8MlbOdff4KJnvvU/M3PUNx6pBxxkKXhxcM/Qq
         D5D+jkrS7FqC2tpVuhT/C0vLmktufLIVOBZp96+dCTgbuLvG3RKVXYJAQvOp7cvdoNGB
         YQ1A==
X-Forwarded-Encrypted: i=1; AJvYcCUpIGNvpyuLGXxj6KZIRyRP/rXpHl4sEVpp5BYWNbFwwvXlx2P+8T2H4x60lnt84xcohJz5+8pzd8P4vQ3irGye@lists.infradead.org
X-Gm-Message-State: AOJu0YzvJMltid9g0YFVpEOQ7S2Ydc2FoIvbcUro6e48uUXmhu+elWaq
	TQvSwaxKnVmbpFfjJXBQ233/wW/HbSV4uk+dI4kFdzlYnVsjw92In3sK
X-Gm-Gg: ATEYQzxd9IfQjEWmwnjoLrDx6SX8CjtR5gpT6RlcXFQ1CSvaVNWAKaruBXSM6vtHuGt
	s/2ax0hWFR0w4+lrpNXhEfqHnFCYm1uhljsLeG2jJ4/rrMq16UwX9ZiRiGmSJfoKH4GzYHySa9x
	YihAe61KTTWfWFWcWDEo2EZqROjOJzZ5z9kXb+PF/WjmWKv2GlZhPsswmYy1CBOQigQbbqQ2l3K
	nCfcDmeE2k29X961bdnmoqRxa6l+RzzfRDwRUvy/rEArCxQ0oz4Ks4rj1LPIUiO65nMwdAA8iV5
	Ecwl4fIHq5lnPwSfOlSU26q9rJ5kBxyF4e56nNsq5KNNOMj8/mssNJRviqogqY4NDfYCV/pQ4rP
	IWOmz59g7j5WSbj8Rrbcp8mJUJ1kNdg1p7RieiR+z2YxINe5LhOBeSMhLmmIBM6pYt1pmGBV103
	HGuGvbRU2lMyeljlS4+D2PWi6RADxq+AHum7Ms1bGqkyg=
X-Received: by 2002:a05:7022:4393:b0:12a:94ab:e20 with SMTP id a92af1059eb24-12ab28d8bb8mr9317994c88.20.1774939957860;
        Mon, 30 Mar 2026 23:52:37 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2601:647:5e00:4acd:7f58:87c9:ef3d:71ac])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f904sm13792148c88.9.2026.03.30.23.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 23:52:37 -0700 (PDT)
Date: Mon, 30 Mar 2026 23:52:34 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@armlinux.org.uk>, Kevin Hilman <khilman@baylibre.com>,
 Arnd Bergmann <arnd@arndb.de>, brgl@kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 2/3] driver core: make software nodes available earlier
User-Agent: K-9 Mail for Android
In-Reply-To: <acto3TE1AR8iTzF0@ashevche-desk.local>
References: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com> <20260330-nokia770-gpio-swnodes-v4-2-b68592e977d0@oss.qualcomm.com> <acrcDTPpXZ_5A4D8@ashevche-desk.local> <acruxMNdnUlyRHiy@google.com> <acto3TE1AR8iTzF0@ashevche-desk.local>
Message-ID: <DDF494E5-C188-4A86-AC02-265B6169B591@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_235239_449975_B709A85B 
X-CRM114-Status: GOOD (  18.23  )
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

On March 30, 2026 11:25:33 PM PDT, Andy Shevchenko <andriy=2Eshevchenko@lin=
ux=2Eintel=2Ecom> wrote:
>On Mon, Mar 30, 2026 at 02:46:45PM -0700, Dmitry Torokhov wrote:
>> On Mon, Mar 30, 2026 at 11:24:45PM +0300, Andy Shevchenko wrote:
>> > On Mon, Mar 30, 2026 at 02:40:47PM +0200, Bartosz Golaszewski wrote:
>
>=2E=2E=2E
>
>> > > -static void __exit software_node_exit(void)
>> > > -{
>> > > -	ida_destroy(&swnode_root_ids);
>> > > -	kset_unregister(swnode_kset);
>> > >  }
>> > > -__exitcall(software_node_exit);
>> >=20
>> > Why? What's wrong with the __exitcall?
>>=20
>> It's dead code=2E Always was, always will be=2E
>>=20
>> Maybe split in a separate patch, but I sometimes feel the idea of "one
>> change" is taken to extreme and adds to both developer's and maintainer=
s
>> burden by needing to keep track of extra patches=2E
>
>Why does __exitcall() exist then? It's also used in other places=2E
>I think it's generally good to have a possibility to clean up
>after run=2E
>

The code section will be discarded when the kernel finishes booting so it =
only increases image size on disk=2E=20

>A bit of archaeology:
>
>The first time it appeared was in the bcc2152647b8 ("Import 2=2E4=2E0-tes=
t3pre3")=2E
>Then somehow spread a bit (but not much)=2E
>

And it shows how useful it is=2E Maybe it had some purpose a long time ago=
, but at present time this code will never be executed since it cannot be b=
uilt as a module=2E

Thanks=2E=20

--=20
Dmitry

