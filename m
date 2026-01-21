Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1FAD262B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 07:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKCBa6LC63ySO6wxtyOEHj7+hfHaWtIUCg/hVqZDPyQ=; b=S8jAs80+BVUCaMrYfx+H10YJYK
	zYaC8U0taZdS6tuAxUQw0QYCrOGgVEsGaUZAJ5Z9sMDQ6ZyhPr/hy9HkirkUNuxs5RTqGBrzsx0Xi
	CPCWc5A1c8VGIzsyBrsQi++Bg8Q/mLPMsJT0PyT/Oh9pezHjTFxrtti1JIp0pM/HJBptOz7iu97WW
	f/H3suNy4uxJHpYac+r2kDV1yusA0E98y5djx2A+P5jiw2PEekxYWzxBzMmCbLMFteUKsAJ0CDoPZ
	W3cQywoy8W2ZGRLBGa9s9akN8+w0ywsbgJNkRuaKlpYwQidstshj1Xquw6NgDtmGX14bJgr5va6Od
	IShe62hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSJJ-00000004zCR-1qUF;
	Wed, 21 Jan 2026 07:07:25 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSJF-00000004zBf-3okx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 07:07:23 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c5513f598c0so2409804a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 23:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768979240; x=1769584040; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EKCBa6LC63ySO6wxtyOEHj7+hfHaWtIUCg/hVqZDPyQ=;
        b=c/7fKrKBrHmq4frhxeY16Q+lIxKrTIHcHbsLaMd6KEm0o3Mob1R0rt4acJEVLKtpZq
         StIhqq8bLTAaizQvsYswXWkmf1tZbnpGHHE2R60ZjDmuHA1Ff4VYnEFbn7iN7WPkHitN
         n6UcMvYDQ9rv42jCnsM8vDGJ+Jfu4MFqZkTycajdDu27AxB0SYenWa2966TpszM6iCMt
         8b+5e83WZ961HAoO5RyTPMbz1fivF9amndGRXaxFXYiOoxOxhfGpvYSXBeHSN1u61AsQ
         DfxeM2pQFrEdEOIMvIJHVC3Dk1Ppp2tR/rXjSgLpywyh8LH07LPWCp6WEPWp6c9zgSRp
         c+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768979240; x=1769584040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKCBa6LC63ySO6wxtyOEHj7+hfHaWtIUCg/hVqZDPyQ=;
        b=KL3w/SB+Q6Lz+kHxS+7Jwv3qP9c+WIqZOLyunji2cN68HiiVo/H6FJKCXOUQ2sPrhz
         R1wnKArPpYGZ3vACEH+4pgLscQdc6CXnE0F7E0/mFpKgdAEAtgwPtA1dTtGKxDzWPN5M
         RFwNfhmwuDtYJvy87s1U3A1vBI5B0VkhnmzhHlhkN6iOZsc6rf34OVcy7MGHNVI9PoZ4
         jpfFcty+3f5YqrjXvX6Di314V1BUK7SSbhaC7U1npZrkfMNse99eOj02VBBWcP0HMHXN
         1oSxUZTNVO5e9n2Q1hTi7CkJnpwa4nho5L8PwkqBSRUvX9ECKrG3NO5ND4hsLmQEI9LF
         q+pw==
X-Forwarded-Encrypted: i=1; AJvYcCWQFr7dsJpR6xqASYiWxb8KJ788yggjVZ4r+SB7Iihs/koHUe4vI0lwbkOtVQ+f/RgELCm0V8/H5gv3CGWlMftn@lists.infradead.org
X-Gm-Message-State: AOJu0YxEcNyj4YQ7BmacA7WRooqpdJW66ks1UhK37mRAuD+X/YwKpa2Y
	3VjuU5D4KO1QPhQWT3g0KDqP4+Kz2MdZ+Fg5n4Hefu9gWU0lcfe7AO6hl9sHimciSfU=
X-Gm-Gg: AZuq6aI2gZTRJhbG6viz1E8xnlo6JD+pzBhrZXdq3018S1V7lnMfiEAXKkAcHmR1yNX
	EBHB04kbTxo01TJKog36tR18Mw1V6XzCaOzBy0ZgA98TgV1sL/H1VUu9Cng/uLM4ApNpbEG8zbp
	ec+uWTybSWn7WgjfRhLN7rs9SW/3YZwUEBWsPGh5nCxb4ksJ5WI+Xr1K5dJLhRODCf/I8ryfZeM
	z+gFiWmBTWLwEv+MntiVk66nYD05pDIAp8bldD8uysruT7tj4HMBo1ZWaE8+Dv/ZCTOze9hywEP
	kS+SoAE0tHWR6BcR6NQKFryfCvbVT6H1V5hZyDspfBl8YUjZzK+JiEf84NnLslH1cRndW2SatHT
	vlgKjEanmE2bv4YIfZFLJcOmYIF76Z5stB4N4MoWP4jHTr7K6EJtE3Dq2t5alr1MBX/vGpA7aRj
	vE8m2tqh4R5O4=
X-Received: by 2002:a17:903:1110:b0:271:479d:3dcb with SMTP id d9443c01a7336-2a717518996mr160044275ad.6.1768979240300;
        Tue, 20 Jan 2026 23:07:20 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9f0dsm143860365ad.31.2026.01.20.23.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 23:07:19 -0800 (PST)
Date: Wed, 21 Jan 2026 12:37:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dhruva Gole <d-gole@ti.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kendall Willis <k-willis@ti.com>, Sebin Francis <sebin.francis@ti.com>, Bryan Brattlof <bb@ti.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/3] cpufreq: ti: Add support for AM62L3 SoC
Message-ID: <jix4pxfxdxyald22fpobt2hmobox27z6fgroo4pevvt645kj44@s5lxh2ifo4q2>
References: <20260120-am62l-cpufreq-v3-0-8c69b80168a3@ti.com>
 <yjpk2duxzham3ky7bvsu3majkjlypkvnc23dsxenfx4ykejpcp@uuohmp63qhwk>
 <20260121063840.tngolbewageekveb@lcpd911>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121063840.tngolbewageekveb@lcpd911>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_230721_975441_206FEF8C 
X-CRM114-Status: GOOD (  19.24  )
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

On 21-01-26, 12:08, Dhruva Gole wrote:
> On Jan 21, 2026 at 11:58:23 +0530, Viresh Kumar wrote:
> > On 20-01-26, 17:17, Dhruva Gole wrote:
> > > Hello,
> > > 
> > > This series adds CPU frequency scaling support for the TI AM62L3 SoC.
> > > 
> > > The AM62L3 is a low-power, low-cost SoC from Texas Instruments. This
> > > series enables cpufreq support by:
> > > 1. Adding the SoC to the cpufreq-dt-platdev blocklist to prevent the generic driver from probing.
> > > 2. Extending the ti-cpufreq driver to support AM62L3 speed grading by reading the efuse.
> > > 3. Updating the device tree with the necessary operating points and clock configurations.
> > > 
> > > Tested on AM62L3 EVM [1]
> > > 
> > > [1] https://gist.github.com/DhruvaG2000/6dcceb80cf7bbd1e624ec210532538cb
> > > 
> > > Signed-off-by: Dhruva Gole <d-gole@ti.com>
> > 
> > I should be applying only patch 1 and 3 ?

Ahh, I meant 1 and 2.

> >From what I spoke with Nishanth yesterday, the DT patch (3/3) will have to go via
> his tree as it's ti-k3.
> 
> The first 2 patches are the cpufreq subsystem ones, once you apply those
> and they are integrated Nishanth can pick up the DT patch.

Applied. Thanks.

-- 
viresh

