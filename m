Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46FAFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 00:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxIaGXcpSE5LxIReZcGgBcZB3ReO4RJbfPvanWg+Ksw=; b=k/pQKRYicHlvzMiJA//eP3wGP3
	NdLWMtSLthwhJINSdrJxTysY7Cs/PL9maP93i4SXqiopumDyCbxprxEXMC0VwuWU7mE+zhUFGxjVO
	KvG7oSz3AEE76ZB2ihz3hCuGwqtwVIfcPZqCWqgoG/5G5o+58975e6Lwry0wFb7+tukfk6fnCj1yw
	uy8TJAZsK35FFQF9eLxOETyqr3Ua11t9Vs3xX1irR/rU0/UKc0XF0FNI5p+vxdZmUoXitnCFLYtdG
	V9u7ep1xrv4k3wAD98uS+dOSyKr6VGBjOv++fFAAiG+9U2zkGDPqnbWMvRAf3EG/gPkEy6PxyQY/K
	ndWeus/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIFP0-00000004Lfv-3aXK;
	Thu, 30 Apr 2026 00:37:14 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIFOx-00000004LfY-1eGf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 00:37:13 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2adbfab4501so1348595ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 17:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777509429; cv=none;
        d=google.com; s=arc-20240605;
        b=LTTuCl9kCjB3N+mERHW6SuttWbOQl1o+IT7AlJ7E5bjKlgOu5Bge1SBdJkFthUr69i
         jFyUtdI1HtKsB8+4/2cKLvHRKofH3rM3JnTMsH5jNoNDAAoWfu9U82ycZa1X5HbwmwAc
         pay25Kcxl7vlPXsjOYhRyAtgRyLBhIaKj4D4dr6XjIIEOBIvmxdsGsZF/aFN7klYT7mX
         YGilBOUTahmAxCshNBVtVPRJUenC7bkdJSJie+QKFHoyzJIN3lm8xOO69PY3lvG+SQam
         JxSxmprptgyos7i9UM3pRfkvYVb7zXiOkaa8FUCIA4L1wlCNH8ntpX0nnOmAWY6pqVHz
         lV1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XxIaGXcpSE5LxIReZcGgBcZB3ReO4RJbfPvanWg+Ksw=;
        fh=mNnJb6WboU/4oqJNpXwLGRJpnzs3lXLIpBKZvS9IQ8U=;
        b=bggxFx1A2GoKc2FpEymW6E5E5KvondCoI+Y5JR58ck8424zOkhS5R9uNmjRbHrlKhe
         Uu4SPAMajFbTPZ9H6F0wIAZQ5+ACFQp2K1tSbbCGk3H5Xu1Hiinbr4lqLFmTUwfU9qUy
         ItyF2wUgYnie2eel6qkIG58nq8R50cP8SZ4LCx2eypqSvE08mOyW0f8jzUwM8FtQVDZP
         htYlIJ6Ue/79kJk8WmHHaXdfc2gHZ6I9pKNTZlPdp0t72ZDo6nf+10H+KWnc2YtP/9X7
         i4KScEMk76tFThLfQZzi2GZHcRTySNw5a++8Mo2Ijs2qkM9Hum30x7aE7nKZzuYwqllM
         OmJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1777509429; x=1778114229; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxIaGXcpSE5LxIReZcGgBcZB3ReO4RJbfPvanWg+Ksw=;
        b=Gvl83WnJQrAXWQTty2RchZls/Uo4JDHsF6avAzU3RYNlRXfIVGQA8kmy5NCgRNlOdK
         Xq1/4v7V+ib4FyVYBwEQZ4tMAbNqfP/mbZvZGjfkQUuun+u/yFzO6DwRKCb97GMz6J0G
         LS+C710ItMgPVNsX1aDsTkqZUEwwuBJ3H1I1rMA2pc5ztEoQlDWMiAA/AhGN2e9lMMys
         hn80p0v2n3/Iv9aTnP4CToOTm984a1gcRdH3sOOWJhwH1MPdn+osdYaV20cSWe+KJrcW
         mOEpVPvJbKYfKebjypX02BkqCpZ5VUUghyAq0kidTyfZjjbfBOWjxiMUYa890P6AL5xA
         5nVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777509429; x=1778114229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XxIaGXcpSE5LxIReZcGgBcZB3ReO4RJbfPvanWg+Ksw=;
        b=Ek5FUb7s0iqEbX68qZCmN5odxuEeHfISxeGqaS1vjaakjktd0sMNNm6TrJ8Dmvl6k3
         8UDTJR7YZ9bVbfbQIvGn57MgqSP1zcs5h3u/8jzK4Bdsr8RcDyvzwHb4+ujWCkZrPt+g
         kZ0H/T3mKynDL82flrIlK1UuapPJDNz8pdVv/h5ftL2ZWcBsTeyzGLnG25WPiS8mlXgI
         5wc4FsJWTNkZk15jmPYkOBymxLiOaJFKHO+gMw/EhQCMiFY2Hvx6E4/+U9I7yXjqhoYJ
         N3GKcf2TOw4QdADCHIPhON6PgkAHEDQQCCWyXflR3wgLP44+Ztduyewf+G6rRnirN9Ie
         HBlA==
X-Forwarded-Encrypted: i=1; AFNElJ99yKV5aR+JGV7A9YXefJrW+J8oqKZx4yVatyjX9+SN/vmfdZQtzDXl8hL/fxd/DLD9lMmKyxdORl0m7mmQ1ZO2@lists.infradead.org
X-Gm-Message-State: AOJu0YwE9vxloU/cVfgAaN5lf9jXjO2N49OSwf/bOM2T1qzSsrhJ5prV
	3PkwCy9EvopAxnbgTSbfobiaBLQTJkWcJMyKWpYUme8vexSaZXkkmcWyCoZn+aITL5tFKcmdMBW
	nLHIIBOgd7+kwrS/uxlPwdEEycJDJr+1n0gI3pbC9
X-Gm-Gg: AeBDiesnr51XonKfSGmF1a6PYs3oDQ5ezojaXXbnTvJTDUupCrY1+T06vybFw7ubsZ2
	lpaqzXwjETjSUB8Q2B3lUPzwpwepNMGhlrVuP+X3TbmTEdbdvfF92xQXKoC8hbaJeSh3lV/64s+
	VHDYQEEEVdLg3UUpZENrkTPVyi+wf5KYAAPlj3rJk9QcoBGki//EXj6uxHgsTyTnTZcuDUrkOZF
	Ale2mL+qRJ1lscTB5f/23jqnc0itJhEZYcpzn3iHDPMG83BkaYDD6Lp7o2sTgxEmpSVYjlc0111
	gItheRlY6QRkJ5rN4g==
X-Received: by 2002:a17:903:3644:b0:2b2:5314:e96a with SMTP id
 d9443c01a7336-2b9a2523582mr3745025ad.34.1777509429231; Wed, 29 Apr 2026
 17:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <aephL3MzYoqFGaT5@e129823.arm.com> <CAHC9VhRQWHEWQ5NzOPiu8jtYv6UsRm8WVS4fd74AbkOcAd4y_g@mail.gmail.com>
 <aesGU8a3mbVzvteH@e129823.arm.com> <CAHC9VhSaT_quKYnpFjAfqvL07JNbWMgM6c4pB9F46NHawX3DCA@mail.gmail.com>
 <014cf39aa8d6a0bcfa1a95c069675977ac67b843.camel@linux.ibm.com>
 <CAHC9VhTW3=RJ8L91RWXYYA9tFjfSXGN-DMEEwdiD6big9H57Ew@mail.gmail.com>
 <1f78fc75b2e95239973612a4b6c4cc782960b7ac.camel@linux.ibm.com>
 <CAHC9VhS4JmPmCJrYTdbjxb3TO-uK6cB3Zij-ef=wswGce2BGzg@mail.gmail.com>
 <1e51c2fd090e5ceb07b1d09e50650c70fd3ccdb1.camel@linux.ibm.com>
 <CAHC9VhS_WgwhW_NDO91LoTeSzdieGqbwqnwPq8KpavH1_Lwi7g@mail.gmail.com> <afC0UPfGhNTsXnyi@e129823.arm.com>
In-Reply-To: <afC0UPfGhNTsXnyi@e129823.arm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 Apr 2026 20:36:57 -0400
X-Gm-Features: AVHnY4L0F5CYsArVv0_Aux1I2flm7srRsxc7thS9QtQpbPKd3nDtBwoWwNOL0u8
Message-ID: <CAHC9VhR8Qc42xnoNHW+CEKGEAeupET-BFdYuHLuM3ZGzfDmEYQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] security: ima: call ima_init() again at
 late_initcall_sync for defered TPM
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>, roberto.sassu@huawei.com, 
	Jonathan McDowell <noodles@earth.li>, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	jmorris@namei.org, serge@hallyn.com, dmitry.kasatkin@gmail.com, 
	eric.snowberg@oracle.com, jarkko@kernel.org, jgg@ziepe.ca, 
	sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com, 
	sebastianene@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_173711_937546_F93C114E 
X-CRM114-Status: GOOD (  30.28  )
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

On Tue, Apr 28, 2026 at 9:21=E2=80=AFAM Yeoreum Yun <yeoreum.yun@arm.com> w=
rote:
> > On Fri, Apr 24, 2026 at 6:49=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.com=
> wrote:
> > > On Fri, 2026-04-24 at 18:10 -0400, Paul Moore wrote:
> > > > (I'm assuming you meant initcall and not syscall above, but if you'=
re
> > > > talking about something else, please let me know.)
> > > >
> > > > Saying that you aren't comfortable moving IMA initialization to
> > > > late-sync is inconsistent with allowing IMA initialization to be
> > > > deferred to late-sync.  Either it is okay to initialize IMA in
> > > > late-sync or it isn't.  You must pick one.
> > >
> > > Yes, we're discussing late_initcall and late_initcall_sync.
> > >
> > > I prefer to look at it as being pragmatic. I'd rather err on the side=
 of caution
> > > and not move the syscall to late_initcall_sync, than move it.
> >
> > If you were truly erring on the side of caution you wouldn't allow
> > late-sync initialization without knowing if it was safe or not.
> > Determine whether IMA initialization is safe at late-sync.  If it is
> > safe, move the init to late-sync; if not, keep it at late and figure
> > out another mechanism to sync with the TPM availability.  If needed,
> > you could probably use the LSM notifier to enable the TPM driver to
> > signal when it is up and running.
>
> I don't think LSM notifier wouldn't be good since it a one time
> notification for initailisation and it wouldn't tell properly
> whehter TPM isn't present in system or present unless functions
> ima_init() are rewritten to discern the "TPM deferred" and
> "TPM doesn't exist" in the system (e.x) boot-aggregate log creation.

Yes, some work would needed to differentiate between TPM present and
TPM absent, the notifier would simply be a mechanism for the TPM
driver layer to signal to IMA (and potentially other LSMs if needed?)
that the TPM device was initialized and ready.

> One question, though.
> In the end, for systems where the TPM has already been probed by late_ini=
tcall(),
> init_ima() continues to be called at late_initcall(), while the above app=
roach
> is introduced for systems where the TPM is not properly initialized by th=
at point.
>
> If init_ima(), which used to be called at late_initcall(),
> were instead called at late_initcall_sync(), could this break system inte=
gration?
> In my view, both late_initcall and late_initcall_sync run during the do_b=
asic_setup() phase,
> so it doesn=E2=80=99t seem like this would cause tampering or affect thin=
gs like the creation of the boot-aggregate log.
>
> Is there any particular reason why init_ima() must be called specifically=
 at late_initcall()?

That is something that you, and the IMA devs need to answer.

--=20
paul-moore.com

