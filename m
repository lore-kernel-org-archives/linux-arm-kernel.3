Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F311EC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 09:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtD1t5SqwVfSCPyTjNxq3c+2H14P2VPj1wlw+YRYZjE=; b=FWgDThqSTx4VPeVtnAS9A8zYN8
	TdTFxBQ22OsdXI+AE6TPERLjA0uNHkPDicpJdiLBDL5XP3Xi2LMbVDi/PTF4GImSd7ZwUXPjW6sJO
	jDTMEbrfbpfLkh4Ffo5XdBI/M8HjlSPQxMzX8yLQDdOYMPoht+BrQu+Z1D6oQL0flS3KW3RBQAjNm
	UJW8/gnrLRNmD8LGlDSgyHuYXJ8vaGSdPhHlK6KXigl40YGSTSkOac+tmJhq/mmOnsHNpeHDZTTlL
	rGR2vXj8K22OHCszGdu9gwDtQbxihZjhHVNVMnmW2/vaLRYKskyo40c4l8wcKlB0Zkc1rKNdrB9Pt
	s9plV8EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxht-00000000HJW-3MSM;
	Thu, 08 May 2025 09:38:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxKi-00000000DwW-0SvZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 09:14:25 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso4773255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 02:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746695662; x=1747300462; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jtD1t5SqwVfSCPyTjNxq3c+2H14P2VPj1wlw+YRYZjE=;
        b=HECeDQanhgD/mkvgaMwgRUt3r9pHUZTcVJK6faOTJxUa4ndfj8pyiUr4fHZDfrDiDy
         u7W82C3jbNLckjGhqe1/E/xbxgwKnK8hSqkzm/E1hSvITotVYk18RPii+3Co5eyzk/dM
         Eyn6Iuzh+fx5cvXwKgY8igZaBJRGkw8AlHL5Ui2/QKJM2xTYBXvAKgm6ILuYCAuQb1ei
         NiHPeu2rVxyS5NRx/DGOBZAw1h3fW7sRKJzDtOOXJ9RhXbryuZGKKAhtFpApH5QWCPCW
         c+T4oxOto3vQbYyHlCCmPXf2jukBPQ1tYbePAi8IDCXTuoiir/DdIVREyaDoqTkr5kzn
         wo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746695662; x=1747300462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtD1t5SqwVfSCPyTjNxq3c+2H14P2VPj1wlw+YRYZjE=;
        b=cPV6o7Cy8+cJnAXJ3002avdcUpRJahZc+I6DuFdg/EVWk+sO4117zga+GU08YFRJpa
         oY5OZS6tvSb+VlaWCOBFfN1VY7s5plQKet+lGVfoMzrdb+O/kGpLVJVS/oZNnUMnje5K
         Zrx3iHf32kmbHfzFH8hrV3fegGpUb/6jkLBYj4txnP8DBcPC0iZeudbLaoV+3NjywGoq
         O3g04SMVLYx2AtjmBEcB58IaSeyPjfHS5n8LTtuKaeDyF3blfX+u1xBD+EzF1AWbZVy4
         XGCC2/WCU4TlmUTCM+A8bdLYbxO0XQdMXT1JFf0kEEpYgr1EAVwcmGUcOaQzjdjZQo8O
         CgNw==
X-Forwarded-Encrypted: i=1; AJvYcCWQBJQsmg1rRylY5Iz7Z0aLb5eDoD1CwhC3hPrTeFFDUtWf/nDhkRnPLazH5OCejtuEJFeEc+OPiIAO8PEXcvs9@lists.infradead.org
X-Gm-Message-State: AOJu0YyuLsB3LHoFgHJw/7SJ+Ga60IH8bUg1pb4t4/6f0VwXJLBZ2lj7
	9ZbazLFkgxBjzvKUosMjjM5Mc2xC/UF2mZ7Or9izVoxjYpo4xs0SWQhX9x83hQ==
X-Gm-Gg: ASbGnct3mFbhkdzdOxrqv2AHVta+2xieSIJQjvwp9U5mw0qL1+oYzK4aFjQognCGO9e
	uNfUum5JZAswdR7Vzx9Xmc1p+tEm4XiSKViwWOhcHzjZlOWODigiI/G3mOSD+HmtL3CUHbdBosE
	OvDP0Oxt+mEwlgd73cB1BvHdubnvp7hIun2VKCPt4cvqOFKGoTcz3l8GllldYSXBvnnq8MPUe/H
	hZnvuwv6AF1im66HOfttLqUd0kbmfWlRndUH3RywRZF+BZ//lZmMP/FWzvzO4Wg/0L5n8haKKiw
	Yos0BnsZWaq+FIRVlB+mNbaGP2CmMzRYdjlk4HmqPsKr5dQ4Nu4eUKaifsFbbdQuKnf1Qr/sGva
	mgX8E6A==
X-Google-Smtp-Source: AGHT+IF9SUYOnKs3lJu1vUeKHxmfYUfp4eeX4TzwT3TxRpgJ2RHbyMATX+EQtKICG97KoSCFK8KYGg==
X-Received: by 2002:a05:600c:3e84:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-441d44dd23dmr51647125e9.22.1746695662495;
        Thu, 08 May 2025 02:14:22 -0700 (PDT)
Received: from google.com (24.204.140.34.bc.googleusercontent.com. [34.140.204.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd333326sm29694785e9.16.2025.05.08.02.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:14:22 -0700 (PDT)
Date: Thu, 8 May 2025 10:14:18 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/24] tracing: Introduce trace remotes
Message-ID: <aBx16qth045MwQJV@google.com>
References: <20250506164820.515876-1-vdonnefort@google.com>
 <20250506164820.515876-3-vdonnefort@google.com>
 <20250507202444.43963c84@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507202444.43963c84@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_021424_146055_CDDABBBE 
X-CRM114-Status: GOOD (  12.11  )
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
> > +		remote->cbs->unload_trace_buffer(remote->trace_buffer_desc, remote->priv);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void trace_remote_unload(struct trace_remote *remote)
> > +{
> > +	lockdep_assert_held(&remote->lock);
> > +
> > +	if (!trace_remote_loaded(remote) || trace_remote_busy(remote))
> > +		return;
> 
> Can this cause leaks? Should trace_remote_unload() return an error value to
> let the caller know it wasn't unloaded?

No risk of leak here. This acts a like a refcount to make sure the buffer is
unloaded only when no one is reading and tracing_on=0.


[...]

