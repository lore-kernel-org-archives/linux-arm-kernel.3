Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B84FE9A04B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 19:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJhq+2CidcsWzd3rDvYrFz6+smejGBgk+o2C7ibnjY8=; b=atl1l0r+bFyYmqV01NiT6rVtFm
	PzEU7I1+pHvdv1Tz0ov56iC982PBxBCZ0uR4M6qCFVEl42XhDV6pIdSnJkt3/k0wDbL86Q/URD134
	JpxGHRR8WGAvcxLoH5pfL5Tp72tyETrb6p5qSMi3nBLtZhElbL8tY/BgxWgUR1V3ye/OP86d7EUND
	Q4P5yxudT6Lza3grknUXucPLdLdE9TzZzl7NY+AD8kaYzMTKDkWk3Cjib9ONtvH7+ic2iLdG+u9b1
	jWQdsUQmaQfwEARbKnO3ATVjf1QO6wB8vlapf8tO8gq8E141O/yNBhlWFC21XMqGPvS4Lv9UFlR+o
	upoRnDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsnfc-0000000AL3n-2p4n;
	Wed, 18 Feb 2026 19:57:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsnfb-0000000AL3e-15G8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 19:57:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 643F76132F;
	Wed, 18 Feb 2026 19:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA95C19422;
	Wed, 18 Feb 2026 19:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771444630;
	bh=gat+rnnrUbK/Y6WytC8CslzBWIw44IxAUqnSKe3YTrY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aU14TGs1bcBdcieOvY4AjyQhrda6+MkmVlhMOuzrvau4aRL1lBtCrYeKF/2apBpWE
	 mtVLTp11y3++lF+DvWTLWjTb3rlyub4/6jOkIIVa5jeoZLNmR0DC96Ra7y7J1/lxuZ
	 2GVQh9+zp74dG9vcowhY3oIVqAYtnMacHVkIUgmCIYAltAz/P72ZBvohIaHePwfsqv
	 Yu/fx6ueqX3LNWeImBl2d5Z60hIyYgqacrdddRFOO+r45TjKGzXtYHZ9QeMOub1KOH
	 iDZxYI8pQ4LyAQeZ1R2jHqYJit4AjCi3njx2mjkvP8M/su6w101t1y/Y32+YMWQ0rs
	 qpK63qWL1ooJg==
Date: Wed, 18 Feb 2026 19:56:51 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@intel.com>, linux-arm-kernel@lists.infradead.org, Bjorn
 Andersson <andersson@kernel.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Waiman Long <longman@redhat.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Mark Brown
 <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Thomas Gleixner <tglx@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Lee Jones <lee@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Srinivas Kandagatla <srini@kernel.org>, Antonio Borneo
 <antonio.borneo@foss.st.com>, Linus Walleij <linusw@kernel.org>, Konrad
 Dybcio <konradybcio@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-doc@vger.kernel.org, driver-core@lists.linux.dev,
 linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-spi@vger.kernel.org
Subject: Re: [RFC PATCH v2 13/13] hwspinlock: refactor consumer.h from
 public header
Message-ID: <20260218195651.6a3fe5e8@jic23-huawei>
In-Reply-To: <20260215225501.6365-14-wsa+renesas@sang-engineering.com>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
	<20260215225501.6365-14-wsa+renesas@sang-engineering.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
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

On Sun, 15 Feb 2026 23:54:53 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Factor out the entries only needed for consumers from the generic public
> header. This allows for a clean separation between providers and
> consumers.
> 
> FIXME: separate driver changes?
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>

for the IIO one.

Thanks,

Jonathan


