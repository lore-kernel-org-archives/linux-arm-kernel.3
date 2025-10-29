Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BD8CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLI3NZdHzrZYLWdy8/zoWvHAgFT9er17PaTQd3QXPMs=; b=rJGilcngo9H1U+04gXFgTMqLc3
	an7tfKvsVkyve5G6AvMZ9hA/ehYjRrp2c6yXbAKKNoS88EVaNV4LBZxDb/rkqVOj8u0xh+/aQWLjx
	cqCSoFCo0jkmAI6seS6KqTEPeNUHUsk/wsX2cBVpg3xVBTnBA1uhfGayYWYCW370F1/e76fvrAsUt
	dzMeXSdsy86Pbq4SPAmKO77323nH2o85oKWo+ktXSQZQ4sdKpVbkoGDKLTShuqb3nxycyZHZlf7IG
	JCmJWTsTgZzfXbf8rXhI/Nwp+YCltb8dZ2NBq2loMRingrH7XALBed4su30mdjDlnps8UdHbH3QXw
	+C6kPwsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Cm-00000001oXW-2BUf;
	Wed, 29 Oct 2025 15:35:20 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Ck-00000001oVs-1LwE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:35:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47721743fd0so4938045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 08:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761752115; x=1762356915; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLI3NZdHzrZYLWdy8/zoWvHAgFT9er17PaTQd3QXPMs=;
        b=Pjg4N0P7bBO4/nCKz63vtdmZiapQxq21+qtYy6UjZtfJ0hL2PAkWH/NIkPW91BfgVI
         RJUaTE17Pz1mXIwV+puaH7NQtmQBJEx1GI6yNdNQvxWpyqRrhRXAajTS+/1Cdi34kSnr
         HxUajMooGnrDr8jEPl64MZHwcpx7cW5iADTU8tIcyV7njXL+JxTa8en99frvwU/LNYpY
         Js4q9QJJUWUIYaa9qLuJnROURRjnmHlTFgrzWrw69oq3hOztWOXNL0VI3a6YIlBETcCT
         1y+dgJmHYi4O0x7/kiNadRdBuD7NBRen7Qq6ptAGvH/dnSVfsLAygAtfeHL8NjPOk6R6
         Dm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752115; x=1762356915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLI3NZdHzrZYLWdy8/zoWvHAgFT9er17PaTQd3QXPMs=;
        b=VT0JVBhGC6HwBIO7EE010drOqKROHVBelESgW0/jYxqzR9SBYrFkgAw2kSgiyLbINw
         0ZIEuvV21aItn6t96wfAfnDpqCN0lfQD7MEIQz/P1IGIf2Y3GUr9ZwCsU8C586quHjKb
         UOvfEmg23K3DWHEMLstkV8m0im3dl2gWumq5+Il982P4HKdBeY/1IWVZyD894LArHYzS
         b9lWimxcHgeNiP/nbs/Hj1S4xNUYQlCLyN3bLtJn4xVtUADpMHfZWrtLx8Mac/j7ClyD
         22qoxspuZFlrB9uDpRKPr4ZMD/nBKltXl7MVQHhO6Pg7GTCaRzHtgrSPhh1aegSBDSst
         U9mw==
X-Forwarded-Encrypted: i=1; AJvYcCUfx9orSeUXyylZmkNttoyCmTT0jMSObxkSnhIwFf0LR5GH+6euAtcbPMLqpbTy/LpYSq+ZDy8SIGJsesQNFKnj@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7ww3KVBmuhysJgGvqcHo4Mh9lwAQjbqxybX5uYD/hqWSmDMW0
	04HsFwlj61HrGgnQeJVf9ekQj87Wp0fx1nj5u3UOZO+t7955SvbQm/rOO36ebjF9Xb4=
X-Gm-Gg: ASbGncu+WDsQcPxCGdYPD+cwz0OADoQHmPZzZcbL0mGE9yR4aw1hc4DnPEukftaTV7k
	GsZm7SiV9eRxHQ33nm5SvU3eZNZHGumH18OiVgenlmdj2LnyuPBxUep26FpqMpbLd5ZczwMeOlv
	TAJWzdXAC3702cJd4rErQdCNenlb5e6tXjkJHI8jSpXgUXOthPG/MTj/W+2IUqLuO4UWUimpWBW
	1TreiW9K2XNRGXWkXL7Fcp3YOhYIDmMBBiXeJr7XBQZRIPA9TTMiGEyZuddfGoY5NRTH9dgNWXQ
	ksg4vJTNOyAYkVUuUvcO/9pKdwsXxop0eNnl4yyGSljWxMyUhCjyaT0b13XN+XnBZBG3VkVcj2N
	F034o9zjwOW2PFpLR1F0uKvLDE3OdIj4yia859btCY/oGdqHL5lwpszRl5fzMMPSAIOlFwt7ly1
	N6sOjXZSMdVlP+isDTB7ax31VRCeKD1OhYZy2+giWGzS4pdhUgOZNKcRtvLJ0=
X-Google-Smtp-Source: AGHT+IE1War9zWW2DadyeaQTgCuzaEYVadTvhpK/iM6ucbryWIKimZJyW4F7rU2olGBmaok/ywFf6w==
X-Received: by 2002:a05:600d:839a:b0:475:dbb5:2397 with SMTP id 5b1f17b1804b1-4771e93fe4dmr17226345e9.0.1761752115477;
        Wed, 29 Oct 2025 08:35:15 -0700 (PDT)
Received: from ?IPV6:2001:861:3380:2e20:6214:6f9b:8e4c:f723? ([2001:861:3380:2e20:6214:6f9b:8e4c:f723])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e196b27sm56962425e9.8.2025.10.29.08.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 08:35:14 -0700 (PDT)
Message-ID: <72ab3ef1-fcd7-4003-8393-e64159625125@rivosinc.com>
Date: Wed, 29 Oct 2025 16:35:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] drivers: firmware: add riscv SSE support
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Yunhui Cui <cuiyunhui@bytedance.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250908181717.1997461-1-cleger@rivosinc.com>
 <20250908181717.1997461-4-cleger@rivosinc.com>
 <CAPd4WezLU2TdpyUQ_UOT0SO=N+jbwEs4iVUKZ2_ngcGEJpSbNw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAPd4WezLU2TdpyUQ_UOT0SO=N+jbwEs4iVUKZ2_ngcGEJpSbNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_083518_379855_E420F7C1 
X-CRM114-Status: GOOD (  14.01  )
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



On 10/27/25 13:35, Himanshu Chauhan wrote:
>> +static int sse_pm_notifier(struct notifier_block *nb, unsigned long action,
>> +                          void *data)
>> +{
>> +       WARN_ON_ONCE(preemptible());
>> +
>> +       switch (action) {
>> +       case CPU_PM_ENTER:
>> +               sse_events_mask();
>> +               break;
>> +       case CPU_PM_EXIT:
>> +       case CPU_PM_ENTER_FAILED:
>> +               sse_events_unmask();
>> +               break;
>> +       default:
>> +               return NOTIFY_DONE;
>> +       }
>> +
>> +       return NOTIFY_OK;
>> +}
>> +
>> +static struct notifier_block sse_pm_nb = {
>> +       .notifier_call = sse_pm_notifier,
>> +};
>> +
>> +/*
>> + * Mask all CPUs and unregister all events on panic, reboot or kexec.
>> + */
>> +static int sse_reboot_notifier(struct notifier_block *nb, unsigned long action,
>> +                              void *data)
>> +{
>> +       cpuhp_remove_state(sse_hp_state);
>> +       sse_reset();
> Is this sse_reset required?
> I was running the poweroff command. The CPU teardown function is
> called and events are disabled & unregistered as part of it.
> when sse_reset is called, it again tries to call disable & unregister
> events for all cpus (nolock version). So I see errors from SBI that
> event is in invalid state. Commenting out sse_reset() wo

Hi Himanshu,

Yeah that is useless. I think it was there before you add PM support and
wasn't removed then. I'll remove it.

Thanks,

Clément


