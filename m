Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4311D6AAF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 16:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzW5ME07N7uB5Pe56PeAi3P41+VXC9TAF9pgmKaUxvM=; b=C2CNbwPdA02xx+ICL7UK61uaTu
	sb+onwBfyZmrqxN6wBg82PSINCTP9SsfUHql29ErjWjIUhF4vbXE83dMpiS8N0QC8OQvx4MNmPGu6
	qKnee2d5Zulzd4cWcQvQnHx3RyLROU4aa/Gcqpq/WpaJkfHDhghiWpgaOtr9KdFi0xTkXcJFHjuF5
	kcWHHjkmN/zrVK1Dg56dkOb8b6ezAqfyEswBtaBDWitAphgtDW3q165BIVuE9HrGTBfKJPcFvyNZ2
	XTXWz7JT026nZhKRSwaqefFbs1zK1Uq+K17y2rh3AJkqiuetg+O82o0ghnRX1FJmpMdpM6KuNK/84
	381vwHkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8L4b-00000000Whz-1t76;
	Thu, 02 Apr 2026 16:39:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8L4a-00000000WhL-32B4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 16:39:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E7F9A60126;
	Thu,  2 Apr 2026 16:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0489C2BCB0;
	Thu,  2 Apr 2026 16:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775147951;
	bh=/9sVJqbqd5N55bgK+hKxVPxccAtMDky0mqOzEJC8sog=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=uy1jCrCUIxHvmyUZs169uxUYSq14obZ67K0G2WOxvXw6Gz7QyijB80FM7Bd8f2gJD
	 zePwAEFKrTHcYOaw5pntNHglRgq0JDYaHZy3u63cTcc0nuc8leJMYsXBlOS7s7ncOA
	 +jyfkVfEO2hWjhrW/C2yRotvHvngghtEEI4GDkrOkiFFkka9eXiR1AX2sm/vv29CWH
	 AUhmmsGrTjj7PEa3WSL5LmuJNsWvUyog7NrU5tJYcdSdCCtGLi7XpjQzwaTqFZAr1g
	 mL8vgdNtb35jk98a87dYW96BHXuvOgKmBJy+sXjU4ZiwbjQyEJLYDA2WSID+qm56Nt
	 b1jZ/1rv++4fQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 18:39:06 +0200
Message-Id: <DHITFGL3J4IE.2WZU3K2CSYL7I@kernel.org>
Subject: Re: [PATCH v5 1/4] kernel: ksysfs: initialize kernel_kobj earlier
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
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com> <20260402-nokia770-gpio-swnodes-v5-1-d730db3dd299@oss.qualcomm.com>
In-Reply-To: <20260402-nokia770-gpio-swnodes-v5-1-d730db3dd299@oss.qualcomm.com>
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

On Thu Apr 2, 2026 at 4:15 PM CEST, Bartosz Golaszewski wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0f258aeeacba184d2025b932d90280cf2aabf4b0..8bc934162e712cf8ddf033e53=
bf3481054cfb7fe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7843,6 +7843,7 @@ F:	include/linux/debugfs.h
>  F:	include/linux/device.h
>  F:	include/linux/fwnode.h
>  F:	include/linux/kobj*
> +F:	include/linux/ksysfs.h

Currently, kernel/ksysfs.c is not listed in the driver core entry (it is no=
t in
any entry), but I guess that would make sense.

So, we should probably also add kernel/ksysfs.c. :) But this can be a separ=
ate
patch independent of this series.

