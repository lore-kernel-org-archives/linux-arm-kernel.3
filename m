Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A4FC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sryGv+S1OFsRnB1y6bXfWiD/UiD8x5RMl0nBJ4p29PM=; b=wyBraoC387Z+z6vpHDkHfvfLSZ
	4PCj3NRyBNA2SGyQLz2UTSfOimskd3+6J6AnPUlNcMJdUrCqw4wY05Ik/+hTrfoJ0397Y5eOPEsPw
	qliJ0zQT+5CCkHOnWPkRb5HN49/6X76V/dpOLM8QrEhxpOifWU2icLUOj0qlMPyJtzFTaWA9iH+zw
	E7liaEZtDzs4tMuQleLLjxS8HxyAI4Qe4Un4oDsud6A7nxcY8ZrlJfeJ/TJA0PBDeNHcgt8nlXp9v
	LHVy1cLepSm0inmUXQpoKlG+wHaCtpzYb8Ch3fn9HE1Xn04PeSlLbL5kmo9wsaHW+afTRt3M6MOwQ
	dz7lzNtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFEC-00000007HD1-0VPw;
	Fri, 07 Aug 2026 07:42:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFEA-00000007HCO-3kqP
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 07:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sryGv+S1OFsRnB1y6bXfWiD/UiD8x5RMl0nBJ4p29PM=; b=o5gA8rAbGrbm+2lm2X0aTxgyoP
	Vfj1LIZUJo+ablaDT4lk2OpIIZ+SzuOJZCkssJLY0Woneqmn7eg0F7nKQ9ZcKrwh+alMhXgjFfK13
	Ur8Gn5i4ESl2OfjMn/L9vjGMhGJU/A/h/tsSymfAp4YvXiUHSRHKzCrdWNf2fxfTJawA+hyDehAfr
	hiNuK+7u5MVGy0NYYuzc8fYJs8UoT26xYe56G+w5wLIsli+/smn38whB31liJnLtWIlChR60/jC2K
	m/Hk4D5fld6I8qJ7uLdy2DNrkCXJJXjz3a80cuyRHmqkCB8EzjS/bRBVNpmFiZZKvFnbdlid8Tsce
	24GG+vFw==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFE7-0000000C9MA-2RoJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:42:49 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47ffaa8ebbdso1085595f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 00:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088566; x=1786693366; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sryGv+S1OFsRnB1y6bXfWiD/UiD8x5RMl0nBJ4p29PM=;
        b=vf8viTkXcc9rR67PlrH21hBNLl9oGug/+toqFmoKLfXF8zVrT9tNMopfNCHE4txBRi
         sTGDzPDuGufyUW87KaqDh0YmRrsfnN70SNKcp4AsXNIT3hGSt5V3S0N1S+2z9KqWD8fC
         ipek6cCBYBMx1IDvcki2subojpHvI5riPD9e6giSP59ILEtoNpo+vd0/dfLLlDidRluN
         AJpulUv9EWT+9DZ48FtNH3gsiV0p0oFnVo7LJx1zxIAUB9C6XQT1RRuHswvvJTQkfwT3
         mk2JGS4L8ZD0IkknBGfSIczLPRVLVBnbw66JCCc8WfSdOBX3HiF0wtuJRQ14xLuvSI/Y
         5e9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088566; x=1786693366;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sryGv+S1OFsRnB1y6bXfWiD/UiD8x5RMl0nBJ4p29PM=;
        b=D4PAohq2+80vNKAWq/AHYJB59cghbQaqsjcPFsIom3e+Fqrcn9lweGI+oIP3c6jQGF
         fveRJ28WFeG/GKYMsFZ5OfoUfn5+qw7fP0AauOvZCMIWtmEt8v1kJ5X2N2F1QSdM5Nj8
         XDpR0lwH6dKYEGE2TzmkyvSDv508YQq40RBw1FNgVSnShVGA4gvkKzPAaLPF5Qp5eMAh
         wb1OzTssNCTerWXprxD9mWOwCcXvosAH27pwSlnsyUiAcOkDzFTXzcZ8Xth4Hqlj7SkO
         jBTWlPT2Gfpe9DOQQoGj1v1HmjDf6+oIho3u1okLVE8OJQMxCbvBheTA0yiOS1MRX8+J
         ZftA==
X-Forwarded-Encrypted: i=1; AHgh+RppK2M7nDFR0Vy3rY5Jc6GyJ+x6ScLNQrQqB9MHjk0nBhEgQaKrpqLwD0k0RCsXhanE6eUMFje+GAgoCfCwz7Yl@lists.infradead.org
X-Gm-Message-State: AOJu0YxhN1iPmSOcZFBq7iTmmjeRLCsEEz2c5LEZL+KVxek0gEUbfzf4
	2Qw2M5enZIsly5GlW8T80CieHporldYYsm9uvZaIl+yl73UHi6j5rXyTQghV2ckBiWm8DcjMgdw
	L3+ZxIuIg
X-Gm-Gg: AR+sD10AFSkIYrW6fwvtGNdY5UcbZrBYQ7iO+G4nEl/U6x80DAeQTo5c9XSmMD1WYUb
	FdQmSCmekneFFkM9qq/IP5QV/lwbJesxKKp3U1WyaU+93qZI16EfoMkhU91tiIjrUyproUbLjGH
	pfzUkPlHT6w5GkgnagEVNo8F5NxVkTg0D9hvULKloJsp1JACdSDkGqhQNvHp+T3/KBQ9oeQTY0M
	Ypchq6XQu6n7iXJ1ausGVXYUSr2k3TQRF+VWSRv7xwanu/FwfG208DpI4dYbCDPIm9Umna1uRai
	asWu2HASgab8qCWuvoe1wPMUaWGFqU862RgWEDeDSnp+rDSk4TYZ/ioAjnc8Wb/Dgzc0ZlUu1Qv
	A1S8UNeiSpWxjqEAE0vZNw/2WsHNUpzONQQ8/rlKpu4oqfD+E+X/i0xxBdXAJy3ZjZyWZjJUPBG
	nPPLPT9FLYBDbSINMoyp4FiV38Fp/uIbQMKYVkQcwH7dQhvnlCYAY4YJu0vRc3NN1Ba8U4cT61I
	MsQM3yZ0JvPS9VZXn+xNgyrNoEzBz6vJA==
X-Received: by 2002:a05:6000:4704:b0:47f:6b9a:9d48 with SMTP id ffacd0b85a97d-47fec507a4cmr33818000f8f.13.1786088566064;
        Fri, 07 Aug 2026 00:42:46 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021506desm3339493f8f.10.2026.08.07.00.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:42:28 -0700 (PDT)
Message-ID: <402b7510-d695-45e6-b39b-e0cd2d61657f@osyx.tech>
Date: Fri, 7 Aug 2026 08:42:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 2/6] virt: bao: Add Bao IPC shared memory driver
To: Randy Dunlap <rdunlap@infradead.org>, joaopeixoto@osyx.tech,
 linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bagasdotme@gmail.com, catalin.marinas@arm.com, conor+dt@kernel.org,
 corbet@lwn.net, dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
 devicetree@vger.kernel.org, dev@kael-k.io, gregkh@linuxfoundation.org,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-3-joaopeixoto@osyx.tech>
 <df12062e-27ef-454d-b35b-526a88b5c7fa@infradead.org>
Content-Language: en-US
In-Reply-To: <df12062e-27ef-454d-b35b-526a88b5c7fa@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_084247_778290_B19F583A 
X-CRM114-Status: GOOD (  14.41  )
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


On 1/7/26 18:54, Randy Dunlap wrote:
> On 1/7/26 8:28 AM,joaopeixoto@osyx.tech wrote:
>> diff --git a/drivers/virt/bao/ipcshmem/Kconfig b/drivers/virt/bao/ipcshmem/Kconfig
>> new file mode 100644
>> index 000000000000..966bb75aa495
>> --- /dev/null
>> +++ b/drivers/virt/bao/ipcshmem/Kconfig
>> @@ -0,0 +1,8 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +config BAO_SHMEM
>> +	tristate "Bao hypervisor shared memory support"
>> +	help
>> +	This enables support for Bao shared memory communication.
>> +	It allows the kernel to interface with guests running under
>> +	the Bao hypervisor, providing a character device interface
>> +	for exchanging data through dedicated shared-memory regions.
> Please follow Documentation/process/coding-style.rst:
>
> 10) Kconfig configuration files
> -------------------------------
>
> For all of the Kconfig* configuration files throughout the source tree,
> the indentation is somewhat different.  Lines under a ``config`` definition
> are indented with one tab, while help text is indented an additional two
> spaces.  Example::
>
>    config AUDIT
> 	bool "Auditing support"
> 	depends on NET
> 	help
> 	  Enable auditing infrastructure that can be used with another
> 	  kernel subsystem, such as SELinux (which requires this for
> 	  logging of avc messages output).  Does not do system-call
> 	  auditing without CONFIG_AUDITSYSCALL.
>
Fixed in v3, the help text is now indented one tab plus two spaces:

   config BAO_SHMEM
       tristate "Bao hypervisor shared memory support"
       help
         This enables support for Bao shared memory communication.
         [...]
         If unsure, say N.

Thanks for catching it.

