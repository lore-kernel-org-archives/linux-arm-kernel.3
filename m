Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61566CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 16:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7vxW2qYHkfek8BcuNGNfNSQ19bugBoHjwa49fBWcYE=; b=yH7SUQ+VcMAnz/7xGCnJfQNULE
	3QG6mAGBBATFinJIMnsU3nZRabEN6GXohNSb9M36j72RHi+lHjYj/dqj+rF6vPc2k6ngETMJmMZo5
	q3uDhg7Gs+tt/DPo8mMFyfBhxNN62OrFVvhl4r3ZBjDo9V62AqeuB+76k/XrWxBuRBEmIZ1G8L4TU
	inJ63bHXluOHyllwAyy5UINBIhLNewsXBXcE79IPy7oyg3PEway5tbFIb/qVfj+vw3U+jF+jsEQxi
	aulAORt12h/h0ANZx3EwyJ9Z6jRahOg0ytLm2CRi5jRVDDaJNQNuj32vaWNo3LiatCj3oWT+Cge4g
	zLpLOLmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmQu-0000000GIoT-1Ge8;
	Tue, 28 Oct 2025 16:20:28 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmQg-0000000GImE-3R4g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 16:20:15 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b6d3effe106so1383223966b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 09:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761668412; x=1762273212; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/7vxW2qYHkfek8BcuNGNfNSQ19bugBoHjwa49fBWcYE=;
        b=hY+j54G4FehNp7E/V/0SwzVaNRHdcN0kgRhHmMxq4tSzaogsDjDhRir5DtfBsKYhyQ
         VbgRGAI6ycPw2ozMALp/3KMarrm6azwL1aS3kCACCAGrNNsWpA4M5ORAnabBf7RjHn+s
         l6y3PcKWo1sp9ZAjAH4ahpFCuYDKKKsDfeCa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761668412; x=1762273212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7vxW2qYHkfek8BcuNGNfNSQ19bugBoHjwa49fBWcYE=;
        b=hCgXbs0sWFmYhaOlS94m4WNauzzJAd82oQAW9H+yJrdjzm4M3DZWR/RLocw6lczicn
         GmGVOnmc8zORgdrIy3ixhOwXFK/PGGoGpzHyErd58p346jjEhTUoEkFF8jYw+xW8wivb
         DLeV05daYxvIBOvGjwu/iteA+5qOXG+X+Q7hkE9fEtLvNqd4U7OSKEvzQ5e1A+5dlrww
         fULVeYvztBphy20ZBWtTY6nMhI+zhnjRWQm5l/dn2hf+T0S1MnRcnHJEyMvy4w5Q5lik
         iNinspcKjiIzi54hDwFs3WLTRN+wOEOiDAjU6H5MYMFr4QK6xf4X7itNc7SVJ6NL8m4R
         4tTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoY8Ci3FyNoOhTGHMMP7rjkfhZSOPJANCQmE6qQ7d7Q/Mys/X0CGI8js2ZzXSS/RGGmooUJ5krAxJmZAqLIUjG@lists.infradead.org
X-Gm-Message-State: AOJu0YwCMSORgHoDLfhyuBwfd/PzKVeYwKe+PX7cZsXi/QjuMYdD9zaD
	6Zr3G1/h7VBT8jQG6N/g6bxTXHS1mhRabAw0xXrIQoHEdYsDvv1u0WO8zMzdmXLQcSVUyisa0Qt
	Nq7jAG2VGYg==
X-Gm-Gg: ASbGnctbMoPy0tdAwhwP4IOkjohu/jUtmLFUW5o7/aB0UjpG748rXdtJGzcwhNznsL9
	pMchhPsQ2vLIlamV4puXSQLgx9ceWSTqRJ9Wo8a8IHD5alIKaqNw+Cx9jIAhFv8LMueVBK0xhQz
	tp1qcs8CeXEUYL7X2QycBJlrjQhwo9mKBY1eFQ4o8iKmQKFFDZ+0JSJBVDdSQal37EWWU4+9vMM
	aXS64dcxttRjJYRHmnkCBQi6OL4cTX2l1MnO7xkh59bpYhQtvzRvXwMEhYOliOAYY18wILtOxwN
	oJv555nqCF5A2VIs/Zj3PIXYQ6mQzfsd3DcDtVBrHgTrD+qMF7BpKHl5uCCRWvymC42gcRv5NG+
	DoGdnYjwdN9xOPr46UaDn2CcgZWN00MoUqWu5AslOLzy/UpA47hYRywXKKQzqHjz4cNLx1PEAmC
	GYcho4A7Urk5tC4Jma0C6YLYLPh0peLCxQOL3ZBDav2ju4VZi27A==
X-Google-Smtp-Source: AGHT+IE+Ym3VMknyBgITsoC/B8I0OSuPgLhbi0oDexotZvSxtPDeEZT6LAvTcPUMACVnsqyFtk5/Sg==
X-Received: by 2002:a17:907:9627:b0:b6d:6950:a7b7 with SMTP id a640c23a62f3a-b6dba5b1173mr393369466b.44.1761668412597;
        Tue, 28 Oct 2025 09:20:12 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85445e75sm1114931966b.66.2025.10.28.09.20.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 09:20:12 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b626a4cd9d6so1277879566b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 09:20:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJOxLmkhKTIMWVEDb2nKmqq5lXfOZVZ0wlenMUsjSTi/gfhgvr9mRK6duMaV2IQ2b/BMCaBDgdCpU1fDQFFrcs@lists.infradead.org
X-Received: by 2002:a05:6402:358a:b0:63c:4d42:993f with SMTP id
 4fb4d7f45d1cf-63ed826ace7mr3748960a12.3.1761668033009; Tue, 28 Oct 2025
 09:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20251027083700.573016505@linutronix.de> <20251027083745.736737934@linutronix.de>
 <0c979fe0-ee55-48be-bd0f-9bff71b88a1d@efficios.com> <87frb3uijw.ffs@tglx>
In-Reply-To: <87frb3uijw.ffs@tglx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 28 Oct 2025 09:13:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjZ39CSZwN3W6n5kSAqL-OhJghygh3-dRsrJKpOa9nTwg@mail.gmail.com>
X-Gm-Features: AWmQ_bkZ4DVtg-fqS9oPLAcmx2bmXbpg5s6Qki9Q4422mgDG3jAT_1tXHLLXals
Message-ID: <CAHk-=wjZ39CSZwN3W6n5kSAqL-OhJghygh3-dRsrJKpOa9nTwg@mail.gmail.com>
Subject: Re: [patch V5 10/12] futex: Convert to get/put_user_inline()
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>, David Laight <david.laight.linux@gmail.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_092014_894678_36092EEA 
X-CRM114-Status: GOOD (  15.25  )
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

On Tue, 28 Oct 2025 at 08:56, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> There was not justification for the open coded inline either and
> converting it to get/put must be a completely seperate change.

Actually, there's some justification in the original: see commit
43a43faf5376 ("futex: improve user space accesses") which talks about
the original impetus for it all: avoiding the very expensive barrier
in __get_user(), and how __get_user() itself couldn't be fixed.

So then it was converted to the modern user access helpers - including
address masking - and the inlining was mostly incidental to that, but
the commit message does point out that it actually makes the address
generation a bit cleaner in addition to avoiding the function call.

But I doubt that the extra instructions are all that noticeable.

That said - this code *is* in a very hot path on some loads, so it is
entirely possible that the inlining here is noticeable. I$ patterns in
particular can be a real thing.

(There was an additional issue of just making those user accesses -
get, put and cmpxchg - look a bit more similar)

           Linus

