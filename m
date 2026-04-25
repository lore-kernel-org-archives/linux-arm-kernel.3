Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F63FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 11:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FUrLXSCZqPqxFHXgAkOgwEVVen4UoluY1xOumnyhwo=; b=fqyDOYH9QIh9kOHnunWfC8QDWv
	QYyCokIdQQgsGS9RwfMN3izeZ3iNFi/7f1QZqPngL42b7g3LeT4pVU8ub8rGb31A1XhR5U9+wrPHk
	B754DnS1Z0Ixgyu5ZWM5IwiD2FnaE3KBVDPAvAI2CUz/V9uBadY3A5UeAcyHdw9OECAT3KwZHlkKe
	HFNHBK0U/L+mEVh80vv9cpgNuSlTmGNOrZNFkMZcdyn9YnSLdWXytKmRMDDS/HWZXVq1GvtYuVeea
	MkoRiDk7//zsL7sXbr769nOY7PKYOIwGBEXbeTpbamYtQeg+Qv2I8N0D1Jmuru+Ojh/MrbIr7lXOm
	jXJ1QbCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGbTF-0000000EPJE-2NFX;
	Sat, 25 Apr 2026 11:46:49 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGbTC-0000000EPIt-3ODb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 11:46:48 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43d77f6092eso6010981f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 04:46:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777117604; cv=none;
        d=google.com; s=arc-20240605;
        b=Swkpu6Dv0jke7UM++p1MalxVpqR+hVMlHOriXOU3rucR2YXUPisn9G4RaagTnUoffA
         s3c9saML3C1KyikxjwCKlStO5grEaKooGYl9WsdD+39ldETfWyE4PIcS5Pd27ITsvd0z
         nKHdbZocNO+RYfrOmlK+o/amm71pksAZAHloBNjrcUiGORq7V5IQnx5nyKj6cLNc4eX8
         4qjlyVne+mAlXyG8L6o+buR08Wzdm+ZiD7YmNMq2NN6DE1hEpNgyb5qAGLlJ5S2LJh5j
         e7QPe45wwHeUlqViagNssjN108lK2fetaHlp1OwfQ2ouurHfeZGAYhd2UewyscDtOQhx
         TVIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8FUrLXSCZqPqxFHXgAkOgwEVVen4UoluY1xOumnyhwo=;
        fh=b2tkui8+yBpVWdSAO3f+SFI5FFPCyZVx7ruo7P+iwsQ=;
        b=Rxjz1uZdhavpdEn1SvQeva2ElSX5lJPRW5WUp3CnZey3BoRdzX0I/mCXEG+ZET5cL/
         nhMUeB6yPpS9dIAEfEiqw3WOVtgGUDgrsJtobEZhv/mcwqgOv7ZaKR9Pi8/8YUoDLvXN
         LBky8toQXiesqhLKyD6Jau+BJ+d51teVEjm/AezGH9tw/lAQ88zzvBZEMCUI0p3W781P
         2JLJpgmGCNwmSgGRZCP5/qBVg/CizQakNG1F77fCbssErucROhhLNpls+KqxlIWuJwzY
         wzUFHRbQBkVqmgo3OBsd59zK9kR1HuFOtqvGeBb67eXY02wpCTMttDcO+qpa0l1nkrpa
         IJsw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777117604; x=1777722404; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FUrLXSCZqPqxFHXgAkOgwEVVen4UoluY1xOumnyhwo=;
        b=strzzRcC7Gjh3gg9OA3cjgKR++leRLnfvoy6CQGlFb0/xkLrYrgGlmeB++QJFoDt+B
         u0gGAU4F8wJLnMYHEX+YXBYLRO8CVib/LMZFZHtP1y/7I6jkz08Me/T9BzrqU7time8r
         KQPmteTOEscC6aZ803F0Cy7EJ3vvhnR8N8j4c6f3ac9ZAvG13WBEr7W9skXkEFEgojI8
         EWnV4EBROqEmLPItGYCi5pvjDZj/Q7zMOpfj1OteLKO8jkAq+JFhpDBs+hopyu0TlWJ+
         pisk13inEJALunIU1bovA7WUTSKatBNl1sxeEyMMcOYTZElB/zHWXTW8B4QKfVSc2giM
         LsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777117604; x=1777722404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8FUrLXSCZqPqxFHXgAkOgwEVVen4UoluY1xOumnyhwo=;
        b=Gyzk9t/PTuhmOAttTtvXkt3M23keRvTL9hp/kcIAnpjWW6YeInbH0sZHAgszy7+GBN
         cvT072bvPYFbHpWPK2CCcmqhunf6TnPOTxztqV8kC5d3fmAuCVpjwgvXZirJKh0uaQYz
         zzDwG8AHWcmegDF9L3P5Z6plChMSv8Dvlq4Wnv/Hy+rDxqr1Gg01vXBwuCQLr7uANN7K
         H4HgRIgcTkA/Te+azfSq5RNII3Q4XENh3mIdoTfdhSeheGYPcpdGBaSbbHrCKBpTDylT
         vZb60Cz3iKTQ4l13Fe8Ous4P77MvOHqZoj5BQZbNqgLx+5KIx+lmweKcP4O0Harf2Apf
         5Z/g==
X-Forwarded-Encrypted: i=1; AFNElJ+tcCrOc8mZN9Sduw2DTr4ObV01vx0YlCyJzJ4lHeAyLP9nPHoIWAATU0n+XUw1uBSvyMggbHdgM4Gt0Fd+aqym@lists.infradead.org
X-Gm-Message-State: AOJu0YyS2ZtR0MyhPi9NuRiasu7Gxwr0UHSbLbcex1S2WYqrUI0ZEdFR
	1caetVpaskM0xWXVLWbJ1rwaWai4PRr+74xFKr1JyDgfu3wEmtuqkWv+QRcoyAgkqHxZhKrZUjL
	DXv+98oZnetP2ix0GFGEzgLH47BSqPHc=
X-Gm-Gg: AeBDietMNl8kbHqTEKMSjOUPZPXTKMPiZm0FUjhkSlQTM+Q+y6sVhTM8xJCA1FL0jNP
	RBs0528ab4eBbMUBB5txcSx4ahETzm6rxJHXqkur5z+coDr2kANs44BuSn90f8+wfSsZg2/0uui
	uX+Tc2Qt+L1nY/2uxzPm1ZGTpog6jLV1jUIpksXJAjAG4yQiAmwLaFCeLioG+hZqb+ArvQslaue
	UVZkcgOSMR7GtE1bZ3bEGtvXvnT4msrRzAqGjUdQSynHH1bnk8BJPH7w4aeWE2o1Qawo7HvEOhU
	OqB3+M3fuUoqWhI0
X-Received: by 2002:a05:6000:24c3:b0:43d:7868:21db with SMTP id
 ffacd0b85a97d-43fe3dcc11amr55562078f8f.18.1777117603839; Sat, 25 Apr 2026
 04:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <acJhCCPfVxjFUZ5R@J2N7QTR9R3> <CAOLeWCsxhzdxQviizJ4X4VOp_28LCtO-RjWoCcZG29rQw86NVg@mail.gmail.com>
 <9a12e043-8200-4650-bfe2-cbece57a4f87@app.fastmail.com> <20260331063659.GA2061@lst.de>
 <CAOLeWCtnZz=kHGk4C2f9Mbfi3tEBE100iCkMBhcG47dmR9eDWw@mail.gmail.com>
 <CAOLeWCtxPk7q_bVvrcKaipSKr+_=57Auobcj0cFRvXxXMdH58g@mail.gmail.com>
 <5158e4e0-3275-4c29-a8fc-2dfabc13a69d@app.fastmail.com> <CAOLeWCtf2rZyPeJH-LuZ2A+c7mC9M2r-Ya0VjyOJFpun3TFMnw@mail.gmail.com>
 <8db4defe-8b5e-4cc3-880b-72d46510b034@arm.com> <c9362db6-1fef-4e70-9525-29b2936f4887@app.fastmail.com>
 <2c2eb793-c0a4-4b65-93f1-0ece5cf820d7@sirena.org.uk>
In-Reply-To: <2c2eb793-c0a4-4b65-93f1-0ece5cf820d7@sirena.org.uk>
From: Demian Shulhan <demyansh@gmail.com>
Date: Sat, 25 Apr 2026 14:46:31 +0300
X-Gm-Features: AQROBzCGKHu6guzCM7pwEyGOZ2XR-XPK9d42N7x5GVU_IgEZfJxb13D1ue9-s_0
Message-ID: <CAOLeWCv56Zz9Ns8APm+Q6+gpGPqni7GWvAfVYnvrYjRU0EZHfg@mail.gmail.com>
Subject: Re: [PATCH v2] raid6: arm64: add SVE optimized implementation for
 syndrome generation
To: Mark Brown <broonie@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Christoph Hellwig <hch@lst.de>, Mark Rutland <mark.rutland@arm.com>, Song Liu <song@kernel.org>, 
	Yu Kuai <yukuai@fnnas.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, 
	Li Nan <linan122@huawei.com>, linux-raid@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_044646_913849_67DFE1EA 
X-CRM114-Status: GOOD (  20.52  )
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

Hi all!

In the future I will try to look at optimisation of current algorithms
instead of SVE realisation, looks like there are few interesting
cases, I will share details in future changes.

Thanks all for the discussion!

=D0=BF=D1=82, 17 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:3=
6 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Apr 17, 2026 at 04:43:06PM +0200, Ard Biesheuvel wrote:
>
> > On arm64, kernel mode NEON is mostly used to gain access to AES and SHA
> > instructions, and only to a lesser degree to speed up ordinary
> > arithmetic, and so XOR is somewhat of an outlier here.
>
> > Given that Neoverse V1 apparently already carves up ordinary arithmetic
> > performed on 256-bit vectors and operates on 128 bits at a time, I am
> > rather skeptical that we're likely to see any SVE implementations of th=
e
> > crypto extensions soon that are meaningfully faster, given that these
> > are presumably much costlier to implement in terms of gate count, and
> > therefore likely to be split up even on SVE implementations that can
> > perform ordinary arithmetic on 256+ bit vectors in a single cycle. Note
> > that even the arm64 SIMD accelerated CRC implementations rely heavily o=
n
> > 64x64->128 polynomial multiplication.
>
> I'd not be surprised to see something that delivers useful benefits
> using SVE at some point.
>
> > IOW, before we consider kernel mode SVE, I'd like to see some benchmark=
s
> > for other algorithms too.
>
> Definitely, it needs a solid win to merge anything.  I do want to get
> back to the situation where we've got out of tree infrastructure patches
> so that people working on algorithms have something to base their work
> on (and see the overheads using SVE incurs) but unless theres's a
> practical user they should stay out of tree.

