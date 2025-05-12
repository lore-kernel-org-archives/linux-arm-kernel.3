Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03119C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 07:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVmeoRs8wht6ScX85zDxCRxMqcg4xq84fv5EF0eHPpo=; b=rsaEZ+yIn9DRk6dDWoRS46diTu
	jFcjewpVgEV+Quv8LV8p7x3iC9AJMsra0J0AM7Kjw4doZkvXU4ez9p+NzC/fcOK3ztvSKuDtcL2Oe
	ayxK2H6B9gnLCqjgDpc790V0wlHDhiOkKDJB7pdCwH4SpJOsd7Cmg2z5IMRjWcgUlWhMUwvZejqxI
	6TSG+TKEZs7GbU7apYlKS5NvMgqnq31xDjttT7IVIfkrWJFAEvu3EW81sJ9FA+ZBeNqJTjXFKtS+y
	BDDgIQKR1oHOcuT8OlvdJJxtzK+kl4BLryD3O4p9Jbch3q41Cpus1YEMryIFN0rVKIK8gXrDY4hBl
	0MUBCZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEO2g-00000008fvf-3hiU;
	Mon, 12 May 2025 07:57:42 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEO0e-00000008fbi-35eS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 07:55:37 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a0b9303998so2030530f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 00:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747036534; x=1747641334; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JVmeoRs8wht6ScX85zDxCRxMqcg4xq84fv5EF0eHPpo=;
        b=ecybp/143w27fEpzhkzUx/FVoX+jZpI8CcXy/n5+VyjcTE/XC2K9f1y4gpafvtSSN9
         sZlnIva39aOVSUkcwnv/f+Th1tlanZyZ+dq1m7x/03FubxClBZkZpbkY6HF1FbJ8KP3Y
         ICYglWo8DDYAZmTo3ou8Pxv7Py33pJFuUeAYcG+wWBaz897H78hn3f/9dExC9w9fhy25
         eAYwq7lgjJqPRc5oqH+omdd1hJCPj+qLKHsnirSEPeJcX29e1oIzFR3WhWxKE1Fh00A7
         b14waN8pVOb2iNSFHoawbqSZi1hE3taJLVts3WoVSUGwuN5Lhh6pvSAVKUOrCcxK3Sf7
         KSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747036534; x=1747641334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVmeoRs8wht6ScX85zDxCRxMqcg4xq84fv5EF0eHPpo=;
        b=CxghpmAzCewuTmtAqvzqFbdSEd4dQFMLs+ny+0KJMSNoqg3OFwuPS07hFTftKOEDbV
         6jwjFEqrUFRgspg2GbhqwVmemTdT4r2mEjFl0EvBXUVu5hnVSx/7fIfpV22jOnRiJTMF
         4AWp1atGbpSoVdea6ZV4nUjnBJGWleval4QGOgvbhtg5poCX6jORxjkFKtYTb2nbDkvU
         oJH0b1VVNW2qOBa+Lo3zKfv8Pi8+PZMgELleVAi0wUeLCIlXucQRlMSEj7lguPlrhHc1
         OVucpT6DIjG5If4d8m+XTMglfCFw7uhtrwmgN0V5Qnx7AxGH1NuT6QI0kfZ7j+d4ig+Y
         aySA==
X-Forwarded-Encrypted: i=1; AJvYcCVwXGRVl2C2SZcSFDvVt2pLnPi+XTZmm9tXmWvcw0j47oqwfK078w/lcqcDF6HfcIc8D/SwmsVRheOKCopdkTP2@lists.infradead.org
X-Gm-Message-State: AOJu0YyBlMHIbgFFQ2VvFV2WpFpgZ9rtR7eJxFskao4nV9ljfjRc6AI0
	A3J7RHCZ3JZBxcQy66lw9GvWxUjpf8IZkJF/VF/exxCxtALw4PVZ8WHBTANlXQ==
X-Gm-Gg: ASbGncv30tBYQCL6vjrKhtTscrdYMOFZHzqW2okrKx7cvlIGjDxkx5STUIbbyn9rra4
	60tbhtGDLl5hNvKMyG/+adCnzbrE7FMTFhA4xcg0j0PteU1fsnRjHMUX8UsIWIscp5iCOLFITjk
	/jW0oJr+EAUpbJUS0ibqbpj8uuD5ZM1rLLlksXQMUybSYtu3XQH7r94htAKJO4uuwcBw/3vXKqg
	Bq/riKIKLvBHgMMJexHOBHs/l3H0KbnFYaLniEystG+i6pwI3kyll1wM63BuxTBp7dq+sx/QK3Y
	Mv6Q38VlwptR/NzZfrxxzYeJ3eyJjq/gLn/sf7xmf8nH4ZqUxwdvKQEycJ0yFBfVB4sp/l4O9qq
	mCqOLGo1SvZSeJJdWrlJS2Ka//kk=
X-Google-Smtp-Source: AGHT+IHRngy7dyfSblPZg3kx1M0V69ixjtLKeGbM3AJ71FSYb+70+rHci10V2fws5C9DeqNnhr+dvQ==
X-Received: by 2002:adf:e612:0:b0:3a1:f724:eb15 with SMTP id ffacd0b85a97d-3a1f724eb66mr7737749f8f.2.1747036534388;
        Mon, 12 May 2025 00:55:34 -0700 (PDT)
Received: from google.com (218.131.22.34.bc.googleusercontent.com. [34.22.131.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2f65sm11745987f8f.55.2025.05.12.00.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 00:55:34 -0700 (PDT)
Date: Mon, 12 May 2025 08:55:30 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/24] tracing: Add events to trace remotes
Message-ID: <aCGpchGnvyFpWk2y@google.com>
References: <20250506164820.515876-1-vdonnefort@google.com>
 <20250506164820.515876-6-vdonnefort@google.com>
 <20250509154735.530d4a37@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509154735.530d4a37@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_005536_776983_FA98E56F 
X-CRM114-Status: GOOD (  18.75  )
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

On Fri, May 09, 2025 at 03:47:35PM -0400, Steven Rostedt wrote:
> On Tue,  6 May 2025 17:48:01 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > diff --git a/include/linux/trace_remote_event.h b/include/linux/trace_remote_event.h
> > new file mode 100644
> > index 000000000000..621c5dff0664
> > --- /dev/null
> > +++ b/include/linux/trace_remote_event.h
> > @@ -0,0 +1,23 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef _LINUX_TRACE_REMOTE_EVENTS_H
> > +#define _LINUX_TRACE_REMOTE_EVENTS_H
> > +
> > +struct trace_remote;
> > +struct trace_event_fields;
> > +
> > +struct remote_event_hdr {
> > +	unsigned short	id;
> > +};
> > +
> > +#define REMOTE_EVENT_NAME_MAX 29
> 
> 29 is a particularly strange number. It's not even divisible by
> sizeof(short). This will leave a hole in the remote_event structure.
> 
> Should it be "30" to plug up that one byte space between name and "id"?

Ha yes 30 is what it should be!

> 
> -- Steve
> 
> > +struct remote_event {
> > +	char				name[REMOTE_EVENT_NAME_MAX];
> > +	unsigned short			id;
> > +	bool				enabled;
> > +	struct trace_remote		*remote;
> > +	struct trace_event_fields	*fields;
> > +	char				*print_fmt;
> > +	void				(*print)(void *evt, struct trace_seq *seq);
> > +};

