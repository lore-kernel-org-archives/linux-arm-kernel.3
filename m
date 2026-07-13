Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27772C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IORCMjoCzaHOJmqaTllBN0mOSKfFshqyOTA44CSojUk=; b=zFIyc6uIonB1XSemHFjzqdqaAX
	wtGVMCFaOug43FJFDy3WGydJsffNqDHu+yQlmZgeirPrZEcdmoY2yJwkgukZOVDa4Va9wmH6+LVlf
	nTpLHrx+jWkJQWp+3XmGucNelQGY7fn3voucPQCdgvhOq7rG0yWaWrRzru/pvRYp/WnrpNoSIsNfX
	z88i+op4G2YZBj6YMdT6Wc0TfR1ph67OhiBn5wzNwWRvqozxbXcMIdUIhi4pxn5xkf0RQUafOBNcw
	mVNzSysaggB9yFoHEyF2x+HaIcDg3T2jiLC5Yp9fBZ1cVdOTZtvBTMrBGWyEKGJt4dI+0lnyxWVFY
	J0wtwgTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjC7e-00000008bLj-1ZjY;
	Mon, 13 Jul 2026 08:34:42 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjC7b-00000008bL9-23ZC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:34:40 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so2646853f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 01:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783931678; x=1784536478; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IORCMjoCzaHOJmqaTllBN0mOSKfFshqyOTA44CSojUk=;
        b=WWWgBlZ6m9WMLMRsXx+6vltNesOQD62nm7LRn/UIjC3p0tC3rUa/1PLOWpQbJXjC+a
         TWFdVrMusMUkvPOYvCSXKhqOo7tH0KVeztEpee6vlzL3ND3Ia7l8mt/i8lEA90k8rO5D
         bSobtZu33udP8tOYCylapayI0lc7gMrajwEfO2P0Kgiy+Bv5nyVGLwGpHtr2yBpTjZjK
         W24W8a8Aui2nlcyXI2qIi7GKCvXvmD/0c/5EVzI55fXuoCOg2kB0P03vUHY2tuqSl5Us
         gOnAOhQJQ4ieWT7AS3R7014F39lwY1ZiOgeUdckFj0yjb7j48OQw/BDB8jaK2dxz3AK4
         cBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931678; x=1784536478;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IORCMjoCzaHOJmqaTllBN0mOSKfFshqyOTA44CSojUk=;
        b=TEgGYcJ1cd1DWAkoooqZeSUESr9WmPJWxND86KFkUV9oH+05hvVJj9TPUKU9arcby1
         VpPS/uSYww8EI7XgU4Iz+bOsNbWtf4iAL0MVdyKrk2fJrWvZGL4JrTNwKOBD/dwdWGkR
         ovOLHYX7CUvymLB2MBlyLmueEMGBTI2Kn2t1tdvqTmbwBrG+ovF84bsRMWMOZvGGPw58
         NQqXlv/n8ajBqpWONp715qQ/vcKCX4psdW0CNVzIM0OiT40Yxrls3/95AUeG1+eARis6
         896j5sQ86zYqk8Z4ktlzFvx5PUaDWDii0dh3ztUczvi5Ii8202fhw7pxUeEXjvMTu5wu
         BvHA==
X-Forwarded-Encrypted: i=1; AHgh+RqWZkBMseR59De5nFFhdP+lk/8A6YVsCjgKRsdigCypl1f8qfrttTBqsYQ4RipThfnPsbYbLLBKOUhiWAk+MtgM@lists.infradead.org
X-Gm-Message-State: AOJu0YzR8zRlQaxS4J794/zDOTbg4gXqwQ5yBKqRlojwaiIEBSRC1XzG
	w9eiL6c+qyKUKJam/dqZmhId8CeZiHDuS2U2dGygZNkbCwXWYFWrF14vDSjGkcBHzKXFSLvkfbz
	fIQ6lJg==
X-Gm-Gg: AfdE7cmY4D+HPRApgJwjOyqQ1vBljSCxS7mrMEVnP0miiXY6VkjGWlS8AoNxfiduEFF
	2/pkYJBQmWs//6QmOVx+WRToTszLb3bXG5FZh3zfhq/kHpFjf64b6GMzOTAjO/3WcXoIofxmwJs
	m/5g6fgNos1NNtJzzx48DvCA4Sa3t4HXUhAm07MaSZsoa+TgHA9ZtW3Lq24t1g7jk6D8Ywam5kx
	SGMaozj6Nndhk0nyL3G0/OwY9jOMbnAOvmdxqPlQmxO7phEmugT03eJB3/12BnBzTLivA9V6/m9
	iFsP76Km6Pl/0DANtycI6xq/HXoBnvTa7VwEURoL7DQIRvhfnKqFb9g58M4JyhYBkJVp/mjvT2x
	TkCkOKAjh8xYD//AR1bw39L658PkcOneJeGYaiuybr7c90bdgjPy445yk4SuPH7t/z6f7K7ewds
	sue+CzyH96zsptKhYSVSXV4wS6PpQXrzhcDO++Hdf5oRF0Yg+ks94=
X-Received: by 2002:a05:6000:2907:b0:470:2fb1:3dbc with SMTP id ffacd0b85a97d-47f2dce7c3emr9513923f8f.35.1783931677010;
        Mon, 13 Jul 2026 01:34:37 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm83093111f8f.20.2026.07.13.01.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:34:36 -0700 (PDT)
Date: Mon, 13 Jul 2026 09:34:32 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH] KVM: arm64: Avoid naming collision in tracing
Message-ID: <alSjGAqmB7HX1jYB@google.com>
References: <20260712153835.2264905-1-smostafa@google.com>
 <CA+EHjTxN1fcBVRi+yK18UgReGsX8Evu1GsijSQC61dY3XrjCtw@mail.gmail.com>
 <alPox2BDk4Il0s9t@google.com>
 <CA+EHjTzvzcV8Cxw+VHK9Fxv7Y-7m84XbzUFU+4sXZXNrM8y7dw@mail.gmail.com>
 <alSdr9wNyyPiHmbt@google.com>
 <alShO27MLsNqgBws@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alShO27MLsNqgBws@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_013439_554928_CB824348 
X-CRM114-Status: GOOD (  32.15  )
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

On Mon, Jul 13, 2026 at 08:26:35AM +0000, Mostafa Saleh wrote:
> On Mon, Jul 13, 2026 at 09:11:27AM +0100, Vincent Donnefort wrote:
> > [...]
> > 
> > > >
> > > > > > I did not add Fixes tag as this is currently dormant and not breaking
> > > > > > anything.
> > > > > > ---
> > > > > >  arch/arm64/kvm/hyp/include/nvhe/clock.h | 8 ++++----
> > > > > >  arch/arm64/kvm/hyp/nvhe/clock.c         | 4 ++--
> > > > > >  arch/arm64/kvm/hyp/nvhe/trace.c         | 4 ++--
> > > > > >  3 files changed, 8 insertions(+), 8 deletions(-)
> > > > > >
> > > > > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > > > > > index 9f429f5c0664..c2ccd0e8bf22 100644
> > > > > > --- a/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > > > > > +++ b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > > > > > @@ -6,11 +6,11 @@
> > > > > >  #include <asm/kvm_hyp.h>
> > > > > >
> > > > > >  #ifdef CONFIG_NVHE_EL2_TRACING
> > > > > > -void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> > > > > > -u64 trace_clock(void);
> > > > > > +void hyp_trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> > > > > > +u64 hyp_trace_clock(void);
> > > > >
> > > > > hyp_trace_clock overlaps the host side: arch/arm64/kvm/hyp_trace.c
> > > > > already has a struct hyp_trace_clock and static helpers
> > > > > hyp_trace_clock_enable() / hyp_trace_clock_show() for the debugfs view
> > > > > of the same clock. No actual collision, so this is only a readability
> > > > > point, but a reader grepping hyp_trace_clock now gets two unrelated
> > > > > things. Maybe you'd want to consider a different name, but naming is
> > > > > hard :)
> > 
> > If we were to rename: the clock is a "hyp_clock" so probably trace_hyp_clock()
> > is the right thing here.
> > 
> > while the "hyp_trace_" is the prefix for hyp_trace.c file content.
> > 
> > Although I would like to see why we pull trace_clock() from the kernel into EL2.
> > That bit sounds wrong and if we have a way around perhaps that's better?
> 
> Most include path look like this:
> In file included from ./include/linux/ftrace.h:11,
>                  from ./include/linux/kprobes.h:28,
>                  from ./include/linux/kgdb.h:17,
>                  from ./arch/arm64/include/asm/cacheflush.h:11,
>                  from ./include/linux/cacheflush.h:5,
>                  from ./include/linux/highmem.h:8,
>                  from ./include/linux/bvec.h:10,
>                  from ./include/linux/blk_types.h:10,
>                  from ./include/linux/writeback.h:13,
>                  from ./include/linux/memcontrol.h:23,
>                  from ./include/linux/resume_user_mode.h:8,
>                  from ./include/linux/entry-virt.h:6,
>                  from ./include/linux/kvm_host.h:5,
> 
> Although, some files have ./arch/arm64/include/asm/cacheflush.h
> directly.

Ha sad, no way around that... 

So about trace_hyp_clock() / trace_hyp_clock_update() ?

> 
> Thanks,
> Mostafa
> 
> > 
> > > >
> > > > Yes, that shouldn't be a problem,  I just added hyp_ prefix, but I
> > > > am ok with any suggestions!
> > > 
> > > Didn't I say naming is hard? :) How about, el2_? Not really happy with
> > > that either tbh... but can't think of a better one...
> > > 
> > > /fuad
> > > 
> > > >
> > > > Thanks,
> > > > Mostafa
> > > >
> > > > >
> > > > > Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> > > > > Tested-by: Fuad Tabba < fuad.tabba@linux.dev>
> > > > >
> > > > > Test: builds fine with the different config enables.
> > > > >
> > > > > Cheers,
> > > > > /fuad

