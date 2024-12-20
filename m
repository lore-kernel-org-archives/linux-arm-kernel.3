Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BD1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 07:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yDNEjeOXhSBQxVpqQzt29i9g5xlvEhh8lAhoI+DC6A=; b=S9BB1Od9/NUuoCJbeQh+DDKLp6
	yGrhtggkDKZMha2XlOnRU8TQWJ4oTGlArgnaN3lZlk6bciuiCBr2C2OKBZIoIRabBXyPBiAcctcpi
	J1/qRgPCGfW0JSmZP8QsN+AGbHVqAy7m8z74/Vj/m33RiJjIt+n5QAAUGqJD9eeYcwwk18oTt1TXV
	veBKFcfXPWDIehjHjOYFrEwiFTeLtkEImTGe5eBh5fzzW6n5GQWtXxQJ2DpKfRiN4yjO9ogUBscW6
	s0otU1lnewX8ITvPpIA4947fQtNb+pDKTfWnfSFcVndZoSavsNjYwJy9VhVLAv7NW5nDZVWXgqdzn
	bqswiQBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOXoV-00000004D1o-2G5a;
	Fri, 20 Dec 2024 07:52:47 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOXnM-00000004Cwt-1qPM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 07:51:38 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d0f6fa6f8bso2480174a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 23:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734681095; x=1735285895; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1yDNEjeOXhSBQxVpqQzt29i9g5xlvEhh8lAhoI+DC6A=;
        b=i5D7jnTadEOdQi+4S89fItfBl3SoA7a01Q8BHn2jTuPEuxdsuao22cdlvb+YvyIs7B
         wYZGZdV2Hrfs4Idd/PYqISLVTOMN5g55Bo4nXkbCMURpXemzFnCwoTK6q09q0nVFlQn6
         tX8iDB2n8T89FcL9ll+5US+jbWqjFYvbJ7HuCYm8YwsQQn0cwDdQV9attZZLZ8VpFjVn
         3JVdgeTl/V1c7nSf45OQPMiwEi9A7dC10mcFotaBSMbD/kHD2XkYTR69K+V7uRsUZ/zO
         TCaWQvRZhtiOW+vT1YwS9o9sPq+R2IwCHiFPAA+TMfmZ0CHWYKLeftqHm/qQPLMN04Sc
         A7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734681095; x=1735285895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1yDNEjeOXhSBQxVpqQzt29i9g5xlvEhh8lAhoI+DC6A=;
        b=xDh5LNvEwDyMKCgawMiTlPDDIX699J5n+La7a0N+TRP+1reO8GW4iQwj6eiscK4s5K
         kybKyQ0qMrP3K8ht/u29Pp9sarbkb0X8kNhb2JffwTRuFd5uAJ3aBu0h0MYIUJkiXsxg
         BYmBqUuD+Ved1H6n18XP5qMO5Jpd/rL/MV2gOYffV4QtOUtW9gG7U7ar6kWYF35Nwyr8
         9SGeyMyrMGSSC/JOqihy5H/7PI6xbNNjg5SzUbtg71gp48iPZ5a7x1F2fHCNRF0wDVt+
         ooMP8KB8Psg7P/7VbRoCprtHKi1/Cb8xz7Mjlzg4OBc58xdWLI9Aa1XhpWPOA4dO30+U
         2LSA==
X-Forwarded-Encrypted: i=1; AJvYcCWF6vE+kcqZlpulblj6TyG45/WoRwFKICrS6dkWdjfy+OpSokIVf4RqbgbVgD8qzuwYaSL+U76k8tMbFtaHlTsN@lists.infradead.org
X-Gm-Message-State: AOJu0YylRAidV7zp8cwaDledMkl3xIlIDsgIR+lbtoHKZb6SmORtf1QV
	Nq/97gF5hNXm5RsauF83TId2NxQcjuNjjQkqeQ+WUFwDjKb4ibfO086SEG+s7/g=
X-Gm-Gg: ASbGnctqWPwvFAgfEeqATK9gJ8/5qygtijUjQImsgsXLx5DRz4m2XqLCIg0oxCXTF9e
	4AvOpPK7R/wM7Lmhkq0mUgXkI4nLVIzQdxPLGQv2qrEGT/TgeaXnAFmdz+4P9s1dfkWZOMYxZqm
	4BofsbmrUAIymdlXfLAIghq081Ag390JifzMu1oBjP8mP2+jQ73t+Kdwy3XtMVFQsUX+fbBJZAy
	8kYZ3VKBku5xIWZKA8LZ2Hxf7BdU+pPPo8SIFnIc2eStxQ6tySDvBEChxvtJnja
X-Google-Smtp-Source: AGHT+IEI1vajsERhxoY7nkjgpoa5z0LmbYvw4+7EEXmu89uOcdENi+jRRpqlKSn6v1OKOHvsdYTmuw==
X-Received: by 2002:a05:6402:518f:b0:5d0:b51c:8478 with SMTP id 4fb4d7f45d1cf-5d81dd7f300mr1334456a12.12.1734681094719;
        Thu, 19 Dec 2024 23:51:34 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a41esm1450399a12.1.2024.12.19.23.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 23:51:34 -0800 (PST)
Message-ID: <463d5955-a056-40e1-a46e-f89ac0dadccf@linaro.org>
Date: Fri, 20 Dec 2024 07:51:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: add support for referencing
 controllers solely by node
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
 peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 daniel.lezcano@linaro.org, vincent.guittot@linaro.org,
 ulf.hansson@linaro.org, arnd@arndb.de
References: <20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org>
 <20241219-mbox_request_channel_by_args-v1-1-617a6910f842@linaro.org>
 <20241219-recent-everyone-865b19864693@wendy>
 <d9e635c8-de05-4812-bf2b-11651f6da5c1@linaro.org>
 <20241219-strum-cheese-89e5e60d22c3@spud>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241219-strum-cheese-89e5e60d22c3@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_235136_499203_918CA4CA 
X-CRM114-Status: GOOD (  14.49  )
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



On 12/19/24 6:58 PM, Conor Dooley wrote:
> On Thu, Dec 19, 2024 at 03:42:11PM +0000, Tudor Ambarus wrote:
>> Hi, Conor,
>>
>> On 12/19/24 2:11 PM, Conor Dooley wrote:
>>>> There are mailbox clients that can discover the mailbox channel ID at
>>>> run-time. For such cases passing the channel identifier via DT is
>>>> redundant. Add support for referencing controllers solely by node.
>>> I don't really get your implementation, why not just allow #mbox-cells = 0?
>>> That's what's done for things like fixed frequency clocks that only have
>>> a single output.
>>
>> Ah, indeed!
>>
>> instead of:
>> 	of_parse_phandle(dev->of_node, "mbox", 0);
>> I can do a:
>> 	of_parse_phandle_with_args(dev->of_node, "mboxes",
>>                                    "#mbox-cells", 0, &of_args)
>> where #mbox-cells = 0;
>>
>> Or ... can I pass NULL for cells_name and make the #mbox-cells property
>> optional and still keeping its requirement of being at least 1?
> 
> I think the mbox-cells = 0 approach is preferred, that property is what
> marks it as a mailbox controller after all. Perhaps Rob or Krzysztof can
> comment?

I think using mbox-cells = 0 is better indeed. In my proposal I
considered the list to always have a single phandle, thus a reference to
a single mailbox controller, whereas it may be possible that clients to
reference multiple mailbox controllers. If so, #mbox-cells needs to be
defined in all the controllers, for consistency reasons, similar to what
happens with fixed clocks, as you already mentioned.

Thus I'll change the method to:
struct mbox_chan *mbox_request_channel_by_args(struct mbox_client *cl,
                       int index, const struct mbox_xlate_args *spec);
and use of_parse_phandle_with_args() in it.

Thanks, Conor!
ta

