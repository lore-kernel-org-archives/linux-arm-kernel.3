Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6095BC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 19:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTIqEttpvQ/gkRM13zs/WdaTG1uYFQ+x2bb+IMCsFtU=; b=GPGiX7GvlA+UyBWXX01QOedObD
	7MQ8rMiIEwdVl7IvXer1B72VmUGiRGglBTRpL55bfgEB8/tdH+VeHwAViPxDn7nPiMIJpMx1h03xK
	9Zz3ldcHDNP81t92sMKC8uFZjCVOL4C49Ia0tWN7oEdXiUXAITCePhjCCLRtsbogU1TGl/2mXxFRI
	iv16MLqJ/EXA4V52bTUFUxZrPVWJCek2U+lTdDP+OWXjFmJmB7hZol4xJwG45+IOxWQhIHTpy3Ylm
	2UKp/LhrN8+GPhLVA5HRtx3f2nM82G6lRzwfot6Oe/HozkObMaNa0e6nhTxeemxco4vY/rdepJOJs
	Vf2jry5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFwh-00000003nXd-3yw6;
	Mon, 17 Mar 2025 19:16:19 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFv0-00000003nMA-2o0P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 19:14:36 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3912622c9c0so737972f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 12:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742238873; x=1742843673; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bTIqEttpvQ/gkRM13zs/WdaTG1uYFQ+x2bb+IMCsFtU=;
        b=PxamnqchSJFpuPVNp8zzEDOOmynaEMAoH/NyH1zYat5K3epKFm0NrSum1/CYqgnqGN
         AKzonw/Twva6d1CxUmrlNdlh6IL3M4SwPRsxJtPAa30tcbcW+c8v+OtNH1MIe1ZrrFxB
         hbSoZFWdVMXmwpGIAHQIUNjrFD3kInvD/gE6ouJc3K6vgCBlHnzHYocZLEv6+DiqB7T7
         E+fhwN12sH2ONTMAiokWrZsdHl+cEmPqoa6pYW89fEBDjNYXIzj77Wa3LnPNJdjvTVGE
         7HIcHblH2dU2vJM8ARkohU/nZqzxwRb6sVbf2p0KYJ0Eg6C/b34zscG6mZtZtW7t02zK
         BNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742238873; x=1742843673;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTIqEttpvQ/gkRM13zs/WdaTG1uYFQ+x2bb+IMCsFtU=;
        b=mJXcWasdK/l9FHwhEFtnOkfRQLgKQkYwGv16EMbwASVL/mFoEDKbN6p2ZPvjqzKfiK
         jKtc2jS7zSVT+cLVEovRne/l7yXUAZdITk6+rCcQjeiUOTDEs2dUpt3UoIBr+cE4vcGe
         P6O5HSdveAKc7XN5H0RheXFS1nIVf+2jrQKUTYqZwazAZ9wx1H5BloYpAiFGXTspxJvO
         mPXKji3icA/6jrDdrebG+pSmMwJxnuLAU13bVqrT+6Z9vHynRRrwNPftjNkzyxOC/FnH
         UjsKfggLzcINKdYQ6N3RErPQPGPptn18yVr6zz/tVeuaPo1aDO+mIOJRqp82XR6tNiHY
         BXhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZxMOFAs+6gBNYVPAHd3DFaTJBfRGivkDWFSeCAsa7ZjWh0Fhld3Mxh6qeHeh1JfqtRINVhA5oEguT7s/ozC39@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1ubZwH8oiL78Q16ei42qhzVbaFEAAoheW/CKBb6a8Mu1WCn48
	DiJcJ5QEVnxs2uCKB6PIopVys5CaW++fdM0F/rxf+8bbdXwqFxJNkwrIoMJLRXU=
X-Gm-Gg: ASbGncvSUn51qqlMBmXD7t+JUh1Su1uxeKdkEl1avFIen6xZ6dtWul8Ns6AHqJDGVId
	JAx/SlXbF6elrqtCaH8L1yUmxy/eZX+4rfP1e9L3327EWmtRsMjNqi5903Ee3Y7aqKRlPpGM4KS
	ojb7npeLmJLWFCKXY5UjRjGJf9SyytxlXybblJ/AC+9rrZPBepynpwY75Q+PivANbXnjSW43bhg
	vh30KUAcLgQezdgDZc/DHJODk0wRrzm2+jbiuij/GkYnQ3nIf9BpdU1W/olYuqrwQufTLcc6AwY
	CkpF/JYxX2E/iGxjMmUPkJ9qZWl/ysd/nR9vfrX8FVh9pMcDzIQNDv7vG/dDyzs=
X-Google-Smtp-Source: AGHT+IEPNlsvV91iELo/pNhvH+905voaht1iroQ+4B2H6u3ju91Eoa82UvbCFExYLwzebF1yz25EhQ==
X-Received: by 2002:a05:6000:1a85:b0:391:10c5:d1b4 with SMTP id ffacd0b85a97d-3971d8fc3femr5445781f8f.7.1742238872825;
        Mon, 17 Mar 2025 12:14:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975b09sm16097525f8f.57.2025.03.17.12.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 12:14:32 -0700 (PDT)
Message-ID: <88c66c98-7ea3-4172-9c99-405fe449cc5b@linaro.org>
Date: Mon, 17 Mar 2025 20:14:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: OCOTP and DWMAC builtin modules are needed for imx93-11x11-evk
 kernel dev via TFTP and NFS
To: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Cc: shawnguo@kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <Z9fhuVltKwqgHdLp@alb3rt0-ThinkPad-P15-Gen-1>
 <935028c6-ce56-46e0-96ff-46fa91c8f66a@linaro.org>
 <Z9hkDqcKG1xOmIB5@alb3rt0-ThinkPad-P15-Gen-1>
 <ef163f08-35f9-4d1d-8082-c826c6cd0aa0@linaro.org>
 <Z9hxKlrrqW4QyzdJ@alb3rt0-ThinkPad-P15-Gen-1>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Z9hxKlrrqW4QyzdJ@alb3rt0-ThinkPad-P15-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_121434_716919_2600FA9B 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

On 17/03/2025 19:59, Alberto Merciai wrote:
>>>
>>> By default they are enabled as external modules, then until we don't
>>
>> So everything is as expected...
>>
>>> reach userland they are not loaded thus eth and all the mechanism behind
>>> that are out.
>>>
>>> I'm not using initramfs just tftp and NFS as follows:
>>
>> All arm64 platforms are supposed to use initramfs on defconfig with
>> necessary modules.
> Thanks a lot, I was not aware of that.
> Do you have any reference?
Reference for what? initramfs?

I am using meta-qcom initramfs:
https://github.com/krzk/yocto-qcom
with copy_modules argument:

https://github.com/krzk/tools/blob/7c0d1cacad06aa0cae8c2983ae26889471a9aaa6/linux/build.sh#L543

And here is how I append stuff, but simple `cat` one cpio archive to
another cpio archive would work as well, just be sure some paths are not
symlinks (/bin /usr/bin) because then `cat` has issues:

https://github.com/krzk/tools/blob/7c0d1cacad06aa0cae8c2983ae26889471a9aaa6/linux/build.sh#L504

Best regards,
Krzysztof

