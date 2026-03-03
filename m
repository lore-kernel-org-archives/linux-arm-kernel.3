Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A95EC0463
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 09:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hy9xICo1EPoOGuMUjTJL88qGfqc1hJzlCloLKGWnZI=; b=1Q41htR6k+B3/W1Vz6Pnrwp3xO
	CMZrmKOGN+1+nz/JOsqBwCQHnCvEZ1OHHF4CrQ20lj4qQKNcFhXKjy8t3ubI1MMbvRFdVP3qde7by
	SVfBYASDksM0yGrXNeayAMDl8wMIvMtuPhsH6PhXCdPHR4lPygu0kv2wP9NBmqW7Go6Z3rni7++Mp
	/TWDgm44QvULK8upM+3pYHVLkmgRN5lpIQFA1WdC77Z2QqkopJHRyfq6v6VqiXcNPuID3BfKwEc2A
	icHiHRo4xc5YBfD0E+JI58sxS7B/mizHiLuj8w0ZFK76rfenEQfRqnHJazgugLo4ADPqO/o+a5zZy
	+u5SWjng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLng-0000000EqO3-3mkK;
	Tue, 03 Mar 2026 09:12:20 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLnd-0000000EqN9-2Gf5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 09:12:19 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso48066055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 01:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529135; x=1773133935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hy9xICo1EPoOGuMUjTJL88qGfqc1hJzlCloLKGWnZI=;
        b=d9Q2s3elOXsLJT/Y0sreTUJd9SijpueosTJalBQuZVgKf6rQrsEDGQi6s7CWE7K1XS
         MA+J/x9lFfxnw2HDPKtB3UyKkRV9V1/8+x6gSH3qVOvCAHKxZNaFf7fxsKghN2ti30AQ
         O4OZrbgJh+eQAMK4EEIb5JTVNU68QOy9rOAS4eulrxBCSudsFcwG4mCT/QSmg81V5Mm5
         8MOgRkNBm7MFuS2zFkgWY4JrICrXd0SKGxBdkTpvrXt8Ugx57jqaP/yajRhCBpr0BYZZ
         3kKY8XxjEe4gG2j+B79j3tftkiYqxd5vwonwXQBhHUUwSLFD9W/ydGbblrEacIDQ5kep
         4sTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529135; x=1773133935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4hy9xICo1EPoOGuMUjTJL88qGfqc1hJzlCloLKGWnZI=;
        b=gsFLuCstLIo3c5WSTzaQd83BrNnumCzAVxfK9bQDT62BeorI3IJ/6Hz60D8TALsrnd
         EWLjWJWkjgj3aST1iygMGguHhFrAeiRBluMiGkOxmm0IYDCRgwnDqiLNRTNC/fGBjUWu
         0AZuoSN+SCQoMhlQRjOQdhZvgm4uaY+ZfmAHbYb7op4lrW1Aa4uyB7EKfm//YdPB+pCW
         DaGC/1WxARl15JaaCsv38Wyqs4PyikJ4XDnX7NLZumV53LKfIvsUgYq3Y3wOGf/Om/Pf
         HxUIVFporDu1yCC4KSNh0mu1ORm3Ke2aY00z3Gau+QxHdJp57Gxp4pHp4CuivCcH+48Z
         jR7A==
X-Forwarded-Encrypted: i=1; AJvYcCUIHna0geQxi+VoYcEFIE0c5LSXv+Sq/PEqUcR2R5F3hWSHPwM0oWOLMAlavSJisrcfVpXjwgBxCPBODZi4/JwO@lists.infradead.org
X-Gm-Message-State: AOJu0YzV/Z/JhIgx1B9WXxnoAEkJhmBIcF4WD3nYqjtrRb/m9qPQy8N7
	03x9jh4mOZQ566Ep+re/cB1dT5kUFn/OKuh5U8TCAXMqes652NfTz5Rd
X-Gm-Gg: ATEYQzxoZe6Wi5YtNn5nPg31RagCDLaE9QQYImHKX7xoSkjgzoF44cC6JjEbQD4KnIu
	a8rFLPkX+J1v/i764UCUOgocdsoHwuNRiYWIRJTcHj3vVMjN0VgtkyfnnC3lNNH7LLEo+Jpx8Kx
	fjlkGZpM2w0cy6Fz+Z8hR2Xwdos/HTx9yBa+eFsMi5bbYAdWHAo+rlyRjxvC/qLt8kf3oglSHeI
	YjJJyn0sY0JANweqhMs3RHU529AAY2jMFlIDfHTowATDwjbA7lRZwHgj2OD2FNvjnJRjNmci6lt
	hBRtUPEa0yky7FEc8bJiq3R7RM0CuSSUL23nz1ERjrCdCl4CCPc3JN8ankOBCm55NJgEmixjUXC
	3MI4JCDl9km6ysxlH49+31LiSLMElvkOLVr6NZ8IM2uSH/TOKadpt8NUPE6l/zItFgJi0ekiusY
	I3lzfB7n8EONsiSb/dgtZmcLf0qibE8+bRGUJOUuNE1OvZEZKCw32c0yD7r2u+4ElS
X-Received: by 2002:a05:600c:3542:b0:480:1e8f:d15f with SMTP id 5b1f17b1804b1-483c9bc5596mr280473755e9.2.1772529134880;
        Tue, 03 Mar 2026 01:12:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48512692c14sm13045615e9.7.2026.03.03.01.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:12:14 -0800 (PST)
Date: Tue, 3 Mar 2026 09:12:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Andre Almeida
 <andrealmeid@igalia.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Christian Brauner
 <brauner@kernel.org>, Darren Hart <dvhart@infradead.org>, Davidlohr Bueso
 <dave@stgolabs.net>, Heiko Carstens <hca@linux.ibm.com>, Jan Kara
 <jack@suse.cz>, Julia Lawall <Julia.Lawall@inria.fr>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Nicolas Palix
 <nicolas.palix@imag.fr>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Russell King
 <linux@armlinux.org.uk>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, x86@kernel.org, Kees Cook <kees@kernel.org>,
 akpm@linux-foundation.org
Subject: Re: [PATCH v2 4/5] uaccess: Disable -Wshadow in
 __scoped_user_access()
Message-ID: <20260303091212.620241c8@pumpkin>
In-Reply-To: <e54368a9-9118-476d-b999-bcd60847f0ce@kernel.org>
References: <20260302132755.1475451-1-david.laight.linux@gmail.com>
	<20260302132755.1475451-5-david.laight.linux@gmail.com>
	<e54368a9-9118-476d-b999-bcd60847f0ce@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_011217_595225_B68A3724 
X-CRM114-Status: GOOD (  14.87  )
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

On Mon, 2 Mar 2026 16:00:26 +0100
"Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:

> Le 02/03/2026 =C3=A0 14:27, david.laight.linux@gmail.com a =C3=A9crit=C2=
=A0:
> > From: David Laight <david.laight.linux@gmail.com>
> >=20
> > -Wshadow is enabled by W=3D2 builds and __scoped_user_access() quite
> > deliberately creates a 'const' shadow of the 'user' address that
> > references a 'guard page' when the application passes a kernel pointer.
> >=20
> > Signed-off-by: David Laight <david.laight.linux@gmail.com> =20
>=20
> There is a problem with this patch:

(badly line-wrapped errors deleted)

It seems to need gcc 12.
(So Linus is in luck.)

Prior to gcc 12 the #pragma generated by _Pragma() act as the
controlled statement of the for () loop.

Trying to put the _Pragma() inside the for statement doesn't work at all.

	David

