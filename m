Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45191C71155
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 06:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZx0v6I2hXvNUX2y8yhSiIo588YdK8i8Accx3bbYV7I=; b=NJonBWvRfwvo4/nvbhcfTIr3VD
	8F6zBjZFtoWALrvUduOQu42DHX/SfehZVIjN5zG/ICpf9HQAPHdCqXFNcvddrWMzbSwjGrxY4PUZF
	eNQPAXYysfJtGYvMMY0Q+dUVESvHQA6ZAnMzSwjQVdUKu7CyDFCuoBKcObC1Ax7DwzJo8DqP1y3ay
	qIsiquFPC2v4CPAmgYE5g0a7R4l17ltJ5AIRttz+wLvYgxHrqUM0Xl72V2i8/YKw4BHupcUbDrjBJ
	EZpPbWFAR+mid5NuSlZ33MJVHjtcnsiC2tnu1p5Ixw0uMI83XSgdEHm+lip3qEB+gDhlzTh6EBvCL
	3VecD2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPkn-00000006Loh-2WiR;
	Tue, 17 Jun 2025 06:25:05 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPeH-00000006L9P-3YtC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 06:18:23 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ade750971f2so685914466b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 23:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750141100; x=1750745900; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZx0v6I2hXvNUX2y8yhSiIo588YdK8i8Accx3bbYV7I=;
        b=S506f8jWdMskXbIGGl5Ju28dEd1p805KoEJJvNhnIhsOKppeh0Mjrff/OdiYsyURrk
         18sN7GBPy1UCsH+KzkDGvPJrO86aqGb4BBa0kRYlv6/ohitZpcKcWzSSWxzhzOwAFpr2
         wUKJ5sTqrz49QAht6R5Gri53MD9SEYlY0mVeTFZg5X02cNguGmF32gVRtwdshWIuBxCB
         8uf0KlOC7VTVjJrXgW7h2o24hzMFH2iH+P+u0Ft2pF1/qXRKfpb0iCQP+HPrrsK7vM0V
         FledHwzyA5EaEA7wqFL1wqoYWyI/uH94jxOwL/Vr0jN7pZ9jR4a+75IhmVsdbESvcEAB
         9n6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750141100; x=1750745900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZx0v6I2hXvNUX2y8yhSiIo588YdK8i8Accx3bbYV7I=;
        b=UVncPgevHkhKx27wSJ6fJqoFF1kudf4yKZ+qX2ZBqgMTjbkXASdWC/01FHWjrdH77H
         gaPRTRMnk+EUIvACJ544f7BCt/8mkc2vQIHqpZ2eh82WbsnLfqVEImgvUr41L0cu2wg6
         glG7V8lWMcMpbohEdjS/2MvEJFrb/FWniWu/Gq3LXvVQZyPwOuZ5PjFnySXptIdg36Bs
         wrQ3uWbOg/dxFJfGOxowLScBxtx8yygtPDRclhmdGCYYuz760uV7nTyW3ie0SIqesAI6
         g1QW6Tf/dNBSVgLFZpYZXpGLwe+PhP0BFERS3fRcHctZj2zkHPbPzMlmTDl/kdVEH6Lx
         1KEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ4dKV0X0ox0PKwHk2M+mcpvt1Ael3ZtKldgvWqLw1IjFwtVAyx1Fc7/J6gPchblLcL4tl2nt1yx+nUNAwSil7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0q/swP7Fh/2n+nlebSkiLLY8rl8ROit2SzpPD6BGjPxDtPYv/
	Ckf/jhXbIE5Y2RznB31P8Kzys/czTjMzjIYiwrFmOIYDkSiU82U77ko8BHQ3qtjCO5iXpSEuVY7
	cvtMsDF2rfhe8VdOlqlNbkKPKzVD6TSo=
X-Gm-Gg: ASbGncvDoU+3UJ+72fwkShs5mu8BEF9zTLexvkS+bSzYuoXKuR8GyrSgy/I09VzbRj3
	BKRN6kHzWooq0hQnHK1RChdjscEd0d9INkuKamUpliMrQvXRDDxFnySS2RSAAap7zpYeJLJuqgM
	TOCIsAIevwCWeZgMclbiArC+6PMs4B68wO0WCuMHi/I2s15w==
X-Google-Smtp-Source: AGHT+IEb0p5AOkeNd2n7TkLLTa14NWWyKLdA98r9DWPpT+4upElWacc7z88/k8SjDdc4+v/eOumwastZ0UDjRsu9gFs=
X-Received: by 2002:a17:907:3f87:b0:ad8:9f50:d8c1 with SMTP id
 a640c23a62f3a-adfad416340mr1247467766b.31.1750141099926; Mon, 16 Jun 2025
 23:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <87tt4fnsf4.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tt4fnsf4.wl-kuninori.morimoto.gx@renesas.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Jun 2025 09:17:43 +0300
X-Gm-Features: AX0GCFv0cPGWTPsur8zoreNhIfHikyxr032a_5Rc9fV77rdx6YcTH02CUNYJ3N4
Message-ID: <CAHp75VdEU+Ra+KWae6n7Y-Zt5Uptj48BSU9frV6g87VPr-nm_A@mail.gmail.com>
Subject: Re: [PATCH] arm: mm: l2x0: use string choices helper
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Russell King <linux@armlinux.org.uk>, Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_231821_892184_A512F513 
X-CRM114-Status: UNSURE (   6.83  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jun 17, 2025 at 3:06=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:

Missing commit message.

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Otherwise, in contrast to the other patch, this is a good change.
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

