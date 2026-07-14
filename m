Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FBAC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 04:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmJBr2Ms4rk2+zplbPjxMjuWScgK319b3jA8/a0Y4Zw=; b=s8cTr0XWxCirZD67kgAuXn93eZ
	2enTKIg2lXu95xaHGKC/AUftLXVWQeVevDZGok4ssAFK0UFszmdbdLlhO6XKsmY+MOFLkjYTHmV+p
	D6H0EDHIJr6mNSAfwWJSfdYYi6jMEfZwFNPRVEdsu2zy3PhtjOwRyYadxGyCM3qkTWzwwaHiEkpv6
	3v0jg7vBCB4evdyY3YeJ04cCCx1PalLj4/3FgdKADSxU+LZrK+1rM/Qr8RP8JfbqQZVEUSv22wf9N
	uvpw8EjqNaQNGMkwQAs/L0AMWlMIsauZPhbYSZX96ACCVFUpZJ0qLxdZ+t+EdB3Vx4fYswRcF5jOS
	T4HZXGKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjUWc-0000000ArAM-3pJq;
	Tue, 14 Jul 2026 04:13:42 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjUWZ-0000000Ar9l-2F6b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 04:13:40 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cc6dd436c6so6015985ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 21:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784002418; x=1784607218; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZmJBr2Ms4rk2+zplbPjxMjuWScgK319b3jA8/a0Y4Zw=;
        b=NJm6+tBviDbLPBfi+5HGhZcXmqQplQFWNnRCHy0gHfcR6/ueTS4nXhyBXJx4OGrrpU
         zTLHcs1mNCdly4lnh3FCff7bD4tESeTbiDU8bVISHtl9e310z2xGqggjrcNaH3f/ALXo
         +DYRoAmrTl8j0JhyDZZSmkAW+hQbDrFy21p/79Bp4kIespx/8AkbCW0uglMX245ieAAg
         dxlVMuVzwG77S7gfn1IFpQKpeYXFpB/0K80AVsOq55l6JVdESXjBjkTT/rBKpJU+bCy9
         f1RDLHGj2ItUMg+hvCet53Fxx8q4qDgA2I1f2MzqelDnF6i06iVLVabPSyJtSa6TBeip
         /tXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784002418; x=1784607218;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZmJBr2Ms4rk2+zplbPjxMjuWScgK319b3jA8/a0Y4Zw=;
        b=Ur1w6nyryhJHf1lJ/BzVgfG+Jzh0kPEp4fCL4kId42S9GKCtv36GpfCWPSloaSH+mA
         Gm81Xl0L1SL//w87LMhZS347t5xBTesMgaRx5qA4+0XzC7MabFG7g9LJHnJBwpai4cFv
         FxQaieyHAmDBg+mbw/Svm5m9Ckc1icGjcvySKTHRI7B5dXVFmbxqTO+hy+FeFsggPN+K
         g6BQ5H+d7/KLLglkww+6YQTGjlRAm5REFuAY2K/D38qd5A2pcNYDrvlLKr9RNsYYr58J
         aF8KiTtoihLQ7uYZnIDqXMy5sAlgrTK1csUcmHsZq0MLiC+3DoPlGIP01LsBVhNiCLR7
         LELQ==
X-Forwarded-Encrypted: i=1; AHgh+RopoGeL3NYybK1twU0yvvSqiRpX2nBibaZ0EaUzqKVhye4mK1lyAS7Axy0Rw5W/v+nEAGJLpddHWrJwJmmawv/P@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0c2Jvsi66X47idv3uvGMG99h42UOakceBeURrjCpvTn+MpSqD
	dJbNnjf79TXjgfJYDlQFtDRlWPgskDPoc/JxOFrPa2/mqUHF62nVMmjvuwIs1tErptg=
X-Gm-Gg: AfdE7cnKVGqhe9lkkuTO+mIfDwNO+yZJzwJ8YLU5fKHOqwhhx3jhGIF8lWMct4KRIhu
	1yf24UCx1cQ2Bgywcge5J/37UT+hz9rvq+mlbAn17IH7sBt3sgvn7E3UU9fTHatlQtjqWeztUq1
	GEgwzXhV8BGwQovkg7iE8EuEsIMIPYhQTFeuNPHdlCo1hAOnunXkqpxMG4KmxBVGSS+ggM55dpK
	AO6a6owj7y8+Bdkp8pKsWEwZEJo2YsX3c+HHTbbnYe0P6cI0zPKQi7ojKcD40j992bscNE1JG9h
	u7dSsASHXJijhMLG4IyldGy/K0Wjh5NMwXzokbsm6QpR8OPVWcMCg7G+qZmWRMmcU3QMbY4GZj0
	UG8Zu/mnNsC06p9D3iqQZK/WjW+jhOVRHajlT+h7pDwSRri90uf+up5SXK7obnjfvnnMvpreMxu
	wvZSO+nN+XvGbC
X-Received: by 2002:a05:6a20:3d02:b0:3bf:e761:626a with SMTP id adf61e73a8af0-3c110a74637mr13325451637.38.1784002417754;
        Mon, 13 Jul 2026 21:13:37 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm80207253eec.27.2026.07.13.21.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:13:36 -0700 (PDT)
Date: Tue, 14 Jul 2026 09:43:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: Pan Chuang <panchuang@vivo.com>, Markus Mayer <mmayer@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	"open list:BROADCOM STB AVS CPUFREQ DRIVER" <linux-pm@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] cpufreq: Remove redundant dev_err()
Message-ID: <ltocyzfol45faegfncfkism4h5ab3qydhi2rirykw5gfe5g43e@ayn3wxii3ikc>
References: <20260713131131.313588-1-panchuang@vivo.com>
 <247557f4-48d8-4cd1-beeb-3317cee58d0f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <247557f4-48d8-4cd1-beeb-3317cee58d0f@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_211339_586613_258308A3 
X-CRM114-Status: GOOD (  11.22  )
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

On 14-07-26, 10:39, Zhongqiu Han wrote:
> On 7/13/2026 9:11 PM, Pan Chuang wrote:
> > Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> > devm_request_*_irq()"), devm_request_irq() automatically logs
> > detailed error messages on failure. Remove the now-redundant
> > driver-specific dev_err() calls.
> > 
> > Signed-off-by: Pan Chuang <panchuang@vivo.com>
> 
> Looks good to me overall.
> 
> However the subject is too generic and can be misread as a cpufreq core
> fix. Please scope it to the driver, e.g:
> "cpufreq: brcmstb-avs: Remove redundant dev_err() on IRQ request failure".

Fixed.

> With that:
> 
> Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

Applied. Thanks.

-- 
viresh

