Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7B1C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=163N5x68jnVbNG9W8e+t56UKy71p7BqItDDn6Xltr7c=; b=Uw6v3zJ+W5gh4bo+fzwe7XdYxv
	cTsnmURuAcni9Siy7wuraegRO6OPihNNiHUwbsuuJub7Ng8sfx4g+LPW89ypOTTNDXiDA+OqrjPFb
	XViibuco+RxmrBSznfVzauWGzLqZnOECwOnUrYLgShE2PlCXuvoHrRzL+NYGOj6si6MksoMCSdjS8
	+RNGuXARMh+Uiw1dmdUTLZEnSnOrm9z6m+zvHSNkx6f9m6f3QVH3elGqH5bZc5U1DVrasjd32NZy6
	0gB0iRwgKYnlRaEMVcPWr8z6cWPOO5ShSbmSb92a6R+q3dMKXqmz/w+tgz6njF0zMQjUVD/Hm9HBL
	dkBmE4+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrC2-00000007R0v-2WBw;
	Mon, 20 Jul 2026 16:50:14 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrC0-00000007R06-2bzK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:50:13 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c169ae1cb26so709628566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784566209; cv=none;
        d=google.com; s=arc-20260327;
        b=CyOKpQdEn6yRYg1cPnZUv6unNUTGpycH1WUvVMHlS7JBgmTKDa769z3/KhwSSjQS78
         TGFoXAbWE6KH01paWZlL8lMUFZP3+XkV7vB1cpdltsWhK5S+twIOG3VCwyUTO6Vm/9LX
         89UIjicvEGUo8AA3b1DwUKyxnNK6kz/lgIxAic7zL6fTEmNOGIuW+RoZrlsqVOIoaiIn
         6eHycfhf9lIq/czcldeYccplwMuxuLPxsWwC3VNdVcXp6YYHupSXBBI5UiX2EZhcs6pT
         x5Giar1gGAHqizJYdJHUOxtqu10i/M1PVpoeQOZgw/42JQDLKGQLnJCf+4PPoF68j2rT
         N95g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=163N5x68jnVbNG9W8e+t56UKy71p7BqItDDn6Xltr7c=;
        fh=aDRAB2F2hfqOX5WXg5QPADS1dqnVYnk7ZoRshmlRwgA=;
        b=b/ZXv2f/rkfxKxfmEz9MSHju8KaWLBo2vhwK15/VvbDJNt+5gcjce283njZr826yBp
         wJuvlSc2KRS+tUEuz23CxdQ7usJD3FCoqDMgj0ma6KweE2/BpFdz0+e3hyuAcM7neKws
         0hiBAnGVFbSkGLAn4K4TaqP55FPUO7x+gQLhp3Mrse2bU1dK0HT50fTaEGTglZd4f8Wh
         dAxxT/a1nVgM7CL4wsHO94Xfe9KvVWUdLpjn+LGLNPp9Ds9XYpEZ2tltLxzdx0NlBLwi
         Y48YL5oteAOzzXDNWRC8uskw+UEHmN7u75445uYBanvhXBt7NSSCcINaR54P7lV0CPfU
         HuRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784566209; x=1785171009; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=163N5x68jnVbNG9W8e+t56UKy71p7BqItDDn6Xltr7c=;
        b=pRO3nJBuVX2FkbfaAbxciULPj0G8pouOYBS9bATsknlksfZaQ1m+pJaygXNqY+MyAt
         n1LSMWM1UqsU3u+2zgnpwg7xC0RNd/tXMz7SvsBdv3UKKBmdn2PAYvXO3YlWHuvr36jE
         8R+zr3fhmxJ7zr6gBVCqmxi6NYmxPBhecn1BvKZ75MVsvbvnyutbbdRtJL70oFqG62Ty
         xCNzD2cJs/qM2bFAU6YgDiYZAXiSHpSGRG/XBO6ovjSNNEFCCYs/sCZ0kjqoYqYfhkMp
         Df/VEYqM0Yemzi9PO3S//tDjuiuLtX1PSQ1dDr16c+jRRoaGqyZ6Hg8IqdqJQKbdhQ6G
         cMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784566209; x=1785171009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=163N5x68jnVbNG9W8e+t56UKy71p7BqItDDn6Xltr7c=;
        b=TYcGUZZM/pebXrz0C3Ty+/Q406Ux5ln0cVxm7YVeJR6UFIy67O/tKnTDBTP9g+wybh
         nd/9sthuInw6oAj9LlTkQBOJgF9R5y2LNRuMhrVpNw6ypgkgl6qop4Wluez+gWXDfER+
         HE94hK4Zf/X352ESMRnIiym0b4I2yA1Vv4XIy8ZNItGrOckYvQZeQ8V88M2dlmPB9gNw
         KrYS1QB/iKBhbfUxHOo9oSjneIiXTgYx4Ur8jBh323+srOxfjsKdVHeFBfoKv/r0FewI
         mmNqE+6/fnmOYcANi8Jv/INenqfo2+dd+gKb8y1e1p+Q/2nv7fHhewU8B/5NKbd6EVni
         z5aA==
X-Forwarded-Encrypted: i=1; AHgh+RoGsLrovXBO2y7YM7dR6+zERxVg4tbw3NXT8SlKIZ964HkJwoHSsDzeOzlb+en9HYgHaI87SdzKIHzX1PGofFAk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+vM/w0Ez3Qaqu907goWMGOWxdp/pLIxqwscuPVI9fSSQFPtGH
	7CF7iNVzlrvsCD4EhJmYH2pugptB/MA7f8Uh3nqK8tkIINwkrLEMpFh4WhaELTDT+IEzAyqPJbW
	C4r91omWuo76NSARt4V8kdOpSrsPdlRgYiqszKik2KskLAZoX+3B1ShUm
X-Gm-Gg: AfdE7cn67iwN+6LGXCrrzeRoThveS3YP+nUy99IvvQd+4909j+8gEcJE8HLErucbTda
	grlchBJf99zCTykgoo4cvR3DXNiKV3OX57R4kFASbzqO6qQZleetS111whb7pL33mDDoZoq+gIj
	jU8G1nxJk4MizDraWJxqFNIlqfzyIlcXAGSS6w6VsQNjenh3E4zStL6nbX0boxifR/AHybR3575
	PcxPwfi9Rl/R27czWh1UxLEVZoNd4T0RpkzsY3D4eoRcXcUTHdDNGu8/IMPuUfT6cT7pUN/IWU7
	T866aGNKMLEMNj2JaavfjH5An29BI2uMidF79vC6MEFt35ZUVGSHlTMXjUCK5JOgfnlkcWi+ijn
	x
X-Received: by 2002:a17:907:e917:b0:c15:fc5b:b667 with SMTP id
 a640c23a62f3a-c16b40f8999mr685752766b.19.1784566208840; Mon, 20 Jul 2026
 09:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260717141648.1007059-1-linux@yoavmoshe.com>
In-Reply-To: <20260717141648.1007059-1-linux@yoavmoshe.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 20 Jul 2026 09:49:57 -0700
X-Gm-Features: AUfX_myCkoH_ohyvAhDykS-FTisAi77kahkS1sYBNzC30PdiB5itO0E3RJF3Z5w
Message-ID: <CAKwvOdkGYLWAR+5q+XaO6VZc3-sGEm0nX0MvXoJOghx7Gn1tRg@mail.gmail.com>
Subject: Re: [PATCH] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_095012_685560_934D12DF 
X-CRM114-Status: GOOD (  18.01  )
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

On Fri, Jul 17, 2026 at 7:17=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> Relocated suspend code in OCRAM lacks compiler-generated CFI type
> signatures. When CONFIG_CFI=3Dy is active, the indirect call to
> imx6_suspend_in_ocram_fn triggers a strict CFI violation panic.
>
> Annotate imx6q_suspend_finish with __nocfi to bypass CFI checking
> for this specific indirect call.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Yo'av Moshe <linux@yoavmoshe.com>

Thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> Tested on a Kobo Clara HD (i.MX6SLL SoC) running postmarketOS edge.
> Before this patch, suspending the device caused an immediate silent
> hang requiring a hard-reboot. With this patch applied, suspend and
> resume work successfully.
>
>  arch/arm/mach-imx/pm-imx6.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> index a671ca498..d9b0c1803 100644
> --- a/arch/arm/mach-imx/pm-imx6.c
> +++ b/arch/arm/mach-imx/pm-imx6.c
> @@ -360,7 +360,7 @@ int imx6_set_lpm(enum mxc_cpu_pwr_mode mode)
>         return 0;
>  }
>
> -static int imx6q_suspend_finish(unsigned long val)
> +static int __nocfi imx6q_suspend_finish(unsigned long val)
>  {
>         if (!imx6_suspend_in_ocram_fn) {
>                 cpu_do_idle();
> --
> 2.55.0
>


--=20
Thanks,
~Nick Desaulniers

