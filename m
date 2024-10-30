Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB5CD6B6A6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 16:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoeeM23AhOsJoaMIxiszSC2XcIlVdHVidjykxIDzU+g=; b=lYP1gnVLQkcQBoq4BZAxoZxxPJ
	26rBr/mdVfZ6is6PwGtFfF5HWp8BuXWaPeND8iNxIxEaULLfTQLKKBLn9Es02Y+Ic8X+7oStuqZhd
	uRkuyLrvHDSRGkEMepX3vK4xw/+dgMuyJ/pgnxwIp8GlEhIf/s2dKqiU9fPTb7PbzLlFyMUIVABt9
	C76Y1XbGPnlUajj1jeZSHCa4Huw49gOkX+Gu2MfgaQvXqeCIO58jEBNQxo5znZv0WgQVB7AIafHSc
	MPxiO8yDIO17Atuy9z8V/EDPGNMnaV6q2oYLc5pZdcX00AS+Oi6P/Ak0S3IOPuSTQdxErXJFfAE/w
	XvUDe17A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BTb-00000001456-0xG1;
	Wed, 30 Oct 2024 16:23:19 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BQf-000000013UD-3m4u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 16:20:27 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e30d821c3e0so903823276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 09:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730305216; x=1730910016; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoeeM23AhOsJoaMIxiszSC2XcIlVdHVidjykxIDzU+g=;
        b=bRJzha1d3W5NzpYv2fpCvhA5Ke7DrFCR3HeIfD5b2qRxqUwrUyXCnVta95GUtBFEBe
         qQ3Ns5LZVsvmqNfLgmQ0w4ywaotx3GMA4td8Lj4TuWbBE06aB5ilJKCKtsCsRKp7mhWY
         Mxw9glfhdTIbfVJmPi29NCPlWaC3LisBtxrz/guiI7X3b1nCGylZ20Y0Wt1nKu5u24lW
         7lEYHpkHhH9iXTqgZbXZjftI3bkx2HPBwEiLkCP7TLKrw+1vjsY5VvUZ8jxjtvo+7dCt
         jxoa+dNqPVF1cgTOVCFTFHkxY2Rkg4svumHvTf1RCG1ldaCe3HF3RJs7mB1pc0x0SNUI
         qQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730305216; x=1730910016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoeeM23AhOsJoaMIxiszSC2XcIlVdHVidjykxIDzU+g=;
        b=WaAcWz+v7diRl2mVXDUxj8TmdV55w2a8h4MKGpvgWDjWIgVhUA6OLojHTwsExOEcl/
         AnVfOP3Q80gp9nUtiXTFqBF/eZ4dQVvys+IwFYDvjvfAmEsAgZVwSpg3LGp2GS5EVhU9
         5Dr6ofFynE5qT1+CkcxBAsvIg0JKcjShFSxvFDwEqVCGbYQbWDwlMT+gPScg7X1Q/WjK
         IPZUsMVLSiCARROC1tMjGTK3XcXqqNXYbG2yL4UEvUeU248LUJ/mSnwx6lHKs4YMHmq3
         nKiK1PGS7yGM/Yi24yF/xSSPCCIf8q8ooETseLA169TADg1UpXPy2Y1FyE1QVlNMOuFr
         h66Q==
X-Forwarded-Encrypted: i=1; AJvYcCXshzAz+qOqySlGTpURIz4AGivaxfzmnLdYpg0Zfrvr30AczPaphBUe0n+PuUW3t5i5ne0SuqzKXn8QHVYY/0w+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5ZuyOnrqaxNTcH76okeXNJL/4+GaBV1TzeWHYNUV4lWVS2bd2
	XBIMqMXHcNbMz5EQwRyjInBWR/hUJCngE3RxmQC/SYvyT3qrnPZ0MBbzOhBWMALTtDbSCidnqc+
	lnUszhT7a0rKuIvxi9Rbdy7143moNjAgRkNSncA==
X-Google-Smtp-Source: AGHT+IEAL+ig1I6YxHPWKDxM+c+9tJ2nZijR/HzL7xEopbO7n014y/uWJwP5fAjn2UqJzH/+xfmkQd4UvLAFkD0MR6U=
X-Received: by 2002:a05:690c:60c1:b0:6e3:36cc:eb74 with SMTP id
 00721157ae682-6e9d8afa635mr194581497b3.32.1730305216352; Wed, 30 Oct 2024
 09:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241030125512.2884761-1-quic_sibis@quicinc.com>
In-Reply-To: <20241030125512.2884761-1-quic_sibis@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 30 Oct 2024 17:19:39 +0100
Message-ID: <CAPDyKFoY8CnxF7JXzkT9_WXyM-TJhW4kmTw=H8NEzch32N1_7Q@mail.gmail.com>
Subject: Re: [PATCH V5 0/6] firmware: arm_scmi: Misc Fixes
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, johan@kernel.org, 
	jassisinghbrar@gmail.com, dmitry.baryshkov@linaro.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	konradybcio@kernel.org, linux-pm@vger.kernel.org, tstrudel@google.com, 
	rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_092018_097574_764C1E30 
X-CRM114-Status: GOOD (  14.00  )
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

On Wed, 30 Oct 2024 at 13:55, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
> The series addresses the kernel warnings reported by Johan at [1] and are
> are required to X1E cpufreq device tree changes to land.
>
> [1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
>
> Duplicate levels:
> arm-scmi arm-scmi.0.auto: Level 2976000 Power 218062 Latency 30us Ifreq 2976000 Index 10
> arm-scmi arm-scmi.0.auto: Level 3206400 Power 264356 Latency 30us Ifreq 3206400 Index 11
> arm-scmi arm-scmi.0.auto: Level 3417600 Power 314966 Latency 30us Ifreq 3417600 Index 12
> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> arm-scmi arm-scmi.0.auto: Level 4012800 Power 528848 Latency 30us Ifreq 4012800 Index 15
>
> ^^ exist because SCP reports duplicate values for the highest sustainable
> freq for perf domains 1 and 2. These are the only freqs that appear as
> duplicates and will be fixed with a firmware update. FWIW the warnings
> that we are addressing in this series will also get fixed by a firmware
> update but they still have to land for devices already out in the wild.
>
> V4:
> * Rework debugfs node creation patch [Ulf/Dmitry]
> * Reduce report level to dev_info and tag it with FW_BUG [Johan/Dmitry]
> * Add cc stable and err logs to patch 1 commit message [Johan]

Patch4 and patch5 applied for fixes to my pmdomain tree - and by
adding a stable tag to them, thanks!

Potentially I could help to take the other patches too, to keep things
together, but in that case I need confirmation that's okay to do so.

[...]

Kind regards
Uffe

