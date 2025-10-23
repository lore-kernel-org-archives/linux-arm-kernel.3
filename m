Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9919FCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 21:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6sEiHIDuaPc1r9BapkeRLwxlBj8uKP+Q15MeH29iBY=; b=n7eqbwfLe3U3jrNrhbP/EUtfRN
	IW74z9hRDyCt5kB9tPcgEu1e9McdePLwLTQ5cxbms51WT1DhKJXP2WKcJt2ayrkQ57rO9eNP1218r
	T7oY9M8ERGNvCZxKapEBqRpDoHjhdmtsNPkcIVPJR8w9HyT+MS1A1R4g/w3MIir3psLA9ar1s6rWb
	DTjYu5N/27cN/SVO7rLY+VOIpRqHbciiBAQsmwsZPaVo97tWpGKY+2Ars4ztUX7MQkOnSIz3G29WE
	l93/oRLjc7mUVL8J2zn8G6dykYKx44RMCZf5U2c3hRrymjo3Iq1uAzSU2Ou/A6HvbwnzxOyGsAPIe
	DH2bDWnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2eC-00000007cfV-0Hof;
	Thu, 23 Oct 2025 21:15:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2eA-00000007cfG-3fEy
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 21:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=z6sEiHIDuaPc1r9BapkeRLwxlBj8uKP+Q15MeH29iBY=; b=lnOU+B7TlZ2WrLmZYn7ahzJvx2
	iimPjo6MrAV/0EX/+LhsDsoQvrz0ANXJO/03uBtWUn0U7kbaDFUdBlTkh1Wh307eH+ELEpB/nRPtP
	HSwlTPTLiBgOtrUWVbUAn4ALNqEH61JfNShCK2EVE2jPKpQF8mNhbAmLeRNwlfiRy68imN3a3Tw5q
	ipRmbiOKnAqrFTKtZg+s7xfJ3kXBGOT8RQZ2Z7DpEJ2TwBN2uLM1oelhZbQ6iCTnr9CV1dgPE6gEp
	qQ5i32j/sJHTy454Zlni5sw0jq30rIDmspcz76lSWGEM0XSPNYzpZc65XsU89WCp7FU4cbDhHn7dP
	/YBVYYBw==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1mT-00000001lT4-0Scf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 20:19:30 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso1644010f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 14:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761254093; x=1761858893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6sEiHIDuaPc1r9BapkeRLwxlBj8uKP+Q15MeH29iBY=;
        b=AOiSM1X3ScYZBNIeIckcc/m0pZJsuSlGDyEMWzRijc5O11NQzzkfnJjJ9JTR0oRios
         6wsP+ZxuWMz0l/fXY8e+9GmxB9Z8JpthjUMwfC6fLoDA+6sMz2isCwgL8SFImSy45dBJ
         6HLFTBkB0JTGAh8ZKCReDcIH+vyiT6Ok0DLjZOsHxlyboCH5lHH5gj6+9NOtSJLqBN0U
         5mlCRWZrFSm2vkFeO070J9adbb/U1PV8mpCK8+YytzqfUdhjeOTq8vf8LAE+kD560OQa
         fPyTR3fuDQe0VX6AqAwoLJSkk9PFszz35ksQpQjNPAJasELMifJmOO9ySFX5rf3rzKEH
         5Vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761254093; x=1761858893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6sEiHIDuaPc1r9BapkeRLwxlBj8uKP+Q15MeH29iBY=;
        b=bkoQdpiJg7smA68QoUMs8oYvYP4hOvjkM7eRTySlv7xA1QgCZEuLi5Qp+JEDHIdTMj
         X0ERavyeihBUahudxlzRQW13WOeyIaaoemJOrcVe3/CBIuN9oEPX8nFumR8pD14tNEmO
         JwX/EJ6gf1//xvASP/7h1i/JZRBRFpuwtYYEOq4YV+wfsJpn0dvniRHJHECOUS/wrk/9
         drIdyUjjxkAqbRQItMTd580CxIEhHIVq6IWUmQIe6F+Ho29h2yfpWYAWJfhoycFudcu/
         52qqQUkN/RyiEUTeBQ2+XqM3xvqz9mG7O6+XAOsrtafsmbaBA+Rdu3Zw+uyy+9bJw6MF
         yl+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXa6vrnCT1RjqExMqmqo0t7KWLy6rSbJzul52/ZAOgbp64asvnMMooZAy80Oo8QNcrDJSTOX7wFUIecsI8AF4W3@lists.infradead.org
X-Gm-Message-State: AOJu0YyWVWljG+m+axGGVaM7VTIIkPOMrTW24QVLMhwxT2QHvpXev6Fb
	GtIP3TlIp1sYHJWzR0litW6BqU75lb7xgqiBDsn1RW1bFXbm14+I18jN
X-Gm-Gg: ASbGncvpp7q5JcskDrUe4kglMnFBO5V6I18wh0zssk/1ShIVLfR9XMcfaMR77ch2f7V
	JWOpH7ecRVUCpP9l89tGAvCC5EMY+QpRaYkn7ZoRAHgcp06Pbt3dbZAc2WXpKLPUbk72ae+pBfL
	zxoSrvWRPuMiEUvgI6YYf/GMfqc8w2oMWia4F9lfqBVfl+RUk88uvU++OrcPv+AmY6Ml3x8YO7G
	IjiRe+MwYebfA43bIWqDakTPqv9UwS6RpEOZhhr1NQIcBgsLBT1XYSYJ/wxxLYlnwUWXgKGCvDy
	rGPXKObeo/9YbfV1ZmBlmLYCp9OmAJ1Au61F4Fo5guXs4WlQfFc8zb5AJ6WEJak4Nk8XpYbQCj/
	RV0FHsTwN+FZdIxAOHiRUd7CzJwla2XlOhcwYK7XPJhwVyI4k6Hz1Zklh64MlhbgRGK2mIti37Y
	QKsiy7plKQrO0oGyzwSUflKsGyxvG8PiTdi5ndcMb3KQ==
X-Google-Smtp-Source: AGHT+IGk8eEDWy3Lb1qhGeYZ8N0urG/YCIu8xY7+WZCUmyVKdYxjr9Zc6A6l5BFcgm2g7Vw9SfAVXA==
X-Received: by 2002:a05:6000:1446:b0:427:374:d91e with SMTP id ffacd0b85a97d-4298f545550mr248975f8f.11.1761254093423;
        Thu, 23 Oct 2025 14:14:53 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897ff3f5sm5951290f8f.22.2025.10.23.14.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 14:14:53 -0700 (PDT)
Date: Thu, 23 Oct 2025 22:14:50 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML
 <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, kernel test robot
 <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: Re: [patch V4 10/12] futex: Convert to scoped user access
Message-ID: <20251023221450.1303003d@pumpkin>
In-Reply-To: <CAHk-=wjoQvKpfB4X0ftqM0P0kzaZxor7C1JBC5PrLPY-ca=fnA@mail.gmail.com>
References: <20251022102427.400699796@linutronix.de>
	<20251022103112.478876605@linutronix.de>
	<CAHk-=wgLAJuJ8SP8NiSGbXJQMdxiPkBN32EvAy9R8kCnva4dfg@mail.gmail.com>
	<873479xxtu.ffs@tglx>
	<CAHk-=wjoQvKpfB4X0ftqM0P0kzaZxor7C1JBC5PrLPY-ca=fnA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_211929_228118_B9ED6085 
X-CRM114-Status: GOOD (  15.98  )
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

On Thu, 23 Oct 2025 09:26:12 -1000
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Thu, 23 Oct 2025 at 08:44, Thomas Gleixner <tglx@linutronix.de> wrote:
> >
> > But as you said out-of-line function call it occured to me that these
> > helpers might be just named get/put_user_inline(). Hmm?  
> 
> Yeah, with a comment that clearly says "you need to have actual
> performance numbers for why this needs to be inlined" for people to
> use it.

Avoiding an extra clac/stac pair for two accesses might be enough.
But for a single access it might be hard to justify.

(Even if 'return' instructions are horribly painful.
Although anyone chasing performance is probably using a local system
and just disables all that 'stuff'.)

> 
>            Linus


