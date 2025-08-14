Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B17CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tImSMCBfpCfAguMLKN6Kk0z7PZRhwzJcoMFbZ4yvY9s=; b=WON/x/fa/p748+LDrAfAL4Cbef
	CUMOBHiwuzJyE5xXc7KuZz4/r8RpliKjn8DWWL/X060o8nGGqmictIAPA4H4rPnipn83YZeMhFkw5
	tYCNJU5SeFxkehxW/8nfKMMT2ULVa9YkNpahrShqIMwGtxMzi2xVGbDo7YXB0035UoU/bMRISx4E8
	f2SV/vNncpivoAZz9XKPIEYlOVDfDKcFqUWWJrpSM00RDApdmY/z8t/g55gaiB/6lpxj8VEBxoSGn
	p8TFWSmJ4eOLT5ISD+uzuEsllAtiGYyxxHq6ApEFtFNpqCdyvb79z2MXiOuZshScGwbK3OaZ5Zpnk
	ixQ32jhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma0k-0000000HTLb-1ScT;
	Thu, 14 Aug 2025 15:37:02 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVZt-0000000GfZN-1gsf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 10:53:02 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45a1b0b42d5so5511685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 03:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755168780; x=1755773580; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tImSMCBfpCfAguMLKN6Kk0z7PZRhwzJcoMFbZ4yvY9s=;
        b=zD5JqKfmNOFwpbYsl9Mb5Ow9EuK+9JW19In7YIAuK+BY9+nTbjXx725M+vvAMsYJHN
         75IENHmc3fV+aCKDU8GXKN3AdcO5E66jClFgv2IAamNryciAlPdyzeOxBQ04X40l0VBx
         pttnp/cU+/Zw1h5k3ZcsLTg4kvVvKRgUq2OHNE/kBWDjQ2VqO9Lw/oNAgGixiI8WcvLJ
         3i2l7m0T+qxQB0pVLQWTEntigvw3xuselUJ7PdH2z3CCwd+HjJKLuJ9pIBX789Tl0EMV
         is7wCTUyG/g8EI3HcbeMeye2bVE8koDf55uuAvLGHb8A80iM6Zxsq9bMKlTmQl74Rz6E
         Gn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168780; x=1755773580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tImSMCBfpCfAguMLKN6Kk0z7PZRhwzJcoMFbZ4yvY9s=;
        b=xHWe/W3LMT5nS1GMHNH+SJLlJopX81lBjdgit4FFNb1nA4+JPlTa9OeMCzvgXXtwQN
         K/n46Yy9RZvPj2ZmGr46S8pXX3M4jxalATD4JJHNGtyWFXY3Pvq8STfBiX62X3t1ZHt3
         lZ2wWGTOuEAwJl+RIrh0Yxh+KaNVdFYjP6HAfHPqkKtwRa6RahR9DlJT/pHlVGEND8Kk
         xBJgp4ea+aAQjSZoM84yIAkvwyNGYvRmzIZD8R0a81W0emRG6gQtGuWPCqu1xOaLJiVi
         W6WUonkLVcVKNmjth8g3tiR8GzBmPTPw7hmQyiPunqphz++4rDhtDTwaK7okZPIRL194
         zKYA==
X-Forwarded-Encrypted: i=1; AJvYcCWsRjonjKRUXLEJpLN0hdZ2dUqj0CZiWniRqM/gKG9f5ufgNWqzt+JHkRIo0ExMghIYUKwxU6UaFcmawuUx765G@lists.infradead.org
X-Gm-Message-State: AOJu0YzJnx+zv+2xJB5qmbKnUXJHk28zHPy2bds/APMlqPysbBt4ItUB
	EbZs7kG3sG2B4La+cMgn8VQYI1q0o6KDHl1L6wE3b8FyTBvdgtFlk8uY0pd0x5OCqnY=
X-Gm-Gg: ASbGncukl2FGVJXfPAJ9z/WQLEez/Rd7g4pIlqOncVDT/qXPtDnpbxeCWNpkmZCc5yr
	Qp8NlmkROCLzuy8lxtBsYwD6VkPV2ik5jjU6PF2x82k3HNEMUQaDk+I/tdS2ZNTgEm0KNDF+ZNM
	ijlkXIBS5t4lbo150sa7SGrVGZ18/yO6IRmX+o2+K0NWNqqjeIv9Qe5InYTPFe7lu0TI50ht9GN
	fjvzGooJh6aYBc/GCdnV1eEGJeDNTg5We92u5IGqvOWCKdo/8KpNilZfbKEIEzpDJjQnVamAuX7
	HP8Jw7Rn1eTZ5jRmtiHPH3uOMn6w8LzhmwhNtThp9bWnloqHzUwr2+2ccf4NF60cvxnD5wpo2aF
	HDhc507zItgfLWmW1+3tLGq4w63ATzqwr6ZKF2A==
X-Google-Smtp-Source: AGHT+IHKxNnld9A1d20cONaio87iOt454m7EZDnnHaLrl6u8S7+JXFZk59fTMw/iWM3XR3mOUXGciQ==
X-Received: by 2002:a05:600c:3b87:b0:458:a847:671e with SMTP id 5b1f17b1804b1-45a1b6758bfmr16491255e9.23.1755168779967;
        Thu, 14 Aug 2025 03:52:59 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bc93fsm16985865e9.2.2025.08.14.03.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 03:52:59 -0700 (PDT)
Message-ID: <3da37a91-9512-405b-ba74-c1feb80b4dd2@linaro.org>
Date: Thu, 14 Aug 2025 11:52:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight-etm4x: Conditionally access register
 TRCEXTINSELR
To: Mike Leach <mike.leach@linaro.org>
Cc: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 kernel@oss.qualcomm.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20250812-trcextinselr_issue-v2-1-e6eb121dfcf4@oss.qualcomm.com>
 <272077d5-12b1-4922-b924-a96c34b3b1c9@linaro.org>
 <CAJ9a7Vif9__iXasPWi0uUhXNJ63xQBtBksT17MvQ-+rDMVxuAQ@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7Vif9__iXasPWi0uUhXNJ63xQBtBksT17MvQ-+rDMVxuAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_035301_444765_8465F494 
X-CRM114-Status: GOOD (  11.62  )
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



On 14/08/2025 11:25 am, Mike Leach wrote:
> On Thu, 14 Aug 2025 at 10:51, James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 12/08/2025 9:24 am, Yuanfang Zhang wrote:
>>> The TRCEXTINSELR is only implemented if TRCIDR5.NUMEXTINSEL > 0.
>>> To avoid invalid accesses, introduce a check on numextinsel
>>> (derived from TRCIDR5[11:9]) before reading or writing to this register.
>>>
>>> Fixes: f5bd523690d2 ("coresight: etm4x: Convert all register accesses")
>>
>> This tag isn't right. Although this is where the register accesses were
>> last touched, the root issue was present from the introduction of the
>> driver.
>>
> 
> Memory mapped access to unimplemented registers are RES0 so won't fail
> - the issue is the system register access where an undefined exception
> can be triggered.
> 
> Mike
> 

Ah, good point. I assumed that commit was just a refactor.


