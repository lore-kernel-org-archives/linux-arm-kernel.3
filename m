Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA67DCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 15:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0cSMAwFRMJRxsYANvmyJeRZmZI2zdPSEESzl/tT500=; b=3G3My/0QWmGOsymXGcfRbz+/Wh
	lTxvezQg0P2y4RQw8wKKtlpHAgh9Lk3Ji6HMeKpX3TzIZEr/EFjnZxriIQpxzVxmYBD/RqRiS4McS
	XHW2X0E4LSr5C4NqW1BxM2rotQr5GsiAEhAxYfxaN5ZIbao28dGjQUWTr9qRpLdWffP4HQguBF/3e
	Ychyl9Uh54v/hba8xFp5DDdDDNyjZXQJ0KQuNt9oCDYGX/rbbo4XsnW4Wr1htE8RBMXJfxN3dzKtK
	8IvCxUnV43YqRzQaOnj8Vtk/u/b+TWo5m0+NfRt+O67XJdJTgzI1Yt2nEHDSLcN/UsCTil+6YFviP
	VaV08tHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEeL-000000000KF-400Y;
	Tue, 21 Oct 2025 15:51:49 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEeI-000000000IP-3yi0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 15:51:48 +0000
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so1107677366b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 08:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761061905; x=1761666705; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+0cSMAwFRMJRxsYANvmyJeRZmZI2zdPSEESzl/tT500=;
        b=aOI4+egY1i0vNTXhfRArn60A6WJlpAUM7wcgTbDmI2ssdpIrAPqOzJcW/5UZgBDahR
         HsO9t89ysgkZ1X3Asws5XzYG8kK+pR12r9JChnyYUaJLKxAtXQxatgaB3rUIbH2cbNmV
         pyW7H0idren27fgNOPRvACkT87E7taZklAFnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761061905; x=1761666705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0cSMAwFRMJRxsYANvmyJeRZmZI2zdPSEESzl/tT500=;
        b=S5w1I3gM3rYB/htN5G4xcKJ4DGd0o5YLxda7xwa0t8p/FdpGexqoBcJ5SDAKeZd5u3
         R9E/g8OTnvV7mVVIt0TXsD/e2/KFHohLmNiCwcZqfLMPRLAvymA+1IyVkOOARLvg4IlS
         ErRMa/f0dl8AQ8kXMfkY8ogPxuPJNghV/kMeMYR+Bq5nnO+25JjxYR7U1UEbPdm24LJf
         EyE/k5dJtED4Z+BkYcRj07yHjKA3FvOPiNIjchlXmC7+Z8RhDgUMBhq0XwKVgUToipZZ
         sWu4nC09TSEkUhfADtE8lQDNE9yzJgKgo7bLbMZtVQ+xeKuFwDZpXhJ2gTRS5+8P3aw4
         Zbmg==
X-Forwarded-Encrypted: i=1; AJvYcCWjUJjHRdQQbr3+hIAYwJuXLfqKShywgD/QsRic2MSRBSjBItTb2itT0jh4wkH5eMThKnRO0pAYASnpwA794w/N@lists.infradead.org
X-Gm-Message-State: AOJu0YwXaBkbH0G0GhlW1VWiaVdNCtudOXPspXjusUNREThBaSjdUFAL
	fANUIODHK3+oFLHYBnpz3CMHQRm3gc/BEw1KSPGnHcgCSEeYf5pj+1RZtstcIELgVYHOjJ7fNoy
	PcRYdVB3cKA==
X-Gm-Gg: ASbGncvpsFL9aLIktDPxbRbpnTpfqhSJVBVNAjNbdy1smkEHRqekYffsgIr84jCOu9s
	vJfeQtiEN6DvkdfmPk+d7JKaur3WVFnOmGtoS7BrvXvi0YTND0NzxnYO7Zw3ZD/tBkP/DMTyynJ
	KqLFDP53HZB67Cb9JK/UnfqLNWphpgwsYG/Pq1m6kvoxvuvd79WiALiggnmpu1JkaeW0GqAH273
	0XbmTT/XGwW/POpRHsccGdkLFSAr0C0QsVXOJwDHl+LTbB1zQRsugNvg1YhFCLqRoDsvUKrZbXy
	HH45v6mddxpnlcu789WkcRtUerwDhRlRNchI9s0FYdRacYQGciWnVMayxeXE7cpynP0V8C2HN4V
	C4236utgr6hJQkJqXMcQi53u/TSL06oP5qdd8ITJYuiE+6HEtPPTEhwO7zyvDdzn+xlkDbT3Tae
	G/KtR3QM5+8oDrmr11agJVCo9Dqx9J3nZ3F3l/JhPVNcwjx7pS/c0MMIZNYwldjpETIsY0Pyc=
X-Google-Smtp-Source: AGHT+IEcU52fNetJIUzy9F2dMhk0p3kl5cA4zRfwVcGStB2Nf7CL74oEpa3ZPdd+3S+keC74+XOh+Q==
X-Received: by 2002:a17:907:d18:b0:b07:c1df:875 with SMTP id a640c23a62f3a-b64768d4ffemr2197405666b.56.1761061904715;
        Tue, 21 Oct 2025 08:51:44 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebc42963sm1114289966b.77.2025.10.21.08.51.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:51:44 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-63c3c7d3d53so6819955a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 08:51:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLmInN5nbmoZO00fPzAYAokdIJVZ8NKrNC8QUC3aeS6IGcHRib8ca+oZRCvkZifcU7/M0l9uAdrrwe7QUcI2Gm@lists.infradead.org
X-Received: by 2002:a05:6402:518e:b0:63c:4da1:9a10 with SMTP id
 4fb4d7f45d1cf-63c4da19c97mr11628470a12.31.1761061904052; Tue, 21 Oct 2025
 08:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251017085938.150569636@linutronix.de> <20251017093030.253004391@linutronix.de>
 <20251020192859.640d7f0a@pumpkin> <877bwoz5sp.ffs@tglx> <CAHk-=wgE-dAHPzrZ7RxwZNdqw8u-5w1HGQUWAWQ0rMDCJORfCw@mail.gmail.com>
 <871pmwz2a3.ffs@tglx>
In-Reply-To: <871pmwz2a3.ffs@tglx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 21 Oct 2025 05:51:26 -1000
X-Gmail-Original-Message-ID: <CAHk-=wj3VgQAwUjfM_6f5O5gFr4kXBma2q5m8PLarRCnA8R49w@mail.gmail.com>
X-Gm-Features: AS18NWAG7YIQvZWdpCHOlvhJ3OJWyOrD174ntZFm1lwB34kJVwOkBypjHYnGjQo
Message-ID: <CAHk-=wj3VgQAwUjfM_6f5O5gFr4kXBma2q5m8PLarRCnA8R49w@mail.gmail.com>
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access regions
To: Thomas Gleixner <tglx@linutronix.de>
Cc: David Laight <david.laight.linux@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_085147_000589_00E8C8C6 
X-CRM114-Status: GOOD (  16.25  )
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

On Tue, 21 Oct 2025 at 05:46, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Tue, Oct 21 2025 at 05:06, Linus Torvalds wrote:
> >
> > We could still change it since there aren't that many users, but I'm
> > not sure what would be a better name...
>
> I couldn't come up with something sensible for the architecture side.
>
> But for the scope guards I think the simple scoped_user_$MODE_access()
> is fine as for the usage site it's just a user access, no?

Ack.

               Linus

