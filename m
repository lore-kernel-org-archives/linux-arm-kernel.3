Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70C8FCD0BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 06:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNXx5fLw5itcSqfItrsW3d6my1DlKfO6NqzxE5+AiMo=; b=c+S0rSB0JSd7HxnQfuBg+q+hKB
	UkZGvQ10S0cEJwcC86GXYUzX+vDtWvQb0oLSAqwoLYUi0g3E4NE5oY4sF93Mx8qPLleazhRk5UgY7
	kflA5+jEyA/gkGMUmwVFZSupsfdy9ylEZDgCfCdHqtSuHDYYGmBP/a5ZCvW8esbuCfacCgfdpLYhv
	Pq0S8sCyaNOg+M7z4LcRax92MOOKvNvHk0DoohpLQN88dD9svDN1Ex/Q6C6SJPMsuxUUY9uKy6B8a
	TYF8vkRCDXDj1ssrremqMVjFq9A2YKOstk5VAoSmWRWHd82/WiviWEXZ2QvxxFnzHkEEPP03xxYj3
	hIH26rww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2kCx-00000007qCc-0Kb3;
	Wed, 18 Mar 2026 06:16:43 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2kCu-00000007qBn-2dhp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 06:16:41 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6644a3029b3so7992872a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 23:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773814598; cv=none;
        d=google.com; s=arc-20240605;
        b=H/vWZRVIfIJwR6eyIFiw0YraVjiTT7DT1uUKAfh5b94GWrIAswPKoERa6lhHCFxjJX
         qDmkzVt+OZQSDFYAC2rPaQs8kA5DNU3wIlTP1itDnSc5CNI+mM1qw6CXL5JpbNOmXoUc
         W8LlNTE8XCU68xfkL/Bm4CTNd/VAsXOOdrQvDiJcYi8FTRtpGjFKMlfa7tKsHg6uwqeZ
         eO9E5BxiisnLSQLGh3bgL/P8+neQ3axzKJ8FqTR/0LTQJ8PAi63umQhkHsVwb570izUF
         8cqRZ8deaNkK78vBF8RF6d9Nvy+dhqV+nLNshNswFiab84xuaexWii/5TVh6J+VEOpqv
         y9+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hNXx5fLw5itcSqfItrsW3d6my1DlKfO6NqzxE5+AiMo=;
        fh=wgh4O1GwzBwuGc/jjFuKrmNlR3YsAr8fjCzVfotg1+I=;
        b=a84mr0BFqO3bqhv64oqBWGGzP1lhjpGHMvSN1L+BM68+qeULetpbv4d47cCA6yt2HX
         muqqL/CI8jq+s5Mos8GHAe9R19bE5mwCkOkGD1Z8FUZK8qvmFZvzYWDN8OGfYida8udg
         htvyFe9fsLBriIh5yNmSAXa/doKxPhiEV0h6iDPYIe6Hk2gLTDJIJKxjpCCAloCLL4z7
         210e8RHOBT4+F5TGIPzKcX9yY9n84fjQAdFTTjef9aZBLsaioHFiyu7m/bwN/Cm8rX8b
         cGCZltiy/16UnUCAxRLVwqevDZHmY6ZMVlUltmczm147fStYP5VifmZYhs7ti54a2Ae2
         31xQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773814598; x=1774419398; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNXx5fLw5itcSqfItrsW3d6my1DlKfO6NqzxE5+AiMo=;
        b=Nrqb1cCYo+GNTvtSA+XAxmq2YcxDTJKovlFYjhTXLqMGSQpYXtbLxT8LC7ldZScrkY
         jLFY9gbDnQKY7OhY5hnQLga+PhVmrTq/zZv9iYA2ZiHt8Jwp9z2aavcOamEKg6ELzHRP
         PHyvyvUyZVbKVyP+AB78NAKFQ4HtELGfxVfL+KjPNtl3xLD3pyR0kNYSAOjA4o5bsUrp
         w2V4b9V1G3NpEwVqbwp43FWPuP8OMT7Ets8REGKkvi9MakciJhUGe3lkEEE1cihgHoLS
         OG/NW70lHEcn0Q85sk3tw09B+flHOSxKmgsD3ZsRXBDzQUR60CZJMAJkI2Arit9ywk+T
         bm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773814598; x=1774419398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hNXx5fLw5itcSqfItrsW3d6my1DlKfO6NqzxE5+AiMo=;
        b=ZavNxL2oMwJsAVF+0saxZelatAcHTlE7ejsW9/Jrb0kLgySGK6ZFD+nH8kqh4BvjvQ
         nFkE+DCMr40QNkwzegcoUlK3WVMSetkol2hIW2Fu8RZHA1/ABwVx3pOHBQuuQuhaQNs+
         q3DkQNno5+3K4Abhp7sfU/5t69Nvex55PNyJuAlMSX0+KeWa/Qoubq3hAA48SITmaSQF
         LtdM9BIVJePSB5DkaHAJgVCQRXPyVtODkATYKe+cqDNzTkyQavsqnh7oWBpHvgaxhHtH
         mxazBeFejzKH8IfiKWJiFdphR38yx9nsk7QQbROhBWOpofc1KSd9v492CCbzIIukQ/tk
         ktwA==
X-Forwarded-Encrypted: i=1; AJvYcCVb1nCPwdHCc/oPAQ4SSnNQ6xFmF0CJiVKaSMsnAWfhxpXoLy49+8P7cd57pGNAPBRF7idnnbmmjQAZRVnFQqRl@lists.infradead.org
X-Gm-Message-State: AOJu0YyWF/j62EHHzi0lEs6T9xuL3k8r3aGJ3vyvOXPcY13Aasvz7jKy
	9lCnwox3hIaua0brvSPdgwwXZDCt5Uf78WUQl02BHAOHxuGVugnj4uLKrk5FtQEUg/0B0xgvNkE
	zXnbcqehls2eGxb0sz6KrHvM6UsiTPnE=
X-Gm-Gg: ATEYQzyezDsyPFzqcPvFEW4f+IBRBSybaErYsG0wOuWc/iYOvrMFD64f3jtZNAFDzH5
	XONDZXJ+OFUI4umHU/OFArr5DHFPunc1Hf3po8PaPW8iXFIUwlTpPVqXspt8EUlC6c3phadXGtg
	a4jFLkCJWk8cN5k1TQN4fVYEfGXr4QVAq/c8Ye6yf2/hsLEXfID1e1A8RKwpYYOhTcexGNoYIvp
	lV0q5gZFLF0Y20O0edf0itjK61DUZBzjPJiDKaBbDbSTPL0TdkDMjettnI76AKnAhveQ603xLyJ
	YshuRfOPajj05vPRP6xNbH2Ew87hVeNR6jkZGnIy+9N3OWjrG6A=
X-Received: by 2002:a17:907:7b93:b0:b97:cc05:61b9 with SMTP id
 a640c23a62f3a-b97f4801ab5mr133040366b.15.1773814597747; Tue, 17 Mar 2026
 23:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de> <20260302-at-vector-size-arch-v1-14-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-14-a11f03ba2ca8@linutronix.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 18 Mar 2026 07:16:26 +0100
X-Gm-Features: AaiRm51Xx89jeaivgNYAhMk2LxpIu3kD6j5N4SuQDZ84WCnP1EAzJIW2dMNKGiE
Message-ID: <CA+=Fv5RLtUPp9BhXfFEUk3roE3Gah0iUamDEZ-MXCNM_xKm3PA@mail.gmail.com>
Subject: Re: [PATCH 14/15] alpha: remove AT_VECTOR_SIZE_ARCH from UAPI
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_231640_681578_CF5A3F0C 
X-CRM114-Status: GOOD (  12.26  )
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

On Mon, Mar 2, 2026 at 1:32=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> There is nothing userspace can do with this value. In the kernel is
> always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
> userspace and also changes from time to time.
>
> Move the symbol to a kernel-internal header.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/alpha/include/asm/auxvec.h      | 7 +++++++
>  arch/alpha/include/uapi/asm/auxvec.h | 8 +++-----
>  2 files changed, 10 insertions(+), 5 deletions(-)
>

Build-tested on alpha, no issues here.

Acked-by: Magnus Lindholm <linmag7@gmail.com>

