Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F16C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 15:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXrHi2dDhsHjFRrFFlLx3951AzAuiByzthX8mF+kPRc=; b=LlZknJBYyuJv5G1ImCWZX1fQ4N
	e+J/iAOOWA5nebNPzRosn3NH3fXfjVAkyDkm2qc4TY1bd4CBXwhDzyD6yUzwlN4MAL/jns/AUY0gV
	Duw6G862iQojY8vqgurQz0A4V8SYHC4wXmGhv+udNHPA0Xe2NiAGKYEfwZFnGDgCzaCqitQrYFadA
	WHt/b6lsYSrXkAAfFRBM3GesMbWfhBOJNWzrU0ZsT5uB940WfkgJXgZAv97tEEmYmCimZohqacRD6
	uDoJKagzPmFSYW7DTjbOZAMfEYgh+e2XNM+GPjWzjZh32evsRW+Co3n2vOVrK8PULkWfftw5eGMER
	s0CTPruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5nPP-0000000Gbpf-1YJ6;
	Fri, 18 Apr 2025 15:13:39 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5nKd-0000000Gafg-0wmK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 15:08:44 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-227d6b530d8so21265395ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 08:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744988922; x=1745593722; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xXrHi2dDhsHjFRrFFlLx3951AzAuiByzthX8mF+kPRc=;
        b=eEkqOfJoAbu5Xx1nkkiB0iE+GT7SmQqsjVlTouk216StW/kAESC64TqdfQXnLOmWfk
         jErlf3FJM0Lp51aZZzx8nPBPXfAVKX34u4dXo3hT/jK+Wi86Ov2NHON3AYCk1kabyzGC
         IUUD6zWMhgsvfnKnlZ07JVhN5e1rLUOi1uS0kAuKQ1d8iQE31nWdhtRxaBjqDN7hxKVP
         dPRb6PhcwLNEJ5LQurP2bAgXwbE1qXe9VrlJYAqxTxCWL4BYxKHt77ae2o0h/6KfHZPx
         4x/8Y9eb1EQYFFUCnYealw3QzQywN5TT10z1cdZKyCRiXI21vVifrZ35SGJUeyMLbEJx
         qqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988922; x=1745593722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXrHi2dDhsHjFRrFFlLx3951AzAuiByzthX8mF+kPRc=;
        b=lbKgqipXE1ms/T9wKQ4hqnyDbdxm8sYHGDc7f9dSyQvEFWBS6LpVdBqhrcKzhE56IB
         PlMyhpdkI+Z1koawS+0P1fgLElYGEVfzRGFtiXKWq2SxXbfMm34oWkE/75XybVEqqXBw
         0lV47mn02mJdUUdxEeqhEa6hyQUXf4RJAihhd9Yz1yRl0kN/hKQSy7Y+qmXhpwOvXbco
         tECk+SHLSt5ZOIG11z6sSYyJSG7N5WrC8wEJMumkBGpgL5hWUzYxS2sFyR19nBeniv7w
         XmcTB0OHen/Te6gmf7w2eCcpg1PrNZkKry1OtLL2V+UUokgbtotyWPpukuape837b18e
         YXnA==
X-Forwarded-Encrypted: i=1; AJvYcCVrmOjnHpzfDC5u9b9rAt+hdYUXAyUFIgU/vTWJROR+eN40ZaYvaeRGjcz4uj35FcylWeTDxrHdC0zxpqPhsDtA@lists.infradead.org
X-Gm-Message-State: AOJu0YxQwAiOJjOUjMFKywlR7O3ZL3vWCy0N6A2kZ3FykSpb3enHWw3s
	P6S1kO3ZVQBSFCV3XiZ6B85c9WD9BUkRw10EVJ+qrp722wOl7CHf
X-Gm-Gg: ASbGncv4G4HXTMd5NeSBy5lp8TdHTE7eTogViaXypgOufJAvnzlup1V6JKHtgWC4wqy
	r8/lK2J2sAW8u/c9UdeZgyf0aXs4J1y85ZRCx3MB0pOmTpfVW7/Ue/dKenoZ66fqch/q4vtfCJX
	cvpUh5UhEV7nSEhiUSoNFhr5Q6J8iWuu71jlBF3jGRWbMG+dWxhegsaW7fZ4Navgvb6Izq7KywY
	TuIyvq0lmJ2YGVL3mP9uj7fUu0a5GpzmeZd8tVaLtWmxjyaUVMHJc3UAgzV8zGVP/4kxvI2Vn34
	bJT4xK0Qb3cja+CXHop5A7XOfGDWObZdpoQVu7vs
X-Google-Smtp-Source: AGHT+IFgyjtFyh0D1cewNDh4KCf3omEopwXw/CgC9qM37WkDXknCiuMsdR9x6yE6lYdQVJp7loAorg==
X-Received: by 2002:a17:903:3202:b0:224:c47:cbd with SMTP id d9443c01a7336-22c530bc965mr45650025ad.0.1744988921670;
        Fri, 18 Apr 2025 08:08:41 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf3fcbsm18016695ad.78.2025.04.18.08.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 08:08:40 -0700 (PDT)
Date: Fri, 18 Apr 2025 11:08:38 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Luo Jie <quic_luoj@quicinc.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, linux-kernel@vger.kernel.org,
	cocci@inria.fr, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, quic_kkumarcs@quicinc.com,
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com
Subject: Re: [PATCH v3 0/6] Add FIELD_MODIFY() helper
Message-ID: <aAJq9mGswYsnAOS8@yury>
References: <20250417-field_modify-v3-0-6f7992aafcb7@quicinc.com>
 <86sem7jb5t.wl-maz@kernel.org>
 <0c97c659-bd28-45e0-8537-d9be2637cb22@lunn.ch>
 <86mscek7h3.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86mscek7h3.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_080843_273429_8CC853D9 
X-CRM114-Status: GOOD (  24.75  )
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

On Thu, Apr 17, 2025 at 06:45:12PM +0100, Marc Zyngier wrote:
> On Thu, 17 Apr 2025 18:22:29 +0100,
> Andrew Lunn <andrew@lunn.ch> wrote:
> > 
> > On Thu, Apr 17, 2025 at 12:10:54PM +0100, Marc Zyngier wrote:
> > > On Thu, 17 Apr 2025 11:47:07 +0100,
> > > Luo Jie <quic_luoj@quicinc.com> wrote:
> > > > 
> > > > Add the helper FIELD_MODIFY() to the FIELD_XXX family of bitfield
> > > > macros. It is functionally similar as xxx_replace_bits(), but adds
> > > > the compile time checking to catch incorrect parameter type errors.
> > > > 
> > > > This series also converts the four instances of opencoded FIELD_MODIFY()
> > > > that are found in the core kernel files, to instead use the new
> > > > FIELD_MODIFY() macro. This is achieved with Coccinelle, by adding
> > > > the script field_modify.cocci.
> > > > 
> > > > The changes are validated on IPQ9574 SoC which uses ARM64 architecture.
> > > 
> > > We already have the *_replace_bits() functions (see
> > > include/linux/bitfield.h).
> > > 
> > > Why do we need extra helpers?
> > 
> > If you look at bitfield.h, the *_replace_bits() seem to be
> > undocumented internal macro magic, not something you are expected to
> > use. What you are expected to use in that file is however well
> > documented. The macro magic also means that cross referencing tools
> > don't find them.
> 
> $ git grep _replace_bits|  wc -l
> 1514

FIELD_PREP() only is used 10 times more.
 
> I think a bunch of people have found them, tooling notwithstanding.
> 
> As for the documentation, the commit message in 00b0c9b82663ac would
> be advantageously promoted to full-fledged kernel-doc.

The FIELD_MODIFY() and uxx_replace_bits() are simply different things.

FIELD_MODIFY() employs __BF_FIELD_CHECK(), which allows strict
parameters checking at compile time. And people like it. See
recent fixed-size GENMASK() series:

https://patchwork.kernel.org/comment/26283604/

The _replace_bits() functions return fixed-width values, and intended
for: "manipulating bitfields both in host- and fixed-endian", as the
very first line in the commit message says.

Those using _replace_bits() for something else abuse the API, and
should switch to FIELD_MODIFY().

