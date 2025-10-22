Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6F8CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 15:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8Ks3283lFKT/3or/kKLaFk/rSeUKOKq+L7qyJbrS/M=; b=yKCF3fqQXEDCO+U+0pVhbD1EYA
	7oseD+bNawV05BpRyjH9iJkJ5aOOKAqWroWj/aJVEVOFr+ERCgCNTZXpF8/8uhx7LOCmYk2wUyBwW
	da/dt8lGKrJm8v9sUzGXbUPGtM9l3aZ+NglswOOCmhFc7u3cu0caBSEOrKjC7n4Jt+ZPM3FUtk0Fr
	gfCfRVN6nwxbKkOowr13MnWjIs/a8DaGNZE/6M7YWaRfXRjwWk+JZt92cgiWJIqm0BsWpelcW1AZj
	meY+lCeL91zRcbOaZV7IiEcqnFrlxvTPBIdvM4eF5ZQ1ZY/+gInwjU2yb2IMfTumacf0oC/L5tEWb
	2dLb+8zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBaaF-00000003MEq-3ptN;
	Wed, 22 Oct 2025 15:17:03 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBaaD-00000003MDr-0tw2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 15:17:02 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b40f11a1027so1391144066b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761146219; x=1761751019; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8Ks3283lFKT/3or/kKLaFk/rSeUKOKq+L7qyJbrS/M=;
        b=Q8QvdBGETDSYFSPghTwgBjlFK+3jKoRV11CQhcY2jW5oGLlm9TSnWV/07jIVXGfMJr
         OEWvrNY3IgD8/zKeN7FFjjLn1k+KzizGdsePp8m8RVe/3tIvfYGdoKPxVdTEBrh7l+Or
         EJugFuRC5dShVduV3i93pK8gyA3P9SBxRetXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761146219; x=1761751019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8Ks3283lFKT/3or/kKLaFk/rSeUKOKq+L7qyJbrS/M=;
        b=Hc5BDrQHoxJeKj4EtEnTsViJw3PSlxZ1LtId/lRVuDZ53ljBQMTFRvGHHDNs3I8ndk
         PH6uT8Z16w1X0vZQVP9DZ05une1CZVu6YGEv9VzwDviggzZkhMclSp+urDp86SinTuYX
         AQ6nCjpahzZTDqUe+OOv0TH+Q7wAdhWvj2J7frZug4TqYhowX/R/1s2hnM0rRHegiYy2
         K+V8ayldrn/Jq+mcK1YFurNNnk2uuJyK4cm4pQJm+KVNPYID2djR8GlDazJtakTWxcFT
         XJmyk12QEXq88MGLmaeqOFDuEXQkJ3nbLsyADH4W/2Cpf/BW7nzCnXs6f2GNM2cJp+DM
         dhJg==
X-Forwarded-Encrypted: i=1; AJvYcCXcqKprY1JLSpokipf8CCSpGJYQcf46Zy97ObAb3MzEAVfvNTCqiESaoPCaj4NpMdblO/CXcLrq8i0h+051RMqS@lists.infradead.org
X-Gm-Message-State: AOJu0YwSAnADtW3pKE6L+SNM1qG0+OWBXAvO8Wa0o9Vw9TQDGiNCpSjU
	vY/7XrgFLyzapanYRenU+0UKBaJVCPdXqnWhVzouEQC2/5nAES3TltZxJAlhZo2x8SbeLgf+UYS
	i5dAPeUs=
X-Gm-Gg: ASbGnctFthxZBE6BLylCQE4FleqkQC/TJQz3+Gsp2eWJ9kfN5kqNrSOOEVSoHNO5t+b
	2D1eYfNqd3wFizGylUC1aiLQXD5NRc4T9HwAbgFJ3TW0l74r5LJtl9sHGLaVfnqIe+0vmBywzBX
	1WS79c4fc1roh/zSBKDlDIHKZI10Lj8bTOGP/mT8NPpBtrBUemaRggh8BG6mhBmvlT8u4/oTnGy
	Qxx23fsOKAgE6ncCZVuYG33fATavUFAKJPQ3QE13gfKHyjrg6huM/9wIxYSjCHz8i9pJ6+PG7J3
	SCvG8xgUUwD1ggFtb+3OWgfD7TLKsy9f+9YyhIumcZ50inDLo/Mll5uf+vfCxMWlN05VElwNHUm
	K1HbjFsuRm9j7nP+Y9jl2xmYfkVaN3fRdo19W5MIMLqb5gGgixNr9E59KaobkhfvxXXnCGE+kVg
	Qjg/l1JxJr4zIXGDF36Dr6+Z1hVqvii6r5duVkgE+nhc4DQ4yyyKYXRLYv31Mb
X-Google-Smtp-Source: AGHT+IG8+pg5noTpLT0s/6oUbIq/c7IflRNhaxoFB1Ejt6U9JVHMtttIJ4VL22Gk7HDtFzRa5LYBDw==
X-Received: by 2002:a17:907:3d91:b0:b30:2f6b:448f with SMTP id a640c23a62f3a-b6473245877mr2708298266b.25.1761146218559;
        Wed, 22 Oct 2025 08:16:58 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb035f5bsm1375673566b.43.2025.10.22.08.16.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 08:16:57 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b4aed12cea3so1161451166b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 08:16:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYr0HP1tdhDwcr+7sgTofXwwz0J9+4rB63eWjChpBRcCzTI7nq6ESef30rL0RCUbSxP7+Pq8k6as8qoEMSPiw/@lists.infradead.org
X-Received: by 2002:a17:906:c144:b0:b04:48b5:6e8a with SMTP id
 a640c23a62f3a-b6472d5d715mr2448051866b.7.1761146216891; Wed, 22 Oct 2025
 08:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251022102427.400699796@linutronix.de> <20251022103112.478876605@linutronix.de>
In-Reply-To: <20251022103112.478876605@linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 Oct 2025 05:16:40 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgLAJuJ8SP8NiSGbXJQMdxiPkBN32EvAy9R8kCnva4dfg@mail.gmail.com>
X-Gm-Features: AS18NWAqLsXEY6bsEV3yJ0KWUZmBC6kMtZXzbsnMf3ubAyGEsrR55YgMKptZqjM
Message-ID: <CAHk-=wgLAJuJ8SP8NiSGbXJQMdxiPkBN32EvAy9R8kCnva4dfg@mail.gmail.com>
Subject: Re: [patch V4 10/12] futex: Convert to scoped user access
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	David Laight <david.laight.linux@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_081701_292784_9BB16D71 
X-CRM114-Status: GOOD (  15.14  )
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

On Wed, 22 Oct 2025 at 02:49, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> From: Thomas Gleixner <tglx@linutronix.de>
>
> Replace the open coded implementation with the new get/put_user_scoped()
> helpers.

Well, "scoped" here makes no sense in the name, since it isn't scoped
in any way, it just uses the scoped helpers.

I also wonder if we should just get rid of the futex_get/put_value()
macros entirely. I did those masked user access things them long ago
because that code used "__get_user()" and "__put_user()", and I was
removing those helpers and making it match the pattern elsewhere, but
I do wonder if there is any advantage left to them all.

On x86, just using "get_user()" and "put_user()" should work fine now.
Yes, they check the address, but these days *those* helpers use that
masked user address trick too, so there is no real cost to it.

The only cost would be the out-of-line function call, I think. Maybe
that is a sufficiently big cost here.

             Linus

