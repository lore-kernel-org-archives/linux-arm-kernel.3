Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2AFD32D8B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 10:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1NpDWCmtCJKjjDe9qtdXdh1o50OglVlJ0jdBgteH/g=; b=OkR7RBtc4C2oFe+OV3F8rtr2ka
	E20WuOtyzjz3IpMJAKp7Vm8c795b7NTHOO6UHaOByv9r+AN9OmL69Po94MY0IhEDeiVb3dXlKxSRq
	IIlTmAGNloalNmFswJ20xHHW/pXkhJd5UZWZtvErWa/AIxImRMNVK8138eurIiGIWAmdWzJ7gXonu
	xT7QAjIiyzzaeyPnZGdg2aHPF2fIiTjTV0Y6AvezRiShIO7Ha9FHmjMIlkG1RRAIEoYiATwpE84+F
	ybc6frpn8DVf022kNRv1YjN8C+jdCvYP9O0zX+ogj57CDh8gMqFYakTSlrNvUXh3k4qScyRIXokAB
	vVg0EdVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAo7p-000000032oC-1QYa;
	Tue, 12 Nov 2024 10:27:57 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnwr-000000030EJ-1eos
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:16:38 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539eb97f26aso5290355e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 02:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731406595; x=1732011395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1NpDWCmtCJKjjDe9qtdXdh1o50OglVlJ0jdBgteH/g=;
        b=HyZvqKOPVS9TdADkaJtVpUkMLN1a61JAsaZwxdq3M+0/88ZL6WevwropA4/cJKXF19
         wCHiGiOcmnreCYQU78KTI+8tkW/2SOG5CwHpmj6+P2zgyxpxQPn15uiHHDDg6eeK/zkd
         H7Jc3hHAkUTxmlBefybJJsxZ0Cmb8Z5iSbC2w7xyRn26b8ftNGkb4eHjZhziRopHYk0Q
         ElhIYJQc0TMUNbrkKvRJRkLMhXK1kma6KQa0t6B70MZU5xwy/wHG4s3u2doIZBneCje3
         n66mQatrsplWzqUsBN1DqeE+gif9omcn99Fv6Lduq7oVgaaTbGr/tdqLZ9I5TsqLw9B/
         U6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731406595; x=1732011395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1NpDWCmtCJKjjDe9qtdXdh1o50OglVlJ0jdBgteH/g=;
        b=BjS868qORVmg1CmmcaCu/9iwAZZ4QfTBmhOS3bJniM0RVKznSVW6j+SiPDoLGypAo9
         3+UryrKTgInAd8wsWlrD+tTGA6I6z4RfgQkDDzdUcfHRmRJ2nvInsFQCbNaV5SG6k+jw
         fxzMVNI8w52N6X6weFXUi0GmnvVVT7juicyC3nB400KOWizqj558HQULGCEE95Hxosoi
         bUa81YmSrmYxxmWrXAvW0YY9weag5xIt6qsGEdd3mSyrZX1Vmf+o3ck/x3VoDrEwhwX3
         2ZPrK6UJXpSpHkdlzhmVUjkZ7LnV3lpIYH8IqpQ3nIG2mKZhPvo529aHmNql6Do+x/h9
         1xug==
X-Gm-Message-State: AOJu0YwEffmNOCEqoxtO0o+XtcUb9sMinasuKUQYeYc12DUxC3NteF6B
	jsuxquplsr52lbCImZVkXb5IynshqiwA1RB6yBFZY3pvGebfl9PrLOym1w==
X-Google-Smtp-Source: AGHT+IFCRJw0z+cYNAZlQo0jd5oeC+GiBzCBWTfW2oMPVVvpXsQQqy70GxhwP1K9tFJQ5hPnnK6b6A==
X-Received: by 2002:a05:6512:1195:b0:531:4c6d:b8ef with SMTP id 2adb3069b0e04-53d9a406fcbmr1101865e87.6.1731406594938;
        Tue, 12 Nov 2024 02:16:34 -0800 (PST)
Received: from foxbook (bff246.neoplus.adsl.tpnet.pl. [83.28.43.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9da8sm1808565e87.206.2024.11.12.02.16.32
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 12 Nov 2024 02:16:34 -0800 (PST)
Date: Tue, 12 Nov 2024 11:16:29 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Linux kernel regressions list
 <regressions@lists.linux.dev>, Kees Cook <kees@kernel.org>
Subject: Re: cacheflush completely broken, suspecting PAN+LPAE
Message-ID: <20241112111629.18a6e464@foxbook>
In-Reply-To: <20241112103229.566b1ff3@foxbook>
References: <20241111233817.2f824c19@foxbook>
	<CACRpkdYsgnBFsyF9upr=xoLdMJ25DCXMEJ-co7rJTnRanJncug@mail.gmail.com>
	<20241112103229.566b1ff3@foxbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_021637_468462_4575F3B3 
X-CRM114-Status: UNSURE (   9.53  )
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

Regarding test programs, I also wrote and tried this one yesterday.
It's based on a similar demo released by ARM, but much simplified.

It both triggers the bug and confirms the necessity of cacheflush in
JIT compilers on my CPU when it works normally (prints: 1, 1, 2).

On the buggy kernel, it usually segfaults on the first attempt to call
*code, but sometimes both __clear_cache() appear to take effect despite
the syscall returning EFAULT (according to strace), not sure why.


#include <stdio.h>
#include <string.h>
#include <sys/mman.h>

int f1() {
	return 1;
}

int f2() {
	return 2;
}

int main() {
	puts("start");
	char *code = mmap(NULL, 0x1000, PROT_READ | PROT_WRITE | PROT_EXEC,
			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	int x;

	memcpy(code, f1, 0x100);
	__builtin___clear_cache(code, code + 0x100);
	x = ((int(*)())code)();
	printf("%x\n", x);

	memcpy(code, f2, 0x100);
	x = ((int(*)())code)();
	printf("%x\n", x);

	__builtin___clear_cache(code, code + 0x100);
	x = ((int(*)())code)();
	printf("%x\n", x);
}

