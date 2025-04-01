Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E95DC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 16:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEr9LMvpLbHE893cIqhG/JU8h0Dt2xG4p+araqhsX+g=; b=BAVw8DdlDJ71hs1UZ2GHggEtvc
	9zrXCeQMp/TAs+lw3+P9A9uaXLU9d/qdJ2OSPgC7704MHWxTffG0ZdLUQ9Vq9Vb5WUB2JoAObos8O
	FP9walNF4lJ/n4f/bb/QU7zcs+PXqvZlp20O+E0TWDxIbyH70C4ORsu/AwHqK1pFhz+10Xype34ZC
	4qWZgzSEge0ww0mPiJFANkvMN4CTRfLWzlMhxWA6VIP7cllU5NDVywpnkr0TIjEnZMV1sYFpd+ubD
	fUkboEP0b95YT4xR3FEmg3X90wC/S+KpCNNVSTm3GIxZd6gYk2mHK/3KVOJ+eLVIpazXEvFPqFviC
	8qUtbQ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzea9-00000003teT-1IZF;
	Tue, 01 Apr 2025 16:35:21 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeT6-00000003sRg-49mO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 16:28:06 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-227b828de00so101471905ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 09:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743524884; x=1744129684; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sEr9LMvpLbHE893cIqhG/JU8h0Dt2xG4p+araqhsX+g=;
        b=kCmrZK1fL9MOhKwfLDPmt/bN9kOkJ+t07ZMkM7kz3eZb8hZ6/6D9xeYawFpSUBudtY
         KBdjG6CKCFG7WdZowmby1UYuVawlFxvksTuBsZcmKDmzOCnlM4vFbLyf7+myZgeAJ9V/
         hiQkLs5tB4AWZdrFndy9TTDOWthAfk8qACncFTzoiG1FiyRNOd+sK7SRBjPQb2R9AIA2
         7XIdSl/wnlj9s1QbxRX/DUER+CkdTduZVmNe/EOStEIvZUI3xELM12u6uZN34xPt8Wvn
         oAXI+/alln+2BnkiPNeQ4+m0LSY4v+abfR4HYUpZ3fUIup5AKxhqOfc/ZKTho9wG6Dma
         kodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743524884; x=1744129684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEr9LMvpLbHE893cIqhG/JU8h0Dt2xG4p+araqhsX+g=;
        b=kLG/ndHSi5i+4dTznVw6QtBp1frblpm/u7ETSC3f2F4K5NS2bC1dirbe2slxZDo/Jy
         CRhjUEeuNXSrDR2kCQrhrzrUkyiId21ohjliYwVa4g0Q1m/3HzvEIwI5egyHkmooIX5E
         5zyJB4kU/at/1dRbMdKTQ0xC5uTBDNaC7x0r/qUjqYw+5Tv8saq0E7TN7qPVk8frwveh
         qOzsLMUKREjVzD1gFTkx0c4YewSwVe+7IAQ4KtoPyfR0jvUPMXqX69oF30KXzqHYcDCp
         F4v+ZBqALLOiBvmS8GXQxPY/19/Jg5KE9o1R624p5epwCZktD4EodwnEuZnNQfYShdpe
         BHwA==
X-Forwarded-Encrypted: i=1; AJvYcCXFwPrPckHg/B7790diKTiyuvFiM1C0J1YYCWZ+mjpYejz/oSsB7AuM4kUM/N5jE4j0OFhEnfDcbNgOJJfjQHrv@lists.infradead.org
X-Gm-Message-State: AOJu0YyF9LjHWXq43IROKZW+QnrgDJSIDA2rq1vKR9L884nQbWKk2lWM
	RuaaJszoVOl5LJpPaWOHdC+Gmj2ekwx084kMnpNKdviUs+/G9hQnxrsJrgz0nw==
X-Gm-Gg: ASbGnctnl28nWv2lIVfQx+FhxXSkxf0nPIxTSHc63BNGo6RGaJ+j0OcM5HDpzo9Y4Dk
	zL7VqaholICP/mWEnj55PyFpISQRXc5/opBHm5FbI/siQFH5Bx0rgV0Lwn5zfAJ7y5yH/+YBnTT
	LoaAdRsLYP4U8iVltYP5ojKlAY/byfM1xV1mO+fpFY8ZzHakLy50Mr3Fe/NBSXAkVAEww8B9flM
	sYS4exTD8X5DTGAEV5v9s+pLUVqoNtdSX52EPlzYNHD3W5hNDn19XwcyaWbB7cESSHk1yONzLvk
	2lqNi/eLKjFIWWuq3uTAOvVYrzdoe++sCxhrgoxNXQeawZv3gXnO1ZAyLRG5181RQ1jqAc1WMVa
	VupWusXD7bpPPE6k=
X-Google-Smtp-Source: AGHT+IEyaXPv9oHXzdX7kp5aOc8Pw45evlmKNFGJN69UA0/YokAg60Q/XphIOEUon7k6t8bnNWSYvA==
X-Received: by 2002:a17:902:ea02:b0:224:216e:332f with SMTP id d9443c01a7336-2292f9fc054mr220540675ad.48.1743524883898;
        Tue, 01 Apr 2025 09:28:03 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f7376sm89939395ad.245.2025.04.01.09.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:28:03 -0700 (PDT)
Date: Tue, 1 Apr 2025 09:27:59 -0700
From: William McVicker <willmcvicker@google.com>
To: Rob Herring <robh@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Donghoon Yu <hoony.yu@samsung.com>,
	Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: [PATCH v1 5/6] clocksource/drivers/exynos_mct: Add module support
Message-ID: <Z-wUD2GGMRfJwhSu@google.com>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <20250331230034.806124-6-willmcvicker@google.com>
 <20250401023001.GA3186122-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401023001.GA3186122-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_092805_046868_BAB82A62 
X-CRM114-Status: GOOD (  20.33  )
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

On 03/31/2025, Rob Herring wrote:
> On Mon, Mar 31, 2025 at 04:00:27PM -0700, Will McVicker wrote:
> > From: Donghoon Yu <hoony.yu@samsung.com>
> > 
> > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > boot (and even after boot) the arch_timer is used as the clocksource and
> > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > source for the arch_timer.
> > 
> > Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> > Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> > [Original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > ---
> >  drivers/clocksource/Kconfig      |  3 +-
> >  drivers/clocksource/exynos_mct.c | 47 +++++++++++++++++++++++++++-----
> >  2 files changed, 42 insertions(+), 8 deletions(-)
> 
> [...]
> 
> > +#ifdef MODULE
> > +static int exynos4_mct_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *np = pdev->dev.of_node;
> > +
> > +	if (of_machine_is_compatible("samsung,exynos4412-mct"))
> 
> Your root node compatible has "samsung,exynos4412-mct"!?
> 
> In any case, add a data ptr to of_device_id table and then use the match 
> data rather than comparing compatible strings again.

Ah yes, you're right. Thanks for the suggestion! I'll update on v2.

Regards,
Will

[...]

