Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D947D73E87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 21:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+SMixISY32I4TNkZ6inO6uSY2SNlSvt1Krp91cY5JE=; b=vUiuK0JfBolhsMYfm1fBwgRTpj
	i7s5tV1jCLdd01NLav0XOsduqFi2W3EllU4LFlDp4owHLlBzFDSNlYdr9sV0cLxlgeNn67xFBtr8I
	2XA4d3Zs7ijRgujXWYeJSOWDkjy4myBcVFguLDOTAKp0RgHCRyIJ1yr4eUhitKJncuO3XDn2AyMml
	A1tG/5J7NjtGDUqVb+zu0RnDWFKj3c5m+X5KVhazU68i4B9laG148+Q/BVi3+uUitb7ReTyWDXVMa
	2OUoenYWLwRz1eFChKzVIOfCHXnVbq9DWwlq3sXSCDqj+XI2I6QkBb59Y14KgKWjLADkTs/pi+t+b
	Nqo6yfbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZuC-00000000hbk-0CTx;
	Thu, 29 Jan 2026 21:50:24 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZu9-00000000hbP-324N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 21:50:22 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-432d28870ddso927909f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 13:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769723419; x=1770328219; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c+SMixISY32I4TNkZ6inO6uSY2SNlSvt1Krp91cY5JE=;
        b=FKgoA5uphl7oa+KG2sFauvhXhlt6yGJuRwPMQkfVG5xq5FmBWKqRMONcKE7efIkhZ8
         m+P1M1TXpC0psrUIAT1jfH7olKWt1qXQP47M2vznrV4OndTjUSpCFBmfhZrBZS6J1vXJ
         mOf3b/thU02Fj5HgL1ZcRRFl2YH2lAcvmLaVcQDO2nAfYREHyq0vgTj1TmygTc0ILgvX
         VUPbutKdZa2R8jnhD3bjhv9rkyA522mPeP5tCD+e1/GD4hHdhS7xeQmzFZ11AHgDW4Ig
         RaiZ2MmD3KHtYmW+/s5ti/4hQF8MVIEU/POTiFCTWO44zuZ8LniBIL66Pv4QCg26AL1c
         y3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769723419; x=1770328219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c+SMixISY32I4TNkZ6inO6uSY2SNlSvt1Krp91cY5JE=;
        b=SFEnjOFM+qXS+EwC4f5HnVK7Yjx0h9zmDe1wwaR8zrNCqXqOP+Jkw52Dcny3oNUD1P
         xcYI2+BPGHyIM3rC4qWJnxEZ/3GhJVuGESrz1fROmgIkFbr6fnxgy6FzRNcdY/ummaoO
         EpBXaXXJHVTk5QBB7rTdcVqaoKf4hBqvqBnPn2f8kZ6NslvjP1r4Ybq5K0N+VW90B7F0
         QTVH62x4wwJSG+24fqoJS9s9SgF+15U1rs0jTjkFrnk93TyLE+Q2wPfRZCD/Btgq2Wgi
         Wgz/QqjmH325kBOsQG64/ZNwHcbT2iRaRJO3ce5I+IjydY2XCGRDmlJCoykJ4DUCa65F
         tt7g==
X-Forwarded-Encrypted: i=1; AJvYcCV+TY8f75ogtJPPJvLcrLuitMtNty8j3tK/3AlVl45+m0prVw4UHzdqeJ6b1TRNxqvCa+LKB8QgTiry/qpAIYZo@lists.infradead.org
X-Gm-Message-State: AOJu0YyhTKu1tLqvHCz86Zf6YV61X3682HiDHeHtfR2YgyahzDUttsGG
	/7IDBBzmMEgZ3dT6CnF7nsbEw2NKHrB2IeDj1Od5gV0dOk8eTEDxS13WTTiP6D5d1A==
X-Gm-Gg: AZuq6aKG7l5OJdvT3wz0kAIPS/bj6eL54Lsv9QuhSucFsfzoqm6uT/6TT3kuA2da3KS
	0cnxMyWLjLMv79Hsl4yLWQ5pI4tjUsUxgloOcGOUgKr91p1NkNNkjFm0SgcGjBXnW0/fcxp6lqh
	H4eyHFpmnQBrbSp4L9EtfJvqwv0yllrGunkMlgasruQL5GWZA4ty7+BCzVe3khVtDF06vs4GFsU
	7GsM8AXGFnXNkF8Gey1NM6+/O0UHqxo9FCxdX/7bA6cQCKcaB2YI3hrIf/zug355ze1be8W3yaz
	GcwnHYkuM13JLL69IxdMiA/0X7GWw9WTgLp4yqrSQ17qaY3P514PCzdMf93Bc0OUdk8if9ZkVrZ
	NsQY/5dLlTRTh1o7vlnipHN14eftnK4Belndj06NJDLjPd6Xip49kCk7BYC2NT/PORpYg57c5wX
	QGjKpvYuUkLCTKFiwl+6OUhH/vcioWullwA9BYRAN5uWfBbh4vzQ==
X-Received: by 2002:a05:6000:26ca:b0:435:e3c6:554d with SMTP id ffacd0b85a97d-435f3abb4e6mr1226168f8f.52.1769723419386;
        Thu, 29 Jan 2026 13:50:19 -0800 (PST)
Received: from google.com (44.145.34.34.bc.googleusercontent.com. [34.34.145.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1322f40sm16938883f8f.34.2026.01.29.13.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 13:50:19 -0800 (PST)
Date: Thu, 29 Jan 2026 21:50:16 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 14/30] tracing: Add a trace remote module for testing
Message-ID: <aXvWGDEx6kMQWyoe@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
 <20260126104419.1649811-15-vdonnefort@google.com>
 <20260129113452.190d4d79@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129113452.190d4d79@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_135021_781864_4F19EC6D 
X-CRM114-Status: GOOD (  13.44  )
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

> 
> Where was the cpus_read lock taken?

I am pretty sure that's leftover of when I was reading some CPU mask :-(

> 
> > +	cpus_read_unlock();
> > +
> > +	return ERR_PTR(ret);
> > +}
> > +

[...]

> > +static ssize_t
> > +write_event_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t *pos)
> > +{
> > +	struct remote_event_format_selftest *evt_test;
> > +	struct simple_rb_per_cpu *cpu_buffer;
> > +	unsigned long val;
> > +	int ret;
> > +
> > +	ret = kstrtoul_from_user(ubuf, cnt, 10, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	guard(mutex)(&simple_rbs_lock);
> > +
> > +	if (!remote_event_selftest.enabled)
> > +		return -ENODEV;
> > +
> 
> You want a guard(preempt)(); here...
> 
> > +	cpu_buffer = *this_cpu_ptr(&simple_rbs);
> 
> Otherwise this triggers:
> 
>  BUG: using smp_processor_id() in preemptible [00000000] code: bash/1096
>  caller is write_event_write+0xe0/0x230 [remote_test]
> 
> -- Steve

Ha, of course! And also for a per-CPU ring-buffer, that is way better to make
sure we actually do all the writing from the same CPU even though in that case
the simple_rbs_lock protect us.

> 
> > +	if (!cpu_buffer)
> > +		return -ENODEV;
> > +
> > +	evt_test = simple_ring_buffer_reserve(cpu_buffer,
> > +					      sizeof(struct remote_event_format_selftest),
> > +					      trace_clock_global());
> > +	if (!evt_test)
> > +		return -ENODEV;
> > +
> > +	evt_test->hdr.id = REMOTE_TEST_EVENT_ID;
> > +	evt_test->id = val;
> > +
> > +	simple_ring_buffer_commit(cpu_buffer);
> > +
> > +	return cnt;
> > +}
> > +

