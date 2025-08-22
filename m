Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6624DCA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 12:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjicZI/1Nbr8qAa/3VcUbv7hfNRQcnbsv7M4jPSglw0=; b=noPv5EerQRH6nxFGOJnNAytcBN
	YXSpYgPGd7kppTcpG3LS0Kd2nXSVIEQByuRfzYrWfqgnYvndciASAQnsQnBHzHKYRy2vHKAsPlf06
	SDh8dt7gWD1ZqrTToL7dUj6daC69X10j2SF/nr6qPQ5BD4woMHQuHUu7VrHiylXM1Yh6tkQfk0qkk
	E7anoMeDRQvVBcdYwdiHJAQB744Y53U4U9Xfwl0Z/iHN7UMsxGWai0hntZuqd887RQQ9vBGCzrGyT
	qzYKTwqqHOpOtTu1GTbantjTumGi5IyrHKcqPzqFWF9Yj/u+LP1hjT5YPYRTwJGHCqZN3athFoX4D
	I5bPN8bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQwD-00000002URr-3z5t;
	Fri, 22 Aug 2025 12:32:09 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLg9-00000001krw-3VJN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 06:55:14 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-76e434a0118so2364095b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 23:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755845713; x=1756450513; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bjicZI/1Nbr8qAa/3VcUbv7hfNRQcnbsv7M4jPSglw0=;
        b=JzrObEbxNuCpc5qUK9V0hzVPGQGJXnG71E9/YPGHrCQUstS23T75GYCVcRyn9+0kr5
         NEDvmF2LNXEVQa+Y+JSUN3Ow+V9Zzit5eRfczT/QAUoJH5sVFJ6Kcyp5oz+RxRgxrcye
         zfN9kTxg8bDqGyGRo5PJLyRJSWkYLCiNcpwX/nL4STiILVDPwPR1mDR3UaA6koccFelO
         Ce8dc8iWMzaaW6wUrN5d8jUl3X3TU3gQcNqJg/eW6WNDPg11iCcArxo5wdIzL9F7UeL0
         cA45rnCC4JddOvbjvZYdwBRtH1FqTjkGxDU85Alh2fyoMTD3UN+YGucCTbtdsIGzc0O5
         dULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755845713; x=1756450513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjicZI/1Nbr8qAa/3VcUbv7hfNRQcnbsv7M4jPSglw0=;
        b=n/VNsrOtbpwF+8IPHc2OdiiA40+oZEjGCK/m4hxatgbd/3fLa7kVZkuDmB0s+OZoyR
         ToL8uqXEb6ykQFKGEIIi4ww+23XYdRK5uFxkyR0yQ9t0lNcK8m64Y/qYz+LUvAGXc6CD
         g6qpa9XCYI1vIAwyHNmSX081iAEjqd59PLx9s2QppZFTZXSUD/vDKCbqCRolZNE+iHHM
         dwAi691Dl+CNP1PQCTNRfiup1SIcE4UyQ5Y2bex9M5ySh9XIiFZ81sqxSAVU3jpqvc9x
         7vug4vtcbAfwdATgBQL9IDajSaO8cpEcrv4WQFuCmH89inii2H1RDtYB2Jv1YGpxJvW8
         vbxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNrzDcwnJZlhJxuaQ9kVrxsQ0JAypmu28ANYFOdoD21I0wrcmwQM/qC07fXhL0doZ/QokKNaGQGfRX0tewNSom@lists.infradead.org
X-Gm-Message-State: AOJu0YzTOvYrzKtdLQUOJuJS/iQgFkyN6OLVqTuUIifzi6spD2dx1rDx
	A9sD4LlpSgPE9EXpq1zINc8k+ncYZI/C3xAuynAlUYMoD3fCEAC96fCQ7Xwer9Rrfzo=
X-Gm-Gg: ASbGncsTNsNatwkhM1j2fonz4/c3qL6li9zq0bG9SxfZtm8oCRXaPEO1fdJA0uP5wvR
	NFeX0RHgKbbL+OJLgj6wV/zmdSpj5rgwjKBfzY61nMXsJbSV+o8JUFM/xrQpowYokqkYOXMKXZc
	A7k5vgnq4MZX47aAoBExQd/C90eXaZ3DKZEoiJjJ2Laxe+ZCoai8MEjrsidR45lc7aLQdulxc06
	d/zLYH7jl2/IoYuf1nF9ydO1MqV5fd5cfDY19OCdMVaJDPrMeJoVCpNuIsyxucIpgcTPerLtPU1
	z4p1vaAbd3UM4CGYtEPlTBETcCBDFxLFIWyPydxic9KKOkWgXwCoF75jsJqK6AygSepfTkX1UP1
	qnjWOIMVsSkiGzM3UOn5v4S4s
X-Google-Smtp-Source: AGHT+IFqTCtn1vTBHrNEXFDiI/RKgrZ8CU3yklaDBqhgIBX1zop4EhNr7+iPGnFTdss9iSbzazknMg==
X-Received: by 2002:a05:6a00:2355:b0:76b:e0f7:42f with SMTP id d2e1a72fcca58-7702faaf381mr2736161b3a.19.1755845713053;
        Thu, 21 Aug 2025 23:55:13 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d137dfbsm9903213b3a.44.2025.08.21.23.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 23:55:12 -0700 (PDT)
Date: Fri, 22 Aug 2025 12:25:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Judith Mendez <jm@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Bryan Brattlof <bb@ti.com>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/3] cpufreq: ti: Allow all silicon revisions to support
 OPPs
Message-ID: <20250822065510.3vlbjwakt7ts75gk@vireshk-i7>
References: <20250818192632.2982223-1-jm@ti.com>
 <20250818192632.2982223-3-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818192632.2982223-3-jm@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_235513_883623_7904556D 
X-CRM114-Status: GOOD (  19.34  )
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

On 18-08-25, 14:26, Judith Mendez wrote:
> More silicon revisions are being defined for AM62x, AM62Px, and AM62ax
> SoCs. These silicon may also support currently establishes OPPs, so remove
> the revision limitation in ti-cpufreq and thus determine if an OPP applies
> with speed grade efuse parsing.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>  drivers/cpufreq/ti-cpufreq.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/ti-cpufreq.c b/drivers/cpufreq/ti-cpufreq.c
> index f7be09dc63e3..90c896d02649 100644
> --- a/drivers/cpufreq/ti-cpufreq.c
> +++ b/drivers/cpufreq/ti-cpufreq.c
> @@ -311,9 +311,9 @@ static struct ti_cpufreq_soc_data am3517_soc_data = {
>  };
>  
>  static const struct soc_device_attribute k3_cpufreq_soc[] = {
> -	{ .family = "AM62X", .revision = "SR1.0" },
> -	{ .family = "AM62AX", .revision = "SR1.0" },
> -	{ .family = "AM62PX", .revision = "SR1.0" },
> +	{ .family = "AM62X", },
> +	{ .family = "AM62AX", },
> +	{ .family = "AM62PX", },
>  	{ /* sentinel */ }
>  };

This got a minor conflict, fixed it as:

diff --git a/drivers/cpufreq/ti-cpufreq.c b/drivers/cpufreq/ti-cpufreq.c
index d6bd0d2dcf15..6ee76f5fe9c5 100644
--- a/drivers/cpufreq/ti-cpufreq.c
+++ b/drivers/cpufreq/ti-cpufreq.c
@@ -311,10 +311,10 @@ static struct ti_cpufreq_soc_data am3517_soc_data = {
 };

 static const struct soc_device_attribute k3_cpufreq_soc[] = {
-       { .family = "AM62X", .revision = "SR1.0" },
-       { .family = "AM62AX", .revision = "SR1.0" },
-       { .family = "AM62PX", .revision = "SR1.0" },
-       { .family = "AM62DX", .revision = "SR1.0" },
+       { .family = "AM62X", },
+       { .family = "AM62AX", },
+       { .family = "AM62PX", },
+       { .family = "AM62DX", },
        { /* sentinel */ }

-- 
viresh

