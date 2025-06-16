Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC45C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmVXtZDq1GpnBEuGT0uceXOef/ohgyxYRigN39A5qAg=; b=G9LPX9amJKZ0Hd0JjaXchEz8ww
	FHBF/9L6+DwXzVEkrqeiWIsbQZOHaIxNJvAWLhdcBax705NMvOYd/+uemB1TZbl3UAlbr9Vw5ScdI
	U8srNbWLbEze0L/YOOwUUOBOKXBMg41lqP03NK8XIWh4r3dd+rrwUicWl43Hau+WHDCX7s/8NChoO
	oLUYWBT4cKd7VFRNUbn6oo7b6+z2tmRdzbSA9wXzoEWjuT7CLgdGbhxHK7CfekJvko3XmJZ7v/Zq0
	xEDRMmRQVwd7f+PDDt+AynKaCPFPgKXrz/uJGYDD1ZiTwkDtBjjM44k8GcsSL6XxQxn/J0inYj8Tu
	HGRrio0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHu1-00000005eIo-22gH;
	Mon, 16 Jun 2025 22:02:05 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHrm-00000005dw5-3VBK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 21:59:47 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-312e747d2d8so5062247a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 14:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750111186; x=1750715986; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dmVXtZDq1GpnBEuGT0uceXOef/ohgyxYRigN39A5qAg=;
        b=AJVZrnKdz5WarWwYY59xuwmVi6Z5V1LzJI6dZ+q6BhGgwv2lGqL3iyZW47R8Tsd2F1
         f3R8qscBA2C5fUaMEPXyi2/tT0SFskYOxq4bfWjR60AeH9pwZArV2El/+xwYsPI9y9wY
         5pI4oofW1NEyHme7VZPqIE4sEZ52a71+qG4N/fqYNllCtjsZsM+7Pk7/aS6GSDipcQtX
         UHv73Jvzb5VWyjOvNyLUf8qoKDyMN4EZIhsb5TlcKu04m2jPl7ab+6lDX5mPn4d5AZQb
         9aZePTqQxJ2WSQz9CaiD/AM2sV3DzxAXJGSQ5hVvJ02JQS0uW5EQeZSbBjHLwBF0km86
         Z7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750111186; x=1750715986;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dmVXtZDq1GpnBEuGT0uceXOef/ohgyxYRigN39A5qAg=;
        b=if8MQA8noPiT5hKQZfFyYAsi98R1i9rSXhf9IrEnX1023PI62BIKnj514XWzxN8Rd/
         vjcD+jI/ERBEL4yHmwTiY4SfR/tJG2h6VqR52XkwpEbMenYcfJcyngqilHEboBlA+f7p
         U99DK6026F93mL9w4iNJy6UBeyue6im5BVKIJUHRGLfzy0QCUr5tKRYCrG2IJBRZaXaR
         smVQh/Kiw5xtYwdLbwSK/xQPGj1e0hxKhde2q/AoyK229jXNQSyC+Zx4wUCpsP+04rh0
         +N01KAjdB05IpdPqVRu2Kzh0TlEHoPETuiV8YJur53ovkP4sY9lWF7oHbV+JnVQIva7w
         8fcw==
X-Forwarded-Encrypted: i=1; AJvYcCWaiZnivmIRQEfZJcQLSoDPPICDKP1wcINUQm1qSC0fu1P6O0dsffv7nrl6r2gbyH1ellKtVh5wpELooKZizGwo@lists.infradead.org
X-Gm-Message-State: AOJu0Yynu3iImaFg4RZvy3gbg2j56d1uA2XT5QkjXg7UlOAvCIoaR8i+
	b8/q3JqtEguujPSjH2nqudVVmC4mmagsNJ2znXEGCiSoHek4FVS9S+Ib
X-Gm-Gg: ASbGnct60UCMHEllyRPhfRraKrRuPsvgKVwdpGxEk+05r7aFohZjzcLitV8nlHrmXIP
	EQMRL8HXFqoXGJPD182Ksum9xB4tcrQWRSy/rhzlXXVgrBmwUWRJnci2ei1Yo+m6QQAaaqvdvrB
	2cP+7MQ79N3lADM8pATe5bvts9m2HpNwDoxpi/CmT+m8pOsV1glnGLiAZcj9LifKAeMPtfsH45D
	uiTDwooVGShCBZiiRx4/Y8DofBlLXD6JOssi1j/WXSh8pGzIFZYEoLgqwePqkJKeehsibAdiCBv
	IXcR+EmXlYyAup7MECEK1A5ug/f/Aw8LkjTSFL/kEhRl2vlrz8y8hoNFpSZUfU6KFQ==
X-Google-Smtp-Source: AGHT+IH4wh9y8+17NNr6OsXro0iWKu8R34LNjAfr7G0A8dLv1PD8LHOCsQSVBTatYUghTPAmFqKHbw==
X-Received: by 2002:a17:90b:5603:b0:310:c8ec:4192 with SMTP id 98e67ed59e1d1-31427e9d73fmr267216a91.10.1750111185654;
        Mon, 16 Jun 2025 14:59:45 -0700 (PDT)
Received: from [10.0.2.172] ([70.37.26.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c5e2ebsm9155674a91.33.2025.06.16.14.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 14:59:45 -0700 (PDT)
From: Sinan Kaya <Okaya@kernel.org>
X-Google-Original-From: Sinan Kaya <okaya@kernel.org>
Message-ID: <9fb982e6-7184-410e-94d0-90836c2a9129@kernel.org>
Date: Mon, 16 Jun 2025 17:59:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmaengine: qcom_hidma: fix handoff FIFO memory leak
 on driver removal
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: Eugen Hristev <eugen.hristev@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250601224231.24317-1-qasdev00@gmail.com>
 <20250601224231.24317-3-qasdev00@gmail.com>
 <3c6513fe-83b3-4117-8df6-6f8c7eb07303@linaro.org>
 <7649f016-87f1-475d-8ff7-7608b14c5654@kernel.org>
 <aE8bu2woUe96DVo-@gmail.com>
Content-Language: en-US
In-Reply-To: <aE8bu2woUe96DVo-@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_145946_878182_C688DCC2 
X-CRM114-Status: UNSURE (   9.22  )
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

On 6/15/2025 3:15 PM, Qasim Ijaz wrote:
> Thanks for reviewing the patch and for pointing out the correct
> shutdown ordering.
>
> If you’re both happy with it, I’ll send a v2 that calls
> tasklet_disable() before tasklet_kill(), then frees the handoff_fifo.
>
> Just let me know and I’ll resend.

Sure, please test it on a test kernel module before posting with a tasklet.

This should be straightforward to verify.


