Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B7BC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmIiry7aZvfcYxK9grtKj+mdFQrBZ0Yxe0X8buy7AyY=; b=aqRrHT/zByMKn/Tc2MylpE1BzQ
	bvBNQ2pMyxJ63Acy7+87VdYuan1F5khdA7zh7g5KdMSJT1vXIuStaPzmp8nZwamUJD9qI+I/f4nix
	8MTeBSc2iiM9J8KyEWR+5rCT69kNpWdv5yMg8v7TuKzOKRLIk+yaPcVOk7m2vTNGFq1Q+0xsf9up6
	nF8wBGWDrb3mbqHG9UAR8gSmfiEom7jqNuOtfLqKUeHEqgiOw0RYZ+uTXaphsFpsQOQZtcHGb0upN
	Ww40joxXvJ+4i6gcVAEUs9SAtQf95uJ1tvqzrC9VywLebctIVvhlDXvP1So9PK5Nl5wvHkueD8Brk
	khp+9c1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIWp-00000002PRq-39SV;
	Tue, 04 Aug 2026 17:02:11 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIWn-00000002PRU-2DO8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:02:10 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso11903a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 10:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1785862927; x=1786467727; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PmIiry7aZvfcYxK9grtKj+mdFQrBZ0Yxe0X8buy7AyY=;
        b=EOqF4B7WjC4izlkiUMVTeDdRJm7yj/WkHYSjsw5W+UN7IqW7bbvgmgyjweXi4OukKO
         /t1SnVl4dBDLfHltuyWd2J2x3RWHvtMZNnHAZt2vcFNCm82VzlqeZFe0mOxwxowoX++W
         ODF4FXJuTjBsKOqhUzCR6irVOM391pRiInqKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785862927; x=1786467727;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PmIiry7aZvfcYxK9grtKj+mdFQrBZ0Yxe0X8buy7AyY=;
        b=lIAw2Gdl56iApCaVWdMupK1ApTkCW/GP9l8v+3mQjEBeNRSe+Xf9Zq2rD6jJDciN+N
         kjqUfUpy2j/V4lXppESpBmyYRW53m/7DCET3v8Ix5SnoKJGv/UXx8qAqMzEKev+SBGbt
         W+5Un+zLZ7ibsniRXVufNUg4PMJwfvlueIS6A066u4aLPZb+POXWL3XHKI5t/13wRaEA
         DygcM2JtQckj+isEU/wY/guTkO7+KL0/1yLCKTnAP0HIzUT2zkLT41bThyF9ki7/G00e
         cRUp5ucK2hAzFwFStg0oFJOZ2K5jLZHkODDqgjaa/Y6PIsfF6LdTaBR4FMGQ9EJJfYEY
         Fk2g==
X-Forwarded-Encrypted: i=1; AHgh+RrvnbhIujHSyh4v0Cn2LowrhRAwb1o43flOXDDfRvRhCtQRaDZMmzFqOrWw94GYqb4N6mmlYV4XYe/UpUAoyeqL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz095jSG8ePGN0E/3TS7yRROeiQBW77aq9r5mvjIgKAss+WiGQG
	yV5Tv2qnaJjySG6wiAALnLTxtojPaVvPojDDHIohXI+PtJiUGrHWOa+iYALQobJwjN4m2cj7S8J
	nUD2SgOr1Kw==
X-Gm-Gg: AR+sD1358J1ELn3UrOfZEoxQBE21w9AiJOjROV/9plVTYPGcBuPGLMgHdjdIUHcFrf5
	JdK23wpv3/+XEYF9si+lxUhd9qGWLq8IxOc6xDDKopHxNR12i6025SGxzLQmnWm3eSjHJCPsyn8
	huvArdBPpKPBkIkYC+4kbTo03eIzOzJGhQkRbKlHbGXvgIFz2BlscrFyBxGhRB4nB5Z4fkCLFU8
	INsEODIBEBqTbxDTPpqgkff6aZcYUiW3L5tLsJIcQZaC/h1WkHNYh6iFKwnrD4EE89+hW2WpG/v
	dZUKHPL56EFlNO8dHDGHmearFpiXtBVyK9XM+QzPdosrjqZDIIPaLQX0vNi0BysA7btKbWzmVyh
	vocIPZdCATPejRZvWToSP+NdCaU9iTzbQ2tKUmT95nix0NjcCBNpBGHruiqx/abJLHtSNWAvlY2
	KF3ixFIaqp0ulIX+T0e7tlKzfEAJ2Byi3jMaQ0QxXJVUOHFJbRDUtee6j3FgF2hcmt6OEMNQeif
	6Dx4ED19AbK+BSLGBDEHrXDr1hNKC4qwF033Q==
X-Received: by 2002:a17:907:944c:b0:c20:191e:89f3 with SMTP id a640c23a62f3a-c20191e9d1bmr798461266b.16.1785862926685;
        Tue, 04 Aug 2026 10:02:06 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c203645aa73sm34411166b.57.2026.08.04.10.02.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 10:02:03 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15cd3fd760so14588366b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 10:02:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrLEJOv3FFlLPKcr1kfRGKiq+EaNTuetX3xwz8qAniXc/lQeP2KsYf0sIXoH0kiXgYWDJBPivOpeZldJf3XJdeP@lists.infradead.org
X-Received: by 2002:a17:907:d644:b0:c20:34de:5050 with SMTP id
 a640c23a62f3a-c2039afb05amr1859566b.7.1785862921642; Tue, 04 Aug 2026
 10:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
 <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com> <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
 <amCPBrdltFSE_fEf@J2N7QTR9R3> <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org> <anHuLy52o5S9Nlwp@lucifer>
 <CAHk-=wgJ0wO=T+1G5zJwoeE-N4bAptCNo2TFirK364iPhnGG6A@mail.gmail.com>
 <dadd8268-3cef-3a3a-e277-b593bef3b788@gentwo.org> <CAHk-=wha5um2rB9u7EDeEhZJyaWOUFye-wTKzsykQqJH41RNdw@mail.gmail.com>
In-Reply-To: <CAHk-=wha5um2rB9u7EDeEhZJyaWOUFye-wTKzsykQqJH41RNdw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 4 Aug 2026 10:01:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=whjfRaeYsAVS9VfYO5uaSB43sT7zPOmNWR6gC8h=t60=g@mail.gmail.com>
X-Gm-Features: AUfX_myV459rrh5aLothtZtKTDoxBGv6XJzHteSXTBWGF6tQ5Ts34uDH3FMsq0Y
Message-ID: <CAHk-=whjfRaeYsAVS9VfYO5uaSB43sT7zPOmNWR6gC8h=t60=g@mail.gmail.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Yang Shi <yang@os.amperecomputing.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org, tj@kernel.org, urezki@gmail.com, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_100209_651524_6AE43E31 
X-CRM114-Status: GOOD (  18.34  )
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

On Tue, 4 Aug 2026 at 09:30, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Because people really have wanted to make it a "this is how the VM
> works" thing. And that is very much what I object to.

Side note: it's not that I object to small helper functions for some
common case that a couple of architectures take (ie arm64 and s390).

But I do object to what looks like some kind of "this is how
architectures should do it". Because I don't think that's the proper
path at all. This is an area where there are lots of commonalities,
but there are also cases where an architecture simply doesn't need it
at all (x86 segments are an example, but so is any architected base
register) or might take a completely different approach simply because
of how the architecture does TLB fills (ie different areas may have
simply different TLB walking: the pattern of "top few bits of the
virtual address picks between different "segments" - different from
x86 segments - is not that unusual afaik).

And I think David is right that there are different forms of this all,
where that kernel text is another special case where some particular
architectural choice might mean that it's trivially cheap to do *that*
entirely differently (typically because you know there are no writes,
and no aliasing issues).

So I'm just trying to clarify my stance - I don't hate percpu TLB
contents per se. I hate the notion of codifying them.

For example, if you have a SW-filled TLB - which is admittedly a
horribly broken idea even though it feels so clean and nice and has
been done multiple times - that changes how everything like this looks
for that architecture.

             Linus

