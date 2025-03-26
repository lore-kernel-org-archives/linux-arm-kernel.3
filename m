Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64ADC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 15:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4L90UXo/Eloa6bFLe63wlh9gsUHXreX60bjxNb5DKY=; b=IxegebznXj9DBRD44X/gUnsvhG
	HwHpMWr/f5QttqJUuE1evCr7UeNl8DP3b0Q5QBg7O0alH8uHz4DYPqtjSTc50cvajHuXmG1KxQIyd
	brOboRtRPG44qfsBv2u51KKM74CjZw7L+EtX7AEnYzwf40GeaIoz2TfWx/rxwWU2NSaHAv+urw0Oo
	E+XL0oT+dw106fgjbDWWmuJwmIfkn6UnEGxW8fCu8488f+7t7Um0vPMlmUM9JSlZxZ0OSpLQHP26V
	PyXyhFr2galx92l/fUXaehrgqatxzXTJqMhpoorsgDPVuMxTDIsTuvjdOehTWFIOBV7I3s1+AAZXu
	95JjDsdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSTQ-00000008oyY-14E4;
	Wed, 26 Mar 2025 15:15:20 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txS3j-00000008k76-0HQk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:48:48 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-477282401b3so52776161cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1743000525; x=1743605325; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s4L90UXo/Eloa6bFLe63wlh9gsUHXreX60bjxNb5DKY=;
        b=NepE+aMX+mdxXvAb4BdyGTYeCBQfNIhiIpNfYmDEMkcXG9qGxReL8k4O8az39xx+mq
         xdLjue4jcurkdmvK7HtSl+pZ4Qdw1rfYRFJJd6ArkQznqdGHKvk86v6g81z10zcYK4R/
         X61FhIuQjADpXMkLKwB2pZ1/HLWqqTAt30pCqCQzxwfld4VEUt6gGT6GOGF9LKxYAp4D
         1ZcJkcBYzwiebSKeP/Muw8cGxKymYIL0p02qBn0casK4n5Ba+NTMlkc2coTprUqB0ms2
         TIEojNbw7X9gwJE4V/+45bM+BtnlmYuh6A1y8JwID/hgBp9Ivcq9c5qyPp2nwcudEY99
         aHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000525; x=1743605325;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4L90UXo/Eloa6bFLe63wlh9gsUHXreX60bjxNb5DKY=;
        b=jYy/bys7F8eezwuuES0oW/zp1NTlRrbC7XaaJ7oiFxp1c68LKVibNbinMNNFSkH4qG
         F6cPjQsURhGcE307lrzG2jgnHW3Jm2mM7EwDJ486a5LIrcZtcNoNshVaA8LBjQ1l2/Wc
         AznKWr+IUHpaWxtjyrp122Fehr6yDoR1mOb18ZozNmKBZe88sT9ckj4R/RbxmDtH2Hzr
         R1nNfZ831yrs/XWdAr+cybwSTrs8C79WO9lmagydRyT7UyfOC4M43QAK6yaoznjTHZ3U
         zWepYK5gpmA9UtfmwWso4PDu3fayDXjXYL9wVqpX3z5AzAqpjNdx0jbR3yBT3vKCdc+L
         v9zw==
X-Forwarded-Encrypted: i=1; AJvYcCWItNJwTYg2DYCnE1rmX7B8S07KIaWDHTp4gj3fhAIb8ALThoaTa+f6sYAllNu5VzdPUSxWr6dcakzgeTBqa9EP@lists.infradead.org
X-Gm-Message-State: AOJu0YwR750sr8OvMWuPAH49IHwJa9IonqQVpbqDtTIhLq4rHGgl96cu
	dAvv38eygek69RHEa39XXDpX+OsoPZzJCAlae6PZU1/5jfk5T6jKfthumAMsU3D3xOnydttYWlR
	UbbatiAFM6BTrP8QU82VyjKIcZrLFpfmm1djkMw==
X-Gm-Gg: ASbGncvU6xW/UqUm8Dfd7+78QjOioVp++BQQAQWXVq79kYR51/ItBnSILVUIDMMglj4
	UaO/prdYES90kgC7K2QBUYlCEsTWbdoTjmcsIuYMBMMe21WUThexLRz83pDSqiBszgyxF4yUktW
	V8/ph9y0J7gLuwUCElpnf1TAPLLHwreYvNDJo=
X-Google-Smtp-Source: AGHT+IE/in8kAs9sUqWx2S+TIM+LTl3sNiBhEhAtSNAuElUMT/X5dBkUTEwjbBFN/tuBh1MnZZanWSfFlEopABMrt2Y=
X-Received: by 2002:a05:622a:260f:b0:476:91d8:230e with SMTP id
 d75a77b69052e-4771de62880mr403362231cf.52.1743000525452; Wed, 26 Mar 2025
 07:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250304150444.3788920-1-ryan.roberts@arm.com> <20250304150444.3788920-4-ryan.roberts@arm.com>
In-Reply-To: <20250304150444.3788920-4-ryan.roberts@arm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 26 Mar 2025 10:48:08 -0400
X-Gm-Features: AQ5f1JqVDILCP1zyFTP-RFlE3wANS6rYR-F_g2XERE3hhejEgMHeH_4cyMuLPCw
Message-ID: <CA+CK2bA3ctd6+G9DrJZ3RvnehPCrf7hEJ3boFJ5pkMTZyVmDSQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] mm/page_table_check: Batch-check pmds/puds just
 like ptes
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, David Hildenbrand <david@redhat.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_074847_356256_1F67E7C7 
X-CRM114-Status: UNSURE (   7.80  )
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

> -void __page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp, pud_t pud)
> +void __page_table_check_puds_set(struct mm_struct *mm, pud_t *pudp, pud_t pud,
> +               unsigned int nr)
>  {
> +       unsigned int i;
> +       unsigned long stride = PUD_SIZE >> PAGE_SHIFT;

nit: please order declarations from longest to shortest, it usually
helps with readability. (here and in pmd)

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Pasha

