Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B188C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 19:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCPNVjswzrfu/6ewp3QsYppMVfdEr2MBSoZ8rIPqMgs=; b=U1DxTRVXXCOhD0RDhSzH8EMa3w
	4HCg4iFISPyfn+sNcbCvpuuup7b1zlGnxAuw4J+2YA53lq0NfdgT3zFaUKYRHuXgo6GQ189ddAAdU
	nMKb5dYMDFJ7iDWflB8Rymaw6NVshlVF2q5uIJBG0Bx8b6K8RvStnvbOeCeDag7wH2SPpuE+BrsZM
	9COEp98JubcJi/d9igeKUpKW8p83XFef4Per5IPozErnGpZ2JPF6r4hXa5AcaOYg91OwvNHrVIla0
	QAjVf/J+D+VCiNbnDRCJ5MDpyAX9kO0FG2nzml26R0qkhOhBDBLtvGHbtHos646rCd5Zfn7dYSSfC
	YHWrm98g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ULD-0000000DEaf-3Vj3;
	Tue, 01 Sep 2026 19:40:19 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ULB-0000000DEZl-44Fr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 19:40:19 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-499add6348fso115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 12:40:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788291614; cv=none;
        d=google.com; s=arc-20260327;
        b=qM2L8MOXpGbTXbedATwVE6X5QY/98e63FjAMeEchOSTOS829qAmOFCi8wmt+w86Mn8
         BpPd99DbFOs6Eggenf4zKki4cshtAr3f6xQeCHI6c222tqogMe+gRFNkA5q4fkCCpWdM
         r44S2IqK8Mwxd0XZlx1lyJ5Z4j8sUz1+9xTSTnll23s+Q4EL4a32cBqM23Z3+HQBcxhV
         HWvoQv7YM2yUUrF/2W+YeKX7G/noO7vMhlh3DUuZs8GedC57NLYh2NMdcA1wPtBoNJuq
         XKxLVwHob9n8WHbvX1WyT8xkpeOSh98R/ej+KpHz7yPXEPecCiwbKa0avB4teGwLwt+a
         Tl3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mCPNVjswzrfu/6ewp3QsYppMVfdEr2MBSoZ8rIPqMgs=;
        fh=LQyWwhdpinDqtUibhF62ck2XWlVV0+h3zp74lOsQDwQ=;
        b=G5fmj+aWEj+ApEyrPaOsxVydJNL2QNHvVdm6QRF8sylgv59qrcjNEwCRDPFS+pjDiB
         PA4wDWD+XZwFDVbroQ9Tfd00Ci9k2XobiZK7vayMjX5sPMkUIGX6DemnaTkLT/COGDbH
         21z3vDg14mEypP3dbzS8jh7r0yqKQ43cMUnBvci5VE6VrOa/dAYXyAbY1EBeSt7M3jUt
         G9McNCWZIfwyEDmqL6yzciuPQvr1OweGvAmLjQHiHMuU1xCEs6x1xNkAZCJHCckMpWoS
         EYAVnaEdvWekRNBu6cj+k7dBKCSIVWCU1bDFwoObSwuk9wrsvpb9oUIwUA6K9Ji5Zk4O
         IP/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788291614; x=1788896414; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mCPNVjswzrfu/6ewp3QsYppMVfdEr2MBSoZ8rIPqMgs=;
        b=IZFxENfhuOQ9KR8d97a78a1xh+hBU5vXbczIAyNbQ8N1IrH7jDBKuIWgL/VfG/uxLi
         eJ1iuYV2J2knBFJqxdIROmUj6FETv14kBh6hB5NFVmmrsA412QCsQhIgahUGi9HtCbeJ
         QqeM/Wq3HlPaFWVzmqpmeJyRs9ER2ESmiyioNlQzAriCYMEi++mDLYOP4hvXPD7sc/10
         U33sGCxuTvN/G2wMJYDEl99+vQG3UntKc3L2IyL4/35nbfPFLQKtNr/DbMJupYUOMpnW
         dE8CXErSLquvhcP2gBF+A+blISR4nIRGGiUOKhgiUUh+/iQLCvmehGmahqL2p0hu/+0D
         21aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291614; x=1788896414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCPNVjswzrfu/6ewp3QsYppMVfdEr2MBSoZ8rIPqMgs=;
        b=e3J2a4je+C+By1E7YwT2eWMWESu3VucftCFa7McMP5En9oGFEn/McBKjKqmswdrAaT
         SqS3r1Iy0vsku7uJn+uZjTrSaxrNc5wvKyB0NDWeM8kGkwo+k2ZZce/HfGEveKLpKE6S
         AdV9sWxzaS0BJt1k8xB/OM+cPgr0fd8n/8O4l2EmRtV7O6rdUWEUXbapuHp4wBb6/EmW
         OrqUtKMg95KdS0Bp6bjF+BczKpzekI2DJlnlMyoK0/mdebNd8VhfM7pbuwj1aD8/n5sZ
         zYNzWs1xcgUqg/w5lyY4WgUYf/56S2U3QtUKbm9cpzvmQ+ikDINUQa5+eUKqbMZk8S3h
         BO0w==
X-Forwarded-Encrypted: i=1; AHgh+RrBwijA9oaOFXqtpOW3YKupdoQfdSFCAZxcA3Au+tuzOPpcGn3F3VG4MeiMUQ6etldOnsJptmk7qqd/49Pq9qH7@lists.infradead.org
X-Gm-Message-State: AFuF++lKUsqS0tOEZkF9nDB1K8r3dt1SX18Zu+4IbLuKMtxxa4jIKHfZ
	JA9cPYMgku4CBPXQoP+06V13bXo88cgDSThyiAgoVn6D+mixodbajuYBnLtSpD8JxiY2LqQmTMH
	fghv86MxU5vC00wtSgWF3pastduyamvhUjDldQXzm
X-Gm-Gg: AR+sD107Nk7xOTf5Suus5Fh/dqPPPlkysMQogZmeollteae21Qxu+Ob7r5+mahNx7xP
	xVz30rSooTP2jzJ2bQMykX5QW2mhnfPG2CBT/l5jOaI4yAbuyIpxDdvABI8i2JpUT/QtrceE1dR
	27PeqvoLVCBIRbbLQ4nluaSgvWEzTn1AWR7Z3QQJOqX9NSzF5gHqXsG63Ul2euOblaIUbBch7Lz
	hWmKwTk2qEz56xdl0e9umPtcwH11/XuYLht4L7x8lOEjrAUTzOva9T9ULQCQjdFtsoHFssI7DEe
	NOla2llDDNZSBSX2ldowPxa/9e34V9qUe618vJd9o6RkrqGC8H7uPjGm3SrR2hRzduQMg/JJE16
	u
X-Received: by 2002:a05:600c:224b:b0:499:7da3:dd0c with SMTP id
 5b1f17b1804b1-49ce462122emr115145e9.0.1788291614023; Tue, 01 Sep 2026
 12:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260827194508.446733-1-linux@yoavmoshe.com> <20260830155100.1020620-1-linux@yoavmoshe.com>
In-Reply-To: <20260830155100.1020620-1-linux@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 1 Sep 2026 12:39:36 -0700
X-Gm-Features: AcwNN1XK0l8thrBV4rYONxxoAFHyd0qFWNxSTWm7rTcE9pRg3SR1YhO1gQnpQwA
Message-ID: <CABCJKuecSgC2yZ1QHACv3gfOYf+cPXvR5TCEM_t67NX-putr+g@mail.gmail.com>
Subject: Re: [PATCH v5] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_124018_028504_4A7D009D 
X-CRM114-Status: GOOD (  19.08  )
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

On Sun, Aug 30, 2026 at 8:51=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> The suspend code that runs from OCRAM is copied there with fncpy(),
> which does not copy the kCFI type hash preceding the function. With
> CONFIG_CFI=3Dy the indirect call through imx6_suspend_in_ocram_fn
> therefore panics.
>
> Keep the call covered by CFI instead of exempting it:
>
> - Add SYM_TYPED_FUNC_START_ALIGNED(), a variant of
>   SYM_TYPED_FUNC_START() that aligns the function entry rather than
>   the type hash preceding it, and use it to declare imx6_suspend():
>   fncpy() requires the entry point of the function it copies to be
>   8-byte aligned. The macro lives in arch/arm/include/asm/linkage.h
>   since the requirement comes from arm's fncpy().
>
> - Add a cfi_type member at the end of struct imx6_cpu_pm_info, which
>   directly precedes the OCRAM copy of the function. It fits in the
>   struct's tail padding, so no sizes or offsets change. Fill it using
>   cfi_get_func_hash(), putting the hash where the caller's CFI check
>   expects it: four bytes before the function entry.
>
> Also mark ccm_base, suspend_ocram_base and imx6_suspend_in_ocram_fn
> as __ro_after_init: they are only written during __init, and the
> function pointer in particular should not be writable afterwards.
>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Yo'av Moshe <linux@yoavmoshe.com>

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

