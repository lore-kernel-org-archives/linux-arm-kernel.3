Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FB7606EE86
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B+pRdK3a;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kfh5lukI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9ljaJUV/TRI3RGVt/rJLh+4MvxHbKlzUwSPpPMcnbiI=; b=B+pRdK3aUPJRngFGIsTqTsbZkY
	i6wZToGzQ6+tltHWf60lMP+qna6lf16339hyvjpwm6HjuPGkZIjiEMayzejmnsdQGTG89t4Uv/qqK
	krGL3EEKO6jXYprUoRQup7Y+cQoIKnIeBz4Rad8bFT8+ecJsOZ1ThE7u15cJDlz3oYXmzWB/yDK+M
	W87aAKnX2PkkGg5UURZKoDYLUlNn6oucDPeUmyg2nIIIcnduCS8uzjJ4OEkFC0MLnfb9tA6eknh04
	IbH1rDKIyAng/GyIECAh7Pe70pSwsB74L2TWUREEgy7ijZyPu+iuTS9PM58zjYPoUXerFzWjGsVYQ
	I6fXCoLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuOj-00000008Q70-3hJp;
	Thu, 05 Nov 2026 10:08:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuOj-00000008Q6O-0jSZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 10:08:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EE42404FA;
	Thu,  5 Nov 2026 10:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840021F000C1;
	Thu,  5 Nov 2026 10:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793873324;
	bh=9ljaJUV/TRI3RGVt/rJLh+4MvxHbKlzUwSPpPMcnbiI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Kfh5lukIX7pVtv1xSFtvpTVcpEoqZsZgwQsy2Tru1YL6WykZorV+WeEYAklBQSgfZ
	 n3vpbj6/maJRSXTTJ4TyPIzzI2KbB6fpG4v/aEBp3dQlUCYhrjFcgM3VYNeBYzhdp2
	 +GyfKtcNrQsO01IfZysFLpbtp8RUl3ZCOxUPyeBGdz6e3nF8/5J3gvbOsvo0X7pJml
	 NJikJt3f3XHlm+uLnhaNYVkc9LsgmXVs6z8Xl4sWm/+fHZe1/uZh3iNLRdj8jzodAO
	 QuKhO8ZQxq5d1MdJEH2lboCSWtXgjfjGdexF3+8LRyevRGw4o8JELix19Yx0fAOj67
	 34+CZOAiP+VIQ==
Subject: Re: [PATCH net] net: stmmac: ptp: fix support for PTP_EXTTS_REQUEST2 ioctl
From: netdev-bot+sashiko@kernel.org
To: jjc@jclark.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, jacob.e.keller@intel.com, kory.maincent@bootlin.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 05 Nov 2026 10:08:43 +0000
Message-ID: <179387332308.488856.2315265262072517836@kernel.org>
In-Reply-To: <20261104052504.1886335-1-jjc@jclark.com>
References: <20261104052504.1886335-1-jjc@jclark.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch adds PTP_STRICT_FLAGS to .supported_extts_flags in
  stmmac_ptp_clock_ops and dwmac1000_ptp_clock_ops…

--

net: stmmac: ptp: fix support for PTP_EXTTS_REQUEST2 ioctl

This patch sets .supported_extts_flags to PTP_RISING_EDGE | PTP_STRICT_FLAGS
in stmmac_ptp_clock_ops and dwmac1000_ptp_clock_ops. The goal is to make
PTP_EXTTS_REQUEST2 work again for the rising edge, after the core started
validating extts flags.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> index a37405534bebf..31a66e855d6b1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> @@ -277,6 +277,7 @@ const struct ptp_clock_info stmmac_ptp_clock_ops = {
>  	.n_per_out = 0, /* will be overwritten in stmmac_ptp_register */
>  	.n_pins = 0,
>  	.pps = 0,
> +	.supported_extts_flags = PTP_RISING_EDGE | PTP_STRICT_FLAGS,

[Severity: Medium]
Does setting PTP_STRICT_FLAGS here also change how the legacy
PTP_EXTTS_REQUEST (v1) ioctl behaves on stmmac? The same applies to the
identical line added to dwmac1000_ptp_clock_ops.

For v1, ptp_extts_request() in drivers/ptp/ptp_chardev.c masks the flags
to PTP_EXTTS_V1_VALID_FLAGS, which still includes PTP_FALLING_EDGE. It
only treats the edge bits as hints when the driver does not set
PTP_STRICT_FLAGS:

drivers/ptp/ptp_chardev.c:ptp_extts_request() {
    ...
	} else {
		req.extts.flags &= PTP_EXTTS_V1_VALID_FLAGS;
		memset(req.extts.rsv, 0, sizeof(req.extts.rsv));
	}
    ...
	if (!(supported_extts_flags & PTP_STRICT_FLAGS))
		supported_extts_flags |= PTP_EXTTS_EDGES;
	/* Reject unsupported flags */
	if (req.extts.flags & ~supported_extts_flags)
		return -EOPNOTSUPP;
    ...
}

Before this patch, supported_extts_flags was 0. Every v1 edge combination
therefore reached stmmac_enable() or dwmac1000_ptp_enable(), and both of
them ignore the edge bits.

After this patch, a v1 request with PTP_FALLING_EDGE set returns
-EOPNOTSUPP. That covers falling only and rising plus falling. It also
covers a v1 disable request that carries edge bits, because the check
runs whether or not PTP_ENABLE_FEATURE is set.

The in-tree tools/testing/selftests/ptp/testptp.c sends exactly these
requests for -E 2 and -E 3:

	extts_request.flags = PTP_ENABLE_FEATURE | edge;
	if (ioctl(fd, PTP_EXTTS_REQUEST, &extts_request)) {

Those calls appear to succeed today on stmmac and fail after this patch.

The commit message says:

    Only the PTP_EXTTS_REQUEST ioctl still works.

That suggests v1 behaviour is unchanged. Could the commit message
describe the v1 change explicitly, since the patch is tagged for stable?

This does seem to be an unavoidable side effect of making
PTP_EXTTS_REQUEST2 work. The kernel-doc for supported_extts_flags in
include/linux/ptp_clock_kernel.h requires PTP_STRICT_FLAGS for
PTP_EXTTS_REQUEST2. Several other drivers already use PTP_RISING_EDGE |
PTP_STRICT_FLAGS, including ptp_qoriq, enetc, dpaa2, bnxt and am65-cpts.

>  	.adjfine = stmmac_adjust_freq,
>  	.adjtime = stmmac_adjust_time,
>  	.gettimex64 = stmmac_get_timex,

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261104052504.1886335-1-jjc%40jclark.com

