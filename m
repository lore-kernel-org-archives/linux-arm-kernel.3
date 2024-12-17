Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89907E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 19:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxCICxJpXfei8MCzltd58yMQLgKqjwCA0gMAu7lAjwk=; b=xckELkrgCvFjv/IiCWWDbRzeja
	8fPLyMWhocGGDbPKUAcyT1HQvOkvVb3oqedNrU5A63UT/vlWGcPiI0jaW7bUX6hzPxaVCi2wKGG5A
	4LrOtd8BZrgybGyOf834x2eIfLYj0NJPlrTTpba3FP38zbmxPDQ26XSxkYxyfej89DYbuh7Bjb66E
	N6ffpONR27HDBdOyeYNki0P9jYI6lemJ4o8Bq80VFqzMMu4HXAHg3d2Zq49OaGD/d6jNU5uTdYWxl
	mcwRjkjt6DUFnmKraqRjsIeCYy0nEtfk7X7k2vRdEPLgmDA4ZrOT7Rz8tmR5uB7ST1zFOvSsmD74t
	iabNY+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdOT-0000000EeAk-21Uo;
	Tue, 17 Dec 2024 19:38:09 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdNO-0000000Edxt-0Nwc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 19:37:03 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7feb6871730so3881926a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 11:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734464221; x=1735069021; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lxCICxJpXfei8MCzltd58yMQLgKqjwCA0gMAu7lAjwk=;
        b=veAKb26FqAeTVJYZAtDmJUNaz+lMFDF7mJjTY2XL0aEbwAVFU3IxJ/6bmK3SRxolw1
         ZMZVO3UAqFLzQJqq2igUMLO9w37kRhG6tI3zXaqDGpayjSbV7moeQHQ8SrTKPHGRW86l
         f57SFfDA/0ZUGSj+beyUWhNR6QvrR4D78vaDOkQyVpU9wYkWlpGQZyfRgIPxdv58xq1V
         QW0nUUaA91kAGj3QRBWm6jPIoN5gQjgZhOYvh2cPTyVqfg1SuBCsj/oaI/c+aNSPMiv4
         CcD0vgmvvkwhYFqHOwDO2JQb8HrkUehBAfM8cNvm9Zcfhu7BegPWkj8gDLjdfHlzkCGj
         kYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734464221; x=1735069021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxCICxJpXfei8MCzltd58yMQLgKqjwCA0gMAu7lAjwk=;
        b=CFUqguXqUavMqvvpSjdBY1LlV83X42m8w2qBQQHnF/z6ygy5H9xlXRYEXxnFdrixUn
         1CJseBFuQc5ax4QBaYWPBloLCzSI/ZpB/gMTb5l6tvtvplWOk4sM3I57NQKHLJoalTd/
         oAIDC+luaDTuYvily8T+9absorKsh2tf+baBwS3J6OP/UQZpbmvhLJFuvlwFukVdgJ1D
         rJqtw936Hv6VcyNBV3khb6BJK30jJ0Yo7U74jVx2bTyVK6nSav98HIGognZIPHHzZGHx
         puI699mu3oSYnRYq8o6CliL0JNuqpvcGGBgRidA3IxE2FiFPGgaziTPwY1L6LAu67aNy
         4tOw==
X-Forwarded-Encrypted: i=1; AJvYcCWhSJWMuo1TlOEvW8fxbDk+GGW7cFbGP+kkjsD7xKjywm90FUHWCf9PMT06B+xlkbv3OtcvafPcdlSyQv6hFgkb@lists.infradead.org
X-Gm-Message-State: AOJu0YxY0yHVlS193kSuWrXiTLNSFVZldfa4WeHL2F6sMFqw/38FLGQg
	+3TKqfLxGe6tHoah3uXNQJF92cuwl5yEY/N8z9F9zg3mk1PN9D6WHMSyaKuYhA==
X-Gm-Gg: ASbGnctVI+OjYkMYHzpSxw6sxpBgHRnOT6879j9MEFYA7kmLTFK14U6ZSLU8sab6QM/
	BuxFgohpCH3tyCEmI4FDXb0WJXAFssxAbFZ+GpmekC2vRBWEdw5ffW7/Iv8+bIFEZoOX2QMVY3n
	G0gsr+bb7X10JUc7BCvJdRAnVkB5RqOw8O+7HCAXhCgT052QUmpY8C4bKIKIIGpTPfA6Hdt3e7z
	T+UCfVCn+jTRVQn6Szvpjjctz9a+kIRsv6992g6ucYb71TufybEJUsFXsjlngaT+JUpOYtlsi2c
	/B4TQOUJOUR+kgHdXC3/HbU2
X-Google-Smtp-Source: AGHT+IE7HeidwXULiczKHkcCrFXy73r0XNQEw07ggxCtV6f/PJ01FEii3YlDMP9Kg7esnumM/Q6q2A==
X-Received: by 2002:a17:90b:548f:b0:2ee:8e75:4aeb with SMTP id 98e67ed59e1d1-2f2e91f6469mr171028a91.17.1734464220976;
        Tue, 17 Dec 2024 11:37:00 -0800 (PST)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e5cec5sm63162375ad.172.2024.12.17.11.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 11:37:00 -0800 (PST)
Date: Tue, 17 Dec 2024 11:36:57 -0800
From: William McVicker <willmcvicker@google.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] mfd: syscon: Remove the platform driver support
Message-ID: <Z2HS2Y0nGBMgvz8U@google.com>
References: <20241217-syscon-fixes-v2-0-4f56d750541d@kernel.org>
 <20241217-syscon-fixes-v2-2-4f56d750541d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217-syscon-fixes-v2-2-4f56d750541d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_113702_131538_D54362F4 
X-CRM114-Status: GOOD (  15.66  )
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

On 12/17/2024, Rob Herring (Arm) wrote:
> The platform driver is dead code. It is not used by DT platforms since
> commit bdb0066df96e ("mfd: syscon: Decouple syscon interface from
> platform devices") which said:
> 
>     For non-DT based platforms, this patch keeps syscon platform driver
>     structure so that syscon can be probed and such non-DT based drivers
>     can use syscon_regmap_lookup_by_pdev API and access regmap handles.
>     Once all users of "syscon_regmap_lookup_by_pdev" migrated to DT based,
>     we can completely remove platform driver of syscon, and keep only helper
>     functions to get regmap handles.
> 
> The last user of syscon_regmap_lookup_by_pdevname() was removed in 2018.
> syscon_regmap_lookup_by_pdevname() was then removed in 2019, but that
> commit failed to remove the rest of the platform driver.
> 
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

I verified this works on my Pixel 6. Thanks!

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

