Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B960C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 21:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4mHlbF3wl/qb51JPbWQ5yBWuZWdTliQjQN9iEmdGIg=; b=tNEXSC6GWCGnMiYthPBrNT+aOL
	3HN4OdrBbseY626BtYaK1RjWW8TgytGCMfvHq7Srr30+zVCWLsA8EfcT4zAJBXX6gPTDZg0JWmB+X
	PXijuZP8N8yOw867/D1myL9ynoaC1mb8aJp1py7E6AQ6Gpe2YVVDhQdaAzW5pZ2Mta88kDxnztjlF
	YTfrj8lvaloxLKUis6RQOopMVr38DVwyox1lhNeidckzLWCnxWuL1G80jWl+6qJnjIp5D18CW+oYT
	051VDw0UH0fFBYKI3qGh6M0KvAm++LkZnOCcWoBCgpmuc6p4BmPnAc1gAGgRRbebmIrPO747C5TYG
	aBeVN9HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Gw-0000000AcZf-0WBJ;
	Mon, 19 May 2025 21:43:46 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH7yy-0000000AWyS-1vAx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 21:25:13 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-86135ad7b4cso274620639f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 14:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747689911; x=1748294711; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4mHlbF3wl/qb51JPbWQ5yBWuZWdTliQjQN9iEmdGIg=;
        b=FM45WEp3V4yJS7+pHslffWtQjye4v0eE7FpaOtHuptI9M5WyyUUS9+n36duuvQu5PN
         BVAq1SzHtTWpU4bzGHHjK+ISq+buLar7Yqy4bWtF6pwoEgULN5jO3gwNvKdMR9SFkf79
         P397STUF8MMeOQAqAw6i/tpAfvoQoP9rL7K4rV++m5mpXJPq/ZH0QB1z4lydPyVW/dQ9
         wVi0aXT6CJhrIC1DIiAMHyhdTl0D1Rvlv1Uw/0iwKho7+HTMuXYQCghb711iPxqXZLgB
         pFU0QfydrCZiCJMuUbdKZsx9gP7pzjIV1rHQ38vjBnAi7HEp1ZNU5z0lNl9urw9n65TS
         YHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747689911; x=1748294711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4mHlbF3wl/qb51JPbWQ5yBWuZWdTliQjQN9iEmdGIg=;
        b=nFXmE9hw4WxmHsWZhLXalSiAgzoLncvkA06LFTknKyFpRO5q9ZbwpUfiRqLE9sOSg3
         2EeIjd0K96vKFJX76e7HyNzSXXcRIrg0wHp0VCBD4kudNm6Xeg+urcPLoIMHT4Z5mpBb
         /N2vGVSValpVZOb/tBRTwU0pU9AwsZlSwuhdJz/PG+Ss8sD97Vra7/+bAdFzplIR4yit
         7F7CovHjffMvhUD/Pr5kwP4O7qK4WxqTudh+c9YhTkjypV7JrsZHI7U2qq6cG86GgVCK
         7UpTojQLlxl6Rl6kR1Aw0eiPLVtxwA3RZa05pok5rutLvAs21stQbjLR2sb5ekxxT/XT
         GN4g==
X-Forwarded-Encrypted: i=1; AJvYcCX503Zzyb74hbCKwANSqpWT6Zfkyga5061pveJqniVbAQHbpb7fmMWEzr4aM2wQd/akI/H9KAe36oBLpjg0A9xg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3bVFoLiZ2gBCXBEWluvLOy/W7yKtAt+b+fxKzrn9IWBYNP9XU
	ux63CAe3PyUJuQRYA6yLcmNmjTXgdcCepxaexwWvnWDspNx4C1POeKa+7UPZYVBpMtUQ0TrQ4AE
	fBfk7LmA4j+iD2JIT9ZmenbGd5t9hOCY=
X-Gm-Gg: ASbGncsXSjpOSmSu/5J69ai0nOMDEEbxt2L54WzNvBJkzBxexuhtMZr3gC+izobG9yN
	gvEe9eoHoNqmX/fW9bbnmL6n1SFkb+RKKwaLCrcwJU+pX5eFR40daMf8ehqZ2Gf1kryXdYModoX
	OWjFm4B+pqXkgmo1MaF/AP1Si/MqG/HoJ5CsSNyDKgnEB4mcXiNJqVfJnROJE6k71sqfZfufYlX
	rYffA==
X-Google-Smtp-Source: AGHT+IEpXnbxrm+y9gNaRiUJIS+Wr3A9qyJLNZQ6jRp+M8ohLE3gUy60b6QHqU0uVa09nwBcd4Z4m6UiuBOEBYIoxLA=
X-Received: by 2002:a05:6602:4802:b0:864:48eb:30fd with SMTP id
 ca18e2360f4ac-86a23227308mr1602924239f.11.1747689911296; Mon, 19 May 2025
 14:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com> <CAPM=9tw183FMOT8uUacqegnb5CREAyr8KbXxO2mCuFK-SmUB1A@mail.gmail.com>
In-Reply-To: <CAPM=9tw183FMOT8uUacqegnb5CREAyr8KbXxO2mCuFK-SmUB1A@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 19 May 2025 14:24:58 -0700
X-Gm-Features: AX0GCFspyxeD68pvp-yDVVZyGDsNu-QeNUAbWG4ptcBy1923782_er28qi-T_4E
Message-ID: <CAF6AEGuDTGVq7sw4oVuHb+cOE_DuKbEPO956oddVcsV2boieoQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v5 00/40] drm/msm: sparse / "VM_BIND" support
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, 
	Christopher Snowhill <chris@kode54.net>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, 
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Jonathan Marek <jonathan@marek.ca>, Jun Nie <jun.nie@linaro.org>, 
	Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb" <linaro-mm-sig@lists.linaro.org>, 
	"m oderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb" <linux-media@vger.kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Nicolin Chen <nicolinc@nvidia.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Sean Paul <sean@poorly.run>, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_142512_501183_B8E9A2F9 
X-CRM114-Status: GOOD (  19.83  )
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

On Mon, May 19, 2025 at 2:15=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:
>
> On Tue, 20 May 2025 at 03:54, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Conversion to DRM GPU VA Manager[1], and adding support for Vulkan Spar=
se
> > Memory[2] in the form of:
> >
> > 1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP_MAP=
/
> >    MAP_NULL/UNMAP commands
> >
> > 2. A new VM_BIND ioctl to allow submitting batches of one or more
> >    MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue
> >
> > I did not implement support for synchronous VM_BIND commands.  Since
> > userspace could just immediately wait for the `SUBMIT` to complete, I d=
on't
> > think we need this extra complexity in the kernel.  Synchronous/immedia=
te
> > VM_BIND operations could be implemented with a 2nd VM_BIND submitqueue.
>
> This seems suboptimal for Vulkan userspaces. non-sparse binds are all
> synchronous, you are adding an extra ioctl to wait, or do you manage
> these via a different mechanism?

Normally it's just an extra in-fence for the SUBMIT ioctl to ensure
the binds happen before cmd execution

When it comes to UAPI, it's easier to add something later, than to
take something away, so I don't see a problem adding synchronous binds
later if that proves to be needed.  But I don't think it is.

BR,
-R

