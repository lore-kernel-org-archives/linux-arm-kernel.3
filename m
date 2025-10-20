Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE0ACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 13:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bv/hgIoX+50q6Ixl1xcYkiMJg4G9dL+7TCf9i2+ayLE=; b=n5OqWEma8gx2PEJAXgVLqAuHnM
	5q85sl8+5xXcofv95gpgZA56esnxrR3XizRLNENx2k0qWA7QGmzt2HnsVW7QzAkhSyFUhzTiAegHx
	TBE0wEqbLlwP4RsTWD4WqDoPuNQhf2lBAGxtN+tdwCWTUa4XFDibIIcdudGZxbPYdnHl7lcKmRuf/
	J2XlTN6JcIuaXRLMDFn3ANqATOYKu+4HDx4FO6U1NX1ZOFRBl46xaGP5/ANn+qVuyequwcHBe5XI+
	lgcLA0JnjWipwKFOEXIFRCWhqrpOWhl1I8pcMtAtlXiN5qpebaGlOEfkQKS/DrBtwAP73wFOrpqnx
	4JcdhLPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApkN-0000000DkTF-3hEW;
	Mon, 20 Oct 2025 13:16:23 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApkL-0000000DkSj-0QUO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 13:16:22 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-784966ad073so13947217b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 06:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760966180; x=1761570980; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bv/hgIoX+50q6Ixl1xcYkiMJg4G9dL+7TCf9i2+ayLE=;
        b=v9ObOySAMxKfqlWb1A248zqCxkKst6dl7NvROqP/GohInsthDgV6zcuElgPMCH/TYN
         505ExZHa2iNtnW5+8KpJ6Pph/3f2yxReiZ32GJETGDOor9qtybbAlQ0G0lt4I+edBEij
         XqYCZVNWiK6A4Cys+DGVcB+HCukpz+lJCz058j/1iJuEUU3dxTV8NF9Dp3IP+sOOR+nv
         IfIxiYzq4ZAdufOpkPBGdTm+FbPPcodh5t+D/Xos49bFzskv/oBMfaT7guQtvusBxUi3
         YHxR1YbnvxGqC/uh7ygImj274V6wT2w0f8gjN8CqofBPCH4he0IV8k8ae0Tf8kWfswIZ
         jU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760966180; x=1761570980;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bv/hgIoX+50q6Ixl1xcYkiMJg4G9dL+7TCf9i2+ayLE=;
        b=UwXC2ieJGnH5wby8umdK7azIREvFHVJXpeGkzeRyiNIw7COUFb7ursnaIu9odtFbwH
         i6vg4kY3QlE2uYPsLHw1UIKdc4aog38Tgz0ntbsnLm96r5J3iiCAzShuMfbC7Tkb8pe6
         cTc0H8EYXkBmLIscKCc74Fi8C7/+Rz9ymcjHLHcl88EExreSCsWh5fghsKWEz8SwAyYn
         75I/FEW81lPDSho1jfsB/1FYomrI6e9TcIG4ulBTkHDhpjpfgdgrWfhN2u87bYjy+1P+
         +QQ+VT/gx4rxZ+eOQiEflpW8rRPgWiYJ/8tyxGaO6BoBgj6Jyk28EVs0asaicCaZaZ2q
         56sg==
X-Forwarded-Encrypted: i=1; AJvYcCUi7Jf2vJ3yHNGEEciBQ5YeL9hZUXNk+02prDjqcr5tb3cmVYlSAxk6iubMuvn8CUKgKgKymjjU+ahon0kRPZHy@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn6E02yTx5bW0x7BaQmMnmnS7WjFo+pvROD9qVHeW/rHStqHki
	10fP7biCj8KcZ4Qn9tbtFMsKD4VH3gGznMmlkeu2xwq1Jb7fjDZsUw64GyKl4oZawHehjYTt9JF
	mjHWR2g64RNQugpiW78kEtsj9sHsXZsA+xgjq1Yxdew==
X-Gm-Gg: ASbGncuTnKHN0S4oYqMdrRyfHomgOvlsRnQbPTvRODGgKQSE/Qw1ipGStVe6aPSGDM5
	r1FYjsz9hB6vkp+UiZPUOHkBmdFvryVvWXeiJEKyXnjqcqg0W6tbSpUZE3JXrPEx3g2ZNOuNET0
	oodbo31j9fpHArdXwf9GVEUQ6Vdx0mybH4TPB3TFWK5wciKl3JbMYEXAcjXYvZ0+I6duktfe9SU
	CWIIvaKvP2eY9ZFHVIR53f9Rt8tuhQqtWWpzIYFhJH/Ez8rH0RsvKlA9fokQAo2LJiEycHR
X-Google-Smtp-Source: AGHT+IGnRUd6oOWdcIGq7ZJOM2TXHgRRiMIGNGat5wkkLEzDStDeU0jE+0gV73QBrOSN31p7sfrpQMby2GN8IBO6/98=
X-Received: by 2002:a05:690e:134f:b0:63e:3352:4eef with SMTP id
 956f58d0204a3-63e335251d5mr4077188d50.69.1760966179641; Mon, 20 Oct 2025
 06:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251003150251.520624-1-ulf.hansson@linaro.org>
 <20251003150251.520624-3-ulf.hansson@linaro.org> <87ms5pzkxa.ffs@tglx>
In-Reply-To: <87ms5pzkxa.ffs@tglx>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 20 Oct 2025 15:15:43 +0200
X-Gm-Features: AS18NWAQ9Q6Yt14QDB7s6GeA-9Aoe7Poi1wd95vo2hk4UxQrH-HTLgjH3ho0lzw
Message-ID: <CAPDyKFrVkO1nn-1C7z9RJBX-bzxQ8_tBhhKNaK7h++NbAoT3zg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: smp: Implement cpus_has_pending_ipi()
To: Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Maulik Shah <quic_mkshah@quicinc.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_061621_149039_9537B2BC 
X-CRM114-Status: GOOD (  20.08  )
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

+ Marc

On Fri, 17 Oct 2025 at 16:01, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Fri, Oct 03 2025 at 17:02, Ulf Hansson wrote:
> > Note, the implementation is intentionally lightweight and doesn't use
> > any
>
> By some definition of lightweight.
>
> >  static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
> >  {
> > +     unsigned int cpu;
> > +
> > +     for_each_cpu(cpu, target)
> > +             per_cpu(pending_ipi, cpu) = true;
>
> Iterating over a full cpumask on a big system is not necessarily
> considered lightweight. And that comes on top of the loop in
> smp_call_function_many_cond() plus the potential loop in
> arm64_send_ipi()...
>
> None of this is actually needed. If you want a lightweight racy check
> whether there is an IPI en route to a set of CPUs then you can simply do
> that in kernel/smp.c:
>
> bool smp_pending_ipis_crystalball(mask)
> {
>         for_each_cpu(cpu, mask) {
>                 if (!llist_empty(per_cpu_ptr(&call_single_queue, cpu)))
>                         return true;
>         }
>         return false;
> }
>
> No?

Indeed this is way better, thanks for your suggestion!

I have also tried this out and can confirm that it gives the same
improved results on the Dragonboard 410c!

I will submit a new version of the series and I will try to
incorporate all the valuable feedback I have received.

Thanks everyone and kind regards
Uffe

