Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC008C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 03:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLPjFZyeixXWhuHf9F/Xdw05dLLXUk59vTcZGoKAz1s=; b=aQJPSP3MappIpsxk624qLehGAU
	pAW3Hzf4eq4EVYQ1r1e3sRN+BXsQ/kRkneB8UGu6iv5sNwTdr15YfhD+bco8ec7x1QsR3JWbR2qYl
	nh9XLq/7IRVL70yb3XvIEdsj6YFPjrxxIE+NcqtTwiD9xOiFYLavTu0ArgEmj8l53NPuz+/AEHA/A
	q1v/4+EOUa0EvzSHc7TEwr4nGDjmcN0HQ4ptfo9xcwcDqH3LdPhpUhE2xxFOcrH2+nSlTWnW2vqOe
	TYLy9iSY8yqKx2139mK8Z4oICXoo6/MK0KWC7dm5ITdgW0tQQeQAYURg9eC/ZJvIs/Lxoy8cGUTTX
	cgpXI7XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wleh9-00000005lYl-1VoA;
	Mon, 20 Jul 2026 03:29:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wleh9-00000005lYa-0CjZ;
	Mon, 20 Jul 2026 03:29:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 16B1A601D9;
	Mon, 20 Jul 2026 03:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D199A1F000E9;
	Mon, 20 Jul 2026 03:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784518169;
	bh=JLPjFZyeixXWhuHf9F/Xdw05dLLXUk59vTcZGoKAz1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TEbgZVZWTLIKqARTj/Jpj0t8zss5wiSS5rKMieHWR/wmmKzmCxQ9ZDwQyT/+OQ09p
	 jlUnePSUL8j3htF6r3fgbxSQTn9/+ELBQTf/VRn+fvfpb9DR0GlkwZafoq+4a80B6b
	 Ft0cShKW7eyb+v7hDOKkz4O5JpSWYsyS33VWqLBl9wGz0fT8Tx6h1VHl1wz5BvgMeA
	 bEKs31ruPBY4mr8fYPuP41WPud6VsNx6WP7kOqer96bwkxduYY8SedrWSP008n7Awh
	 Q1LNIoObCEUrohEv8wyEOB+9uZSaHqUoaUSBQbkRcTWGxx32C1e3GAollD1ags/6gX
	 pEfdD0RmiwBNQ==
Date: Mon, 20 Jul 2026 03:29:22 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Pan Chuang <panchuang@vivo.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Zha Qipeng <qipeng.zha@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Kees Cook <kees@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"open list:ARM64 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: (subset) [PATCH 0/7] platform: Remove redundant error messages
 on IRQ request failure
Message-ID: <al2WEhARVz5mpNGw@google.com>
References: <20260717112103.213017-1-panchuang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717112103.213017-1-panchuang@vivo.com>
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

On Fri, Jul 17, 2026 at 07:20:38PM +0800, Pan Chuang wrote:
> devm_request_threaded_irq() and devm_request_any_context_irq()
> automatically log detailed error messages on failure via
> the devm_request_result() helper, which prints device
> name, IRQ number, handler functions, and error code.
> 
> Since devm_request_irq() is a static inline wrapper around
> devm_request_threaded_irq(), it also benefits from this
> automatic logging.
>
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[2/7] platform/chrome: Remove redundant dev_err()
      commit: 17376e7311cdec252b61cb1ecec43be61907781b

Thanks!

