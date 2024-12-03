Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFB9E6C5F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 02:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ClTlVFTFurX5oXTNx4i+KqY1w2R5KKrVUj+CsjT5+JI=; b=vzNOYQVPRvKL5J3q3w9BzeE53b
	798HPmG9cgO1x19AsNLXTGKvsEcF0F4aQ0mcihxNzjE/kMt05AYIdTmch6Bgzne/Oc+k1sZKaC8p8
	j6YJw8yaHUtX2hpnNScp5exqUCbmxnuOoGOYm1vfd8HNa5rOSlybB4FU7k0T3Y+54d1wIAgdgPoFq
	+Qt6yVjcBm+lXaYQAD6Jd1Z+zIfAgueyApg9oZRxs2EUjZzS3oOyn0eFtBTyp6UAss3V/36AL3rQc
	PLfJgNO8CrT5pfJ/ZxUtHVTWZnE9g/esnJaXbA79sVlXyEaGXmx5mEBr0W1dRxxEIbFvtIh706Duf
	W+lDP2ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIxg-000000083lF-0wHR;
	Tue, 03 Dec 2024 02:48:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIwM-000000083U1-0FK7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 02:47:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733194025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ClTlVFTFurX5oXTNx4i+KqY1w2R5KKrVUj+CsjT5+JI=;
	b=Qpwt6OGME3Ogfrc+Y3JRQNnOA2E6a1NzBRPLMv0TevI16DXX8wupZzWX6D2kgEeqa5FleP
	8HrK4IUClO0c/QFc8boxKbblV4y4+SioDakb1MIXzzcS4p+zsH6ye2UnipREmXhx+Z1/pJ
	9Ta0gz718zqNaWmTPgw25bxWgIdwF3c=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-ZfjXX9JZOO27mof7mnMwYg-1; Mon, 02 Dec 2024 21:47:04 -0500
X-MC-Unique: ZfjXX9JZOO27mof7mnMwYg-1
X-Mimecast-MFC-AGG-ID: ZfjXX9JZOO27mof7mnMwYg
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-7fc62de66b5so5098767a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 18:47:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733194023; x=1733798823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ClTlVFTFurX5oXTNx4i+KqY1w2R5KKrVUj+CsjT5+JI=;
        b=R+t+lh3r2DyRVTO6ghkXP0tMM1vqxBHuckn3QTbBvVSmxMhHJHX8tzC2FNQfc5uswP
         iL+eIxMcV343rxkQBPQp5hckUUDAcIcDoD4ov2spVjG2hdU5voJ2+4MjS2HhMZ6dEZc8
         RvZaAt9SYlbnykmKYz8HyQxRQWIGtqMsovvciXEO1cQo9IZHTOIomHQmwihgaYMarr5s
         U1jyr++4ho2fFJeQIC+GrXp4asVfOPhLgKEugoreulDkO1pF68pnG2bNYSPLVENbrEDZ
         Shvua0ooqBN6c2ZHVKToj9R4NBOoc0bPU+naLOtTPGkSy6gAO4fOlud9sQ9IDq3BKKzQ
         763g==
X-Forwarded-Encrypted: i=1; AJvYcCVNFKabNiLxWGTgUaGxdEZ/eMALgn2Vr3r30v6MfghNBMvPs5cwP4FYIvkYVfPjznT/2c/esZKEFGNn5HGOS8Gy@lists.infradead.org
X-Gm-Message-State: AOJu0YxosbcI1CP6hxGcYV13YERmkcfXaGIUdahhHNaoaf11mPYGWsRV
	AP/Qc2RzWdjnfI0F1m8Pl+tmgX/rOKjWQklzPLbN5TvCnS12Ju5HkJ9mABAxtpYrmThcRrHCA8B
	4sT6rkan3zoo+SxLDjBLhVfSUCt0SyvZmngZeuOe4W9Gp7d/QTx3sSPXySJI0ruyhj0DKZzEC
X-Gm-Gg: ASbGnct+DVnUTTaOFmW1UIyALRqhlxF94wVn6XqzMAo8OW8wJxy04LcJTLlTS5UOnd1
	8y22t8RAgfM+IJKU8DnqK2MxGIYe5HLzV5/YSK2BklmOOb4VUE13ZUU4qbKg7zoXGBdQVKB4PFd
	7h1eNQfxqs0Mfp9AB4KFJ6LTuuZqm/E3+B5t6R9NRijVgx2z2Lb3pi/hZhFw5YoxwfkN3hjPvXf
	dk9elD6Nf4H3DXhQKIwGy1ZUs93jc670MvXJtaG8BaKNaenduY=
X-Received: by 2002:a05:6a21:38d:b0:1e0:e042:59fb with SMTP id adf61e73a8af0-1e1653f6b74mr1564772637.30.1733194023097;
        Mon, 02 Dec 2024 18:47:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9eFzD9WG0Hqv5IQOxlc3XDhwP+H9Hs6Mbmnq+pKxPw+93nYH2bBH5+6wJ1GFGp+i1k+N1ug==
X-Received: by 2002:a05:6a21:38d:b0:1e0:e042:59fb with SMTP id adf61e73a8af0-1e1653f6b74mr1564759637.30.1733194022801;
        Mon, 02 Dec 2024 18:47:02 -0800 (PST)
Received: from [10.72.112.107] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725417fbf2fsm9271296b3a.112.2024.12.02.18.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 18:47:02 -0800 (PST)
Message-ID: <498151ad-6fa4-4f16-9044-e0b1f78d161a@redhat.com>
Date: Tue, 3 Dec 2024 12:46:55 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Replace open encodings with PXD_TABLE_BIT
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
References: <20241202083850.73207-1-anshuman.khandual@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241202083850.73207-1-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xFG6hVttRnslrzXu8uFObQgXPaGWwb7uRCdfVo8HtBw_1733194023
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_184706_171660_04F66A41 
X-CRM114-Status: GOOD (  12.34  )
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

On 12/2/24 6:38 PM, Anshuman Khandual wrote:
> [pgd|p4d]_bad() helpers have open encodings for their respective table bits
> which can be replaced with corresponding macros. This makes things clearer,
> thus improving their readability as well.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.13-rc1
> 
>   arch/arm64/include/asm/pgtable.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


