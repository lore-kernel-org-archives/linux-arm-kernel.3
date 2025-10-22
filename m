Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C381CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 14:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcGPa9BZoRh/cXSf6MM7skWFc5+sWNLhhAzz4IrXMW8=; b=IBpwBnJE1ey04/ESIn1iVDe5dA
	Yt8hoB853ezcCy7oiJIh0UzY2Zn8k1XtaTFUUUQK5hV9kMjk/+tlvKieCMXnPzG/KMYYo5iid4aAt
	BpIemrpvAWIDUHc0kNZpxbu6SVsNGpggOZFRgeT49ulqcTvgPLfNrzZXbaJzs8c8bmUE+9RRfNZtJ
	+nRqW/CUhyqfMabACr8DpTbHtoXt3l/TvReY93E6sBkvNHxShEWIbBKkyfhH1geze1Apj5Dy3q37i
	NY0W1UQo5wWudqiIv4RTJS+eaaombPmMB3BHEVleibWMejieAb7u3LQ/QI9mBmKwDZNtXJ1YfZbV9
	qFJXXkHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZhH-00000003BIr-1rkU;
	Wed, 22 Oct 2025 14:20:15 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZhD-00000003BGC-29yk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 14:20:13 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4710022571cso58927545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 07:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142809; x=1761747609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcGPa9BZoRh/cXSf6MM7skWFc5+sWNLhhAzz4IrXMW8=;
        b=PItA0Opp8oulv3cN1VFj0nviiQC4wqw06sNYlvOTA5Kll8D6ZKu8cUfnkJxzPSGARS
         oIDoAo9bianr/Lp11FvIRZdZHSHbTV27n5lcd762ifQplHFtdLn5L3Vu8TfPctx9MFKR
         y0K61QdH9zifWk7zdV9FqjP35n5jUOaitULmJ1MJmZgrqlF6yzVBnXV7p1IapQR3Wl2a
         EpN9fitADxB9WDcx8skPO4Jgu4nK48slbV90uGfPJmiURP2qBiAo9dMPAqBwbktA8QT9
         P2dt8rt5+5WM0dsyPakTkm8Ryq388UnYAWaOlbIAzKhPiSsdbjFSa9JBSsNVfWZRUxlL
         4+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142809; x=1761747609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcGPa9BZoRh/cXSf6MM7skWFc5+sWNLhhAzz4IrXMW8=;
        b=PEmhGsND30L2VGojD0Y9wR7P3R1JSJ/8pf8ciTLWtwTPa3rMyGd1u3wd6IEqaKv2Vc
         1deHhLSbX516qEvJr80pc1dv7tAOPpm+PKBtTE4l8LEQyMJusNeqw3lyM3J3oiwSUT10
         m0lp3YyvKhUZFqNnPCrHMvDtfDBVYDNxgtN2rshkvgPlkrA5SaJwunGyhCR1Nx9DbD9E
         iWNsnwTRbxmDx1CSqKqnup+FxtZOP5OXXv8uMZXqkw3EuY+4M4evYCVcW81Z5NCdwtWD
         rB5Uz1CmdcnNkeaj9w0ftdz1jPXv+agxcQ1717sDjE+zK/4cyf/0RvVobR+8FXtsZiHp
         Qd3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaN9UNI/xHy/BLaaws5HVRMoer9Lr5r6c0CyqukyfmFNx4aCfb7eW7QdQxaq4sfOSYIyJp9PRncRCxB2FJLUUt@lists.infradead.org
X-Gm-Message-State: AOJu0YyTrC+8anBO9K5CTYvmu4zNV8TJXuiIYi31X1KYWW8vyJSrr4IN
	dcOS7WsvZ2+RaYUmyhzKcLvxX4+bk25OeRSRmiIyXxC9BJ9zCXB9yrOl
X-Gm-Gg: ASbGncv+FQ4v0PfKiUVU4KvBtMQC6pUm0yB0fvOZIfVaZ08lhMQPjg880oUsdm6n1CR
	LTDhjOwdFhDhtxEkC2/PDJCry24pI1QGy5927VQcRt/4zpLxqTlFIAuuroOiVAi1H+jqffYQYfm
	DIGBI154aWfj5c5U0w1SHmv6I1PZ9zJO8LezLiMBEHMKBg5UL6QaRVLeVMHrO7qyxTBMOAcsvhF
	rtpA8vvAzP6PzSOxiEaFTRGQIBr2qmxbG4O4xYCx9TeGtRW1meJzXTB2s5k7RHWXnEJxJarwtjY
	G9LTh/lX+pm8cLZDWEszxwvDDbAieu7mIz0YJ8w8PCAYxZVZRlQ8ZPhxobVemG9ecRvgXnCwqFl
	3zknXf4NWI+9Rq/k8SvRZQUk/XzFS+aFVHmrbBI5uy2/qSoRBBX8UuRHGaak4dckw+rPug1sm7V
	uOZNtsJMPFQTLRRyEOw2MoFdt62iPC3YFCGzs2AlgcDLb3mYuqOQCQ
X-Google-Smtp-Source: AGHT+IHX7Sum1LYsRGk4yzm8MqGMXKVdeHe0F7N67aNpUhUFJkxVcT5YpUlblTfJtsz2LXnINVBACA==
X-Received: by 2002:a05:600c:3e05:b0:471:16f3:e542 with SMTP id 5b1f17b1804b1-47117870720mr183174425e9.2.1761142809122;
        Wed, 22 Oct 2025 07:20:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428c62fsm48753105e9.8.2025.10.22.07.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:20:08 -0700 (PDT)
Date: Wed, 22 Oct 2025 15:20:06 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
 <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V4 07/12] uaccess: Provide scoped user access regions
Message-ID: <20251022152006.4d461c8b@pumpkin>
In-Reply-To: <20251022103112.294959046@linutronix.de>
References: <20251022102427.400699796@linutronix.de>
	<20251022103112.294959046@linutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_072011_575299_73C093D0 
X-CRM114-Status: GOOD (  19.39  )
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

On Wed, 22 Oct 2025 14:49:10 +0200 (CEST)
Thomas Gleixner <tglx@linutronix.de> wrote:

> User space access regions are tedious and require similar code patterns all
> over the place:
> 
>      	if (!user_read_access_begin(from, sizeof(*from)))
> 		return -EFAULT;
> 	unsafe_get_user(val, from, Efault);
> 	user_read_access_end();
> 	return 0;
> Efault:
> 	user_read_access_end();
> 	return -EFAULT;
> 
> This got worse with the recent addition of masked user access, which
> optimizes the speculation prevention:
> 
> 	if (can_do_masked_user_access())
> 		from = masked_user_read_access_begin((from));
> 	else if (!user_read_access_begin(from, sizeof(*from)))
> 		return -EFAULT;
> 	unsafe_get_user(val, from, Efault);
> 	user_read_access_end();
> 	return 0;
> Efault:
> 	user_read_access_end();
> 	return -EFAULT;
> 
> There have been issues with using the wrong user_*_access_end() variant in
> the error path and other typical Copy&Pasta problems, e.g. using the wrong
> fault label in the user accessor which ends up using the wrong accesss end
> variant. 
> 
> These patterns beg for scopes with automatic cleanup. The resulting outcome
> is:
>     	scoped_user_read_access(from, Efault)
> 		unsafe_get_user(val, from, Efault);
> 	return 0;
>   Efault:
> 	return -EFAULT;
> 
> The scope guarantees the proper cleanup for the access mode is invoked both
> in the success and the failure (fault) path.
> 
> The scoped_user_$MODE_access() macros are implemented as self terminating
> nested for() loops. Thanks to Andrew Cooper for pointing me at them. The
> scope can therefore be left with 'break', 'goto' and 'return'.  Even
> 'continue' "works" due to the self termination mechanism.

I think that 'feature' should be marked as a 'bug', consider code like:
	for (; len >= sizeof (*uaddr); uaddr++; len -= sizeof (*uaddr)) {
		scoped_user_read_access(uaddr, Efault) {
			int frag_len;
			unsafe_get_user(frag_len, &uaddr->len, Efault);
			if (!frag_len)
				break;
			...
		}
		...
	}

The expectation would be that the 'break' applies to the visible 'for' loop.
But you need a 'goto' to escape from the visible loop.

Someone who groks the static checkers might want to try to detect
continue/break in those loops.

	David


