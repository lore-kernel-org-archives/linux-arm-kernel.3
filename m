Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774DBC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 09:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4N1Q1nwOPIf6MIydtQa9UFtXathXYE0L3N4GuxjuFlk=; b=Z+9vFLNONqMecIEIQg2WtjKRwM
	kbLEHEGRyNM07WefYxIM0o0qflF3/oMhjmTCQ/IpyeqhIIbCrUUWIs+Zq3rZz562pM36txY5pl6mk
	czkyzzS6cTtSNDUWZaj9Rh/p2x0L8earv+E7eNVrTwZ+5lYCpY7gyEneKxxN1vxXTpBv0zbZmrbYh
	Syo8b9HjLOFXIJzGhv8HxbohXSLLzhWdnECUAGWQcJg6FiixBHY2nMnRxP1NwfT0aiWrkYPFr1Axr
	+68RjpP2ogZK+H1Bl1XV1cAZJzlqKqqg/2EV2t+VA1HEv8Gr2vsP7v8YIaWdbsd0aHAoC1knutIFw
	dddotfhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiVf-0000000DhHW-3Q95;
	Tue, 11 Aug 2026 09:10:59 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiVc-0000000DhH8-3YTA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 09:10:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49802c418b5so27043345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 02:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786439455; x=1787044255; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4N1Q1nwOPIf6MIydtQa9UFtXathXYE0L3N4GuxjuFlk=;
        b=Q0KRFDhe7tVNz6Md+JSRuUzti2C8Zxy4unL7yAFTJ+4fIPQze2BELeO14ft5K3EqyM
         0c5CJ6FA/UPW/8Szqg7iEeR0A4Jb38uKLs17RFKu4CqBK5fevXv+ocfOozgujkJmVKXt
         nYYHMU6OgmEjqOTqi1XwMwbGIZhG6ARYIQTjob22on5oTHeZ9Fe5jtUwi3i7+P4vMFRJ
         MFPAtLO7cBjcXIxhykVRSFAAKGjxg7pLbcoWkjnkJ1Gk3eqEcwdbQaFr8wS+i/IKn6k8
         zL7zXlPLpSHd0pgB02VushURpuYilQh502AE2N5NxHmqCvDgzXzKDc132iDUF7QYALf1
         g+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439455; x=1787044255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4N1Q1nwOPIf6MIydtQa9UFtXathXYE0L3N4GuxjuFlk=;
        b=Qvc/52isJ26Ghiud1KS9838n+QH6dURnAZGE23BXL2FXrNgHmXPykENTTecJAR3Eno
         yV5Gg7ZqiUcyKNTCCb//MguPR6WmSji/ZdosSaZMQepSCVs7H4Q2ux7B36zdapqXhQEQ
         oM2DpRGg2AdKQxwKx56obqFA3LTju0zy9Vr+nidfzMwZ/CCJGydXlqHUkLpK+lioMt25
         i99rwb1HAusBQda/mp/6vDGKccNJEe2D9FjGgN9/zA6BGAGKi9PNZnB9zCZrybDjd7tp
         m4EdalOCFbly7Wl68f/uT+1+bmMtGvEkLjaLdaxcqW2idPnKlhVlZ9Fm5sCxL4IcNVbV
         Cn7w==
X-Forwarded-Encrypted: i=1; AHgh+RqTBBizOPnj16kgfNiZgUXtk/lzGm1xfAN+21MCTJk/9LqAnsEPaKP6XTPKDplzF7sQQDniLXFTDn1aJv2e8qHu@lists.infradead.org
X-Gm-Message-State: AOJu0YybANlfiZ2geBNqXFOKeEuzE3pdQ6P7ALVdbANnDzF7q7OHkht/
	cMhcs6NtIaffDtLUxhj3IS63Zteou8mNaXp4ltO5YeSzejcDFCg7m9dvmkp7wUhLYFc=
X-Gm-Gg: AR+sD12C3aODmUm36xvFMEbS16ASHgrPOtVdv9H8re7/iyCVk1+lXasmyDIs/OHUiHR
	dZQakxXmgufAheX2tjbYr5ntZF8kO76a/2lJxqMJ1FOyAhzMue+0FHz0YvlG/dW7EB1K2oVLEfa
	ergTLGxSaimqXO+aS0zMLnYp9z6TuY/MDH5brGZEQRlT4qqAQ42nERq7A8b9gfwj0GWralzBk0F
	Ob8Eq9PauBk7EC2Ttnp+4kPA1dIxH511epux7kHmEV7KU2lmcJSVd+avpnIn9HxQ7jchJjlgrKb
	+gXBVGuYvuwE0i7VOeyKW0uvOoPstOBAAVj7z8HuogdfpcGIOmIPU1IuMm9JS+kLIAWvTXDWdtk
	6L0Xb6ulsNULakb0mC+yAPnY5hyg0nLRc293QQrRmqkUdxUp12BbDv738cl4Q5/7ojspePjQxPY
	ew7YXX/LviLhAhq8amdoE+xASG3gp8voCcsQ9omBYi+zJTOkV1IghG0LF86FvIiojglw==
X-Received: by 2002:a05:600c:5247:b0:499:5e50:5be9 with SMTP id 5b1f17b1804b1-49978e1a8b9mr24005695e9.16.1786439454855;
        Tue, 11 Aug 2026 02:10:54 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499788fd9a4sm30971785e9.12.2026.08.11.02.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 02:10:54 -0700 (PDT)
Message-ID: <7d4a7f0c-2b0e-471e-9c29-867bae981523@linaro.org>
Date: Tue, 11 Aug 2026 10:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight: trbe: Hide enable_sink sysfs file
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260807-james-cs-hide-trbe-enable-v2-1-0b2af223feed@linaro.org>
 <20260811090424.GD15499@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260811090424.GD15499@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_021056_900041_5E6CA788 
X-CRM114-Status: GOOD (  16.83  )
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



On 11/08/2026 10:04, Leo Yan wrote:
> On Fri, Aug 07, 2026 at 11:13:22AM +0100, James Clark wrote:
>> TRBE doesn't support sysfs mode, but the enable_sink file can still be
>> successfully written to enable the device, and only attempting to enable
>> the source would later fail.
>>
>> Avoid misleading users by adding a flag that devices can use to hide
>> either the enable_sink or enable_source files, and set it for TRBE.
>>
>> Don't set it for ETE as it's possible that ETE could appear on the
>> legacy bus and work with sysfs, and writing to enable_source already
>> reports EINVAL if the device doesn't support sysfs mode.
> 
> It is a pity that we cannot determine from the ETE registers whether ETE
> is connected to the legacy bus or TRBE.
> 

We could determine it from the device tree. A path has to be built or 
you can't use it on the legacy bus either. Maybe we can do a more 
general change in the future to hide the flag for any non-connected CPU 
source.

>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>


