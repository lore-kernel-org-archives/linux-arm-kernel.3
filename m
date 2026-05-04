Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FA7FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 20:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJ2eAXPYNTEsOYZ4v8rz7h3jNo4Zy8g4wcsmv8Syleg=; b=eB1g+n0ck+hVzSwacz2TGMw3Hi
	J52+FTyN8xuFGQknhKOzkG5vFcN0zN6ylzACEKUjFLvCpBYYHVrgp0pwhBm1MLpF0Uwv5a4ADKaPn
	12i5saUvgvob3uerVA4v2fTGN2jBuf1is6eIV2hiAXF2/rnMYEaNcXJ1SmJYUYMpHm5BI8OzHkzr+
	ZkJVecDHUlMikn3pjtjh7TJ7+j9IUJZHn2gPbSjDgsOrb6fBGOmbr6NYxGUqP3L6TJs4PK2mA2c+a
	OuLxP3c4We88cIfhToIT0JllPJYp/ZVRSK8U83QYXkaWyLvqqkLp0otkHGMbvu+TlmH+8Fy0BC+yz
	ptXxaHOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0Gq-0000000EIde-0lFp;
	Mon, 04 May 2026 20:52:04 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0Gn-0000000EIcz-23OT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 20:52:02 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8379e010b01so610105b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 13:52:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777927920; cv=none;
        d=google.com; s=arc-20240605;
        b=Y4OinoJt3cCl3SYX/GUCPQoaze0hxc8EmzfpOnoqPbmyz+2zPwghv0TX3fQUZ9+Hgp
         wiWeyDARv4Y1KyYxs+WvLI2PTUU2dlaXaJm/wJhP5LJxFw8OE4cu7w/WYQPJrtOvcxxD
         rhlSuhEnPNOVyBx6/Nuh3GRPCTQGrdkA6/u8YsgYHEu9offfKDfWKxGu/zavVEOWHFZG
         gO0ZqUKrsx10X40lFAdKMauG2d/z4j4paW4GE7aBOKZjIeTilx55K3W/L342ihK3jsx6
         TvzWmSglIN/nGK7l8pk2QXtCnNIeYOR8z51mLxEbPY+XhXIkNSCkjIlQFNUAwC+r9/yq
         I8+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WJ2eAXPYNTEsOYZ4v8rz7h3jNo4Zy8g4wcsmv8Syleg=;
        fh=oR8Ml5226nSAbuMg8q7txMuvEQ8iDmCX/V1f1666ypY=;
        b=OEHyiBc3A6L69V7CVDzvJlx4ny7yJqRi0lv/jBlbxXLoClx7gvO442kYrWXYjTi8yv
         PZqF8ld6pdGAPf2e0aoE5aVUqkLEyinTTXqy7sXREujE5K/GHCoI/3ZuJrYxsxoliA3G
         R+H33cIMwgiwt+F9gXH9nPY4nouL/osnvtDNjhaKdQ2R0BdHNqOrAqHpTlMU9ZXaz9gv
         DuCkW75vQkuBKJmCll0w1Iahpd3pQxGB2KuFkAOJ7jLeGYL+ELCy4DwfIRPHdkca6Kab
         KBetmbaqCcHTzROZIu3j25vdDauXOzOE2fjaHQXlKxhX5MWnZ2vZ9HpfkYLhw2955M0P
         CdYA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1777927920; x=1778532720; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJ2eAXPYNTEsOYZ4v8rz7h3jNo4Zy8g4wcsmv8Syleg=;
        b=adwKBi+Hi26C2NB6RAGRodEp3+8n9RvMv63Mig/0wCwkNJiN4TbPqxDPvDcuEqCD2g
         94Sdh+9naYoPK37s7FTcr8Tkc15PX+tRrknv9hS830so9Op8vt61MDoLOqV8Dt00Q4nd
         Chc33UTEiEve8ZRWccL51NMVt43SXJb9QBZrSF8ZezyvmXBVcFTbinlwyOdJtNLfdzEp
         lT61zW69uzLgeLrdDmoZiRuUtblA1it+YFnnk2OYSylyLBRe66EElwSbA4Wt+ooWrEOz
         h0bM8JeVM1R1BgGtgxl73Dpwh6XTTTP51F8Cj+nXeeGW06DWCRpaDUE6inzrzzAc91JZ
         H7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777927920; x=1778532720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WJ2eAXPYNTEsOYZ4v8rz7h3jNo4Zy8g4wcsmv8Syleg=;
        b=s2rvUhrEM6K7rHuZmbAko0BvdmJQ8QocCYV+N49ewmTo808Q1tWEqQz1zWXV0yPRMy
         IdN0I7NO0/hi2CjIwp+XAiu3unOYfe5Rs9QFLyJGzMRfc5mMTQGRrRg4AYojC0uu/7Jy
         jdkNwzwZH79QpopeMykVQkEtSqwGhY9V0/MutBCgrZ13O4pxES+rgVVOv5SHS3m3L0cu
         rf0IUVQhOcOFVBeWxRqm/YJWcljAG6cevykvftsgIzh1nXBVEeY0jRl/c+nvD8FAGjiz
         8kgD1808LIXO1MRxlCPQQjw8nadWOAqR/48elbsE2p+WqI44bytlcELRKMP2X4mLtLej
         ycwg==
X-Forwarded-Encrypted: i=1; AFNElJ9OHOxUXU5HJn2AqVLyN/T+swXS2UtPhBg8LLpqFflyTc7wA1c4ItVyrs2L4KFjnhGqI4t+8NOMLZN5Y2IH983n@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp5iZyuiR4kCYc0gyTuvZ8A00vyK3bym7i4EAUTYnXJvz8fQNV
	vzGn6h5v+s8/bno60KUt3Wjae9+bTHJQ5ByDgiSlYW2SGpVwn5cufaCVcl3M04QUjvbTxt+FpMx
	2DwCW5IoCTRLolJsLPjLkrjITaFvv1u+bWlO9ND9m
X-Gm-Gg: AeBDietPxc/TFK62eQ+/RjVkcn+izBME4kXhjniFoUhUpa+8uHm8rAnQh1Iy2PEg3Fv
	uvcfo5YQ0UM78Z6d+kLxmVBjlre3ZgznzCLTjrsXdXjqLgpAUXCh7WVBej1AHVaDW/kRPTMSghW
	xTDmD0YEqmoweWc5g3jRFw4h1LDdRjh59ceus9bSZhc8UlG7f8wc/w9pqkDZjNAiinTGrVH4U3p
	34qsn/XVWfGTWVIeZS70+sDXq4V/KrrXM5/bZDKMA/YS3s7ec9BY1AY30tDU9cwlIU6U4c3K0Zx
	7ejkN4Uxkbntnr6+nQ==
X-Received: by 2002:a05:6a00:430a:b0:81f:852b:a925 with SMTP id
 d2e1a72fcca58-8352d03bf06mr9580368b3a.1.1777927919687; Mon, 04 May 2026
 13:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777036497.git.noodles@meta.com> <7734099f5e7fda5480bca016a9e6707983325fbd.camel@linux.ibm.com>
 <afMlgstqahnZg68h@e129823.arm.com> <9f188536f09a2db30877d6bfbb84aeaf2565cccf.camel@linux.ibm.com>
 <CAHC9VhRsnmPp2KmQAns5uq5qXX5EF2xQQzyfTgrPi4O9AXyPpg@mail.gmail.com>
 <ba4bf28314b679474a6a8da6298e548e54b3754c.camel@linux.ibm.com>
 <CAHC9VhRE2kRr1fdDf6xgQgpSrtvqtP8Vy9LVGJhDZFUbzLKGmQ@mail.gmail.com> <ff28c6dcb60c357c752724927addaa8c4fd3bf2c.camel@linux.ibm.com>
In-Reply-To: <ff28c6dcb60c357c752724927addaa8c4fd3bf2c.camel@linux.ibm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 4 May 2026 16:51:48 -0400
X-Gm-Features: AVHnY4Lr6yzqiFvtxlogRXd7Q0IQ_OqPkojIvu5hlaN_AhoE9caMVXM731mJvc8
Message-ID: <CAHC9VhQY2TMkTvQq9P8oZteQWQSr7qq2utOuH+pdVx+8jWLBCw@mail.gmail.com>
Subject: Re: [PATCH] ima: debugging late_initcall_sync measurements
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan McDowell <noodles@earth.li>, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-integrity@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, jmorris@namei.org, serge@hallyn.com, 
	roberto.sassu@huawei.com, dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, 
	jarkko@kernel.org, jgg@ziepe.ca, sudeep.holla@kernel.org, maz@kernel.org, 
	oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	noodles@meta.com, sebastianene@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_135201_534469_2B76EB1B 
X-CRM114-Status: GOOD (  12.48  )
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

On Mon, May 4, 2026 at 8:03=E2=80=AFAM Mimi Zohar <zohar@linux.ibm.com> wro=
te:
> On Sun, 2026-05-03 at 12:46 -0400, Paul Moore wrote:
> > Regardless, assuming you always want IMA to leverage a TPMs when they
> > exist, your reply suggests that using an initcall based IMA init
> > scheme, even a late-sync initcall, may not be sufficient because
> > deferred TPM initialization could happen later, yes?
>
> Well yeah.  The TPM could be configured as a module, but that scenario is=
 not of
> interest.  That's way too late.  The case being addressed in this patch s=
et is
> when the TPM driver tries to initialize at device_initcall, returns
> EPROBE_DEFER, and is retried at deferred_probe_initcall (late_initcall). =
 Since
> ordering within an initcall is not supported, this patch attempts to init=
ialize
> IMA at late_initcall and similarly retries, in this case, at late_initcal=
l_sync.

Okay, so from a TPM initialization perspective you are satisfied with
a late-sync IMA initialization, yes?

--=20
paul-moore.com

