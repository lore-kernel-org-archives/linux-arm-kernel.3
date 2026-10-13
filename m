Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF244CC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 18:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tc1zp/jsWqF51CNIfkZYVDsfG54HgePDR513djZlTcM=; b=ju2kmk3qmepJfT9O62KsPpIUTE
	BnAw8ApjhHmEYBv7af7/IeMRGJ7+ZJV08csncXqJfaCXt8BSpjWrAI9/axeE8icxrjPypkFnXuSzH
	R6IG0zmpnmm8H5HJxawV6886iyTDbDkV6p8wEnJqqg2ciOMreacymBuHCFpfNscsS0UmqceXEPsbA
	B6NZhkHUtN3/M62PsRWecoppz2Ct9QB+fOsfJ5yfoNritLFs5+gHTMpArogB706HhT/v9u+W/oz4O
	FPTVIWBZUXWUw8vKWYMzfxqgBvt/AOx1eYTYn6M+0Aq072Iii51qi5a9XEClNXvGmSEPYZ6DLClTX
	nrBGyJDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgyP-0000000DnuX-1kNb;
	Tue, 13 Oct 2026 18:11:37 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgyM-0000000Dntg-3tdu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 18:11:36 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3a75f960be3so2653991fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 11:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791915092; cv=none;
        d=google.com; s=arc-20260327;
        b=eoudsxq/qxuHkVQw4gGRRARTZXAg80QocvUwbNLi5CvnaHHKMd24FP9AcXY08Fz448
         pGcwTb/CdGK3UffcdzBbpCUHTx1wdLnQONq+SSzs82rvLRCc3AxB03WZx54OW8WJ3dNy
         R4btTv8muNKkBtWSNphYXv+U7mqg334qzEAOjDIqoKi6iY+WXyTjVi3pTB8sWI5pO6QH
         k/HsRaCzDowoo/vaqm0avVRSA0YsrtrodCvNVZC4raxYTqyuau1OBIx1JKCRHcC+jY48
         W8x/JzuvJnMNwp4yIpl2hvKYJj7WLFJ9RrpghrO/aB4rv9NmZN9pL1epa3u7xsyLynV4
         TdfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tc1zp/jsWqF51CNIfkZYVDsfG54HgePDR513djZlTcM=;
        fh=fGB9b7SJ1zYr6V+CDUCFgFcbC6KfKVBz+nbk+MeSGIk=;
        b=kRDXPgRcfGWxJEs2R39adJ71/ouB7WaT26UqoAGqNTgKvyKRthx9mUolIj8i/nk4j0
         T4RABWEOJY6Y/iC8tpspQpwBAUPLuOujIcLzL/NCUWJC29G6uuDEEsi2cDT5SjZwzUe0
         9NAZyijnsIiedaouzVZeWn+fm6pr8xKfPHEiA0KKxLZ0omMHrFKuj+ALRJ4QZ6JFQPOG
         QE/u3TgA/436lNf3Eo7C8gNFTD1aqIoqUQCpLIZbeEZ3yDyjdx7W5+KkqwZLu0prWJ4c
         CMdojcOqjVI2+QwcqcH4baxRebgl6FyNeBS+6a5aevjwsMo8Enl9rXWaVi/xyfa9fLf1
         ytNA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915092; x=1792519892; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tc1zp/jsWqF51CNIfkZYVDsfG54HgePDR513djZlTcM=;
        b=JWw0OSmV3+wws/VuxBGeJexzTdwj5d1ejlVry8MMIAdPU9zJGQQxt5F+7gAEV+ui8T
         /E54iXHsQN6AHSNttku2aDlB8sTQ+VjxHdUbuWzN2frOUI67GHuhOERoKw/5NaBKExE7
         G/DLHvX0/hKuA6k4McTKg9mnUGbCgfJ2XJo2A2CErylzjpDYibETFyV9rcaGIGxxxtBi
         BgbhM7KQunMdg8QMFev3zMbaGI97mmNo3CQZiQDf8iJC44BzZQSF1H+ZB6923ROnVn3A
         SYMgc+w28srRvIkpBTvu2pfXGdyVk9wYVfiHPNARqfXwRxCqrw+K07tJC4nFLnK/Axu5
         fIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915092; x=1792519892;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tc1zp/jsWqF51CNIfkZYVDsfG54HgePDR513djZlTcM=;
        b=pZJxd8Wf69M+c6XSyXledXbJU9mawwvFckJnPPyjbrZLAgbF+JWzmp0z/QzCx0SDhj
         L9sUEp8OfmbBmiQnzqxtbLvxrL/Rim/f4DhLvDglX5ggZNEDkb7+ofNO+beXXYmW8JNw
         8phoEjFMNvYVRgGyj6bpscoaaDPzY9tL5ZFZv/HSN4GH4q4b35ZJBt5UrUAEuTfWyzCJ
         KwAnNCB34J+au818Ace31OMGPKTQP+yqaQi6gT+zWtbXczFWHkE3ucbsSTNMxyn1j2Te
         wNgp8RsCJfCZNk9TuIMBqYkUBiEL4pr3QlMo2H1jMjNuw4rh0pbNUzsk42wC3Sa3GXkT
         LfAQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0bZLAIQLKK/o5AuJfNHqhrMEITdU5Ma6hBbxtyLQwZyMeqQIyyu2oRPYiGY8PGiq9pEbADL+A4ip+U8oe2GTL@lists.infradead.org
X-Gm-Message-State: AFq9FYL5B6MfMFxvXZQsBLTEWAklN7XTjOj+TRIpVtCnu5XeVATbHOwY
	6j9iSXY6imkNYoFf/GjpSP4FPjcd6P3yzKHPJI8k/bTJIQz0gSbOF2s+vjf/NCMsjjISAcmegLm
	7qrKb6xXDTor/YJzzkh5ORr65/OGFy30=
X-Gm-Gg: AYBFou368OoKW0Z6YdpfRWqtENsgIOfqTsb6EsUqYEtSfoGJUmA3BMxwKm3CO88+wWP
	X2tq2PxKKL2fwXExl3N1T6VrJ2rEsWwUuBguFrwzHEjZI1ywoGDUDwlNmmHmvNSY+bURB1cE6l8
	InzNIuxHa5nGmhOX0lUooTPuM8NBmVIuoA6YY5mqfVC1hGu+17cVB6xsJN5bRTI9M0hiNmZCjPz
	KMeXrie73rrn8wAB/q7d8Nw0e4WYjrQ0RU/QOnhPmHHjU3WlZcFK1nbJqaZOvXzm5m4aR0IfnWr
	lSD3uvZs0EM0TW3ZbK7YAanXGPCuNdbcgCMKwgEbdALHbEypE9EsZqS3
X-Received: by 2002:a05:651c:1542:b0:3a6:692d:b7ed with SMTP id
 38308e7fff4ca-3a9c539343dmr36125771fa.20.1791915092239; Tue, 13 Oct 2026
 11:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1781622998.git.geraldogabriel@gmail.com> <179189927768.12828.5970294502454132706.b4-ty@b4>
In-Reply-To: <179189927768.12828.5970294502454132706.b4-ty@b4>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Tue, 13 Oct 2026 15:11:20 -0300
X-Gm-Features: AclHuK9xQdtHZz7WlG4Kf2RJqiboP4WJrJZBrkr8E7ZdVfvIdA54iitY7tUbJH4
Message-ID: <CAEsQvctXV4zga6Rn+6=Q1zmEmMjDV-83VTWP-b2gWy4Bfdz_1Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] PCI: rockchip: 5.0 GT/s speed discouraged by Rockchip
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>, 
	linux-rockchip@lists.infradead.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_111134_986526_A4DCF0F2 
X-CRM114-Status: GOOD (  13.18  )
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

Hi Mani,

On Tue, Oct 13, 2026 at 10:48=E2=80=AFAM Manivannan Sadhasivam <mani@kernel=
.org> wrote:
>
>
> On Tue, 16 Jun 2026 12:24:48 -0300, Geraldo Nascimento wrote:
> > PCI: rockchip: 5.0 GT/s speed discouraged by Rockchip
> >
> > Dragan Simic already had warned me of potential issues with 5.0 GT/s
> > speed operation in Rockchip PCIe. However, in recent interactions
> > with Shawn Lin from Rockchip it came to my attention there's grave
> > danger in the unknown errata regarding 5.0 GT/s operational speed
> > of their PCIe core, including data loss.
> >
> > [...]
>
> Applied, thanks!

Thank you Mani, that was an important drop.

It's a little strange I guess to have patches that were Reported-by
and then Reviewed-by the same people. But in this case Dragan
and Shawn deserve all the credit, I'm just the person who dropped
some code.

Regards,
Geraldo Nascimento

>
> [1/3] PCI: rockchip-ep: do not attempt 5.0 GT/s retraining
>       commit: 39f89dde0a76b229df7eb356aaf6f444b4f8a636
> [2/3] PCI: rockchip-host: do not attempt 5.0 GT/s retraining
>       commit: 5988a53f5bf758b2d41cb6e0832c19b9692c76d2
> [3/3] PCI: rockchip: drive at 2.5 GT/s, error other speeds
>       commit: 62843031ca1f11d1b8e90e7f558c1b3c4cd77184
>
> Best regards,
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
>
>

