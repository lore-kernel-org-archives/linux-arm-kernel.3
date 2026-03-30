Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08DA10D14B7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 13:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7i8kR1cR3tJ+byEZdYM9iODWSglU2PTUOnkhuaFHhY=; b=2aNjGhrhLjBAgAoJtErmVkxXwQ
	ZNBqRc4rWTUj2vFwx1zrK3MMe7J38GnJDTK+HTcci4pnrEuPD7urmjf0ORI33hjl18qGwgAfQEUea
	XDhWHnpglXvcUUjPxKO/KjQKBGMZeB16rjWsIOd5FKkPLNQ8HAIW+okh2gb1w/xCGwU3etn3bJOoq
	k86zzm5vW8osd6CxH8ChzrXXQ95gFuTO4S1YVXN8Txx540BMqz/EXL98Y7fMO0ORzNQeS8GBUeznu
	hjvJbi2B0TfY5mbLFTbwTcX4goEsjD7xnfAa4aqddqYuvk5wmjAAD1J4RKbAbAIu3VH5uRFVLipwI
	7B5gRcVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CyI-0000000BNA4-1lzZ;
	Mon, 30 Mar 2026 13:48:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CyG-0000000BN9y-1sZc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 13:48:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 62FE7600AE;
	Mon, 30 Mar 2026 13:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1F2C4CEF7;
	Mon, 30 Mar 2026 13:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774878479;
	bh=4HWngODzhwNimgKwWfcRLqmqV+gsxSnsNR2bNYJtCnY=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=E1/zwihM+sttFZGmZX09B5wZ3pRgOhu57TF/VAcFy/o8XuVyMibyvYFbqUI5tnrt9
	 Up6mCERLdsi7+g7yAgd2X+OgkGkVXxPxlqAv3RkQkUSuToIOAN6pWAu5Uo9AtzVZWb
	 2qMyjNq/wBE9CgHU5jdLQOTxiXGiE1UVfOgxHEgrIzdEluVabyLwJd8hffpplTn0MN
	 HZaTDH9kwcN06nHoqVx+Rvj1atZPk/w3VhFX3YBXfdlEE87ev8sJGrZ5dDWQRL1tSh
	 1bl9kTCAOJtIloVrxMzWLUxn8cUTNYSNaBgpWr8fFUlFdiy+vryDSxaythfTOX1lt4
	 1m+BJpItHjojQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 15:47:53 +0200
Message-Id: <DHG5WQI26R5U.WTZW61VKJHF5@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 1/3] kernel: ksysfs: initialize kernel_kobj earlier
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Daniel Scally" <djrscally@gmail.com>, "Heikki Krogerus"
 <heikki.krogerus@linux.intel.com>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>, "Tony Lindgren"
 <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>, "Dmitry
 Torokhov" <dmitry.torokhov@gmail.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Arnd Bergmann" <arnd@arndb.de>, <brgl@kernel.org>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
References: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com> <20260330-nokia770-gpio-swnodes-v4-1-b68592e977d0@oss.qualcomm.com>
In-Reply-To: <20260330-nokia770-gpio-swnodes-v4-1-b68592e977d0@oss.qualcomm.com>
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

On Mon Mar 30, 2026 at 2:40 PM CEST, Bartosz Golaszewski wrote:
> diff --git a/include/linux/kobject.h b/include/linux/kobject.h
> index c8219505a79f98bc370e52997efc8af51833cfda..71b9086621c35b7e4ef99b9d3=
b6707db23faf58c 100644
> --- a/include/linux/kobject.h
> +++ b/include/linux/kobject.h
> @@ -219,4 +219,6 @@ int kobject_synth_uevent(struct kobject *kobj, const =
char *buf, size_t count);
>  __printf(2, 3)
>  int add_uevent_var(struct kobj_uevent_env *env, const char *format, ...)=
;
> =20
> +void ksysfs_init(void);

NIT: I'm aware there's also all the core kobjects in include/linux/kobject.=
h,
but maybe a separate header would be a better fit.

