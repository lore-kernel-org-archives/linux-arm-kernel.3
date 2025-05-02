Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644C7C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+qzGYQVD+m8VMlSDDggqEimDlE2nd4dP5p1ek457P0=; b=s05VTuZoPDkx90LLjHx/bT0cxc
	IveJF5DqgxBNhwlgXk7P+z7JsM6WefEa7oSDg5250vPZf6ADxwEZyk7KEst/ONMEXTAxw1D+YmDb4
	ttgoth1SE7+Il7L6+MGbEC0k/kGMs+ytilHmkt9ufQzZS7LRClvs9EhLkYKhfqcJ7w93Vs2dYBG7y
	ONblTeRhE3fcAfodxFg8NrBW65YQCuLG+a+uZXvXFRYlD245Q5h+uBZXeABVwLTJ6WnrS19Ba4Py2
	EDNiavSqcr8cqzS+x3JHeWhX0KSrhxPNzRytECUBdrzHgrmXOiFVivUxJUdOs3oFrIvt+QTMdv0y4
	5Ax8bMdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAuco-00000002isG-18Wf;
	Fri, 02 May 2025 17:56:38 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAuYz-00000002iPR-41kP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 17:52:43 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-acb415dd8faso344457266b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 10:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746208360; x=1746813160; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L+qzGYQVD+m8VMlSDDggqEimDlE2nd4dP5p1ek457P0=;
        b=MZXz3/sOfgFieDLV7HOi3UEOylgaV4M0Qi7650H50VH5vGBvDxTVdSPmO9gTwEAZtt
         VxtpZ4QDUPZCd8DvKgRnaQv88UUNCOS5ZZGF86IgqjU6R0eY3Vz3d52pgOMvw9hoP51p
         F7IGw0r2vCGH7YKaVe7j+zfakynT6PZ3V8IUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746208360; x=1746813160;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+qzGYQVD+m8VMlSDDggqEimDlE2nd4dP5p1ek457P0=;
        b=e6Ij3kp8l0Opg1KUs/COcdKtoLYXG29qpSYS4av9OR73+qhM9LZY0GRVeg03CgJPje
         xevvr0ZKW6IOdI/PAYmqt+YHKAt4XqDeB+qGg3dI5sftqTGb4bQLUg5JnWGOEkVDLgJ6
         X0yKvEWHMKBbJpU4JJrWnAaHWyio0ZzEyo5CvO2+CaHa+FVe/v7OfFkLwyyiBavNog+R
         Nk4HkmF8e/pPqCpBEEdrM91S5pGPwQpeDoP05avRSqu7uXqOBfmKzoLEHgCI628p+63O
         LaobYDTFRC/3SoZpXnNrmGmLIVJbh+E2lSXGN8DYD5xEV74E24eFHWHS08fs03+graqz
         AmHA==
X-Forwarded-Encrypted: i=1; AJvYcCVLsH2Qy16hNTdy51B6EIIE0Mlermhxxo+FVGmNOXgMSSHRu7qAVrE4BHh+eA2+NPAdcvNhaYMxhNQNLXXSa+N6@lists.infradead.org
X-Gm-Message-State: AOJu0YxNxlV/cZVUOdDykRrsIH/SDOrh9v7CmBFsQSF56bKNT7ztFbtc
	D+v2BpnMn0EaZZF8E6VEJybmpZYB1W0jocC2+qr8a3hHkm+NYROm3AXl3m/uAkfJukLv2DtUgUW
	sBa4=
X-Gm-Gg: ASbGncv3omFtjUpTiLIBKSFfxLe6/N6xwGzfj0158Jyaork7pAWm1qWfm7I0KL92kYd
	0p0PpKroHl239aWJBPFlL+j/ri9r6woCavEnVFlDYyrsMwTtiEEyCQ2Aoa0zh3KlXetRtCAanqW
	vnlNU1Eqttun2ZoHVk9dt/6tzidzkKthAeCeMx5aaqPnM5vJLwP8hqQZJNRKOfJGLuXTqWpwYha
	gqSyS69eC4pMXZN5A5Xe52V84l7O7vDtWivCoUmwL5kJZirMTPQwcGJs/suIFoJ4+aL2Pk/RSDS
	hkrn3BJ1uyQ491tcJ80tqWefVoauIngAwVWlzsUhk0QieutF5vmTfzJKWOqNiFXrPyD3klsjXNn
	s3f5fVtXzMXVEtRg=
X-Google-Smtp-Source: AGHT+IHPrpQU4XBwx7zcGz2liRMOTMNnn5JdlLpzxBVxCFUAC/udZCK4VEH7ISrqeUfQPkjmlPpmuA==
X-Received: by 2002:a17:906:6293:b0:abf:6d24:10bb with SMTP id a640c23a62f3a-ad17af23225mr291581366b.44.1746208359772;
        Fri, 02 May 2025 10:52:39 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c01c9sm79625166b.105.2025.05.02.10.52.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 10:52:37 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acb415dd8faso344445566b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 10:52:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXgtSsy1nXdTYYLqSfLeOvl6d1mH0iwo+SAErV/yEKhB9BNRyQ7PUVNZnW7ICo9IuLJ5hSerfhQLPXAW+E8Ctt5@lists.infradead.org
X-Received: by 2002:a17:907:728a:b0:ac7:d7f3:86c6 with SMTP id
 a640c23a62f3a-ad17ad3a86cmr353817166b.9.1746208356936; Fri, 02 May 2025
 10:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250429213817.65651-1-cpru@amazon.com> <20250430100259.GK4439@noisy.programming.kicks-ass.net>
 <B27ECDA1-632D-44CD-AB99-B7A9C27393E4@amazon.com>
In-Reply-To: <B27ECDA1-632D-44CD-AB99-B7A9C27393E4@amazon.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 2 May 2025 10:52:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgb5WcfMEgsOQg4wzVWuYNgCL-e17YX33ZET_G3-ZCo7g@mail.gmail.com>
X-Gm-Features: ATxdqUHYMChzuFnxzpibzLtkTrwHUQOJbZWvS4aZuUPZ8wK3AkEbViB7psNkIbY
Message-ID: <CAHk-=wgb5WcfMEgsOQg4wzVWuYNgCL-e17YX33ZET_G3-ZCo7g@mail.gmail.com>
Subject: Re: EEVDF regression still exists
To: "Prundeanu, Cristian" <cpru@amazon.com>
Cc: Peter Zijlstra <peterz@infradead.org>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	"Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>, "Saidi, Ali" <alisaidi@amazon.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, "Blake, Geoff" <blakgeof@amazon.com>, 
	"Csoma, Csaba" <csabac@amazon.com>, "Doebel, Bjoern" <doebel@amazon.de>, 
	Gautham Shenoy <gautham.shenoy@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	Joseph Salisbury <joseph.salisbury@oracle.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-tip-commits@vger.kernel.org" <linux-tip-commits@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_105242_072610_045E2C6E 
X-CRM114-Status: GOOD (  12.92  )
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

On Fri, 2 May 2025 at 10:25, Prundeanu, Cristian <cpru@amazon.com> wrote:
>
> Another, more recent observation is that 6.15-rc4 has worse performance than
> rc3 and earlier kernels. Maybe that can help narrow down the cause?
> I've added the perf reports for rc3 and rc2 in the same location as before.

The only _scheduler_ change that looks relevant is commit bbce3de72be5
("sched/eevdf: Fix se->slice being set to U64_MAX and resulting
crash"). Which does affect the slice calculation, although supposedly
only under special circumstances.

Of course, it could be something else.

For example, we have a AMD performance regression in general due to
_another_ CPU leak mitigation issue, but that predates rc3 (happened
during the merge window), so that one isn't relevant, but maybe
something else is..

Although honestly, that slice calculation still looks just plain odd.
It defaults the slice to zero, so if none of the 'break' conditions in
the first loop happens, it will reset the slice to that zero value and
then the

        slice = cfs_rq_min_slice(cfs_rq);

ion that second loop looks like it might just pick up that zero value again.

I clearly don't understand the code.

             Linus

