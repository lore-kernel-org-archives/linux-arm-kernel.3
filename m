Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25D8C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 09:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6UyUXCpgr0WUFmw2sPhx8dNtCUTskL7HDMmKzVGhcM=; b=NVMFHMz//dIQvVOkO5yQ37mZsV
	fHXZ/riTfCz2mIS8v/1P4QbbjV1I6S0PKymdxowGqBtNm+KAD05OT2YPjuBdVuNNXTEy5ZVrXlaq6
	z5vZt7GCXZHB5GdqH622sjZwRg26uT2hYlc14FJD5Okn8iIhjyGCiWX3cVPy/JksR5Y0v33PwoChW
	fcxQy/d+QJEah6tVFZOnPA1PAnxSX+7MHqWHIhUxSekIn4uFALnsLx4zpsR1lpyE1xuz8jjeLI/J+
	F3Nwc7Ljuxdqd+IQnmbKMeiqY6SN2HDlbP5aNgoUEg5BfDQogGGlg+atbJS639Gtn5dfV+4+RSBEA
	MCHpbVWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxaC-00000000GSr-2rTg;
	Thu, 08 May 2025 09:30:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxHC-00000000DNz-3FKK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 09:10:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so8271455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 02:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746695444; x=1747300244; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l6UyUXCpgr0WUFmw2sPhx8dNtCUTskL7HDMmKzVGhcM=;
        b=Q6RBDhCaasjB5zM8UJmxK9qcilmZsrju8TwcqXyFDJFs2LacXWAs9dLG0Tg0lLuAId
         sdyNUC3473ck8jvR5+lfd364JBgJqKjllN7cu6b8erMPbNr5L4dnU/Uy6QgAOlC1jqR+
         nskJGgRh9QWBwwpMOKQCKAvX5qdiJfQr/OPzr+IRd0/OUx0WEQr/EWhR+B7BrnDxymeE
         qeTXjP8gnzwEG6QfzYWFhQ4ZOR2DDnDfWuIbd3ANp2j4dYLCjnrqafDJk+OujAV+C3an
         2vkF4Vi2ra7yO/Gfj3P69VjyY2WN/4nTJYHXGL6mKDYYnOd018c8zuX0GJxnrTv8uJDS
         mXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746695444; x=1747300244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6UyUXCpgr0WUFmw2sPhx8dNtCUTskL7HDMmKzVGhcM=;
        b=qj0uf2qt0FPYz1UZg2hrfhmLgmZAHsVbBgpAwwe3eabscr0T7PvDvUqKhdANsLOow+
         i0UP4cC24z81lR1VozGHeI/FTIqEjIpIkmXGXKskze/Mka6CX63kdo5CIZYrci0ZTLpw
         9rh3Uvvw38Bjr/5DXww4Eqps2P7YSonE7w8gTh9jAOLZrZVYHp1TqrbGnV+Dk6rBoksB
         diMHpcprm/FQ0eZQ26sP1RStrxNMIdWjlI4/NKWbBZ3vD0KOD2mwAeItW1HhcmE2OIvY
         cU/BJvKL9uR45kgaHXaiQi0AAkKoSWFM8e1sbxNDNmAY0UL1GFoXBrbliuWABt6P+R2C
         uyLg==
X-Forwarded-Encrypted: i=1; AJvYcCXid/LKWsEt+EAIBX3lJTJnAHINq4rGP+CIkmVPdAZnXAL5JQBAjAEZssQ+1VSkJ7fBdNQtJAgNi0AyIQ5wKMLg@lists.infradead.org
X-Gm-Message-State: AOJu0YwcIY2Lt8hcR3xQj1eTw2i0Ryd+mV+Ht2+p8r8qPUhmJrNNuOvB
	VgYxP2BS367rboSf8311l9b+h9h0PDXRoEGynLhu6L7BBmS/O2tBAE/ohzWGqw==
X-Gm-Gg: ASbGnct1SjKKUK6Qvf3x2b43yij7gtmH9uf45KmiXj4wQIXZ5Q40fjaNbWbdtIrmI/O
	VT+Q7C9sXDJJrqD5dv/37omLuXbfXmUlBNR4CisIRZocMH1RaRyLuNhbVgQPpE+VK3N6t6/zeeF
	9B/mSb0Cb20y4kcbPiseJJMcLb6ShQBl698snPv2qEyRVyF1FRlg0g1HrUc4fZs8FlxtUuE2aus
	TMshtS8oxLsvtMfEqvcBDJP3swm5kdkuqbEuyELs7tqBiu1p+uBb4VwiBu7A32XN45wVKt0VX/N
	Vhft5lldzeFZ5s4CjnvG20HiI9zZdghqNode0kuCJiVzvzhlvFZwiu8MuMLULU9FINtBArJbHEA
	MPHIm+yRbuNcxr1jA
X-Google-Smtp-Source: AGHT+IFE0UJOTPADB0ayGWYTFGEaXRl7J0a4Js+PxgbBt0NVKKxXiHCD9XRls03Gxp9z/i+BfiucLQ==
X-Received: by 2002:a05:600c:cca:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-442d02e284emr25519055e9.4.1746695444305;
        Thu, 08 May 2025 02:10:44 -0700 (PDT)
Received: from google.com (24.204.140.34.bc.googleusercontent.com. [34.140.204.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3af15bsm30152975e9.30.2025.05.08.02.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:10:43 -0700 (PDT)
Date: Thu, 8 May 2025 10:10:40 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/24] ring-buffer: Introduce ring-buffer remotes
Message-ID: <aBx1EBa6QFH7dmqs@google.com>
References: <20250506164820.515876-1-vdonnefort@google.com>
 <20250506164820.515876-2-vdonnefort@google.com>
 <20250507194722.263a8d1e@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507194722.263a8d1e@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_021046_813137_E889A2B1 
X-CRM114-Status: GOOD (  15.88  )
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

On Wed, May 07, 2025 at 07:47:22PM -0400, Steven Rostedt wrote:
> On Tue,  6 May 2025 17:47:57 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> 
> > diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
> > index 56e27263acf8..c0c7f8a0dcb3 100644
> > --- a/include/linux/ring_buffer.h
> > +++ b/include/linux/ring_buffer.h
> > @@ -248,4 +248,67 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
> >  		    struct vm_area_struct *vma);
> >  int ring_buffer_unmap(struct trace_buffer *buffer, int cpu);
> >  int ring_buffer_map_get_reader(struct trace_buffer *buffer, int cpu);
> > +
> > +#define meta_pages_lost(__meta) \
> > +	((__meta)->Reserved1)
> > +#define meta_pages_touched(__meta) \
> > +	((__meta)->Reserved2)
> 
> Hmm, I wonder if this would be worth adding to the user interface?

Would trace-cmd have any use for those fields? That said, even if it does not at
the moment, it would mean the meta-page has a single version between
kern/user-space and hyp/kern which is probably better?

I can add an additional patch in this series to extend the meta-page.

[...]

