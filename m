Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA800D5CCAF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 13:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bRYMDo31wli1+F5XqLgDNYu5RKLrQYurcKRy2ybtgM=; b=LiYydHUklNg5WvnjyunPXC9zoN
	/EudH6NtkNp04EYAmZcQ24alCiFeM4yqV8GbQh3WsNNmuHS5swarm92R9yq0XeUQ3KMCvj8G0mxzK
	AUUpOIs2ECCmyEEub4Fdmh20f1X0pjGKChd3UZ5AVEj7v1jQ9ddRzvEYLsz0vK5ef5+cbhn1t6buO
	xxOtdsrmKdT/Y7XzY29bFtAWulCMt5K/6vqk5aA3b2J/gUIiNlb4JraqUHf3DjbwlEtmHmADpsL+n
	bo1cxe9fJS5txTGdo5ByoFPRpm0InR23EGimcV5MZd3lX9S5C70tE3F0I0/Rit9iXJZ2obzL+BTlL
	gBgorkMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t68vW-00000000VX4-45co;
	Wed, 30 Oct 2024 13:39:59 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t68kJ-00000000TLG-1F76
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 13:28:24 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d4d1b48f3so4774925f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 06:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730294901; x=1730899701; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5bRYMDo31wli1+F5XqLgDNYu5RKLrQYurcKRy2ybtgM=;
        b=kC/cI2zHYiuTjF9nv9VBH2MJlW/Xl1rMBUN2MR04KnY8c/f8G6LyitHIEiv5odRsxB
         zDcJIbI4MiQtcbol5wLWg44AwjUBY4ymoHhZN/4jYU3lK84OxjBfIDfRktM+kcRp/aJ4
         18gr2ix/oFhfOdX5ojI/QljnbSg86ak1QoQcNahRyu/vhnRdY8cHNuIbFr1g1xRO+7mh
         WYObTJeMBZ2i8CdFQd/cv9lx1nDDOLubVphkmj4lh+uqVO5CzApwRwk8Kxa3xvJypM9g
         H+erw6LS2KsjOc00BIgK5QJsoBs9+C0KEZCpU5i1VU0mvRnfczz6hnV56resze3wNEK/
         yhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730294901; x=1730899701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bRYMDo31wli1+F5XqLgDNYu5RKLrQYurcKRy2ybtgM=;
        b=rg3Rsisv+s/RaTEicwWfPYwRqMz/f1b8bLM2Xk5jfA6yRADnMVnBEL+Gm0RoZYmmRw
         lPcrIrVXAEzExhepKY3prP78r3+M6zM0CuzgynvslNSB9Od4SyFbzAoQ3FpB9EB1frf8
         /vuf+gTDH17zHB70BK7CAzgL5zs+wc2yojcxuvy85VsvSMW3KXqY9vGfmYvVAkefzmFg
         914OuULmcbqiO1G/QExL7Bp2jU0T/O7WSO581Fq8ytltvnwwUmnDofIl+m/eacm5k5yg
         /P8yiFT2zOyB5Gb8bQ9j5SdHVhhqrVBG+JAHnGLYWeWTH6rgptLE6OX+jrHk+FyVQBmb
         3ktQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHX0J6kegR8I6anfJFwlc2CerHu3pRMqoi4HmOuBoAygUsJs4jjV/NAyimgwl1gNsVRwmFFVgX6sS4tJSUsy77@lists.infradead.org
X-Gm-Message-State: AOJu0YxiPsCngVhZfDKYk+XSbqZbTSSHwsJIyNCBIyWKs7h70sR1Omii
	6fbYqn/LFmkXi51iQRH0BM3BXmSzjmW5uBz+u6ttxCgsB8BjEe9t
X-Google-Smtp-Source: AGHT+IF/oVv8150+7ro6yu0YdcKzcFPQ8lbfxvxtxQ1j2qTb6UYENnsCgQU3QxkyOYC63S92RRMIAg==
X-Received: by 2002:adf:ec8f:0:b0:374:b35e:ea6c with SMTP id ffacd0b85a97d-381b70ed1c3mr2289041f8f.40.1730294901291;
        Wed, 30 Oct 2024 06:28:21 -0700 (PDT)
Received: from tp440p.steeds.sam ([69.63.64.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b9294dsm15353345f8f.105.2024.10.30.06.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 06:28:20 -0700 (PDT)
Date: Wed, 30 Oct 2024 15:28:13 +0200
From: Sicelo <absicsz@gmail.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>,
	Robin Murphy <robin.murphy@arm.com>, will@kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	mchehab@kernel.org, andersson@kernel.org,
	mathieu.poirier@linaro.org, Beleswar Padhi <b-padhi@ti.com>,
	Andreas Kemnade <andreas@kemnade.info>, iommu@lists.linux.dev,
	arm-soc <linux-arm-kernel@lists.infradead.org>,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/4] Fix omap-iommu bitrot
Message-ID: <ZyI0baBMPHVZ29-k@tp440p.steeds.sam>
References: <cover.1730136799.git.robin.murphy@arm.com>
 <ZyIClriScBy4s6LX@8bytes.org>
 <515D7932-3939-4C3E-BA3E-CC3152E64749@goldelico.com>
 <ZyIos2Gm1nf5rejI@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyIos2Gm1nf5rejI@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_062823_359053_08545E4C 
X-CRM114-Status: GOOD (  19.84  )
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

Hi

On Wed, Oct 30, 2024 at 01:38:11PM +0100, Joerg Roedel wrote:
> On Wed, Oct 30, 2024 at 12:20:31PM +0100, H. Nikolaus Schaller wrote:
> > Why that? There was a discussion and everyone agreed to remove omap2,
> > but not omap3 and later.
> 
> I raised this question to make sure the things we maintain are still
> relevant. Developer and maintainers time is limited and we should not
> spend it on stuff that nobody uses.
> 
> > There are some devices besides the PandaBoard. I am aware of these where
> > this is relevant: Epson BT200, Samsung Galaxy Tab 2, Pyra Handheld
> > (in production) and we are currently thinking about producing a tiny series
> > of the DM3730 based GTA04A5 with spare parts.
> > 
> > And of course we want to participate from the latest and greatest upstream changes.
> 
> Okay, if there are still real users for latest mainline kernels on this
> hardware, then the effort is justified.
> 
> Regards,
> 
> 	Joerg

There is also the Nokia N900 phone (OMAP3) still seeing mainline
activity, as well as the Motorola Droid 4 (OMAP4), to name a few. I will
also be testing on the N900 around the weekend.

Thanks to everyone for the amazing work.

Sincerely
Sicelo

