Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CE1FCA16E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 18:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqoQ9lkNkezuo7Panmj7PEOH/0BqG4BNzGHgiJvpZQg=; b=bCNGausTJuIIjaxlvLtaFSroXa
	9I+/wyvCfkCbO9BGK7HjA1+PkkFqEeUnRzYfyXGUvmY9y/66e4b9OesET+Ghj9N5eAQB3QREoEU4f
	mx5MupMwGOZ9W6uh1aXtJeARiYKlKTh3dclsrqcnNhZdKgiLIpvZlrEYyy8cwW60zwOlAjhRmVS6F
	vOYYX0cBGkcURCGf5sxcs0VIxYRBrJH2x0wejcTsWCg88nL5B2VHp9meR7gYvYrmYshbgzj38geJW
	8I8E8unZq7cVvdUahur7S5j9GpTkSMHLA9ZAD6cBhcU4VGnW4ag4Cag1Z1FXKgTIHc8JkJkJEnvuY
	JuXblPIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfBZ-00000007tZ9-1wYu;
	Mon, 09 Mar 2026 18:18:33 +0000
Received: from omta040.useast.a.cloudfilter.net ([44.202.169.39])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfBX-00000007tXD-1FY4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 18:18:32 +0000
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id zVX2vDH0lCxrGzfBKvHtvt; Mon, 09 Mar 2026 18:18:18 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id zfBHvwN2eh8QWzfBIvMXgT; Mon, 09 Mar 2026 18:18:16 +0000
X-Authority-Analysis: v=2.4 cv=Mcdsu4/f c=1 sm=1 tr=0 ts=69af0eea
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=k5Y5iPg+dmTXVWgYE/XtfQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=V5vwHjfW8xl6N5DwPO4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZqoQ9lkNkezuo7Panmj7PEOH/0BqG4BNzGHgiJvpZQg=; b=O6MIOhTOtWuHpbIUV7Upkm4xg4
	IxSawP73Ba3uRUo/hucIWnKb1m7V19GKWOv/RjsHxCDewtYancmIVQ3GInTbhJhcoYGJZdRTE7nCT
	AYYcN4wEn+YsDj1XXWoipZMFAYrBZUKn+J61SQvr8HVrPK+TD2ha2E5yVpr5oeqbGpLAVy9LD1Ncs
	KSaFWfG7yn7h7jmb93WoQph4UqTNO/ZCW41v4LGXc/uYAfYrxC3VUK3QbMq72QYV30aCjkEuIRAEb
	Errd3DS9OKG5o+hNdB6X3lSMw/y31OqCIS/3606QouEpSIUw0qZ6B+TrP/e0PI+J/FATulK/BOovE
	DgVSmxlw==;
Received: from [177.238.16.13] (port=39494 helo=[192.168.0.104])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1vzfBG-00000001N0A-4Add;
	Mon, 09 Mar 2026 13:18:15 -0500
Message-ID: <7dac0a99-0883-4ec1-9bfd-49b659bd38e6@embeddedor.com>
Date: Mon, 9 Mar 2026 12:17:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: msc313: remove kcalloc
To: Rosen Penev <rosenp@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>,
 linux-hardening@vger.kernel.org, gustavoars@kernel.org,
 Romain Perier <romain.perier@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 "moderated list:ARM/MStar/Sigmastar Armv7 SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260308021535.48098-1-rosenp@gmail.com>
 <CAD++jLkLj235Q=U_9E-hSneW5E42JjU=dRBJxKJNnqwgBLCm=w@mail.gmail.com>
 <CAKxU2N9JbAzEYfmLpbw5b9Y6MsYUZ1FfLirfy8Hg8MCOUY6PAg@mail.gmail.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <CAKxU2N9JbAzEYfmLpbw5b9Y6MsYUZ1FfLirfy8Hg8MCOUY6PAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 177.238.16.13
X-Source-L: No
X-Exim-ID: 1vzfBG-00000001N0A-4Add
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.104]) [177.238.16.13]:39494
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMQmLwz53oSPSlhMQJ0JwxPjflFkGYIdqz7Z1CuNBZxfxYSazFZ2eIjGfmQUAbiycvMGwveYmcwohW8JW5wn0Q65YKw16ltcMfuTYLjc2Z7p/8CVKnJR
 tFTO6h659dwuF26Qz0WuXzGUo3Hg7uaTof2PbI080N6S/D5xN/HaTN7QwxkdnW/Ekcudyo8ZjJ/hBT5xdz0UPwZBpKv67fgwU8eCHfRBhnr7W5mwsY5qu9UX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_111831_439759_AD12EF3B 
X-CRM114-Status: UNSURE (   4.41  )
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



On 3/9/26 10:27, Rosen Penev wrote:
> On Sun, Mar 8, 2026 at 5:06 PM Linus Walleij <linusw@kernel.org> wrote:
>>
>> On Sun, Mar 8, 2026 at 3:15 AM Rosen Penev <rosenp@gmail.com> wrote:
>>
>>> Use a flexible array member to combine kzalloc and kcalloc.
>>>
>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> (...)
>>>   struct msc313_gpio {
>>>          void __iomem *base;
>>>          const struct msc313_gpio_data *gpio_data;
>>
>> Do you wanna add:
>>
>> const unsigned int saved_size;
> So in the code there's
> 
> for (i = 0; i < gpio->gpio_data->num; i++)
> 
> which is equivalent to match->num.
> 
> __counted_by doesn't support pointers AFAIK.

We actually have __counted_by_ptr().

-Gustavo


