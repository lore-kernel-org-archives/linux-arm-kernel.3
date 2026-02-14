Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45AFEF48C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 11:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiZwlgtBXqE7LEsN2nlgf0AbHOoRJSUt9gOPy7eO3jU=; b=KIBNh51G8ddXRVdfz386tJQiNo
	zJeUqan6SPtH0Y6j03kCicioIEIcimDGS9n5PrBiRDDudvUI9S9tHrd7W0krRIG5+Zl21I3HPY7y1
	ca6NvxYEhjvzebP9bzbgH1VEGneWB3skKnAqB5IXQCnRDykcEl8FUH3P1l9wPlxIZAOmRbi6D1EEz
	OvEscJrt9bneEOl8K8DmvtWraOTn+WVJpBtQ6/+zJSDCfssz8gaS1WEs+WV/q2Gz6Ji1V7VyUFddU
	CQqqWqXRyfwPFFxkHzqMLuSxgVOgvG2KDigZDsXPIAE+6uMr20nljaEm02WaKOoqCGI8v1QuLCle1
	nLXLYMlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrDs3-00000004Ugy-1hZP;
	Sat, 14 Feb 2026 11:31:31 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrDs0-00000004UgD-0Nfn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 11:31:29 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso1305685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 03:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771068685; x=1771673485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiZwlgtBXqE7LEsN2nlgf0AbHOoRJSUt9gOPy7eO3jU=;
        b=A5felUA0E7RuHPsnWi/6pfDgb13OIzW7qhukSE+xZ7OEq+CVxJc4/6KWWy7pCPhZZR
         6AZBeno1TiJgpk4kGTWX3zKHhoEg7JruNan0z4w4UoC/KXphghw7EkKi65uFe5520jgH
         pXBQXU3BppBE4v4HiyzdzD7YIVq5nFtKdniJSuI2CPUiP6J9J7AgmRvF71pobffJePyC
         Eb1eaw9FTqELmC81bswTOhBrDAI6p/g63HBDgW0XMH0hDm8Nuqyngjc5y/uyGwPRpaaF
         z4GRlqmErojQeeLAa4r3vSDENjWUassiIQZeE0nkOcZvs/sU+aTh+O2sKUGE4IfifHZc
         4png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771068685; x=1771673485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OiZwlgtBXqE7LEsN2nlgf0AbHOoRJSUt9gOPy7eO3jU=;
        b=XcMcsBNutamoughEHasoN3c+L7VU+IbA00otzI1eQnimPU35jOoD6yqdF1gYBbqpjB
         edCWBkVs0CsYAxTnff33ex8LFiZa0kPfavKSAH2ERz0aSBsdwUP1RwnWXC5IyaFptCGy
         F0v2h84LcFFFU/EJFOONVagqbKa8lHM0IdBPCynJA0q9I7Jmqipmp5mYUptbQKeWoTWt
         EncKbUf9+jsJKI2hYRZLyJf2xuKBhrqFEk9B58dCJFKXBLC8kK9ug6pvEx8IunjKQGG1
         eE36MY5mbfTykl9VTBYzdz7v7gmk+QbbKmshaFPk/vPEIyxemq+HLrukMYdkllANbbXi
         gHHA==
X-Forwarded-Encrypted: i=1; AJvYcCW6APwaiSXiAZIZULT95IBMnyuDTwXY0yV465Qe9fGvzE/6v3MQE6LVEf5mAsMoaCslMtr7jCLT2NKLjVGTMFhb@lists.infradead.org
X-Gm-Message-State: AOJu0YylBkuHIOwQRRZ5chA5P902F1D4QMX97FNv/FmIql9HmsEh32RA
	Cw3atOtpDx4m4zQsNEv9xRNVJsZOqbo1k/ovNYmhR0CDZNLY6hd3G1UM
X-Gm-Gg: AZuq6aKKHlY4w5yi0nfhCGilmUk3rjUaOmdvTXtPcshOBzVAeSM9hfhh0RBX/k6o+XB
	XtYkDHo/D+xokA8FfhDPL47IYlgN60kNtEaSWso9sXpAsAAJ5D4gpttCFl8I9dSJB9T2s6fYE2U
	NoIgeqOCeBB+OliGzaGLgVu7mKR/d6KsehMIfLKLCP9oLJWAGowkFidOF6lKm4+IGYQpn90PSgU
	Cei/siYMf3icdyPOTXOwx6rvywpxOLLDVLF2PHvaftoaT2vwlMSv4+/K6GY4zh0O+/8aWaP/Sna
	ILrTSxKRVM0JCpuW426roj2bS1Rg+S0GC1dQXX4Kc3s+7K7RfZ+C2deiJmWKh9wn9xWDAHuIhZS
	cyg7YNFw6zwdIyJgU6l4IQGU5mOv/oz7TslBWfoLBaPoKu+jbilG2zDukosEOWTmkiA6/adClEc
	cOXB/pZUkkGrM+McAh8VHCCTUsJ18KbQ5x9Y4/jPPOCcSTz6MFAOhQQ4ImGpguy1iG
X-Received: by 2002:a05:600c:3f1b:b0:480:68ed:1e70 with SMTP id 5b1f17b1804b1-48371096d3amr84223035e9.35.1771068685196;
        Sat, 14 Feb 2026 03:31:25 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836aa0847asm237182465e9.3.2026.02.14.03.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 03:31:24 -0800 (PST)
Date: Sat, 14 Feb 2026 11:31:22 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com,
 will@kernel.org, peterz@infradead.org, akpm@linux-foundation.org,
 mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org, ast@kernel.org,
 rafael@kernel.org, daniel.lezcano@linaro.org, memxor@gmail.com,
 zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com,
 joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
 konrad.wilk@oracle.com
Subject: Re: [PATCH v9 01/12] asm-generic: barrier: Add
 smp_cond_load_relaxed_timeout()
Message-ID: <20260214113122.70627a8b@pumpkin>
In-Reply-To: <87tsvj6hwf.fsf@oracle.com>
References: <20260209023153.2661784-1-ankur.a.arora@oracle.com>
	<20260209023153.2661784-2-ankur.a.arora@oracle.com>
	<20260212095621.4d99317b@pumpkin>
	<87tsvj6hwf.fsf@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_033128_206092_67C29334 
X-CRM114-Status: GOOD (  10.78  )
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

On Fri, 13 Feb 2026 20:58:08 -0800
Ankur Arora <ankur.a.arora@oracle.com> wrote:

> David Laight <david.laight.linux@gmail.com> writes:
...
> > Plus the cost of evaluating cond_expr 200 times.
> > I guess that isn't expected to contain a PCIe read :-)  
> 
> :). Good point. I'll see if I can add something like "when polling on
> a memory address".

I've only timed PCIe reads into an fpga (Cyclone V) target, but those
are about 1 micro-second - which is a lot of clocks.
Hard logic will be somewhat faster - but still slow.

There might be other places where 200 isn't a good value.
Perhaps add an extra #define that drops in the loop count?

	David

