Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFCFF01828
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 11:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4j4+q4eg1DQ8S+6+MlfSRMzb8mYN62U7bLHqrIqMUA=; b=XE00tjZvh5t0nH41cZXS9cUIg2
	f5PpLXxkfb1jSY6hh8OQWUYf7lyWFODFYBfHapxmUq4OIhkfQgXGxZdTRMKMWK9LFOBU+09BnXylb
	DsTvDwR0Lu+l8mtivdYRueUN5OkRRPnyczavCZ5bWaCuMhQA7TgJ3UFUpQiNpVzCwqN8RUzQnEOT9
	+EkVSMXHPGm6QzZx/PG1VoalQAWHqL38yb+3TX9NsvNAWvYDqYObynot8hcnr2Ot4npGp/LMEhCA6
	9cXNCy/juNPUEvzogLRmUCOq/dhBIOgCcnidGO3QleKo+7Gz1oKPZEiMkcSYoU5QYSIBImzG2faod
	5MVVG/3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTN7-00000003ZIK-2BUy;
	Fri, 06 Mar 2026 11:29:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTN5-00000003ZHd-0HwS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 11:29:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E6D7B43B66;
	Fri,  6 Mar 2026 11:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE51C4CEF7;
	Fri,  6 Mar 2026 11:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772796569;
	bh=XryNqzJpAbwoPPJDceu+o/RMktCv0sL78kkwIFXfp2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KqRr2BgDwmSvs5Hlh9XDngsdSc53G1yIc7aGX1uFjRRiZqnxwB1lRMQoq7QTxqesg
	 JLfbnw7piKywWe9WtsSPASsCyxqBVPcdadgdgT3IM8ZM5CnX6N5rvkonx1QbasGG2s
	 rOhRetD5OuGYkCOvvj+lWOYRVK7S6HfjiFhA0xcOZd9JPaT8sATuB85OOD8aiJnfRX
	 y5ayFUc3Fe6Q8fXtNA6kFZrQTFk7fF/KAxeM4RQp7S34+xaBsSDpmKw6i5ncas/DuK
	 yUG1/h2o/p2YUu+Yaxam0qqlC+uixpO1i7fkgLzVRc7uyVhZAefMsB+SrgcbquCpaD
	 A65RtASmO4M2g==
Date: Fri, 6 Mar 2026 11:29:18 +0000
From: Lee Jones <lee@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev, linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 15/15] hwspinlock/treewide: refactor consumer.h from
 public header
Message-ID: <20260306112918.GG183676@google.com>
References: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
 <20260303192600.7224-32-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303192600.7224-32-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_032931_153742_8E10CE9E 
X-CRM114-Status: GOOD (  10.92  )
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

On Tue, 03 Mar 2026, Wolfram Sang wrote:

> Factor out the entries only needed for consumers from the generic public
> header. This allows for a clean separation between providers and
> consumers. Also remove contact field in favor of MAINTAINERS entries.
> Fix the users, too.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com> # for IIO
> ---
>  Documentation/locking/hwspinlock.rst              |  2 +-
>  MAINTAINERS                                       |  1 -
>  drivers/base/regmap/regmap.c                      |  2 +-
>  drivers/hwspinlock/hwspinlock_core.c              |  2 +-
>  drivers/iio/adc/sc27xx_adc.c                      |  2 +-
>  drivers/irqchip/irq-stm32mp-exti.c                |  2 +-
>  drivers/mfd/syscon.c                              |  2 +-

Acked-by: Lee Jones <lee@kernel.org>

>  drivers/nvmem/sc27xx-efuse.c                      |  2 +-
>  drivers/nvmem/sprd-efuse.c                        |  2 +-
>  drivers/pinctrl/stm32/pinctrl-stm32.c             |  2 +-
>  drivers/soc/qcom/smem.c                           |  2 +-
>  drivers/spi/spi-sprd-adi.c                        |  2 +-
>  .../linux/{hwspinlock.h => hwspinlock/consumer.h} | 15 ++++++---------

-- 
Lee Jones [李琼斯]

