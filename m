Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09744C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 22:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=131+oOmL38T7UgLdCmyTO5ytlpVHrsUEOd7HxcByZyw=; b=gSLIR2yw9zMF3x
	J71Si0DdCFmCNgpuQs+3We8Fwqx9lDJytKWBizaKedmob9GRxkU4guSQ/Ih0Yj2fB6c3CJVC6NxS0
	wiws5lRAWaVx8sFqDJdQdLO8DWOEgiB4R0xLj7/KfDAHSMTvQIpnUuZi7gaywXKa1uO56wn+4azBf
	v08FErKHpiHDV7ZmSNqMlADGA6uonsAhNxJLtyNoAJSERHihyvr3lNsIHFCq8PvwspYMlaEn/hrIj
	jYwDHJr/G9031eXdVsAuHzwfjwe3rxpeCqWtoagZFOT3Tim7W16azHSYLQF9zNg3/ogG5IZlpwr6G
	V4Qwj6uccGqjp5K+/2tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopvC-00000006NYO-29K0;
	Tue, 28 Jul 2026 22:05:10 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopvA-00000006NXx-18s5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 22:05:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4954dff6536so1944185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 15:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785276306; x=1785881106; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=131+oOmL38T7UgLdCmyTO5ytlpVHrsUEOd7HxcByZyw=;
        b=MKeQg6uN9Aw4JZeIAgf8y7RV23lHcDTOKctAsqydkwfXnPiqsIt7FKIwoFm/6pcOO7
         eeCYt74farUVCp8WniTEwLB227g9+cBrOkdLdjCHP0+WXvrJ0Qr88J2/2M4sttYC8YRW
         W261SLFXB+LZRYi9NOt56x0GaSZ68RTcBjYWaE9yASkGAdmMvCIaR2vRB7Z1pqZYN9cW
         1jamuNimePNEMRdRc00a0joBKc9inGDP3Ry482ojr0VxS+qNKTnk4ObFMnWHbZU7djBU
         dzo7+/Cnz2z4t/GxLytMlaIPwR298df1d2Bq6hKqfimCr2S9djcKOK+zpxKxziDvCeY1
         /gXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276306; x=1785881106;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=131+oOmL38T7UgLdCmyTO5ytlpVHrsUEOd7HxcByZyw=;
        b=ZDtCXaWUls6JhN6ZYwtOxwITeLNucCX/znYifynz6KPUyvmVvvJ9lL2dFyuu9nNiiX
         YUgJvznKyc6xGF4H0ghLPkjWaXIUyovF3j4C33nY/o8KVk/dqOYeKcjoKsbpdToaCfm0
         ZDPeVnB3K3A6CTY5/aAK/jpYm09laGxVHFVJ92RkzaqXZO/RsEpAGAI6f1/xEsLj5cuU
         1+Ra6slwabcw3OT5O7orp3FirfoWXe+VcrOCCwzCwahB+iVl+SDhIkvVbIpCIwhDsAOh
         aItlnCzmONzrYOXEa2uqKJoMXJ2d56x0WUmFhscRtuWmQdXL0+P6KvUCeIWXvpaq1iAv
         L8GQ==
X-Gm-Message-State: AOJu0YwHoBDTPlZy9x8pyoYJEItWTpOPWjAXGBH7Qb9oMGxnspIEMo6G
	KVD3qhWrS7aHpMV5KMdphJkfoPdDrj6bbNajkNoMR1ulEOUfpLAHQ/FlE9g+4pyn2Z8=
X-Gm-Gg: AR+sD13/qjBSGKqgxPGk8BEb8XvRGP61maIdF6rj4GWp3PpHU0dgIVeVCpF4A8qoNvS
	A0r/kQ7QbrSmKd13voVBjHhBzSOKwiER/HWLA1xAGkniM15RA6EeYBP5HTUANoaGWkvIW0yLiR/
	df1AOg7tztSDdo6euylL9h5P/ScA7nEXVW2kUz+/4aJTVxF6BRSgl6svOSL22uttNkkl3kzkYhd
	IRa56fYzZFOwuZBtnPkoO/GaD7hMY2MH+6l6yco15qFLc8Tcv1ypKn6Bww9NFrgpkGGuJm0qOfH
	l1N7wqVTCZDTHba8+7skEBBfPtnx7WhSQPyYOH+ZatOuxWMhbP5jrA9UZDuGON9fXEl5Fm+KMLR
	wjYaGuHGwtZpg6+03tPminQxg9LdQ5WOKRDiBdDjd2bBQKKaOPoAM5ACIfGuSug9pPK0tvkpv5q
	P3lHBIJqksCDdhpO0YoV4CDvGhaB4dtK67cSWM/X2nucm7zlBQJWkWW313z1xIts7/hOGO6YCiJ
	s6ZWmCbl77HjUsuoK/nBa4Jbg==
X-Received: by 2002:a05:600c:1f95:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-496c64261d4mr45033255e9.3.1785276306124;
        Tue, 28 Jul 2026 15:05:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49764d6d0f8sm8998665e9.2.2026.07.28.15.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:05:05 -0700 (PDT)
Date: Tue, 28 Jul 2026 23:05:04 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC PATCH 07/13] arm64: percpu: Implement preemptible
 read/write ops
Message-ID: <20260728230504.41e2861a@pumpkin>
In-Reply-To: <20260728123859.2911495-8-mark.rutland@arm.com>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
	<20260728123859.2911495-8-mark.rutland@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_150508_358882_683078BB 
X-CRM114-Status: GOOD (  15.53  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, hca@linux.ibm.com, linux-kernel@vger.kernel.org, ruanjinjie@huawei.com, yang@os.amperecomputing.com, maz@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 28 Jul 2026 13:38:53 +0100
Mark Rutland <mark.rutland@arm.com> wrote:

> Use the PCPU GPR infrastructure to implement preemptible this_cpu_read()
> and this_cpu_write().
> 
> Note that this change means that this_cpu_read() will always use a plain
> LDR, even in LTO configurations where READ_ONCE() will use LDA[P]R. I
> am not sure whether that's ok, or whether we should similarly use
> LDA[P]R here.
> 
...
> Generated code after this patch:
> 
> | <outline_this_cpu_write_u64>:
> |        mrs     x2, sp_el0
> |        mov     w3, #0x7c60
> |        strh    w3, [x2, #20]
> |        mrs     x3, tpidr_el1
> |        str     x1, [x0, x3]
> |        strh    wzr, [x2, #20]
> |        ret

How is that likely to get scheduled on a typical arm64 cpu?
In particular does the reuse of [wx]3 create a register dependency
between the two instruction flows and stop then running in parallel.
A typical x86 cpu (that anyone cares about) does register renaming
so it wouldn't matter, but I don't know about arm.
So it might be worth using different register for w3 and x3 (although
that might cause a spill - which will be worse).

	David

