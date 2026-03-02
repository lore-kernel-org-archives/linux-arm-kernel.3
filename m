Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AE9E9B36A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Es3SRRdfp75AU/UHh55tP7IIaU/lfbegBEVY2+pW4vU=; b=EbW/5ZSU4lPv6uMainqvmfTQEF
	YkSwQRTzsCPhHtYStN3ldU5fIw+/ZA7GV4z0HpkD2DgJjs6o8BYEqJqGDCUVdAHdgrdhXjRVBqsH3
	iJ/txLyQawxTZn1NxV06AXOAL4wRKq/HcsQ0mS0S0s9XVfQzMaBsHoI3re867wj85BRRduhk0ImfP
	WuIRhyoLFgFoHxUhXfEf9pgFCNXLD1PHurGZ5uw1kMqLxKYyqMkWfCE2l6q62mmaOtMCKCHxxdhv0
	5k0RxGFVFxCGJG3u9ZIxBTxEYoE8iB0xRnQkHqMlRMT4uuzA/MBRqGr3sutnVfpZ0APt3Fgjq/9vk
	61ndT0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Py-0000000Cp2j-0WUj;
	Mon, 02 Mar 2026 11:26:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Pu-0000000Cp20-3lWm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:26:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B40A44050;
	Mon,  2 Mar 2026 11:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E2AC19423;
	Mon,  2 Mar 2026 11:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772450785;
	bh=4pP4wEyQK85FCKi5Er3y6pE4/p9k209Wqhmi2goE0to=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LSq+QqNGrGOlsXTWbrTMZadXTcUAkq2xk+WVCFWcBzP75b8gVo2PiYFdWtg8iWH4w
	 ihFyVIVQP5ZQoNgSTVqF/L1SJGoaX/lZVF9GC2f8wZ26vpqdFQuaLtM43pIEbPaZei
	 iUg7Kj4dbVXCO6ksqBpyHXVRh0gmKVRu7IRzTtq5npNPkozxeKTn1T9Hk1kgwzjr3y
	 5BkTSD8Yk6xOemXPPZFfGC71X8+qd/VKtsmKy8BsCFofRRUU4+Y2CJ4iV0YhnUoXxA
	 DfAMHkFcm9ahYhicDK/5bgAmTOlLFg8h4HcWwRot4Czmn+Dzj5H0OqU/R3CpQvNTp6
	 gCpBlllGJy2rA==
Date: Mon, 2 Mar 2026 11:26:21 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/13] clk: scpi: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Message-ID: <20260302-godlike-amusing-sawfly-b25af0@sudeepholla>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-4-4421dd2f6dc6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-4-4421dd2f6dc6@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_032626_995553_2BEBAF03 
X-CRM114-Status: UNSURE (   7.94  )
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

On Thu, Feb 26, 2026 at 01:16:48PM -0500, Brian Masney wrote:
> This clk driver has a noop determine_rate clk op. Drop this empty
> function, and enable the CLK_ROUNDING_FW_MANAGED flag.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

