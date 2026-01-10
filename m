Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B4CD277C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 02:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CS+sPGCudOBw/4dF2tLtNG4zOFpBZ8fj0ZBfM+xSUg=; b=OgCR2886tXPuxFU+RHinvGTlp2
	qnl1N3bYVySJsIEEUl8shzffOozvkp5xm5RYc67PLtCdAIlYE5CWgXq/qH7OUtwRsLf2sGPrqZ42C
	HQzQrKVeZm9rYs6MAbz4ptENqBM0P29y4XqJpVlxMfIkPbM2wdU60h8kJHFvpV6M5ZD0Pu98SC60A
	SocWjZLwlQfdCATd8RVOawp6rA0M0RfEalnlYKIqVpKyw3xNwYy04qc3n0TPzvyHnYKhzBEaq0Vey
	4eMAazUXBwVJdXyFMe6Lt2CzEaQMq0vkuZ9jqKXoxq6EK0lolA3AqzVfRnUD3jDfoL8/fRA8rLu+T
	+i8uvicg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veOXM-00000003BGv-07Ka;
	Sat, 10 Jan 2026 02:17:08 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veOXH-00000003BGY-3ANy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 02:17:06 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-78fb7704cb4so47669917b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 18:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768011421; x=1768616221; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/CS+sPGCudOBw/4dF2tLtNG4zOFpBZ8fj0ZBfM+xSUg=;
        b=BNLfE3loeDa9FTbxkc1CKqSGNtqR5T5xycaRops1D4kYemy0uHuOGr/E98LG8AQOzg
         e5LUhWCsd7lVg1DR7sexrLZRgWhk+XA2Mv9Tfzw0Z8NQQW3ZIyqoEDvnJxIa35vrm1jY
         umpjt6Cp2JVGQ3Hq9mOwPYGfTR29GrLQubBRAYsA0GFJC5aCOLDxktf0fCeNhMUSaZZE
         PiEwWJqRpfNyYWhmwO3hHn0plzxKwyhDRlEQw8MN7YukhWgoQoUGEB2gkkyR1am782UQ
         nw6r2rs3iwQjeYCh0Glmr9qgWMYfcVQMDPrsdb6eP/d2Ugq3uJ8LlxpBG+7QfxYA0kTt
         kTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768011421; x=1768616221;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CS+sPGCudOBw/4dF2tLtNG4zOFpBZ8fj0ZBfM+xSUg=;
        b=IugsqJ2nOBDcE+pcKiVmHG3CTYerK9Dr8cZJDKKcMccR7WHl0vUPxgYLK0E2IM7amP
         wc95jNW00vS3eBbweah+pemiPSaJT0qCZJaFsENhiEgHAPkjJjGQicB7PxIDaOEmRXc/
         OuSTvOXjdz61vA7dlpJDW96F/9TnzLHh63FNezcBiLDoWDLSQNrtkwKJ+Z9GPlO0YSBB
         mYG8sVjBV44cLXDJT4xGQxUpsRicTsm0hVqjSQ0wysNd67EKjIybtE29T9P/Vd4YhEBm
         2GCSUmFh3rB4o9uwxWBzinysVCFAslUFboNyoSBsKweq6tFb2gX3RRN1Ic8PvCj31wUW
         vdbA==
X-Forwarded-Encrypted: i=1; AJvYcCWvAfIuNs+itc6ItayFBCKtQCxJ2cJwfIr1e2GB1f2lBUkMlDG06zHhErLGSw/uW2wr8SuvQKVbdZq3mGd+y0qH@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo+rMmI8D1OyjBdlKK4KOars602Mh4KWejyAAeAZ+nZBuBpyna
	iW2gcySsWAEZ9cZ2SMZcS5YiXN6ZGYpsaJl4oWwkjJVuJr89vvJ93qHwCK980PU0Vg==
X-Gm-Gg: AY/fxX7oPxnYQ1q07gSrf1iZGd6+uQSoQG9AKO5Wfc1MyCdJ5ByiqtU7jDlE7zSs56l
	Nu4UX9HewSVlGCKZahiszqho3SpQsmqNHr3JGPPDI77jahUisVOA6ZO+Sm5EWpE/+BK8Swun06Z
	8O1nU07KswRjHyN10YvZlQG63xbUns8cVGM3KSNb1FZRMmAXtAmbWCJTU0VIciY69l7YN7iudpw
	5uCZTrT+hNXr0CpRb0lfdqJdz61cPtZolXOLx1AYCbDA4uCUsQh3Y/lMf5/q8E/o3Mcvqtjsuri
	CQY+1EBF0TSAXS/GpJvmjtblr0AXcoK+hhVrA+O0NaTcJX8sWk+viBw53/jUmbDZ1dgIWxL/DwX
	XhK28BrKgX7YldzfOnndA1r3tjTbXZA5dVKH7LzBO1OaL5FnrII3OiKrR0yEq9LFTTIkRn/xzEp
	rPKeCNw4ZLQ7/HOtNkzam4sMqvqnoOJwXnsdrLek/xcsaniEIOrQJaPK14zqsz+xGd9w44pw==
X-Google-Smtp-Source: AGHT+IGX5MeGSKttRFeAc0MSgP/y2VLZfmVAUtwN+S37FdIJqLLc9vxJfr4q2stpMVFT7lLIyB/0qA==
X-Received: by 2002:a05:690c:6809:b0:78f:a6e7:76d8 with SMTP id 00721157ae682-790b5758359mr102216847b3.18.1768011421232;
        Fri, 09 Jan 2026 18:17:01 -0800 (PST)
Received: from ?IPV6:2600:1700:4570:89a0:1dd1:9ef2:39ca:beb4? ([2600:1700:4570:89a0:1dd1:9ef2:39ca:beb4])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790aa553ac3sm47388137b3.5.2026.01.09.18.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 18:17:00 -0800 (PST)
Message-ID: <9f94993e-dd69-4c9e-b467-aad6031c83d4@google.com>
Date: Fri, 9 Jan 2026 18:16:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] usb: typec: tcpm/tcpci_maxim: deprecate WAR for
 setting charger mode
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
 <20251227-max77759-charger-v3-5-54e664f5ca92@google.com>
 <aWD_RIPp1ULH9St1@kuha>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <aWD_RIPp1ULH9St1@kuha>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_181703_870818_819E8D5B 
X-CRM114-Status: GOOD (  23.40  )
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

Hi Heikki,

Thanks for the review!

On 1/9/26 5:14 AM, Heikki Krogerus wrote:
> Hi,
>
>> +	if (source) {
>> +		if (!regulator_is_enabled(chip->vbus_reg))
>> +			ret = regulator_enable(chip->vbus_reg);
>> +	} else {
>> +		if (regulator_is_enabled(chip->vbus_reg))
>> +			ret = regulator_disable(chip->vbus_reg);
>> +	}
> It looks like you have to do one more round, so can drop the
> regulator_is_enabled() checks and just always enable/disable it
> unconditionally.
>
>         if (source)
> 		ret = regulator_enable(chip->vbus_reg);
> 	else
> 		ret = regulator_disable(chip->vbus_reg);

The regulator framework uses refcounting on the number of enables. If
the number of times regulator is disabled > enabled, a warning will be
thrown. Also, I don't want to call regulator_enable more than once for
the same refcounting reason (will have to call disable those many number
of times to actually disable).

> I don't think you need the check in any case, but if I've understood
> this correctly, you should not use that check when the regulator does
> not support that check because then the API claims it's always
> enabled. So I guess in that case "if (!regulator_is_enabled())" may
> not work as expected, and you may actually be left with a disabled
> regulator. This may not be a problem on current platforms, but who
> knows what happens in the future.

I don't think this should be an issue in the future as this driver is
specifically meant for max77759_tcpci device and should only be used
with max77759 charger (they both exist only in the same package). And
that the max77759_charger driver does implement the callback. However,
if you think that regulator_is_enabled() is unreliable, I could track
the state within the tcpci driver instead of calling
regulator_is_enabled() and call enable/disable regulator accordingly.

Let me know wdyt and I'll update the next revision accordingly.


BR,

Amit

>
> thanks,
>

