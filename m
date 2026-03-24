Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AD5E9A775
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 11:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zqrg2lc7oSR41YodgrBHmAdhnpQNxqFkkZK54x5+D5Y=; b=3oDuBCXjbcPjntHVDEAsRO2qYZ
	ungzZpGh/8+d/9oaH4amjW9o3CqCi9me96rYm/XbAYoR5t1wYDmgnn3vSZpP2EUgnWwd+Vb62sAJD
	Z31W9680ZnV2tGHOao3952WbI0+iGeXBP3E+qpJ3mcmxKIPoSIJN8sJdNeI5S0oMbDpFiRgZjDmC7
	EIfG4y3zm2Tu7NvJHGuB0YebfXONGtPWdv/d5mcWfaVh+AOU1kHTt4PqgCjZ85kGwNafWXn+ozu6S
	4IggPoVeJrs/9YQQoHS53H3ytiWD6O8z2en4OEAx69xoz1uPXKynH3rxM7EakoCqW/yYU7gPNEErX
	UY8qRNhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w503k-00000001Hsb-1ehb;
	Tue, 24 Mar 2026 11:36:32 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w503h-00000001HsB-2nUa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 11:36:31 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-12732e6a123so8341319c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 04:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352189; x=1774956989; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Zqrg2lc7oSR41YodgrBHmAdhnpQNxqFkkZK54x5+D5Y=;
        b=NzmfohnBQwTfsQ0rNWfVd0IftQWgG3fGPOjBdf4n1KJFUTPvl5Iu6DuTYV1g6+LG3K
         oYH+KNJzRjGI2/J7TIfRqbw+JJCrs+fxW1RdqEgscsh9EoOrfLCYxWsAdhP4TMn082+x
         G2PNRVsi+qhPlQTniEi3S2GsFGWnZ7P2Msfdc9+Xrkad844wEK6Y4K3dtOhTV5QPRYpO
         Z7mk/Hiw/n/W+STCAhwDrPU4S+asUF1+maWbtorV0bxSLfIgBtT23aJCguAYs3SbnzzD
         jW3j3j9GrZqCa3Ol4gV64yqgf/Kx3BYcSSCkiIPw3iAR0Gvgrm8xxJ+QufNowjU9dzwR
         wVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352189; x=1774956989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zqrg2lc7oSR41YodgrBHmAdhnpQNxqFkkZK54x5+D5Y=;
        b=gL4GW158civdAcPsYV6glMirtONU9xXO0axzeYY4nzXb8Sxdm/p+4TkxbYUfws8pv9
         dbU2cSu+/VLa4ryd4iuwr59X/B6rs/cvCm5PtCgYVtWZp7V1kUfprlX7e1IBrcBv2hQr
         jsAf6Vc0tqUkwOmjWXZIYDADsr9Pgs3DXSH24Z1PG3z/gl3oCevmYAKdIV7SbRQRWU4C
         DdwpJvGdmD617Yj579ZhttdoZvu0+9gWutKo1dSLBZyg8pR+3M7w/fXy8VcXAuDX2iOm
         OKwXx/lI+7BBNKkF2lC4P4cAoQFXW/X5eiSvPE4lV3wRgYKToGe6Wp/6uYC09tPDsACA
         C0BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg/8n54lzH800baWqIoK8x2CQ8NkHbjAq9GplGx+q8/SS+AGqcQotNDsWZyruTL+p22vSAQoh4A7jg/iNwl1j0@lists.infradead.org
X-Gm-Message-State: AOJu0YyoZU0/pIcCaPh2nMX6T3BVqZTzjhV4NJIHzbBU5R9IZRHUU0Cx
	f8I5qxTKFq2vbgNFSiwpwlrMSlocLDnBPhDpzO9b/4/M4rT9hEXJwIQsFmpiIw==
X-Gm-Gg: ATEYQzzuSu4Bj6ZlsE1cMLyHiTD+8iIz2WGQmQNu2MeDMSe6t5RDjJHPJIY9YYs73j6
	aFaGKSwmLvNxMS/tQ4Uk3/RenUuonAv2835eqfEa4LFTdyv1i1IO7y6kk9VUZeRLVZ0xhXXWUYL
	0Gi99uXbs/+ILoqPlHp3kkupcPWk8bpqUNyqvp/lscVhcy+HuUg+XtswVDOIcdZyx3G03Agglsw
	xuGuFZXd/jtGbl24nS15FbtBG/pk5SE3lt3m9Vt3HZ2CoIXb12y8TGOkHhw/FPukKygGqG0WYeM
	bYPkJ1JiLgQ51ua+S6ReqpcSzyzhIVPesp+GVYwLTiJRTmrAfjbnaws9sdpGPRHHX8HIR0IWqKb
	vZ16gX1IbkH96eb/JVqhF4SbsHpYK2p3FgJ1X8RVIcxRfxFg0iWY+JFlCeqri0v8iwej+ZmRwz0
	a46P6S1xl5CnuRjqcks8ckx50SM4QW9BGA4B9iQ35aOFm4S8luak4quz0Je+YOxAdU0SWien8f
X-Received: by 2002:a05:7022:ec87:b0:11d:f89d:85a0 with SMTP id a92af1059eb24-12a726d9914mr7779152c88.27.1774352188596;
        Tue, 24 Mar 2026 04:36:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a73407854sm11245327c88.8.2026.03.24.04.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 04:36:27 -0700 (PDT)
Message-ID: <59924bef-4da4-46f2-93bf-2173e3280114@roeck-us.net>
Date: Tue, 24 Mar 2026 04:36:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Convert TS-4800 to DT
 schema
To: Eduard Bostina <egbostina@gmail.com>, daniel.baluta@nxp.com,
 simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260323175948.302441-1-egbostina@gmail.com>
 <20260323175948.302441-2-egbostina@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260323175948.302441-2-egbostina@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_043629_747455_DEC0AD00 
X-CRM114-Status: UNSURE (   7.38  )
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

On 3/23/26 10:59, Eduard Bostina wrote:
> Convert the Technologic Systems TS-4800 watchdog timer bindings
> to DT schema.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


