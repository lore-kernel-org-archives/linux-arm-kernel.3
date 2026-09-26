Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96B4C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 16:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRtKYg0sOGgBmCELm1fPJpD8C1O0ubIGfHJNiovVGiE=; b=qWTwFN+QXvBFHN/DJh+x0lVuCn
	VNTQg+GAcQXID0YH2nvYdGN2EEB0zztUhWmpbJqxgXqp4i08TNtV7D44Yy5reIacemTDroNIMWKhS
	agor2y9t7eX+w0j+aXaVO55w4uE65xhdKzm5IwkFSzN37/oXOw7T+XlIvX8D+JlFKb4mPS9lPs2oG
	raMqECxXGAABSAoo1d/67hfIXLQGRO7C88Qm+tV7NbS3VK9v8bgqEfm1eE2haPenOb6SFzChaIId9
	gwSWV0wC4+WBS16RzsALLLeKJnHwQHqWrT3n0mac4AaDHhSkBPcrY4ZdAUhxvw2lwjoWOOwjKhlsB
	Gjqorh+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAV87-0000000FduL-1Pu1;
	Sat, 26 Sep 2026 16:20:03 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAV83-0000000Fdtd-1W0B
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 16:20:00 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so9173715e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 09:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439597; x=1791044397; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRtKYg0sOGgBmCELm1fPJpD8C1O0ubIGfHJNiovVGiE=;
        b=URwEeoug1Bz34RizGbqWoe6STu1yv4ZWGFztniQnCl2j3YTh5RoyICrqLhraAOrzRZ
         QDH4wWMZytO2OMP/wi4D0s5sB8W5EjRxaFBzxNAMY56Mv1Rs+Fo90YFzqmaiA/mHgPpB
         YDlqAkUamcE4eLlcQU4D2Zd0zod+J/k7uwPp4wPerYsUxbSrlA35Cnqk9o/8A1SDnP3y
         fhrM+IMJ7n8+NqQ59otgMj++RQu1VWSPy07MMw2m3UxFwVYSNp0A4xlerhQpNkr5Ciei
         +qbsvPRNDGUHnnu5XfAxGuyw/hXX6XrpPXMqUWhv8xzLj7q1/ejXbKGyulbY4E4WttX8
         SWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439597; x=1791044397;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eRtKYg0sOGgBmCELm1fPJpD8C1O0ubIGfHJNiovVGiE=;
        b=w5IvXAuR9D1lPeHVCGCBgT6q5xqQnwaMn5fECUzezII+porqEZ1tVqN9/TDMNHdqfL
         qtdyr5mj0rE1PbuK++jUIwslo38K5d3kX4mPPila0roeHxhdrp5wGJk0gcK20e2RcdwB
         uS0UyDCY3DYYjhGEeqy9wXGADfVL1HVgEItluOzBfuRUZcl2icmEq3PxSq8Sjsr3H8zh
         iKNFrAjIIxd32v7xBFAu2zcEbZtUFGz0YOg2hTeZTPtHkQhXGICJ95yteVqOPvGkPABg
         t+nED5WCLm7n3PAW4RPVmhYATKMXau1Md2rstsdCsKewee220MD+OoacBjRZ9+ERVHUo
         RVsw==
X-Forwarded-Encrypted: i=1; AKwUvBz11q3+hqEQA5ytJryASIlSLnSv8JLScPZtVyHDogK/lgEpiCxzG3QBc7Ba4jVcCs1X+F9sHxycbGURox6n8xe3@lists.infradead.org
X-Gm-Message-State: AFuF++kJmHTy3Ou7979JwUdG/qgRCtnjAFMVDG0WG959k6/Id4T5BanG
	AgJi5RgDJvEHFS35mF6Cb2ErRQBzZR3noES4JffLvx6AhgDIBkK5dl2J
X-Gm-Gg: AYBFou2U8j3Byzha0qzbC21o0Q3E8iKdPtWhOWyq/9vcQa6Yj2w8ASzZMuCgwCtLwkz
	0JDgPygSMzpfXEOI8LojkTw5umNY6AnIsITu2WyMqfDQHRwACqKSGPVfBzZqZO1MHUMXltdQcXg
	u5SYZquG0zOffXhf+isaUHof8Yum4RyQnH6r7QNGtz274IqwoAaVBeFVaG1ha5RjjIPkNy96nXU
	55fMRiFMTl9EXhI7JGVOZxbralp4gdXoCkTZUGjabm8TZcwnkH2hT/EkU8zT8p3VZsgp8Xi+PYK
	g3ADWTmXHNo8dUMlDFNSHTaFExqaBTc4zLwkM/KxEn0fDJBkEXxCV4O4IDqbK6xfqfntYBHZtY8
	N1ZMzlgophBwS3fpQ9cYuOPfJSeJoQgO2/W6Oy5ISEgkWCIcKO/a+cIhwn5Fang7gA7dfi3ReAq
	iBhiNqRiiC8YsFHFN6MSGhYOdpACaSaq38OGZK1K6FfpaiooAGjesl8CR9AitqlqzsvT5yadvl6
	kItjGGzFZic27wnl91EiRE7oXSgKFOfThzDHJcCJBXdBy70TBxYI/O4ISaityBPyUrS250MwzsN
	sTe6IRQr23nHPpUVrmooN2/h01axXSBzD9rOWTIliPJhTDYB3eYC+L91GcnrcTKcMT0zvd8NYOQ
	XQ6JM
X-Received: by 2002:a05:600c:4703:b0:49c:fc6e:a3e1 with SMTP id 5b1f17b1804b1-49fe66fd374mr152026325e9.32.1790439597094;
        Sat, 26 Sep 2026 09:19:57 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b162-c701-4960-a998-3de8-2fce.310.pool.telefonica.de. [2a02:3100:b162:c701:4960:a998:3de8:2fce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60da94sm102924275e9.4.2026.09.26.09.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:19:56 -0700 (PDT)
Date: Sat, 26 Sep 2026 18:19:54 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Muchun Song <muchun.song@linux.dev>
Cc: Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: mm: align hugetlb mappings to the huge page size
Message-ID: <arfwK6XInu-S9COc@gmail.com>
References: <20260901085740.66283-1-kmehltretter@gmail.com>
 <5AB6FE85-4CB9-41EF-A700-BC5E071F29F5@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5AB6FE85-4CB9-41EF-A700-BC5E071F29F5@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_091959_419185_29962E8E 
X-CRM114-Status: GOOD (  11.71  )
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

On Thu, Sep 24, 2026 at 04:41:30PM +0100, Muchun Song wrote:
> > Fixes: 7bd3f1e1a9ae ("mm: make hugetlb mappings go through mm_get_unmapped_area_vmflags")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> 
> Besides 32-bit Arm, the same regression appears to affect MIPS and
> SuperH: both support HugeTLB and provide custom arch_get_unmapped_area*()
> implementations that only enforce cache-colouring alignment, not the
> hstate’s huge-page alignment.
> 
> Acked-by: Muchun Song <muchun.song@linux.dev>

Hi Muchun,

Thanks for the ack. I've now submitted the patch to Russell's
patch tracker:

https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9524/1

I'll also take a look at the MIPS and SuperH cases you mentioned.

Karl

