Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E45CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYcDT2xHG5nDU8J2gErMvIxigr1UGMadwCYEhogICLg=; b=eegNI+w89SIFxdd6Z7BHLBpsdP
	W2w0FXmTa5IpR9BRrT4RwXRDdtkOBcsNNgvRXxnWWJGRXOO2mtb4hPDUht01ka93NUGHXpa1MhsyL
	qWE7bCDXAjKRHilPu8D5WmMxxtm3Ra5DUlGwBTFqG2LwkeCfSKswtFPfRv9YzsC8+KEU1BO+zoVnQ
	+2xtcUhvdekGdC/2lCx1XdmdBb9XS1pk5oNtMf49bxFXMXyBvDbLJBVNsKcnh27HVL3LD9qlcWm1y
	4b+45RxiQ8fXUfy5Z9yWoRk7SoVXadOuRgtb+ldTKb8LbA6hLUPxXfg1oue5TIy5UX2CsFpcmBau5
	lT8ZELHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7Ki-0000000BRXT-1chV;
	Fri, 12 Jun 2026 19:14:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7Kh-0000000BRXA-1zoi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:14:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7ED0160142;
	Fri, 12 Jun 2026 19:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14721F000E9;
	Fri, 12 Jun 2026 19:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781291662;
	bh=kYcDT2xHG5nDU8J2gErMvIxigr1UGMadwCYEhogICLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R2tXRCwpziJu3wsmgdJGwIEZZ96NJekBTrzFkNuXOUS+EQ0MHF6nmWHBI16VJVqJE
	 LqsZFXfA6FfKjQ5QnXAvqAASUoj1w1stgKmRSJYs60Tkja7EvT74CKpaHPpK1/bYYN
	 9iDOcCpV+Xg7J3W/0sfb7oh6SAl5VHMarpdjiJPO+zjw6RwwcARVL1b4SKLMn67qr/
	 WsBAuNUdKwcvvJDX0lQFXixtoGvN03Jy2A0pv3MT3Rw5LOWQjWm4RjhSs21pg1lya5
	 e/PuShKnzBbF1i8h3DQJHqIK00flFztAfGgMZ0RdXBLhT1TFZRb7/1mlrabqEAgyxg
	 TiueNRLYabV+g==
Date: Fri, 12 Jun 2026 20:14:17 +0100
From: Simon Horman <horms@kernel.org>
To: Jakub Raczynski <j.raczynski@samsung.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	k.domagalski@samsung.com, k.tegowski@samsung.com
Subject: Re: [PATCH net 0/2] net/stmmac: Fixes for maximum TX/RX queues to
 use by driver
Message-ID: <20260612191417.GM671640@horms.kernel.org>
References: <CGME20260611113403eucas1p1f4b61896c875f1f6833d6ca136472af8@eucas1p1.samsung.com>
 <20260611113358.3379518-1-j.raczynski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611113358.3379518-1-j.raczynski@samsung.com>
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

On Thu, Jun 11, 2026 at 01:33:56PM +0200, Jakub Raczynski wrote:
> When contributing other changes preparing functions for new XGMAC hardware
> https://lore.kernel.org/netdev/20260601162537.553512-1-j.raczynski@samsung.com/
> there have been reports by Sashiko AI review about pre-existing issues
> in the code. These problems are non-insignificant and are 'net' material fixes,
> rather than net-next features.
> One issue in this patchset was reported by Sashiko AI, while other
> technically part of new patchset, but is reasonable related fix.
> All of issues are wrong DTS configuration, but kernel needs to handle it.
> 
> Jakub Raczynski (2):
>   net/stmmac: Apply TBS config only to used queues
>   net/stmmac: Apply MTL_MAX queue limit if config missing

For the series;

Reviewed-by: Simon Horman <horms@kernel.org>

FTR, there is AI-generated review of this patch-set available on sashiko.dev
However I believe that feedback can be viewed in the context of possible
follow-up and should not impede the progress of this patchset.

