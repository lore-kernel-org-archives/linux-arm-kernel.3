Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A534EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 13:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2V4LbzxXVRL8YYXBVPJDpy9FMQZDKpcQI4DTiuPtGRM=; b=RSSe+89yJhMLVKwUVVc84Dxq2E
	3ORrWIijY16KXY8YyVSYPRnMWcqflpiVuH5lpjCK6zie6Ce/TLcWAmVnk89nZPFf0lM2nd1n6kIrq
	g7lP2MqbjijHYHWYiR93vrpcgnq2x0HHb8CBtaEtRWPd/fUtQPnSqty+HWcwOI6iHHikPsW176pHF
	5gQLEdyaZLZT2Pi88dGwsHRi4i9MopNdp/2GIMPu8ck85q8bRBHGgzSzSyxB7VeKADVGK57pckLEv
	hIoElBZU3eyl3TZZ/uiVV7YZp2ZWlbDhzA6VmzVFcHeGT7+4p4dm8+uOPIoDTlNjsg2vzpcbjihSs
	NURi4z/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuV9j-00000000i33-00Gw;
	Thu, 13 Aug 2026 13:07:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuV9h-00000000i2g-14YA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 13:07:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DBC2600AD
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 13:07:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282741F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 13:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786626452;
	bh=2V4LbzxXVRL8YYXBVPJDpy9FMQZDKpcQI4DTiuPtGRM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=GUpPSu/UDE/kbIl3BJ/RVc2zcO5J8CXe7S3g8U/E8CFRWUd65fm/utkAv0QMeMT/p
	 ZJ+7U+K0KRvX3PZ+OV3qYDcot7EpMx9kYntOvtt+M6Iid5u0EFHTuO5EsNFunUFP//
	 /qW1GGzsH9GSd8aw+b4QB5vHcbgK2eDWQ+UZasKjtJxB5WwtIU0V3IHs0gRki6spxI
	 sd92oaskWHWei4+MpVeTLqmf+wWeJq/EHfT0tSATMu8panJoqzOrUaNkPG7BvBrfPh
	 QrB8jSJOiGkZi3bVCoPkfwUpPOXY+mPxGL5bg/I5NiWMbUtn6KrpkkW1OV8ktNJzo/
	 A683Pjtj8eBog==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c7fd21b63so17820201fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 06:07:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrNw4GxgBbkDu+1/+ih+V/oTjgrk7lU8lqrdxcI3qB43QjvnEioVjiOvAjrOvI3FFx6f9ToKVZnDLsGqz89vvRa@lists.infradead.org
X-Gm-Message-State: AOJu0YzdFtXRYg2rEUlGm4IzV/Ch8U31S8bGb70S3JQCiJPaPhRx4Z4q
	5NNOmSTKSx3DFV9T+HRwAMPMh4tYOLKYO3CsBRMizPubqFCZIOTE7IF+1wBOenAVvZLlvBNdWMk
	cK4sJ0nJqClkOp9v7I6UWt+wBylto9ofXHOsGD5zpjA==
X-Received: by 2002:a05:651c:43ce:10b0:39c:6d1f:2f13 with SMTP id
 38308e7fff4ca-3a11a5d087dmr5683661fa.13.1786626450893; Thu, 13 Aug 2026
 06:07:30 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 08:07:28 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 08:07:28 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260813-cv75-v3-b-v3-2-1d82e18da09b@ambarella.com>
MIME-Version: 1.0
References: <20260813-cv75-v3-b-v3-0-1d82e18da09b@ambarella.com> <20260813-cv75-v3-b-v3-2-1d82e18da09b@ambarella.com>
Date: Thu, 13 Aug 2026 08:07:28 -0500
X-Gmail-Original-Message-ID: <CAMRc=McWBqz3YyN8GUMLd6aZjvZ=wT2y6oUu81MgrpR-Dc4hWQ@mail.gmail.com>
X-Gm-Features: AUfX_mxQDHzznFCPjAFUr94xSbRi553VA-Ghe8BBzZsDyOuS_FyJt3JeSHnfmKY
Message-ID: <CAMRc=McWBqz3YyN8GUMLd6aZjvZ=wT2y6oUu81MgrpR-Dc4hWQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] gpio: pl061: add Ambarella CV75 register layout variant
To: longzhao@ambarella.com
Cc: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
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

On Thu, 13 Aug 2026 12:19:37 +0200, Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> said:
> From: Long Zhao <longzhao@ambarella.com>
>
> Extend gpio-pl061 with a per-variant register layout so the Ambarella
> CV75 GPIO banks can reuse the PL061 driver instead of a duplicate.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---

Devicetree bindings and driver code should be modified in separate patches.

Bartosz

