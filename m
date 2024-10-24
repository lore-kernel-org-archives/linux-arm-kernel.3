Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89518CE8E6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUnL715/3LxfsngyI3qhOjpz6/8IYCMLAIoj+2ZIeFg=; b=B/QER9Ob5dGmjLlLSD5Drb/1ZC
	ChcRudTwcKroqP3m90NzvXgQ7xSnF1dbGJjLRQNRXngaNGFCXTAyanMcs0eHpxK6T0RWGobfGterh
	PHC6u8zFIahnypN2/L0LZXHObKlOz1YKegmBDv4aBV/DF/uzRCRVu1pqjAQjTkbdylmDPibcbqLjo
	hPMSBlI9Vx8LJHMWjCDhyWQzb6G87pI8e27HcMTTr0VXdhTo4vEZMZH1NokELOVdYPB5D5/fssWCl
	iZiYcWzUp1d3Cchtb2gfWxlfFSU+E2UoXkYVx53trtnjyuRUUaO8Oy+3wNq94qH1uIolhgazjrHbE
	UlGCM+CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41pk-00000001K1X-4Ax1;
	Thu, 24 Oct 2024 17:41:17 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41U7-00000001FVg-1QOe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 17:18:56 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20ca1b6a80aso11433325ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 10:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729790334; x=1730395134; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MUnL715/3LxfsngyI3qhOjpz6/8IYCMLAIoj+2ZIeFg=;
        b=KrNNGRZa6ZRa6IY+WcDvW432Cbxq7sVPuZUe5JkbhJ0BZ4XVeYc5awWnKiagpoE04o
         mvNomL8i3pxrClfDPUtt/MhArcYNT4DzG0JRhQp/Vo+GmuGRWgplaJGb5dgirkYLiKYq
         Ri+ieoPafV9aDWPYAJSn5JSTAQTCVdYNWKCx8ufv685PfwpVGP+zIFGZHzk/zST9lT2e
         5SxKvjCQ11PdAiwgaJlKW7bZW5UgCnqB+sypPt+aF9HeUCPE2CJncQ4OSQZxgzoJFTQW
         5TbEc9LIWQ7NS4zi0N0NfRvumzFoR0WEhK8PUioYg3q6mIrLmuyuFFjcV0I3FLapJ+kU
         KyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729790334; x=1730395134;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUnL715/3LxfsngyI3qhOjpz6/8IYCMLAIoj+2ZIeFg=;
        b=IM1QbAwdz4+s1W9yDPIWOrlYVtxce8xFcKbFxsu+pUdzvDDdx+vtAsriw0ks00dv6D
         QbitZKivQ6gLoJ4J0xQ9aw2yEiTVr/LEcZEUI55aAmbjKL3sTedhde0zNb/BZIN7H+cz
         w2HX9UrQhtliHetOjJjrw9viD1PoDFSnkqQwH15VgE/1jz/sqpPc9aWuCD29kdKBvhVD
         1IqzmWii7RUotbCv5go94+EgD7oBW8m8vyd5h+cWA6cxtXlZHp8us7pBqq8TEs2Z5G+2
         WlQgx161qsCic+yDI+Xi08j/N4poTyOOsBHQynf8LOaPK4UPa78eH9HiNwkC5ojluldb
         +aIA==
X-Forwarded-Encrypted: i=1; AJvYcCUlVXDKTrPrNBNXkHgYcqiGIjvqnoUdOhVhBEPtcyQiAwr/Q2K5pm2i40xk56iYscb33ze9aOeF2VYoCJl9rm34@lists.infradead.org
X-Gm-Message-State: AOJu0YyDBnf4oGVw9Rg9DB5zF+6UPrIxOsd1WygZlhVgitLyPBUg18Nk
	XRMAwpPxv8s4AZGNrPfBrBhRwMvmWdJSkLAQsy138fE9M6KCF7fs
X-Google-Smtp-Source: AGHT+IEKCAZFjKxo/Nyr/QfETLSbnXhkrol1AjduntpjOaMi5BDqrJIxxdVcVIotS2EHx7dz+GdLtg==
X-Received: by 2002:a17:902:da8a:b0:205:8275:768 with SMTP id d9443c01a7336-20fa9e6990amr87460475ad.21.1729790333794;
        Thu, 24 Oct 2024 10:18:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f12ea2csm74665655ad.62.2024.10.24.10.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 10:18:53 -0700 (PDT)
Message-ID: <68e35542-d360-4a37-9ff1-16fe76594b6f@roeck-us.net>
Date: Thu, 24 Oct 2024 10:18:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Ivan Epifanov <isage.dna@gmail.com>
Cc: andriy.shevchenko@intel.com, aospan@netup.ru, conor.dooley@microchip.com,
 ddrokosov@sberdevices.ru, dmaengine@vger.kernel.org, dushistov@mail.ru,
 fancer.lancer@gmail.com, geert@linux-m68k.org, gregkh@linuxfoundation.org,
 hoan@os.amperecomputing.com, ink@jurassic.park.msu.ru, jeffbai@aosc.io,
 kexybiscuit@aosc.io, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org,
 manivannan.sadhasivam@linaro.org, mattst88@gmail.com,
 netdev@vger.kernel.org, nikita@trvn.ru, ntb@lists.linux.dev,
 patches@lists.linux.dev, richard.henderson@linaro.org, s.shtylyov@omp.ru,
 serjk@netup.ru, shc_work@mail.ru, torvalds@linux-foundation.org,
 torvic9@mailbox.org, tsbogend@alpha.franken.de, v.georgiev@metrotek.ru,
 wangyuli@uniontech.com, wsa+renesas@sang-engineering.com, xeb@mail.ru
References: <61a622bd-7597-45e2-96d9-9cba02fba407@roeck-us.net>
 <20241024171301.241949-1-isage.dna@gmail.com>
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
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241024171301.241949-1-isage.dna@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_101855_413300_930FCFD8 
X-CRM114-Status: UNSURE (   8.30  )
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

On 10/24/24 10:13, Ivan Epifanov wrote:
>> I really don't want to get involved, but this misinformation really goes too far.
> 
> Then don't.
> 
>> https://en.wikipedia.org/wiki/Finland_in_World_War_II
> 
>> provides context. And it does sound familiar. Turns out the Finnish defended
>> themselves against invasion from the Soviet Union. Sounds familiar ? Guess it's
>> the same as those alleged Nazis in Ukraine nowadays.
> 
> Especially if you can't read beyond few pararaphs.
> 

Yes, everyone should do that, and I did.

Guenter


