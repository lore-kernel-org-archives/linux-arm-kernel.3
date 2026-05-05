Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E061BCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7Uwvr8MeFsSApFn56xtx5NITAqS9F0rWz+pR67Hm0s=; b=Lcvua7Hbu/PSvRrgx9MlWgH5H0
	FnVz705d2EVMI8qXc7GNFPRUGY8uacm0R7+aWICTfs6WvS9PXfuRAv9q5N4skRxyll6mLyb3VTGjL
	EbqGU6v7wWxId8VQ3/247vyOX7nnU4T1kvYlWL9ja99ET+GlKQe2howwkKTGHNveTvFOOXr59LePc
	m1dQOZzXBZkWuxAuIE5r21jyvB1BfAClOL/0cBd4UCqJXvXpoKXs7xPhX1oE/qvo9dCjP78UV0GTw
	ehe8fBysOe7/t4lIO9pUu18Ud2noSN1/8BQI9DH5pwBFD8AEmqXZNclvrAUDXZyvZE2hleNI4MarJ
	2bwJX1Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFen-0000000GJUP-3zS8;
	Tue, 05 May 2026 13:17:49 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFel-0000000GJTd-3Gaq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:17:48 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-12c45281a06so8167076c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 06:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777987067; x=1778591867; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+7Uwvr8MeFsSApFn56xtx5NITAqS9F0rWz+pR67Hm0s=;
        b=kduXifki2rFPO/SXOZ8c667BIbCpTr7zLglA4HITb+SoFtOO+xNwPKs6uDMofZl4Pl
         BvqOOx06qkCDaVFYN4/+oVd+wQv56Os6Q51sebEKcSfuFlxzSI8BpxuwmhEBYesU7eNB
         3KJyynwWCOxKCJR1DeduZrhq7HT9dEHtIRTiTmFR/nxV2qW5TCLErU2wW/8dsH9gCC1f
         qZanrf8yJRCZSw+nZgOKHBYFrJbGErQ0mtS3fd459YDFuZNIjmM5wlgQYCjWNRRO8STe
         f7QEUH01N2/l2EsD1GqBZgB6+JC4e55X+rT9zlEKCaQc35lHRzGyw/LGH3d++iaAQeIP
         prSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987067; x=1778591867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+7Uwvr8MeFsSApFn56xtx5NITAqS9F0rWz+pR67Hm0s=;
        b=PDTne6dKmbX5gnjAijBZYdBz2BvjZ+E0lSNEo3cTcdzZMO6LmODwK8p4kYlg7LMd6+
         aWNVN6DGOHrH1Z0KFAVmmRW2QLaqiz1EfPKsE0qyMjXxAfDna/+OPF7lLeNLfEmRwI9q
         VSLcTUurNUi7VJfslZwViSvZovfKECKRSRpY47tL+YPBiq6S0cESoaRyk0zS/eb3fXfu
         kW4hcur+NHXryXDNKXblPnTKipomNyz/uiCOfgHmIgzk//K575datHHh61Ol5uGOPUHd
         mBCYSNx7jzM4woKvXP0vhyDONYpjOkxa2YrZR2C/+6CT4pVSzIyOLS3NFzr5v4l8ds71
         ogyA==
X-Forwarded-Encrypted: i=1; AFNElJ/SZuz0XE5rYtcz7kNyXID6t/B8EC3ZzHPXSX5zJUsh4/CdZ73NH2dc9JzWxz5KksV0fFIuo1ibH61LZhSSOWBn@lists.infradead.org
X-Gm-Message-State: AOJu0YwzcvuWfg2OrgBkGvDBzxK41LrDta1h3gyA9UCBRCrO1R8W0VCo
	UIqSpe70p7urQ3v7TwmcmISkoqgkW8VoRmKlCPpaH49/VtlyRx+oajci
X-Gm-Gg: AeBDieszkyzIUazL++vh6w63xzzxPI3xcl9/7PBWw+BsXg3vb2Rv4Pkm3i6m1xE5NyH
	xLZQ6NOxkg/4nAFKOqMn2ELH1DTelw6XYHl8YOKIMQDn3w1SXbzNljG3ltTnH6LtggjhZLhul29
	DckWRNrDk65M/AydUBVb20a1LN3zGuxmZa2GYopqJu3Yhl3+i1Tziqhzi/PTZl5QCFbbxZgNNUR
	fY/JiPckTTjSrcCI95kA1IwLNrwtZa4B2NslEL7Vy864pNjisGPdRxrZdOuKwHLBStQ9h+Ni2K+
	Z1b/rlVuXfgfGPfbo6sxPMufcBpuMRPft1rp0u9IHezeWWTZM14DhYM+6z9L0IvY1X3EXm6Vo3A
	jD7p+XmAE2Gx4m7WlbXibd7qZ4eOwk3JfVkfkyRFz76c4t3Fgwfsnd3UHzosDCOAPZBK2bpjMMD
	N1mbm51VxhVWnwuzSmw0YEdMFw9mf/NAfm96aJeRU4RWjlQuY=
X-Received: by 2002:a05:7022:238e:b0:128:d352:bf8a with SMTP id a92af1059eb24-130b1c72299mr1458737c88.33.1777987066539;
        Tue, 05 May 2026 06:17:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df827a73fsm18173052c88.1.2026.05.05.06.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:17:46 -0700 (PDT)
Date: Tue, 5 May 2026 06:17:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org,
	Joshua Peisach <jpeisach@ubuntu.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: watchdog: apple,wdt: Add t8122
 compatible
Message-ID: <5856030a-4d3e-4d1a-928b-f9aa0b21f1a7@roeck-us.net>
References: <20260505-apple-m3-initial-devicetrees-v2-0-b0c2f3519e0e@jannau.net>
 <20260505-apple-m3-initial-devicetrees-v2-3-b0c2f3519e0e@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-apple-m3-initial-devicetrees-v2-3-b0c2f3519e0e@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_061747_818968_C14BD057 
X-CRM114-Status: GOOD (  10.74  )
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

On Tue, May 05, 2026 at 01:02:41PM +0200, Janne Grunau wrote:
> The watchdog on the Apple silicon t8122 (M3) SoC is compatible with the
> existing driver. Add "apple,t8122-wdt" as SoC specific compatible under
> "apple,t8103-wdt" used by the driver.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Janne Grunau <j@jannau.net>

Applied to my watchdog-next branch.

Thanks,
Guenter

