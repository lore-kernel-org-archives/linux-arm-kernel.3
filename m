Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF191CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6YwhOXZKSbw/QgDI8R5plvx25chz++lg8tg98IFV5D8=; b=YkbvkLM/RCnIQO
	wCu+d4A/XuNx+kFc4GGAVUbN+W53nGUHELeYNABToH+xp6ZB7IIDhMmWwgIzhf4bs5k2ejgIB1umb
	IjbM8qKxY9senwqZp9NXTcZJ/N+EaesskIa8ZUnlN6nnFFJHmqxipWH6rGTxG9ZM4ZOp2VexIosun
	5VaeGL1cko6oryRjr3pwi+AorC3gGmeb5++iYouDckxOxw57uVwYrCHkt/Dt7Zcj5XvgC1js5ePlh
	N5TsfWEXEZksmyWZVe3+nsuircRomkOe7fJowOYogTIB1KqR/DGOayoRT9xbMZa7YN3YOYkuCXBqO
	Qceb24epIme0oQAa8sKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPdy-0000000EH2Z-2bBo;
	Mon, 27 Oct 2025 16:00:26 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPdw-0000000EH2B-2Yex
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 16:00:26 +0000
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-592f7e50da2so5378764e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 09:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761580820; x=1762185620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6YwhOXZKSbw/QgDI8R5plvx25chz++lg8tg98IFV5D8=;
        b=lbV3ft9N7VhnFNQbkPnWVCQNrSwvaVA+t+p1T6ZOfZ9OJiXdNtPVFGTwczSnS7ooBp
         hjbsntUfHq0JRQ0Ir8whzMR7B2U2xtm+8ccb88eQitqYAH0Cc3pcMA7wIdFGMM13ds4z
         zL1dwOqvpAPaysraQldgZ3T5r2taX+ElFCILo7Cea+pdjwPGFuT24DE5BVb7GlUwa9Py
         0DHpEUYequ0iWMn2TxSWC2m/7AApKHT0hUoYV/kzjghNWkvGoRQJ9nLOC3qTd/mXIR21
         Gyy7CEyHx1PuBRPvdoL45xt1gk2YkqD+YCC5vGWaT4n24BJneWby6mJdwJ2TGd67HLBX
         gz2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVt8O8SYfDPTvuVgMTfR3gesesmSdkC9S20gdc5UXVXpi4KGy/B1GiLbn07AEO5PQOXXIXnZtUqCRHTIbwpnuxS@lists.infradead.org
X-Gm-Message-State: AOJu0YzrtXQ0URE/Bd/aIfFVv+4I72WVkSBEpoyY9lZbnTl86i9b7kME
	y6+QsngPDsYlCO/PzIfyDV85qtb+HmkPII1Oxs8513WWlJHmpkAT7E4aFwP/EorRx/g=
X-Gm-Gg: ASbGncuSfpJRNepGsaoFqOe9ufGuRYhPV4PVMFicMiYXmNrfT4Hf+nm+8EEClDxuUYD
	E4wokMJA2kqKKq1faLKr1iZ3MY6fyQAW4ZJkT+pjB/z3+UWOuN4Yp1MRcdZcAFYX6t19ZpB3p10
	pfGZ3SSAw2Y8N8FWv21ijLuHf0SfE1g+i4tNVcdDhV/EPpeNz/EsKGFZF+MTYLJhdNcSq/xltJA
	iRNl1GRo+I7z4zdT9UM1D+Qb+gtqIcQSwb1b5JQf5IO3MWetSRnG6GanVeWcb67yK0q3nilNOKm
	LSrH+eUpxB5JfgTQkHQOIJM1eXYz6hWtbfYg7e+ClbbCnrXzWZZF+Z6BA6+MYbRfQdppOcOTSIc
	6R+06miW0Sf/ca5lXdQ2v+PaDdS4Y+mOA2GmlWcc0jKxPOYcy2BcOyZpwdddvu1hvvcr+Qoedy4
	zpgqcrynwtX2wQxnY6jyAImg/StZJhQcqk
X-Google-Smtp-Source: AGHT+IGmpuHUp83Bh4Hb+h9OlKlDSN7zwKNcOeTLk0lm1OivHyTG5fyQMoLXCsUfl1bwqR8/xaNFGg==
X-Received: by 2002:a05:6512:15a0:b0:579:bb21:a47b with SMTP id 2adb3069b0e04-5930e8bd093mr179002e87.28.1761580820080;
        Mon, 27 Oct 2025 09:00:20 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41cbbsm2447677e87.2.2025.10.27.09.00.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 09:00:19 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37775ed97daso58738011fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 09:00:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXjjAv/Mr9jpL9RqQIZv89JpsPkcfYjUe/9KGATvohnt3eYDkUJRvy5mtPEOo45nHOxnEbISR0yVLUbwRR65eQr@lists.infradead.org
X-Received: by 2002:a2e:a7ca:0:b0:377:d151:c090 with SMTP id
 38308e7fff4ca-378e3e0adfdmr38098431fa.1.1761580819015; Mon, 27 Oct 2025
 09:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-8-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-8-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 28 Oct 2025 00:00:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v65KEKPtg=WZw9su_DBc5JKsjjYV3DmpUD+LXGhX96sEfA@mail.gmail.com>
X-Gm-Features: AWmQ_bkrUs29MfoNSjd071G9lNzBwjNkUIcpLZfwjGgRDO3VQYGwungCMVXDTOo
Message-ID: <CAGb2v65KEKPtg=WZw9su_DBc5JKsjjYV3DmpUD+LXGhX96sEfA@mail.gmail.com>
Subject: Re: [PATCH 07/30] drm/sun4i: Move blender config from layers to mixer
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_090024_658852_8BDFCA99 
X-CRM114-Status: GOOD (  12.00  )
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

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> With upcoming DE33 support, layer management must be decoupled from
> other operations like blender configuration. There are two reasons:
> - DE33 will have separate driver for planes and thus it will be harder
>   to manage different register spaces

So if I understand correctly:

- the "layer" is from DMA up to CSC, which is the last stage before routing
- in DE30 and before, routing was limited to within one mixer
- in DE33 and onward, routing is global

> - Architecturaly it's better to split access by modules. Blender is now
>   exclusively managed by mixer.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

