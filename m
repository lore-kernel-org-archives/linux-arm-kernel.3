Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BA6CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 11:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZ5/2E9/kdHV6wKk13IMjV26fuC0EY7cU/moeac/r0k=; b=T5gw+AoCPUD5+TKhbpo5tIikC+
	1mVE31SXgCDnkp+zp1K1d88xmCtXibfz0x+4v98EamYntSaJfd2os46VssuCrvDOhrSMBTMk7gROJ
	kgiIeoCRd9QFer/ys7KL9GlLeazEQA9/FsstEhHc14mm1xDXAhf2bXk3Dr67EYAzjNR+Rkp+6We6Q
	7WdygpUQm9TAPo6QS5ye1qdMvbp//o9DuKlEffcoJaFEzI8uViiOh/rNDP5ifk/0JKnctDsgtrIww
	75Rao1zpb49gbyM6T+q3jT8OBtMAIrzrnrqLi3z2hUenzq+lq6vCSSibUTg5B3QQf9L4xy+t4TZN0
	eQisgxBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iWN-00000007eWn-42pZ;
	Fri, 17 Oct 2025 11:21:19 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iWL-00000007eVj-1chU;
	Fri, 17 Oct 2025 11:21:18 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760700075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eZ5/2E9/kdHV6wKk13IMjV26fuC0EY7cU/moeac/r0k=;
	b=0w22HeRqwsEaDWfFRcdym9ZdxujQL/SMlrRPuJJ8G0lW0VU+roLNqAQqn+5ddD4XHPvhCI
	G8RfcOVLaDb522FTklVP+T9AWU7a2YUuU3/zS9de1315WWxBoHvU0Nj9QJ0h9Ke1JMi7Um
	5yCRggrIaasOfxTCXZDvGcnXQN5DpN5DBZjhPihilyQSh9zfnpDA51OSo91RRi6YZ2ajDU
	zq9nd/fL2MnY3jElVShCHCxnhdw8CHKx+HzZyOCYRxfE/8sQpHPMZx5+Owgr0vwuACBi4W
	Im9zYuGn3kphxZ4bkop+xrUFJb6ZrY64lUNREC8dmKGqVpm3CuTHhMBvBTfxjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760700075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eZ5/2E9/kdHV6wKk13IMjV26fuC0EY7cU/moeac/r0k=;
	b=yb2o+SyRVbqNJx1T2MjsSgrIjIm9/+bN/XuOD9YUNJmae1nSpVUZAsBLSIxLGfTfjAFqpz
	FrlXldlLVbWUzqBA==
To: Andrew Cooper <andrew.cooper@citrix.com>, LKML
 <linux-kernel@vger.kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Julia Lawall
 <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Peter
 Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access
 regions
In-Reply-To: <adba2f37-85fc-45fa-b93b-9b86ab3493f3@citrix.com>
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.253004391@linutronix.de>
 <adba2f37-85fc-45fa-b93b-9b86ab3493f3@citrix.com>
Date: Fri, 17 Oct 2025 13:21:14 +0200
Message-ID: <871pn122qd.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_042117_556983_8C0CF525 
X-CRM114-Status: GOOD (  13.97  )
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

On Fri, Oct 17 2025 at 12:08, Andrew Cooper wrote:

> On 17/10/2025 11:09 am, Thomas Gleixner wrote:
>> --- a/include/linux/uaccess.h
>> +++ b/include/linux/uaccess.h
>> +#define __scoped_masked_user_access(_mode, _uptr, _size, _elbl)					\
>> +for (bool ____stop =3D false; !____stop; ____stop =3D true)						\
>> +	for (typeof((_uptr)) _tmpptr =3D __scoped_user_access_begin(_mode, _up=
tr, _size, _elbl);	\
>> +	     !____stop; ____stop =3D true)							\
>> +		for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;=
		\
>> +		     ____stop =3D true)					\
>> +			/* Force modified pointer usage within the scope */			\
>> +			for (const typeof((_uptr)) _uptr =3D _tmpptr; !____stop; ____stop =
=3D true)	\
>> +				if (1)
>> +
>
> Truly a thing of beauty.=C2=A0 At least the end user experience is nice.
>
> One thing to be aware of is that:
>
> =C2=A0=C2=A0=C2=A0 scoped_masked_user_rw_access(ptr, efault) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe_get_user(rval, &ptr->rv=
al, efault);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe_put_user(wval, &ptr->wv=
al, efault);
> =C2=A0=C2=A0=C2=A0 } else {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 // unreachable
> =C2=A0=C2=A0=C2=A0 }
>
> will compile.=C2=A0 Instead, I think you want the final line of the macro=
 to
> be "if (0) {} else" to prevent this.

Duh. yes. But I can just remove the 'if (1)' completely. That's a
leftover from some earlier iteration of this.

> While we're on the subject, can we find some C standards people to lobby.
>
> C2Y has a proposal to introduce "if (int foo =3D" syntax to generalise the
> for() loop special case.=C2=A0 Can we please see about fixing the restric=
tion
> of only allowing a single type per loop?=C2=A0=C2=A0 This example could b=
e a
> single loop if it weren't for that restriction.

That'd be nice. But we can't have nice things, can we?

Thanks,

        tglx

