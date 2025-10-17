Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6510BCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 21:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjV3n83YnHaOheLKgiPySSlQiQ+1OIaSXeBHMe2jzWc=; b=MtUzss9yiRyk2VkqChaAVbAVnS
	TtKvs45k9VTeKNsPHpI2r3yMKV2/C94BYqTkaTWv6mIAaM7gwWOg5IhX5x3EnHDMaiFfbEpNdw9CS
	dsjWisRJaDGHwpE/gf+RyPg43c2svuOITXNBsR5eRrkExFgLlg9ZsIkqO0HsH+NBjEqcK0RgcNQpM
	72CtU9yH0WLRiwTQuSYPEVyZ7mbrToULeNp60X5ms1MrGP3goqvOzw/lFGy0nBRuqrHbhzJ2CukHY
	VqsWzfz0VM/AqfBlFpLqnzLDqe/fZGcd03+ce38TDpMuTO1/552wqHYxUoxnEgLq1AC8aYQHez3WF
	wuj9sSxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9rhs-000000091H8-039K;
	Fri, 17 Oct 2025 21:09:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9rhp-000000091Gi-1phN;
	Fri, 17 Oct 2025 21:09:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5595D43A4F;
	Fri, 17 Oct 2025 21:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55466C4CEE7;
	Fri, 17 Oct 2025 21:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760735384;
	bh=MUDqIKKwpcOalbVlQw7f73/p4pZFhDngV44KpR8dpfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VEyHlQorZmITIIWwk6iqv0GuasGrI+LDJ5pg+L/2YAIHFyhkwgzxleKIZIm2i5gHA
	 Y1AHjwN6+4Kq8EHXRTUChQor5snqBFfdwfwA38JSHJLHS/TRVeDtxwRGOPYENStW2U
	 8YvjdGpCvRzBPTQiiQTAaJCtVjd0Zc0YldqalC97ZEa9ZwrUQeXRWR7uI8jQoOXEEc
	 uIyF1sBniLLo9ptiQgdRxBWE/jzXjs7/Grd1mFLbfJgQM05YJY9esfLoEdAe9nsqgQ
	 S1kJIOmw9f10DSYgMQslfqaC3yCx9Zch2VfFRcBcioGkaDSp+w4JT/iGz5CvMRF4i/
	 WKVcx5yIXdrJA==
Date: Fri, 17 Oct 2025 23:09:39 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Maxime Ripard <mripard@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND] i2c: busses: bcm2835: convert from round_rate()
 to determine_rate()
Message-ID: <hf3zdgvdwkyaubicndcejmioqjqhlko4ypnderd7viobiyjtua@ozxt2adok2j7>
References: <20251016-i2c-round-rate-resend-v1-1-96dd1d725e8f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-i2c-round-rate-resend-v1-1-96dd1d725e8f@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_140945_518130_81CD9BC9 
X-CRM114-Status: UNSURE (   7.32  )
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

Hi,

On Thu, Oct 16, 2025 at 12:08:12PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

I'm sorry for the late response on this. Merged into
i2c/i2c-host.

Thanks,
Andi

