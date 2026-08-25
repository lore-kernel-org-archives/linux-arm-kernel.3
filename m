Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBFBC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 03:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoRfjiOpZOtWexROqtJsfc6cj7fXbxuJvS3VpeWJnbY=; b=ybuN1LVmyKanVOjEFkfkRiCWXc
	+Nsh9QtD0eSRK03p68/vYw5YK9FRLL9qFNaA8Gs8DT8q8JWV7wM48EiYeclkky545cqBjgDBGoJyd
	GKqi0Q/SMwvhzFhvepK3l3oxZsilykAdmp0mNmZs9ULkQcnJW61h/8HXAYOVAiv0Gely0sTcShokP
	TfhwMbLWgsXCWSj3e0CYstMiN+wAHJ3aZwop8xl9JLkNtC9QcfzLLdIxt5sb5yE+7I/ZfaQLFzsRX
	+UVLG85taQ0EseRDYTDatSR8kc8t4QuoZKrT+ljv9ZXiBS0VRl4cfXsuRwztwymEwvWDij09Whs4v
	HV11Ak9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyhqL-0000000062f-3wqw;
	Tue, 25 Aug 2026 03:28:57 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyhqJ-00000000627-1RuX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 03:28:56 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c197eaaab00so709744466b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 20:28:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787628533; cv=none;
        d=google.com; s=arc-20260327;
        b=H/FlS8nHThvz216DXq8IKenBNAWHK/+Jf4b5FVVB5D+p2t0NbcGFBt2nP8rpTv8Pa5
         sKkOUyr+pft+rnrSQ0UcHJMvIBM7erewJ+26LLcjZfBMUUnPEuV0oKuh01tokpGo0aJF
         EyoTE9PCHQrKGeC4dkV6zQTbWvBnlGWFMWPKj9wirlxu8YW7riBpfPqqgrt/FqrANPTd
         Bp52hMQPxgPvKrzcSk8SupkaNhpaGYFu6ouwi/f296K/uqF66fTH5SzlSbpEhCzoA9b0
         uBDifm70igeADFoiyICOmbPSeBSL+sY25qDbbeUn0DNF8dPyCIRyE8UmpEH8cKTAdNnx
         nGdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WoRfjiOpZOtWexROqtJsfc6cj7fXbxuJvS3VpeWJnbY=;
        fh=LcBeYdZArzB19XlNmz8Q1Aki8N/y5vglrQXIR5+75io=;
        b=G/xfZJsdXQ+p+ZNEcY0ZcspGpf1DDxjvoogXEjppNLmnN63yDuEOzDR1H9bK8/Di/g
         LhJzzr7/LLq4kdJrCtI5tRg3qwqtuKMNo+ZlhpY//q7m0wys5FjP941pwbaCEB5OeXJY
         VNTbNy4iW6llO6RCqbaPmcPRnKl3mGZrLBOu9AWIh3Rfwt1whWV1Og1nguBHBTLZ9KiO
         Hhb+QC8c003lHeYfvUmEYR3QeNh+OwDOZ/iE502VtVyw7ZVLPZ6srMSQqSVxE4RFEx4N
         OAHGVYPCv5vn5Dl5Ehs6OA836b0a5BCh+eFyP0+S3/H4beI7gxACMn+dtfYxdWZHaOJm
         Tgng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787628533; x=1788233333; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WoRfjiOpZOtWexROqtJsfc6cj7fXbxuJvS3VpeWJnbY=;
        b=vqSq2apEUkXEx+sSJ8gD29UcBrpVVPQD9R023oj64PL6KFmI1+QXSpylPeM7C15XQD
         Rk2DTbOAnOsZ1ufcUq/xN+MiUwbmy5wj6NYpyFBvwOJCGgZpdKSUcDEGmHOXeHj9B5MR
         hfyP503jrRr6eH1HYksIUGiEF9UVqeCnRoFaIV+KMHa89mqKoJGyJgTVU9XxSn8lwyxs
         B9VOYhStF93IsxzCsnrJJAk+IJPunK1Rt2YqAzhDk2Yo0mUxTG8dG6o+jGc8LBNw319V
         UEIcvz+khDTJR6QmReOUXCvKG0ZDF3S9sISfvMt0BBoRvFDfAtsXZ5gMGo/M2tDn0Zbf
         QTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787628533; x=1788233333;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WoRfjiOpZOtWexROqtJsfc6cj7fXbxuJvS3VpeWJnbY=;
        b=DdO19HsJComYXdvAPr1zxQm/kBJvLAOcXnPTMh1fuZwO8pWeZGPrzCiMaYeqTTp+5o
         Yq70Kx+04uzDxo9VVN0H7pP5rHOrVN7qGWHES2cSNJzP8yAAr/3LJLotMqeeZuh+12IL
         xR8lAuY3HoEn8GKkevYCWnqZf7p9qqCk9C7RemQCZYVARYCYfkrBiX7Kpb8QbN9oNB1p
         N7JtpuncLarGqxO1ltpDzBXhSLtjCfOy1H+WdaRgGYteHOBsAM9Mo3CSLuahzgDYf6Mv
         XbDhwkBcc1z58oQR8zo/vIBP0nYEjHNAHUL9nMcbZkhh/Jo25IXgxMh1BOZ2Q96dG/EE
         N1mA==
X-Forwarded-Encrypted: i=1; AHgh+RoCv5cIyEqmWJl4qHim8YSiJZkBGkEI+Xn9nUIETZMY41/9vsQvnjEyE93zPa3kSfJXDwDrwn99dVAtdorqhwol@lists.infradead.org
X-Gm-Message-State: AFuF++meOsECWOqqJWM/yj2MXn94t3ESMWJtJurl5QBg8bTcwAyvfY5o
	ezvj/af+eJ5ROrcYBVMXDYy3NHGlWxF+TyvKVogWQsGgkSlcg+sjhrTnIF7dNXwu0XvN6YFq3DN
	1nnVeBrY/UbxxrXOD2ZUMrAtRzwIUsjWKsGUlWY4C
X-Gm-Gg: AR+sD11pOOTGkHWHpoCpCRo/lqKPj8/X6F69+LfcXAjwFvmfMnTNViXGx3cG0pEr38h
	sUQKnewBPYjNc9xErgEOphYcCsYiuSHjpdHh5sTXBqAZmL00gh/KrOHTtskFO8vyZgz5a93Xfsg
	6MSG8lUM3ZM8uw6w+FUUgDql48PuNDJXGWOI5q1sDzBbM7v0AqtXKhGtwl1yVGb3wqh8whzOTeQ
	2HT17V59hqX+lHwKmOrk+FNisvPa7g8wcz7DAB9s+3Rkz2P1CSxyPk/aPbrRB0aBaTQbw3nv9pI
	/yDh4QU5efDxPsaHC8ME1++Gp6UvJygbl3a8kvItPykuK1DLDrDSHNNnzByFGjo8S/r6iGEgetf
	jWwnMF9yUbZIOv5THFnrSUVTTYI49u5eb9iA5jORTpuYq9ZNkRqxbbt3UrcBvWg==
X-Received: by 2002:a17:907:94c9:b0:c1c:2173:d412 with SMTP id
 a640c23a62f3a-c24e5c8bfe3mr296347466b.1.1787628532747; Mon, 24 Aug 2026
 20:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com> <aoNGGKYZrOlaJ4mH@arm.com>
In-Reply-To: <aoNGGKYZrOlaJ4mH@arm.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 24 Aug 2026 20:28:15 -0700
X-Gm-Features: AcwNN1XpopclqRmS1SSj7gX5mIcn4wa7id5EaCll1JNV_pEtgQwJbOqOj16l3lE
Message-ID: <CADrL8HVnUY7vs2STH4ENSp0CUWJuPevYSdMG_CNsuUrx5m_P+w@mail.gmail.com>
Subject: Re: [PATCH 00/18] Another attempt at HVO support on arm64
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_202855_446468_65227F0A 
X-CRM114-Status: GOOD (  33.59  )
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

On Mon, Aug 17, 2026 at 10:34=E2=80=AFAM Catalin Marinas
<catalin.marinas@arm.com> wrote:
>
> Hi James,

Hi Catalin, thanks for your feedback on this series!

> On Wed, Jul 08, 2026 at 03:11:10AM +0000, James Houghton wrote:
> > The following Herd litmus test demonstrates the PTE update routine:
> >
> >   AArch64 TTDFaultlessUpdate
> >   Variant=3Dvmsa
> >   TTHM=3DHA
> >   {
> >    uint64_t x=3D1;
> >    uint64_t y=3D2;
> >    [PTE(x)]=3D(oa:PA(x), af:1);
> >    0:X0=3DPTE(x); 1:X0=3DPTE(x);
> >    0:X1=3Dx; 1:X1=3Dx;
> >    pteval_t 0:X2=3D(oa:PA(x), af:0);
> >    pteval_t 0:X3=3D(oa:PA(y), af:1);
> >   }
> >    P0                | P1             ;
> >    LDR X4,[X0]       | L0:            ;
> >    MOV X5,X4         | LDR X2,[X1]    ;
> >    CAS X4,X2,[X0]    |                ;
> >    DSB ISHST         |                ;
> >    LSR X9,X1,#12     |                ;
> >    TLBI VAALE1IS,X9  |                ;
> >    DSB ISH           |                ;
> >    ISB               |                ;
> >    CAS X2,X3,[X0]    |                ;
> >   exists
> >     0:X5=3D0:X4 /\ (* First CAS must succeed *)
> >     (fault(P1:L0) \/ ~(1:X2=3D2 \/ 1:X2=3D1))
> >
> >   (* This test should not violate BBM requirements. *)
>
> We definitely need a clear statement in the Arm ARM around this. As
> already raised in this thread, we can assume that AF=3D0 entries won't be
> cached in TLB but there's more to the BBM rules. For the dirty bit, we
> have R_SGJBL, we might need something similar for AF in addition to the
> BBM rules update. In theory, I think your approach works but we need the
> memory model experts confirmation and the Arm ARM updated.

I agree; it would be nice if the BBM rules were more explicit about
PTEs with AF=3D0.

The question I find myself wanting an answer to is: "is there ever a
case where a TLBI must be issued for a guaranteed-uncached TTD before
it can be modified?"

I'm pretty convinced that, for Page->Page, there are no such cases
(but I can't really say for sure).

For Block->Table, it's certainly more plausible for there to be such
cases, like your comment on patch 12[1].

[1] https://lore.kernel.org/linux-mm/aoSJcAFMNJ1nPl2H@arm.com/

> I'm not entirely clear what the above litmus test guarantees other than
> not giving a warning. On P1, X2 can be either 1 or 2, otherwise fault
> but that won't happen with HA. I'd rather have something in the 'exists'
> rule explicitly (like a TLB conflict abort; not supported AFAIK but
> maybe that's what fault(P1) was meant to show?).

I should have clarified that the exists clause in this case should
always be negative. So I read it is:

"It should never be the case that: the CAS succeeds AND (P1 takes a
fault OR P1 reads a bogus value)."

It's really useful for HVO not to introduce a window where Linux (e.g.
get_page_unless_zero() callers) might take a fault on the vmemmap;
this is what the fault(P1) part of the clause is conveying (even if it
is obvious). This is actually the main point of the test: to verify we
don't take a fault. The bogus value part is just kind of a sanity
check.

I don't think fault() captures TLB conflict aborts. The lack of a BBM
warning is supposed to indicate that the litmus test has followed BBM
rules properly =3D> TLB conflict aborts should not occur.

>
> In addition to the above test, I wonder whether we could have P1 do two
> consecutive reads from [X1] and check the read values. Maybe go through
> a third mapping, OA(z) with AF=3D0 after the TLBI or just start with AF=
=3D0
> on x. Basically any other tests for coherency like read-after-read etc.,
> check that the behaviour is preserved through AF=3D0 just like going
> through valid=3D0 with BBM (that's something that should eventually be
> runnable on actual hardware to validate where we won't have a BBM
> warning message).

Changing P1 to:

LDR X2,[X1];
LDR X3,[X1];

and using the exists clause:

0:X5=3D0:X4 /\ (fault(P1:L0) \/ (1:X3=3D1 /\ 1:X2=3D2))

remains always false =3D> P1 never reads in reverse order.

    Test TTDFaultlessUpdateRAR Allowed
    States 3
    0:X4=3D(oa:PA(x)); 0:X5=3D(oa:PA(x)); 1:X2=3D1; 1:X3=3D1;  ~Fault(P1:L0=
);
    0:X4=3D(oa:PA(x)); 0:X5=3D(oa:PA(x)); 1:X2=3D1; 1:X3=3D2;  ~Fault(P1:L0=
);
    0:X4=3D(oa:PA(x)); 0:X5=3D(oa:PA(x)); 1:X2=3D2; 1:X3=3D2;  ~Fault(P1:L0=
);
    No
    Witnesses
    Positive: 0 Negative: 140
    Flag Maintenance-scope-for-DSB-ST-is-deprecated

I've tried to write more interesting tests than this, but I can't get
any of them to run in any reasonable amount of time. (This test with
P1 doing two reads took 2.5 minutes.)

Here's one that I was trying:

  AArch64 TTDFaultlessUpdateRAR2
  Variant=3Dvmsa
  TTHM=3DHA
  {
   uint64_t x=3D0;
   uint64_t y=3D2;
   [PTE(x)]=3D(oa:PA(x), af:0);
   0:X0=3DPTE(x);
   1:X1=3Dx; 2:X1=3Dx;
   2:X2=3D1;
   pteval_t 0:X2=3D(oa:PA(x), af:0);
   pteval_t 0:X3=3D(oa:PA(y), af:0);
   pteval_t 0:X4=3D(oa:PA(x), af:1);
  }
   P0                | P1             | P2             ;
   MOV X6,X2         | LDR X2,[X1]    | STR X2,[X1]    ;
   CAS X2,X3,[X0]    | LDR X3,[X1]    |                ;
   MOV X7,X3         |                |                ;
   CAS X3,X4,[X0]    |                |                ;
                     |                |                ;
                     |                |                ;
  exists
    0:X6=3D0:X2 /\ (* First CAS must succeed *)
    0:X7=3D0:X3 /\ (* Second CAS must succeed *)
    (1:X2=3D2 \/ 1:X3=3D2 \/ (1:X3=3D0 /\ 1:X2=3D1))

Let me know if you have any more specific ideas about tests to try.

Thanks!

