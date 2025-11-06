Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E0FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 06:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/EMy/K4xOqVd/TJc3X5qTwSIeGII2QmhmiESeAGTuis=; b=TQaihkzRF9Eonl
	gD/zWeb9WX/nHuyuWfBvzTuOWfkvaa8DYHlkYRFOdHM7Pg8ZqDtU7Qc3P7e22UDg2rHpyAVWrAPVy
	1RKtiSKLPVeqX9OOKxoztraLS1xpY5dUVyOVXoxfk0j3CaNXVTuN+sGP6dNEsrpP++O8QydEu7pIU
	J3mtNM2TlKMRLKFeTHAjEDj4RQ/l3W/hRR/rPRhaGrul79wG1hzesnJHU4HlmI7UEEO7pkdF1Za1f
	xONsjxN+pFWzyfbFrIRd73f9qGktcchZvg2Wb/1FenE0WnE85vzg4oJsHoB16pCF4GapiT594x4QA
	sQuwPQzk5IVA9pQzn2IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGt4N-0000000EuhB-3AeH;
	Thu, 06 Nov 2025 06:02:03 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGt4L-0000000Eugp-2ryK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 06:02:03 +0000
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-591ec7af7a1so471039e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 22:02:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762408916; x=1763013716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/EMy/K4xOqVd/TJc3X5qTwSIeGII2QmhmiESeAGTuis=;
        b=wINSLRO7wxtnwyVRcrpBICbRWMFF1q2LcblEtMuiKyMOdSK9VaVaL0pordILN2kjdq
         cRPg8OhVkTnkqC8LMNdrF12Vr8m5D+B4TCCPPNDZbH5Fz9rHzG2fRneDJYXRHvS+05N3
         cD9ldonTreXzHi1oZ8DJAABGyz1XMMHTGnS47/gpyQ88fxosMB6AKByC0TDg0zkkeIft
         sYd7AKac1f8NKgEvaOrrBMLvOUP4yt9xszQtP+HroEvnaY2NGOPtKUwKbevZVUw8RZ40
         p7I3cgI9pgJT/hcur/WFF2TmmcdbUtkBY/kZ7BsoF3ZCdWrYLltgTaHE3qs/a4mAbt6O
         3kLA==
X-Forwarded-Encrypted: i=1; AJvYcCWsiTfrNOJr2d0byDWNQ+5N9YgPL+J0C1NMJfWFic62ruEl/GmQ4b1Nyd8O9oLzCgnxFB7dYbpG8iEW07+KTQEu@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs0wwC4CEoB2ryzGcyhWreShrLDTXBN4z4g/HBVXqNBzjTeT8E
	WTrLre1i4hGzirDb/gF3fgi+bcOD3koDoxqbkMe0oET/arxSavACpnlWESYcUqwp
X-Gm-Gg: ASbGncvw1SFVzv/3WwX3a22KF2DPjfuchJ81P/RPZgbFCyiA1OyKfiL4U0XvRHtJ/xp
	10XvQGErvHxcm27ju7LkgCEeci1d5Yp70bDJN9+RpNFhTfcz9vtBKpFGEsbiLUrqvzhPUiptLJx
	g2tTNFeZVizwawHCi5Z12rDKtz3KBafdN4DtIPwVq1Kui9JyWJ+wOkgshDDDgp9t/XCvxRSRLm/
	FYIyYmmZKZzu5OktQffiFc5bvLqunjq9tvVeedvjI4/KMGyEEu8nWpnJiq+IqSBpTrpIMhgVlwq
	9USHuq4ESyz0LceLjHtdOVZtDI3jdXi4jdmnMDhi/d+LU0FAPdXhSkCKo9hGANktBvReYnhBgj3
	OY+VHsreIAG0MlFl/HGQRYGle0sIYAxd0PHKgXs/XJUlwSWv39mCrJJqG64y3i9pcd3LhGQskQ9
	PYx9AdYRyUb9xM0PA03J5yoZuCwus30cjR
X-Google-Smtp-Source: AGHT+IFbkijtWkUW0zWADFgqRF05TR5Nt2B5sU884+nVItYoPtPgpHbOSW2FIuxu3Z5hjYDyEw/t9g==
X-Received: by 2002:a05:6512:2250:b0:57b:b4da:2712 with SMTP id 2adb3069b0e04-5943d55db6bmr2215258e87.4.1762408915541;
        Wed, 05 Nov 2025 22:01:55 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a01a029sm442484e87.35.2025.11.05.22.01.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 22:01:54 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-378d54f657fso5026861fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 22:01:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXOrmRp7KfH6dDx265HrZfmYBH4RThClHjzMNPa5DWxB341oLhflT0sLfpDWifwsY/lKMITVlD1GxhvyAVotVx9@lists.infradead.org
X-Received: by 2002:a05:651c:908:b0:37a:2d72:6119 with SMTP id
 38308e7fff4ca-37a51406a51mr16362171fa.21.1762408914469; Wed, 05 Nov 2025
 22:01:54 -0800 (PST)
MIME-Version: 1.0
References: <20250704154149.3464461-1-paulk@sys-base.io> <aKhFPRP8ILNkKAvy@shepard>
In-Reply-To: <aKhFPRP8ILNkKAvy@shepard>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 6 Nov 2025 14:01:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v66=Ppqw+_fpAsRYd_4OBOhbHkk7RetfEXbYmvQ_+hoe7g@mail.gmail.com>
X-Gm-Features: AWmQ_blhZqLqx77LWLcKS7_dqP43aeZsGzE4L69w_GDVHcl80KjzuIFGb-55rnE
Message-ID: <CAGb2v66=Ppqw+_fpAsRYd_4OBOhbHkk7RetfEXbYmvQ_+hoe7g@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: Cleanup v3s mixer config fields ordering and indentation
To: Paul Kocialkowski <paulk@sys-base.io>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_220201_748632_BC8A66EB 
X-CRM114-Status: GOOD (  14.30  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Aug 22, 2025 at 6:24=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Hi,
>
> On Fri 04 Jul 25, 17:41, Paul Kocialkowski wrote:
> > The v3s mixer config definition is a bit messy. Tidy it up.
> > No function change is intended.
>
> This patch didn't make it in the previous cycle.
> Would it be possible to pick it up this time?

I guess this is going to conflict with Jernej's refactoring / cleanup
series.

And, I think v3s is not the only one that has fields in a different order.
Might we clean this up after all the refactoring?


ChenYu

