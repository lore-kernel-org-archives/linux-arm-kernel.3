Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8196CFD5F8F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 07:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nw2sk7Q/8E3OPh452L0/yYYa8JTilVd+ogYqqiYq0Jw=; b=VDYnjNy4gZEe1Ahtlrreyqcaqq
	UHxrRO+KtRvW+n94FRreAD2PEwNg6QhNLV6lqEC7+5e2I+xZ21LQoYIH6ZFJSgNFnAJaqeDSq8G9E
	v/ouDR5JrPaTCE5abmR9iX7BwCfDJR7Kl2VZZLRYcnHWYluyPEyJWAwYURqsSgk1hNlyajuaaPZD6
	2URBzYO3/CRei2WXwLwMs+L999TzNLB+ZEXOqiqnAP1tikcvQDm/wrJbufTZ7Pqk+OaRjpNXk3Dgy
	r3hV3QPOe7wdBl3cD8AuoYBfuuYwvmgrzhKLwKcFCR0kQlF6B4fHA0lbGCNf9rkCnySF+RTUKmY/D
	EMva/Ejw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANKi-00000008QrT-2PUH;
	Wed, 08 Apr 2026 07:28:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANKh-00000008QrA-3qxE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 07:28:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 230E860138
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 07:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4A6C2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 07:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775633294;
	bh=Nw2sk7Q/8E3OPh452L0/yYYa8JTilVd+ogYqqiYq0Jw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=jb/M7KbJrHNmO/tvpkrm33X6mgjuE8dRuYOuvR2qVgn3gjPyyw8huPqxoMpGld33/
	 fw3tbQ2nB5xmBn5aKwW0jjQdlwYNgOamZw7POVAubtIPxMEJwRpEVmi3jMaTEEdcWt
	 4K4RE0dAsYAltsP4Mxp+ncIAnR29+ePtmfN/bXmC9wA/eD4iAV6PzuJ8/IrxQqQ0fV
	 1XwSy0k3sgq5uxzmSEvRbzjMCT0UpBgZm/+1tHFjO/9x7sVX+XAQwwHQBqYCqWlHn0
	 jZMjSentcvn+Nj8NDLdK7SxQSjXbQE5JJSo7vHk9JzVLZrEJucevlD/I94qK3/uqaX
	 FaC+VConRml/Q==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38dd5f28a4cso35861641fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 00:28:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJc19fGfis4ussof462/IlieHkz983LEK5whTJPtqrLDVG5ozSNeJHi3oXVlh5ivEJkn8WZMvNTREMSpeERcGZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8oz9djbc3atSGIn7it+Vpx3/uGiOJWgL1x3FYIp/WmQxuwTH6
	7zgD13MOcEHkBTapmgzgxu9aqwFyc6zsqArBoNLG+zMhB3zj+GOAxaR4jR6GVWB/aFIVOzOu4kZ
	2hWGK3T7C4KtLTRVhG+4Ym+MuXHg9DunBzyBubRMYcA==
X-Received: by 2002:a05:651c:3243:b0:38e:21bb:b2ad with SMTP id
 38308e7fff4ca-38e21bbb6d6mr9408481fa.2.1775633293381; Wed, 08 Apr 2026
 00:28:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Apr 2026 00:28:11 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Apr 2026 00:28:11 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260408025243.1155482-5-eleanor.lin@realtek.com>
MIME-Version: 1.0
References: <20260408025243.1155482-1-eleanor.lin@realtek.com> <20260408025243.1155482-5-eleanor.lin@realtek.com>
Date: Wed, 8 Apr 2026 00:28:11 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me+7aYyXFXjZBrenWnD8bgtyjHVWxK9GxA_U9tkrjih+Q@mail.gmail.com>
X-Gm-Features: AQROBzC0LREM6_b2VQH2egdCf2epMV8TXGX3wPxZfvA_VFti5llCq9nyDHkaPQM
Message-ID: <CAMRc=Me+7aYyXFXjZBrenWnD8bgtyjHVWxK9GxA_U9tkrjih+Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: realtek: Add GPIO support for RTD1625
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, cy.huang@realtek.com, 
	stanley_chang@realtek.com, james.tai@realtek.com, linusw@kernel.org, 
	brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, tychang@realtek.com
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 8 Apr 2026 04:52:43 +0200, Yu-Chun Lin <eleanor.lin@realtek.com> said:
> Add the GPIO node for the Realtek RTD1625 SoC.
>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

