Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB3DCAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+NppKLzVrIsIoSaivdIxFGudWC05VGLRO9K0C3DxKA=; b=xyCeoojjbwTk2Ywvnf40RqSlVW
	xDMHLRmv5xkHx5mzm8hSlkU7FeaQ7vIJgXgFU1xYtHcb5rsFDeeTS06a3hs3HcY41cTXVpJcwERPY
	0XRSBt97Qq2e6dp7jkFJ+0BwlpOWJUgk4/ZdaALZCaWXC5i1/adR9Et8F0y1lVwYVrGNzwPlXAhZb
	/0j4cBULGShnoLQPT/AXYHzHc+lJsg0VwBVsacHubhfYFcr1QFCj/uoZHyQU8cvs9zYYJu9c1tm1v
	wZaWauZdetU3swnmIHgRcxMxmVGmmdw53du7E/dR19WRtUga3d5nmRtgZCbAmdyBpoJYObV1qHNQ0
	R+nMC22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26I-000000094R6-3RQk;
	Tue, 09 Sep 2025 17:25:50 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0vG-00000008RIz-3QR6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:10:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45de60d39b7so16927075e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 09:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757434221; x=1758039021; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J+NppKLzVrIsIoSaivdIxFGudWC05VGLRO9K0C3DxKA=;
        b=Xh1sQbrvTnPi+F9oI2XQ/FjJdMhEsDT5LBSIFuG/sd4knihQihUYBXVn3eyDNhi6+q
         O3WF9CNBCanFcWhf/aOAHl3LBYDO4KTy3JQnM8ZYuaAxeLWTXR2+WcvYcumcd+ul2Odu
         xLfRFPqUulxrNPa8KJnn5dZMCfH1fJKLJuopgOlTwgevNCcFIPGFfKLc6q6np4EMH+eT
         shYnU2ddO6URXKvCUNNPRtCzdSs9MqX5MtZwgm3T2xnUFdJG0edx3HJZpeViUSEWdRt7
         ZEf8Y/ccqRk30cAt2OkUGdDli0zNVd9t2mhKNZhYjkqtaKeb/v+q5Qof6WGXnXv2yrIS
         zIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757434221; x=1758039021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+NppKLzVrIsIoSaivdIxFGudWC05VGLRO9K0C3DxKA=;
        b=ByzduwxATWiunF5rPGXmeSCvCQi9VQak+g8RI8BUNDLURXl+raF3qigWQTmKCubxWE
         ruT06wjjT1023yTsi2V+tsoztZgxAS6NzsEESqc7bQg4ple7i8wm0YG+Z8q3uQ2gEm/7
         BFW2pPkeqjp2rEz3LyHUstDCc9on+Vf7G+W4+pRym3rDgRUiarX/27GZNWJmYEfv1VQd
         zWUIwtL3ZNEWOZ0SDRPGOweTPAai5Jv8zZRwzK+XvAbnPWrcqc9yxRyBlNJxZGWewvCE
         epHCiB4YT9N/3GOtUucyMgfU5tE0jB8tK+TME+sjKO02G7f2NW77tmz/3OO4OowBjTq0
         wphw==
X-Forwarded-Encrypted: i=1; AJvYcCXL3unPxxU/cJO0z/dbz4uO5yFYSA056+PCHC3nan9NasdXenU+FuLvn1qls+8Kgn26qtRid0W6TSW1S6sr6hvc@lists.infradead.org
X-Gm-Message-State: AOJu0YzJqjUaVmLcE8IQ9szbBmP2pOlyMAUse8W2ty+6KfL1n4Atv/qV
	TfH8lxHZRarUHq4ugpr96pw7NvCMlZtneisaQWjZU6rkQAJSqiFDTmlen7U4nwTTFg==
X-Gm-Gg: ASbGncvWuQfccwiqOApKJQv9o7uH/zAYW61xP29nrEn8gwrrMzzPc76/69FJGJj17Xw
	Ur5ylzmxnGcceygiz2EdPeosI9mEM1lQ4rWnPVrMBez5zkUIXWCbQU4Tfc3VWZH5KnRRsWkUEbP
	WZ330/e8U4Up2jgNHrDXhIx12Vl2XA6Zti4DQmh/11puW/FjC3H11kb444bk3FWXLq1aVHvk0fj
	xac/tGBUXPQzBh9cEpUuga25zXaHtNWo4UnoGPMAuZMjMGhi4KHB8m0Q6JJnjVPA+LJgubOunla
	QJPjuHSkXflCZvOAd8ujD1OHfysOvwQv9glViZTD50WkYVKK1V92hDwt2kgnYAQuCeTm5zcnRwb
	erF+4dNgqfH84wPHqV+ES8KFGg6gz0AC3zpNhKuRyraMe1riujUtH7K7wGqN4fGdey2mqnKnDD2
	c5q+FN
X-Google-Smtp-Source: AGHT+IEcQIe0OC8lSfD+aiR6eeprIeDl6s8EC4O8tczqPnzu992yeZRmguAnbDmw2y0KnALeXMKgPg==
X-Received: by 2002:a05:6000:1449:b0:3e4:ea11:f7df with SMTP id ffacd0b85a97d-3e64392b8c4mr12530932f8f.40.1757434220628;
        Tue, 09 Sep 2025 09:10:20 -0700 (PDT)
Received: from google.com (211.29.195.35.bc.googleusercontent.com. [35.195.29.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e752238910sm3069080f8f.41.2025.09.09.09.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 09:10:19 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:10:16 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/24] tracing: Introduce trace remotes
Message-ID: <aMBRaPzjR4OJVIWn@google.com>
References: <20250821081412.1008261-1-vdonnefort@google.com>
 <20250821081412.1008261-4-vdonnefort@google.com>
 <20250908193606.47143d09@gandalf.local.home>
 <aMAYvA9LSvfxvt_C@google.com>
 <20250909093848.402674b7@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909093848.402674b7@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_091022_872029_F50E6E63 
X-CRM114-Status: GOOD (  23.62  )
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

On Tue, Sep 09, 2025 at 09:38:48AM -0400, Steven Rostedt wrote:
> On Tue, 9 Sep 2025 13:08:28 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > > > +		rb_desc = __next_ring_buffer_desc(rb_desc);  
> > > 
> > > Is there no check to make sure that the cpu mask matches what the rb_desc
> > > will have?  
> > 
> > The function is filling rb_desc[], based on the cpumask input, so both will
> > match when returning from this function.
> > It is then easy to handle the case where some CPUs are not part of the cpumask.
> > See remote_test_load() where for_each_ring_buffer_desc() iterates over all the
> > CPUs from the trace_desc but uses rb_desc->cpu.
> > 
> > Is it what you meant?
> 
> I'm more worried about the allocation not being big enough for the rb_desc
> being filled. I just noticed that the trace_remote_register() function is
> missing a kerneldoc header. Please add one and specify what the parameters
> are for as well as their requirements.
> 
> It's fine to state that the allocation of desc must match what the cpumask
> is. But the lack of comments about what the function does and what is
> expected of the parameters makes it hard to know if it is performing
> properly.

Ok, will do!

I could also add a desc_size parameter to make sure we won't overflow the given
desc?

> 
> -- Steve

