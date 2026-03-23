Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43916EC01B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwSf4s5xutuATAe+2BlsfK3+lGWoPKV7eLcEJ6owbAw=; b=G4V4IfdZfIVwuF1/GSlhiRmYKT
	MquGD4lNpCW3vV45XgUig65+L8ifLFLqeEbmOkRTfTR2bkmk+AO5h2y2l382su5eLWUOH5g9HVksc
	/vaYHDwBjCWH2eqnWu8lM7yaIRtoL63Ewf+pqfa0tp+UnE1GGd8aE5oA86f5AS6BC8zTWTQ037036
	1CWx/hO2K0C2Hof3jfbud1+HQjno14f5wggrpkXWJdnPWAkN7ZVsQ8IQTiVqCxD9o7F8ZvefxsrKv
	QbpJrynXLFzWS8J7/IQYMcw1exgLB1u/r+fwQzWvhtMEAvHzl3Prz/ItLVYpRu2By1mEyKaBXcAMg
	MIeUKfXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c3q-0000000GR6N-3ubx;
	Mon, 23 Mar 2026 09:59:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c3R-0000000GQgd-3oUX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:58:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 121F644269
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01BBC2BCB6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774259916;
	bh=gp5lHYOOO+4yiL81Ex+mUjPO6eOH6Qpek1Pg4LH9pn0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VWW3SvkUU/yv0MRfe4JmE2kDnaToOtuQIqVsqIHLlw1gxOEQZnC41Qs9VN1Fc1oJ9
	 gZDJ5sfIfYKcJTLJ5JeqReZiBl3bIiXD38ViE8+3a4gohu7VXq1D7sBk7a8lgnAUfQ
	 L9yKrN/IVtB8JHgkJE9cqEmGLNngzQwHR2FHSPPM3Df2xlt7L9Zxv5ACpcNAUKgJu2
	 wDiGl2zqDMenBTlCZwUjgw8cr16ywBiUI87mWmMTDnrZMBzvkphzDMhR8OxYxVWG0C
	 LhGAx21DF/nen2mwblfGCCt6EEq4CHO5fPYCAVUwtdQnPcl0WTEU/HWxW1mKGry3Ng
	 LYCPB3T/IreCQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a76ba6a78so25340451fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 02:58:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWV8izbCnTleo/NTlexOCWl9GT3fbMPPxZQ1AP3CCuztqXo52gdhHSZuvhTncqm6Z5bpgTC1Y3ZhHLbfWZ/iSgF@lists.infradead.org
X-Gm-Message-State: AOJu0YwMUHUE3o7dmskYs9s5UY8/TeDtl0Nvgus6ytsA0QuCqFFWi6LU
	Qb74q2cYt4yxbDPRxQHkAS9QkmINuhkuYB1Epe7QqPgU5jXkc2KgmG9VShPkCowXhyC96YS79WB
	2LcIf0PYL/GiiBpGaFAQtfDmkFodhu5MeXYTZcG6mbA==
X-Received: by 2002:a2e:9586:0:b0:38a:1a50:d843 with SMTP id
 38308e7fff4ca-38bf9747572mr29235411fa.36.1774259915139; Mon, 23 Mar 2026
 02:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774087290.git.dan.carpenter@linaro.org>
In-Reply-To: <cover.1774087290.git.dan.carpenter@linaro.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Mar 2026 10:58:23 +0100
X-Gmail-Original-Message-ID: <CAMRc=McyeeEaagvkoU3MDAof_N_e+f-sVwCDak5Y7F5cQZd-7w@mail.gmail.com>
X-Gm-Features: AaiRm52YzNP-I9uAP5hlyzM8oeYE45CPVBux1vZ_-ak3oMBioBxm2gy2IoiTfBM
Message-ID: <CAMRc=McyeeEaagvkoU3MDAof_N_e+f-sVwCDak5Y7F5cQZd-7w@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] gpio: introduce a gpio driver for SCMI
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>, AKASHI Takahiro <akashi.tkhro@gmail.com>, arm-scmi@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Dan Carpenter <dan.carpenter@linaro.og>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>, 
	Michal Simek <michal.simek@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_025838_019072_9B5AFAD2 
X-CRM114-Status: GOOD (  11.61  )
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

On Sat, Mar 21, 2026 at 11:13=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> This basically abandons my earlier attempts and goes back to Takahiro
> Akashi's driver.  Here is the link to Takahiro's patchset:
>
> https://lore.kernel.org/all/20231005025843.508689-1-takahiro.akashi@linar=
o.org/
>
> v5: Addresses Andy's cleanups to the driver.
>     Adrresses Krzysztof's comments about the dt spec file.
>     And almost all the subsystem prefixes were wrong.
>
> v4: Addressed Andy's comments about kernel-doc
>     Addressed Rob's comments on the spec file
>
> v3: Forward ported Takahiro's patches and added some fixes ups to make
>     it work on current kernels.
>

Once ready, how should this go in? Immutable branch in pinctrl and
final two patches through GPIO tree?

Bart

