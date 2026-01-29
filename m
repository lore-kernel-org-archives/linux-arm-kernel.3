Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21F9D73E83
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 21:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+w81DyXUE0b55CwrLCwC7XYX50M/2QX/b1Gp0d2KP4=; b=sxlstvy8l+bYIW0ZMmHbzkrWdh
	tZr6cfkoFP7r3jNKHYmsmof4XUoaZk/T2FrVpG2nhu3rEVbHOQQ1VK2ppKXpQIfJLpsPPyBiG7+Zi
	1lKZ7ACp5/eLSbc8hFWNWCfNimZZotw4H6NQAdQ03H6UBbQvSAQ9B9vPStHRFuKKQUHXX7QjoDmQI
	LzYakhCQL+tlcKfKRFP0JA5x+2mnI1bS4ni1fwYTAAAIQiVQr0/TZzlEMnoTwgzGhbm65HlEcSrT1
	t6tZHq+72EduI6lx96zAhA4ONOcTmfzkKG8EeCF2XsV1XEAm3Q3ciHXkJAP1ZMCaEKp59TfKFap6l
	DLaWtcTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZjZ-00000000gcp-2T4K;
	Thu, 29 Jan 2026 21:39:25 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZjW-00000000gcU-44ME
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 21:39:24 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4801bc32725so10946725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 13:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769722761; x=1770327561; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D+w81DyXUE0b55CwrLCwC7XYX50M/2QX/b1Gp0d2KP4=;
        b=pdD1gDAB/wkEbqS9dZkGPsa9aHGVgGQirOo7rW93GUCcLhgmYhOiFpI3BItb+X+3NQ
         +J02V0E993cE+cBw7HpQscNJc6vik3E3zFHHgp6Nqu9g6/zjpoTxYIGq9gyJYWeeEyjl
         n7DcCn9rqXXWiqx6JkffLOle9VBXQfXaTQLu2qI00zJ+dRr46mkjeQzpXXlV4KL6cpAu
         XyBmjk2d5WWpLoMg624y1sye7MK+2AGOyjQulEu4csObgx4FmBF6CnQv8afKSRLgk4IN
         mtahKqwORB73P2i9abNYHyOZDULoHDf6NiFTIHcULUeMWd4/Z+/Aq8gxWwPX+j3Rwyke
         nPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769722761; x=1770327561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+w81DyXUE0b55CwrLCwC7XYX50M/2QX/b1Gp0d2KP4=;
        b=LD+r/TlU9LRJXe5owl0wcqjfUq3+tXxU8hJzuA5wXOVDXPgIETjaP67uZ5/mOi0EXX
         FTftJHtgDgfdgsSMD5p1DQJ9y62anfJd1KpWVwsBs8+71zjyLGJzJKllDLS9VgOZCS6d
         LBwCLqItSveo8FNqWGeEin92jDfM9ILplep/R+OMYE0017lH2Cxok8nZ63OZkxZRoQXx
         Ti11xHXNQE3iYh3F//PBXxiCuin/Da1mQQpCRICTqRsdHqutNKrGaT0ak4v/6+9pBkfl
         mEBrPMdr9bqCiF6nJqLweBgmpGgxs46V/319rudiFYmfn049iivPaVMmj8eXGH/HYs2D
         7XGg==
X-Forwarded-Encrypted: i=1; AJvYcCVB5/e2xLQHjvX1u5mbCjnDbet9xzk/dJk55YpHNou/XKWtgBy73lQpiaDHB7CoMZbQ74l1Pp+pP14tMN1R7b9p@lists.infradead.org
X-Gm-Message-State: AOJu0YxMvtONy1HVYTF9vBw3+oZqq1DseTbzUuJ+xqG2h3TkY+sDak4t
	vY/Vm2EBHnnlaJyEYJ8nI24tbEqMOmMfUPEK2H9jW4GfFC9a7vcGio8YbBybZjZ3AQ==
X-Gm-Gg: AZuq6aLiOVn3a+giQImMHPw/UXtuOl+oaKq8RZUJ7a4XuNi3yNv6j41vOJghs4GaMWU
	9WZ2iiNACQetkqldyPUZxGM3y1YEll+sVFAv+oKiRiVV6ZPf8fLv4PePJgmW+vlfREbBS/Hf8Lu
	v5X/wwWv/gL5+aZ2jm8IzFDroTos+tybq+BHM2GXBLjP2HEYGLLFkCVljZvVU9KQ2Xm+12qOYEA
	evdB9VXiZrIucwVH11Pch5pxxBy+WwcloFmCsNbce94nPU4UObjWvRQDNLNuVToCgDWyB4+zhwH
	oAkvxSfMOx6K3yX8P7qh1xKtbM2JF+E5Irp8+U1jA8voNKU3MaqmyTiA2IMjF0wBzg2HKiZKKL9
	Yink1+E6ZJvi3bjttwZ5i8jf1dg05zEKVECVTTZPMb0qXXG/rXD1+Al3D32mP2zVWGD1+58ABUv
	yHxtviJ1zDwbhcgdDBc0DrJ63GwJQMjpBF43JtFxh1+6Hp3m9cFw==
X-Received: by 2002:a05:6000:40c8:b0:431:104:6dc2 with SMTP id ffacd0b85a97d-435f3a674f5mr1361562f8f.8.1769722760913;
        Thu, 29 Jan 2026 13:39:20 -0800 (PST)
Received: from google.com (44.145.34.34.bc.googleusercontent.com. [34.34.145.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edf62sm18781379f8f.13.2026.01.29.13.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 13:39:20 -0800 (PST)
Date: Thu, 29 Jan 2026 21:39:17 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 05/30] tracing: Introduce trace remotes
Message-ID: <aXvThRcUhuBreMPv@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
 <20260126104419.1649811-6-vdonnefort@google.com>
 <20260128153725.56e801c0@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128153725.56e801c0@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_133923_032787_894FEA3C 
X-CRM114-Status: GOOD (  15.45  )
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

[...]

> > +static ssize_t buffer_size_kb_write(struct file *filp, const char __user *ubuf, size_t cnt,
> > +				    loff_t *ppos)
> > +{
> > +	struct trace_remote *remote = filp->private_data;
> > +	unsigned long val;
> > +	int ret;
> > +
> > +	ret = kstrtoul_from_user(ubuf, cnt, 10, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* KiB to Bytes */
> > +	if (!val || check_shl_overflow(val, 10, &val))
> > +		return -EINVAL;
> > +
> > +	guard(mutex)(&remote->lock);
> > +
> > +	remote->trace_buffer_size = val;
> 
> Should this be allowed to change when it is already loaded?

It would only be effective on the next unload/load. 

But now thinking more about it, this is probably not clear to a user and
returning -EBUSY when loaded might be a better solution?

> 
> -- Steve
> 
> > +
> > +	return cnt;
> > +}
> > +
> > +static int buffer_size_kb_show(struct seq_file *s, void *unused)
> > +{
> > +	struct trace_remote *remote = s->private;
> > +
> > +	seq_printf(s, "%lu (%s)\n", remote->trace_buffer_size >> 10,
> > +		   trace_remote_loaded(remote) ? "loaded" : "unloaded");
> > +
> > +	return 0;
> > +}
> > +DEFINE_SHOW_STORE_ATTRIBUTE(buffer_size_kb);
> > +
> 

