Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C6BCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTt8+FqwI8Ns9wpiK4xWzSI+WicFqajXJHIJZoU9cx8=; b=zxZdkwF9pmT2V5nJ6Ohoj8HQd+
	6sPzt5IhCFNonkLiS66aoiO5wmYCsdmYuKAI3aF47PzsqD0+A35gwdyRpUyvQMRPQomRnomngdBon
	X1aQYcwqNadf4HdjbYgGYCWs4wsuF0KGoCW7pLoaaTw7vd17H0wX7Bm35XO33CKp9JUqyO4XTuNc6
	1jW4/vWJ3leWqX38EU85CJYRbXb21IbmX4TZB78sbZLxIHGa3HPHKoQDTRoc9whcfaMr6IiDiOxlc
	78xi2YOn1h7X724ifE0aqimGO/hdMVeqYM65QMS0ZB/v5cBbTeQu6S8bOedSuwErgcyFO2RZE64o5
	ZSGM64Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVYu-00000002KkX-2QqS;
	Wed, 22 Oct 2025 09:55:20 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVYr-00000002KjA-3jCf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:55:19 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-88f27b67744so885842085a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 02:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761126917; x=1761731717; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTt8+FqwI8Ns9wpiK4xWzSI+WicFqajXJHIJZoU9cx8=;
        b=WqvBoXBXD3biehLllThtKSddHNHFusDcZouqu0CH8HQK1BbMkPCsxdhzLFOavcmiyz
         0GBeFCty5NU3HhBVIFyhePHamdiqWPPkR6JVcOajgV57OVj1JWwDG8E7/A5MDaQcg0U1
         tNLGVSfrspmTD92ojX5karG7USfxngzFrEVv70iulJdEY5N+YCwi8e+Mi7y3uSBBAQPQ
         hLb/hPOB2vwVPuk42ryXoBVX/Z9UjWoFOPANMObOPcW5OLGC9cWtPX9M7F+Qqw9MKNDD
         F3KLa0TcKpTZCuKk4lRCYN+5zzUVHxTvXjbogmPmV/mSUSpgub+NIxO0Jft09JgNTEZA
         rgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761126917; x=1761731717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTt8+FqwI8Ns9wpiK4xWzSI+WicFqajXJHIJZoU9cx8=;
        b=IqT5eXoTqfRLJ4JZV4t7PuJ56yQx+JcTZUJcliDM8onzPgxkzYroYnpNBVHN4rSgFY
         b5W7wtZC7AM+oReHlMMX5oq5fGAoEZA28FMpWq3v4QKHDHZz9+8ruLAH0wjjZeqBtPqJ
         Ts9q8xh/r/wD4tfIczeahqgu3yc8BCfo1/1zBQ54RXRzO1Q0IqWwa18YAFBvQbe4gcgl
         HsPFmH7UvOLgq6EPYCa0wA8/+chFG3pSHPUuG8NZnLgxJnzXp6jLg/WthT5j/ndQWQSQ
         4qyKW01KXA9Qw6Znt/YMh0LQUQHY6lkjM39cMtiaHk1xFvog9TUcZWBlj4XcZNi4qihM
         hY6w==
X-Forwarded-Encrypted: i=1; AJvYcCXJyGFVagVRcVIYp7ZlKvx0d+58b2Yaxsq0KAAu9PIZCoKiGU6MQkW7rDJ86FtbNH5KkqKFJFaczUGKyyFKmX6W@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0jpeGLjrfseunFs9VwryRTjBtwVKOzKFNG0Y3k4ZF7rtnMYR0
	o94Yw34/IrQEiQt9E8go2zCJF95ePv6lG+8WSNo5N9yvoolslOoCY5Le/x4tpcqA+vqV5+1aKnB
	HamegcNrK8Tf7m4vhplM6WkawLiKEjd0=
X-Gm-Gg: ASbGncuV5ppaTD/nWCm6nFVZM6+yQjA9tBCPMJ+FG2Yww29Voahr4mTBkrx1HdnJEhB
	STXPJPoEOe1dtlHJrGBe/VFj7rfHK/vuTHcx4adIfY2XdsTdFB1IqpXZFvFMXOrNv2e3Z/QyzSi
	RauXFyhlVufnycz1PAVTbNZmDZkhDoLFif8tRJHTRGgrqnk8XLxUj17HS3xAs2ecEM5vhuEdkbR
	B3qpRKwaD9Ng3oZ8xesIstxzaroAwk6ewceJ6X3TmE9kLJrZJMb3Jf9CpkWIsvZPnzjcJ1Zjt/f
	U6+ZX6wY6yHdDaLE+QnHeCYZDr8=
X-Google-Smtp-Source: AGHT+IFyP3YEd3jiEXUOevWyPggxevKHk8IGuxzG+Kc4aIoWgx3n9rH56kmrDHtPes/bm55BDKJ06bfA1HQys3hLS2I=
X-Received: by 2002:a05:620a:1aa2:b0:84b:97c2:4f27 with SMTP id
 af79cd13be357-8906dfded57mr1887986085a.4.1761126916473; Wed, 22 Oct 2025
 02:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251013092038.6963-1-ying.huang@linux.alibaba.com>
 <20251013092038.6963-3-ying.huang@linux.alibaba.com> <CAGsJ_4xaA8QRjP9H=n1hQfEfGop7vOd5Y=J+KQzuOyfa8GK-kQ@mail.gmail.com>
 <87a51jfl44.fsf@DESKTOP-5N7EMDA> <CAGsJ_4zPH0fwBOLQwh1y6jG3tCXHLGRCTyVVSCWb+NfLCEMV0Q@mail.gmail.com>
 <871pmv9unr.fsf@DESKTOP-5N7EMDA> <CAGsJ_4zW6ogVdi=t9JCuvGD9N21mA_ORXRCakw4Av68d9n+DDw@mail.gmail.com>
 <875xc78es0.fsf@DESKTOP-5N7EMDA> <CAGsJ_4zKGS-Xd-58ufXGoyRfaZWd8wTgv0b6ibHJ2aS14mQqtw@mail.gmail.com>
 <87a51j6zg7.fsf@DESKTOP-5N7EMDA>
In-Reply-To: <87a51j6zg7.fsf@DESKTOP-5N7EMDA>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 22 Oct 2025 22:55:05 +1300
X-Gm-Features: AS18NWC0tC5R_nmZzildYKBiK0mP4MFijg1oZBWOAHCcOJkrnfuDN46LvjeO47c
Message-ID: <CAGsJ_4y32i3aNYPum=8J3_Kt6vOSisr_jg6btB-YG1uQBqHG7Q@mail.gmail.com>
Subject: Re: [PATCH -v2 2/2] arm64, tlbflush: don't TLBI broadcast if page
 reused in write fault
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Yang Shi <yang@os.amperecomputing.com>, "Christoph Lameter (Ampere)" <cl@gentwo.org>, Dev Jain <dev.jain@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Yin Fengwei <fengwei_yin@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_025517_933332_262E1F38 
X-CRM114-Status: GOOD (  10.87  )
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

On Wed, Oct 22, 2025 at 10:46=E2=80=AFPM Huang, Ying
<ying.huang@linux.alibaba.com> wrote:

> >
> > I agree. Yet the ish barrier can still avoid the page faults during CPU=
0's PTL.
>
> IIUC, you think that dsb(ish) compared with dsb(nsh) can accelerate
> memory writing (visible to other CPUs).  TBH, I suspect that this is the
> case.

Why? In any case, nsh is not a smp domain.

I believe a dmb(ishst) is sufficient to ensure that the new PTE writes
are visible
to other CPUs. I=E2=80=99m not quite sure why the current flush code uses d=
sb(ish);
it seems like overkill.

Thanks
Barry

