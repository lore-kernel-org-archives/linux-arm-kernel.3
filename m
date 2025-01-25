Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F271EC0218C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 13:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufdypkJNjHswejxJubFk9kEYQm8Yr9F5qH7/Hz14nEU=; b=kVachMXc9PsB5zWug/iaJQE+Bo
	0gnfrMwvA+1DaEXL9TX527Y4T0ukAYA49Wxmjzgz8ZCa8NWPJa1B9nXRFKPf82cV23uHjDru1br2u
	A4JSEVp0D/JhjQqHepHtojdF6N1etV2ytlq8DhMRVWwSVPvXOc0dduOCQ0CllI9sX8kKuy0dDwKwl
	/tWWvPIbZ+8Rt+Y4o9Y1VQNrC15zr27t9q1uogtMHM2y0T7OvZ5ZD7Um2amqmF0vH2dF9uSYVzbD5
	tIjYIKX1h27wSdc65SbFIg01wBADk5y66QQvxS/9btYDYVNuPGDqd4Wxcy+CN7cf3mao5n1WdUY4t
	XWSMuQdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbfrf-0000000GQA9-32Y4;
	Sat, 25 Jan 2025 13:06:19 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbfqM-0000000GQ6H-1w23
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 13:04:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-438a39e659cso19031305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jan 2025 05:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737810296; x=1738415096; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ufdypkJNjHswejxJubFk9kEYQm8Yr9F5qH7/Hz14nEU=;
        b=CMDpuz9TrRlHjp/IqQV/qPcFgNmPUsX+4KD9YJOd/eYsopyOmiU3Xhr+nR5a2KG88h
         nB//DjvcWu6V5s0NA4aXf1/zaP9VMYTaFVMASSKsaCxFPpTSioaSX9DBZJjtdUs2qjm5
         cDTFNHyr8rkzRD8ATGbThmecBtDD+f1/rqxGQG3LKH44/BbsU/jOb0YsnVCw5Kvog3KI
         i1Qtj2c90KYBm3ahGFiB+YJr6/sPkq4WM+VoyC8YznhlvRJ4rhMpMBsvybIEEhg2JnBw
         jsUDRknWhNaaVhkMUndFzyWvouEe31paBRbQBuH8DUX7F5xmJa6q+QypL37V6cuOI7/d
         nLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737810296; x=1738415096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufdypkJNjHswejxJubFk9kEYQm8Yr9F5qH7/Hz14nEU=;
        b=EHjI/OVUTSEDLesC/ZRNnT3rd7AiNGd+v7idipJlAjV45hgNhY6o7w3gTD5niA5Fun
         m15ym7CoS6ytieaq7UaiZ/T+5xO7sdif2VytUQC/+6ETzSIDgCGKbDd0wdOU74DRSjgE
         RZQF2wLJ/gMXlKllUOBw3y47B2K8CJqVTgaE4h2sWH9bLoh7EkKforxL8H+F+PqVuQMY
         746KXzt1ihvz3H7Yb1l+AT+QgTrT5jayr7Q5iKD6PjvHv3aLyJN6bwNd+5QJ/EnZJQQb
         GanCvIPsyZXsEiqZnRz2T8C+E24rIGaZ46hNJ9PYykOrR2vTD7+aHfAjbJr9oMXB2EwU
         dK0g==
X-Forwarded-Encrypted: i=1; AJvYcCWGATRLomwoVk388QAY2XIk4HY10/8LaelJQED5Hlx8SdtaEHTJx+QQPu2ihuw4z3G+/kBv0IDrj7FJm/wveLDJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyPSzjtWL1PN5hOUbNMA3vMIMPvE8ZV4rpHJwLwo022R7yKsuh3
	9RwkSSB0zlugaEnff9CfSE/LStKHGLBJDg6Alxn7VXED38XSkoCRZEUdmfdVtbk=
X-Gm-Gg: ASbGnctA+AEhZBv0OX6PJuZbjNFJuw5XYDZz8dxsqNaozs9MA0WxMrC7KVtQRNrN/TJ
	Rq5Unu01agry6HDY4R6fkucFIUWGvjTtUgjyGAGnNuRSESLjylVPTbYC/aMicgP7qXcRnku3Yvh
	wmhsAf0DDkRBOIXdc8K1TOwAosKcg7l7QImoTpGZQnBfgyzBNEWKu5aESnE5g9KgMp1GYh89P7m
	k0WQXo2DSQDoZJbYcQqaUB72W+4XJJOvf22UlIhIzzhp/B8UmZlsXArGNxJVBP7jX1ZUpAxMlio
	1hcikiar1g==
X-Google-Smtp-Source: AGHT+IEaOVgzG6Qtw0HZT4iWc73ce/VOtEgJOp3dSxRw2PlxaNl3qvT2R0XWbkFb0aXpK24XwpEiwA==
X-Received: by 2002:a05:600c:5486:b0:434:a10f:c3 with SMTP id 5b1f17b1804b1-438913cae48mr287922225e9.9.1737810296292;
        Sat, 25 Jan 2025 05:04:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4d3dbcsm61443145e9.40.2025.01.25.05.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 05:04:55 -0800 (PST)
Date: Sat, 25 Jan 2025 16:04:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: zuoqian <zuoqian113@gmail.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org,
	viresh.kumar@linaro.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: scpi: compare kHz instead of Hz
Message-ID: <967a5b3e-197a-4b90-9fe3-9b10782d677c@stanley.mountain>
References: <20250123075321.4442-1-zuoqian113@gmail.com>
 <20250125084950.1680-1-zuoqian113@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250125084950.1680-1-zuoqian113@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_050458_510179_AF40FEA8 
X-CRM114-Status: GOOD (  11.90  )
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

On Sat, Jan 25, 2025 at 08:49:49AM +0000, zuoqian wrote:
> The CPU rate from clk_get_rate() may not be divisible by 1000
> (e.g., 133333333). But the rate calculated from frequency(kHz) is
> always divisible by 1000 (e.g., 133333000).
> Comparing the rate causes a warning during CPU scaling:
> "cpufreq: __target_index: Failed to change cpu frequency: -5".
> When we choose to compare kHz here, the issue does not occur.
> 
> Fixes: 343a8d17fa8d ("cpufreq: scpi: remove arm_big_little dependency")
> Signed-off-by: zuoqian <zuoqian113@gmail.com>
> ---
> V1 -> V2: rename freq to freq_khz, change rate to unsigned long, and
> update patch summary.

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


