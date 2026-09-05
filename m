Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B55C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 21:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FsQkijurDodlXzSgnVUIeMF+0Mv7R4D+E6ps34X7dg=; b=nC9yIENzg2Fo9z3Uou3rtsJQMi
	u+OcFc1z9ydH2kNMurq6bl16vkWa51AYd+cmZ1b2JgQyz5gznFCd8cVVxv5j0/317bj1sCCD6HVbw
	IR7RFaGuTamJF1ty+AHn2jTKr4+3uWfMGSOHzu3mWyig8rJo0gmRdfiK1RRI5lP0yauPuAPKuRbpX
	KR3RnDGcIFVn6DHrKaRB9Y5SnrlERYcnNh76R1eilM0PrUyskUO4bro7wqWGlqiScdSPnvf/5ott4
	65q3MFgWHbj8Tg/pZhBvgG1zMngTUEqgXHQ+0RUjDGiwCOFbEaDtwCwTiOZab23qGq7WSkvzd4Em0
	HXvHWQHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2xyL-00000004QVd-2nzZ;
	Sat, 05 Sep 2026 21:30:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2xyK-00000004QVU-1vJC;
	Sat, 05 Sep 2026 21:30:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF8314012F;
	Sat,  5 Sep 2026 21:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1B31F00A3A;
	Sat,  5 Sep 2026 21:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788643847;
	bh=2FsQkijurDodlXzSgnVUIeMF+0Mv7R4D+E6ps34X7dg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=J0AtCoEQhw7cg+X8IGyiq0Qq5QxvKsW5O2L/9mobICDmRnrYp1RTsWKLhFRTYsWhH
	 8CBPzGDujIdxK5EA1ltlDpYpBBMjUElsfinyG9NEAe/cbYVipym3mDGL+e8IVh43jY
	 aV8oDVZpRQDkL7dTtR/r401rEvYCONLjtzN99c1ZsrvaTT7+b5E71XyPj1GrLC0cMr
	 r7asLl6/gt9jcdxKatLeDXajxofeVOV37EBNQblJADQ1tZ9EtT/Zl1fmxzv35KApVe
	 31SkyiHw/625dpL2iLH+vRN+2aA0Kdf+nfji2pg8iyvRLMQjELA5GuNTBbB56e4BVP
	 phOr/ZM4sZfyA==
From: Thomas Gleixner <tglx@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, Paul
 Walmsley <pjw@kernel.org>
Subject: Re: Interrupt chip driver maintainence
In-Reply-To: <CAAhSdy1=Z-VjEhGsGOJ15QptCSZP_6zG1NF=B972KwzEJhFbFg@mail.gmail.com>
References: <871pb9841j.ffs@fw13>
 <CAAhSdy1=Z-VjEhGsGOJ15QptCSZP_6zG1NF=B972KwzEJhFbFg@mail.gmail.com>
Date: Sat, 05 Sep 2026 23:30:44 +0200
Message-ID: <87ecf74c8r.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Sat, Sep 05 2026 at 16:37, Anup Patel wrote:
> On Fri, Sep 4, 2026 at 8:19=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> =
wrote:
>> I'm still going to pick up obvious and simple bug fixes, but for
>> anything which requires deep knowledge on the underlying hardware, I'm
>> going to just mark them obsolete when they molded in my inbox unreviewed
>> by the people who understand it for six weeks.
>>
>
> I think this is a fair ask.
>
> Currently, I am focused on reviewing and testing anything which
> touches RISC-V AIA drivers. The SiFive PLIC driver on other hand
> seems to have no active reivewers from RISC-V space. Few years
> back I did try to actively review SiFive PLIC driver but these days
> I don't have bandwidth for that.

I don't blame you and I put you on the CC list because you are in the
RISCV space.

I don't know what's wrong with SiFive but they really need to get their
act together. Paul?

Thanks,

        tglx

