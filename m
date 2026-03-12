Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393F41067041
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPmxlc7VMcKQYgc6aT/QIrVeQ/m10FU5wLoCTwZctWU=; b=B1pLjGFCOSEphhBN3vSxm62iew
	vg/ckPEr7LEtm13pZFKTsA5119to4vbZkOAg6OzkCHVKA8o1fr81fEjstBJfTaKV36N62vRJht4pY
	vpGotbI5pcRxV4psf/n5jVhh/N17FJsjpTaBY0A/onot//aGV2ftDCR1dVhxO5KIsiFh4Zaaqfab8
	VCtT3cp9ymxnELoGz0m9ewYD6l5ZF4iBLGsmfUQM/iall3o4Lbl4OcjTe8AFZEkoku49yQimd5NIT
	/0ZrT+vCUTkmCxGwI3pb9Vi00/pdbIRzjyq7DWDS7FHUNNfpKNd5j+Nl5iJm83N8JvA7LKJrNTbfF
	PoC7G7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hpp-0000000EMJs-3dlN;
	Thu, 12 Mar 2026 15:20:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hpn-0000000EMJM-0bt9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:20:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E7A543F4E;
	Thu, 12 Mar 2026 15:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43ECAC4CEF7;
	Thu, 12 Mar 2026 15:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773328822;
	bh=Xvvqigd/C72hQn6+zvAtVN5LFK4kwcjRIl94MgCX2LI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BV0DPB21yt4s0Sd0hOBwLqTu+Q+SrUgFRQG13X6r/TkZvSkb+jV3uWNbYVb3o8lf0
	 2mbF6jYu7LcbKQtz6mhc3byhydMLF39ooQljk0Ct+AJaXEIyAnUU3c+g2e5pyMWYov
	 dPVLseMg0NvWlRHwKhDEv3XGAtAyRCSERmNyQCyg=
Date: Thu, 12 Mar 2026 16:20:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
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
Message-ID: <2026031210-abdomen-armed-ad22@gregkh>
References: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
 <20260303192600.7224-32-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303192600.7224-32-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_082023_203939_9D03A5BC 
X-CRM114-Status: UNSURE (   9.68  )
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

On Tue, Mar 03, 2026 at 08:26:07PM +0100, Wolfram Sang wrote:
> Factor out the entries only needed for consumers from the generic public
> header. This allows for a clean separation between providers and
> consumers. Also remove contact field in favor of MAINTAINERS entries.
> Fix the users, too.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com> # for IIO

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

