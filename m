Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612CFC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 08:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fM8Ztj0WNgxkUzsl19NDzLnsVejYkQJiIVQdlZc8OI0=; b=LkdzONVlBc6gnO9yneoKzw6/WM
	Ilt7bEH4y64qrj0wLbj15xSsPAJxWVvI8lQpxFqqpeu48OLVusxSi30HMed+R0H8DcZXYbGIwfunC
	Gol9f0n+gKLyJK+qhsP5R8JkGR7/5wa0mInaOsgHd9ifbsoHRuNLaps9HSK+lpZjMxZSWJN2Anp9v
	9mbxR5paCLW/dBvMf6ebSniLDdSZMPya+MxJAEL4pDRl1IDDC7IoXiEn7vnbIils+uGzuGVSR0doI
	7s7rbER9+UUR/EXA1LBvXHVOsivQiupmuZ1PsR1Xuu7vBdgk/mRcmu0Z4jrudbbWEbdaJyEPG+LLt
	Ge/4dkgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRzr-00000006e72-10wq;
	Tue, 17 Jun 2025 08:48:47 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRlI-00000006byj-2j8e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 08:33:46 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750149219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fM8Ztj0WNgxkUzsl19NDzLnsVejYkQJiIVQdlZc8OI0=;
	b=IbNiTkPof//hfDswjM3UX2HjcxjB219ulL79IxtMk2Surwa52FLITsHiIGdSPG8S8Gsk9B
	vLw+Vy56yeJQZ2CRRB/RCm+QbFGa3zainhEqBBiPrTezwUW3PHMjhAdifdGI2+S1EZyaXs
	8RSy32gZJtQCmeCgaqJnX8iRp9S4wTShk0L70h6ba11fJXoKf8M0MUPAGOpUg7J2D2lnU/
	lC+VF+rl8YCFZHsFyIZXXvlQc4UATj/1l5oe0wSu54ytgsn/7R3Ycz/Pi8RO8uVjHJjojk
	UeQ0zueK4/eI86dw8200fEYtRWMlrscr6O/yh+PSBJbzmEPHMOiIqOaRKo5P5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750149219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fM8Ztj0WNgxkUzsl19NDzLnsVejYkQJiIVQdlZc8OI0=;
	b=qEiPmGt/KG74R8s1cTauPdSKufrbj0ktaax/krGPrsd9BNNZSi6RX15w3NkLphktH5Tr+T
	5QwafYnTNKQcifCg==
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
 rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org,
 pmladek@suse.com, peterz@infradead.org, mojha@qti.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org,
 konradybcio@kernel.org, dietmar.eggemann@arm.com, juri.lelli@redhat.com,
 andersson@kernel.org
Subject: Re: [RFC][PATCH 09/14] genirq: add irq_kmemdump_register
In-Reply-To: <6a493968-744a-4fa2-803c-3f64a8e7225e@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-10-eugen.hristev@linaro.org> <87h61wn2qq.ffs@tglx>
 <1331aa82-fee9-4788-abd9-ef741d00909e@linaro.org>
 <f916cf7f-6d0d-4d31-8e4b-24fc7da13f4d@linaro.org> <87ikkzpcup.ffs@tglx>
 <6a493968-744a-4fa2-803c-3f64a8e7225e@linaro.org>
Date: Tue, 17 Jun 2025 10:33:38 +0200
Message-ID: <87jz5aojh9.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_013344_840177_53671A6B 
X-CRM114-Status: GOOD (  15.70  )
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

On Mon, Jun 16 2025 at 13:12, Eugen Hristev wrote:
> On 6/14/25 00:10, Thomas Gleixner wrote:
> #define KMEMDUMP_VAR(sym) \
> 	 static struct entry __UNIQUE_ID(kmemdump_entry_##sym) ...
>
> is when calling it with e.g. `init_mm.pgd` which will make the `.`
> inside the name and that can't happen.
> So I have to figure a way to remove unwanted chars or pass a name to the
> macro.

You can do:

KMEMDUMP_VAR_MEMBER(init_mm, pgd);

and concatenate with a '.' for the symbol
and a '_' for the ID.

or simply

KMEMDUMP_VAR_ID(init_mm.pgg, INIT_MM_PGD);

>> #define kmemdump_alloc(var, id, fn, ...)				\
>> 	({								\
>>         	void *__p = fn(##__VA_ARGS__);				\
>> 									\
>>                 if (__p)						\
>>                 	kmemdump_register(__p, sizeof(*var), id);	\
>> 		__p;
>>         })
>> 
>
> I was thinking into a new variant of kmalloc, like e.g. kdmalloc() which
> would be a wrapper over kmalloc and also register the region into
> kmemdump like you are suggesting.
> It would be like a `dumpable` kmalloc'ed memory.
> And it could take an optional ID , if missing, it could generate one.
>
> However this would mean yet another k*malloc friend, and it would
> default to usual kmalloc if CONFIG_KMEMDUMP=n .
> I am unsure whether this would be welcome by the community

That's definitely more welcome than copying boilerplate code all over
the place. And if you do it the way I suggested, then you only have
_one_ macro for alloc and _one_ for free because you hand in the
allocation function with all of its arguments instead of creating an
ever increasing zoo of dedicated variants. But the MM people might have
different opinions.

Thanks,

        tglx



