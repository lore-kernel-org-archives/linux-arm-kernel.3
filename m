Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6899FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 15:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSTs2/8CGWWd92301TQzgGP+S7Khd+/WH4saE9C4kIY=; b=TJU3zpIU74n0VryA+ddlThHQhT
	0jWtIekn27edNNZtDT+n3C1H6VNqkkYiOJmqF8NgkIeptJMHcCpbCuHfSIEoSL0kRUoyNIAzco8RG
	RBqG534obRWo+7srsDYEE2inzSwA9WNnxys1XyfT0gngPdlyZBEhqVO3VPu0nN6Kw7is2dwu04pLE
	QA0sKQCz0hQIWqwJcRoYVhXGCTWiHssLN2n7kGpl4NMEMWcftAYYRdmYCZaeh59GjpaPTMmD1qToy
	D717pmXv7u+saKdsZuP9NIUCeXK5xVP5Gap7V4JbBoF2A5IxVCr1FCmyDStIEUw6OH6c6/ee2cfVC
	+Kd4tpPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGf26-0000000EY8z-0SaR;
	Sat, 25 Apr 2026 15:35:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGf25-0000000EY8X-2WWN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 15:35:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C460060055;
	Sat, 25 Apr 2026 15:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0BDC2BCB0;
	Sat, 25 Apr 2026 15:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777131298;
	bh=Ri838Yv4Wz7//y5S43QdY3pnUhe+/Yx9CpoGk2g9iz0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ltGuX0IvOosps7Qozb+OzSpxpc1SGFLfTaqfkEPvazMhWj7TjndqUIBke7VCYB4l7
	 NwcasdxSyXJQIzil8bpuDhYrQWN24VZRL3Gu/hnggrjG+1wI05bFB/PvQtfzdlRX7M
	 yG5XEVIChPN5uxsxK68HA4QswfIQZXDq2iX9m0SWdPkOjdb4h40Uk6nDPoVE4o+pLq
	 l6HDUfeE4ALsMJvMalAZZIPlfy/havMtR5cNjI9D6CZhCQIqDoih7URjC1HqyJVN/Y
	 Jd8u9KLllbmDsTjlku2uveziG3fBg/ivmnYlbodxCtKO8gW3Jy5AH1yizwEPAKKTce
	 f5lm1TvNmhkUg==
Date: Sat, 25 Apr 2026 16:34:49 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
Cc: Salih Erim <salih.erim@amd.com>, Conall O'Griofa
 <conall.ogriofa@amd.com>, Michal Simek <michal.simek@amd.com>, David
 Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] iio: adc: xilinx-ams: refactor alarm handling to
 table-driven design
Message-ID: <20260425163449.547b7ed9@jic23-huawei>
In-Reply-To: <20260414224245.8493-1-guilherme.bozi@usp.br>
References: <20260414224245.8493-1-guilherme.bozi@usp.br>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 14 Apr 2026 19:40:32 -0300
Guilherme Ivo Bozi <guilherme.bozi@usp.br> wrote:

> This series addresses significant code duplication in alarm handling
> logic across the Xilinx AMS IIO driver.
> 
> To address this, the series introduces a centralized table-driven
> mapping (alarm_map) that replaces multiple switch statements spread
> across the driver.
> 
> This improves:
> - maintainability (single source of truth for mappings)
> - readability (removes repeated switch logic)
> - extensibility (new alarms require only table updates)
> 
> No functional changes are intended.
This series looks fine to me.

Given the AMD Xilinx folk are fairly active reviewers I'm just
waiting on them taking a look.


> 
> Series overview:
> - Patch 1: fix out-of-bounds channel lookup 
> - Patch 2: convert mutex handling to guard(mutex) 
> - Patch 3: introduce table-driven alarm mapping
> 
> v1 -> v2:
> - Fixed Fixes tag format
> - Replaced AMS_ALARM_INVALID with AMS_ALARM_NONE
> - Changed alarm_map base_offset type
> 
> v2 -> v3:
> - Replace 'i >= num_channels' with 'i == num_channels'
> - Add missing trailing comma in alarm_map array initializer
> 
> Guilherme Ivo Bozi (3):
>   iio: adc: xilinx-ams: fix out-of-bounds channel lookup in event
>     handling
>   iio: adc: xilinx-ams: use guard(mutex) for automatic locking
>   iio: adc: xilinx-ams: refactor alarm mapping to table-driven approach
> 
>  drivers/iio/adc/xilinx-ams.c | 190 +++++++++++++----------------------
>  1 file changed, 71 insertions(+), 119 deletions(-)
> 


