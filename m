Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2F0C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 14:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UcMBG13q7TO7qzdipxuscmR1WJ+KOa+mjW/lgeob0U=; b=b+ccMaFM1KJo6I6/0qKAR0dqC1
	Qwci3S5AQ2jOCcxwJPZ+ByjqrJtr3R8WrkAEOTWAlrTCQyT+tTLu2VxaxB2KjVGM9rk8lB+0rPHL1
	MBrsiMUm9a4t5ZZrfbFb5BVGZB0AHMdPeOv3wUwNQTXEimmaTX/duJgTi41ANZYwQMKs1RJ7ONiTg
	JmMieF9secNw/MVtKhKJzBOLHdo+IOHefEFFuaee7hRWvFw31woPTxk6QtdPrhQ8WJI8pLhzuNOg5
	aob7rGOeOJn7NZ/oZzDXBsELv08kzX6CWLKYUXLjs8FvR2x+Nc8s2X5BZC285YBn6NXO3vArff7ty
	bqit4Rjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wKJ-0000000GOcC-3ocO;
	Sat, 19 Sep 2026 14:46:03 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wKH-0000000GObW-44ja
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 14:46:03 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e721b5503so16256465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 07:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789829160; x=1790433960; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UcMBG13q7TO7qzdipxuscmR1WJ+KOa+mjW/lgeob0U=;
        b=Pg/x2tEtXYuoE1iOc56f7tvBQbOWKJ6jxJcZpyscm5S6wB/YtztKsN8FW5lUz/39p6
         E86ixOM7rCbdQ69ym/mKSBLPmPboLbXag2afS8ZNMrsdM41PLXGg8JHqfWypt7Ztd+mV
         B6qtworTB0dymNRx1oMTzSZqZodZ61ozyCv6yzTxkiyEiIuAyJdR+0LI1mUBuWPGsNBZ
         KlT5m1MJA7KgmZP1oCEyomG7UlrabCJoH1du+VNPRdjkYka17ZTrjnhoVXmYQEKCoYqE
         x/wDhAL0+83UgcVP0IeAOkn/mxWq9bluO1LN3HxiwCcU228XlgQXO5R+qOlo+/Dr5fXx
         IlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789829160; x=1790433960;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UcMBG13q7TO7qzdipxuscmR1WJ+KOa+mjW/lgeob0U=;
        b=si2CJU6tmldpbZnuwysiccN3Je/LNHKyk76IgU4fd+OYza1BzZ8DNn570NeYOG7Cyg
         JHL3xXndDLLR3dk0tx0axdCRXCubvkgf7WRNp6ZW4AZIBZ/f+yIMBBM3jdBFs6MeMw5V
         65u/b5azyiEZInNptmR6xcvbM76tab+u1r55BeNxXEfNWJHahSXdrD2weoKdkNr84wbt
         k9HArZR3qimc1F3e2Qa2don4BGSpZLaCGpE7QCO16sV+EjrG9TqnMos7WLsl6Be0O7QF
         ewbtEBEpI/BZ9gxxACcKS9So40PFffX9hOlx3UxOYbtlWNRotKQJ6EriQRhiEsCrfHTl
         xJ9g==
X-Gm-Message-State: AFuF++mcD3p/YZTLkHUTi665Cvd8PlakotnBXa3Mx6ipz//EMnNF7rhB
	UmsSuWXw2FFoymwjizZNnj6DLGbt87zFveQCrt/wmISPwmux6XMxD1SlZzG4alYSyyM=
X-Gm-Gg: AYBFou3gK2KiLM/fRR48wi/i9842j509YF6Mr9c56FxJhzdF8OOg4+w01/9aFzNiGzh
	Utbn2HOJuUrUcHP4LXvCkZC1QxOPRkteQUm1v6ROaTTYUw7JS8bA12VgbotcIRMGSG5NPC3HFwe
	b9FienJDOK+4ce8O0LeELugy8xY0Y5UJlxQFA8Hp6Cxptfd60vxTu+kfEdLZnufrequvdRYg3C2
	MPYiLRy5laEpg9u7SKbErYatwetzunSENeSrLLh/oNNz7ZYTxLMEUUmTjKP3z/JQs5O7kDS82aL
	9kLJhBCAw8xOcAW3EuP80MlfgTBA3LzcQxNaumvnoELvpX981AtcHAbZlnzjLPlQtRnKM2xL1wH
	DbqZ7GWmxaHBPLQLnj3kP6oeMXhm6vl6JTJ9tzz4kTXsnnfviGw3FCQaKhvBzVCeI0CRkR6TX7/
	g6ArqilsMMoMU2tOnpmjMtS6hpIAngUZsctli9h6u3Xl2ZUfo/el7xJQKIFPI3g/RmovGnPwa32
	sfQUHrkUj0LaS+TdOMtgUp/mKIZznSJAWkr1OiXDa7DhMSB7VtMROsz
X-Received: by 2002:a05:600c:1f8f:b0:49e:8354:26fb with SMTP id 5b1f17b1804b1-49fc574c729mr81926275e9.32.1789829160140;
        Sat, 19 Sep 2026 07:46:00 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724589c02sm6931200f8f.24.2026.09.19.07.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:45:58 -0700 (PDT)
Message-ID: <77b1f993-141d-4d85-aaeb-0ff48d379f7e@tuxon.dev>
Date: Sat, 19 Sep 2026 17:45:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: at91: Replace __ASSEMBLY__ with __ASSEMBLER__
To: Thomas Huth <thuth@redhat.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260821083645.200344-1-thuth@redhat.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260821083645.200344-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_074602_043692_50821324 
X-CRM114-Status: GOOD (  10.79  )
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



On 8/21/26 11:36, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__ auto-
> matically when compiling assembly code, __ASSEMBLY__ is a macro that
> only gets defined by the Makefiles in the kernel. This can be very
> confusing when switching between userspace and kernelspace coding, or
> when dealing with uapi headers that rather should use __ASSEMBLER__
> instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
> this confusion.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

