Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B684DCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 23:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1GQjZOhKRA0cpDt8l/K+2WDzgefBcTkUmqo1xyKi8I=; b=flAaFD3qVpBh7zAYbARn+FuwuS
	bgrD1ZT8HIF5aKO9qsWq7kh+0XbEg7gMzwpqaMbiXHpHbwQnMpXRELIXSEChIxN/5Pcr/j6Y8eL1H
	x4Z2XpS0Ve1zsy6bJz+Fn5GFsVozBvsAQ2G+6cG7QtgYF2Tq/hrq3JXBytoIZuDWChG92rU9WUxVf
	/CIRs/Fva0F8P0JQS2EIArxFUWHDGXkuuZ8XXMQsP+DqneylAdsxEEKImStT7VrOMfOJz4B7pYJRd
	5u4NKTDgbHEeDb9vMeJBEz/bBQtLZmw610Qw1cSRXcsRw8GznNQwdGPY2pqldKC83Khc3J1iwMROI
	7xS4IBCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS1O7-000000033e5-3IBN;
	Tue, 26 May 2026 23:40:43 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS1O5-000000033dE-2Awp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 23:40:42 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-30457ff05b8so4051547eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 16:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779838839; x=1780443639; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K1GQjZOhKRA0cpDt8l/K+2WDzgefBcTkUmqo1xyKi8I=;
        b=ADYRoISC5ykwT1jcYQgRUm5aRGqg6OhfnQuGj2damkZwiAurCfop8lRoBIHP2ljZNp
         riGi1SVK0XGHYH5x3onB4WYQ+dphklRD8YlSQKBDegUNqe5pt6/KlmuZMeg9E8NYOGbn
         AUHQQvTpriUVqJkdFZAUA+Jff4gk+Bo2FASmgRnkfYdJ9z0qtd0PayejqLkFDrPAoonz
         Ghw3JfHeBcRyz/Qr7rdOtiClbFKBLtA3gJrAEZL21JOOUxnkYD6K+7D/eirl2deNSiYV
         VEbSQEgQMTr0jgjQFLXg+cZ+9LOIdwNB3xWPu66CwjhI8dD3puM0GVtclnmqCbPT4B5H
         5F0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779838839; x=1780443639;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K1GQjZOhKRA0cpDt8l/K+2WDzgefBcTkUmqo1xyKi8I=;
        b=EX54AERxWj1ibZ+I7QyNAf3CjFE7U8SfpetBQJRqFNHH03hGP/k5sX2ddjQLkUk/jW
         m3LEKXLMbFWpEwKGLwY5N1td4SvVfpT7DxJOL95YK6KuUDdH8Lly0DOBrwbmEfUVBH2K
         l03Xr/FUNWtwWz50jSHPnbcbJH9FJqaS83Zmrx0FrY6ju1C0eCcq01gNaFT8qJeZfilq
         kVGr3ScrfTMgXoJ3tt3xuSTnH1PK9xIJ+sJsjh/QfYWg6fEzSW1mN4VkmK8NOkoTMnU5
         zrGem73UnMj6Z7by827OpaJqonc9HNfSgxrswWlpfZxCyGl1NEggZ4la0dsF5pvTs8cw
         O9eg==
X-Forwarded-Encrypted: i=1; AFNElJ9BoSGnR5WicEYNc6XTv0xiWaRr2HepE2UrWxblmhDVKElSOryeNOd3SvrV8eBefk6bVrNNqICDVWeT0I3pedqx@lists.infradead.org
X-Gm-Message-State: AOJu0YyM9v56Vaq1hzHqkBwFEZ5bgl94m+lfrsHCKWxNrrc5qmv9V/Zx
	HpKgHVi32ZcoiBj69IBs/yO3XfjJA5ZSCSeCAHW1g5iSfeM0hVcZlaoJQrwzpW0Gfffsk9u32E8
	25xCE6Vis50G+RkcKqMmWBu3Ussd55A==
X-Received: from dycrm18.prod.google.com ([2002:a05:693c:2a12:b0:2f9:af7:5053])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:a84:b0:303:f2fc:c483 with SMTP id 5a478bee46e88-30448f30872mr9330662eec.1.1779838838965;
 Tue, 26 May 2026 16:40:38 -0700 (PDT)
Date: Tue, 26 May 2026 23:40:38 +0000
In-Reply-To: <20260327080023.861105-1-petr.pavlu@suse.com>
Mime-Version: 1.0
References: <20260327080023.861105-1-petr.pavlu@suse.com>
X-Mailer: b4 0.14.3
Message-ID: <177983883822.35274.16490796584446355825.b4-ty@google.com>
Subject: Re: [PATCH 0/4] module: force sh_addr=0 for arch-specific sections
From: Sami Tolvanen <samitolvanen@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Petr Pavlu <petr.pavlu@suse.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>, Joe Lawrence <joe.lawrence@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
	linux-riscv@lists.infradead.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_164041_553506_C95D87DB 
X-CRM114-Status: GOOD (  11.11  )
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

On Fri, 27 Mar 2026 08:58:59 +0100, Petr Pavlu wrote:
> When linking modules with 'ld.bfd -r', sections defined without an address
> inherit the location counter, resulting in non-zero sh_addr values in the
> resulting .ko files. Relocatable objects are expected to have sh_addr=0 for
> all sections. Non-zero addresses are confusing in this context, typically
> worse compressible, and may cause tools to misbehave [1].
> 
> Joe Lawrence previously addressed the same issue in the main
> scripts/module.lds.S file [2] and we discussed that the same fix should be
> also applied to architecture-specific module sections. This series
> implements these changes.
> 
> [...]

Applied to modules-next, thanks!

[1/4] module, arm: force sh_addr=0 for arch-specific sections
      commit: ffe1545ce8a0a7bb698d5f68cbbdef8f93d1fce6
[2/4] module, arm64: force sh_addr=0 for arch-specific sections
      commit: c5553deb577fe433f770e270fd9582b8325f12d9
[3/4] module, m68k: force sh_addr=0 for arch-specific sections
      commit: 9cb4d4dc82272538de1b7edb6e8cf91597ed00b0
[4/4] module, riscv: force sh_addr=0 for arch-specific sections
      commit: 04e17ca3f77e1722a5db068fbcd7b93c51656013

Best regards,

	Sami



