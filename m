Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF8FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 19:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoyRAxBYJ97KZHdMcvP1wI7gdZM18PW/SDBquVzm/CM=; b=DAW+FiTtfe5qygMQ68KfZ3ied8
	vix38Q5sYOsQfWXFCamXqSHzP92+27hK+znJjMZkWKqKpmJyFFUyOrvijcdbDGeQ3tk1XAC9iIIqU
	5DOKChDQpJiKuZeFzTVY26o8WGanAQ/fC+OeeKqYfi6QBQFpAOD2gPwXFI5FvEIht2qF1qCXTYihz
	R9j2lCYXfxrlsvfSabW278p3VBhRAXCd4Cp98zpR6J6Qeh/1MnHGvktYwyIqAbsAq7lFgOxck0z2u
	5vEU5MAeSjoNEIF+VWjTqyoXBJE7WHgEQm1Ole4GtXFsxkMfj5MM+x98zbFNJ8YqqhxLWZC3hPN5u
	IMpP524w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRyJ-00000000gtW-18vo;
	Fri, 07 Nov 2025 19:18:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRyH-00000000gsi-0vmd
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Nov 2025 19:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BoyRAxBYJ97KZHdMcvP1wI7gdZM18PW/SDBquVzm/CM=; b=D9tSwbNqxvZqsRO+aOEKeGYGQv
	sMhvaaMmXAWgIxXmizQfj4od/0JoD73V1wEzgYm9bgOGpcMqh5vNxghd41N360JEbWr7PLFTPnWg0
	3baFpJYWoHe1isZoGS5vFWaYlsEXuzL1kJOyHeNeJVUCzcA/Ns2gBybH32K0zsWppID7uZMtt4AcY
	01Pxk/cSACJc4jPG7Is7vbb2id9Z1UvM/awg0qGEXUZlK7WnkGUyKrQzy2hJ+D/lAKmY94EMBBcHo
	A8FfgJ0Qq/cpXSEnnfSz73+8pi1J/EWfI9pv6xJrIOEvKilHr8mS4MPpyeWiGQE0nw6LekpO7C3O3
	vxdkOm5A==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHR6W-000000073cY-1W70
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 18:22:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-477632d45c9so7386535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 11:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762543079; x=1763147879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoyRAxBYJ97KZHdMcvP1wI7gdZM18PW/SDBquVzm/CM=;
        b=KSB8hF3oBKjuoFgcYj0nTEdhuWMbRn6xNgXkLXHyGHpPF/kdbeR8QgrP55NKSM7xTe
         Fah8sDxHI8HzL30E0qiWqaBWp+Tu91wflnrqAC563QCqltWJB255BACpU8zhIObqLjei
         ZwvtuiJuvhnU/14ONNoRGdu0fr40JBUSZKZu/HBXh+zc9ar5XJMO9z6fEqN7E3IJM+KV
         aGCHTXjw37eSiwHfd1NqeQ/UpqIuWunaajTxww8lfwqRY+7mLoe534OWITcvHlpbaI9f
         cW9t7Fn3l9nTHNmYgoacenDKkJHbr8o8tA1Q9E/ri87QBpDjeZuspw8o4NsQnLzc3Hih
         azRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762543079; x=1763147879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BoyRAxBYJ97KZHdMcvP1wI7gdZM18PW/SDBquVzm/CM=;
        b=S/fMR7A77s76SPPnj5dZ/Ius+swiq9hDTucLJ73Xlh6kK7OaNBHJvOzCXFAUa5BpO1
         X/Vsno/LuV9T3YZvGRZwmBA2B0MOjwB197uE50adsoaF22RzV4p/Zg62+bxTZA0YY3Pg
         9rEXnC+HnBItwYAaaRkcwvwDKFBm5zu1DGIKZN1wn35GFL212TzD0gxWxVYjWNmIvZ+E
         zufU2szzPBdxF/HhPgY2nhjV4fwm0z2L22wXph6s6HH+rgfT86rC6mI3vYvwfe8fodtR
         bfYIpvIuD9TagBNc8nGgfR/fSfS3vrqiLEfof9MrIbB7pgt0CTZyy6of77dkkHNF6TOe
         k4pA==
X-Forwarded-Encrypted: i=1; AJvYcCXmKF1EGg1ZZOtAnCLtgAEmP545aRhJ3G2BhwupAXqg9x1LBz1GwcT+aB0922M+HNfiEKjvov+wPhm7hoCCujo0@lists.infradead.org
X-Gm-Message-State: AOJu0YwfXG6NTIeMStQ+AcdkRqi+DMw5wdFnkdk3bb1rJ7psxHALiEIb
	LtONsk0pC5FjVht2bv/bM3mrRdhGoOj/JAk0A5qooTJBGkK/ijCE1PJ4
X-Gm-Gg: ASbGncvxUF5aDvkvfa+WT/cKL8qGxdVcVS1IAjJSHX8vEtGCyHRHaNv4EPH6Shr2grm
	MSK3G8lURgdFK0J3BzpGITYgSW3p3OhrwXVQeAvXhE5hThNUYVnLnQE38A+84IKu1aNEgcsOEjJ
	YZlxkHJKViM1ud8wUC/hBVwUeEKipiCuV17btKsb4vrVEdu3gJW4w+5fV2jxD9swGQwooXI5pYU
	ypgrhqCDPA4vVlXzkADu/s/ds/w7IfH4sWHfIVj0Nl2aYv5s5MDCSphbT1SYbF4Oiuf3IEubO7S
	fN+6W2QuCU0eKqb+kqTlqrT1dq0DnYIxURAiVLPl7NWs8XCaCOceD9QRCLCQC1IDo6AfdqPSaJ2
	MLJG5qLbiSOT5dky182OcWt+BTu7OqgMseM5fdUogHLkDiS+I6vq+CsU7Md9QZLnshdrUzupz2n
	LkI+9w854XOuKoEfZHhWkkRZAy9ISqE9XMViYTCZ0SG1KdkhTHs4Td
X-Google-Smtp-Source: AGHT+IGwWldiHMKs6o3o24t2zUapUEv2nDiVIW1qgftMpp+s7M3k154xFpb/vMUGopieuIUWMdpZmw==
X-Received: by 2002:a05:600c:45c7:b0:477:55b6:cdd6 with SMTP id 5b1f17b1804b1-4777322f0a4mr1228445e9.10.1762543078570;
        Fri, 07 Nov 2025 11:17:58 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62b23csm6811350f8f.10.2025.11.07.11.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 11:17:58 -0800 (PST)
Date: Fri, 7 Nov 2025 19:17:53 +0000
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
Subject: Re: [patch V5 07/12] uaccess: Provide scoped user access regions
Message-ID: <20251107191753.7433d2dc@pumpkin>
In-Reply-To: <20251027083745.546420421@linutronix.de>
References: <20251027083700.573016505@linutronix.de>
	<20251027083745.546420421@linutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_182232_481253_F98E2442 
X-CRM114-Status: GOOD (  18.16  )
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

On Mon, 27 Oct 2025 09:43:55 +0100 (CET)
Thomas Gleixner <tglx@linutronix.de> wrote:

> User space access regions are tedious and require similar code patterns all
> over the place:
...
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
...

The code doesn't work if the 'from' (above) is 'const foo __user *from'.
Due to assigning away constness.

The changes below fix the build, I suspect the code is then correct.

...
> +/* Define RW variant so the below _mode macro expansion works */
> +#define masked_user_rw_access_begin(u)	masked_user_access_begin(u)
> +#define user_rw_access_begin(u, s)	user_access_begin(u, s)
> +#define user_rw_access_end()		user_access_end()
> +
> +/* Scoped user access */
> +#define USER_ACCESS_GUARD(_mode)				\

#define USER_ACCESS_GUARD(_mode, void)
(but change all the void below to a different name...)

> +static __always_inline void __user *				\
> +class_user_##_mode##_begin(void __user *ptr)			\
> +{								\
> +	return ptr;						\
> +}								\
> +								\
> +static __always_inline void					\
> +class_user_##_mode##_end(void __user *ptr)			\
> +{								\
> +	user_##_mode##_access_end();				\
> +}								\
> +								\
> +DEFINE_CLASS(user_ ##_mode## _access, void __user *,		\
> +	     class_user_##_mode##_end(_T),			\
> +	     class_user_##_mode##_begin(ptr), void __user *ptr)	\
> +								\
> +static __always_inline class_user_##_mode##_access_t		\
> +class_user_##_mode##_access_ptr(void __user *scope)		\
> +{								\
> +	return scope;						\
> +}
> +
> +USER_ACCESS_GUARD(read)
> +USER_ACCESS_GUARD(write)
> +USER_ACCESS_GUARD(rw)

USER_ACCESS_GUARD(read, const void)
USER_ACCESS_GUARD(write, void)
USER_ACCESS_GUARD(rw, void)

> +#undef USER_ACCESS_GUARD
...
> +#define __scoped_user_access(mode, uptr, size, elbl)					\
> +for (bool done = false; !done; done = true)						\
> +	for (void __user *_tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl); \

	for (typeof(uptr) _tmpptr = ...

> +	     !done; done = true)							\
> +		for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)	\
> +			/* Force modified pointer usage within the scope */		\
> +			for (const typeof(uptr) uptr = _tmpptr; !done; done = true)
> +

	David


