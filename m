Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0A3FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 06:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WcOsr9RfEk0bJ62aLAVriU179vnNVwV4fppmi9KtUbI=; b=F5B+8VnE5WvgjGvLOS083YWNGb
	c8Wi9EoC3YWU3EU1TGEbAaOg3lI4E3Gbzy4/Jp1KqkVz1Lp3lDrR6BnhaquhtCKJQuhkcQ+EFIqO7
	yg66xKMsfYuBVo0lJdfkoZO7io7RxJ3+1ZFGHwOWrEL9sRrHA9xTryhD0C+o7PVBh+KSiR+TQRsxf
	rTyTOzFG5nRBwCxM0+gVhZgynb8Db5iY71Lpm+Th5vkJb8x7/eEqffA8prqrXFp9QkToFyT47aA1j
	0Af57C8Q/O3/L9gJvm612UxSYyBwMyTjStE3Nifpu4HvdFQS7YWuOKUoY13xJZ0SFqgChkBoshoNR
	oPucztqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFgU-0000000GHSr-1E85;
	Mon, 27 Apr 2026 06:43:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFgR-0000000GHSW-1MYM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 06:43:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso66119105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 23:43:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777272185; cv=none;
        d=google.com; s=arc-20240605;
        b=h7AHylSmlFO/TlUA++uxyfG7i2uaa2vmnl0YObYE5ah+Y/UGeu+5dqDkvt5ZH4aZ9v
         HIj2RkZ0IVex/jHN+pYJFzVg0mj3p3rsxLVJ+vBb+mWO96ckkRmsUp6puD0lTWGj9Wr5
         2xBhdsxltaIFihdaSGdawxXuLg6hYqhUo8sRrOxZCokZNq7y42oFwDqBrrdbKAuFMvoL
         6EzWkE28nNX7AjMGafLu45nbGZC3ExXVW0iZA0+rQFENEEilzdBl/RJv2vmKrl3gWxgt
         G8rMPuoupFCNNyUgTFCtWVQ+hOSHIr5MhdnAhleUV6v4KjrIdRI+allYqAo+NyyAgm9N
         ewew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WcOsr9RfEk0bJ62aLAVriU179vnNVwV4fppmi9KtUbI=;
        fh=n2hIUMInhdvtXflEA2Uwu5ctNSJCQHA8vQHRs3akHHQ=;
        b=i/kAXEcbk2Fx4UG+5/3D0w9YXyPJILByS0hFiVrVaKkn0rHqu3wUgBmz7+e47n+t5y
         7RFXD44XpQM2Ep3zC7uo1UawIeJqSnTfWOafe8wBJZ8LxF6u5OgdBDopU4jRzKPc+XBG
         Cx0OrE5wtFriw8FIatu8YKAYD2i/kowPqjfgRWpgzotc/gtSNLccX9AvX5Mjs1ZWtSyt
         c+8S3r3gUK2Frqgc+4bNROKMHPQUOPA9I5Zp3vEI1uDSClXkWkSyvmjUJ1O2t+S5zUN1
         X4TSZjf9+DiULlbK8oCPi+obq40jLvU1oNuMdYP7VRR9+iLoGbjgWtNGRfGUbLQ4faWr
         8TXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777272185; x=1777876985; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WcOsr9RfEk0bJ62aLAVriU179vnNVwV4fppmi9KtUbI=;
        b=oK+shXUUupoP4oL6DapUKIRee66QiCLHTDagg9eOzjKfhXWLOG2Qfr7akNuOCt7MCT
         CPawQuuUEGOSC14qaE3PsjhmcvD1z38DXCUqNMro8oiSKcmmddJfdseZKuOwPX2H4vhz
         jtHijVKPD9/Sz4ta0Jpo9NIXeizvy6KzY6AzxJJr6hZQlZtlnZP3PEI4Rn3UhV0vOn1r
         H1Cgx+1zh2b++P/GMEdP6YUhYYH4+qPlrdkwKJHqvbZ61+5sklkF9hzUJM8RiLXn4dRZ
         PKj8B5+HwU18r2OATKedchqetgv53nSpsqMhTvKGchQrOt2UzFRfu/0T3FvOc/HBesam
         2mqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777272185; x=1777876985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcOsr9RfEk0bJ62aLAVriU179vnNVwV4fppmi9KtUbI=;
        b=F4RDdf84YPO531gs1ThAWEViTKh11C9PNYbxUmgoOc1Z0iIHOt+Rl+KevLCMzy7K3w
         1yah01vA+7nZEBatwUXmPyfZ1GPePT93BhrVvhrCW2Cyu5iHcvT1ndkBN6LGxlvb8ana
         MdCGauNTDt+Qm3PyXhxQslgLVssl2YfJG89PzJWSwjmDtNMb+s/Bbp3oIhhxtCbYiuSe
         +ol8rRcNQ7Jr2f5fTRViAtcd8QY07ZxZUywLKxQHswjSHjSaw94LxvWuIOEZH1CIR8eP
         G7p/3DQKDDfz39fE9glC4SUzsGx7Jo8I+hCylU8lv7OJn9jykPP7NCd+NomVGuhvoXrQ
         Il/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/9oCmaOS1kjF4WfKHIZmUZrBSy06gbsd464ZVRq0/mbT+NA6WrKMBEvf4GVFBCd/s38XricWgZ+qHPRP2hDFfO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx607mcIxt2nP4dLbpWcYpMG0f3hRAsi0/UGyn8N7Uha9lP3njk
	4lO1xLgU7+UpTDYL4QASdgtdMeVafRAuUP10/86JM6uuTQmKNG4v66UVd+e9c2VfEJMXpISy77O
	zjGz/2hgHhgtkOOAqB80Sw/rSKbJ+MOg=
X-Gm-Gg: AeBDietZ/f1zhJliLP6YipKr+JXFYAiuRzKTOB8ht0jUhaJ+GTUI4sIc+gNS7E2BxHX
	SzjvBOrNQIOZfiIa7inGi1xvEByvLWNlZpaKgZmyM11kHRXy75tyAXMC+ptOctAegDutcwYLYeW
	kzJvpIut6YtydSFS/RaLdRlRnDaThUGx8iBk0vru8csBhVjqqMstuPHdxVerNj0j+xZjMtCwhKS
	FmxGIXhKrs88C1NszoiLLb4/ua8j/KierwaZzs4Ke2vbTYYvmsx1LFcJf4ocY9vDseC83OTUTqa
	kCd3w8SEcWdkUMJfz4Hc3HZbFTUfOx5zQEjuzVhGwdkIpUWzfqxztZ9ZPcRZeMJuu254/nrbrLc
	X4JJjXZht+VeF64aKpr6ZkLfmjVI7UxDZKSWikjUFo1i4AaQDtQw0neYr5ohfQC32AhrYK/rxdo
	3Rt+rWH5fnBthkpK4p
X-Received: by 2002:a05:600d:8454:b0:48a:5970:2003 with SMTP id
 5b1f17b1804b1-48a59702216mr227888515e9.3.1777272184448; Sun, 26 Apr 2026
 23:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260426211834.3318306-1-caiomorais@usp.br> <20260426211834.3318306-2-caiomorais@usp.br>
In-Reply-To: <20260426211834.3318306-2-caiomorais@usp.br>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 27 Apr 2026 08:42:55 +0200
X-Gm-Features: AVHnY4Kz9mzYmXtl_F23_Et-h-RH1SZ5HdIzGYse74P0wBY1rMYM11t_BGRAWAo
Message-ID: <CALoEA-zz-2cG7SJr1iKNQ0H81TVMXLQh3omkxJc9YRW673Kqqw@mail.gmail.com>
Subject: Re: [PATCH 1/3] iio: adc: xilinx-xadc: remove unnecessary includes
 and add missing ones
To: Caio Morais <caiomorais@usp.br>
Cc: andy@kernel.org, dlechner@baylibre.com, jic23@kernel.org, 
	michal.simek@amd.com, nuno.sa@analog.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_234307_403741_C0962067 
X-CRM114-Status: GOOD (  10.45  )
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

On Sun, 26 Apr 2026 at 23:20, Caio Morais <caiomorais@usp.br> wrote:
>
> From: Caio Morais <caiomorais@usp.br>
>
> Signed-off-by: Caio Morais <caiomorais@usp.br>
> ---

You're missing the commit message body. While it's understandable
what changes you've done in this patch, it's good to expand the idea
further (what you did, how you did it, why you did it). This goes for all
of the patches in your series.

> +#include <linux/bitmap.h>
> +#include <linux/errno.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +
>  #include <linux/iio/events.h>
>  #include <linux/iio/iio.h>
> -#include <linux/kernel.h>
>
>  #include "xilinx-xadc.h"
>
> --
> 2.54.0
>
>

