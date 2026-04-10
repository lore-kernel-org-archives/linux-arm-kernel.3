Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CDAE99055
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 08:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BEjNTZ52iqkOIz/fiEhyFtAXSBuFOrTZ5/Vj6wH/Ew=; b=W29X3k1LOLIJQROt1b3n1GF47I
	g2AziXUf18zoY73y0umgF27w149xgafLkA+euZE5rZ6Hl+X86oqVBLNxCliqP1bQgTWzUHP5fQh0a
	e7pOJ9fWxc+iEgSz2G1X79ncnrX0fmd/FIq/NIhGJ/XMbqmXtMNL15byq84rcALgYh9oj/Re9orV4
	jrkQy0lIDRcQUBDDi/FKrAXy/gk851ft5cYCaWi4GSyFQph+Xl2L70qy7ZsjDN5VNjW9JiR2SHlZw
	AyFS2cx1kjvrxGaxxt8g6ylKpO/yz+9qxsN+EA1Bj1Yqned0bpg7VWS6GwXTK08TM1JpJt+P9Q7qz
	2t2Zw8tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7UV-0000000BrBd-1DWK;
	Fri, 10 Apr 2026 08:45:27 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7UT-0000000BrBH-2eCY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 08:45:26 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso27936955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 01:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775810723; x=1776415523; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9BEjNTZ52iqkOIz/fiEhyFtAXSBuFOrTZ5/Vj6wH/Ew=;
        b=fzS7z2882mAJg3Xhgz4wls30LlWdIbl7N25sLw9liUrSsXNlg5ktw3WQdHvPPqEYAw
         k+TN28/nosKWK0cULVYxXwS1Gc/738DmB4ljTLyZz7kUnmhJ1mODOKoc6z4F7SDijNhb
         Mb2o/Ziqm2UGaZKy581Fo3VCkNabT9aZgEzRNyWLHfRxxOR50RAj/VMUxp3VZJIuxeen
         OO9Aan1wt3bPVXO5Css1aTRBwkkCMqyJpF9C0wZAnwTmSKXtzu8+OK4NIjYHLX08dfY1
         mWKgpgWm4ApZLKTDn+2Xrp5AD3oq0FxCjWLCxjgzwzEE1CEB9D4dSulN8wcYd/W3+/cK
         LcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775810723; x=1776415523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BEjNTZ52iqkOIz/fiEhyFtAXSBuFOrTZ5/Vj6wH/Ew=;
        b=X3yY/x2ujl6VO/v782aWoz2HH5lKYa24a37gpLZzcfsWX5sg+319RW7pV2gEti8vDF
         tlmpSLRkEesWB7yBEQOxp4gSl3v9Q+dn5mk9ZMiHzaZ+u91Cv6mEXuppKBtK40xDY7FW
         k3d17s5OdGHwXIkXMvdc2cfPghrDc5pxA/HkmWqek7KjH4sTXKWUjhTO+xN7MfPy2yGX
         RgwVtMYidRfm782wKclSgzTxHxLogTPTaID+96w6W6eb8lkaAGBSUYLK8zJWIX2XIcfG
         kekeCAi9cdUbB3vfdmXzsBxHmbiXXkQOHRQ5KA2AHBonYKUsJM5W5YSe53wNLMPDQFaw
         bubQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNb9tJycbj019fMvtsAA1SZYmF5jstahMS9vvM58bfZKMbSMUWPortV3jpU4iTTJcRhlxnWswLibzAKnPHTiEc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2TW0MwwEUBFWg+AaHF2L/knysXGHJf0dcOf0xcQUiF/n6+kax
	i6J4nSdFntKZ1fnLF+vlW08smVpuOA1UJO5d1FLjBDY4lYmALvEAsciR9rCujg5oA0w=
X-Gm-Gg: AeBDievZJjHEQ0fKVm9RlSzjASKzet9QYDXyV8ot9Zp34Y3ShFwlEuuq+2+y//yekeP
	LETGhpNjoJBufLbWEcHXZrMgOnwi4kXeDh2AFW8X2Whd5FNtp/pn0LiW5neIDT41tW/orAgjDVE
	ihVh5cwq5sxGX6w2WXCgBMvxTz7l6izX6xw62YTmhFnFTbtUN2lc/ebsac25zYCtUex1iYoy6Wq
	4H1B/IiL2lP9l8OO/pYRhFJ9IL7qgCikvCBFwmBKWjkF5EFdXvE7hqc6oLNjJ4IQrgHK/san7/G
	xLLaa86RQe+FMV74uJNNjitTSZ+xlXdDABKiyO8cIXtGfbaeilAZVNFbPXznFw94hGGcLdGMW9r
	4OZQR1uDLGO+Dofiybg8FptK6XY42ZgyAzSoKNW+qG0LscP89pud2z+AL2d8vQKvlXRGWXyx0p/
	kHToQ+N+xOGD5ukumJwBUE0TLN6k4Vk/XVjWqSNj8=
X-Received: by 2002:a05:600c:331e:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-488d684323amr13756925e9.15.1775810723456;
        Fri, 10 Apr 2026 01:45:23 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5d85fsm4969913f8f.36.2026.04.10.01.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:45:23 -0700 (PDT)
Message-ID: <8c0bf2f2-c577-4c8a-87b2-1488635185b3@linaro.org>
Date: Fri, 10 Apr 2026 09:45:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 17/20] coresight: trbe: Save and restore state across
 CPU low power state
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>,
 Keita Morisaki <keyz@google.com>, Yuanfang Zhang
 <quic_yuanfang@quicinc.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
 <20260405-arm_coresight_path_power_management_improvement-v10-17-13e94754a8be@arm.com>
 <e2241b98-92a6-45e0-a9d3-061f1ed69ae1@linaro.org>
 <20260409155433.GV356832@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260409155433.GV356832@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_014525_733221_DE359239 
X-CRM114-Status: GOOD (  17.44  )
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



On 09/04/2026 4:54 pm, Leo Yan wrote:
> On Thu, Apr 09, 2026 at 11:52:06AM +0100, James Clark wrote:
>> On 05/04/2026 4:02 pm, Leo Yan wrote:
>>> From: Yabin Cui <yabinc@google.com>
>>>
>>> TRBE context can be lost when a CPU enters low power states.  If a trace
>>> source is restored while TRBE is not, tracing may run without an active
>>> sink, which can lead to hangs on some devices (e.g., Pixel 9).
>>
>> Can't this still happen if saving the source times out on "wait for
>> TRCSTATR.IDLE to go up"?
>>
>> That would make coresight_pm_save() exit early, not saving the active TRBE
>> state. Then when coresight_pm_restore() is called it restores a stale
>> inactive sink, then enables the source again which is the state that can
>> hang.
> 
> Hmm... I don't expect this to happen anyway.
> 
> If CPU PM enter fails and returns an error, it will bail out early of
> the idle flow and the CPU will not proceed entering low power states;
> therefore, the restore flow does not exist.
> 
> Thanks,
> Leo

Ah ok I missed that that was how it behaved. I didn't realise that an 
error here would prevent the restore from being called. That makes my 
other comments redundant as well then.


