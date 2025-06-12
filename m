Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82719C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 10:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6IteP7BP9moGyYHUNtJgLr0pJFVsqjJ7MguYFjZTR8=; b=In8TvI95PEmHAU+nP+evchVkRL
	0O5c0yYvt9TcQU+hVghbYeworad/C965r4PW9SdZGoF5Ro3Ah8jBAh4cZqoGS1VHz592+Qe0w4uQb
	GMjjJfvsHt/XYeqhIVKJco2d4GHbQidMo3ia5e6aaT+LdqiZmwC5mhXEw2XXikb9F0IKT89EufDJK
	6OU7aYKKb4jxM5BWPhpNqBQcssmXVYJYsSQPyDDD61qxj+CmT4ben0zoY2yN0pzouQDUf+Ca3fFq+
	fHakmICS/WbC/DRvE7H1KZUVUDbPhZXsH6ApfHNGkQwBcoEdd6UFf5TLZTs35ptbcb8+RQ2bds/NG
	h6MZa/bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPepo-0000000Cuq0-3lDc;
	Thu, 12 Jun 2025 10:07:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdeJ-0000000CiSs-07s0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 08:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749718260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E6IteP7BP9moGyYHUNtJgLr0pJFVsqjJ7MguYFjZTR8=;
	b=FRTrvHG+MjgkEDet6S0VW13F1D2uWiPHr6bg8BafbTfSELsxoVz1RYcoc1Tl9XYKlKQVD1
	v3k3kbD+pnTLxMOBc9ImE4QZBAubBUuYNxrsakJA/QPNktdPCqPwgZ05Fo+PWCH6fak21M
	w4jb3IaaXLoWfqJEh4bVuFIr8Ky2ea4=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-TDkbjkizPJCWaBZ4OuR2IQ-1; Thu, 12 Jun 2025 04:49:17 -0400
X-MC-Unique: TDkbjkizPJCWaBZ4OuR2IQ-1
X-Mimecast-MFC-AGG-ID: TDkbjkizPJCWaBZ4OuR2IQ_1749718157
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-736eaf421f6so219277a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 01:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749718157; x=1750322957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6IteP7BP9moGyYHUNtJgLr0pJFVsqjJ7MguYFjZTR8=;
        b=uNwDqC32qLFizO99rmxYQjSxF1d6d6zZf9q5hyElP7czTRsI7bTtj//zkWDw2EWr9a
         zJC8UfyAjbVR0j3ub4Sjb1K/SFALdwqxD0punpMtKPRPGjJ95NB/jjElAi92EvECT8AB
         qiM2g2Pit3DeR+fYodjXA0U10IgO422PiZjMevSZjrWL4lxzZbwUcHEC5DKWyxc7V99+
         TvHncXF1RGZ2Cg95aW/cOWOBQWZOjEvuSX93pnoCpN+94Kvv9E1rCY+ADY6lVOU3/Shr
         GRFN6WXuwG50kKCfadF5l0le8wpeeXtwsIBiDXi64JiTlJMP9HrLfPOl5HRiVHKbnqV0
         P7Hw==
X-Forwarded-Encrypted: i=1; AJvYcCV7Czkh6at7LxJ5syyPK03pM9DGEJnQKUlNdI6JE5nGH3O9BCn7+N3UEjhj2yDx7QjjZN9F/3pWFshYMz6sqxMn@lists.infradead.org
X-Gm-Message-State: AOJu0Yylx9wszidBXSdW/ueLrom1IoSBFXLxlGzHPkcNVls2xQ4g6SDC
	xkerMGSNWWSjFd7+RlsD5uFTgapHrI/EpsV+chVlrloCfhbpOoiWNcTLaMtFUBzNmYxWMCjlX+W
	igMFnA8uRJVEk27tiRr5b+h6eyILJRGcjYhj5OYVKdopVR4VwfyuigcR/ekXVA4UoAFyegO+INt
	XSR1t+lsxko9TOES9CKevy9r5hshRJfZNsfOS727vfbuIHZrmQtJM=
X-Gm-Gg: ASbGnctsZKIy12PqgZPAjSr7Ds+g7Bt4GUYO5SeYLDv4rNOJXzkazJRcu7GhgfEftDv
	vH+S1hO98qyPNeXy/TraGm4q8pzoUacMCwmvWL3364ui/33uALYui3+Ox+RpQM1LvKJwRBh6NA4
	L9iuA=
X-Received: by 2002:a05:6820:481a:b0:60f:880:6082 with SMTP id 006d021491bc7-610ef6f0f1fmr647773eaf.1.1749718157194;
        Thu, 12 Jun 2025 01:49:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwPFH5xCDRpuf1s5d5mJAfNQIldXb2TcD3mthjSOwkVxy4npvtOqbY5CzUVlMoXgCj/fxjsyNscrEZA/vemEI=
X-Received: by 2002:a05:6820:481a:b0:60f:880:6082 with SMTP id
 006d021491bc7-610ef6f0f1fmr647769eaf.1.1749718156873; Thu, 12 Jun 2025
 01:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250109121614.754466-1-s-vadapalli@ti.com> <20250109121614.754466-2-s-vadapalli@ti.com>
 <fccedc26-0bb9-4078-8a94-4199f6b383c1@kernel.org>
In-Reply-To: <fccedc26-0bb9-4078-8a94-4199f6b383c1@kernel.org>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Thu, 12 Jun 2025 10:48:20 +0200
X-Gm-Features: AX0GCFucWcc-KrL-D5Adt3auExiV1GTxSbUzP5wSIA--M9Ad_QrNh0O58OSRSGM
Message-ID: <CALE0LRsdsTU-NLN4fgh2c8qnS-pPP1BDJvjnvsSOnud8amk3=A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] phy: cadence-torrent: Add PCIe multilink
 configuration for 100 MHz refclk
To: Roger Quadros <rogerq@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, vkoul@kernel.org, kishon@kernel.org, 
	sjakhade@cadence.com, thomas.richard@bootlin.com, 
	christophe.jaillet@wanadoo.fr, u.kleine-koenig@baylibre.com, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7rK_XSkhLLcHsglDyU51-Hp9DkTuxoSZKBS3yVnrACc_1749718157
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_015103_136150_07B7835E 
X-CRM114-Status: GOOD (  10.25  )
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

Hi all,

On Thu, Jan 9, 2025 at 5:35=E2=80=AFPM Roger Quadros <rogerq@kernel.org> wr=
ote:
>
>
>
> On 09/01/2025 14:16, Siddharth Vadapalli wrote:
> > From: Swapnil Jakhade <sjakhade@cadence.com>
> >
> > Add register sequences to support PCIe multilink configuration for 100M=
Hz
> > reference clock. Maximum two PCIe links are supported.
> >
> > Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>
> Reviewed-by: Roger Quadros <rogerq@kernel.org>
>

These patches seem good and have been reviewed but look stalled here.
There is any chance to rebase it on top of the mainline?

Thanks,
   Enric


