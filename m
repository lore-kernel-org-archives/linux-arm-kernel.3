Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A7DCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 20:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPkX7igJ13fuMwN8FYyuf3QvoeBkEBGD1vYFDYDWhAg=; b=IAN8ALkWD9WO+kXNmjV6ChM/wW
	K/fRbMfgKes7KxCNoeZ28raddEu6JAdbg48bMe2tZI9GFPxNQNxrZHDc1CY3L4uwa+RqRA6XtXW7K
	y8KhWXlNEiz48tkhDyV5Gw+EXuT6H+v8EjOpvp5jU3gAApdpJUuiTD6M4caSLSFrT/8WulyhaB9Mz
	n/8hrFzYA5Sg7HCVr0scopmERfol5AfuNZ1f6tfNBFNRyDLzxYZqR4h5dVlvjsO4S1qbtDOWXt7lC
	Cs6aHuX/m7l0YujbkCx3Glmr0MBUN68PXkBXyYXvbNIWsxmbs6tMsNSTjpklIjUEUPI4wiAA/qzKL
	DVMOsc0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRFhg-0000000Fc9F-42Dk;
	Sun, 24 May 2026 20:45:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRFhe-0000000Fc8g-3ah3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 20:45:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6469441764;
	Sun, 24 May 2026 20:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D5D1F000E9;
	Sun, 24 May 2026 20:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779655540;
	bh=lPkX7igJ13fuMwN8FYyuf3QvoeBkEBGD1vYFDYDWhAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T9QgvtZ+uMkpNmsWRi/zVFffFNF5jMA/0ZOfXC6JLYiAXyw/ek26C/nItMVGFo4Sg
	 DjcmA+xhlLn+2VeovYwuZIlB5jRWJUiDbJ53katUzJA/oZyjZoRwif0e9gKvyyE4vE
	 LcKFipddaVFRW1AS/FJKUEidna/1d8XW5GWQYwHpzbKqt9S8SXjG9oG3+C09lB8weV
	 uuSSn0H4gNej9zoNV4s6VD05eJDSA7EPVcAgl6JhqFWa4vcVzbwWOHaYnB3E5jDdPt
	 Z+HTyUbd0j0U2rPfeB6ymfNzl3saqGtlHRQeeIMtq/gRa5v8VufmsUjIb+uaZsM1ZG
	 3TZQ21g+fajtQ==
Date: Sun, 24 May 2026 15:45:37 -0500
From: Eric Biggers <ebiggers@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] crypto: Delete Qualcomm crypto engine driver
Message-ID: <20260524204537.GB110177@quark>
References: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
 <20260523-delete-qce-v1-1-86105cd7f406@gmail.com>
 <7rgfuvv3hai7g4wt4accbkejtzdt5dnb6mkj6x7ox5sz35q4n2@h7j6rr7extuj>
 <66317f6a-645e-432b-ae11-8f40569d4117@gmail.com>
 <d97382a6-6c5d-4a3f-89cc-3ae9b432de3f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d97382a6-6c5d-4a3f-89cc-3ae9b432de3f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_134542_917033_B7BA844D 
X-CRM114-Status: GOOD (  17.64  )
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

On Sun, May 24, 2026 at 10:29:28PM +0200, Krzysztof Kozlowski wrote:
> On 24/05/2026 22:12, Demi Marie Obenour wrote:
> > On 5/24/26 12:42, Dmitry Baryshkov wrote:
> >> On Sat, May 23, 2026 at 03:03:56PM -0400, Demi Marie Obenour via B4 Relay wrote:
> >>> From: Demi Marie Obenour <demiobenour@gmail.com>
> >>>
> >>> It's slower than the generic C code and causes problems.
> >>
> >> Which problems?
> > 
> > See https://lore.kernel.org/all/20260522024912.GC5937@quark/.
> 
> Your commit is still incomplete and other people's opinion is poor
> reason. If you do not know what to write, ask that person to make
> necessary changes.
> 
> Not mentioning that removing driver is not even necessary to achieve the
> goal Eric was mentioning and if I understood correctly: you are removing
> even the pieces Eric found useful.

This driver is more than an order of magnitude slower than the CPU for
both encryption and hashing.  See:

    https://lore.kernel.org/r/20250704070322.20692-1-ebiggers@kernel.org/
    https://lore.kernel.org/r/20250615031807.GA81869@sol/

There are many examples of it having bugs as well, for example see the
second link above.

That's why it had to be disabled via the cra_priority system.  This
driver was actively making Linux worse.

This isn't particularly unique to drivers/crypto/, of course.  This one
we just have data on, so it's a bit clearer.

I've yet to see any real reason to keep this driver.

Crypto drivers need to be held to a higher standard than other device
drivers, as well.  The onus is on those who want to keep a particular
crypto driver to prove that it's worth keeping.

- Eric

