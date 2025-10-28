Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22793CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 22:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7MYXT8RdCoSxz7Hgl9+a32CaifYT+zfGLvjG0fFD9Q=; b=GE3DYeiulto/V1qhp8BxoHxKzC
	WgAc6X8JA9biPlctfa1sUZq8tr7QPdFXUmUMKAaHaFieUT2m14TLbxhrIReeBW6DH/8z+ltYNj297
	uiX6bJwrNNzg5UKnLiNa0YYCh8ut7PyL870eOyxDJe11jFVaMLAFpCHLOgvPgFhrtKRPfFs0H/wUR
	O9FYIrqrFMB3DJx+78JLbi51EwPMXRbo755M9Lmuoj5rMyE0UGKgpOtgpUEYvl6ut+vLa45sea4KY
	G+U1mVXPnToQBXS/b5MA7JQOiq9noU9qQqxSFtB7avCyzMpmhKWA4LwrDbtX/H2UDsKiTukyQ3Kgt
	AN5r0d/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDsDS-0000000GkDb-2uvn;
	Tue, 28 Oct 2025 22:30:58 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDsDP-0000000GkCB-1UzF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 22:30:57 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-471191ac79dso68786485e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 15:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761690653; x=1762295453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7MYXT8RdCoSxz7Hgl9+a32CaifYT+zfGLvjG0fFD9Q=;
        b=IbSPzZ6pFpHxuyRHIjk4C/RAbGRNMVKSmIXA/Sgr/EwwxPTGx3ALoryRElSHG8NGA6
         3Tal/oOxnu9tkXDLRenRFaIWtLz4EF0YiK2hEvJ5zXO6cr2oitAG7xzC7D9bk3okQdty
         MiU9Q/0esE07r8jotSft3UkBg8+elQE9XRz3+CN8YZhJUU4KeGq4SO8cHOPhWprd0L0p
         SNIrEuVvTCS6uTIvA+B822idFxaH0cGSu8586XmLEps24Xv8T/iN4BHcz/WwVLkQtI29
         DgSXqdaqK6DrpjmNCQ8PPvVpxwQ1ra+KhEo/UmKc0ybSHFGs/IIxISYDD6Zz9OCXBCBX
         yQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761690653; x=1762295453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7MYXT8RdCoSxz7Hgl9+a32CaifYT+zfGLvjG0fFD9Q=;
        b=lYF3Etxmdj2NQ9AxUhF7Fr0xdy5e6SiOY3rsIzPXSc4RRy8SaKzIGIIwiV+0S/c1g4
         5cM42G8vjQFOoaWj5HmqqblvjEBTpLHO9EPBnzVgM6zvqJ4h8vTf+ZE0WWjm1rz3CZaF
         4zlzTH6x7SQMolWvPX9hS3hGG5ND+Ttk1WBqm4d/6GRTAaLRjvGca+2Hxe8nhcxMylLK
         ois0JDvDE0DAWt42FEM38wpQ6f1+IhKociFEpO9e2PKwTdd9Hs0lCogfGXEDoqTBc5CI
         sRhCzFQA+WXLGdwcJ6CAQiUReTw7FKJ7aOAohCsApLUArBJYUSDW/pRGHEa3rpWEJNf5
         88Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWin+YbU0Gt5sX7mAoymMIvfJSO1x2s7ncYlRx+z58FrjCS+DhZj55La+TKNJ+6BIAjyKK2Cf7YzMwYrQHM1zuY@lists.infradead.org
X-Gm-Message-State: AOJu0YzY0QBycOkzMKSuEWkcQjuZhZ9/3PnXa5O5KQUMF4pwZKQHZKyk
	6Zj6AmuGJu+WSlnMnjDyxThLJAxC9RczWBrjK71Tj8fjqt3pNpxIk1/9
X-Gm-Gg: ASbGncucLfI64g16AslhvnB/eGhQaWQPivt8N50M0Y1HiL0QqIne6Op8EMyDhXRNTf+
	OWCOQ2svs5fuQgJbczT9baLN73XrIP2g4iVp6XqAgFCkanPqSdtOknwHay5ouEngCNUFTTEYazd
	fzWZ0Jps2EqphI1BoHNFo987pX5uN+qMd99YM+/2t9hWPE2ZbOcI+gLKruS/1KC039+5RopAj2Z
	5b9zHhjZRGM//GVaogVnksF/CVKNiCtHuvrnKKZ2L+5DeROCQz/7U/9jR3xTcvGO2EAcjZEC8+E
	JjJZziryHRPPwubDdjOTip4fbJIt67fHO9Vy+ihcdKfIpK9J3m5ScQNfiic3y9f91Gm/qXoOS2B
	7yTPAsi+GglwVtX3qo8vZUDw2HCMy15xgQMvFJAqkCRvqwiOgqLI05Ujc5p3H4FCBUZvcr7H7An
	ViTwjb7k3PNVeXQjJqHVhe5wNIp3IIGJXuSBEhG6omr73UULzDXaD0
X-Google-Smtp-Source: AGHT+IGr3MaQmjLDcnechwHoyti0ltwYCF5fdXDSzbiJBdxMc2AUsas+y5bOu1/39BNyQHtZcenqXg==
X-Received: by 2002:a05:600c:474f:b0:477:df3:1453 with SMTP id 5b1f17b1804b1-4771e1ed170mr10187095e9.28.1761690652951;
        Tue, 28 Oct 2025 15:30:52 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b7cb9sm16032815e9.15.2025.10.28.15.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 15:30:52 -0700 (PDT)
Date: Tue, 28 Oct 2025 22:30:50 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: dave.hansen@intel.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 axboe@kernel.dk, bp@alien8.de, brauner@kernel.org, catalin.marinas@arm.com,
 christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com,
 edumazet@google.com, hpa@zytor.com, kuni1840@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mingo@redhat.com, mpe@ellerman.id.au,
 npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org, tglx@linutronix.de,
 torvalds@linux-foundation.org, will@kernel.org, x86@kernel.org
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
Message-ID: <20251028223050.3e3ce110@pumpkin>
In-Reply-To: <CAAVpQUARk-XeMdTeGy_s65sdwuLY2RzocGyJ=2_WkhsrFN-bUw@mail.gmail.com>
References: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
	<20251028053330.2391078-1-kuniyu@google.com>
	<20251028095407.2bb53f85@pumpkin>
	<CAAVpQUARk-XeMdTeGy_s65sdwuLY2RzocGyJ=2_WkhsrFN-bUw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_153055_416330_FA539C9E 
X-CRM114-Status: GOOD (  18.57  )
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

On Tue, 28 Oct 2025 09:42:25 -0700
Kuniyuki Iwashima <kuniyu@google.com> wrote:

> On Tue, Oct 28, 2025 at 2:54=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Tue, 28 Oct 2025 05:32:13 +0000
> > Kuniyuki Iwashima <kuniyu@google.com> wrote:
> >
> > .... =20
> > > I rebased on 19ab0a22efbd and tested 4 versions on
> > > AMD EPYC 7B12 machine: =20
> >
> > That is zen5 which I believe has much faster clac/stac than anything el=
se.
> > (It might also have a faster lfence - not sure.) =20
>=20
> This is the Zen 2 platform, so probably the stac/clac cost will be
> more expensive than you expect on Zen 5.

I must has looked the cpu type incorrectly.
AMD haven't made it easy working out the cpu architecture.
I need to get an older zen cpu for my set of test systems
(and some newer Intel ones).

> > Getting a 3% change for that diff also seems unlikely.
> > Even if you halved the execution time of that code the system would have
> > to be spending 6% of the time in that loop.
> > Even your original post only shows 1% in ep_try_send_events().

I realised after that you might be showing a 3% change in that 1%.
>=20
> We saw a similar improvement on the same platform by
> 1fb0e471611d ("net: remove one stac/clac pair from
> move_addr_to_user()").

Certainly removing one could easily be measurable.

	David



