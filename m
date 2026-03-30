Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B19FF495E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 13:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSH3hXtHsGUYlCkaSys0ciQ3WbdJqi9aboQQShwo2vw=; b=02oyqStt/VIFvenGzWrIDsXw4Z
	sdtuD+tCXQeIJuI+mQtKcUzU6/1HpwohMuNRPTN8lKH2dXwv/1nPsGGok4HWpLwOzhcZspeahoebi
	QlFZesA+oifM+1MH5atEMooARZu74cvqO10w2jKYzrRmhBQtjKNNOgf/1CQH2xwB/+XpKknnD0bXU
	cpb+VcpKNAv/h017TqdneKOACRqga7YBB1XRtR2GJ8Pu02b4xj9tsYzydv+d6dxdPC1VXO8XpyaO9
	UmCX+NSkY08ZtGZmlTyJJzI8xzeYIZaVl7hbx4k6hfPoTeueS250NPdW25xXuAlnprrQNoBN1Htgk
	LGUMR7qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CoQ-0000000BMZF-0yUQ;
	Mon, 30 Mar 2026 13:37:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CoN-0000000BMYv-1yl4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 13:37:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A1CB1443A9;
	Mon, 30 Mar 2026 13:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E17C4CEF7;
	Mon, 30 Mar 2026 13:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774877866;
	bh=d49rzc7VgXP+qBIv+G+I+R2A+YQZkwu+LgZRxaLstvo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Jl8hWv+uJLAQPEKSKGdE36Wo97h3x2+83eL7VvA30dPSlAGNq20iJlr+RrB0l/qTB
	 ls/X6vlrnayAkWbLGo3aTXCmKM1Hc38gIVCuDo751r6yCFETwEyUxUhqVuzm2Q7CPf
	 QNNFMh+B1VQgOfWxTp/t0lan3Jg6GqfmcBB93S5FvdgyITm+lP1TOFxOvjGOYtj4sg
	 0zxKew3Il0nIua8n6fqyzRXYLwwhm3C2PexPHfFLzXAn46rqWd3KlckUDVlhc4gICb
	 /8wPvlfxqvBeu4mC48PTYWwBgbqs50wm62Vlu2LQq4T341SB29J8ikM3R7KY3oTVqw
	 RRViDgBf0tbHg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 15:37:41 +0200
Message-Id: <DHG5OX85I4LL.39U0RRBS0JXFP@kernel.org>
Subject: Re: [PATCH v4 0/3] ARM: omap1: use real firmware node lookup for
 GPIOs on Nokia 770
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
References: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com>
In-Reply-To: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_063747_605909_8E26C9C8 
X-CRM114-Status: UNSURE (   5.89  )
X-CRM114-Notice: Please train this message.
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
> Bartosz Golaszewski (3):
>       kernel: ksysfs: initialize kernel_kobj earlier
>       driver core: make software nodes available earlier
>       ARM: omap1: enable real software node lookup of GPIOs on Nokia 770

Looks good to me overall (one minor nit in the first patch); which tree sho=
uld
this go through?

