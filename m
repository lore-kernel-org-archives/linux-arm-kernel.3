Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECE91088E42
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 22:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1myLUp5Tc1S7jlKg7VBZyHnNtLYo0bwBC2G3B53l9os=; b=BF9fLvkAG8s99RXdPhCos/2oJb
	yxMXlpWQiXVB0Hlt2wwlm1tPgY0j78Jps2XlFaXRgHSlwbnw+UT1mwvMqByNXZvpfbRhII1aanEc9
	YXmNJDQ0xH5Tazy2Q7syMGmSjLyQV0JHZchsJhenKWj8RNGs5vrDHzK0ZHpnDx4YcvFCXkizMoia6
	OIbmHWimzVVegdBnbIm+5mx0ChXhQHYoI31Ucs1laHdh8F29LrC53oHbwgFu81sg3raKSpQ1AL2fA
	xKCafqwm/OaWFKbQOOjhS7QEnTQOOAx1xlyROZ26IzyOUcR0B7zlzCHyeKTm5ceY95QlRklO9IgVX
	7DoxfhoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2zJK-00000009QtN-0dfP;
	Wed, 18 Mar 2026 22:24:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2zJG-00000009Qt2-3tm8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 22:24:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E6CA416F8;
	Wed, 18 Mar 2026 22:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BC8C19421;
	Wed, 18 Mar 2026 22:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773872653;
	bh=h6ndzAFvIQVHqH354HE+77ZIUYrbNgvOw6/MHKSXkcg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OUAwZl2mzfE6ZOYdjgXflyKsVp07YDgb/YHhAMsj6KAffhy3k44djep/2i4RjEsDH
	 DgCO455CMfC5YLsj77FsAcijiCBVU3b59EcTx/x4Kr74UwesFclFSemVn0HmwAWIDg
	 /IzFB520uDimKtkJ0sqtTcXd7xJYan/Ow23b3Yqakompc8vBYgW3JoTimW47hLJR4B
	 +eFGnHcP8jwuKGDnTJyJai0Of7NfJ/0HF0AeJjbjSZKWcdtn2EzLQcGsAWnKZtY5fu
	 WHYwaN4C9dnWdiUHWDmCYIM+8Yfcsv37Qz+K1NxmIvA9Az7Ygs7dPwCnkawFsehwDx
	 9RJQ2HPwFHPXA==
Date: Wed, 18 Mar 2026 15:24:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Simon Horman <horms@kernel.org>, wei.fang@nxp.com,
 netdev@vger.kernel.org, xiaoning.wang@nxp.com, vladimir.oltean@nxp.com,
 davem@davemloft.net, linuxppc-dev@lists.ozlabs.org, krzk+dt@kernel.org,
 frank.li@nxp.com, claudiu.manoil@nxp.com, chleroy@kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 imx@lists.linux.dev, pabeni@redhat.com, f.fainelli@gmail.com,
 linux@armlinux.org.uk, edumazet@google.com, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, linux-arm-kernel@lists.infradead.org
Subject: Re: [net-next,13/14] net: dsa: netc: initialize buffer bool table
 and implement flow-control
Message-ID: <20260318152408.002d1bd6@kernel.org>
In-Reply-To: <3dab3f5b-fb94-4c63-bcfd-aad4268e2ac3@kernel.org>
References: <20260316094152.1558671-14-wei.fang@nxp.com>
	<20260318145452.1898637-2-horms@kernel.org>
	<3dab3f5b-fb94-4c63-bcfd-aad4268e2ac3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_152415_004581_FEB5CDF1 
X-CRM114-Status: GOOD (  11.71  )
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

On Wed, 18 Mar 2026 15:56:39 +0100 Krzysztof Kozlowski wrote:
> On 18/03/2026 15:54, Simon Horman wrote:
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least plausible.
> 
> Why are you removing the "PATCH" part in the email subject?
> 
> This completely messes up with the filters and causes this email to pop
> up in places it should not.

Sorry about that :/ We pull patch info form patchwork and for some
reason patchwork uses this notation for the "name" of the patch
when showing the list of patches in series info.

I'll hack up the scripts to fetch real thing from lore.

