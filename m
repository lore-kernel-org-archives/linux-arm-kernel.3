Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0F2C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 04:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVj6OOuw8+ZpNkuoXFcXlRxfZ6JLOmksHtPRzEkYO3Y=; b=oZhWkLDd7ppuLdNbTDnzjm96j0
	G+tT+nOEb6SRDxRCJRg/slQVJTDulso7/NLNrGc1/J9kVXUS2NEZ9uUvw0yDep6GcuOAA5JMwyYCs
	tya8sbGHl0Bv3cjGjeU45fqXhijLtxo1VBNDwBbxHSPPS5JzhMloZ0iabEavGIOh6xPQZwu2RDXV4
	ieDPAGvoGfFeYeHRW3G/A0KBLuz46rwlWySYcxscCgHRbtyDHPqND7PBhEkjFzVIkw1PjjwlhCDid
	wSEf4651DyKlON7+PNb+2vZbr7fnUWPVm7sbHmr/3Pf2A4ImG+qC8VolBFbpb1U8FyDPL6nRbHtxV
	H+C90pKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6L3H-00000005D4M-3jDk;
	Tue, 15 Sep 2026 04:45:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6L3F-00000005D3n-3eGQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 04:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AVj6OOuw8+ZpNkuoXFcXlRxfZ6JLOmksHtPRzEkYO3Y=; b=G4YEsFdK+2lHjMvXSZA0KSmvjR
	Q6BvZ4M6xG+Bqe+yjosptfTg6JuIlv39B/cC3bcF96FCaAB+VgaPfarhNXieKHgSw0oKml68ZlSME
	O8xPAmGHdVxp36boEvv8V7P0SzRknIxBAUoNH7gzOgur6eOY+iVJvla0K6ZCenr3MtFQXJx8hUc8O
	ShMtFySiq4bJQuHknpSQWvO2k2XNn7gwdcBE/OALK+YOSHe9VYKNx1pVko8YWkbt5PatifogbWMkV
	s8CAeU4v+9xM0l/5gWBCBoVFNSntCIPV2+bqZup0LV4FKDmlpiDabVs2gc21CoNhSLSSFQxEDvy20
	x/jA54Yw==;
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6L3C-00000006GiH-0LDp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 04:45:48 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c2940d16190so583189566b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 21:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789447544; cv=none;
        d=google.com; s=arc-20260327;
        b=iSseLIfUHshSSFkIjaMWrI4jpCgN88dSLKPe65Tx8hBb95DOTExV6JG3ap9T3TyaRB
         NK9vLVFNQpwfAlI/SnM7uSB2WnWSIrTNsjb7kfBU+nrLLqTHLPJErRc1GIuC7k0Mad4w
         v5oc3fHZJMz8P21aCLdlgaBLNbUC/XZwtjxDL8LHMbARGRo6HlhK2TPMJVBBgDF1EMij
         PHC+G2o82nsUfgs8i3bnNXJcynaIHeELAz4QLj29ZLDAXhFiuqMk+hp6juQ99C/ebZd9
         I+CiVRlsMludb3mA6DmwRvp7p51FERDyfDBrTa6UqFXWlAi9ZiyRwG6O61HYZHW0Bt/x
         1i+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AVj6OOuw8+ZpNkuoXFcXlRxfZ6JLOmksHtPRzEkYO3Y=;
        fh=8YR2tnog+e98RBf5eUD5fu5+S0f1srdIRfjXdNrscu0=;
        b=c3ImqvsCP97REdzTEvAFQU7XFTMkpKB7xggcH9YrcfC2srXdPSi+yhZGdjOoCgxY/Z
         SFGBMFMHkBun8b8JuFxJ8ahnRxG9kYjk84aL7rFoyIvZ2QKZASx2+Rx8fw75CrIVgII8
         1SJ6xJceHtNEvJAkKxpWep6ZMoJrMwIg6jqfYVZs470A8FvHxdFjYD9KoE572aCGm/6l
         y/ifOgZ9bDtcmRPiIu3g7bacbduclnd3tBknF8mOkKV0Ox7o6sjTa92FkZuZTySe9c0q
         sghbNim1l7TQShVje77SkozUz97i20rxTAq/CL6B0XKzau81N1sltCZkgGWkbQzH2nle
         OXIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789447544; x=1790052344; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVj6OOuw8+ZpNkuoXFcXlRxfZ6JLOmksHtPRzEkYO3Y=;
        b=jr8ax6nnVJfw6IdbLmLxuk+c4VXcehn1dlAn+KE0hLeoKAtBnhH6VwGN9H9+KEIa1P
         tOX3OAMbt8YfXR2OmDzP5S7lLSGPDH+1jkcKVDrL+ceLiyrIE0ITWlee7HqdEeK8OtxL
         w2K4UNbSbg4yPe6sJIToR8PA8Kn4f7ssVEmbUpPf+RxzbZN1F1wxK22BIZqTYYn82Ywz
         YUyLwvyVlzF1UtP5TviOeWfELPGSVioMOWMAvtZHkrW4IauBxOk0DQRsSUyvLXLQSvoN
         rjOCshcoXlPHDykXYku9U0obQHUhgkUFKVkMYhRGmtjXT5+8q8HIJ+t/oC4/kILX/FTa
         8+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789447544; x=1790052344;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AVj6OOuw8+ZpNkuoXFcXlRxfZ6JLOmksHtPRzEkYO3Y=;
        b=HOt58MhcPfCYqg7HdjTVMxpgvdm/4lQUIxbAX+4/DICQ0ptBzy8n++DWldQDuLZTPL
         IsCvNp75SLlrEG5Eeo0JzhZ2CnhCXXP3m64nJiCs3xaPfQ8ganwJJzP4tox6jJoDdPIA
         saLDxJVZv64deZSjTdWfw9jWLQFwlUd258Hw2Nna6R138hCdWJgUA1tU0i9RsIxGKMLJ
         0y17TpYPYKFg7sJsz1h96CpeuLwH0a5kNAEXythL8u5RHh4Z3buuHUi3SeeBMWnZRSqg
         Y3Tm77qNy7Sw/9MchRwbVWQE4VLuo5j58D7TDjltrsf0KQSgPPpFGe1kI6NlI4eISM3Z
         yDTg==
X-Forwarded-Encrypted: i=1; AKwUvBx4/F+8wjGSlbWCoZ42GvBqhOa1w/lPgG8GNuGm7qXR9wybDwi1tl2QDwuREbeaF6ipAxexMkGUa4Qin8/z8M/G@lists.infradead.org
X-Gm-Message-State: AFuF++lp1ZgodhOscT9RAufMGbuG2yhMKYCLzxb0rM2VLoNGTKpF2nXu
	0miJHu4LpMMsuwGMEoJHGJIpEQOw/I+ZYt4F/cboCHC+oZRyivb5wdVWzbXEEXiUAOvHXlDvPyd
	ys9zxvffykq4Mdywj4R+5SCcHpMbMQRk=
X-Gm-Gg: AYBFou1Xvd00g6xAOrC4JmwfYQGUZPnOMhWTw2YESi3aHwcPjS1KCKS90l/N788g+5Q
	o1CbpSrPs0P6YbSdrEQAWzv3LDsgDgj7yX4I1Id1y1y5lFLn0rBaY7AQOutAgPeQ5HUSo4hS0fP
	K0fzjoUqen8JbK5OgIcdEytKpWasut4syTUl9r7qI51kPKGY0ljvgE3ItvVU0zGsrq89HmVL2iO
	n084HU1ZQKmiZ48YKDJFQrY81obR8qLtKVRgRpaCR1uEfjp3e68Tye9s1JobNUgzxCi/fhsVLD4
	XE8Yuyxw+W4qHirqt6iUI7tXkD+uZEMUnXIMJYn0fFPVWj+oW8BkclY=
X-Received: by 2002:a17:907:d8f:b0:c25:c54d:d1a2 with SMTP id
 a640c23a62f3a-c29b864787dmr350678466b.18.1789447543614; Mon, 14 Sep 2026
 21:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260913145905.9404-1-linux.amoon@gmail.com> <20260913145905.9404-10-linux.amoon@gmail.com>
 <d4174f6c-2ced-4827-b579-c54b37619023@kernel.org>
In-Reply-To: <d4174f6c-2ced-4827-b579-c54b37619023@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 15 Sep 2026 10:15:26 +0530
X-Gm-Features: AcwNN1XnROT-wl_Pv4SIRl9gq2osyQZq9QJ7pS3eOAiL7xJk3WzBKCm1k8F3Pac
Message-ID: <CANAwSgQ1Uno50rGMW3Mrtrmm_DW22fgOzbLZH7uHu=StQ8_t8g@mail.gmail.com>
Subject: Re: [PATCH v9 9/9] thermal/drivers/exynos: Select thermal emulation support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"open list:THERMAL" <linux-pm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_054546_597969_B5DB7157 
X-CRM114-Status: GOOD (  20.80  )
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

Hi Krzysztof,

Thanks for your review comments.
On Mon, 14 Sept 2026 at 12:30, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/09/2026 16:58, Anand Moon wrote:
> > Select THERMAL_EMULATION when EXYNOS_THERMAL is enabled, as the Exynos
> > TMU driver provides thermal emulation support.
> >
> > This ensures the thermal emulation framework is enabled whenever the
> > Exynos TMU driver is built.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  drivers/thermal/samsung/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kconfig
> > index e1e8035d24fb..7d5590f78185 100644
> > --- a/drivers/thermal/samsung/Kconfig
> > +++ b/drivers/thermal/samsung/Kconfig
> > @@ -4,6 +4,7 @@ config EXYNOS_THERMAL
> >       depends on THERMAL_OF
> >       depends on HAS_IOMEM
> >       default ARCH_EXYNOS
> > +     select THERMAL_EMULATION
>
> No, drivers should not select user visible symbols and also this has
> absolutely nothing to do with Exynos.
>
> NAK
>
Many distros do not enable it, so I wanted this selected by default.
> Best regards,
> Krzysztof

Thanks
-Anand

