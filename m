Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A081E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 13:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwV2GgfYgr5UdBENZMSzRUo1xJg7R/oTcoZ82PXZETI=; b=CyoyTGNGUVkuXIrxcKjeTwZltU
	x6APdzJxCXkNNwe0Q0AKQBbjXrw+IXY7wHI4M7Tp59SsMXLTuoWooE2pPPVKtazgqJOiqvWjqx1Zt
	ZzGo9yQQK2RVJ5/kAf7hwAbjimg3fW034IeEWvVUfKqnBHPcYH7nO+KOtARhrLIlnb6EWplq3w6EZ
	F96F5ZvyV+rfERZTVbESurMkz+SuQutT7I9DjJ3kgH3F07q1pGsE9VVA13KiH7MKHQx6vUYn3Fx8J
	XG+hhXky7QCGZhRtBsQTI9CLR03jWlxMCpnSCCKIBPkYvSOAo0tqH5wJLYoSk+BUKK+qxaPCE0Tw8
	FKVC5dtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJYOV-00000001j1H-3LhU;
	Fri, 06 Dec 2024 13:29:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJYNU-00000001iw9-0PzM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 13:28:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A92035C5C00;
	Fri,  6 Dec 2024 13:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447E3C4CED1;
	Fri,  6 Dec 2024 13:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733491695;
	bh=bFR90d84PsBBGdYbcFgonL3LS296ISMzvCAGR/chLOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OKMTKk5epQMKByKTi5i0KAnyrgICV7xyMkPuNJ1HKvOBLdN6en6rHhisvmkYUQFxG
	 /yCuucXQBisQYMa5fTTVRje9QUUshvMsVCFHbdtPJWpptmcdW/IpBmxIEmyigot+zM
	 JG9IHN1Glun/YJ/A8iR91QY6cYeyZOIGLsH+NFZ5gkLXv2g/jePI2NP9RICzlyMMfi
	 vSoOk4rktxp9t0NwMZPn0cUBrPlVLwriECqXAvwcArt8xS/xxHSaSnyYEwR34ez0XB
	 algZN18bS6LhiOYuOOO9uOUy6+IS5OvmdGf0BG1yA0sOWiOpGDu9qHrYWvViRXESbB
	 rAMN47dO6+xdA==
Date: Fri, 6 Dec 2024 14:28:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com, peter.griffin@linaro.org, javierm@redhat.com, 
	tzimmermann@suse.de, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de
Subject: Re: [PATCH v3 2/3] firmware: add exynos ACPM protocol driver
Message-ID: <vxqi23hxw7bmtfs5wk3u7szganpv5aa74b26xrvpmbehkltodw@dpum7zrxdz44>
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
 <20241205175345.201595-3-tudor.ambarus@linaro.org>
 <ce757b8e-4e6c-4ba9-9483-b57e6e230fdf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ce757b8e-4e6c-4ba9-9483-b57e6e230fdf@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_052816_179265_60FF1A1C 
X-CRM114-Status: GOOD (  11.32  )
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

On Fri, Dec 06, 2024 at 12:39:56AM +0100, Daniel Lezcano wrote:
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config EXYNOS_ACPM_PROTOCOL
> > +	tristate "Exynos Alive Clock and Power Manager (ACPM) Message Protocol"
> 
> Given the importance of this driver where a lot of PM services rely on, does
> it really make sense to allow it as a module ?
> 
> Some PM services may be needed very early in the boot process
> 

If it works as module e.g. on Android, it is beneficial. I think the
platform was booting fine without it, at least to some shell, so I can
imagine this can be loaded a bit later.

Best regards,
Krzysztof


