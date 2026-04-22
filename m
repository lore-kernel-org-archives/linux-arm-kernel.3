Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188D2F9B61D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 11:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNP7/Ly2fmpYkbHHqHZ+20Ii3h9E4ykECwdUZjI26UQ=; b=TSCE9dHtrYOng8rwFSI94KKxjg
	OMRATO30aoZmFNBKL2WTPcrOpiayFvH3AxphNGX47kxRm9KcNKaMRXNwLCH/oOH1Z/pohuQPcP9e/
	f6OKeCMMA3Xzzd5lvAecI3JltH6PzCjoxhNtTgQ2KHNUcFowBYzvJHVOPyNfzXOIuhkbTyvG2Eicr
	HfWkt1UPrSt0qpC8FWAdUuBgdf5XJa0yGsi28WtR+dH2X0URcXOs/tBfb43EX+xe26guVcX/HfkH1
	EUHZElxFDDFMXkA1s4E1tK2qHu29fYDODJlCJyckM3FMvxWlhrzpKZRzxMwvFojG20uykr1kb7Cpi
	4b+7Uq8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFVnD-00000009zvs-3Q9x;
	Wed, 22 Apr 2026 11:30:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFVnC-00000009zvm-1Sg9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 11:30:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 80FBA6001A;
	Wed, 22 Apr 2026 11:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B173BC19425;
	Wed, 22 Apr 2026 11:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776857453;
	bh=HNP7/Ly2fmpYkbHHqHZ+20Ii3h9E4ykECwdUZjI26UQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=FaYqL1YlDhE1HYa/LcbcDJ8V7tVVrSHb7V1o4IoHNll4KRUQ8H+M25mss1toKLIdW
	 OR3y0d9Qf8lk2QMWsX++1jl3Sxa5mfL82rHLfpC5eanFr9xHTgy7WwSgOLyGt2Nhp2
	 1EGpDUazMCn7F/u9n+FvUerpJJGa7LP1/HjgnMGX83syMgqD9D24gOyvQRe/Vfm7uK
	 H4KiJgUU8v4XRp6RCwlvyEolSzUDk0ax/C7biCu3EbT3p5fqEy2D8fgRg90Bd9uELF
	 slZhs258Q8kiLCP4wtbhut5X68vrk4CBixxNKpMQ43ldaVtEMQlmm5vXJlQADzEtD4
	 aw9ymdu6p91vA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Apr 2026 13:30:47 +0200
Message-Id: <DHZNEABUEFY3.19CX7BFMMTBKT@kernel.org>
Subject: Re: [PATCH v2 2/9] driver core: Add dev_set_drv_queue_sync_state()
Cc: "Saravana Kannan" <saravanak@kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-pm@vger.kernel.org>, "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Cristian Marussi" <cristian.marussi@arm.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Abel Vesa" <abel.vesa@oss.qualcomm.com>, "Peng
 Fan" <peng.fan@oss.nxp.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maulik Shah"
 <maulik.shah@oss.qualcomm.com>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Thierry Reding" <thierry.reding@gmail.com>, "Jonathan Hunter"
 <jonathanh@nvidia.com>, "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 <driver-core@lists.linux.dev>
To: "Ulf Hansson" <ulf.hansson@linaro.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
 <20260410104058.83748-3-ulf.hansson@linaro.org>
 <DHW8QV8K3CM1.307C6PW2BM5RN@kernel.org>
 <CAPDyKFpeSv+fg=YKJE_qc=Q5BfiJFn0tR7Ar8SncqrD0UW1P1g@mail.gmail.com>
In-Reply-To: <CAPDyKFpeSv+fg=YKJE_qc=Q5BfiJFn0tR7Ar8SncqrD0UW1P1g@mail.gmail.com>
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

On Wed Apr 22, 2026 at 12:25 PM CEST, Ulf Hansson wrote:
> Most of the static inline functions in device.h lacks documentation.
> Are you suggesting that we should move towards documenting all of
> them?

I'd prefer that, yes. After all, if they are defined in device.h, they are
public APIs, so they should ideally have documentation.

(If a function is only used throughout the driver core, it should be in
drivers/base/base.h instead.)

