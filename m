Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED59FCA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 08:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HuxXA+MntcnCOxad2X2sYG+nW8j/CwA8P+nRSnKOkVQ=; b=e4WyFxo5re1nTKJGOPvLlYGKE/
	4mnkVF/Zl82c3g61OVI2pUtOVzREyGhRiJEJmJ4/KMtZlyJvy3Paa+MtJzbHGveVFJRP9ww5zrGKw
	sS/ollAJFv3jqtm2WmBCuYQCDb190rtSdY2NM9eQdNZMTh5uA6AEdIb04vucpX8cTVO4i29XiBn48
	CnnSWanFuATWgoGLqbw4rTt0nSypa0Zj0xa6JRmkSnxmq/aNMK46w37WNAGHt8E1bC4TCymgLOSZF
	KQBr9KQmlSg0jhxLdnW/vA27sYxF4sqoFdwzfKSUbdH940KBnsCZEDZj8d/I5zJcGb3aZPqXGo3L8
	Fj6m0Otw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF68U-00000005poX-2mbf;
	Fri, 09 Oct 2026 08:39:26 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF68S-00000005pnd-0onf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 08:39:25 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-487049569b6so2655092f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 01:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791535161; x=1792139961; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HuxXA+MntcnCOxad2X2sYG+nW8j/CwA8P+nRSnKOkVQ=;
        b=gAFtkoh6zt/zvC/quSc/60R92wAzJr1xGbwG7qZR6mYblDr28wBaGVaMF394sOiE6E
         8bNa2elbklLFqbU/KAEtNcVntSLSRzjCA/5Om7cUJ23B1EpaB16RvMPBZ2NIn3V2LXdF
         vNogC+Rmfyjn3C5ps1n3J9oZfZl8a+TELTQod8/S/ijLGkkoZ5fSEzUgOC3uKhWcli8j
         Cu8c4GH0p7SaMe+glZUO5gmhSpzyJUmgUq6qBoPq1PJflTlM4IczyRJ0puA06dEh8pFk
         gOgYEjcPRt/Yvn5eHfGg4g9dkplsnx2CfQRLafNSiVrz5NesQBLPJJUPCI4/7xqlMM95
         ZjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535161; x=1792139961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HuxXA+MntcnCOxad2X2sYG+nW8j/CwA8P+nRSnKOkVQ=;
        b=T9s3WTijA+Ia8VJHTX/NzuxuhuncYxVMCjOTaOaYgIizpOydhWmP9OQVQAW9uTJ4p/
         RJODdEOcNPXArZpN7YVgYSyheq55s2SZjqCM6ML8AJXUkH0IPCXTcPidlR0X6S3rM4ug
         ImMuBcOb2UKzw5eF4kOF459T52FtBTA5him4wFdgFEEJ5s/sacZpFCtWOWj+9tcOJDk/
         EVf4jkxGNncveqURDl1/+wM4XifxX5xMMf8j0ECkwarIRaPoXZPzPWASB1b++ebOSgi1
         jw1h6KJd5KdAU1WoC+NHAHWyFNuzOeF/Ldg2wcj8qY807Up3THXBK7y24NuFZZB6hAi9
         rMhQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3ZkmhChLNXyy1IbQconjgNtRYuXaJt3jsSiAeB45h8j/bjap3wlIcMLlJOuRdtrq5aQerDh8aP6ATjnmNX6mh@lists.infradead.org
X-Gm-Message-State: AFq9FYJcOnaCYSx2nFBlcRuGN0UnFahYlXvR68D8nnMJbNRCzLFbIYmY
	al+IYiuD1VvqmvwcSSUAo7Hdyg2O7UlupSFSj6lqww3yusSKm/0EU1cmpR/OxQanFA==
X-Gm-Gg: AYBFou0MTkYjh4Wf2RfLJBIExGFgRDeiDRKvq1VBY1krdwQDfxE8Xoxsoxx7F5SBFY6
	i5CU4KCeLd8XQOXzcCEaC0D3aSSZ3u/Wrm08BSCBPhDnrDlX4QIgvfwqAhTL2N21bB4y6/DL6hF
	5gUxeIkzKLBJZcDHB+irk7QafQ4dWdbLgmk/N+uDj1Yv/C2wBJS9p29v9ZOTO2qx58gbMsrppY2
	wp/BPWHnRhMRoi/vqVl6PC1W41qLQsYlDW0einioqa4mJNJtQHDRyqukkDK2WyDZUUQLeYv7oGu
	LQITka9xfOp2amFAWQnOz8ulvKg5CD9I+J06gRTHQ64emZlp17NOdxKhnS8rs4NCZAxy/qlg+eI
	juo8EGh/18oyJNV1/3FxqAID/v5DOxKCqMC6wb7YFHFOhOmR7pvX+RnCiNsEHKaX9f7PglwHbfR
	/fOfZWskEV1S3ghAqdhBGrOju/nk83cCSe2DF7UZrb/grY5RFMj8K5tHU0I6U5UnKb4mdChJdJN
	DG1H+Hsj5k6tVK/Gpkz3t8uzqMQk5gQJZC0C8pQBXoThQDggOYVDug=
X-Received: by 2002:adf:f6c8:0:b0:48b:70e:7bd4 with SMTP id ffacd0b85a97d-48dbaaea42bmr1516998f8f.28.1791535160947;
        Fri, 09 Oct 2026 01:39:20 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm2745702f8f.51.2026.10.09.01.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:39:20 -0700 (PDT)
Date: Fri, 9 Oct 2026 09:39:15 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	qperret@google.com
Subject: Re: [PATCH v1 2/2] KVM: arm64: Fix bpages backing allocation size in
 hyp_trace
Message-ID: <asioMxhIlMm9PSQK@google.com>
References: <20261008104212.3134550-1-vdonnefort@google.com>
 <20261008104212.3134550-3-vdonnefort@google.com>
 <CA+EHjTzpKk3hUTriyRF-YWkNQpQ82vuJoqKkW+uo+6n5f2mhmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzpKk3hUTriyRF-YWkNQpQ82vuJoqKkW+uo+6n5f2mhmg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_013924_302649_C4EA1CD3 
X-CRM114-Status: GOOD (  17.36  )
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

On Thu, Oct 08, 2026 at 08:13:29PM +0100, Fuad Tabba wrote:
> On Thu, 8 Oct 2026 at 11:42, Vincent Donnefort <vdonnefort@google.com> wrote:
> >
> > hyp_trace_buffer_alloc_bpages_backing() computes nr_bpages as
> > (PAGE_ALIGN(size) / PAGE_SIZE) + 1, whereas trace_remote_alloc_buffer()
> > takes into account the buffer page header.
> >
> > Align the bpages backing allocation by using
> > __calc_nr_pages_ring_buffer_desc(). There's no need to validate
> > nr_bpages again, it has been before with trace_buffer_desc_size().
> >
> > Fixes: 3aed038aac8d ("KVM: arm64: Add trace remote for the nVHE/pKVM hyp")
> 
> Should this have Cc: stable too, like patch 1? The undercount is there
> since 3aed038aac8d for small buffers, and 442ffa742daa6
> ("tracing/remotes: Account for ring buffer page header in size
> calculation") makes it reachable at ordinary sizes.
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad
> 
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>

Yeah I wasn't sure, because __calc_nr_pages_ring_buffer_desc() was introduced
later.

But I can figure it out once the patch fails to apply and provide the
appropriate backport.

Thanks for the review.

-- 
Vincent

