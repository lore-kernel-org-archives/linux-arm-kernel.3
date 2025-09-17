Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE28CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 10:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yl4sT5G87yZJ5cTJg9JWDvKdIPCLTRUAj+QPuGVNvRo=; b=fg3nFdEfqjKGQiMAJQ2TpjiM9l
	bvZDpf1sac3pexkViFi/4XEsCD9QUhlba0t7zvkK3rGZ/gJZghxMzRMePm22SthnlsYuSUoWaDsF8
	7lVuDPbRLyq3il99AZ/dTtqJS3ToT7FG3/QZ/C1m6O8TEuRbG83VqU6IkUDZvJ6ncrh0tJeWZb8WK
	N4OIyb7qehspmsjT/WaEGelK84W0dMoHUtC5CWCan/WpNgQ29o2HeEkD2zxNGvDI8QoNKqy/6gF+0
	jZe5J/HvQbcK91mQBLbipyiSYOISyAv4c6rv50ppOFtrWlvtlEotDhDWru0WKAiK+hUfEXk3B58SW
	yzRWq+Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp62-0000000AudB-1fkm;
	Wed, 17 Sep 2025 10:09:06 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp5z-0000000AucF-2jaL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 10:09:04 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-77766aae080so6230106d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 03:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758103742; x=1758708542; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yl4sT5G87yZJ5cTJg9JWDvKdIPCLTRUAj+QPuGVNvRo=;
        b=itxE+dv5mnFidz6qz7/S+GqZftmqQKeA6HJVbOfTlLrEO0ono/UkPa+LVLPdhJFQBu
         FvrG/YY7OlLCYs0Hhsg4Ui7R2uXwayOF32Zqnnktu2wcem/MHxxXcZkTJso9N54UOHQm
         OBbAmv0EF+SiP/8BW+0Vkdc2yYsEl5YRsGzr4p6awrzlqIm5jkadVrSndd6doMnHUsbh
         clCBuucuOBoO4Y1+BxvWDKk8+1rn2k2p1uwJDF8GRwi1/gHCXbdrrVNHHDXY1v68B8og
         blpRO9CYROv5+BcSp7FXN8Moz6nNZoYDQmRSlGeSeT4jr8yVHLoNH6cIR6hM5EWXQFB4
         r9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758103742; x=1758708542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yl4sT5G87yZJ5cTJg9JWDvKdIPCLTRUAj+QPuGVNvRo=;
        b=umNCrdAD8hvffDzfh/aYTK1/4aigR9pc65X697j1Y3UtJlkrt7bZ/KrESbizj9PRwb
         oPPHo5+DGKckWkE90spKduYMpdJ1mpafqlVoztngKqQQmUVsyzlBGgs3YORwsLyKLLop
         iWnYf6EK0OU5QP8HWrRlQXoRBKjnvBO7ClxSiO8LeYyKYVAtvcmdTHms4587PJWR0lsp
         0KL8JeBfyCjNCF59rKh8mzxAoRjaJBCdgKCs2rx8dy+DlIGfzzbV9GcNFT8fJh91RED8
         sPvqyhEviUu1Co09zbywZbAi7bR4IrvMc/DxEvWuGifKpDHi51gPLRb17ii9BgYbS5te
         diJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtZEek35PCQqrQCopFDPN/XRVJncoPpgFiZ2NiSNX48E0JJV50Qdh/KvBH+inwY5al+9HeUuJPU/KFSarz/ddM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/9dKQx8q0mLOEdu3yQG73X8p4+zeKr1559Lcf1/ZEhe+aLlsl
	MO5AVe3u6pYkbZw3nskxEGm0FMz+O1MBu14cGQ3ISvPeX/xllk7UFua8EhDogRw23p//s2v2+io
	F+uXAP+gYUDDIjiNcJlL+D7038UVBVQ4=
X-Gm-Gg: ASbGncvXtOXkwMJlxo8mH8iYiPLQoKBR02QBJwZMGmPHjt/0hc65/r0HRgnqV8jHbFm
	3WWOUeC0JJ8KnyCDWXPOws7QyqUOORI4pvIrp8i+Y3yCUqNwo+VrH8Pcldlh3Ofp06xJDXoqhof
	cuXIT895nmSVeenCMBOd2K2SQm4r96UsogOFJmwN1yk9p5JL5xVO3oiop37ApmsCPwzhnnROpxW
	xqVt9ux
X-Google-Smtp-Source: AGHT+IEomD51J189YwB1QGdwf3whu7kbpuWcyy+n2UeTa+NBVy20h6aFkkrM34eOlp8GZoisOW4RnD22NsTuLUswccE=
X-Received: by 2002:a05:6214:2429:b0:70d:cef4:ea42 with SMTP id
 6a1803df08f44-78ec3fe63cdmr14445946d6.1.1758103742276; Wed, 17 Sep 2025
 03:09:02 -0700 (PDT)
MIME-Version: 1.0
From: Igor Svilenkov Bozic <svilenkov@gmail.com>
Date: Wed, 17 Sep 2025 12:08:48 +0200
X-Gm-Features: AS18NWAbJErZHkVFnwuZ-hnQGRRfXf-rb7tYE0_qqptzr3BZzXqbS3XQulsYaMc
Message-ID: <CANRhiBqUsYo3Ryr9Ex2=U+=nbZu_XJoBuEQta=NKFCQMgDnd=w@mail.gmail.com>
Subject: ARM64: GCS: RET history and GCSSS1 stack switching
To: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org
Cc: Aleksandr Mikhalitsyn <alexander@mihalicyn.com>, Andrei Vagin <avagin@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, thiago.bauermann@linaro.org, 
	yury.khrustalev@arm.com, rppt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_030903_697079_94F522FC 
X-CRM114-Status: GOOD (  14.49  )
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

Hi all,

I've recently completed work on Guarded Control Stack (GCS) support
for Arm64 in CRIU, as part of Google Summer of Code 2025 under
mentorship from the CRIU maintainers. The effort focused on enabling
userland support for GCS-based checkpoint/restore, including
experiments with stack migration, token management, and testing on the
FVP Base RevC platform.

While studying the architecture and running tests (mainly from
tools/testing/selftests/arm64/gcs/), I had a couple of questions about
the GCS behavior:

1. Retired entries lingering after RETs:
When using a GCS-aware program that pushes return addresses and then
RETs, I noticed that the slots below the GCSPR_EL0 pointer still
contain "retired entries" from the previous call frame(s). Is this
leftover prior state expected as a feature, perhaps to assist
profiling/debug tools by preserving a history of RETs?
If so, is there a stricter mode to force a wipe of the shadow stack
after a RET, in scenarios where maximum security is preferred?

2. GCSSS1 usage with new stacks
When switching to a freshly mapped GCS shadow stack, it appears that
GCSSS1 requires jumping to an address that already contains a valid
(completed) token, which is then consumed and replaced with an
in-progress token.

As a result, it's not possible to do a RET to a return address higher
in the call stack prior to the GCSSS1 call site. For example, if the
shadow stack switch occurs in a call chain like main() =E2=86=92
subfunction(), you cannot directly RET back up to main() while the new
stack is active. Instead, either the new stack must be manipulated
(given that it's a writable GCS) by copying (via GCSSTR) to the newly
switched shadow stack or by fabricating a sigframe with a new
GCSPR_EL0 (with a proper SIGNAL_CAP) as we do in CRIU in the restore
flow.

I've written a minimal selftest to help me get a better understanding
of what's happening under the hood when using GCSSS1 and GCSSTR as
well as remapping the shadow stack VMA. The test is available here:
https://github.com/svilenkov/gcs-play

I plan to present this work done with CRIU at the Linux Plumbers
Conference this year (Containers and Checkpoint/Restore MC). If
there's also an Arm64 MC or any Arm-related session, I'd love to
attend it.

--
Thanks,
Igor Svilenkov Bozic |  CRIU / Arm64 GCS

