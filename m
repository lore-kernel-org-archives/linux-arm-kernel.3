Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B36ACA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 01:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0JmiFdlp9ZkN1fxeZfgjKK4+EMYxMKsgyQh0URM5ec=; b=4iCD2dovHxgYOyCdBpcbRLxEA5
	s+MJtVTQYJbJJc6CJ+Ao46P4ajdcRNMr+QE+oDm347/sfrWq8SrhAp15HZZkeVVUyJOcvisCG3Q4m
	eTBBc7IzyNREstYok/vFx32eKg4u45XAlVcUk8fIBwXCCi3vNTrtTD0NTg0nUYmsI9om9F9sOIBbO
	99N1YZ39/0ASy1JnReOSwGbtxSHGV7ihNNJDbVshB1BgRTZ1Mg9AQAt7sypgY+mhP3im9RxTYgAhA
	5JvnoHRPa1tgF8ODKNEsZdRG6pUzdjzJhIZ7vQo39sAD24OHmuMjUkzb4hJjOK9QIYSKLR2EaPjMI
	wHrV56JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umipj-00000000z3B-0EnW;
	Fri, 15 Aug 2025 01:02:15 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umhPA-00000000nEB-2THt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 23:30:45 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-459fc675d11so15815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 16:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755214242; x=1755819042; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0JmiFdlp9ZkN1fxeZfgjKK4+EMYxMKsgyQh0URM5ec=;
        b=yOrM7NAk8C1QJUI/zOU4WmYGa2CwOpBv2MZamLzRkJUtr8zBBmUAMKFTAhFlhGoXyk
         K4X/lEVCeGy1UVvM/HoSX5s7pJwphCL74bLi0Fpn/ko1qAat7PlFwe8K3s0iXiRxjNH5
         P23QqrITUIYogKtiRm6e3HVZa/AzOuRj4D51IZdXjajTlRPKV8OOa3pH3XsNpq/Jq8wu
         eox46CvQi9LO0+dLWfrRmxHrmeP+VYVcznyndSW1typgFEapHmTIC4DV9QhS4lO7/XbH
         qAdgUTIL6AZOJf03fkL+RxDQAyo3RKypi/h7Ta4E7wl+ytplDX5SBOnltVRkCvsra0JE
         cU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755214242; x=1755819042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0JmiFdlp9ZkN1fxeZfgjKK4+EMYxMKsgyQh0URM5ec=;
        b=GISCs9XMn3fNi/11cdDxFqtgFfI5Opk+A4uIcV27dODZYOBd0hv7jcvt0pfM7lz3K5
         JeA/9upS0fEuLajl+hfCSGqct5L5BVTTRq1XHDLvjUulM8QW/KANpRf0y/S/L3gmE31X
         LJ9nyKCxUn2DwPaCm4GrKHmYKUgpHOReC4kuybcWey1VrvOHDzDlDccdkczA8h0Yt5nF
         ptUN16W3awXPgICVRJjqkHVKIaQ3zc/GpgXFKSntaxjZWHuzgexRPRaYr83KxOu4+AiS
         Btk6DST30J+/ERuHYuFVMrKBAzilJvPgQbx7klrejHfIrabBsIZ006DJoVdY2LHutnq+
         mrOw==
X-Forwarded-Encrypted: i=1; AJvYcCWiwt/NSWTb2W248wizXV2U8pedNrpn5f/iJpMlsVOsIs+xP7w6d68vdgFsfKDyN05WTYofMuxDIwsL1PEe7p8F@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy/I4lsP6eYRcfU/cXCzjQSl088qbN1TzCoXrwIM7paDWAa55S
	Up6PZwwQnYkmFijxTHz3Mvs7Bt+nnS62AGBnkBdMMcmu9PCOeDL2voVoy8SkHZTiuJNdBthjxUN
	Ciy4MuLRSMZ8Qs9naRIr94nll3sCe9Qfr/hjxG82e
X-Gm-Gg: ASbGncvsWj5RnM9qk7RSZzLd6r2b7jgCfpUPhyC7PHK96M+d8bfIZN03nqkfjGNI7bE
	QNC7oelsuVKxC+42d/UhJJK9qrRLTEi4Ug51wI2KA3VsLQSVFsW+BJgDJi900GpNmtFmU4Ko/qm
	AymTETi0qY6/e2cuN434bRgydq7RNNSVdkgSRI1e9KU1EkLzhktm1dz8tcjVI08Ns/ENDXpm447
	GtD/6zSjseOmGIyp88XFnGIsaRaUcQqSbMSZjewRJo=
X-Google-Smtp-Source: AGHT+IEEw+uzXS2i8WjnVSg7+M8YgE/PH0qtNvR3RZRshlFOrW4DkRzKM58Y1imbSzgGPptKIKq3mUjkWcuT38ZrZFk=
X-Received: by 2002:a05:600c:8909:b0:453:5ffb:e007 with SMTP id
 5b1f17b1804b1-45a20af818amr346105e9.4.1755214242237; Thu, 14 Aug 2025
 16:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
 <20250813060339.2977604-3-jens.wiklander@linaro.org> <aJ1-YpgvGt4_6CFU@sumit-X1>
In-Reply-To: <aJ1-YpgvGt4_6CFU@sumit-X1>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 14 Aug 2025 16:30:30 -0700
X-Gm-Features: Ac12FXzYk8vQFwHlmYOx6GVXgELj4N91iOPnVrtkJq0EeS5aTQuf7I4LnzwBN-c
Message-ID: <CABdmKX2FPg+hO55qWndMajuWP0kZH=OWEh9v-d8aO6HQWyxJtQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/9] dma-buf: dma-heap: export declared functions
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_163044_628289_F80AB622 
X-CRM114-Status: GOOD (  21.66  )
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

On Wed, Aug 13, 2025 at 11:13=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org>=
 wrote:
>
> On Wed, Aug 13, 2025 at 08:02:51AM +0200, Jens Wiklander wrote:
> > Export the dma-buf heap functions to allow them to be used by the OP-TE=
E
> > driver. The OP-TEE driver wants to register and manage specific secure
> > DMA heaps with it.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  drivers/dma-buf/dma-heap.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
>
> Can we get an ack from DMAbuf maintainers here? With that we should be
> able to queue this patch-set for linux-next targetting the 6.18 merge
> window.
>
> -Sumit

Reviewed-by: T.J. Mercier <tjmercier@google.com>

Sorry I haven't been able to participate much upstream lately.
>
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 3cbe87d4a464..cdddf0e24dce 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> >  {
> >       return heap->priv;
> >  }
> > +EXPORT_SYMBOL(dma_heap_get_drvdata);
> >
> >  /**
> >   * dma_heap_get_name - get heap name
> > @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *heap=
)
> >  {
> >       return heap->name;
> >  }
> > +EXPORT_SYMBOL(dma_heap_get_name);
> >
> >  /**
> >   * dma_heap_add - adds a heap to dmabuf heaps
> > @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >       kfree(heap);
> >       return err_ret;
> >  }
> > +EXPORT_SYMBOL(dma_heap_add);
> >
> >  static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
> >  {
> > --
> > 2.43.0
> >

