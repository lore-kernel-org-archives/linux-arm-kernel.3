Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB27CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 09:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wFGb+P6Qf/XcLDEtfjYh8pZaciaCzeT304mu9deWtU=; b=BxUeDzDkgJ58dquKT9Q//75aXe
	9ZS+LkNZaSYMESfQE3VqCQPHcfjQuGOxVNmPLxJVSG42/xxetH/m01kp8VwpLdWqOU09QEWm6QAx1
	npTnPCWBrZgbYNN+SAxCVcKDKDrU26dll5Oe2W7BoMMzGzWy1vmpZU4cD8kpSXshJ+snQ+c0nj8gp
	wCG9YUP/EAEd+dVTD0ZUqmmTQpcPRRIcex+1C97OjWII3/u4iDHO3NJ4ZZYFvw5HLDphx1478Z7Yy
	+fxHrnacWerEb2BZsrka9qt6G+Maj5PdbCyjc/ljQzqaoiilupNnEcclxmFKPI6rtvNQCT5TWnXZC
	XWjKBQYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bPo-0000000Flsc-0oFQ;
	Tue, 14 Oct 2025 09:33:56 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bPl-0000000Flr6-2zaJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 09:33:55 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-633c1b740c5so5125485d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 02:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760434432; x=1761039232; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8wFGb+P6Qf/XcLDEtfjYh8pZaciaCzeT304mu9deWtU=;
        b=fHl4+alHjiXLpppEjsZIj8Up2/ShVoXOPgLFxdSjORoIOSrYz+ud54fmITo5yRKO43
         /yKCTCIAi5pkDQayr/dmhq7mg0BNhJoRvGdgXkB0zWb8Us5ZvdvDaO/7CyRz741CWPLT
         mFIXnt5qQg8Nc1SlQmqcfHH4lEre5yw4Zo1yrd5ZDpf1UF8YWmKjMsWaFELkceaDC1hf
         NM2Y+1yb5x/ESY4psP4AU4wS2Uv+ZMAQCGzz+1oUqcIECc6HZnI76s1ttLYVnv7XvNiC
         1ub96QjXvVmlV69MkKa142jour5YS2qBGXYHK53nE+3iiH60FEYFLwK4cPTQMZCD61/6
         zSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760434432; x=1761039232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wFGb+P6Qf/XcLDEtfjYh8pZaciaCzeT304mu9deWtU=;
        b=b6h7E/intZp7rS4dsFgr7veeI/WJ3xxpseC0LO/fhE9tclnuXuVKzQuivBchiyuOX5
         tRPxY3sqYJCqSM3AuJLxX41IkILQIPnkp56/d/EdE52h7Zre+elrzDDbSGQG2aXgpYTp
         SufmpOJbG1pHMxu3o6lJEl+egdJ33s/JEh1YJnNfsW4M3s2ErCqj8/Hwi5s+zQq5+hjS
         5NS8J7hiHs+zDg56VLl1i3pDLCArafWQH+sXmEO5KkFS/YKJT0v/hXAW/jErsew9wcKw
         C4BZy2nRrAWs3jVVz9X6pabJ45Vno1vciyW4nONXPA2doSqwIAAvin5OMU4vIZ4uqcIA
         mxXw==
X-Forwarded-Encrypted: i=1; AJvYcCWVMy2zFcefZ/8UThBgvq/rxZjrI8CKeYkpIn5kAF/UX/jRVcaaWydeaGXMn3rmA59fl5wetHk2xyz7vh5y1byP@lists.infradead.org
X-Gm-Message-State: AOJu0YxSpx/ckmbDOaKdeI0q5EHldmww/IEWPqluLD5l2SGZEqYtiecl
	S3twFAD/2/SUgJvo+s7/zzZJAaaGFn9iGgZHnSIO0rYb5GgxxmYw1v/sVud93MoBzyjU3t2Mjx7
	1lPz6dbYdBgzUcAcW7xCeWAcQ9FiI2GwNu7vwgpH8Jw==
X-Gm-Gg: ASbGncs4EjfWwgJk7QgGjdXV1BOpAKrEeH6Y+4jbHUgEyjuRqvT4/hgT45XiUat2XX6
	6UBP6hn1WIwMvqyeKWwHFoWY7p/OwFMGgzQ0SKja5g4cqBqFRUWfW3qgF93E6kJfFKWCDPHXJB9
	/xS3avzvtpC2Dcmuzh9AcWh4TGmn6IUo3m44h1THZtojoTU+52sSAsHP7GV4YfzqGyE7y1KxSEu
	+/aGBpqWBcniAYuLH9ivCFsd/iDeLKmhy9zBqXhmg==
X-Google-Smtp-Source: AGHT+IEVAcBgpKukciYohw1wCwJ8jfYbDXJ1NWWrLl/ErpkjYcOrlZeCm8gZtEQqr9rX8i9Rb5qXoqV704XMyy0SQaM=
X-Received: by 2002:a05:690e:5ce:b0:62a:38ab:fc31 with SMTP id
 956f58d0204a3-63ccb884e07mr15614598d50.14.1760434432414; Tue, 14 Oct 2025
 02:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20251008201955.3919537-1-salil.mehta@opnsrc.net>
 <86v7koxk1z.wl-maz@kernel.org> <CAFEAcA8=yhQ-ygoA-fqxzwg69OkdW2nBM0O9X3Lmww4eXuVMWA@mail.gmail.com>
 <867bwzxe9r.wl-maz@kernel.org> <CAFEAcA8FhgcaM_OsHKB3+3Z7B_oZJqU4LHX_j9p-ZQrHfWGX7g@mail.gmail.com>
 <864is2x6z9.wl-maz@kernel.org>
In-Reply-To: <864is2x6z9.wl-maz@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Oct 2025 10:33:40 +0100
X-Gm-Features: AS18NWB0dxb3QuiGrXXZa4EKTtJHL1ovA0YXo63pfaPZJFoM4HjU0WA6QQyO8lQ
Message-ID: <CAFEAcA_gz3C9gJBT0wRbymc7BsYb0VhKqbDRBsLXG=aDAo3yPw@mail.gmail.com>
Subject: Re: [RFC PATCH] KVM: arm64: vgic-v3: Cache ICC_CTLR_EL1 and allow
 lockless read when ready
To: Marc Zyngier <maz@kernel.org>
Cc: salil.mehta@opnsrc.net, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, salil.mehta@huawei.com, 
	jonathan.cameron@huawei.com, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, james.morse@arm.com, sudeep.holla@arm.com, 
	lpieralisi@kernel.org, jean-philippe@linaro.org, tglx@linutronix.de, 
	oliver.upton@linux.dev, richard.henderson@linaro.org, andrew.jones@linux.dev, 
	mst@redhat.com, david@redhat.com, philmd@linaro.org, ardb@kernel.org, 
	borntraeger@linux.ibm.com, alex.bennee@linaro.org, gustavo.romero@linaro.org, 
	npiggin@gmail.com, linux@armlinux.org.uk, karl.heubaum@oracle.com, 
	miguel.luis@oracle.com, darren@os.amperecomputing.com, 
	ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com, 
	gankulkarni@os.amperecomputing.com, wangyanan55@huawei.com, 
	wangzhou1@hisilicon.com, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_023353_804457_13DF8A19 
X-CRM114-Status: GOOD (  18.54  )
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

On Tue, 14 Oct 2025 at 08:44, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 13 Oct 2025 17:48:44 +0100,
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > I don't object to the API inherently (I don't care whether we
> > do these register reads via a dev ioctl or something else,
> > from userspace's point of view it's just "do some syscall,
> > get a value") -- I'm just objecting to the kernel's
> > implementation of it where it might return EBUSY :-)
>
> To me, EBUSY has a clear meaning: you're otherwise using the resource,
> and you need to relinquish it first, while EINVAL indicates that the
> kernel doesn't understand what you want.
>
> As I said, I'm happy to look at reducing the locking to only the
> target vcpu in the case of a sysreg being accessed, but EBUSY will
> stay.

I don't particularly have a strong feeling about the errno
value. I just think that it's much harder to accidentally
misuse an API which consistently returns an error if userspace
tries to call it in the wrong context, than if it
mostly works but occasionally fails.

(The horse has bolted for this specific case, of course:
if we made it fail consistently then that would probably
break existing deployed QEMU versions.)

-- PMM

