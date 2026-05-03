Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBB2CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 02:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zleKM47mpduavdnaP2aBKf2rkXt6X2UG0Frna4ddag=; b=kwRURRy0Il29OzXHDv7bhITzt4
	16t25Fge7BVTPFWiMTWXD0lYKz+E60yCD9uOG+6qsCq/pfVfMchSvT0IN62mo8tW4gnPDILa3CZAV
	XQji+64B76EmWsscG3ozq3c2oL72yL7AqClMPJGv1Nf61CWhrbKN8hNaPYHfAhSEONTxmNzAbka83
	foryewkx+RfKn2/8gkF7oN5MBhS4QkdqJVt8m2SDUocq30nP2TsuvGoqTXu2wESPbzw8qsvde37xf
	v5l7zWODl/EWvgNLZxZYMlLSSD2WIGI/SDVLiWHlxjVeepzoyaJWD6D4zGBtkGb5+dvnTnKw8Xb4U
	BrJIJEHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJMUk-0000000A9k4-17i7;
	Sun, 03 May 2026 02:23:46 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJMUg-0000000A9ja-3PLF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 02:23:44 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8ef0ba61d46so344697985a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 May 2026 19:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777775021; x=1778379821; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6zleKM47mpduavdnaP2aBKf2rkXt6X2UG0Frna4ddag=;
        b=qR9GcazYlfrCUnRZ4Ii4m46hcFQ7EBwTcgtMR1ebvqJrthkFCwlq5c6hYMBX6fiFyd
         FCUH3AKILGegDm8y7ynj0NAUvbkuTw7mz6b4Tlh+Xzkl03S8/YHDq7sT9i9mZiC516tv
         CwNTgTQjxRhKVKgv0tu2qhHtxJkg2h5jDstUo1+oAzqZGwkzlBlivQ3s6GS1WbstU7wj
         FRNc/YDQkw1wjWhajlG3NLJY7a9o2apaulz80ETcjJqF3OY4Y/Mp/3a3mAY/HdQ/1WEG
         iXfFhUjOFKgaJmUC/iOOiIz+oYEgMYvDWSUklnsp37DmlwldJ7IiV2E+Ydpr8heez1nP
         LSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777775021; x=1778379821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6zleKM47mpduavdnaP2aBKf2rkXt6X2UG0Frna4ddag=;
        b=RnkK1uqZ+L5iYJJ8RXsD1/qERKpQp5B+LBXAoS74S4yYDFL19ER4JUnpHim7MIRulM
         kPLUJRWykDWfPl8Qgja1urQIqE4bD/T4nxBtScxfMq+XeRbaKSZlH9TI6Ped5HIRj519
         FVpme0P9fayX+o15gkGsJ0v8R8RJf0oNMoQs1gKo77lvgWcNt3vknwHq2AZB5nTUEbzN
         mGNEXJi+/U8A8xUEEQnzb8Hces8lqQmrHust7M/c7/BopS4NqMY+974h28FzQ0Sr1axe
         VW7s2KO0/bnnUuDLM24H6yqdhtiFgMN0y2TBUtXuA58iUGX7Mn2pZZuhayqWM4DD4I9T
         G0CA==
X-Forwarded-Encrypted: i=1; AFNElJ9QcC/aqmTRFCSBOF2pq/8VhtPup07f5obyRIMe7bPBcWb72eMv2sUQaGbS3u/+HZLiSN4ULX2Iu78gKPvIIztV@lists.infradead.org
X-Gm-Message-State: AOJu0YwN3UJ9vRTY1WHt8IGqw1lGTJqz986FaxZwgNbtAiTNLXRrME5p
	0bmitLoY32G+m9UhVzkqNvHL/UsYr+/YDEgInL6KN7V+t0bXvTx9GuAcfm7MNj12exc=
X-Gm-Gg: AeBDietJ0GGftgcuYjTbdWQnLq761dlbv7h0lJah9nEIv5xx+uCR+DEJuO/swjBF8t0
	/QO68SrO5NU9vTj9gf6rwdqGRDavj+UhDiD3Oa0P55bOoz9X+jLFD8J6lqeEh4VSE46CznrctFb
	enaH7ocvkbynWIVzZzyNKrH21D5d7ttByKLPyhsuTtxfCZYx6TCcULr1tjpo5y3zp3AIJM99gL6
	Y2Djddq00wt8Y7K+/BOlpBBS+U7sLgsUcsgN8VSOPlmYDW5VYS/AJrb+v0HwsqlKgDLcIKknh7J
	6EzSvpFLW73f5PqKv4jNLv8+1v1le8t8sDp72Sp86KbkZCdeh9ORLJaJSCTy+ofZ0TZZfw0++8S
	fcIjQoaUbElc4CBRr5aqOtnvDWaSTvEbP96kqgs7jGlkzb0I5kP+NKCPL6iaan4pEQe8LwKTk/+
	dugq/aBpm6U9SZgkY+s/UUS2leXz8ic6lFJr8f7y1zl/mq9rBp+MyDHNOnnn9vjjuPDTwr5Awg2
	w==
X-Received: by 2002:a05:620a:2a0f:b0:8cf:e946:bb56 with SMTP id af79cd13be357-8fd1833a52fmr796002985a.44.1777775021562;
        Sat, 02 May 2026 19:23:41 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c349572sm652634685a.28.2026.05.02.19.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 19:23:41 -0700 (PDT)
Message-ID: <5a8cde2d-2871-4f9a-be16-66c38005fd9e@riscstar.com>
Date: Sat, 2 May 2026 21:23:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 11/12] misc: tc956x_pci: add TC956x/QPS615
 support
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-12-elder@riscstar.com>
 <20260502094559.15c3f479@kernel.org>
 <649428a4-9505-4a1a-bbbe-bd90be9b8155@riscstar.com>
 <20260502191427.34048082@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260502191427.34048082@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_192343_555280_C26D952C 
X-CRM114-Status: GOOD (  10.09  )
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

On 5/2/26 9:14 PM, Jakub Kicinski wrote:
> On Sat, 2 May 2026 21:06:33 -0500 Alex Elder wrote:
>>> drivers/misc/tc956x_pci.c:541:17: error: call to undeclared function 'u32_get_bits'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>>     541 |         chip->rev_id = u32_get_bits(val, NCID_REV_ID_MASK);
>>>         |                        ^
>>
>> Yeah I think I noticed an error like that shows up with 32-bit builds?
>> In any case we didn't see it during development, and we'll make sure
>> <linux/bitfield.h> gets included.
> 
> on x86 it hits on all configs, I suspected you're building for ARM?

Yes.  I'll spend a little more time trying to build on other
architectures.  I normally like to add COMPILE_TEST.

					-Alex


