Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76097C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XusDj8m7nrtABbX3eM6yTGtbV45R/ekzcSuqzUXyGAI=; b=2GnA5s/7m/95FBNI2flirA4z0e
	6CwjZHUU3JSaMJVbqOsqaNFSGy3qAKibLN2YFF+HV48x+UB8IGKeuzn9Ao5ONoBSyH863m4nBVs6N
	4jyLo4oW9oKipKPRt26rJtkSVDPxZ6l7rE3nXn9OzIW5Vw27oy7ot96i1g6DZjVZ4KKmPloWNir29
	UK+PuGI9b4DT7j6Eqg7wcgzOX/V0H+/LbuvnMruK9o3dJQdTO6FDGF3YWLd74TjsnVFGMKQC0IEyM
	qM5j2j0NdENCYAteoH9Zgx9HKtjR3UoFlalSrJRcMm/ythHUPRRD0EaM83DDywp6fAOWdK/jFPWpD
	jsEC1qEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Td7-0000000D8TE-1vP8;
	Tue, 01 Sep 2026 18:54:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TbL-0000000D49H-0hRz;
	Tue, 01 Sep 2026 18:52:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 74AD54128F;
	Tue,  1 Sep 2026 18:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E511F00ACA;
	Tue,  1 Sep 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788288774;
	bh=XusDj8m7nrtABbX3eM6yTGtbV45R/ekzcSuqzUXyGAI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=LbX8JkR9xXUM8ICTxc5tgVtE2aL0rx506M21DkIQ1d33/t4yoKhksXBxEui3GmMqw
	 Wca3FRlvNzhPcLc7SeuYRSTUwhgKzAYDoQNHg9KxCCBUGP3M4Ep3/OWh6fUnQaGnhL
	 80+RQVpq9zqPv8jfNKYwCKTVRxINdlVdGz5iteg4nImKZuCQ+/h7JeRWXgjhVv+12Q
	 EOW35i4ZTrdpAzJnlXBeKAl8zkZ0shxUlnLXuTPtbETehGND3rxbk9ENXHfueVv5M+
	 FAnBsBkJNdAYf7wRdsna1slcZuU2PTyWL7bxGBozwbAEpkpWJmWv0HjbXRWX/isNgl
	 VKfEys8XN+dMQ==
Date: Tue, 1 Sep 2026 12:52:50 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Xixin Liu <liuxixin@kylinos.cn>
cc: linux-riscv@lists.infradead.org, atish.patra@linux.dev, 
    anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, pjw@kernel.org, 
    palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] perf: RISC-V: store available counter mask as
 bitmap
In-Reply-To: <prpmask02cmap.v2.1786434000.git.liuxixin@kylinos.cn>
Message-ID: <460ddaff-bdad-0eb6-a504-1ea43689d6dc@kernel.org>
References: <cover.1786092600.git.liuxixin@kylinos.cn> <cover.v2.1786434000.git.liuxixin@kylinos.cn> <prpmask02cmap.v2.1786434000.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Hi,

On Tue, 18 Aug 2026, Xixin Liu wrote:

> The available-counter mask was a single unsigned long, but iteration
> uses RISCV_MAX_COUNTERS, which is 64. On RV32 that reads past the object.
> Filling with an unsigned-long bit at index 32 and above is also wrong.
> 
> Use DECLARE_BITMAP and set_bit/bitmap helpers. Walk each bitmap word
> into CFG_MATCH when checking events, when allocating an index, and when
> stopping all counters. Set the counter base to i times BITS_PER_LONG.
> Share the CFG_MATCH ecall through a small helper so the 32-bit argument
> split is not duplicated. On qemu-system-riscv32 the probe bitmap has bits
> above XLEN set, so the first word alone is not enough.

This patch results in several 'checkpatch.pl --strict' "check" messages.
I've fixed them in the queued patches, but please run 'checkpatch.pl 
--strict' next time.

thanks,


- Paul

