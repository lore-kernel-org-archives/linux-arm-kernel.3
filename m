Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47B9C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 14:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2AblkwaZ05bEQTFbwGOGjPgfMsYQxBHZ0TuppsU9dQ=; b=ZyIB2zk/W0A5sFfKFO4JSLrgXD
	tMgGa41NfuvIA+T/C6uLd09H0H8/dKquSakgikw5WSwq+mMAS7XREJLqiw+dC5gqOboEKgF2DMhoI
	8xOMPhJHfuLogaaGVoqVzxYYqJNP64cI2G86hPv727iv3kSkLpoePOijHvAb+uQnmlzM9ZUQ6E/pE
	lPkzxWtUN9szAuo4wLKUEywbpiGlNOg+yrtkhzL5yWY4dO+F48ExEjbJvlgbcrvb5lAF1u69c5yXp
	92aGzsHIJLx4PczOvjpjpT0eLq1IoF/7l1O0lSyYczTbrr7OIWg+mMNeEnk6hGDXJH4FAmQDhIL6D
	gQNHiIMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8gLs-000000029Dt-344o;
	Sat, 26 Apr 2025 14:17:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8gK0-00000002962-238m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 14:16:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C6909A4D386;
	Sat, 26 Apr 2025 14:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25313C4CEE2;
	Sat, 26 Apr 2025 14:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745676959;
	bh=gq8XinHjcqlcRZOej/1xdHnTuoPfOzXjgO/z4DEC6jQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=COTrvjgFkwOTT+Swfx9KhSAoZJ28/vPDZK55Zbk6uIdUp3UuSu2Dx6ZXjunBVXBnJ
	 XrQ0tH6C1Eftu5rM1C+Oau8SUkldKc66L47wFeycHUoibteXtpKQMLOX396qezm9Qq
	 wxT6perzW+6AzX35cMy6No17sV1msV5sXpTvyYZMEeCgqftB4KPlpVIKuuMe+jkk1Y
	 TC5yrlSilYxb/VHblwCrWigvJ1N4t3VOnVtymKVWSHQNuAiu+2gsVQwKenmh0X2tOD
	 XkzVvCxgVLn9o5silT4lBPqaMcjPqcwhp2yRD4LX9blCZWT0Nzh84+4skDEwMYY78V
	 uXAIsbmVj0vQA==
Date: Sat, 26 Apr 2025 15:15:52 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, <linux-iio@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] iio: adc: stm32: add oversampling support
Message-ID: <20250426151552.10aaee38@jic23-huawei>
In-Reply-To: <20250424151604.626758-1-olivier.moysan@foss.st.com>
References: <20250424151604.626758-1-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_071600_593499_F03C2AC2 
X-CRM114-Status: GOOD (  12.32  )
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

On Thu, 24 Apr 2025 17:16:03 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> Add oversampling support for STM32H7, STM32MP15 & STM32MP13.
> STM32F4 ADC has no oversampling feature.
> 
> The current support of the oversampling feature aims at increasing the
> data SNR, without changing the data resolution.
> As the oversampling by itself increases data resolution, a right shift
> is applied to keep the initial resolution.
> Only the oversampling ratio corresponding to a power of two are
> supported here, to get a direct link between right shift and
> oversampling ratio. (2^n ratio <=> n right shift)
> 
> The oversampling ratio is shared by all channels, whatever channel type.
> (e.g. single ended or differential).
>
> Oversampling can be configured using IIO ABI:
> - oversampling_ratio_available
> - oversampling_ratio
>
Applied to the togreg branch of iio.git. Initially pushed out as testing
to let 0-day have a first poke at it.

Thanks,

Jonathan

