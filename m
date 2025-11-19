Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A72BCF2592
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 07:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Cc:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7FPIIPqguMBGK80Eu0/GYCdp66S9qABzZqZQoPkk/c=; b=WqwlcD28zdR8qk
	tyPkEv45fBd9z6gJtuqOD7RaNeSV4fd/PFKNtK9RNzRVNH5Zb8ApR6HPNGjjcp65sLrXzRCEZpNFD
	zXs6/ddZtfBiAXiNzgv4P8JfiqK4jXBhw/ZX0HZo6b6b+ngbp/FkWa9KCnQkw2Jikz0JoEH9S/xPq
	cDvXWfCz90C7WKnA5wNhexFevp7sp8u5EUR+6otc/lCXsc4Coqb2vIZGiKqsu0ahQaZIqSlYkxyDM
	84wQgEh/e7MAen2w0CyYaTUKlWZNh+et3YG/aLF80fAaWX9eRSJj4iDbgDe6Y+GTHFGsffVAz8sg2
	P0yFFpqSAH614N+8j/+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcgb-00000002iLc-3ZMN;
	Wed, 19 Nov 2025 07:33:05 +0000
Received: from tiger.tulip.relay.mailchannels.net ([23.83.218.248])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcgZ-00000002iKL-2C56;
	Wed, 19 Nov 2025 07:33:04 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id CC7508A276B;
	Wed, 19 Nov 2025 07:33:01 +0000 (UTC)
Received: from fr-int-smtpout19.hostinger.io (100-96-202-146.trex-nlb.outbound.svc.cluster.local [100.96.202.146])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 81BBB8A26F5;
	Wed, 19 Nov 2025 07:32:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1763537581;
	b=qH3njPfspa4Y6/4DYMNHxGXgrrRa3zUfs7dysJvaAX9oSpIdqHyV/XKOH7W2mrfC2ZQYy6
	DLv63P47j+iof30AvPBTS43FdgNKLPF3j7gSF47KBVxk7gWi00g1eBehHVroxLcdSpUxwO
	Cz7fDwCxUCiki1wa2W9vGQmuYs3cq2S2fEOXA7S82R/7/8gWCbuxrQIctSP3j9zpfapZiB
	G0ACc98mBtpNpmARGyQQMXGyza86jnOkRC+OG52Ce66WtcQ0MqX94jBWtKxjykxgXgRoa7
	kgzQHqAr0uW3Z3O8GMdRXU1SL+xBn/yuuOlcvdJaVDNSyondDiF5Zp3XUZNWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1763537581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=T7FPIIPqguMBGK80Eu0/GYCdp66S9qABzZqZQoPkk/c=;
	b=Lx87qnKW7tqWqFR4BbJ9gFcnmeMS2aGCQo/tJcvYaciklvqyMIaT0cpZnBXyMfuK9NULqG
	pmjRjNshSfvrjBT9X9pBFWrojR7qm5pl72oL97U81eafItiRKK54tqBMwyweyavl0mNV1V
	0de8jkxXf1Fa0al3gcmImIKfyvDmPwn8OGq4K4ymC7RekQVTlXcHDJm+W8PlO2t7PudrtN
	rKn2b7PSlKNa9F1wF64PVRAin6dTI75rG0JsBrHMXtxh/V0/E/i9PvEyYANRiUJ7SNck9G
	MLY5lQHMnbTAcjUFVODmdbgb4REXcPq4nUhneoT1rdjNwanDITin+gt/qP6UVg==
ARC-Authentication-Results: i=1;
	rspamd-55b59744f-5rtcb;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Language-Ski: 210e651045f8322f_1763537581705_2679991986
X-MC-Loop-Signature: 1763537581705:1368043681
X-MC-Ingress-Time: 1763537581705
Received: from fr-int-smtpout19.hostinger.io (fr-int-smtpout19.hostinger.io
 [148.222.54.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.202.146 (trex/7.1.3);
	Wed, 19 Nov 2025 07:33:01 +0000
Received: from [IPV6:2001:861:4450:d360:c546:29e2:335f:d5df] (unknown [IPv6:2001:861:4450:d360:c546:29e2:335f:d5df])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dBCr91X4tz1xxj;
	Wed, 19 Nov 2025 07:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1763537577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T7FPIIPqguMBGK80Eu0/GYCdp66S9qABzZqZQoPkk/c=;
	b=WUctF8RmXDPWCkw1ejnEA/deye1/YCPQPq4wZRx1lsAZUheZ6W72oOed6+i0wjJSVIamRU
	K1EgbJpTReEiWohfd5vvm1Q0PS/OBw6j9gXrzOEL/DthdQ0WFLAOZ3/QoNIOV/OvdBKtw7
	3RFJZxlkwHUr/W3u6b2HnaWMApM9iYf3Vb0i8+sGJt18ZICj3nSS8Pb5i5WDsRj7HkTGch
	uyQCNJeUNBdA0UQj+SQ9y26LQnj6QnraDZUhrocFFjqt9wnkmP7xvNtz2Dhcq3Lf5XE0D5
	Ph303RMFKd8g/EIj4Ew48WHHhz830CHGTBXsvyiNjl1GmAmXBqfwWxUhPeT2TA==
Message-ID: <d6b3ca5a-e036-4019-8f4f-428d4d132f2f@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add Asus Tinker Board
 3/3S
To: Dragan Simic <dsimic@manjaro.org>, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251118-tinker3-v3-0-2903693f2ebb@rootcommit.com>
 <20251118-tinker3-v3-1-2903693f2ebb@rootcommit.com>
 <155d3d05-49f8-a000-6939-1411917745bb@manjaro.org>
 <e7417a6e-3824-48f7-af56-eaf4bf097cb9@kernel.org>
 <b8e91b59-afb1-6d0d-4709-c7f76ded0e18@manjaro.org>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <b8e91b59-afb1-6d0d-4709-c7f76ded0e18@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 19 Nov 2025 07:32:57 +0000 (UTC)
X-CM-Envelope: MS4xfLaeISHAFTUmvcbpnL6lH5D0hiEa0ZwcDeNTq39xSpVmqC1zb5gbnXm55IF2cAwm3koLEvtAzTxZKxyO/v7PM7kOtSI4HzQCNsGjJu2J9WrRJxkQifP6 m/XaejMx5rQWb8pJn1N+dt33nprANSJn98XCE3t66JiVXmNcDA0RZiAneCgZ/OvGN6dtuBMvU+rOhdRTOnog8cf1RtSK+QOD4Xct3um9CLZfxI5kPn1XK0Vu qFgVzkWSYmHW01xM1LYSfuqDpxfUbbgf8GHCbVLsXweLCQU+K1NiPp7DOgsKK0mYuqPRm2x1AzMxYT+bdLtNmPQbxlMTVjye20J2zuuI98i6tzXyHSx5dn2l AxIV6Fqck4vVx+3JYRZDlH7tW25Dwm76bwGIftDjTatthFWFkjtQnhyPD6432aSBIRCkQayuBTQ00+wzLYcbnuTmJ8b3nP779mZlTVcdFVuTkDGRRn0FIY80 7mCdBXY4dKYiylrbPTvAEKpfQVVndjuYXy6ZpnD89okH/XMsKJtpTFa40FfA0aU4Kl0Xd99/ByFLi39onVxSWDDixw5TfuLY0hElfJLHllwdl+xmpubJoQ/e HbiBAd4GEuo4hJE64JfW0kFFdIf5AA0ftFqn445A5A8iipRw+RKr/q/n9lLaLiWNHlZvkNMUihwp1+rz+iUv70K1r6qOKr3Z1k0AdB0C7zhQ3TGs3xm3zyEh pi9/VkZqFTZ8LnOLuLgMYLfsp+RXMEgs
X-CM-Analysis: v=2.4 cv=Lflu6Sfi c=1 sm=1 tr=0 ts=691d72a9 a=ZT5r2a33aVEFtXz168a3Sg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=e6NoAuRXJklMgYph6uQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_233303_699528_0069CE89 
X-CRM114-Status: UNSURE (   9.27  )
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


On 11/19/25 08:23, Dragan Simic wrote:
> No, I'm not suggesting that the series goes back to v2, but Michael
> failed to give me enough time to respond.  If that were the case,
> the v3 would've been in nicer shape, with, from my point of view, no
> need for further adjustments.

I'm sorry if I caused trouble.

I agree I didn't leave you much time to react to my reply to your 
review. What happens is that I'm new to this subsystem and I was feeling 
some pressure to avoid missing the launch window for 6.19, which I don't 
know exactly when it will be.

Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


