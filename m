Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7A410F994F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 15:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oB8sWft0bulZQQhndjF41bb2A55hZmeFDzZlsmEc5U=; b=yTwdM+aIh4Pe1eo4Y6KiOby3Me
	isfdU9NJ5c6pB6mfZMCLBZNpaiMhAAClVvPuW7iWokGXjphNH0AmtFPuS8qqRPhXZxvr6PlDdfJrX
	Po2Tnw794I0fg+FOwgmHGeYpwg+aJtfACApsuKHQ5qguejmIGdz4I4bNMrYVNi72/mA+CcACDs2Xl
	o5D7VBPH5z3F6heNonpyS/BmngZMQxoxQNKsiQfj1TIDg11rb3UKtebosVPFPNCGxkILXBMCiPXj/
	fVGlkfrZp6fTKMeeXNlpuZlcjUjlq178azaDh4kD9WO6SI5e/0OcwsFkl495sY16UTS33Urawg1Lh
	Eqr7SCOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAUk3-0000000938l-0BpM;
	Wed, 08 Apr 2026 15:22:55 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAUk0-0000000938P-1dCG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 15:22:53 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b8f9568e074so1093299366b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 08:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1775661769; x=1776266569; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6oB8sWft0bulZQQhndjF41bb2A55hZmeFDzZlsmEc5U=;
        b=Enly+UTSkkVNP6RIOfGQZ4CdOMXP4ckTOo1j4F0NnyWVowG1kNW9T0KXB2iIOld9Kx
         TuENnp5XS3LlpHM2ik3Ui03+KLxIUkGaGqHUU5VIYfJ205CKPFlt+fiJYOHHXKL4q8zL
         ZqbvjWNGLiV48lt4aXw1CbbxRjZ/T0v7nAQ7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775661769; x=1776266569;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oB8sWft0bulZQQhndjF41bb2A55hZmeFDzZlsmEc5U=;
        b=aznQxV5Ga1XsKQaqPdMhNUlFgySg3PIA0yu7Uop4XcAp3Y3DqhCkfIW4+spKz450je
         sYFBXH6mxpwHf8GGTRE1n+/uzv/p3C/8k3RQ6dot7PJVgpU+V4YOi1Rv84i9Lw2Rpxu3
         Uac2U69cphtTcVzhua79CaKORK67HN6j/bZ8XXY+a8Ok7W/qLU2yf1/Vq8V9SL6tzdYS
         oSkL3/um2Pc1GfcU4gJZVhtryc3Rf3VRMcfzUKWoJERDdfCAMjKN6SQI5biZbBwibRhk
         1qkPocbTGDxowDG4DUeCjoONJaeCBHtH3voabwf1Ccs6TqE/g/I+v96Gvq//nrnQOkWr
         Vb3g==
X-Forwarded-Encrypted: i=1; AJvYcCV21QqBwmtfU9I7dQmm68P0MrazQpNc4KNbIibvelPfEiJJcUU9OhNseARjNPqIwM3OrC+X9Ldxz30obnHUt/Yf@lists.infradead.org
X-Gm-Message-State: AOJu0YxBUlxdV478cXiicIACJgClsQEqj5OrOBixujehXiKxcCBvlv9g
	dd4VdDveS/cKXy/qK4UOLzWlOQzMNirn6OsNpvJqvpbLq+vSOMgpqGp/g3efPn0g24qauPDcWkT
	bJdlwHdw=
X-Gm-Gg: AeBDiev5BucuplmguT3K1ZERqaRmF4baUFJwILQ8XpxukuXUyVjgaSbwKym5F68mD8E
	G6JN8P48VG3OmLqP0iwIZcLvgoZK85I3Fufa12GVWH6aChLS62yMAtoti3f381WEnmepjJIr2a/
	91e3aWPGdwFk6JIvNP9f14ayOgIMXh3W685VTJ+09gY/YWmq3ByjeNF8r1RGfV1Q5wzYRJASnO4
	3ukP2WuLfNAC0lbSIHq4Iv4Cbyms3yTnKH4PH99kP0hqv/JnpGsD9aooRoYzBlCPahLchYpYoWk
	Qvks2I9CMIs0Zu0QyozZibJt7mosmQaJxGqkEGYUOegfM4QDZ5cs9jewQ1T5KMAHwilSVO/iC7o
	f4Rw0SMvsYZCN2mt2bxTv9fMyLlf4f8zETz2ZljRGs8Od60ttUGX9D899A3DOoYfabQsDpvAJqv
	l9PG42sXNhDT25IGuKsUiikrehSxt7VnsM7zYOV06L0zNnzoB/cup207die9CMqa9bv+BwlwiJI
	Er/zME34+k=
X-Received: by 2002:a17:907:97c3:b0:b97:992b:8806 with SMTP id a640c23a62f3a-b9c67422993mr1154116866b.11.1775661769453;
        Wed, 08 Apr 2026 08:22:49 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c97229esm648695466b.4.2026.04.08.08.22.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 08:22:47 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66d24c6963bso11261448a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 08:22:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8eNSU6myeSXSJYzIiROWOWXdXLNoHrbfRz+2q+sGtUahEX6/sXLFskHBEmxXhGT1lgfVmeE8Qpc5ZRIJiwMPj@lists.infradead.org
X-Received: by 2002:a05:6402:5305:b0:66e:aadc:2021 with SMTP id
 4fb4d7f45d1cf-670047bb29amr83427a12.17.1775661767544; Wed, 08 Apr 2026
 08:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <adZTGOjjJrVJOcT8@shell.armlinux.org.uk> <adZfTi3R6jtsjXx-@shell.armlinux.org.uk>
In-Reply-To: <adZfTi3R6jtsjXx-@shell.armlinux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 8 Apr 2026 08:22:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7+6Q5ptBNp6UGrNbgbk9jr1vsY9mJ5O3mH5RPjpBggQ@mail.gmail.com>
X-Gm-Features: AQROBzDMX29dK6Ob4UI8k1Dcez-g32vHwaiLrL1sR7wyjWf7zr7a7LiEfyJC2DA
Message-ID: <CAHk-=wi7+6Q5ptBNp6UGrNbgbk9jr1vsY9mJ5O3mH5RPjpBggQ@mail.gmail.com>
Subject: Re: BUG: net-next (7.0-rc6 based and later) fails to boot on Jetson
 Xavier NX
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-ext4@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	Andreas Dilger <adilger.kernel@dilger.ca>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_082252_726886_C67B2FB9 
X-CRM114-Status: GOOD (  11.88  )
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

On Wed, 8 Apr 2026 at 06:59, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> > Now building straight -rc7. If that also fails, my plan is to start
> > bisecting rc5..rc6, which will likely take most of the rest of the
> > day. So, in the mean time I'm sending this as a heads-up that rc6
> > and onwards has a problem.
>
> Plain -rc7 fails (another random oops):
>
> Now starting the bisect between 7.0-rc5 and 7.0-rc6.

Thanks. Not what I wanted to hear at this point, but a bisect should
get the culprit if this is at least sufficiently repeatable.

The exact symptoms and oops details may be random, but hopefully the
"something bad happens" is reliable enough to bisect.

              Linus

