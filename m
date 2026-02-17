Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F0DE6816B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 12:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSA69J8HH5ShQtT6NEI1mo38t8hiGEa6yEjtV86V/Kc=; b=iO+Sug73OZdVibJg5PoLmbrqSo
	i74JrSL5qGKY329kWNFLyHEJNDL6ZqtNAucWR/pOW5dCrROuFQfw/bA9TmPClRJhjUHf7RW7YOo0C
	RoqKrAN0q6LJGCjnzWwFzc+4IdeQLrB7Jzl4PC8Cy6Oe+TJeH78ZKve8n4TPlu1N4EeZNdyRrDu6y
	Sdg9RlSzt7FnuK2SNHIHkMkgnqFVPwR3nWFIzvlTybyZUqan4ibIgDv+ZxksXFBDiH2GSrz72b4V+
	lcJWWb8Ca0Gnpj6EBtltg/ygl84nrfsvQeGzdtdoXxlELt6LdQu+Y4lfWIrswQgbKn7HgmeJ/xv7o
	l4ymfriQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKFC-00000008DR5-0ft6;
	Tue, 17 Feb 2026 12:31:58 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKF9-00000008DPt-3RUU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 12:31:56 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b8f96f6956aso515143766b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 04:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771331514; x=1771936314; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gSA69J8HH5ShQtT6NEI1mo38t8hiGEa6yEjtV86V/Kc=;
        b=eNXiUmKYzMKjt76oK8d/Py0UFHJI7Sve/FQivPcu0+SFI1yMlX8p5NEAAEFAgAfSdH
         ZmcXxQu03bVglz8dTLKuGjM9Kse6o5AR4nGtOqGYtJAtgkYqAPHU2kCvIOiqYZtsS17q
         EYbFrRI2Hg/u38e+f9YEoDQk3xghvPW42OquadcAK1AvuHhaah6V9KXcakSrFZ8Psz42
         PoW7ZlNO0cpn43vremK5h0xj6BKzGaFg0YzHJvFvze0jBk9kXZfh6WVpo0fIyqvn0Cfr
         Q0Ae216BwfHi965qtKE7+Ru+G3oXvuDhcPdn2ZVHy6RgoU8Hms0/SXJBZiOGj9/jLHBk
         VsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771331514; x=1771936314;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gSA69J8HH5ShQtT6NEI1mo38t8hiGEa6yEjtV86V/Kc=;
        b=FZTJ7KyVH+VheyjV3EY/UYbMdserkSRwin9MBX3PEppri6pVbS3Qb+01pO1Q7vIqoK
         z6h9hnHWkUjoPAQiiPCDFFk732bCOx1WeJoO1t5OQOSEYWWGq4hXto75JbnaBoO/s+5c
         AuaJR2M828rMW9EarcmcHyltdxWdO/xI6cgvr0Z8yZ0vmCI59WnQdNFpIT0WeoiU2nuq
         I3HOhilDMQjJFX/KRr0WVaoGCOhdhppUJVSAr6fGDZkvCE6Hi3U9s07KBL4Rtcl7MsbS
         aGyi6oTzFqtnKrxvbOG3kFWJRs2xGV9TuKHXWgl7sezQF+VEsIERzBM158XMxwYBcJYc
         NCnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH2GL6cq4cgm3EG9TbriC2/MckHkqgwAFWwhXUqLpY+9d0syXHToBwgFkfLQA/28NQNp/Hsczz3smtpVpOiDMQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyZFd1xsEDyUF4KjrmwKdVNXcz/FRnabUiWxL+ulXDKvCy7gLyQ
	+mBfL+yKkYTGO4DUe0PgQh/BK7KfoA/eWgrKnrbVY3/9ZpwZSjwiXGCJOXQiDu87pg==
X-Gm-Gg: AZuq6aKGGr8YyFxcpRl4nMlyOBFhi7zN0zCeG+DK7u7vs/9SIYRzZRrJd/GG4nxsq9c
	g7bM+BJw5RGFJoiA0CODaIXcyUUqJOpJdKiGJ0jJPJtr9s302ZpjltKYq/M+VMoao9VqjUaxcA1
	rgzCvzmusO1fhPt3Ui7bvuRdBpRDJG9cFJ3TOt/fFyCsRIgh+dw82zeQ4h/2tFXyoPumUKOekUg
	FrlarN9TKmYR5mSLpn9oqUUQZCbu6fSAoyn4M+hqxh3WOC7L4YyMaLfFfElwr+PBz6W9TWphMwF
	1xYGKiH65U60fczlSwEOtFEeP0OsdGpipPIR8NMJQN4ccYcMvLxxvqx2DoIYehHwOXzK3ooL0fT
	JO0XFVCEYo1IoGHJ0/HwuS2AcGqZLNdKi1tlMs0TEQQirF8pr5/8xnz29W1q1pew/S03EnPikMr
	7O1cjCOY58wAd763mdDh9TsLJZcWs9rdTzuFbiZtG3mXieRdkeDXtVOXPlGa9+zyqYKZXGgsI=
X-Received: by 2002:a17:907:3ea1:b0:b77:1b05:a081 with SMTP id a640c23a62f3a-b8fb4392456mr767722666b.27.1771331513280;
        Tue, 17 Feb 2026 04:31:53 -0800 (PST)
Received: from google.com (105.165.204.35.bc.googleusercontent.com. [35.204.165.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f7c24sm352630166b.30.2026.02.17.04.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:31:52 -0800 (PST)
Date: Tue, 17 Feb 2026 13:31:49 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, suzuki.poulose@arm.com, 
	maz@kernel.org, corbet@lwn.net, yee.lee@mediatek.com, ascull@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] arm64: Optionally disable EL0 MTE via command-line
Message-ID: <2evhrm4tg52nxru7xeegs5ut7alnnczv5w2xsgkvhgbdlxdrht@shdj2wb4wcql>
References: <plslbeuzfag5dfizunxmhyw5axxbuz7r3jdlhjluzdwrm4rtzk@bm5xmxzmy6v3>
 <aZRIHZ2Wq81S-FZY@arm.com>
 <p7wloz3ospiwaytzzns43hbyfrxfjoca6ljols3dq4hpha5y2v@weadvhpdng7a>
 <aZRY9UTSgw0Zf2Y-@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZRY9UTSgw0Zf2Y-@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_043155_898123_5B6724E2 
X-CRM114-Status: GOOD (  30.49  )
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

On Tue, Feb 17, 2026 at 12:03:01PM +0000, Will Deacon wrote:
> On Tue, Feb 17, 2026 at 12:20:02PM +0100, Pierre-Clément Tosi wrote:
> > Hi Catalin,
> > 
> > On Tue, Feb 17, 2026 at 10:51:24AM +0000, Catalin Marinas wrote:
> > > On Fri, Feb 13, 2026 at 12:51:07PM +0100, Pierre-Clément Tosi wrote:
> > > > Although it is currently possible to fully disable MTE on MTE-capable
> > > > CPUs (with arm64.nomte or id_aa64pfr1.mte=0) and to only use MTE in
> > > > userspace (with kasan=off), there is no way to limit the use of MTE to
> > > > the kernel because CPU capabilities are traditionally exposed directly
> > > > to userspace.
> > > > 
> > > > To address this, introduce a new cmdline argument (inspired by the
> > > > existing arm64.nomte) to only expose the MTE capability of the CPU to
> > > > the kernel. Combined with KASAN, this results in only the kernel using
> > > > the feature, while HWCAP2_MTE and the corresponding MSR ID_AA64PFR1_EL1
> > > > field are hidden from userspace.
> > > [...]
> > > > +	arm64.nomte_el0	[ARM64] Unconditionally disable Memory Tagging Extension
> > > > +			support for userspace
> > > 
> > > Why would we need this? It's a user-space choice whether it uses MTE or
> > > not. It's not like the kernel is forcing it onto the user processes.
> > 
> > Correct. This patch is useful when working with a pre-compiled distribution to
> > ensure that a MTE-enabled userspace falls back to untagged allocations, without
> > the need to introduce system-wide policies (and ABIs) for said distribution,
> > which would also be inherently less robust than this kernel-level gating.
> > 
> > In Android, we can simply append the flag to the kernel cmdline instead of
> > relying on sysprops (or similar early userspace concepts) and hoping that all
> > users are properly gated on that sysprop, etc. This can be used for A/B testing
> > of the feature or as a highly-reliable "remote kill switch", for example.
> 
> Why isn't arm64.nomte sufficient for that? It seems weird to insist on
> tag-based KASAN support for the purposes of userspace A/B testing...

For a given architecture (and product goals), profiling of MTE might lead to the
performance overhead being acceptable in the kernel - where security concerns
are more prominent - but not in userspace, resulting in tag-based KASAN being
required while a robust switch is needed to disable MTE in userspace but
arm64.nomte is too coarse for that.

-- 
Pierre

