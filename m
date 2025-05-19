Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A267BC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 21:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfCxvNrNXH6YMvxiBWl55URv30Vk5ImyK9KqXeiCoPg=; b=k/Ya4mvNFHjbQ9B0HXHt8Rzr2W
	GOFeLSd/prlnlEGCgliIeXXvMfU0QofaPJ9MqxzFCkfsLa/g2fiTwPVE50lhUYauf0g/i6T5gRxvG
	FMgEajThLNrUkGVJ3tdtnQzL0VROq2rVinWwGqKN5DYqU+3DgKSaa4H7vvQWPFnHXqZK3DTuUhj+e
	ZIWk1lZ39/Xxi142+CNvHpuQ5plK0b9PSN24t+TlpWV+r9R/T4khlMCjkfHzxANFYR+erVkFFJPla
	zGae37LYWDmMVGJ6qeJNfhHLijxCFxGO2JCFH+//Kw/+SIqFhbKSYUtpJGApqJYj6khFzjHo6LTY8
	RTevku7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH7s0-0000000AVOJ-04Pz;
	Mon, 19 May 2025 21:18:00 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH7pq-0000000AV6u-3Caz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 21:15:47 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ad5273c1fd7so809634866b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 14:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747689345; x=1748294145; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xfCxvNrNXH6YMvxiBWl55URv30Vk5ImyK9KqXeiCoPg=;
        b=QvRUrtG5hNc12dYIr6rLzwRn0xSzz2yIuAwuB9Gq9ugdozZcxDVucuMn5mXr1M7Boh
         zpJOFxRQ5jDMvokew20sN9g03n/BmUTp5BUIF0AWF5XIrRON5jZKXKQIanzi1YUmcuc7
         HsIeNQRoNuCG//KxWeZlNqSl45rR2p6Ft9eCqI8YTZktVPBgwFS/UGjMwEGY9pDShZdk
         HjdcQWOdP1vnIhZarwtF06V3kClnUIeX+eMTJd06WvTJIxsiJ0Ov9xkDRTwAd7fsUSh+
         C7AmVRs1EA7zMeSwapKT/oYGc2W62GNYxPj68ookcRZktT19qjV4q+/vt7UQSwR+UvOO
         0TQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747689345; x=1748294145;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfCxvNrNXH6YMvxiBWl55URv30Vk5ImyK9KqXeiCoPg=;
        b=d77e08OxRWy+tn9TCqAVMoO3PIXSn0pLrSEqikuc/XEjcBaXFXO2OtVisbC6fqUacg
         jei59TkjewayTz9VUA/Gbe3Aq1nZqY2aNOjNsZ1KuBS/jtfH6kLTE29Gqcmvj/8cSAKG
         7f3VAx3nsWbwTzWRfwJIaVUeqbZrruDfKQOq0OjL1pFEqOQwmbglIZyM+zP5aQnswWdn
         8EfiXvi4rOU+iLNm4J9jtjsOlUSjBalVFt+KCyaaZ8FDFqnZkaRkoDDucyuuxdX+0rTc
         LSdbh+X9OQRFVmN/YhKmggEpjDS/TYLUi442f+OoBXBK/rZd2rYeuEzS5+ioiBSy26sA
         JQgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9aRAHS7njM+MbmRDwgCHR/fRB2qJlXetwUYddZnKAK3I8UZeZ5wtae2IXE8KTYp3PqKIHqXwoXAg0oc+t7k1J@lists.infradead.org
X-Gm-Message-State: AOJu0YwIo+wX30Wk3kE+21dEia4ryUetL89crXFXJTLwpyraCKPEgdEc
	poFvZvrZsZvjYDYt5AYG7pMhTpwwdvi5oGHssg2S5FxhXU8mZYkvNqcGWlyER20rkmtghp9XU4A
	E9Zv3XkpkFK8lVYhZwn0657JwHeOxiGI=
X-Gm-Gg: ASbGnct6dtkE544v4PPBK0i1r+VMVI4KeroLpu2EwHc6HOX28joSS4M9U6GpTeHK10y
	abrhePTHU0Zxfzg+CYT2jPa7+Z5bqGdk+kuX6oNQut4MITGLl4PW/hSxLQ1SGsBPLTn8+Kq3w5X
	BDgr3z5dBRtVH4ucdmiDw8fqjr//j1QCA=
X-Google-Smtp-Source: AGHT+IEdHJ5TsiYJUOSilPNO+z3JABvgvB65Ct1aB4PjJ2fABaDgZlQuvx2XmPkklIghfrLSC+0u0HMeQGgesMbdSWY=
X-Received: by 2002:a17:907:94d0:b0:ad2:2949:bdfc with SMTP id
 a640c23a62f3a-ad536b7ca51mr1349013266b.3.1747689344467; Mon, 19 May 2025
 14:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com>
In-Reply-To: <20250519175348.11924-1-robdclark@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 20 May 2025 07:15:32 +1000
X-Gm-Features: AX0GCFs4JnXwsJdajW1l7s7toaeaNTWjF5f0e497pSZ8wodPL0eA75PFrE0O5i4
Message-ID: <CAPM=9tw183FMOT8uUacqegnb5CREAyr8KbXxO2mCuFK-SmUB1A@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v5 00/40] drm/msm: sparse / "VM_BIND" support
To: Rob Clark <robdclark@gmail.com>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_141546_803846_5CCFF5E1 
X-CRM114-Status: GOOD (  13.75  )
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

On Tue, 20 May 2025 at 03:54, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Conversion to DRM GPU VA Manager[1], and adding support for Vulkan Sparse
> Memory[2] in the form of:
>
> 1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP_MAP/
>    MAP_NULL/UNMAP commands
>
> 2. A new VM_BIND ioctl to allow submitting batches of one or more
>    MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue
>
> I did not implement support for synchronous VM_BIND commands.  Since
> userspace could just immediately wait for the `SUBMIT` to complete, I don't
> think we need this extra complexity in the kernel.  Synchronous/immediate
> VM_BIND operations could be implemented with a 2nd VM_BIND submitqueue.

This seems suboptimal for Vulkan userspaces. non-sparse binds are all
synchronous, you are adding an extra ioctl to wait, or do you manage
these via a different mechanism?

Dave.

