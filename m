Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6541C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 14:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6fguuMQvA/MfWZg3bKEs0LttFy2V+qGCa/r7RiorQI=; b=uXgWcHUTQe8kvoTPJlCHiHF/LD
	t6BeDBevomP90a4oS1skSx9oV23D44Somb8RTs3x7UyyThKeWO4zoHLa3NAC9LwLcjS9UIxTw7CWR
	BdA/q8hvL8aBOagKHoVAuRIFzDeCNp9Aafe1dxw0WF5tKq4/WUAj7AU6FuY1KARxRWuBStXWOV/sH
	Jm3d0asnt+NMxpxvXr+rd/+7rvImgxwUfyTTF7g5rvC7xmoV9sKOvlyuSle3MX1AVEsehaB/KfuhP
	sEdY97t0Atu3KulGfK6Pd3nMR53sKPZ5sVdyxQZqN9Q6nlQI/aHyiFG01ZzVDWmynEgYvo94dj7v/
	RQShpcIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5if-00000008Jcc-1ob0;
	Wed, 29 Jul 2026 14:57:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5ie-00000008JbE-1HNA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 14:57:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BC52D60A74;
	Wed, 29 Jul 2026 14:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287D41F000E9;
	Wed, 29 Jul 2026 14:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785337035;
	bh=U6fguuMQvA/MfWZg3bKEs0LttFy2V+qGCa/r7RiorQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d9pZ74GYFz+/wO7yEUYQUYA4eG563SinZFbj3AmpkDhau19ceInU2IR8UkDvWy0HZ
	 QabS27Ngd0NcrctZMeg1dFQTmkcaCOADDqUYCoQTv8Zg7FRmPh4Jha8g1R7ZG0s13S
	 DNLDXaurX4sYP2dY5tezpWvFsO9P6mIm3XOd8kB+3+Sdj/fFjp4+ldIC5Id9CRyZMb
	 ylpjn+DthbU2NQXMu1WNCFt1LwPxThL+BYlIDG3RMT+6v0OxDLFHzJjd+KdGyJYFhZ
	 ARRmFE6duFxV0922w97ZOm+o0mi0aFedUoelkCJmWQUipABA0nDGaMjkvZwJ6B355y
	 KSa4I4OljZakg==
Date: Wed, 29 Jul 2026 07:55:20 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] crypto: qce - Remove driver
Message-ID: <20260729145520.GA1702@sol>
References: <2026072412-decrease-sandbag-70a1@gregkh>
 <CAMRc=MeFoG0UXYOAqYhCiKBTs12EjX2-Bz4wDnbeYXmQA3-OaQ@mail.gmail.com>
 <20260724141414.GB1876@sol>
 <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
 <2026072455-subtly-prayer-0a8a@gregkh>
 <20260724150932.GA6763@sol>
 <2026072428-ungodly-outsource-b20c@gregkh>
 <20260724155144.GA2032@sol>
 <20260728152241.GA4281@quark>
 <15904301-fd03-45e5-b909-dfce52449726@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15904301-fd03-45e5-b909-dfce52449726@kernel.org>
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

On Wed, Jul 29, 2026 at 10:02:27AM +0200, Konrad Dybcio wrote:
> On 7/28/26 5:22 PM, Eric Biggers wrote:
> > On Fri, Jul 24, 2026 at 08:51:44AM -0700, Eric Biggers wrote:
> >> It is consuming a lot of the community's time to help maintain,
> >> including dealing with LLM-found bugs, with no clear benefit to anyone.
> >> Even considering *just today* we can see someone sent a bug fix:
> >> https://lore.kernel.org/linux-crypto/20260724081537.191992-2-thorsten.blum@linux.dev/
> > 
> > Another example:
> > https://lore.kernel.org/linux-crypto/d5de5a55-eb35-4ad5-8d53-12e188e156cb@oss.qualcomm.com/
> > 
> >> It definitely *was* causing problems before it was disabled via the
> >> crypto priority system (which made it unused in the kernel) and dropped
> >> it from AF_ALG (which removed most of the unprivileged attack surface).
> >> When anyone accidentally used it, it caused at least a huge performance
> >> problem, and sometimes other problems too like filesystem hangs.  It was
> >> an issue for years.
> > 
> > This actually seems to have been an overly-optimistic characterization!
> > As per
> > https://lore.kernel.org/linux-crypto/d5de5a55-eb35-4ad5-8d53-12e188e156cb@oss.qualcomm.com/
> > this driver drains the battery on every system with the module loaded,
> > even when no crypto requests are actually sent to it.
> 
> Unfortunately removing it drains way more battery, because the buses
> never hit sync_state and are kept at their maximum frequencies:
> 
> [   18.021823] qnoc-glymur interconnect-1: sync_state() pending due to 1dfa000.crypto
> [   18.029605] qnoc-glymur 16e0000.interconnect: sync_state() pending due to 1dfa000.crypto
> 
> (it transiently also pins DRAM and friends to max-freq which absolutely
> kills battery life)

Isn't that easily fixable by marking the node as "disabled" in the
device tree, or even just deleting it entirely?

- Eric

