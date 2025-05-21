Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E37C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnMSEARNlVgPRWKeN5p+uHnOxtjldaYnJP4wZN+8kzk=; b=eYoy5QA2abI+H3xtUuSscN13sF
	0ngCwmstiwh+k3UZsb6r0O6G831YOtfN8DO5j155MlfYAzmj4sBz42wP78MfkWiQvHhBjmrfENWBV
	/6FhZGEgFR64id7pnD8wsgnJmDC6muOk//pWtEOqul1jpPDqg3mv2TmVa3BZaC+CkTnmfyt9q0Hfl
	bw6S/+ZlePEEeis0KUHLuonLK5SejkrDxs4e/eJinDV1RXxx4NdsY59wZFCBjYyDAH4JQjhfoGdnN
	Cn3bLg8cFljHJ4wQPapikaTyVLxLwPfEnhJkZaJwjd00iu+mrAU3zBiHozorthewCGdYvFhOrwMl5
	n7pfniNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkLQ-0000000G5yZ-0Fr8;
	Wed, 21 May 2025 14:22:56 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHk3e-0000000G2Uk-2n0b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 14:04:35 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-476a1acf61eso61447031cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 07:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747836273; x=1748441073; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnMSEARNlVgPRWKeN5p+uHnOxtjldaYnJP4wZN+8kzk=;
        b=SUVQLkwqGufOphyaiLOZ3abv6yeCDudPBtTePRIGeuqMDfK/rRQHquydPJrjz3N0wS
         X1GdG86uthUaEeglaDi7jkJe1eX4Q0rVZMx7iPt6UCoef2Thwk7qYX/riBu2DsjmQQ9c
         HnvMumVqCpuutw08Ovff2P7snfmAqvxa63kfzFZXWEzqleut6rMi3eF7PJqWBOCAXVXJ
         WaSYnl/lxRvbG21J3U5qCGGQeIAkuE9bTZfsMUvaUvUTcMEFGI9uPBp97/Q0z84ShR8B
         ODp2FRf//MKN9+B3phY2cFp4vTjn7ZT6MqxFdJmbD6ENGgmBVClSlJT0c6bmAh4n6v4M
         FX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836273; x=1748441073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnMSEARNlVgPRWKeN5p+uHnOxtjldaYnJP4wZN+8kzk=;
        b=tov9OdHUcp9yIxBBS5XIoMKGgEFV8XyKFDWfDUGITIXQqJvrVwjTEDG2adCjClK4Na
         gUh4I0uVjHp0WJMxVZh/ntH3AklPwQ+NmyR2c4MNv40Q424KQ6mGzR9oIyES3aRIjikf
         DtRpyv8lb/8O9HyR5KKNkEwrhRoSnG/aLoZ4gAK0scxuKlXYjexmbAN+gy4/d4RxiLxm
         lPBwfvDU78zzOxr2jqL1AyYAJ6CWveL8cyQOPvOSbzfQT0iUoABU6SccMWVDYeUyq6Jg
         ofh6RrrJ8C3x+bI8LmYoyAa9dXUTLEtM8RhTboCYjLbZ4VttUv2OtXuXh7gmGy0MikbD
         7DYA==
X-Forwarded-Encrypted: i=1; AJvYcCXO3syP/7LJ7sHwFdhvjgFORXnHnatVfAOQS9U2WXnYD0jl/R0bnikBOJmJnPN5TZ2tnHCB7Tl2CF8efj4hav0a@lists.infradead.org
X-Gm-Message-State: AOJu0YzFGC/3UKmkXeHItStV3fYY//+Xxg+4PvoEnpIKWTR3NBMH59lJ
	s/SVqTEpERSqqbUIzCBYCfQRJ34EMz+ZEHimzB5eV01wmFPr/ddgxXfws6NOsannd6LM8gw2L57
	2WPBb2c46B7+XFqj4SrusnUOwTndnZhw=
X-Gm-Gg: ASbGncuFUBvWU+fkEm09rlkBghAWxaiaqp5B9+KZ2H92yNK6wpk4Rpq1wOQVRn6+N60
	+nxP3zSVg+9XAMrgDW9zWz4ULJ4FBi29mQ43C2hogt2tcJQZM2xW7GY1/J3rps94OeYDjQkZvKo
	d01FtAL2+Gph7DJs/kcyJMX7AUTUfGloa4RuBj0s+WDSIGZvp/QJHvNeq2m4esUHjQhg==
X-Google-Smtp-Source: AGHT+IG5fKyWSQijXdok293wDNISKRz4c0c0mL1AgaXBBaBchJGfRjQeSJYGuKTki4pnTMQy9k4rmKwSVvXk0HgISaU=
X-Received: by 2002:a05:622a:5589:b0:476:8288:9558 with SMTP id
 d75a77b69052e-494ae434787mr345964801cf.46.1747836273231; Wed, 21 May 2025
 07:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
 <CABjd4YwoVRpJEMss8UN6xT9x4hf6GSjm34GtTHmmnHi8Q42DAQ@mail.gmail.com> <c33a23c6-9883-4f3e-b2e3-6442ca90a7b8@kernel.org>
In-Reply-To: <c33a23c6-9883-4f3e-b2e3-6442ca90a7b8@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 18:04:30 +0400
X-Gm-Features: AX0GCFt4BEGM6IPuCHg8AhY1gdu5ORHuOAa78BDG1xqhEo7D1jh3oHrYQqoxZ6w
Message-ID: <CABjd4YwGM0=k4Jk07O=Z7oAzk2DNLP8HHmGR8QbWJOiMVuxLUQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ARM: dts: vt8500: Minor fixups and L2 cache on WM8850
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_070434_708183_13D2DCD6 
X-CRM114-Status: GOOD (  17.40  )
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

On Wed, May 21, 2025 at 5:32=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 21/05/2025 15:28, Alexey Charkov wrote:
> > On Thu, May 15, 2025 at 11:39=E2=80=AFPM Alexey Charkov <alchark@gmail.=
com> wrote:
> >>
> >> Small fixups for VT8500 related device trees to improve correctness in
> >> light of current guidelines.
> >>
> >> While at that, also include a DT node for the PL310 cache controller
> >> present in WM8850/WM8950.
> >>
> >> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> >> ---
> >> Alexey Charkov (5):
> >>       ARM: dts: vt8500: Add node address and reg in CPU nodes
> >>       ARM: dts: vt8500: Move memory nodes to board dts and fix addr/si=
ze
> >>       ARM: dts: vt8500: Use generic node name for the SD/MMC controlle=
r
> >>       ARM: dts: vt8500: Fix the unit address of the VT8500 LCD control=
ler
> >>       ARM: dts: vt8500: Add L2 cache controller on WM8850/WM8950
> >
> > Krzysztof, could you please pick these up for 6.16?
>
> No, we are at RC7. I closed my tree two weeks ago and sent pull requests
> already way too late - a week ago.

Got it, thank you. Note taken on the expected cut-off time.

Best regards,
Alexey

