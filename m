Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D08C36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWTGK/X4SS10wsDie07tFoBcds9fT9TR5FQTDlGWK3w=; b=xfVggpH8J/SB3S1rhVfWAebSog
	dBdWse3IPlqvFYnNvaqSiC/Iw/QAw5V5CNJ/SVnn8izfd/+39aCcy9bEUxVpYPAB1geCauFsQmmfA
	ueb1gTUaN/x8UHc+BtbJRPPcpJazLjNPMVP/wlLfLIaPaQcJRmIbYmLJrIpfXejBtX8+0L6MykxS6
	kQ9mb/tMsfae+Mq5v2ZnOW2NhkVtLqRvJuFNKGuGodlEKS3Zs0IhwFCM14LiEa4ZppLGTO5ojDc/b
	a4BGkW5lE91uw5ISKxDJSwCDTfaBhz4/i+L9dZlyufWwxhqxxVdiQzQ5WTG9+m+ua2S1ar92nKLfy
	Xe1I8cGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3wH-00000005xtw-0nKF;
	Tue, 25 Mar 2025 13:03:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3mP-00000005wCX-2Lep
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 12:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eWTGK/X4SS10wsDie07tFoBcds9fT9TR5FQTDlGWK3w=; b=Reoyh7q4Yh9lvaOyiqXoBWxfO3
	RyshbLIl5iNvAdo7M8qDAl+19luH4uNCFdTDxOKpRfKEMswdzczUI4BJo4hxsK4gf1uV7ZXnNVgwo
	U0wkZ9esXRTIuYh+mV6vkVmfvpiO/nECmnv9AE5MAkmtPBB+lSTsP/KbaOdcoGON65eD8cBl6So4K
	epL/c44i+yN92YO9aixfJit3mEBSi2L0m7MFPygd+++jqYp+5MXstMRz4kqjBWRVVlQTjd7EOWfHF
	8JRxpXL1pflQ8lq05PTFW7P0EwLe7yGxghl9AjIP4EqIL4ihP8fTWZFc835Fz7SD5IEcZjr6WXAXW
	qr1eXW3A==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx3mM-00000005R3U-0hAy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 12:53:16 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38f2f391864so3292269f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 05:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742907191; x=1743511991; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eWTGK/X4SS10wsDie07tFoBcds9fT9TR5FQTDlGWK3w=;
        b=Tb8ZtYSdZ86HDhNz5oJqvX2Tx9I0jhKIXk2iexxN21eZUOfL+NochSb5ywjpvozBbI
         cRXXRhQu8m46QM9s9mftHFM/1XGgkar6y7ZBcSWrHfU7N+PCdfSPq/J0ehtIi+FsEp6K
         yqiToZ7HPswHBUdfq+h/1ofyvFpZ16zvKBGi0f51wNu5Zmrj9a85vEYSILcxbkhisdz+
         kLphSQJ+K7Bn0xikUVMKotVmadvUhzJyeywx5btqvAzzlJzdVQj4GuaNrnA7eTpkDJZm
         KYA8R2UjtafXZJUGRtinnGXQjRUJcoVlhnYM4ykQE3l5kJfC6uGQ1tAQFH5VGJwk2LHb
         LLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742907191; x=1743511991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWTGK/X4SS10wsDie07tFoBcds9fT9TR5FQTDlGWK3w=;
        b=mNoW6UnfWy1vwE9d72Rh0vUONxI7IzyO9V25Oww3J7ElWm2bhAxZNei7jH8dJSjdpt
         Tb7Y1Bg1YDzoZA40Rux3gFEHnfKhH6GHt17Rbt8bEzmaHU/sr6hLiBF7QF+Ne1oOKWA7
         lj5l/HvMmWVPlc4RHBNLny8g4AuL5Cb6ofBC+hwTGuKCjUSox29wrWJNyciuA3FXAim9
         AkHjyFrsRFp/5uMQQl5rcCKowN3Q7p2jC8L4lZPNIb+7J4zCW2F0O1F5MZMO9UvHLT5t
         bCKS36gEZrZEqCs2rujNOM8rzfEsMlIKvsP7awuN87kldOG2VgU6LXym84Bt+8EE+Azo
         5vHQ==
X-Gm-Message-State: AOJu0YzFqP5V6/Wl03SLDXU9CZnLSP822vsqsE3I4NZAtdbWwh1P5hS0
	0y3rTJTXwwO4l+PprQJ2rgayMQfZbUqXygtKS2sTkAVCC6Y4wCd493JD/2WW8Vc=
X-Gm-Gg: ASbGncsIh37gCVj3QgEXwGLIFsofHX/BYMyTkXcUJL/huN/kiHeJLOptyRCA3xeUUYF
	PJKhHoMnPGqrm6v6Sqz3iWODmbnrTHF4Nw05/Q+o2gis3l0ef6lHNPriDm0M4AlhONvSnuEDcWE
	r0vYB1shcQ2/rhiwoWOHnaUyyQCkbTlt82x7ULYLMSS9LvfQNvNC0uEmxtixWVjyFKN7hsRnuOr
	383ndeUbQEMv3s2jV92rVgt7PBKjadi0uCytwWkcxhrnCnbcDag5yDNLZ0hL3uSaiGSpxck0oBy
	3lgGXTbdO8nwiO7wCSmrBwCqmVBKGgPqD9jBkwKyffVl
X-Google-Smtp-Source: AGHT+IEE0UpwexJ3OeA2GpZXDHjojgHRAF+v+OvPsapSM0mU4OKjhQXj6Y5aUqQobFvv4w+MSqtBUA==
X-Received: by 2002:a5d:5886:0:b0:390:f460:77b0 with SMTP id ffacd0b85a97d-3997f90df2emr15215129f8f.26.1742907191489;
        Tue, 25 Mar 2025 05:53:11 -0700 (PDT)
Received: from pathway.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f99540bsm13579803f8f.2.2025.03.25.05.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 05:53:11 -0700 (PDT)
Date: Tue, 25 Mar 2025 13:53:09 +0100
From: Petr Mladek <pmladek@suse.com>
To: Song Liu <song@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org,
	indu.bhagat@oracle.com, puranjay@kernel.org, wnliu@google.com,
	irogers@google.com, joe.lawrence@redhat.com, jpoimboe@kernel.org,
	mark.rutland@arm.com, peterz@infradead.org,
	roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v3 0/2] arm64: livepatch: Enable livepatch without sframe
Message-ID: <Z-KnNU2A_kwwYdXU@pathway.suse.cz>
References: <20250320171559.3423224-1-song@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320171559.3423224-1-song@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_125314_289291_2F80B4EA 
X-CRM114-Status: GOOD (  19.76  )
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

On Thu 2025-03-20 10:15:57, Song Liu wrote:
> There are recent efforts to enable livepatch for arm64, with sframe [1] or
> without sframe [2]. This set tries to enable livepatch without sframe. Some
> of the code, however, are from [1].
> 
> Although the sframe implementation is more promising in longer term, it
> suffers from the following issues:
> 
>   1. sframe is not yet supported in llvm;
>   2. There is still bug in binutil [3], so that we cannot yet use sframe
>      with gcc;
>   3. sframe unwinder hasn't been fully verified in the kernel.
> 
> On the other hand, arm64 processors have become more and more important in
> the data center world. Therefore, it is getting critical to support
> livepatching of arm64 kernels.
> 
> With recent change in arm64 unwinder [4], it is possible to reliably
> livepatch arm64 kernels without sframe. This is because we do not need
> arch_stack_walk_reliable() to get reliable stack trace in all scenarios.
> Instead, we only need arch_stack_walk_reliable() to detect when the
> stack trace is not reliable, then the livepatch logic can retry the patch
> transition at a later time.
> 
> Given the increasing need of livepatching, and relatively long time before
> sframe is fully ready (for both gcc and clang), we would like to enable
> livepatch without sframe.
> 
> Thanks!
> 
> [1] https://lore.kernel.org/live-patching/20250127213310.2496133-1-wnliu@google.com/
> [2] https://lore.kernel.org/live-patching/20250129232936.1795412-1-song@kernel.org/
> [3] https://sourceware.org/bugzilla/show_bug.cgi?id=32589
> [4] https://lore.kernel.org/linux-arm-kernel/20241017092538.1859841-1-mark.rutland@arm.com/

Hi, I am sorry but I haven't found time to look at this in time before
the merge window. Is it acceptable to postpone this change to 6.16,
please?

Best Regards,
Petr

