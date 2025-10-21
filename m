Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D14CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 00:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDGV2yg5lpkIovG1s0kMsaTuCjjJwIpbrURQLu7sgUc=; b=D7ydFOoBORv8KiWXdIfLiMqfp2
	4tfMF47TpGwPsRTidKG6qqoZTBkbKkvytm1Os4Wiaw0y50Javxt5QhRGnA16zjdrAxDS3hprEOWOW
	d/kO7n8/i7LjKgCKClFWq44j0E/IYtGl+hiTpHejuOuKB6PcdA4OXgSQn+tvQy1+hWmP7C6LTbFqY
	1bxye9Etam78CVYUdr3KIoOJdtJUWQdHzyGZQrbWs64nhg2IZ8R5cTKi2NTABZgrAR0RwpEHb+53g
	bp+908VChSHtUFFk3OLKb8Wn7+MJmXqffusVJDzpoKwUFhrtaoI5UVWQLgk8wczZvyrrBiPyhkgpx
	Ujzn2IoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB0T5-0000000FNQv-3WrP;
	Tue, 21 Oct 2025 00:43:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB0T4-0000000FNOr-0HLL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 00:43:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E6CCD43E40;
	Tue, 21 Oct 2025 00:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B00C4CEFB;
	Tue, 21 Oct 2025 00:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761007390;
	bh=4RCzmBSn1YK3dNU1eu6WlsS+oiC3sOWT4kMWZcs60Is=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cEtkjrjSI92wIHZJsTGhCickdT6aybd2B/sEoCNPQBq/fTzMFYu6KnoutQup+d3Ro
	 lM5gStw8JWQUxulUM1ObqQoPovLRzmAZd6pDkxLZNOvipZeJs8WuC5drCdqW3pVzlM
	 h/BndLLXV6OHUq6iIpQRcM7bJYk9icyWPTB5HiUu6//tb+H7Qb/DdZ+aG3zjCUS/Ty
	 PRoWZxS854wCjMVNWDg3mNdhBMvr5w0gjQF3eaI2lbwC9unraJMT4P1SItRyPIjrWH
	 8Pxo7LIrp/88tlKL+LQ5d1imWkZr7hsHbzmQNAOzfATefCser5tkqQeUtnFxqAIwLz
	 OaSBPwcvab96Q==
Date: Mon, 20 Oct 2025 17:43:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: <horms@kernel.org>, <namcao@linutronix.de>, <jacob.e.keller@intel.com>,
 <christian.koenig@amd.com>, <sumit.semwal@linaro.org>, <sdf@fomichev.me>,
 <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
 <ast@kernel.org>, <pabeni@redhat.com>, <edumazet@google.com>,
 <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
 <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH net-next v3 0/6] Add AF_XDP zero copy support
Message-ID: <20251020174308.59b87130@kernel.org>
In-Reply-To: <20251014105613.2808674-1-m-malladi@ti.com>
References: <20251014105613.2808674-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_174314_137611_B4A72118 
X-CRM114-Status: UNSURE (   9.25  )
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

On Tue, 14 Oct 2025 16:26:06 +0530 Meghana Malladi wrote:
> This series adds AF_XDP zero coppy support to icssg driver.
> 
> Tests were performed on AM64x-EVM with xdpsock application [1].
> 
> A clear improvement is seen Transmit (txonly) and receive (rxdrop)
> for 64 byte packets. 1500 byte test seems to be limited by line
> rate (1G link) so no improvement seen there in packet rate
> 
> Having some issue with l2fwd as the benchmarking numbers show 0
> for 64 byte packets after forwading first batch packets and I am
> currently looking into it.

This series stopped applying, could you please respin?
-- 
pw-bot: cr

