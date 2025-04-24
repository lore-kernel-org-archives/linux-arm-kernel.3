Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9DBC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 09:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuZT78P9j7k7WzwtAOOSjzKOIc347/p+7AmZquWPojI=; b=aK7L3n438ENBnefpFVPhl/1iFN
	GofUIlWOAJ5ni73ttBYSMM+1PzcsPGLQiSwaj0U3quyWGjjyy9C9J4fswuP1kVrhBYRI7B5EcMEIa
	H/loklHWlDGVRzHB30jLRUtf0HwwJEvHGeRHvKV7oFHMpWSy69oKkLskQH4qdOT2SPArYfWU40xq0
	0loJnaYB5PyxoZAK0VsnSxgSz79fuvz9+Neh1+mmfi4PQ4vIyymmYyYeXrc66w+M3gm29YTLTgnQI
	+mdiPyH3NMMQCKvJFTlU+HhE3av6Be4UQVyYG0/52kK1ZAt+LeIxaWFmn5nvqjL1BAJKGPLoGS26l
	iqr2hIew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7smf-0000000DTvg-22k8;
	Thu, 24 Apr 2025 09:22:17 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rbj-0000000DHJT-3ioY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:06:57 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7c54a9d3fcaso78613185a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745482014; x=1746086814; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuZT78P9j7k7WzwtAOOSjzKOIc347/p+7AmZquWPojI=;
        b=IoL9zD4FuguGPlOUyUH3emcpFRsPjQprBHxIpJU1XOCFlqgNH1jbrsoer8BGNXMnzL
         qgGF+lQ42it+WwQ8da7JEzlpeaPiU7s3rLBrbtkTVwVwLHV7k4wgdb41gA05ho/bVVwJ
         lbXs5xe5pBe1MagWyKLB9JXCJBeUkWa+lQ84fpI5fm8F+Juks1+hFB+Fs91pG0vhTPvL
         BVon9nIdrIHVsYFv0gLyys7FnlHg4jLDTNNLRHtnqMMV4odjW5m5987IILBDgxu6KI9H
         8uGHJ+9S+E+T3l7NOGWmg1f2SxbZStoBae4rWa8zhJLAIfqRY8ydYrNzU+OJclvH3rlL
         RmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745482014; x=1746086814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuZT78P9j7k7WzwtAOOSjzKOIc347/p+7AmZquWPojI=;
        b=Z7cLlN9/g1XteFEVlAGoql0LOolZ2YuOkNwxyJvYZ14K8/O0vw9tbjxJzTqseTilW0
         oXqxBd26XaNs9PK17xopVe4D4bNBIn4a8NXiNniltDiVWiRhRJU2TflLR8JFUvGxyupH
         lJTObRr5HjAc/svhz7s3MOotk2aid69IX6l4PwJnaTzi40IraaHVuUGEPIvurrLZl04L
         iedigTc//T7Yb0BWTwkdty21oQ/SqPOy54dEq3dBGyAqT9uzjTriZXP2iHQCYEpBXwiX
         vBcTrIqpN+SPgJzEx/ne6px9Qbv8qGrVhe4wlOlemTWZFdXlAYdNImxPsLjTO2SW+wAg
         S3YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSGCDY1huXByyAkgFqyh9/3w1RKZq3Oge6Fc6biz6skUd5nR/EoKYZH/5gaua/s2GKGReDJ+MX6WRGl6IRSPUD@lists.infradead.org
X-Gm-Message-State: AOJu0YwRhmpCbnudLpASORQrHmUlkEoqIi58N0GwxEXXdimgcKTYPIcc
	6/gQWhSytLGJ6b1JseRD7zKejiYuir1bTUmLw5CMzfvJhGV1NYbTQ84SHvWnJFZVwD6q0hMzx5n
	V1N0k42InpPGXUxaUYwa4idiCJ+c=
X-Gm-Gg: ASbGncsT3kAWrVJdhxNK+ng3oJvNMSnauMl77WjqarlinXPvMhjvsQZrrRppj8KHzE0
	/aIvuX2DLc76dIYkVTZjKkyEdRNE1I1UZO7dEL9Cn1GAPjwN8A0u//dvnjC75sPqlLzMuEx9TMh
	9eyackb6m9j2KM1kjyYowNiMiCGC+SIfRm8i1WF9mScCWksPS/JC7TR6c=
X-Google-Smtp-Source: AGHT+IEhzUA4oc+V3w2NjT7UrZcmGzkKTQD1CxM6C7Ok3vwwIKeFgj3Pi+wnsvImCZYWj5yHmRpA8SR7e+Hur2BVZFw=
X-Received: by 2002:a05:620a:f0f:b0:7c5:588a:5c1e with SMTP id
 af79cd13be357-7c956ed7552mr250436585a.30.1745482014365; Thu, 24 Apr 2025
 01:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250418-via_pwm_binding-v2-1-17545f4d719e@gmail.com> <yscledgclp2v4p7djwrszbc3dnqifkcofky7rugkcip7o2rmof@xljfd2kfyzzs>
In-Reply-To: <yscledgclp2v4p7djwrszbc3dnqifkcofky7rugkcip7o2rmof@xljfd2kfyzzs>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 24 Apr 2025 12:07:03 +0400
X-Gm-Features: ATxdqUE5PElP_sYDeMINZqZeeEsmfYCVkfJRWHY7GCzFKR6syg3Z1uN61FCNNqY
Message-ID: <CABjd4YxK+4kEeS_tKBi9zhj85y6U1Dgi3nJNuQ8hfkeoY+iK1w@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pwm: vt8500-pwm: Convert to YAML
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_010655_927979_A5C0A7E1 
X-CRM114-Status: GOOD (  17.45  )
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

On Thu, Apr 24, 2025 at 10:35=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@ke=
rnel.org> wrote:
>
> On Fri, Apr 18, 2025 at 06:55:07PM +0400, Alexey Charkov wrote:
> > Rewrite the textual description for the WonderMedia PWM controller
> > as YAML schema, and switch the filename to follow the compatible
> > string.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> > Split the series from v1 into separate bindings patches so as not to
> > spam all the subsystems with unrelated changes, per Rob's suggestion
>
> That's a good suggestion.
>
> Applied with Rob's R-b tag to
> https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fo=
r-next

Thanks a lot!

> I saw you signed your patch using PGP, which is great. However I didn't
> find your key. I recommend to make it available on keys.openpgp.org like
> this:
>
>         gpg --export alchark@gmail.com | curl -T - https://keys.openpgp.o=
rg
>
> and then verify your identities using the link in the output of this
> command. Still better, (additionally) add your key to the kernel keyring
> (which however requires you to be in Linus Torvalds WoT, see
> https://korg.docs.kernel.org/pgpkeys.html for the details).

Hmm, I used b4's built-in patatt functionality with a dedicated
ed25519 key, not a gpg managed one. Looks like keys.openpgp.org
doesn't understand those directly, or am I missing something?

Best regards,
Alexey

