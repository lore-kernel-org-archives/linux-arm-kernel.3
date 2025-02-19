Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B577DC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 12:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SMHHlCMcxXYtVaRR1wTwHJJB8CwWA0AX/SUXLDYSpC4=; b=3c1QcrxU1qz53ciSh4NPQdLRfk
	FqDIqb8UAhGCP3AfP0B3ADSCykOeo0j7BIPFgVfD/qmotRLIDdkNmn3nOWftydxAF3xpESRdlKUqC
	C/auxRuqNxI8fbruMys0G/e7onOlQFjG0i/TuxyoiuP9i3Dg1yKGnfb+vVkWNlhH3lCmlU/z/laIr
	dI/qw89TuU7TzEDkIY0yR2lGFZYwkYtjeh1zPi7b4uLjt3MT+pVyHuxEkxeK/pojAKPw28mUPLiud
	OTHrVHYH/kNLxdesEVWzLQJm9EhMJUM/oJd8XoGq+72xiwJsIRs/yuR0lQqNrXBQkKTVEk8Mq/Apu
	ylL9q2tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjZ9-0000000Cmay-2rx4;
	Wed, 19 Feb 2025 12:52:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjVc-0000000Cl7M-1XDx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 12:49:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739969338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SMHHlCMcxXYtVaRR1wTwHJJB8CwWA0AX/SUXLDYSpC4=;
	b=cj8fGW3r/87s7KQtC4JOfRk/0Sxp0LwdoIEJM2B5r6qX6mC0giFQgLTdyBsimx29Sy33MB
	oHDLPpTsyhjYgogiB4Qe/rlDtA/5F9m4wjSqzHvSo1mx87/B16sDNhvgYB6vsx5j8d+WyR
	IV4TZE7C5HKHX2xFVJ84i9PBwv2WRV8=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-mfzln7a3PgCyoW--xpVDow-1; Wed, 19 Feb 2025 07:48:55 -0500
X-MC-Unique: mfzln7a3PgCyoW--xpVDow-1
X-Mimecast-MFC-AGG-ID: mfzln7a3PgCyoW--xpVDow_1739969334
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d2a379bbf0so44197515ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 04:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739969334; x=1740574134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMHHlCMcxXYtVaRR1wTwHJJB8CwWA0AX/SUXLDYSpC4=;
        b=mv6HMqGBLRLuRy7o74fHf3N6PuFZWqBt8lLvil0tEEOQHDkM2I/ohAD0Lwr32Wy6PN
         pMlnFGQNZvZYUqb+SndocMqIDvBmMPOorPonC1Qod8h0hn/HA/IjOi8iSt/NfEYwWKnX
         QPo+Zt8iEuk8vEYOhYXwK1w77jURsypK8Ci+YTtX8pJz2OHc2s99k5LAwIqkmKFX2cGh
         I68i3sSxccDD0fmUJWNu+8R8ovr3GiZCJn28mxURQj4eQBxtLTCQHy4aYoRrsDHDzCdy
         9l81B/uAUgRZy5Sq16S3zum7xAjgYCI6rTI+QSOJRi9IJfTAK7zXZZuv2fKhJWl9a3hw
         +HAw==
X-Forwarded-Encrypted: i=1; AJvYcCUAKU2d2mdcLL7v/UU9JmrqETtAI3b4SB1RvbeOiXuVTepnKxbF/tPnVeR+y8Fm0cYSVBJJxe1K7BCwPmQYgreu@lists.infradead.org
X-Gm-Message-State: AOJu0YwyYMO3BCitDcpcp9WO88+759h/rTEy2UXqPeNGtG8jZSuMjAji
	D5qskjz/vgI01LX+4YmUkSaDwysrosOu/tWbI+97VuX+lh6q5Ys0WzWzjehIfGNEjdKkgZdqx+U
	wqWIKo66o4orjnKE6FGD2geuEwsdU83iJ7YJ4ISFWVD2Wty1pica4+pYf/KSNtopZt4gCA9pyWv
	JEc24C6HjsAwcTMREQPpdQMlUOZyyg9koHi8Jf11tYuZry9UE=
X-Gm-Gg: ASbGnctt+xV5Pa5crebsuvfFys/VUAWh9pKRBrG0lYYXBgt5Ik1vDEKJls8Sbi9DzU4
	amuXXjxNc5Wr1bY4vMbs1tw07a/1K2gQy3T4t8900OQwpJcqaDDbyvmHXwUGL0e4=
X-Received: by 2002:a05:6e02:184d:b0:3cf:bb3e:884c with SMTP id e9e14a558f8ab-3d280940c90mr162913885ab.16.1739969334510;
        Wed, 19 Feb 2025 04:48:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQzXwQKpyH3rywpGs7BzP6mbj6/B897FEVbfIit3jAtaZt2ga8Vr+6/m/vSCYkDIbGIHSmC6KPV/ULHybcxNs=
X-Received: by 2002:a05:6e02:184d:b0:3cf:bb3e:884c with SMTP id
 e9e14a558f8ab-3d280940c90mr162913745ab.16.1739969334259; Wed, 19 Feb 2025
 04:48:54 -0800 (PST)
MIME-Version: 1.0
References: <20250206132754.2596694-1-rppt@kernel.org> <CALu+AoRMQyRDFS_4L0KQkmrFT_S+yk=uZ-Mqt86JQYKKnj-5Ug@mail.gmail.com>
 <Z7WJD6eBLuIRnLwk@kernel.org>
In-Reply-To: <Z7WJD6eBLuIRnLwk@kernel.org>
From: Dave Young <dyoung@redhat.com>
Date: Wed, 19 Feb 2025 20:49:07 +0800
X-Gm-Features: AWEUYZlzn2-E8ZdtRbfhtM_eLch7RFvZ-yzSIrzOWYzAtm2oUJ9ngWc6Obau8Nc
Message-ID: <CALu+AoSaEthfed1NOYPiQgm_g-dhibVMRAp0+=_+9qTT4_x=tg@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>, 
	Anthony Yznaga <anthony.yznaga@oracle.com>, Arnd Bergmann <arnd@arndb.de>, 
	Ashish Kalra <ashish.kalra@amd.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>, 
	Eric Biederman <ebiederm@xmission.com>, Ingo Molnar <mingo@redhat.com>, 
	James Gowans <jgowans@amazon.com>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, 
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Usama Arif <usama.arif@bytedance.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8lE0_97vhxIV-3X_ieu7Eb7gb4mFBGC7JS8CXgZRW_Y_1739969334
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_044900_466427_84FE6C5A 
X-CRM114-Status: GOOD (  26.58  )
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

On Wed, 19 Feb 2025 at 15:32, Mike Rapoport <rppt@kernel.org> wrote:
>
> On Mon, Feb 17, 2025 at 11:19:45AM +0800, RuiRui Yang wrote:
> > On Thu, 6 Feb 2025 at 21:34, Mike Rapoport <rppt@kernel.org> wrote:
> > > == Limitations ==
> > >
> > > Currently KHO is only implemented for file based kexec. The kernel
> > > interfaces in the patch set are already in place to support user space
> > > kexec as well, but it is still not implemented it yet inside kexec tools.
> > >
> >
> > What architecture exactly does this KHO work fine?   Device Tree
> > should be ok on arm*, x86 and power*, but how about s390?
>
> KHO does not use device tree as the boot protocol, it uses FDT as a data
> structure and adds architecture specific bits to the boot structures to
> point to that data, very similar to how IMA_KEXEC works.
>
> Currently KHO is implemented on arm64 and x86, but there is no fundamental
> reason why it wouldn't work on any architecture that supports kexec.

Well,  the problem is whether there is a way to  add dtb in the early
boot path,  for X86 it is added via setup_data,  if there is no such
way I'm not sure if it is doable especially for passing some info for
early boot use.  Then the KHO will be only for limited use cases.

>
> > Thanks
> > Dae
> >
>
> --
> Sincerely yours,
> Mike.
>


