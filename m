Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA707C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8d6b/fNRAVaLb/L3bgdgypqz8iTx4qcpmz29xYpDH2Q=; b=MxfjwyO8+5Md7a
	18nb7X/D7F4VxOm1pcMdC0GOd+SElH1v0DKT9QyHjhSK7ZM+5HvNlaVdnIrrFeU0e9UNNP6a91hEK
	NSoFr5+Q26xK+KvhhoG/ws2RdXi96qkXrEWV3Pg1wf6Tfa+/PTMaxg5b9m5ATTwV0bVx/nKCWjFIk
	F/PEdd5KmiHSCFqsrYdKMEpzDMMGcbAyLTF7zhvnOlLQP9oZyPIBEnO97qYY7h2ffXUHcC5GV6lIL
	qv6++Cg3nz/LFlxdhmK5hgiZwXQFmkdzJAzoGPRFA9gpKh9kg8B6H/9hlCltgnHZjFWAKNNJjvOaN
	akTrGEALUuCL18CY5BzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm60e-00000008r2L-3Aan;
	Tue, 21 Jul 2026 08:39:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm60c-00000008r25-3xFW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:39:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7175B44FB0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A421F0155A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784623166;
	bh=8d6b/fNRAVaLb/L3bgdgypqz8iTx4qcpmz29xYpDH2Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RQol5GY7dw3mf/3qmFKPRgYp49U/pocxHZlua+sKWiNCieOxxsxJb72anONsL6mXc
	 jktT0jHdpsiSq9hznr9t4bXWV/Rp0UYN23KppMrK/SjFMIJ8b/KxgTvVgUZoKjqGLI
	 YzLwvScHLnGW8HaMBNNWkl8ztBD9WcXcwVGyiYbmTrlz5o+johQtrdiVusi7cyFJhG
	 hmMWcSqtvHwrcw2k0d9w5he7Y2zKMZCM601eQ7YOWT3uZDT1OHQ9ZSSL4aVPfp2aTe
	 XBzW+y/HqXvWdBqw2WuoCb/ywC55w1WLoRtezyLo7NoIK/NRiogAMRY7K+Zq2Wp0Z4
	 Jj7jFhiTtyYdg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b0f19bea2fso6953400e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 01:39:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrjzSd6rVpKOFI19x+Ht/HG3aTW9KD9gtSbeYjh1VylVJd24S2XNLYNkjAc8o8XMavwc7CQI9bw2wprV75LFS8b@lists.infradead.org
X-Gm-Message-State: AOJu0YzOKjLIECWbJZEMpf2fuVdVSeM3tagHu421feIokIucExwaNsBA
	tz36nO5LY9qyCEF+lG2tijkdobMpgrDodjm3/L7CCHKGIPrxZvHFYDYW64S4n61S8jZ7JuzDEax
	ifb0nowNtfmcq87fDRSx4IbSQu7mfMRk=
X-Received: by 2002:a05:6512:607:10b0:5ae:ba28:a56e with SMTP id
 2adb3069b0e04-5b28f9aa422mr2369081e87.35.1784623165029; Tue, 21 Jul 2026
 01:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260721081858.1169276-1-ruanjinjie@huawei.com> <20260721081858.1169276-5-ruanjinjie@huawei.com>
In-Reply-To: <20260721081858.1169276-5-ruanjinjie@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 21 Jul 2026 10:39:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLmY6H1PeQdpLZP6=m1xEPKWdUmmmAkM_Ncy_WxL9mKYRg@mail.gmail.com>
X-Gm-Features: AUfX_mz4M5Zam7PLq9pt0g3Mh8c9Fbd9QZYGzQZFZyZm2-OUu94zNvOVUQ1YcEY
Message-ID: <CAD++jLmY6H1PeQdpLZP6=m1xEPKWdUmmmAkM_Ncy_WxL9mKYRg@mail.gmail.com>
Subject: Re: [PATCH v17 04/15] arm64: ptrace: Rename and clean up syscall_trace_enter()
To: Jinjie Ruan <ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: mark.rutland@arm.com, kees@kernel.org, catalin.marinas@arm.com, oleg@redhat.com, will@kernel.org, peterz@infradead.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, linux-mm@kvack.org, yeoreum.yun@arm.com, linux-kernel@vger.kernel.org, luto@amacapital.net, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2026 at 10:19=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com=
> wrote:

> Rename syscall_trace_enter() to arm64_syscall_trace_enter() to avoid
> name collisions and clarify the boundary when arm64 eventually switches
> to the generic entry infrastructure.
>
> In addition, replace direct accesses to regs->syscallno with the standard
> syscall_get_nr() helper for both trace_sys_enter() and the return value.
> This decouples the tracing logic from architecture-specific struct pt_reg=
s
> layouts, aligning the implementation with the generic entry pattern.
>
> No functional changes intended; this is a preparation step for
> converting arm64 to the generic entry infrastructure.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

