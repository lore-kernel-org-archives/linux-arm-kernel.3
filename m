Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944BDC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 11:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVtlZkuDGXxOI8toXmO4w4iQku+tgCpTeAvW2uxcMZI=; b=bRDreoqlzSbVk8F77Hc7eyR9HQ
	NWGr1pvRG+de4Q5noonjYqnmvoi4Qu9vbkhgiCFdmnfNu+Sh9vI+i1+jzr1HHIZ++53UpcaojcTV7
	tYeTk3AtUBzjilI3tfek9RnN4HAnK850TqfWJvquizhu4HkLJLSCd/RKfcjNKc3pWsLfJaYcC1GvU
	mehted0riw/ckGe3nI1UnvhvLl3KgzUYOPSlXri+pSeiqsi+3zSHRXUW+N0gGHshEncAwUIBdHO/J
	u240MyW2SVcA+FYWpvwIA6/rxuMZZOyVHU8ESufO1OoSA/C1k8AWCzZPFRJlrIy7w4x1utpV2hBf8
	Hjv4Z3qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2oFU-000000040Oo-037r;
	Sat, 05 Sep 2026 11:07:52 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2oFR-000000040O7-2dFk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 11:07:50 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-482e067e908so1672739f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 04:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788606467; cv=none;
        d=google.com; s=arc-20260327;
        b=PR2uVG+ftUlN31jAxubc9CojiOcL7OLO7TiL+wJwXHoXIpxiNM2cG0n1S7TyIXpEtA
         uVbMgrydmrpI2JSZgEuDN3oIc2VBL5yvv4SkVEMAvUGV9kfpobTIfDrj0U3t2cUByBmU
         w0rW2co2y/E3z2kUa502kQBVsTEDTF/ikRKAFe+tJDEh93JIle8C524E49KWyp9+sIdT
         dPl9wJpavIKCCFOkgzzi/SMjPHSMphMn8egChwZUWxx5q9ZlV7LHhY0lrk8COZxL8LZd
         kpqTo9itTPHBeUInngVySQI6UlLmekjYqEVzTsN92+bOiVOo000i59Q/wflzxSm55rxC
         hmtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WVtlZkuDGXxOI8toXmO4w4iQku+tgCpTeAvW2uxcMZI=;
        fh=+K83viqYj/ch/WqTeac0PhjA4b/0jwNFYlUk+FP6wGk=;
        b=nZa7h2C/d6Suk50t4SVdLHvJ2jwLwS+Z8wYPZwiLc5kLKRTviSO3P/v0UmR9zB9VPu
         Ysm+yw9s8Qw/nXZ6/nWzJnj9KpRKo9+hHyic37wqIjmBATLtatVUjkBZWofKI265vu3Q
         6ijzw+Omru/wJp4gp0nbMbqD/p0hBlnT21wNMVa+Lm9PIG8lhH0bdzcMIcHFlytczI4P
         Sic9QYnmvNyOuiGOlW+TXcEx/bKJzfpUmwcXJYWzT2xjrEOQKbXJ+9VIKI/NrW6v0YaV
         o2k5uiRuA2Quc40+q7YaXvdM66MyXbnJZfQNzCIY9nwFmeylC59H6eo9DgrUK7wswLfe
         wkiA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788606467; x=1789211267; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WVtlZkuDGXxOI8toXmO4w4iQku+tgCpTeAvW2uxcMZI=;
        b=LVLs9w951RLt/ASxGkGR7QNu4NGNKzzhKfhjX3wltgOaOWMWJYU82tNZsXi5BqKT+W
         A/r1mKzTCD3OelgF1ulvJUkdGr9pzsPNQtNga8q8aFxAyQiB30YqTdqkMAKjiu620wIb
         PvNqbh5GT1U9aKL0/Q1z7JliQBjdNVSUKWKB7gF869hHE6FRMGZPbKSep0Q9YJlj8iC0
         A8vgMlfu8br32Vl3OjHOZDKYvxTYPSyXZzoYhBhEtFWl47LT/RpzITlLDezOaAu6RlLh
         +CN0ULJho2DpIIsSu+DZRKuJ2EGNaSKI7uoDPhLpOM3engC9UafvP7jrKwy3vHV7psF5
         TO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788606467; x=1789211267;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVtlZkuDGXxOI8toXmO4w4iQku+tgCpTeAvW2uxcMZI=;
        b=jVQPXsMvjCsbEBbyRjFyPjLuwuaHfxsinRmTtO/ngRFwtzcrf2dOx41dPE/CDI0SEI
         km8tvlDAvu93T1TdabNrWpuAFSXN/eLsgSUGIWPVOaInI1qktZA0iY6zzGJ+umRyLHOe
         IIH1/Kcug9T2C6VNcX0jcgQyJd1X00d2EYgdYd40CI9kgEMyvm04HbsNuXmE7HS0Frhz
         YuS4RGrsIafr+tigXlG7EF4ulQl8uVStDXlV7KW4YI0N+O2rnY8rn7aJtehpGcWzw9pV
         ltBYCV603Q7JvWZFjCapBlDYobbaOBFWWdNqhk0hmAOWjVnfUuL32hZk+keAZaIMn+u2
         IdlQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/HM/vfah4kdcUsjaebI9YcXmOeB/2nzssJVFa94yqH4B/XS20LmV1q1OTxOXDw/wFPP5PBuUcozlcyPKRzvZM@lists.infradead.org
X-Gm-Message-State: AFuF++nFtt8iuKE/DnAmeQtWDTO5TCvoKPhrhvLxMCaHRqgGQHu2kOTI
	qhz/9gEh4DmVaBcLcoh75NAizfQrKWN3zyov5L/httlzehEz+98rFs0h7TUe0YhvS0xw58oj7Rz
	+gYA3PyNxjDMLiUGoxqa7DD7V0NQLXln7l6/GIZIPRQ==
X-Gm-Gg: AYBFou3tfA/0jwRNkGY3Jgq0BmtMGBOu6rwTOozXHAJsQulXLhd0KNlWfvK3Tt61d0V
	MfQSYiq/rkT5l+RhXFLf2QcAIHdEoUFAuwC2vMVqmdBsS6pozKNRB63AFscJp279s3VYV/zITvb
	X5VadE4BTyPRgf7vduv3YCyNwt9ff7zsFavcZLWdX6of/Zohza30psEEsDvfkuon0XPPnuzM5Pl
	Rz9HKd9tc0lUpOD5j5q9sAkrCF5my7CiZkEEq4LJ6H3jlEiMvD4Gz9NKCGS9Y7E9KvvADyEJwL7
	/RSsdBAvcFgwd8vATdLEXibrLgtrczpHcepKUZk6QY3GdB1Rotb7YkdkUlfrCmq56RhHt/RK5Sy
	rQbxp/45jtDEIYLbJAIc+rqYeJqfqdLh8LAIAZ7GayCwkAQlAiV7vNEmz/29dFL7J
X-Received: by 2002:a05:6000:420f:b0:484:f26c:b9f3 with SMTP id
 ffacd0b85a97d-485872ebd4emr13447348f8f.28.1788606466907; Sat, 05 Sep 2026
 04:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <871pb9841j.ffs@fw13>
In-Reply-To: <871pb9841j.ffs@fw13>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 5 Sep 2026 16:37:34 +0530
X-Gm-Features: AcwNN1WQxHO5cqvfPg3ullsdiCu5_mZrtsE7_CGgcOOk53j9-4tDEAMo1ePLZfE
Message-ID: <CAAhSdy1=Z-VjEhGsGOJ15QptCSZP_6zG1NF=B972KwzEJhFbFg@mail.gmail.com>
Subject: Re: Interrupt chip driver maintainence
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Radu Rendec <radu@rendec.net>, 
	Marc Zyngier <maz@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_040749_706880_BF2D1231 
X-CRM114-Status: GOOD (  20.97  )
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

On Fri, Sep 4, 2026 at 8:19=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> wr=
ote:
>
> Folks!
>
> I'm wading through my inbox full of patches for interrupt chip drivers
> and I'm thoroughly annoyed. The way how this works today is not
> sustainable.
>
> Patches end up in my and Radu's inbox and all we can do is go through
> them mostly on a formal basis, but it's out of our scope to look at the
> correctness vs. a particular hardware. In the past I just picked up
> patches when I had the gut feeling they are remotely correct, but I'm
> tired of this.
>
> I've just marked about 20 patches and patch series obsolete due to zero
> feedback from the relevant architecture/SoC people who were on Cc.
>
> And I'm going to do that from now on very consequently. If the
> architecture, SoC experts can't be bothered to look after their stuff,
> then don't expect me to suck all of this crap up and then deal with the
> complaints when it breaks.
>
> I'm still going to pick up obvious and simple bug fixes, but for
> anything which requires deep knowledge on the underlying hardware, I'm
> going to just mark them obsolete when they molded in my inbox unreviewed
> by the people who understand it for six weeks.
>

I think this is a fair ask.

Currently, I am focused on reviewing and testing anything which
touches RISC-V AIA drivers. The SiFive PLIC driver on other hand
seems to have no active reivewers from RISC-V space. Few years
back I did try to actively review SiFive PLIC driver but these days
I don't have bandwidth for that.

Regards,
Anup

