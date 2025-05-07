Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7765BC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 13:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuFq/zeYni8KgGdHJD2LlQeGitZ5AOvXBhl3se89MLw=; b=1ktu9Hky6i7ZTc82nPkMc41zt0
	77BBqbjZaryiktIm9qgdrbuoZwAuEaKzdQGayH76cFuXTRvET+BnR3ZfmMTLKKJNOjC/meS9vfi33
	eWnUr08uecImHcEM8uDzBek7yrsbOVn0dQrob/ppR5HA2BQel3Wt2K6HAIOFudWsTmquqLHVdNaER
	kBkiLbQ7TQ+nf8OwX44n1aNi78H4o64qI4ce4/1PnroVPAD6kemhfjdAmiiff9JIs2eUA00aCGWxQ
	hp98v1QXfMPKZ63I6OdB2RSpFtqXCpMMUIT4F63q+vk+23bWJTT8Na+g69I+b4Zi2qNRxstmMJVSP
	/54fR4Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCekE-0000000FYn7-1Lty;
	Wed, 07 May 2025 13:23:30 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeXE-0000000FWAR-3EWg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:10:06 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-606577b427cso718762eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 06:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746623402; x=1747228202; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuFq/zeYni8KgGdHJD2LlQeGitZ5AOvXBhl3se89MLw=;
        b=E40tLK1Bo2j1K3+BjcLLRYhOrd+cEQSH50YzR3NpBRFN6kBpb72gLpy588cHJqVf7a
         EA4G7yBoldBFteimXq+1fX9OIWNvCm2tHNqdRtR+6XTlg9AXNdH5mcNv92ZNdaaOp0mM
         H2C0AyS4xoixFH0zcDyXqhhgcXJCh5pt+eCp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623402; x=1747228202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuFq/zeYni8KgGdHJD2LlQeGitZ5AOvXBhl3se89MLw=;
        b=QfiNMiaUmOVGQsxoga6BYpQ1xo9m38IKWI+cIgJQzWmW9PfdPpVbG4Q7IzwCKJejYc
         5gdmUMJzkHod8HZr+5mUhbTPZlhajgBl3GtdFGnY8WEmj0ZEdSBc26XCULnEnWpXFy/a
         roL17/UvJHMu9rcZWwiumZc1qY0tw9hJkxqiCg9zK4hxyJvMUImVjRMdhTtZnqEAs0hc
         ExVVxkk8YjBZu2JXg6xCQK3sxBKKVapqPiUmq5pG4BVG4HeTaAZf9nR42hjBqxA0dlUb
         qPuMfTF6AQXMv5q6LUjbdlfZkpeccPs7tHkJkS1YJYGO+4XWNFLuVkl2b0j/POACdZir
         62yw==
X-Gm-Message-State: AOJu0YzwNWudSaQLSyNp2ywwlbndYd5FHcqbGPWu3ivsfSSKGmQqAzTT
	HBrh3YuCzquWON9USd4VjPbUZ8I/gQkz0C0Tp3G79DnIuGuSD15eJkh+C10EgFQlp9drngEjCSW
	Q0xiZodFyANKi4lHjFNuY4OvxPIYPfFJ2isbf
X-Gm-Gg: ASbGnctzm3zMasJoRNhL8jsPN07n3uVm1rX/7gdtEtlFg4yITRMOET+i5hdV113WJ43
	j06JRxlq0vxGmGa0zBNuZ0jkzlbKrJXXiCPcMHliZJJ/EF42x0aXbCECkq3O6MCPHzB7IzOpk0t
	0go5+I96rAVlCTxFDXZgV1drVFmzYwh28JJR52mDw8AiUFC8PK3Q==
X-Google-Smtp-Source: AGHT+IFMCSz+DMkX+SXzsy6oBemggwRgx2rch6Bt53f4enSvSdPuMeC4mItCR5WNmCzwmoMolNdmuYo2j8u88K68g3A=
X-Received: by 2002:a4a:e203:0:b0:607:de7b:aa0b with SMTP id
 006d021491bc7-60828d094camr495455eaf.1.1746623402327; Wed, 07 May 2025
 06:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250506095224.176085-1-revest@chromium.org> <aBoP9ILEv-z4bRAQ@finisterre.sirena.org.uk>
In-Reply-To: <aBoP9ILEv-z4bRAQ@finisterre.sirena.org.uk>
From: Florent Revest <revest@chromium.org>
Date: Wed, 7 May 2025 15:09:50 +0200
X-Gm-Features: ATxdqUGqHGfM-ERnuNPXYXI2S2k9wJ40t1n7VxMcXPLGzQ6yF7PJYBq-4YriJMo
Message-ID: <CABRcYmKqCVn7NbrXocyzmYif_ihkeOCvPHZ+jxMi3OPWs6EiTg@mail.gmail.com>
Subject: Re: [PATCH 0/4] mm: Avoid sharing high VMA flag bits
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, catalin.marinas@arm.com, will@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	akpm@linux-foundation.org, thiago.bauermann@linaro.org, jackmanb@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_061004_877381_C00FD818 
X-CRM114-Status: GOOD (  17.75  )
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

On Tue, May 6, 2025 at 3:34=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, May 06, 2025 at 11:52:20AM +0200, Florent Revest wrote:
>
> > While staring at include/linux/mm.h, I was wondering why VM_UFFD_MINOR =
and
> > VM_SHADOW_STACK share the same bit on arm64. I think I gained enough co=
nfidence
> > now to call it a bug.
>
> Yes, it's a bug - it'll be an add/add conflict with those coming in via
> different trees.

Thanks for the review Mark! :)

I just want to make sure I fully understand the point you're making
here, it seems that you are suggesting that 7677f7fd8be7
("userfaultfd: add minor fault registration mode") and ae80e1629aea
("mm: Define VM_SHADOW_STACK for arm64 when we support GCS") came in
from two different trees and independently chose to use the same bit
around the ~same time, is that right ? And that a conflict would have
appeared when they'd eventually get merged into a shared tree ?

I don't think that's what happened in this specific case though. As
far as I can tell, the former was merged in 2021 and the latter was
merged in late 2024. Also, since the hunks got added in very different
parts of include/linux/mm.h, I don't think they caused a noticeable
merge conflict. But I agree it would probably be preferable if these
cases would cause some sort of noticeable merge conflict in the future
...

I'll quickly respin this series to address my typos on patch 4 (sigh)
and add your Reviewed-by tag but just to be clear, my refactorings in
patches 2/3/4 currently focus on using VM_HIGH_ARCH macros
consistently, to make it a bit more obvious to a reader if two
features choose the same bit. But maybe what we would really need
instead is a more obvious way for these bits to be mutually exclusive
and to cause merge conflicts if they get added through independent
trees ? For example, my colleague Brendan Jackman suggested using an
enum for VMA flags bit offsets but I'm not sure what the sentiment is
around that.

