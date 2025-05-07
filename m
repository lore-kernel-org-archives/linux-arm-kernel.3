Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863F5C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 10:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4pHk17GG+lwu3plctVKrw5RaE0D1NaJ+cJ6i3ORwCA=; b=culkbSt1ewXW55WHQ7cdkqm8OV
	khr6K/CtOM2hasT3WxlfmRT01TM/j2SkgKj8e+JJEmx+wROnyJMCOMrY2mrAR73N1KfvbVpOVRK6j
	3Em53bdjxhIwUZuuNghxMkwFWyKZqKjNdgfKs+be7gqA0gr2R/OnUsPoX69TvhpoI6voupJF6/EgM
	Tjkdc7ng1KYQjE7q7IJ7nkfQcuhbJ2nO1R21I4W1uNnorE5jSkM5OkHtFnbbC+qdAqKlnr+uOZ1e/
	u2wjb6voe4w0gtGDI81zXFIJoS7/Mw1OfhmhJS7EWObJLSdQWtQBonqjHnQQic7FjoEJ0vlvczhh3
	lKFdyXUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbyz-0000000F6We-13Sk;
	Wed, 07 May 2025 10:26:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbqr-0000000F5ey-0mRh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 10:18:10 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746613085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s4pHk17GG+lwu3plctVKrw5RaE0D1NaJ+cJ6i3ORwCA=;
	b=RLLizDM3KF8Jx819fP5VjGo3uoH52hURXbWpFhkI0V4Qh9y53QTVLgovqHIvYb3cZTdGx/
	1ojhUiQeXfz/f3ZKhVBLDUwjCj1yi3K/TphcaBetoq8/4NWIBG1mEqoyvie+1XlINeJPBR
	MeZFvZvBkcuo15444k6ZUnJXAOhzkyULeIrf4/oXIUfxvDZTaW9pmwizmsWq7GoYCnM0Pz
	ogUUEjEmDjvNhBINMlAbR9sQ8QXy9qFpxVclkcAXLWmwXDLtnJtdgzIQ6xNTBJ4L9X1IfN
	TEzkonsssBSkxy13nYrVRdMA5IDqXTqyP8anuXNpdCXFssVDL+uF3WG06Y47RQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746613085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s4pHk17GG+lwu3plctVKrw5RaE0D1NaJ+cJ6i3ORwCA=;
	b=zugGHuEDilWoSa7bJfTmbMcaZCLV2sCx2E6bwjhn7goEfidQ1SvTDYTKvJx7QwSJLFeKsq
	mdE6mDHh+m2nB8Dg==
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
 rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org,
 pmladek@suse.com, peterz@infradead.org, mojha@qti.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org,
 konradybcio@kernel.org, dietmar.eggemann@arm.com, juri.lelli@redhat.com,
 eugen.hristev@linaro.org
Subject: Re: [RFC][PATCH 09/14] genirq: add irq_kmemdump_register
In-Reply-To: <20250422113156.575971-10-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-10-eugen.hristev@linaro.org>
Date: Wed, 07 May 2025 12:18:05 +0200
Message-ID: <87h61wn2qq.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_031809_361266_3DDB6500 
X-CRM114-Status: UNSURE (   7.77  )
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


$Subject: ... See

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-submission-notes

On Tue, Apr 22 2025 at 14:31, Eugen Hristev wrote:
> Add function to register irq info into kmemdump.

What is irq info? Please explain explicitly which information is exposed
and why.

>  
> +void irq_kmemdump_register(void)
> +{
> +	kmemdump_register("irq", (void *)&nr_irqs, sizeof(nr_irqs));
> +}
> +EXPORT_SYMBOL_GPL(irq_kmemdump_register);

Are you going to slap a gazillion of those register a single variable
functions all over the place?

That's a really horrible idea.

The obvious way to deal with that is to annotate the variable:

static unsigned int nr_irqs = NR_IRQS;
KMEMDUMP_VAR(nr_irqs);

Let KMEMDUMP_VAR() store the size and the address of 'nr_irqs' in a
kmemdump specific section and then kmemdump can just walk that section
and dump stuff. No magic register functions and no extra storage
management for static/global variables.

No?

Thanks,

        tglx

