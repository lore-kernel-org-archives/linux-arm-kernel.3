Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCACFCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 23:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3UadvuxpedZ6Sgp4MUxB3QiyEWnAlMw7DA3dg4ylSM=; b=HjhuinlpyGOwhTPZZuamGCmlDQ
	Ntm68r5gl0xWs8u557gmNz0BYx7IRHerKFCBLicdx0CfNtnTlU62cyzkf8DAHABWQAJHp0R+cQZBX
	AgWqfQ795Moz4AffedGUd/YVoF2Y39d3cCvipeByMXOaDnj9GpZaJDnL5vIEL+5YJQ1CQubEwoDi2
	LKcETDlmO2JCjBEzUgi/orYEo0hLYYUZTWdlbwCLS2sYTF6mshr6MgZk5n0qiUPDLQWAVGOS/pwds
	D8Tlrxq+mmYIm0D1cZVoSysj51H43Tiw5+VuVMXOkqaoh6KP4g7qpvGA3GQ/KVLaoTzMdWdq0Gu4o
	L+SDqeiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGmOX-0000000EFqA-2eGI;
	Tue, 13 Oct 2026 23:58:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGmOW-0000000EFq3-2wHn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 23:58:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 735C6601DB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 23:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FCA1F0089A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 23:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791935935;
	bh=G3UadvuxpedZ6Sgp4MUxB3QiyEWnAlMw7DA3dg4ylSM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iYEvClCMG0yOZPockDInzIJhmb1X/vt9b1LIZ5aQ0dkb7Ccuuz8vkS2K+lxLkm6WW
	 6WTCjUmg6+fYAjw7b/aDiYBv97cPoTQoSo8Q8XtR1oOz7A8UrNVYhBhLpKMLC/NAU1
	 qI/qDD34RdZK3tGxDue2EKfkEAB9FDfxgqES0xw4R+6kxoLmsgDH6cbf1LONLUsp4k
	 1Yg1Fr5x/Ca6NlUVLc12Ak5ohDfgPYAeb2b7lK/g4TL+CoetKNYIxg6B6iH8nkKTu3
	 Z3kprvqc7oLzXrUwTHkkpLp9bpaUVI77vxsODBoFnXkN5p5j56c699s1cFjUc3L1dT
	 4OickcSBIyE5w==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcb2eceb3eso3103671e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 16:58:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByUz+tMVIfKBbd5/D89wDEZh+vFWMBkGiBrzcqXFCUVIdAB1n1cpO4w7UdbFxqBujQSlxF9aEnP36zQch/LxVXi@lists.infradead.org
X-Gm-Message-State: AFq9FYJf+q13KHBNYhF01L1zbp1qxvOgc70/UmLLVsO1WM2eI2sNM4xp
	+D+2kE0qUBEVKITTkMxChiS7FD7Ma+1f0Twbj3iXf24Gw6hnbvj56H1OcQwPr9+PL+jFZipZrY5
	wbGwTNQx6IQZv4IYlLseO+eQUJFvoyRU=
X-Received: by 2002:a05:6512:3dab:b0:5bb:7aca:4cad with SMTP id
 2adb3069b0e04-5bcde357b84mr5362664e87.2.1791935933869; Tue, 13 Oct 2026
 16:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260725091452.1875627-1-ruanjinjie@huawei.com>
 <amSFfCPV2jWfhGq0@shell.armlinux.org.uk> <864b868e-04b5-4187-9b93-72d476390906@huawei.com>
 <d3554be2-7fb6-4116-a9c7-1bcea4bf3b67@huawei.com>
In-Reply-To: <d3554be2-7fb6-4116-a9c7-1bcea4bf3b67@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 01:58:41 +0200
X-Gmail-Original-Message-ID: <CAD++jLnE9O7nDU9E=Y=1VQUAny-wvs4F_QiDNKvsTm0-4BY7Vg@mail.gmail.com>
X-Gm-Features: AclHuK9Y8ArjRQTB221BKeLMNOVgZ6pikZFIrq9p3QIbQUqS4Mc4aLsDffEo_0E
Message-ID: <CAD++jLnE9O7nDU9E=Y=1VQUAny-wvs4F_QiDNKvsTm0-4BY7Vg@mail.gmail.com>
Subject: Re: [PATCH] ARM: ptrace: keep ARM_ORIG_r0 consistent with ARM_r0
 after ptrace writes
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, oleg@redhat.com, 
	wade_farnsworth@mentor.com, will@kernel.org, stevenrwalter@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Aug 7, 2026 at 4:14=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com> =
wrote:

> Is there any new thoughts or opinions? Any feedback or suggestions would
> be greatly appreciated.

I think your long explanation holds, please extend the commit message
with the elaborate explanation, resend and put it in Russell's
patch tracker for consideration.

Yours,
Linus Walleij

