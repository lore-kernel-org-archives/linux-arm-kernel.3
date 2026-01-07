Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17517CF6BF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 07:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eu/A0GfTdEUi+4McTsexKabuBI9bVphLbWuOqGe7DD0=; b=S2ScXxs9xNkVR5pupF3HFJnyZg
	6+iANMq6AbS4N1sQksERsIm4CcaG/Z6GVmt0X5Juc1d0bphUFJV3s+GdWOK0uHmqpqd5f0jQQibE6
	ptbDs4sp+G70Q55g1kMKhto2QMHCcSpNHX4SLvXeOtQqs4L1UimQ7MY8m2R0JYtAI1Fno4oTsMZfR
	c7Joww/ZugBgC+LR+KuF1SwWQBNf0SCaeHrvE7zaf+C0UFJJI/wmQ6WD0ddNbglVQn4Z6hdT/iLAM
	6kw9WGpgTQlCAuzumnKTRZ4+bfoziyD3rVEUj5XDmamGcNA+VAnopKt/JzwGT8cJiM8kyAKGemIC5
	v1F640Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdNxp-0000000EHnn-3UVf;
	Wed, 07 Jan 2026 07:28:17 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdNxm-0000000EHnI-3L7f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 07:28:16 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7c6d1ebb0c4so1270879a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 23:28:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767770892; x=1768375692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eu/A0GfTdEUi+4McTsexKabuBI9bVphLbWuOqGe7DD0=;
        b=kv5/fOe+cnjmYqMia6eCAzzVRvyfLoBCGm19BMegPyE4US7vhDbH706eArzPexre2c
         0CAlHH7EtGFx7p9v/ov1sLszelvWnE3fSRyDfaJUs45Ao6rTZSCiUQsTw3djiV23OrNx
         OSDTLzLjEK7mj5oOxzstMOkQLaVtBaA0afNouO6/NdZtsrXlisy3dM65myT9hE4yzQJv
         FNJDdNkrTIw9G3zF19TCWxZaID7C+wAR3VjftFZHgQKRrM8ALjV3kCUjCd9VblcNkHLV
         OKgcjRh+CVg+plr68npotMPTDsPwEzrAj03cmT3GWgGHGCbYxbfT7yOPGupv3S8+y/XH
         dLGw==
X-Forwarded-Encrypted: i=1; AJvYcCU/upZRRVjiABkaQFW2eh6bwnGcxggpCInU/WOfA6IBiZk/GXAmGgtbUaIJP4UKIPS54/538EStq38w4DwpCBb1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9Ct19YcpcwGiPKrodbJxFgwXoqjQvInTJ6W9zDKMJiWZQuZ9K
	ForiYVRNTtDFYGLzZ7VMzd+qlyiXjAwz/tJjWGYPXE4IOUpNLT2rvdvqiKhEDw==
X-Gm-Gg: AY/fxX5pbrRN8VCezcibXHe1t1nzLdq6yD2FwohyyWNzcEQzpOiXDIjm3TviUqKdsVV
	wdGqE0Nwoz9g7z3Y7X26mMi947YHeWYA/X9yFh5fqtXao/+6kKmUfs9Gr3DkdeYTu+MZQqzxnko
	a+vRKAKXWNcrbHcKP32iaeTaE3rJdt08AUE4/ty3M9F+253U6JYSRp4/HGUwOmyDZ25P0Qr9ujh
	jfV/D1TJ9QeY+PX3pQe3trUlm9tzvkeas7npmqRxP9+DRG41MTkmlv8sacKNbbR5/etxjD5UFnQ
	gtsOIw16Q64+0dmML8YZZydEomx7EgNh3h2ecjoViVtK8KS6EdVr5UUzIX20g0UPCuKm9BnJ2bT
	M+nQSqcTu6l6Sb+jOFa2+4o8FISbnQFALpkwV4EaIxSKN4CvhsmbCqvUitRMihr7sqRIegixpyD
	Qr7bkbsj13qkF2V7GD4EIFwpMkQGHlxH1Cr0f85psU2t1flXwttXSfB27jsFzRKwNwqWi41jMO
X-Google-Smtp-Source: AGHT+IG7P/qG3d4vIOOdDJmoVDqkJL9x2wG6mOcpFnLRCapRzHvyFSdi1UxQWX2610VPp4zi6GSGQg==
X-Received: by 2002:a05:6830:7190:b0:7c7:7adb:e0c5 with SMTP id 46e09a7af769-7ce50a26ac9mr854219a34.25.1767770892386;
        Tue, 06 Jan 2026 23:28:12 -0800 (PST)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce47820f06sm2857044a34.11.2026.01.06.23.28.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 23:28:12 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7c75a5cb752so1240751a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 23:28:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0dv5C1yHy/osM6u5vIULOL+jdN4IAnyhe8XaCkWi0CWiKqjrd/Eqk6r/ULpdZUpM/529FQi1tpT6wPnfOZsVd@lists.infradead.org
X-Received: by 2002:a05:6830:2b07:b0:7c7:59a1:48d5 with SMTP id
 46e09a7af769-7ce5089afafmr879312a34.1.1767770891508; Tue, 06 Jan 2026
 23:28:11 -0800 (PST)
MIME-Version: 1.0
References: <20260105-b4-macsmc-power-v1-0-62954c42a555@gmail.com>
In-Reply-To: <20260105-b4-macsmc-power-v1-0-62954c42a555@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 7 Jan 2026 02:27:35 -0500
X-Gmail-Original-Message-ID: <CAEg-Je--qfftNtPgOOU5hsG=6roPeycgSWC+cZkW8EHmLwRx8Q@mail.gmail.com>
X-Gm-Features: AQt7F2qGyZ3wQ07Wyu2P5kUdwfWzPrrW5nKTTTElBM9nakAD7-jOVKbhW0CdPTQ
Message-ID: <CAEg-Je--qfftNtPgOOU5hsG=6roPeycgSWC+cZkW8EHmLwRx8Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add Apple Silicon SMC power driver
To: michael.reeves077@gmail.com
Cc: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_232814_836834_57945368 
X-CRM114-Status: GOOD (  17.73  )
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

On Mon, Jan 5, 2026 at 7:56=E2=80=AFAM Michael Reeves via B4 Relay
<devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>
> This series adds a power supply driver for the Apple SMC found on
> Apple Silicon devices. This allows the kernel to report AC status,
> battery charging status, and power metrics, and modify the charging
> behaviour.
>
> The first patch adds the driver itself, and the second patch wires it
> up to the MFD core.
>
> The driver is based on an original out-of-tree implementation by
> Hector Martin. It has been refactored for upstream inclusion,
> including support for newer SMC firmwares, devices without batteries,
> dynamic property detection and improved state management.
>
> Tested on: Apple M3 (MacBook Air, J613)
>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
> Michael Reeves (2):
>       power: supply: Add macsmc-power driver for Apple Silicon
>       mfd: macsmc: Wire up Apple SMC power driver
>
>  MAINTAINERS                         |   1 +
>  drivers/mfd/macsmc.c                |   1 +
>  drivers/power/supply/Kconfig        |  11 +
>  drivers/power/supply/Makefile       |   1 +
>  drivers/power/supply/macsmc-power.c | 872 ++++++++++++++++++++++++++++++=
++++++
>  5 files changed, 886 insertions(+)
> ---
> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> change-id: 20260105-b4-macsmc-power-d017cc7f53ac
>

LGTM, thanks for this work!

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

