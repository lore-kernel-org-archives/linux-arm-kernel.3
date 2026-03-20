Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA071109316E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 03:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pds+iuWnyMesl9/2v3zwqY8Q6ejbsSoDWMbtehHzJNw=; b=ztv5oERdTs742jjj0cb9aikjQi
	MzG0WSzUCaS209KJg+m4n6WJ7hhYLqNI+zgp3x3Z1LHCDvk1w8/6ZZPVra2NFUPQqpHe+tIQcJi0u
	ITNpWStBI3gPOcZKjC9DqZeqlHTFsyOyAbjpxuskv4/uowEBSpofuPstomgof/O98zn7L5nChy3jX
	5H/yCGveEuIwu4exzguXveXz53KVnHm4Osw3J9mhtFtj7vNfYJpxbYxG/j64mbPPo3IjqlFEZ2JQ7
	z3Cp7faUp2u/hnwGoi/pJiRxJ+qIPKduoMo00b2d0COMKoQRpIiyPDX6kpqXpJs6aNb5YD5rHBoF4
	j2C+zBgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QCB-0000000BxZY-2Wo0;
	Fri, 20 Mar 2026 03:06:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QCA-0000000BxZJ-35la;
	Fri, 20 Mar 2026 03:06:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B3D0160097;
	Fri, 20 Mar 2026 03:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A240C19424;
	Fri, 20 Mar 2026 03:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773976001;
	bh=Qa2kKiW2K4o32w52YsMZm0rMqJtB23Cf1BU+wGQGI/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VSuW0pWLO3r7l7Zja6MMNkzFI+8A1EBOKMEvtmHHOGIKOoyLKRqdZ/jQukHTWJu9b
	 Fgx/wyx68udFKnMkZVza6jDMWbJm5ftMtTdj9V9GkEpG0MglFWioFcESAS/DI6X9GM
	 mGCf2nu+ksWrxIpmWQQewDgsWAoSl6KLfWBW7fiIh0AE+ayV3Iyu7LvHIMZt981W/C
	 gtTCVNs9ZuvSPL0GldB3BIkKZDrrDyTkHZALx8IPVz8CvH8OPb8mT14PCaZMeWkQSO
	 eZMs6n6Kmb37cAfq9gU42TqtGO+315YwmgBUo/BkwwQ7KBvJySucgbldHrjtmzEWHv
	 y1hEKlj1DR/mg==
Date: Fri, 20 Mar 2026 03:06:35 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Tobias Schrammm <t.schramm@manjaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: (subset) [PATCH v2 00/10] workqueue / drivers: Add
 device-managed allocate workqueue
Message-ID: <aby5u_ToXifVwf6B@google.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
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

On Thu, Mar 05, 2026 at 10:45:39PM +0100, Krzysztof Kozlowski wrote:
> Merging / Dependency
> ====================
> All further patches depend on the first one, thus this probably should
> go via one tree, e.g. power supply.  The first patch might be needed for
> other trees as well, e.g. if more drivers are discovered, so the best if
> it is on dedicated branch in case it has to be shared.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[10/10] platform/chrome: cros_usbpd_logger: Simplify with devm
        commit: 168e4b208ca8c2e04de20cc6cb7e2fb035dc1ec8

Thanks!

