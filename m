Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E503C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 16:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVYEH9u7BZqBR99JO0eGFShudYpqrhSzoFDK0x9XVJU=; b=oQ4BkfrSLhheRYnoocHX8kvsTe
	KCAM3yg8JLY3hPi84pwNRJ8dssbVXBpXMZaRqT+pMgfIM+ZNd8VMw41kPZrwfqSYrUpd1TQCwoNCa
	fl2wS7sDcrmzydD6P9dxpZ7tvlVFA0j9CTzqG5ZcLVNoakmgSsiCSldqvbI1uKsyZXaWeaFiSrjIx
	VwRLbHE9CpD3+oZpJ+qYh97H/qHsKlbwOvIUSYkmGXfC+DgZ0aeB2azNZL8wG3rrKTO/w7/z1mu2a
	VsUsK2UWkCN2QQEDhFuaQsIoYveibiyiGLrzCcrggxERpP94vWbdr0MBRx8oaYQRyG9PalsYLwbXf
	BMe8l/ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4Wa-00000006okp-3hl1;
	Thu, 06 Feb 2025 16:14:44 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg49P-00000006lHI-1M5q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 15:50:48 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7b6eeff1fdfso85654985a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 07:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738857045; x=1739461845; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVYEH9u7BZqBR99JO0eGFShudYpqrhSzoFDK0x9XVJU=;
        b=U95JM10u0uUGVLdGamghk6UzEm/R6B94CQE9V5EhE9yH88VgJXoBOfz6gIXasDmrjo
         i7PkLgVB0fH2GhOgMW0/8G3LEEqXzL+1Hg8QpWVpczwpUCEiQzrhvFbN88QTkrJoOr3m
         NUOkrtNS4ok8RcLmYGeZ5vnBntL9Gbfcpb/+7nWulgjz2uEfIxGlHIh0nwyKQpXJVZHp
         9irZ/5vAJQS84CqP6i9jFSzZ2DWedLYeJW5n5XMIxpCPc7eQz88GQhv1AndCa+7dHQio
         AsYrPU0jDrSQZa2K0/EjqkFHTEdi6RN2mbeds9IDYWfSHH5LVVVULPprdBp0H6IFEZ5Q
         NMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738857045; x=1739461845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zVYEH9u7BZqBR99JO0eGFShudYpqrhSzoFDK0x9XVJU=;
        b=WhALKUTcsmssc2n9vDG04IAksKUjn6oLxyqiFplCCyJ3OXPgO1B36wdIUlfUEHnnLx
         /+bgS8zgdhNCZZ9BnUnlDpyUbVs4GR5SDeKWzkFVx2UdrsTzzT0nz4DYLv4q8J4zzo+E
         R5ZKgKzR6Mf4HU6vBGolnkVcA/bolIOxtVdOcaqHgTCUrkJQctapNPHwDExOmc2isGg0
         tdh59bwGkRzAyr/ooyT89DcCpqyBdqtKnMyc5Nl0UZ3Z8iJT8C9mpuTdeMQ8yx4goUP1
         PYmmN7BXxP9JuR9pxUt5fjy2RMhw0vxjJV8ePRtXoInV+6s7JGau7jB12KEt7vTEPNmk
         CSTg==
X-Forwarded-Encrypted: i=1; AJvYcCWjTQXUzf6XVVj+OHVGjEftlUy8AOcAaFI9QBdZZQ3gzbI5yH+HjYsnFeIBzmWGNxYBWZFEMw0NCGSSn6CnD9ND@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2LWGVUufjJNWodlkz4BDA+0FkFTqh2FeJhxExA+HvFQxeAfNO
	xw3jPrzVeZIKlEIOXA7Ldm7eZ4os/gxeNrCDGh/0ALxyUjz2ZKjbUE8Fx5Y5lXq91uLVUnydSmv
	mijs1mICi0/s9XByDU0hgUW0KCDAkrlHJAMnKym0CKmvKJFZZ2qdT
X-Gm-Gg: ASbGnctVmPabxYCLSDQrK78t9XdPT4wmjctRA9gPfsqng9QI5n7PzOyjjNnSfPHN2LG
	7K+wvwol3MfuSqW9CEj17kq8bPkolVfq+9A1nBjRAuN1hgCfnPci+HLMpxsSYOg6XRz/ijF0SGG
	yj1+UVoUAIz9dVLUYltWYCCmoxQ10=
X-Google-Smtp-Source: AGHT+IE+rncFtbwAhZ1eoJytYc7UY8vVDkzQB+FICzCa3dFx23X6hvyuFMYoDKTdtpAQ+BR2Few3Qk+b0NFFyA1UmdE=
X-Received: by 2002:ad4:5f45:0:b0:6d8:8fdd:9797 with SMTP id
 6a1803df08f44-6e42fc59b24mr129162316d6.36.1738857044694; Thu, 06 Feb 2025
 07:50:44 -0800 (PST)
MIME-Version: 1.0
References: <20250206152100.1107909-1-maz@kernel.org> <20250206152100.1107909-2-maz@kernel.org>
In-Reply-To: <20250206152100.1107909-2-maz@kernel.org>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 6 Feb 2025 16:50:08 +0100
X-Gm-Features: AWEUYZl1exSceb3O3opzpDJtoQyjd-knXe-SoSYCxd4Vf1FfK1UFVnubiYOcITk
Message-ID: <CAG_fn=VMo=S_QBoSQ0oL-p1ajxU-=tX+EPqZ41POSSFMS08szg@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: arm64: timer: Drop warning on failed interrupt signalling
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_075047_369899_E5B3D357 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

On Thu, Feb 6, 2025 at 4:21=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote:
>
> We currently spit out a warning if making a timer interrupt pending
> fails. But not only this is loud and easy to trigger from userspace,
> we also fail to do anything useful with that information.
>
> Dropping the warning is the easiest thing to do for now. We can
> always add error reporting if we really want in the future.
>
> Reported-by: Alexander Potapenko <glider@google.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
Tested-by: Alexander Potapenko <glider@google.com>

Thanks!

