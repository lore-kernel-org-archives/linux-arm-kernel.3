Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0392EC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 08:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JIGp9HjE1JQI0cU/AR14+B+jOi/q9Yhu0Kcy46p6P3U=; b=eCO69voWtyftw/G+6qKSP+fwCo
	sJV2IM6DSRLGZzgnouK45Rhws/dOpvejnF/NrchrL6Ux8nQPdmYiqP54e7WVWviXNqgMn/VwDWIIS
	BuCiIvSNwkGU6O1di8gK9ZjSD8IzugBMtdntVMn4E2CT8xDaKpDRrnzfHRLEHSKazYp+ACcXPUARw
	ewFNXzU4XZDv+gtgIcMlb0+Tc8pc0zR+XXJ3e90+SUBmWzyaI6jKYGRpV5YUyjrHRDNDWR1h5+pnO
	pLRr7JIYQqioEBVqBClopAbzVvWMaBkMydBOUjPVRfYZs+aqtXiZ6D0k3Q7OycdE6washEQnmmv5a
	1yJ5aV+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuni4-00000002KSj-3Z9z;
	Fri, 14 Aug 2026 08:56:16 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuni2-00000002KRv-1y0Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 08:56:15 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso12993135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 01:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786697772; x=1787302572; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIGp9HjE1JQI0cU/AR14+B+jOi/q9Yhu0Kcy46p6P3U=;
        b=DPu+uzkvVgXETuKKIUA4CGbpEfVxLDFmyJAmmL3KhsUcqsWcAH4DAT20JfbYuCojuA
         IIXBzrnqYui+1PUZ1wDLZdoF+iiD5NQLGb2YC6PfkWfAae0ZPRLbBtrmyAFMedGCxQOW
         QrXmVwdo7ncaXtm4DkK0jcItAy85NGLQEkfeCWJSffnNPlisl4E2YMf1Y+XjGsOCWiTj
         g2uf8cZ5KeEXNzTRYVdYVaLZh8qbX36Cs34rVVmtCyrg8ZPHy0SmWZYIfDv2sor3dRlR
         KW2ZR7iuEIhoxMuKozdHFKUBfHJvCg0MtGvXhvjQ0G69Zl6q70sVc4Rt0gjVDSKa/Gbk
         CAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786697772; x=1787302572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIGp9HjE1JQI0cU/AR14+B+jOi/q9Yhu0Kcy46p6P3U=;
        b=TsA5gemcJa8KiilEFadxKghDvKOKuJ9uufSxjbzuNR7L+Y7Nqml39pAZ8BqkUbvwgo
         IjeOueRcXl+DZHHINoYH4yOYfHmFgiSdYCpY+IeQXKxpBMkzvefa/Jof+7MV8vhGExx5
         Imp/gP2FH5RYW+JpDr5t9NwBOz7Mh9Is7nG8a8IxkCNzk80v9YJ6ijhkxZENkBqaG4W+
         EQFi/DUitAYs0TJgFWT5gunkVT2E6CAM/NGOelWKZIDq/Irglh6hanQtMBxSDyBXT8A/
         7CsZzJQ/L0h3rl1EvvsluPDhrdDleM33pTIv2h+PGRRig4Tv0zJQ7aLHYoTjUUelFVUQ
         Oy5w==
X-Forwarded-Encrypted: i=1; AHgh+RoIT4YAXmJyeR3kmpgzHZ5Ph4zvhwRh/PR8+LUNd9fSxDGfJrCPN/UWAkP4YAoboZ7Sz+eeLDqfJTHY98dEmD+m@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/fJ5Q0hx7+lPuXbx6YJFJppSRCQRk5d1EUyxvY72dvdZz9RRJ
	wQCuzwAJkdq/n9RuyIpx0bb8xSqqX4RuzSRnqo4eqghBARnPxyKP8SC/vyBM/B3HZFA=
X-Gm-Gg: AR+sD11F7omHJqTGUMKjo0TRePZ7sTzVk9yacgCll+DL/8K2GRPnd7K7pf9nIm8qtYx
	d7DRGlLAHvsOoSmzHvafUmIgH7UKEHPJIoiWd/YpI/vJmCxdc/YZn86L5uK2zna+KSdZ+4Qe9MQ
	A/4pNpvUejW1sXOOthEjIBZLKQHeIbUl5GLtfaAx9cMWo9LWxa0aYazquJyUbBsWyy8B3QyduDt
	ZDB43Z0FkDSTkcOxKE1DmVJKl6NupR6Spais2Se/OertRWBy/PqYETzl22bYsvgNTNIPL/1DuQM
	lbaC2VE5md9FGdz7EUVXOL9P7pU9Y+HIA7ws8OKTO00PpqjjkD4/o+9zkt0piWeYSJYVbSEbJjT
	nQNdCyRQs4z1KKpARGVCVk3We3oaa+EC31t/FGsuWDZXA66SxGYu1Lt3+6qvE08hM+REnIdFxOW
	MELgjPRveP/zYY12omWBpn6RcvgBuKpwIuw+6fXVY73wAkVkzUn8NaCk3qIyIh72chRA==
X-Received: by 2002:a05:600c:19c8:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-49987ad94c3mr42378445e9.8.1786697772202;
        Fri, 14 Aug 2026 01:56:12 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49987b3a6dcsm19775145e9.1.2026.08.14.01.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 01:56:11 -0700 (PDT)
Message-ID: <df303518-18b8-4068-b6da-774c344aa249@linaro.org>
Date: Fri, 14 Aug 2026 09:55:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] coresight: etm-perf: Flush workqueue before
 unloading module
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Qi Liu
 <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
 sashiko-bot <sashiko-bot@kernel.org>
References: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
 <20260728-james-cs-multiple-per-threads-v3-3-6aee7579f1dc@linaro.org>
 <20260813141957.GB8904@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260813141957.GB8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_015614_543456_0E248DC9 
X-CRM114-Status: GOOD (  12.44  )
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



On 13/08/2026 15:19, Leo Yan wrote:
> On Tue, Jul 28, 2026 at 04:00:15PM +0100, James Clark wrote:
>> The work queue is never flushed on module unload, so pending work items
>> can run after coresight-config is cleaned up or the .text section is
>> unloaded. The global workqueue also can't be flushed manually, so change
>> it to a local workqueue and flush it on exit.
> 
> Why can't we drop the workqueue if it introduces race conditions and
> complexity? In particular, I don't see much benefit from deferring
> the resource release.
> 
> According to the comment in __rb_free_aux(), the free_aux() callback
> should never be called from atomic context. It should be safe to release
> the resources directly from the free_aux() callback, without going
> through a workqueue.
> 
> Thanks,
> Leo

Nice catch. This was fixed in Perf core in 95ff4ca26c49, very shortly 
after the Coresight Perf mode was merged. I'll change this commit to 
drop the workqueue completely.


