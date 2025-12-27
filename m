Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62E2E92710
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 20:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYfo4DcmoDPGkLlBpUwQdj2xZvXjZDeunEqpnCANZoQ=; b=Ob8x2e8NP3jTap
	2ziy2rWK2aT+58M2FPlOntvkDpmOPB22Hj8xrAxvFtRM2PfufYjqXEkA2Qw8Bo6xGmGFN1EmaTXDi
	6WEIUTkGO0G79eyeaimDbFU/cB7N5qvfyu4vOzHnqLrN2aZ8kzGUUKhGqY+eCTH4sabVl29Vmtm8A
	LC4IY7A2C7V1ed0I5PtEogWeKz12r3r8g3K6B/NYDB/e7rJKaJjiLEO8Stnn28wHucqmtePIk2bkg
	IB0SUDv6Swd6GQ6STJei5GoCqRO97Q6i9c424cQvL8NOqPe8wpC/DogizNbSCbmabGuWYvwHp65n4
	flXI4zWqfPEQunnAoIBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZbNu-00000002ChJ-21MQ;
	Sat, 27 Dec 2025 20:59:34 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZbNr-00000002Cgx-2ZKN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 20:59:32 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4ee328b8e38so93308061cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 12:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766869170; x=1767473970; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYfo4DcmoDPGkLlBpUwQdj2xZvXjZDeunEqpnCANZoQ=;
        b=Q59y+YWw6cS+EUE62YvO/Hs6wb85EHbdtBbOIPfJrvy/wya6O4DEFjClySF2JqBbNS
         3LfwT5eZLShi/dEVQ1hsRJE1AjK8D0/12hZxPrurwtwBZIp+SgQiFDYwtMvvo4rBvQgv
         P3hzmg2LFlct7XCEqmXGigYbg95hFZ2HgDvyIg95JEeFWCIMc+s/mS1r5XrPKcPdmlSf
         3qACSeQiOq93dirxVr+IWST+RadMHJQojnIMYJI3PMmMZnrhnVWetkEV7X1FJmJVU0Zo
         E5UwCXSS9IFyik3tSoMYZMcaggWDHSL/MmJ3l1w3Hf0h1bXq77j7RWGXQnmhBV7mkS7k
         luDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766869170; x=1767473970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LYfo4DcmoDPGkLlBpUwQdj2xZvXjZDeunEqpnCANZoQ=;
        b=RmnV2fY62RM0MU1p82dyDpJ7XjFX9qz20vltEPxZyRiX20zeFoCPRrRNOG5r1hyj+M
         gVxuJHmEiH/y/2ePwcCDsChI81a8g2A+HrFhsdBp0C1jldLk9W3Iv9pEH3Le7A+fNeW1
         oYWqhc9pvKPNfH6pR8wijbKg0Ek8DexS9N/ZBcpr/8JM9Cmwyxcjg1LTgoX199v6fsZd
         lEY25axhemwB6MH8uI+OO3hZTluB6Bu6TqI/cgLGBfF47aXWUYz4k8ExxSxwVk7pOIfX
         Nl00meDjl8CY9BAzQIWui5AF/N59xXBn7OU/sM3h8DyVWcamLcXHqqxxk/G1weiJu/rq
         AaUA==
X-Forwarded-Encrypted: i=1; AJvYcCWQG35lgmK/XPhp6JIiXpH/OBTCFoqeKb4xSfxO0EbxZI+/JDWKd/35tObMk67wZJRiOTT7hV155wZwB/fggsMy@lists.infradead.org
X-Gm-Message-State: AOJu0YzVlqMzyzuHsFnhtk53uZA6/ZyKRqDmuXvOrnXM3IKn6md4A0nr
	Rgm2tp/pQKyxsNGEzQyW7hgM881e9yf+PHlauMhWqpImt8oqIY1K0MAjLSx3oy4FqvHB3ZbaFga
	WTGcMrxTIIliFsQoJkc+JyY1CUHRq9IU=
X-Gm-Gg: AY/fxX4VJ0YqGQ6jfVES/iEMdUPVvBz5puVSvHL7EsI0zncCfiL6q1/k/O6xTffSTq0
	2/T4vaUK3P+6yKohHaU38fe6UJx5/+rVtskmyTqPkrzdDkViGC3vOhoC9u0EN74ugmkk7ijOcss
	Hqq0atZ0+qF+OQBeJctGvYZ+G6Z/RQWhrjGTxDTkUrLvb7lcVx+jD24X6zD516SHxpl9XfX2Wul
	w/ps/f3MmOMLcO+1+VgsN1geJIri+2AFlL1YXy5+NfLN/5ArGuVr/VcRZQXAMwXRQj/Fg==
X-Google-Smtp-Source: AGHT+IHlaEEZSdrmBhcD5E1NDs69ZAi4VCsoBGkUPdmFJ+vi7IWuMZm/ebLyp+IkRb6IMCkz4IBpkkjebsgKR6Oxf8Q=
X-Received: by 2002:ac8:7583:0:b0:4f4:c0b3:f50d with SMTP id
 d75a77b69052e-4f4c1cc43famr221104131cf.2.1766869170002; Sat, 27 Dec 2025
 12:59:30 -0800 (PST)
MIME-Version: 1.0
References: <20251226225254.46197-1-21cnbao@gmail.com> <20251226225254.46197-9-21cnbao@gmail.com>
 <20251227201642.GQ11869@unreal>
In-Reply-To: <20251227201642.GQ11869@unreal>
From: Barry Song <21cnbao@gmail.com>
Date: Sun, 28 Dec 2025 09:59:18 +1300
X-Gm-Features: AQt7F2rxXlxLqJeMe-griN6e55GdsgQR49MF8zyADfJXBQnZzf4d6g65OQ5pwik
Message-ID: <CAGsJ_4xssfB7hNOWLDianQfx+9wC2e4qZKtRBUzEZ-v97Sa63Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 8/8] dma-iommu: Support DMA sync batch mode for
 iommu_dma_sync_sg_for_{cpu, device}
To: Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_125931_676199_89519221 
X-CRM114-Status: GOOD (  22.71  )
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
Cc: Tangquan Zheng <zhengtangquan@oppo.com>, Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>, xen-devel@lists.xenproject.org, robin.murphy@arm.com, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Dec 28, 2025 at 9:16=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Sat, Dec 27, 2025 at 11:52:48AM +1300, Barry Song wrote:
> > From: Barry Song <baohua@kernel.org>
> >
> > Apply batched DMA synchronization to iommu_dma_sync_sg_for_cpu() and
> > iommu_dma_sync_sg_for_device(). For all buffers in an SG list, only
> > a single flush operation is needed.
> >
> > I do not have the hardware to test this, so the patch is marked as
> > RFC. I would greatly appreciate any testing feedback.
> >
> > Cc: Leon Romanovsky <leon@kernel.org>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Joerg Roedel <joro@8bytes.org>
> > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > Signed-off-by: Barry Song <baohua@kernel.org>
> > ---
> >  drivers/iommu/dma-iommu.c | 15 +++++++--------
> >  1 file changed, 7 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> > index ffa940bdbbaf..b68dbfcb7846 100644
> > --- a/drivers/iommu/dma-iommu.c
> > +++ b/drivers/iommu/dma-iommu.c
> > @@ -1131,10 +1131,9 @@ void iommu_dma_sync_sg_for_cpu(struct device *de=
v, struct scatterlist *sgl,
> >                       iommu_dma_sync_single_for_cpu(dev, sg_dma_address=
(sg),
> >                                                     sg->length, dir);
> >       } else if (!dev_is_dma_coherent(dev)) {
> > -             for_each_sg(sgl, sg, nelems, i) {
> > +             for_each_sg(sgl, sg, nelems, i)
> >                       arch_sync_dma_for_cpu(sg_phys(sg), sg->length, di=
r);
> > -                     arch_sync_dma_flush();
> > -             }
> > +             arch_sync_dma_flush();
>
> This and previous patches should be squashed into the one which
> introduced arch_sync_dma_flush().

Hi Leon,

The series is structured to first introduce no functional change by
replacing all arch_sync_dma_for_* calls with arch_sync_dma_for_* plus
arch_sync_dma_flush(). Subsequent patches then add batching for
different scenarios as separate changes.

Another issue is that I was unable to find a board that both runs
mainline and exercises the IOMMU paths affected by these changes.
As a result, patches 7 and 8 are marked as RFC, while the other
patches have been tested on a real board running mainline + changes.

Thanks
Barry

