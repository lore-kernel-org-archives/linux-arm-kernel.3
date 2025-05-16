Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD655C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9i4TZO7F0sCGxwzDZyBytVinqtnKHLmyapBFsMMaK7M=; b=jcOiXweXAraE9D/OWUEug6xEa0
	UUrcxRwcnvgqtYUkC8rrv+QJJlYfZDQ7Muy1zf2nGIWT4E9vLOMFOnVWiiPDckeA86Cy/ZHvuLfzq
	7gj4Bnee7rBKCN+iyRkt3bPh2SeMnDNNgRiFRVfhWYHjfeIyTxO5A/Cv8XH6UUJU2MiVHawCRPdjf
	m9YiCxaAxbUiW/dRP9zi46uIJIgm2eTMzeUjUf3ExCZbAnPwA+bmIxh/WluVvAt/Ely4YddtfHq23
	W+TXn5VutHWjHgMbquxwoLAyiN3/hGfgyafO2oconkicarYQChMj1RsFVYf3t+8L69jd5FLhHSKu5
	nJM6r3qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFyII-000000044EC-2Qrs;
	Fri, 16 May 2025 16:52:22 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFy5F-000000042A5-188N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 16:38:54 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a0b9af89f2so1535330f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 09:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747413531; x=1748018331; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i4TZO7F0sCGxwzDZyBytVinqtnKHLmyapBFsMMaK7M=;
        b=g9uj4GneKYlpQz93CBQ0pYpZ98HIJ7KkC6k8D5OHN/TzQpEWjYC+RF8zyQp+GvfI24
         hOcaKKBodIUVOBnx+/I4tADWyety/iITmVOpKG3we3Mviw96Ygsm/z+oUBsZlngo0jGL
         MmMgOGOb8XauMYJB+MRl6nlQk6jZO/s363zJwr84fLqF4F4OiTb+gniLwdG1pXqHR5n1
         VoXXF60dIi6pUxy6Lyylb+/k0HMmn8nre/KVtH2ch2PlkFF8pM56GNt6pIM98BTcwcEP
         /nPdeVNmXE5Jqxtmhsnn2SsZqBkMcu5Czf5ApoLA+Pwg31v6HckNXysRYK/4dz4nUlvq
         bhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747413531; x=1748018331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9i4TZO7F0sCGxwzDZyBytVinqtnKHLmyapBFsMMaK7M=;
        b=s3K+1dytyWLXYZIDj+28pgKRuDiCYly/AMQC/Gob3e2HV8AHljiBE1nqHOYaFIBb5m
         AgjS4lkH60RB9+FSDzopPO1OPCbtE/1oUFHT/n50F5u3G7FxsfGBopmmZTh/NfXqCJws
         W94GA2rARo0mtxuLsyrClAkOFBzYLY9msH6Qq7Vr1QCk1G06tBJjz31DrxgSNX/W9JcM
         q5W92e7NRjNqsHJ+GL9ZQArIlLFkKavP3+89uKgTOnwrZFvm2vPJ64OEJUt3NldhQ4lx
         MHK5ItZYaB8JqYbo8Wai9RqqXlqf8vrvy6K8WBw/JtCtP5f3US2jDxf+4R9/j+0uKUs0
         CZug==
X-Forwarded-Encrypted: i=1; AJvYcCWrmQBDQ6zbUcRQyzYiaBr33W6RbLW9KBtTfrnIyIT7uQ1EocLJEjbGHdqFfis4QYb2L7zx6ZqSb0wIIU99UMYV@lists.infradead.org
X-Gm-Message-State: AOJu0YyuDB8YKim2qpHMo4zY0/U5MTB66dQa2FEmvGBZsbixD030MPAe
	N3mm22m235UPnInOs3EXRlf617ifuEVgCaNUo7vjNIx+8gpbIfryasOt229Ehl9ZLXNp70qobJ0
	kzt+bgQ+CnPXI8ZYTeOTh3n0vVSwvwOw=
X-Gm-Gg: ASbGncsi7XmIbRVwVQRfJ/G9VM8a/Ox7e1mZTktza4WgHd8qDxrIHYGjQD9w/iOsk6L
	okSvS0gsFDcT6fU3Z0bF6gsAuyujQTD50no5zXTR51rSQx74Al44lgtKXPV+fuqluNpcsGFdtw3
	jbmAk6by9d77lnYDOhvsTQvDGm5puB6ilqBnI=
X-Google-Smtp-Source: AGHT+IFu3W4K0n/Mx4JzypNg+2pWPRluhOQNdIAWcHtnFpVY55yVyhej0EVxD5ThFx9fCHELb0vQDWAFNFt4Z6KOzag=
X-Received: by 2002:a5d:64e3:0:b0:39e:f641:c43 with SMTP id
 ffacd0b85a97d-3a3600dc224mr3444012f8f.53.1747413530485; Fri, 16 May 2025
 09:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250515182207.329176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250515182207.329176-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250516-unpaid-reexamine-922bbecd4cbb@spud>
In-Reply-To: <20250516-unpaid-reexamine-922bbecd4cbb@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 16 May 2025 17:38:24 +0100
X-Gm-Features: AX0GCFvbvHI08lkzI43pAPo_nT6eNQFUgPjKydnuIxTd1HtqoDzP-qRe6UAojcM
Message-ID: <CA+V-a8v64jcDhdtSvqE4UTuCnL9mvjXOwtKyiZJQUeEtLmMFNA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N
 (R9A09G056) support
To: Conor Dooley <conor@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_093853_306741_FC0D6738 
X-CRM114-Status: GOOD (  17.68  )
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

Hi Conor,

On Fri, May 16, 2025 at 3:21=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, May 15, 2025 at 07:22:06PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document support for the Renesas OS Timer (OSTM) found on the Renesas
> > RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
> > other RZ families, so no driver changes are required as `renesas,ostm`
> > will be used as fallback compatible.
> >
> > Also update the bindings to require the "resets" property for RZ/V2N
> > by inverting the logic: all SoCs except RZ/A1 and RZ/A2 now require
> > the "resets" property.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3->v4:
> > - No changes in this version.
> >
> > v2->v3:
> > - Added Acked-by tag from Conor.
>
> But v3 -> v4 doesn't mention why it was dropped?
>
Sorry I missed adding it. Please can you re-ack it.

Cheers,
Prabhakar

