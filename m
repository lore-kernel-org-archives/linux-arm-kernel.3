Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00862C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRQ2w9SEWqa3KGSO4eP0kr7mEec58GfHOL/Fav5sanw=; b=lEvZia/28BrYy80dF2zLsww3c5
	KBgYvYZT6Dkzyn4PsgeH1Vr3s+R4C4EG/ZM3MwK/Olc5KzK6I8Om0/JD8RoDz93rUMa7oBAPDAwES
	NP3UTleEbGvsB71nxm47scTP+747Pn02W17jUODAhjvhcMkMmKN8S8MOT/WdM8CF9NHzRb3ICgq2g
	t2I8bJUmoQ9wxE+tbgY2AFF1NCto0GzOazf4I/SMLqtT+LC16tN2rSMSX0FKySG5oqN6zjZQOOVtS
	AiB5Ne3PB6lKcjKo+l/RJgcombqdgAkq2WheJhiKSZTEnjVDLSPQK5NUOt6w1tZcrnHVuUmjxHF6W
	awr3a72w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7vi-00000008fu1-3X07;
	Wed, 29 Jul 2026 17:18:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7vi-00000008ftf-0Yu1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 17:18:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BB0F6001D;
	Wed, 29 Jul 2026 17:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6928B1F000E9;
	Wed, 29 Jul 2026 17:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785345532;
	bh=XRQ2w9SEWqa3KGSO4eP0kr7mEec58GfHOL/Fav5sanw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ViK0zRp4UdqVs45klAkMoXtTi2CTs467E9pwdsgs5r3Yg1VjidQf4bd1p68yPtKjt
	 hcKexf22HQhcHXxAIA6AqTsbWdNseueG46m+kwOehTQshWaOyKKe/geb6koJWLni8t
	 yb64ORX73U4d82W4TottqTSKBOvgf3aXPR9Ic/s3zXWZiF7o2eKDOtWD5CPburWfGN
	 PKvcervMzSyfEQTVtxqeGxnngIrYvm6aryLb7z0jxvveVH3G5zhH5Lawrz+6GIa0we
	 JlzaYfNRUbZ9019emFTgEP5Xv2F7dPUZOZ/uBHurURXDFnvNPRkggNqCsCH+Bq16gc
	 sHdpkZ0B5CcHw==
Date: Wed, 29 Jul 2026 10:18:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] crypto: qce - Remove driver
Message-ID: <20260729171850.GA4454@quark>
References: <20260724141414.GB1876@sol>
 <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
 <2026072455-subtly-prayer-0a8a@gregkh>
 <20260724150932.GA6763@sol>
 <2026072428-ungodly-outsource-b20c@gregkh>
 <20260724155144.GA2032@sol>
 <20260728152241.GA4281@quark>
 <15904301-fd03-45e5-b909-dfce52449726@kernel.org>
 <20260729145520.GA1702@sol>
 <50d9d0e4-28c9-42b6-8b71-e75682b4959c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50d9d0e4-28c9-42b6-8b71-e75682b4959c@oss.qualcomm.com>
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

On Wed, Jul 29, 2026 at 06:55:20PM +0200, Konrad Dybcio wrote:
> >> Unfortunately removing it drains way more battery, because the buses
> >> never hit sync_state and are kept at their maximum frequencies:
> >>
> >> [   18.021823] qnoc-glymur interconnect-1: sync_state() pending due to 1dfa000.crypto
> >> [   18.029605] qnoc-glymur 16e0000.interconnect: sync_state() pending due to 1dfa000.crypto
> >>
> >> (it transiently also pins DRAM and friends to max-freq which absolutely
> >> kills battery life)
> > 
> > Isn't that easily fixable by marking the node as "disabled" in the
> > device tree, or even just deleting it entirely?
> 
> Avoided? Yes. Fixed? No. The DT is valid but Linux can't deal with it
> [since the driver is gone]

If needed we can keep a stub driver that just disables power and doesn't
register anything with the crypto API.  I can send a patch that does
that.

This is an interesting twist though, because it means the claim that
people can just disable this driver in their kconfig to avoid the
problems in it (which is being used as justification for keeping it) is
actually false as well.  As well as the claim that adding the node to
the DT file is "just describing the hardware" and has no impact.

This would also imply that no driver using this sync_state mechanism can
ever be completely removed from Linux, ever, which seems odd.

- Eric

