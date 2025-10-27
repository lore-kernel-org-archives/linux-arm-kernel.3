Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE884CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 15:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lyo3P6jUrO11oV/07r7VEk3+sHuM/zfcTZIIBqJLkxg=; b=s0lJEAsmg10NIiyOyl9wjRKrk3
	b+xzLXE4E0jfwsKX12YIhnpLR5xCzf7f8AbeyteyDsPN/p+NzPYAR7e1Ch6WbI91xEd5CqiTTNlxB
	rI8aSRpGYUt3CLtCfPFq8wJ6ZRzNGxksG09ClMi72R/RWrPUeHRc8IQPmT8/TO1R/ikK4AK2S/UE5
	yUwfYzIu4TEml7KdkYWbHN9o2Pf9NfUsf8P3ckaz13TzNCXxt0Z3nuACBmuuVErvm8dPYh0O+V0+8
	1f0MooQcZ2z6it2oNcYWdUt4iEBE9n/DevsSGZs5m6uhxoYW5GPhNReolO7j5D/AtzX8Or85fb0tN
	DOvxy0UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPXo-0000000EGOF-42uO;
	Mon, 27 Oct 2025 15:54:04 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPXm-0000000EGNS-0AAl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 15:54:03 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b6d53684cfdso1083339666b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 08:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761580439; x=1762185239; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lyo3P6jUrO11oV/07r7VEk3+sHuM/zfcTZIIBqJLkxg=;
        b=QMjgtlFUi/pD22IE4k56eIxVTHqFJNV1ACQMUSXSFDg3ugmWE1L5+TeDU5MaiBrE8X
         FDtPxlxifRzFXAe1gzQAhShFcjN7eh4v/MNhxTFcRWGDRBTKpn0PnXuaDrNfrZ352J5i
         bu3EMoyuOMVEyNZL6HUVisnicivN9AchKp6Mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761580439; x=1762185239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lyo3P6jUrO11oV/07r7VEk3+sHuM/zfcTZIIBqJLkxg=;
        b=M8+O6GhOHApqQbZ136HXi3VxIo5kfDUq1S0GVs+pSN8cSq2yUp01VVtq6SLdQzCuiI
         b10xIMI0r8CRlyFXzfYmSZSESFsMykSY07yV1mKwfS9NaaRX0cUB6WJ0vfWSlZvkdH0V
         YdkiCrhwao/wbPDmennbZ0BrAgcWSfaqKt7kE9D7M/ZXmfhJKemGsGTjd2ateYCUfjRq
         jixmfqd3qg159yKMQ1KvWy8fjWLUCNkcQxhqOkEDOo3mWWrjwKDw5X6sxxTgeQZQYtpK
         f0NdLwnKbzB1UBAP+tp/1or/i4W+94bfc4mZJeOZq75O8nkoywR0D7jXI376R3qZInWN
         yqzw==
X-Forwarded-Encrypted: i=1; AJvYcCV2V+Atlw/Sc1pArWcBDngzLhusIiru7sjbOB9oUN9/1V16YTxPfvejrDB+uaap2h/13lg7Yzoz2pROPDBCAJ0o@lists.infradead.org
X-Gm-Message-State: AOJu0YzSu5xHTP1KMhb3esxAAmHeA3rOJEZrGjLjYT9haulpYoQDWzUN
	GKKsiSgrYISQrMXkwcUyTAsq9y167SmCDWMCEwJv7CfDi7iQiUHZyhP5CCd4jFn8IfnS3zuI6Wh
	9UT353nY=
X-Gm-Gg: ASbGnctNm5/Us1FCuKZlXkS/MVwa236KelmFM6u/evfiupXPiox/DIDbFSyYZL04U6a
	PCMJuLtiAlk1c4kt/klbEmCm9U7LdVZDSoilRqGFfeMCaL13rD1ZV1riGX3heba4rhzo5Pwmi66
	FH06koIsmxxnEOne+322mB0iARJUhkLBBwG1VXtAYqs/gh8ZkA19c8UvXh6UW/Qf4yy1pRbQ/tB
	YrGgAzPvjc2+vC8c+jqfvo5N56GvUvak3gburU2ZT7pIpUzbkRXs1Xp5uIQYwm3p6Me9M/UT65D
	hQAfDZ8asn6OqYmouRQm3w8l0jemRcSYifLpL2nmTTven0BN3EV58oG01qMyQPw6vVeXESk0kh9
	kqzBsVbCLjZsq+pftTLG7McpGlBxryw+h0w5p2heQ9yIQPvA/Fy+pXQJPYioeqBtd6GJDUBfQOx
	W21UbbrioyeQQZKJaphm4T5OMTmgKvAE/d/D9N/IBZYaL3/nDmVN/0koohy5CXFmOroqS3xG0=
X-Google-Smtp-Source: AGHT+IG0ggg6de/7SwehdrMlBq1KzpqYn9RGRA85PKi8x8fKOKRW9ANSAtAGjKbXE4k8XodDkHhKYQ==
X-Received: by 2002:a17:907:3f0a:b0:b6d:603b:490f with SMTP id a640c23a62f3a-b6dba56f8eemr33784566b.35.1761580438712;
        Mon, 27 Oct 2025 08:53:58 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8548eda6sm784596266b.75.2025.10.27.08.53.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 08:53:58 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-63c09ff13aeso8306397a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 08:53:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmnZ3I9OdRCgsqkPqOrGAD8bgpFPujHM2YYvBQXmdCcfyYcIQyUS++GboJRJKIALzcjNbv6mtVn32bhBRln4Bn@lists.infradead.org
X-Received: by 2002:a05:6402:4412:b0:628:b619:49bd with SMTP id
 4fb4d7f45d1cf-63ed84db9e2mr369134a12.25.1761580437926; Mon, 27 Oct 2025
 08:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <20251027083700.573016505@linutronix.de>
In-Reply-To: <20251027083700.573016505@linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Oct 2025 08:53:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiZ0RdDzpafUUduCn3gOVX3a=ZmGOw7wu1s-jqe8KypDA@mail.gmail.com>
X-Gm-Features: AWmQ_blZNXFTqWGx07mPO-qNDyYJc9sRx0MxijvPg_spVplnaBKcigb1OKRcACM
Message-ID: <CAHk-=wiZ0RdDzpafUUduCn3gOVX3a=ZmGOw7wu1s-jqe8KypDA@mail.gmail.com>
Subject: Re: [patch V5 00/12] uaccess: Provide and use scopes for user access
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	David Laight <david.laight.linux@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_085402_086522_29F2CBE9 
X-CRM114-Status: GOOD (  11.40  )
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

On Mon, 27 Oct 2025 at 01:43, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> This is a follow up on the V4 feedback:

This series looks all sane to me, and I think the naming etc now all
makes perfect sense.

                  Linus

