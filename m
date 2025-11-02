Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDEFCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 17:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2Ec2zQurK8STOuaWu3d/5bNQMcmfortr8Sd7cdcPYw=; b=gwDdVtXDrWs1yjfLbzgwORelfz
	9x6BU/V2tg/kZBEGsmX4AFr+EuUjxEvmaCisCH+DL96Vgt2mnNetGZ4xUNM/VtXGJKE6xmy7+9Md2
	sO1vatTyC64hbUG6ekrp036ZrpovLKMnpFN5W0mWY9heXeDqVKQo9EwTG1R7X0AUU0/o87aPXGVk2
	Aq6tor1dnqWRdRu7fI/2fZlP4AsQKt6DmFHGN0de5bsCBMROdLiOd016Kp1yqQMmv/KyG5SIggA39
	NTIuZK1VhyvXRjo5YygViYZ4gRPab2v6hi7muPJPvMMlqStMacq7RFGzxiHbtqP7u6BYy9yTOe1eX
	Bfe6bQpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFcFe-00000008iHZ-26i1;
	Sun, 02 Nov 2025 17:52:26 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFcFc-00000008iHC-2MiK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 17:52:25 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-29470bc80ceso40618875ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 09:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762105943; x=1762710743; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=H2Ec2zQurK8STOuaWu3d/5bNQMcmfortr8Sd7cdcPYw=;
        b=GbADV9cPw4mD5nWv0Vg3HvyKWrvzYBFEEM0pxJFsPwlptC391nrpOuDBUGIkTet5+q
         82XBymop6YRqhO5jL0sbMRyJ2Pp3tHGOAallpXmNRqO7k3LNB4uNXX1dUL3QOgTYoNJi
         QlCEfgCGx9BIqBgbsSLvReIApTLFa5b+Oj6attvdjbXGc1v14CPm2wJyCMlz96ByHtlF
         lq5cCdp8mz6OzwNQpEsjeCZ82QYGG3V3Hq+S08Y1hntRtcq7wEwkF4wJ4PcQovsx+PEm
         i5ozQcqxvgnMcgHq00kg8OI3usHfP+YwNRr6F9AMNKJ9sl+jPFrFut2FyefA42ECnMTR
         Xjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762105943; x=1762710743;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2Ec2zQurK8STOuaWu3d/5bNQMcmfortr8Sd7cdcPYw=;
        b=Cw6/ZFoSn99Q8YEQ3cXhqbJs19OMo7RitdUBShhI5+3SAzG6cLM/Ba3nupdg/XYVon
         5t9iOA3HrgHCtTWPm63PHFkOplWQpy0tsWqXdN9L25zs7j/zDagbG5D4idMksEbWHsxq
         7BuM0+fFI2XxGUcCd/G8hJxZUYXADlziUGbNcMkcYJNhrUrBD1GSFnTpDC2JsPSoZbGQ
         NfQjoTW0KIbrdO8TjCebkBQixysALpEiugRw/AG5q6N3QWSXfdiM7RYmoOYWXGFsKzHu
         EYAI2J0P5wJ9zgyEWM/H2XJoy8VRBqZwOdKfvlw+XQ+BH4TtoidXJL3R58H4zn/bEB8Y
         Cn+A==
X-Forwarded-Encrypted: i=1; AJvYcCUvm1lsoY8pFObcri48KmXhxRKMuVOEn9XUYwSQI88rI1qJ43vfl+Ad+cKSQda1LNlWKvyuqOYtS//nCQR1Gq4G@lists.infradead.org
X-Gm-Message-State: AOJu0YxdOg+ZaQAyQuQpC85tHBYCIrgv8lYLGgJxWkz+awYypoZAjgww
	PD4tVM9tF6pNy/L8nbkXo5V0P134gs6wMC1JoeI48Xqi8mrLmVPTEHOq
X-Gm-Gg: ASbGncsSeI10twXjKBfYRkY8dDfzwDrrTA8Tx5aDyLKYpeUZwL0dOvZ+vrCLX57pWhi
	e0HKg2JbJ05rLHnxjc2pGlUtkLy2v7CaSWDWm8yKekTAv4FbpOWeGGWA1LYB5iqAz9JaFGnELjt
	69+YU2FMMc9EHw+5ekLLuAZbK45Ox3MRXW5VNy4S7nlhmfRCTWVw/9sq31WQyF43MmPrb7i5b2Z
	qCHRQpsBq3evcBCyDU+3FuiHlFN+No59Jeep/VSuQz5HBAqGCXVjsftfh7HbBUOi4TiRmApFgYU
	n2nncp4Ms9uj8VjBcieU+RlXtAyD0uJbXpQN5KRUdYSI5E8bU3DOhYc7+a0PzjbgALkEprgGDPa
	eExtCTi6R1XwdB2lncBKha+YQfwf3RJVGt8Cp6gw040AM1YiqZ2A3DQJRxKljE8rf7kKXLEOGua
	fgH7Mvz7HvYPq/3QCFNMiu238FQj56DacBCfnX6rUKfcc8HgzS
X-Google-Smtp-Source: AGHT+IGtoTdzpUb2T1EbfjQRkDOZfadeV+MUvBKwgGICeRZwRx4ujvdTe6AhPX5UfUKG81LSmwLfZQ==
X-Received: by 2002:a17:903:228c:b0:273:ef4c:60f3 with SMTP id d9443c01a7336-294ed070898mr190085585ad.4.1762105943418;
        Sun, 02 Nov 2025 09:52:23 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952696ea51sm90821675ad.57.2025.11.02.09.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 09:52:22 -0800 (PST)
Message-ID: <71da525e-fea1-44a1-9d47-9280654690ef@roeck-us.net>
Date: Sun, 2 Nov 2025 09:52:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] arm64: mm: support large block mapping when
 rodata=full
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, david@redhat.com,
 lorenzo.stoakes@oracle.com, ardb@kernel.org, dev.jain@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, nd@arm.com
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
 <20250917190323.3828347-4-yang@os.amperecomputing.com>
 <f24b9032-0ec9-47b1-8b95-c0eeac7a31c5@roeck-us.net>
 <933a2eff-1e06-451e-9994-757d66f4b985@arm.com>
 <bee6b93d-aa2e-4335-9801-89f02eb3eccc@arm.com>
 <CABXOdTeOU0qeSicdDU6DjNHWpzCEhK-66kTdwWjb3M+=Xr3aMQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CABXOdTeOU0qeSicdDU6DjNHWpzCEhK-66kTdwWjb3M+=Xr3aMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_095224_605127_250BB0D1 
X-CRM114-Status: GOOD (  13.11  )
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

On 11/2/25 09:49, Guenter Roeck wrote:
> On Sun, Nov 2, 2025 at 7:09 AM Ryan Roberts <linux@roeck-us.net> wrote:

Oops. That was sent from my Google address and got messed up.
Copying Ryan this time. Sorry for the noise.

Guenter

> ...
>> commit 602ec2db74e5abfb058bd03934475ead8558eb72
>> Author: Ryan Roberts <ryan.roberts@arm.com>
>> Date:   Sun Nov 2 11:45:18 2025 +0000
>>
>>      arm64: mm: Don't attempt to split known pte-mapped regions
>>
>>      It has been reported that split_kernel_leaf_mapping() is trying to sleep
>>      in non-sleepable context. It does this when acquiring the
>>      pgtable_split_lock mutex, when either CONFIG_DEBUG_ALLOC or
>>      CONFIG_KFENCE are enabled, which change linear map permissions within
>>      softirq context during memory allocation and/or freeing.
>>
>>      But it turns out that the memory for which these features may attempt to
>>      modify the permissions is always mapped by pte, so there is no need to
>>      attempt to split the mapping. So let's exit early in these cases and
>>      avoid attempting to take the mutex.
>>
>>      Closes: https://lore.kernel.org/all/f24b9032-0ec9-47b1-8b95-c0eeac7a31c5@roeck-us.net/
>>      Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
>>      Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> Tested-by: Guenter Roeck <groeck@google.com>
> 
> Thanks a lot for the quick turnaround!
> 
> Guenter


