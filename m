Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77106E88D9B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 13:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8szhdJlVcqq9uzTGXqUSkZ2NthUpp/KZzE8t5qDJiM=; b=DRZvUYrbTiBZZaPI0viOq6wF9p
	pmShTjWfM8pbPiXiA+BDQeNweNUgBEqYiOTvyJwp+bbY6SJFHiXpSwv003Fy8moodgpbFEsVhXXma
	B2FHlsYMlQJdVMgHaqKtUAbvzBsbruQ0WFbQYfSfVjZKzymSh1PxbtplNMKLAavZsLOCRTNhEJEeF
	9EkOYGVe6e5EuKiW9svcH7Qrpup6JiBlwziO7gz7KGls8Y0oFD8eZaucJ419zvST8XrHfOV0aCJp+
	UX04srNqh+rPLtxGj5i1VTOZO12sm0s7Vr7Nv/RgSfIwDkmsaEMW2ToLHeKQTcjoPgkYGL3kMc4Bu
	yDcXtqow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w91LY-00000003V5z-2lVk;
	Sat, 04 Apr 2026 13:47:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w91LX-00000003V5s-1JUl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 13:47:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A70160008;
	Sat,  4 Apr 2026 13:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC5EC19421;
	Sat,  4 Apr 2026 13:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775310449;
	bh=ZLP7WHBUvGDqXuBLL29WpNLjtnUknY8jBSPfm/qjtPI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=uhCjIRFhL/aeqFHYthiYzndfhCzh2nfXYQlYiE/WxBoVAQnyrpal3qbB3Z3I0CJkh
	 H7PfONT5MECquktG45xjU1wvr/3DUQIPlV3ZSGEc1Ao5oCsufqv428yCTRwtcLqDjH
	 nOj7thtebyEcO03JhqdpJJFTT5RdLzLCwkTEXQ0SFrp8SAN3tSHI7hYOUQrz6hQJxc
	 UAZlS6dJ8kOzEqZousN+gvqzxXONWyaEraHkEf+D6+9ejjV2s11GWTuvopR7q2dbxN
	 eVup9aQgNCCJAcyjipbGZIl28Y1z8QCGNuQZz2vbUcyRlz7NnuKcKD2rtY0149P/SQ
	 ttMm6rCmBGCSQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 15:47:24 +0200
Message-Id: <DHKF135KLNW5.3LT0J6T5TE3JD@kernel.org>
Subject: Re: (subset) [PATCH v5 0/4] ARM: omap1: use real firmware node
 lookup for GPIOs on Nokia 770
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
References: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
In-Reply-To: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
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

Applied to driver-core-testing, thanks!

> Bartosz Golaszewski (4):
>       kernel: ksysfs: initialize kernel_kobj earlier
>       software node: remove software_node_exit()
>       driver core: make software nodes available earlier

    [ Fix typo in the commit message: "s/merci/mercy/". - Danilo ]

