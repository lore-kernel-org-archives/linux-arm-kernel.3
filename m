Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AF5D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LlgstqPwU4W5iW5J6ZYZGwmbQjZNMc6oIdsZa6KM3E=; b=LNeSmEi8otZJMHiwYwkbHziRb+
	P3XUD5LRhRyuRh03vkt4nXH26JlUbIi0M/3LdL3FFa46XRQYGX1HPsu/Pq1r8gXGk36gtwzmarkTs
	JpgQVD9FWONSd60TZ9j7/hb+/ArAovt2aLexvlx/lSr8qi9H4bk25RFfRMewKftjrqG79pysMcpM/
	t4dHk/C5JgarRzpVEQLXYvWHyi08n0u1KicBvpbfvPxJqNdvdvuHGsw6o8jZuVXxBMrTJvEMGRwVu
	eVRUWaFZ/xM+WuVkIameahNXXTZ4bkWME9waBCmc+EJ+TdmsmC9g6F7zfVmtRODtqcPLZ19W68VFo
	jHuf38BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduIX-00000000XIF-1f9E;
	Thu, 08 Jan 2026 17:59:49 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduIU-00000000XHb-1ztj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:59:47 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-121b14efcddso695c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 09:59:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767895184; cv=none;
        d=google.com; s=arc-20240605;
        b=Hs+8o+a9w4zbyW0/cCXsCAqr0o0QvzJJYT0sIT5CfEdrj80IU/QK5hkPHVhA6+IX1w
         go8oVilXtoYUytDmhL1HVAB0jxScsxXADTDm63Zic7T69p12UHkSNLP8aKoHp/6ndza1
         I67M4Qlj8vMjsvSvjESN12ckLWkd7BlavV0qaQs6zM1Euvi2LjvulRqTh1B4N5tAqrUb
         LwlRygEnYcG7dqmCBlD7CldetUU1fxNWPDRmKU08Cp3KSMDq31B/ncyHsRyHobbmPkSC
         J0Ml1O3prxFP7u8W1aVJveFjxW/0iX6kwvjIYZRz7mBpxI2Yw+bPjkbwXNRkDPZrCiKf
         hVaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3LlgstqPwU4W5iW5J6ZYZGwmbQjZNMc6oIdsZa6KM3E=;
        fh=zgL0OwilRF6Sbk4pjD7fE9shQ9Fv39oni6l7/pMKrRg=;
        b=P48tW1Q1sDzs9DbaUGxCcvp/dWfeGP947CjwlLQnCpB2TidfLugT09fU4a9pfLZrUA
         uDwFOPn/VN7Fv1s8JholoYuTlUFOa/PeHESa4IYukRj2khvYenS/LyUwMpYubNPQS42r
         4/Fnb2wZmL0ow0VbVFwzOBsVaFve61+jAl/7cyJfytSD9IojtDU1zbeyrw8FTxkFmcAp
         PTuyFOWoVALBhU3noX8jzvkUtIPkHSZyljYEPbYdK0/T3GGCGcBT0veTmTVXK/cOrr45
         a/T3Vv9Lp4R3GOimZ+i//icqkMZzcarJSTH+fLxY+djMAup+45KeGK4S9BOzE02eOWIX
         ObpA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767895184; x=1768499984; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LlgstqPwU4W5iW5J6ZYZGwmbQjZNMc6oIdsZa6KM3E=;
        b=aAvEAMiPx7H98sgHn6xcwOKVht4VP0nx5SrAQJJ0grVJmgQNP8WYCeep8IBRDtiaCc
         BZ5+wVNcfsL4d4f5ObUrWA3Mik+Qq++Z0YGV/Xyjaul7RPUm8Fy7jMwroYRR+CALnAAu
         sujZcdAoasYoBqi2kzQd1UB2wP3+6W3GxuJ8GDIq0aDBiPF94V7wq2HP1s1ONQkPRPnF
         PkGOd37FSW/TIdKBER5m8K44HMuxdAOAHZ721mGKH4yi7zrmGPEasccSTnLynGUlYykg
         uOUVT2rNdge4pfYxaIYx+rUvZf+5z0c97rvYX3DI0PoDzSqmyvP2WfVDVKSsRRIPRtQT
         6rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767895184; x=1768499984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3LlgstqPwU4W5iW5J6ZYZGwmbQjZNMc6oIdsZa6KM3E=;
        b=lX3uyHa3CG1qc1MvJKbwnN0/mJBI6bfCt//1CI4cvK1IsUNKxaMO4sDH/xnT/HgXhF
         +ROUKV0leDXWGBa8EHain5PSUlkYBmNCttwW9MPVFsayAS/7zCeMpEB+vg4cy8zfpRVh
         BiBDenSeQ8HlC6tk/QtWyIIE/6pVhLZJqV73D9EPTc61uZK8OE5Xhzu0isXqvmqc6an5
         6TMUpGLTlt2ZvXlr5lbEulvrJ11UW6ssHLyLBzYj+ty69atkPcuS8WzyuXeBS2M9CrL3
         rJHS2CruRM04JadcjB6v1J+E4G14AYfzTD55XYBA408p2nQBkFCg2wbDJa/UravCaF+9
         R9oA==
X-Gm-Message-State: AOJu0YylzA0f7VSnDGYmwcsbZPtuv2E5rt4xheSUh5Xyhx/ePKwzLr9Q
	Wxyqnbr8dB3xFE64xW3jTmoQG+TFTiB6UoK1WtaUAtO6MIrAWqGfhgTXdB8jSCA18hRL5z1tbQt
	1D84cpswpMqK2khmW00JsS0lG7154kmxqqT7Oezs8
X-Gm-Gg: AY/fxX6BDK2C7G0SVh2odtcHZsI/9VyI7fcpYVzXap0/sRy9CNP0hiljVFRE3WmtwDA
	OId/uZE1Pdq6zUtR27qg/73izjqLV98GY+hE1GRPkg0uAlNruGI7plTJ3eApUK+I86URcViExiJ
	X/kggM+BbV7B+QpBToggpXbxq+6Seg7V5Vx0VQPfdGhvNilc2Y51mS5bNhzZoM4nONfJslF3M6C
	SY69dbFPvfHtdNE7SZaT6+8OtJfB+tpud//jauo27XTinhhmHhr4K0djDf1pWov1HsQ+sUhPMVY
	JZm0OI5HmMuATYCjBM3E9wmbePA=
X-Received: by 2002:a05:7022:6284:b0:11d:f460:faa3 with SMTP id
 a92af1059eb24-1220541f92dmr7209c88.13.1767895183796; Thu, 08 Jan 2026
 09:59:43 -0800 (PST)
MIME-Version: 1.0
References: <20251211040935.1288349-2-ardb@kernel.org> <CALxfFW4gyv3gSc1JhkPNqk4LL6S6gZbDRJx2y21PFZ8-8_9s_A@mail.gmail.com>
 <CAMj1kXG+6CYVSV-2ZSqrEm+B=az+54=fNwHpC_6qQZ-z2=3Zgw@mail.gmail.com>
In-Reply-To: <CAMj1kXG+6CYVSV-2ZSqrEm+B=az+54=fNwHpC_6qQZ-z2=3Zgw@mail.gmail.com>
From: Seth Jenkins <sethjenkins@google.com>
Date: Thu, 8 Jan 2026 12:59:31 -0500
X-Gm-Features: AQt7F2qG4JZTpgmrUvet927wRTzPR9uXVxSlElEKagdXfemplsURFSWd_27Hphw
Message-ID: <CALxfFW4nn3RMWfQHZ8yExhznTZyCAMm1Xj7J7ZALooan2eUNfQ@mail.gmail.com>
Subject: Re: [RFC PATCH] arm64: Bring back linear map randomization using
 PArange override
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
	mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org, 
	kees@kernel.org, Liz Prucka <lizprucka@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_095946_522683_3FCEAA56 
X-CRM114-Status: GOOD (  26.20  )
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

> Any thoughts on the desirability of this feature wrt randomization of
the placement of vmlinux in physical memory?
Even with vmlinux randomization in physical memory, dynamically
allocated memory ALSO ends up getting predictably placed. If I
allocate basically all physical memory, e.g. with mmap, I can predict
with >90% accuracy a PFN that was allocated by that mmap with the
caveat that my testing was soon after boot so that reliability may go
down over time in a real world scenario.

So I think linear map randomization is still relevant in making
real-world exploitation more difficult even if vmlinux is randomized
in physical memory.


On Thu, Jan 8, 2026 at 8:33=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wro=
te:
>
> On Tue, 16 Dec 2025 at 19:14, Seth Jenkins <sethjenkins@google.com> wrote=
:
> >
> > > This is posted as an RFC because there are obvious shortcomings to th=
is
> > > approach. However, before I spend more time on this, I'd like to gaug=
e
> > > if there is any consensus that bringing this back is a good idea.
> > I may be a minority, but I do think bringing this back is a good idea.
> > It has now been 9+ years since hardware side channels for bypassing
> > KASLR were discovered, and it still appears that real-world attackers
> > overwhelmingly prefer alternative strategies - such as this one.
> >
> > I'm under no illusion that if we just do this one thing KASLR will be
> > secure again, but I think this patch would still have a meaningful
> > real-world impact in terms of making exploits significantly harder to
> > write.
> >
>
> Thanks for the feedback.
>
> I was hoping to get some other views on this matter, but sending the
> patch during plumbers and right before the holidays probably didn't
> help in that regard, I'm afraid.
>
> Any thoughts on the desirability of this feature wrt randomization of
> the placement of vmlinux in physical memory? AIUI, the main issue
> being addressed here is predictable placement of statically allocated
> kernel objects in the virtual address space, which could be solved in
> either way. Or are there other concerns here?
>
> Just trying to elicit as much input as possible on the list, so the
> maintainers can make an informed decision.
>
> Thanks,
> Ard.

