Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A411CD6E69
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 09:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhFdEPb3HT4TjysXJZRtKDypRvUNkKtIqBH5XJMsXAg=; b=21/RrmuRQcjv+DriIbteSjuyp5
	qGnbwuA1qUsoasE0ZSlJMPR+Ob2mNvNB0w8WBe8Zhnz269K+xegRnWxO077mKdM/pSUT/InWNJdln
	8zCcxYppzvseTCifbAdIEUCXbP+sc9qJvrUEyjHZv/FBfIAGdIX2AjXiqWU8K5Mj3+A/i8XYGHAbR
	F1rW2H/h1H/ZlcNIMn7++BIPPw2rh+ZlPYYeIZ1bNyFCMOTM6KNuSZx1+ZnzC/mVVeKzvxHC6iZ7p
	QrbAyKrY6dexxJmyy5GlHAJDF1Qb2PDAfaZB9VvUcxxfYY5MqzSSd7WcpgQ2avf5M/Dp2Vx8ayel6
	UZHvn6Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhor-0000000EhC0-2Im0;
	Wed, 03 Jun 2026 09:23:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhoo-0000000EhBa-1YHA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 09:23:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 77F646008A;
	Wed,  3 Jun 2026 09:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2786C1F00893;
	Wed,  3 Jun 2026 09:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780478601;
	bh=yhFdEPb3HT4TjysXJZRtKDypRvUNkKtIqBH5XJMsXAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HA1nBEAuRqYA3wp9IvFhZkwxChIcSUAQrh3Zt5VVwFiPpqh68hVL/mNdkeoG6ErJh
	 Dm/Rw3rlT/TZgJQPgz2loxu/92IzBS/FaalgzanlHAcF0XkjkCsn96RbPoXmVcEqGO
	 1Kl8ZGsgepUnbr+eUzdzWejlkboPDDM1rRkSsazFboJke1J1FYUGfkBwk3Wxfu0KKO
	 XF1DXy+LqbKBX6zKNSbAHQnxMrxngYttyOB95jzUTZu8mKBleGJM96/GKLTJxsKPak
	 HrI9RytQw4cPwuvFT7jtRy4yLeUO+kQ6Fg6SaFEwYsOt+vKXCnNCmVi+nVqdbNHo93
	 bqRJ5SHp/5HvA==
Date: Wed, 3 Jun 2026 10:23:18 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Seth Forshee <sforshee@nvidia.com>
Cc: Sebastian Ene <sebastianene@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] firmware: arm_ffa: Handle maximum RX/TX buffer size
Message-ID: <20260603-light-grouse-of-stamina-20d33c@sudeepholla>
References: <20260602-b4-ffa-rxtx-map-fixes-v2-1-7cb06508da84@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-b4-ffa-rxtx-map-fixes-v2-1-7cb06508da84@nvidia.com>
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

On Tue, Jun 02, 2026 at 09:54:06PM +0000, Seth Forshee wrote:
> A partition manager may reject unsupported RX/TX buffer sizes by
> returning INVALID_PARAMETERS. Commit 83210251fd70 ("firmware: arm_ffa:
> Use the correct buffer size during RXTX_MAP") has the effect of rounding
> up the buffer size from FFA_FEATURES to be PAGE_SIZE-aligned, which may
> be larger than what the partition manager supports. This caused RXTX_MAP
> to fail for some FF-A implementations on kernels with PAGE_SIZE > 4K.
> 
> In FF-A v1.2+ the partition manager can specify a maximum buffer size via
> FFA_FEATURES, but the driver currently doesn't use it. Add support for
> decoding and honoring the maximum buffer size.
> 
> Some v1.1 implementations also return INVALID_PARAMETERS from RXTX_MAP if
> the buffer sizes are too large but lack a mechanism for discovering the
> maximum buffer size. The relevant bits must be zero in v1.1 and earlier,
> corresponding to "no maximum" in v1.2+, so we can handle both using
> the same logic. First, try using a PAGE_SIZE-aligned buffer as is done
> now. If this fails with INVALID_PARAMETERS, retry using the minimum
> buffer size, which should always be supported.
> 
> While there, also update RXTX_MAP_MIN_BUFSZ() to use FIELD_GET() for
> consistency.
> 
> Fixes: 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during RXTX_MAP")
> Assisted-by: Claude:claude-opus-4-8

I am planning to drop this as you just replace your code with exact verbatim
of what I suggested. I will replace with my suggested-by.

Thanks for testing and posting the patch. I have potentially queued it but
will rebase at v7.2-rc1 and send it as fix, so it may take some time. It will
be backported to v7.1 eventually, may have some trivial conflict but we can
take care when this lands in upstream.

-- 
Regards,
Sudeep

