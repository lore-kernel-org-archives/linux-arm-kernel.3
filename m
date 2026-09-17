Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BFEC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 01:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:References:In-Reply-To:To:From:Subject:Cc:
	Message-Id:Date:Content-Type:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6mHUY7GH1xqP69TULjoYeDvGxc3p4dOZNNxR4X6kDY=; b=sVbZDOKtMnpksj
	J8kKYpktluMZwRnsVM2k3tdxxjIiL89aeqUyM4pAOX9RpmM9sCbUtsdRh7gZX5JMU4kZxWooY2Sst
	roIE6G4GJQ5w98nOTDylahGVdYT9PMAKEO7PTUcy5vvhxQesPApO8uvuOUlWZb+hzb36WEigvh9eh
	7JOHTyaA2JxHCFbtn/w2ub465fVKeFt/7BzgWACqEYEsRY3Iie0FMqoBlkBrm9go43D9Eh5YkhwkP
	lAzA2jju5KBmjkkhB0jbUBparqaam7e1YPIVgVfS0H7IBbjrj60gG8GpmMQFl/RnLXvsGKfLruNiv
	sI51nqgpUHQm/iRSkIYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x71ME-0000000ARP2-0CQQ;
	Thu, 17 Sep 2026 01:56:14 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x71MC-0000000AROh-1amt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 01:56:13 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so294064b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 18:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789610171; x=1790214971; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y6mHUY7GH1xqP69TULjoYeDvGxc3p4dOZNNxR4X6kDY=;
        b=CRWvJgx4rZiWZqijl14UvSKnJ/i+29N7wCehbUpwqHC1MHKao/RJXRLnP2xLJH+V8d
         wrgJ7GXjYiu8RMwAeclfBR4s5wm8Hd3fEklpjnkb2dMLQF2t6lWvQX14glHBhJZSnyXp
         X73YCnBdMt8Is1fayX5fysfWM3KTRkYZWh8ThKAyep6r3lDvIJv6/GAxNdkU2Bo3doLz
         G8j5rsE0jztte2/ZD6IDMWZPqTkw5+3UBYCqzEofXZ1p/HVSx05o60pUnixxRYlbpcE6
         sA3mHqEZM4R/Ct09mjEctY7Ehzya1XcjzzJskyyq1AWfepVexWQFYs2yvA388xGeuIMV
         mjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789610171; x=1790214971;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6mHUY7GH1xqP69TULjoYeDvGxc3p4dOZNNxR4X6kDY=;
        b=KIPXW8q4T2VWTmo88D1fpF109o2MPBlJxLRKnrfC1CWfyu4bmm0dKyRrcQHrVFnlAG
         pujQTTCwSP1nmVBzJa88ZmYdryoiRH2PU4k1TDPvNSeYQH3rAKQuzNxsaKviB9GXSqJF
         KktGKULUzrlXopD2asqTNdw8jJ9KLX+y8K73WdDaUEN35DVN+Kep//TvqR1h9crtgB/T
         E6mJBGQ/wS1FGF9X3hs5N0fX0yuksfbEilR1Ce8s18cngwzKipJjBD++pJ8OGKSKfSoH
         V2kzkjZGCLseF3yA6VTUuh3pf1cpsre7Vvahutpz6bOekiI00/1RowKkTbM9kjKopq4v
         8Xng==
X-Forwarded-Encrypted: i=1; AKwUvBwLrSuE2wcaYO7vmXNU3Kzs8lpRcuBh7HGzs5U6ncx0Bg4jgQr4xC1VGP83e2U2gz67MlXxeEP8+mreNcOhcK9n@lists.infradead.org
X-Gm-Message-State: AFuF++lEbus0aAC8Xct7DlS7MqgeswRSrcLxLpRtLxZ3AcHCSV1Tenar
	bMwEi0NszLeiS18tiggBg0Hfzoz5tkKANKIMmBEE0FzRSPgmcqJBJ3XT
X-Gm-Gg: AYBFou14AECT08TvTKewh5ZQ4xX2b98M7c3WvxrIV5KQYF4prXy16KiaGUJNENjN6DY
	FNpzadS/SN8umQMtyD7vKzoG9UueN6SJJ+r87yAca5YAce0xwk3s1gUwDkPQnWz7uHQk66HlVaT
	c54PyDt3bDIZswwK18y99w/O6YFg7G/+SjK+4dpvj3FtnZj5f2fNjdF3rU14pOyzG8pYNyr2KnX
	PAlidQh/Da/9MF2678kfo4rutyDPYsAw6z2JESq4U5jYGpUQDhm8K7dtJwFtznyeXy4JhYROcg+
	XPV1qB2WBB8b2CbOGurxs2nf0nlqHU4tSelAFqiBZ5/4rYaU7zdYZLCNF2V0ytYLGij5tt++BbN
	anHqVrSg04cT7MjGD8nUxxBGrSQBmhdAdGw/cOT5/PQqrLQKcv+bzJCaKRpSSS63G8YW+cr9xRS
	VStA1CsS0Hsrbq3x1KsPdeAX+0qyIu5/m8Yajg6Dgg+t1NZ9V1EdNx79Jv9CV2D+YBsoJ3gwe0i
	GFw3a+mANb5tuDPj005yigM1HsVTmJBvFTyS0D0E8nhesjK3WtvntvaevSQUkM2nLnans4XwYmJ
	W4Ve
X-Received: by 2002:a17:90b:2c88:b0:39e:26a7:7aca with SMTP id 98e67ed59e1d1-39e26a77cefmr12456976a91.23.1789610170800;
        Wed, 16 Sep 2026 18:56:10 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e390c2984sm387496a91.0.2026.09.16.18.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 18:56:10 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 01:56:09 +0000
Message-Id: <DLH7UY9PDSQP.2AXEGNH838JS0@gmail.com>
Cc: <yonghong.song@linux.dev>, <catalin.marinas@arm.com>, <will@kernel.org>,
 <x86@kernel.org>, <dave.hansen@linux.intel.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <abuehaze@amazon.com>, <doebel@amazon.de>,
 <jay.wang.upstream@gmail.com>
Subject: Re: [PATCH bpf-next 1/1] bpf: btf: add btf=off boot parameter to
 disable and free vmlinux BTF
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jay Wang" <wanjay@amazon.com>, <bpf@vger.kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>
In-Reply-To: <20260917000201.25581-2-wanjay@amazon.com>
References: <20260917000201.25581-1-wanjay@amazon.com> <20260917000201.25581-2-wanjay@amazon.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_185612_420589_66726012 
X-CRM114-Status: GOOD (  11.95  )
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

On Thu, Sep 17, 2026 at 12:02 AM Jay Wang <wanjay@amazon.com> wrote:
>
> Add a "btf=off" early boot parameter, similar to the existing "selinux=0"
> parameter, so users who do not want BTF can turn it off at boot; the
> section is then freed to save memory.

tbh I'm not excited about btf=off. BTF is not debug info anymore.
sched_ext, bpf-lsm (systemd uses it), hid-bpf, most of bcc/bpftrace
quietly stop working, and we'll be the ones triaging "libbpf: failed
to find valid kernel BTF" reports from people who copy-pasted a
"save 5MB" tuning guide.
This needs more thought.

>  .../admin-guide/kernel-parameters.txt         |  14 +++
>  arch/arm64/mm/mmu.c                           | 108 +++++++++++++++++-
>  arch/x86/mm/init_64.c                         |  30 +++++
>  arch/x86/mm/pat/set_memory.c                  |  28 ++++-
>  include/linux/btf.h                           |   9 ++
>  kernel/bpf/btf.c                              |  51 ++++++++-
>  kernel/bpf/sysfs_btf.c 
                       |   7 ++
>  kernel/bpf/verifier.c                         |   2 +-

This doesn't apply to bpf-next.
Consider using Alan's approach and support CONFIG_DEBUG_INFO_BTF=m

pw-bot: cr

