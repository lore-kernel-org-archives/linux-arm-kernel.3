Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD718D3B9A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 07:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xi5qg1BTK9qEykpr9KF1SIi5opKrm0uGoRSWaWcyTeY=; b=LWTDfQBEbpeueVPIICWHOxf+O8
	QaSXlXSx/TELTNIXJZPuiNZyMZ7C8umOK+mSyUr2QbMPoJa1eax3MPTSvTkgS3LkD8VBtB6dmJ/3J
	JdT+PANG8Q5xQJlJKTm6z6aKu4PnzG7s3o7m9WwN8UkAGpsqFWyobF1vxDx41Esc3ADiNPIc3hH9R
	Nx9xDb1kkavMdA9zslU8ufn9ySKNhryCP8/Fcgg+iAaFOVMFjLjU1UZLUAjlpf/k5cQjf1kSHByBF
	dwbTsqLfdS5aYJ9O4iLqJjgUmSUI/nqiEEiH8he/TLz+7G3cR4dHF9AFOnWPq1K2sUzpLX29fJmqM
	FF5XYtZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTEtf-0000000FDOH-0icA;
	Wed, 10 Dec 2025 07:46:03 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTEtc-0000000FDNs-0Vke
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 07:46:02 +0000
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 87ACA1FBBB;
	Wed, 10 Dec 2025 08:45:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1765352754;
	bh=xi5qg1BTK9qEykpr9KF1SIi5opKrm0uGoRSWaWcyTeY=; h=From:To:Subject;
	b=uty0vOOMiRvYfsJ90GSUleVUmw8RQQBRyFJKrOzeX9DGuARo++qCeNTdttDfow7F+
	 kt1xJ/42Ndkso5wyjY4PXouoj/7nw6IscG4ndTvFXZiVVb1z9U6mSFdRhPo39QE8AQ
	 l4EcBljbOCDMrtKdWMHSpi2f8IkyrsPWtorJEZv599q1hSKSMzm85IvreyT8RqAXT1
	 i92PK06S6EpQAc7EaRvHQygS6q7kGHPfHA4byUXEHzJlezYpC+SPuw1RiZtpNn2isg
	 QPSmCLNGGwj6ZnOqNgIFbqtJk4laTxhsKNEAzIgXrNnyzc/RY0VA4PWCq2YbKtxYTm
	 KGoz2bblu3uyA==
Date: Wed, 10 Dec 2025 08:45:50 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: "Ivan T. Ivanov" <iivanov@suse.de>, Frank Li <frank.li@nxp.com>,
	Jason Liu <jason.hui.liu@nxp.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Subject: Re: [PATCH v2] arm64: errata: Add NXP iMX8QM workaround for A53
 Cache coherency issue
Message-ID: <20251210074550.GA10733@francesco-nb>
References: <20230420112952.28340-1-iivanov@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420112952.28340-1-iivanov@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_234601_212390_596C265E 
X-CRM114-Status: UNSURE (   9.30  )
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

Hello Ivan,

On Thu, Apr 20, 2023 at 02:29:52PM +0300, Ivan T. Ivanov wrote:
> According to NXP errata document[1] i.MX8QuadMax SoC suffers from
> serious cache coherence issue. It was also mentioned in initial
> support[2] for imx8qm mek machine.

Ivan, from what I can see this patch was never merged and there was not any
follow-up on this. What's the status? Are you planning to work on it?

Frank, it would be nice to have this issue sorted out in mainline, any
chance that NXP can help move this forward?

Francesco


