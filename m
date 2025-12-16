Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F0DD5B161
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 06:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6h0HpTE4JvNO401sC9YC1zjzbkEMY4YQbWy6fAX6+G0=; b=E0cz/ZVW1GyAICdOM4B4DCgYn7
	Yt7UJdc/xJDGVxyxhttnArEXe2QhxsedN0Umd9+CE+RNr/9dKgw9IGdzbWl885Ek1o92GDJKrlwKe
	bnhr9VrMC7+PDC34WktADF/IbVWej6qa/Bbab7nr2wBLka/e8nXDsysmpX0ttJrQlqAOOyi0231DA
	xESQC54cmQ7RQ/aNNzCM7V+cLuSsTyvAaoxgJ5MfIGAM+mDQj5vUFtqE6VscXXlDUI6FGmPWoGSyL
	mpxqoL/kp/5uMJ7ye7vYGMQ0UQYzQCjp6c8d26voa+HHsgmF97LJfhaWq8osM3HGAr316iFtsYKUy
	aT6iu48w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOHR-00000004lAW-0Q9P;
	Tue, 16 Dec 2025 06:11:29 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOHO-00000004l9I-1Txf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 06:11:27 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-34c5f0222b0so1855624a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 22:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765865485; x=1766470285; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6h0HpTE4JvNO401sC9YC1zjzbkEMY4YQbWy6fAX6+G0=;
        b=YGeTQ0aCg5XrWVTGu8ytIS6qRLW7bu8p/9W31z4nUtETGMJPJn+yRghpthamw3U3Nj
         1sEo2L8FyV/CPplW5Pxgp0vr9UMWRwsNEwbjrzclpXIOkIRALuRpoOfbs2lbK62npWB+
         lmOJilwqOFy7WfCpLsyUCEIMOw2dv2w1842ONPlAULLcErcngfac2XkCxZEvXfQ3Jg4K
         CreBZ+0i5IiVqYcUWb2/MJuTHwd5kWdKaf1JlNAEW0KPRs3ZYRc8WBJsgp2WImd6pdNW
         /27C4tSMhoSot7yK7UMn3w0XztbXRQgh/NyV2EqAJZsLRu9ApO3XDll47S6oUQ7Fd2z5
         Su+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765865485; x=1766470285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6h0HpTE4JvNO401sC9YC1zjzbkEMY4YQbWy6fAX6+G0=;
        b=HiIQ2V/mnFT2F4BSLRvEl3RWNiVk0f2qW2gBvmE0SuGa+WKn4HisR4dwqeJTYVsVyh
         8IKUw1uvENKDfKdzf9w6uHuztPOn3O2/E2TCwj7Y6GYLxtp/qLAVeYh7wxS55vWG20a/
         VH/cfxdNZQNfEyZJVWJj/sXttdlGuu0MddeFccwKBoyvHj5IhTKLqumN2x5wpTe6DqJr
         eFbFMdg0c7HPXFsxhrjKfs970pkfz1dRGgMt0w4zghdwBCm4hGz9ObAaN2jINfjfdhEa
         QA+kZorT5JVt7oto/XasRnKbdWYvIMvtSAEdilbhx6MqklUhrG4LHnVmV93UbdwN/3rD
         KgTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6u+qp2UvB5RkIxJWqHxigUZ6jhYL6a3fJfarAHn26G2fL2hOq9C7fZ1V+YVvYQX/VgCVbBb5XqEJfSzVcccEN@lists.infradead.org
X-Gm-Message-State: AOJu0YzxqQH1wMp2Oqikggn0LLmarE9XeENlHomlREHsDyfvOPBSwXg/
	oHL20szenSQJY+p8LatnYnXWHmFSuCupSEH9hFDKaXZwom24t2y2OrGd
X-Gm-Gg: AY/fxX7KPSsXPPm2YXiqsE9D0Rcv0scCMcYv+niOUypUZFXRQ71ROvwyjnMSOwU0qVR
	jrtlyy5Jqzu1xzxxtT600pJVCt+8GeuimjI9T21BLiYJ5al1G8L7P1TEQ71bBSsUpWQEkf/ItrJ
	r7xVs6i1PPGci4Q4x3JjXZ6+lIJpnKx531zzUdvRHGZPi4+K87ZE/ojiBYZXHZjuvraVW8ZBv/X
	4hAuYYzUt7hPXD/Gl2z+xV+B7TBZdtGQrdtxm2l5or87ZwLU3nsycPtZoJv/Bqlq9KDX0i286s5
	RAezRa4MhglU6maqghlCcXPZEFpXRTbBHwK3AWJC5FNdHiinhpGz8PeWZl+OuyKSOlIqKl04g/O
	zBnEAohwQ+aMm9Zp5JtwORnIAiCHuDhvlq6gZ2Raog+hNm9v2aNUY5NEuncJBq8bZMGpy92Dzn2
	OIywW6kB95qvOscf639L3ObM7yXeHgQRvEpyu3L33Rcw2s87O/3Pk=
X-Google-Smtp-Source: AGHT+IFJAmO+3G7br6lpUjw9es7pGYzNlpGk5tFUMnsEsBNlQ1wUjlSd5k+lWHPv3a/dqdPQEiCn/w==
X-Received: by 2002:a05:7022:ea43:b0:11b:b622:cad9 with SMTP id a92af1059eb24-11f34c02663mr7682270c88.21.1765865485165;
        Mon, 15 Dec 2025 22:11:25 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ac28:4c61:4797:3d5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b46f5sm49975086c88.5.2025.12.15.22.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 22:11:12 -0800 (PST)
Date: Mon, 15 Dec 2025 22:11:07 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Petr Hodina <petr.hodina@protonmail.com>, 
	Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] Input: stmfts - Make comments correct
Message-ID: <yc65vlbqkok72lnidezzrivfvz6sdserm7jazmu4uwivbqufpa@we6qlhaufwlt>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
 <20251215-fts-fixes-v1-2-8c1e3a63ebf1@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-fts-fixes-v1-2-8c1e3a63ebf1@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_221126_958225_2BF2A7DD 
X-CRM114-Status: UNSURE (   9.78  )
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

On Mon, Dec 15, 2025 at 03:30:02PM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> No functional change.
> 
> Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thank you.

-- 
Dmitry

