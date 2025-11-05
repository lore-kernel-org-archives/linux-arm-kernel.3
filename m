Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C72CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 07:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mgd1RgFz8T9cqpU6ApJmDoOMdsD64BrgKz2Bds3lYc=; b=19XQWkPZ/a5bFFeykPjRKvOKV6
	kBA34dJu/VtMBCBHkCttQRZHTtF4b+yP04UbeG2snjBKNedMD8i2NxHbFnxbalPdyhSTGOFvCM2/C
	Q5qH6wieBFJpyTOt65A+b7JIT1poC7dy/mNsghb4x3a6DadmyqNuu9675oEwOh3ZVoCJeKBYmQwUK
	mC2/+bOKyVKs7xAiU74N43dOJypF/RpT8Y3ZiFDs6Fd+wSN6bOSFWLJS0hxEC90DMQkW14w9BBkpN
	IODHOFt5GgyVLqUqGflHoN2t0XCdo7wkFWJjDYa0Nvi0IuTf35zIr/nDVQfqEFekIEJvtkcusEFGf
	CVmJXqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGY1I-0000000DChI-2rDH;
	Wed, 05 Nov 2025 07:33:28 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGY1G-0000000DCgB-0FIL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 07:33:27 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2956d816c10so40957405ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 23:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762328005; x=1762932805; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mgd1RgFz8T9cqpU6ApJmDoOMdsD64BrgKz2Bds3lYc=;
        b=SHZzT4ICJjnO77aC5L6iigxn/6jV0RgATzMUKg5B1YLyRq1KTZ3b1RAof190u0d0wF
         TbpgLV/jZNRq1vHzTa5g3Rfdh6H7vJx9gpYZFZRB6vavPVQA4ajWZu3+mWrrwMM8VcfF
         ZtnTcRkr6OFZ9/cwA8SFWMX6EEQlPTv5rCA069unD45MxSB5860bJOdhd8FZiuqNQ82Q
         oYtPRPUTvFgLXzzjZFSL+RpSoGQ5A57xsuqMCSt8x4CzpxVJj4Af/hjnCtxQRHd71Q1R
         iS6UgQnUrPCvu8qgTzQqbe5wsG7507gqaDGykR0ePXGc9MFYSCcBQLFTVJARu+Nqd0n0
         gVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762328005; x=1762932805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mgd1RgFz8T9cqpU6ApJmDoOMdsD64BrgKz2Bds3lYc=;
        b=Ly1yQhqeeOtsrOo8CoqKiurOKlK5kDox7FlfuRnw/vYcp8iTgXAi10TetlQN/e4xcP
         qvjLKor0la1G/ecw2pDblr/kpljFS7rlpK1v2+Vs8wpcW7dMTUMgIzSHYefxvJxo5dli
         8rF/caa66jMAoV8+JFbWMeJGACGmtGmWiCOlblludVKnPYB5MR2sULgMNyVlHb1EtJK/
         yLgbvF1cQxW2rNSPWVGdtxVJqcjFVFe/LntY+VsbshZE358EGHhD54ry+aU+p10g6gKC
         LnEUvd5c+h3ugC6kUG2vffpZnJ66OcIkkPdz0Em+c1vMxkLTxhS0mcQ2rm8ufBgX0QmK
         CcpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrsW4EQMTmSQWvsbN6LIkzmSPBv1C+25oFujbLc6VSJZXmvxj9WoRBAP/IlJYSFp94cwvBzkXhbyMkNAoNmyaS@lists.infradead.org
X-Gm-Message-State: AOJu0YzmIcMeqSdOiT/Uerva0v65Pcob5cQa/5IDKiSo1lnYd79VGId/
	Vi6C8q55+0deOdtU2hoEJ4E4V4YfFJR4lZ0gZ32SjQVQoYTd/r9qL8uf
X-Gm-Gg: ASbGncuxDlbEMz3QHi5CbtU7/s32vXRPwtrVRqGLPSsrQXVlGNAAOl8SRf9Tof/sZio
	0bRQFk7bJL03EcThOSbQQLQhP2pWqbIvpvudPhN8SkkJtRw7vV+5AzR2e3576zskT4g4EHnWQin
	FWlr2oDH9FbkL6aRKLUvKZIeEwSnHGdzHOHegxkEPsBKwmIp/Cc//Yv6We+ekW6jH+clse4RWAZ
	+UlmHh9UxjWp985lO0DCFXXX8UEJfcRCEF3kgCiJFBWojMhs57xjQMFUcYbG/SN+H+tZl4IyOIL
	uL29VYNaf3xQ3hDB32cJB11Lpws/T/UsJyhYJP2MwCYeLFqsutQ5s4eBpsFdEnZkxYK2fuR+ZhF
	IYpjmW3m6xm/SbmF4OVKoss/JXdVa+EqSbd+v233RBEStKHs0RMXY/fUVs4O9O0FKp8Xqp1duSW
	1PxKH1punB5BYpVl8yfVsGFdgAKFCo0TqZK7H35qY6XaRjCg==
X-Google-Smtp-Source: AGHT+IFubJwKuqWd8pVU5sU0Dqp6g9b5LXMrACB9qO8Ucy5yzYtRavb/690KX+eucTG0f1YcnGaOIA==
X-Received: by 2002:a17:903:2381:b0:295:8c51:6505 with SMTP id d9443c01a7336-2962ad95597mr33842095ad.33.1762328005013;
        Tue, 04 Nov 2025 23:33:25 -0800 (PST)
Received: from DESKTOP-NBGHJ1C.local.valinux.co.jp (vagw.valinux.co.jp. [210.128.90.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998991sm50485145ad.32.2025.11.04.23.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:33:24 -0800 (PST)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: will@kernel.org,
	bigeasy@linutronix.de
Cc: ardb@kernel.org,
	catalin.marinas@arm.com,
	clrkwllms@kernel.org,
	leitao@debian.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	mark.rutland@arm.com,
	rostedt@goodmis.org,
	ryotkkr98@gmail.com
Subject: Re: [PATCH] arm64: use SOFTIRQ_ON_OWN_STACK for enabling softirq stack
Date: Wed,  5 Nov 2025 16:33:20 +0900
Message-Id: <20251105073320.208335-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aQoGdVYOddu9bxLg@willie-the-truck>
References: <aQoGdVYOddu9bxLg@willie-the-truck>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_233326_097617_82BF63C6 
X-CRM114-Status: GOOD (  13.68  )
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

Hi!

On Tue, 4 Nov 2025 13:58:13 +0000, Will Deacon wrote:
>On Mon, Oct 13, 2025 at 01:35:08AM +0000, Ryo Takakura wrote:
>> For those architectures with HAVE_SOFTIRQ_ON_OWN_STACK use
>> their dedicated softirq stack when !PREEMPT_RT. This condition
>> is ensured by SOFTIRQ_ON_OWN_STACK.
>> 
>> Let arm64 use SOFTIRQ_ON_OWN_STACK as well to select its
>> usage of the stack.
>> 
>> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
>> ---
>>  arch/arm64/kernel/irq.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
>> index c0065a1d77cf..15dedb385b9e 100644
>> --- a/arch/arm64/kernel/irq.c
>> +++ b/arch/arm64/kernel/irq.c
>> @@ -62,7 +62,7 @@ static void __init init_irq_stacks(void)
>>  	}
>>  }
>>  
>> -#ifndef CONFIG_PREEMPT_RT
>> +#ifdef CONFIG_SOFTIRQ_ON_OWN_STACK
>>  static void ____do_softirq(struct pt_regs *regs)
>>  {
>>  	__do_softirq();
>
>Acked-by: Will Deacon <will@kernel.org>

Thanks Sebastian and Will for checking!
I'll shortly send v2 with the tags.

Sincerely,
Ryo Takakura

>Will

