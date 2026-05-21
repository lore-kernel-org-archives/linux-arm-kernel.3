Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333A4CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 17:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhUoyYsFnF9za8i7wBF/DE6TJUENWY+2L07rfya+Q9g=; b=cYMSjr5DzzVkBf5KUSkUPdJNlK
	naUR4LCGo1l9gyzKj9km3bCRZjdnZndP9nu38RgvlUO/05qAVQCYrzvvLq7xaQwVYhRr1Nni7tWDP
	uSZzX/Wv78MTR+4nDdnhI3SR88ZLgUXl6jpnz52nfAWnKa/v8Xg+DTvmNXnK8AX4J9OHjPqjlYX2C
	NoB64mMnbjZJ5pK++NBowGzOlwzS1sw3TuaHs84ni8zMML1VdUWZ1rPSwKNakGaHEIhrjA79UJHi6
	BCMfWZ2coxT9UixB7AruMjamy68Q8NR7d6Jt2xFmaPwKwK3A+Uw8p138xslb95Wl+wSRD+vNNRHjS
	cu7abBVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6qq-00000008aEG-3Pjf;
	Thu, 21 May 2026 17:06:28 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6qo-00000008aDY-1mNW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 17:06:27 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-516d1ddcdf4so2331cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 10:06:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779383185; cv=none;
        d=google.com; s=arc-20240605;
        b=VY4T3dqfzlThIfqja7DCpJzM2ELhqqOuZEiU2Y4bGuNNzD3cSduLKnd2V24JyFYXK/
         JE0ApIG98+bCCrjpNWeluYwqxyvFpFeGc9ihqenpksLF5g0gAsnP2rXukvfYyYedfJt3
         +gQhbPk4X+Z/h4U2f3Azb90VrPQMTM+eWvItUciTb3uqhY9SJGdYqXMI25wbSqYsxjic
         ig1CBZgvZkuCsDu+bOzXxR8g+6ZHPAbZelBdg6+JGMJOv1Hj35xe0vd95bUAsiGelgjm
         0fReESZQflyv2E2i+6UckSrS3v0nLTEdJ+DRyzCsXLBF9MG6KuDNfC95gfGPUmcvuNTc
         l1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mhUoyYsFnF9za8i7wBF/DE6TJUENWY+2L07rfya+Q9g=;
        fh=hiXcAJpJVzMtkjrvnCkD/VEHep0KVNrJgI3KJ9qEitw=;
        b=hGL5sLPPYPrSr+ZxlsDdUWZ6vQFD5YYofNeu28PZ9A2wgbN5V5MSm8JWhGIrAPngxK
         ItSwGBzkLyRmZj14WaW8Dv1kIeIHvzw58FoZBnyIHHv7sP0gwDKCjsGDjAl+HW1n4/g7
         thA0VW1QYUwiUenb1FNssNsx4otYDXBiOCS1UgCyPWfQc3eMz7P0elrrPRxY+pBkEfi/
         tMj/x0lxlO3FtyyhtAGvb8MmbGLf7Nc9uSFGsd2LsaJe4hyuVHCt+996CULYNG/4uJh/
         g8DhuSjVRNwKFFGld1xVQNKEFWhGdRQl8i7OPPzQYWclBPur5Cj3Pamxj7zP2aKeTcQy
         qttA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779383185; x=1779987985; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhUoyYsFnF9za8i7wBF/DE6TJUENWY+2L07rfya+Q9g=;
        b=Cxipk367byMFcuSUA0Ivvz8UmBOY0mCmqw+7MdMYopDeUnO/6cOOitlJfNSOP/NyQZ
         SZybVaU6Td9JVb4GtnEEz3lBClxfWkuT0DGnEox4YoaGuoXAeHrOAw/hLBLlVxxQYA8q
         FMWrMd8HXTDE9JIDScwCp1p9W2lu4Z5bLsaqnvESRgSapF7yPTdKTB0hODfpPt0d3qCB
         gurEpaP/cnQA/AaSYxAfMYcXvDDUPKeASRSQC5urIiZw/pP41MeoIuCgJ6oi9hxu6Zq6
         xO1SvZ36LQ2epondwYwsQbdVYkT+a2+4PXaMGbya/JtJMn/jwUVbqYoFpZQQOKCNoLOG
         ISmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779383185; x=1779987985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mhUoyYsFnF9za8i7wBF/DE6TJUENWY+2L07rfya+Q9g=;
        b=FDW4wADrgIV7y4IxwSoRBkIj2Wit6vnwn+vLCTRF1/6icJUSonYnLjpWQC5mK2XQbU
         nofJYSPP3hx9YRDfnSRJNHUCM9zIuxA5Zav9ubCtBpxQlq9KbxXC3mJsN2Qvml9ORkvP
         Z4u4K3tDZbNK2P1C9fMKzDQpesF1fUq1zPxVYqy6hRxmWD8F3qymZ+sqAWChtp0IsiQu
         0udh3fVdOkxQfmfNVfrYg5viN0nWwCzf7y8OtGY72bY3WXgaYWk5UlCUqBSoRWnB1Zw5
         /7ARSSg5EmIu8pUdR2Qy8l5nQgNOvt0U0mVgpNOhbFynCi0JXeHGe+rzA6nwQ7B0d4qG
         n/lg==
X-Forwarded-Encrypted: i=1; AFNElJ/VExD+uZW+3mJTXTkbvXAixBLMItVOOxGb4JUKD0Rv8F2n6gxPn99tWhk3U4ChECo/Jp611hb+AasyH01u/BGg@lists.infradead.org
X-Gm-Message-State: AOJu0YwP9XsZrIxx/5aoXLXO+eDhrlCA3mokAtsGkgETz8P/Qnt+rfvE
	3HPIw5D1v7c999RfHZcOSWszCc/kpwMCPDbwLfwhaWXNeGJstrUCgdMlPlnNRw/TbYwrK7ye1Sc
	xhgpIHybTgaCBU03xLIEP7pI/+JPT3HrT2r0Kzjje
X-Gm-Gg: Acq92OEgZzCtI0xq1f1Xt3q/m4e2dBOcNojjefAMonTr1GOSQvZyU+2y454Y63k0Uw9
	0mR/pNgrvUKgY9Wq7OJEl/MmbMd+mVS/DW2spAy3Ygfq8QQRwq1fAJWTg+ZJbi2DZQGX5gFLnXU
	r30EEPTRSrhGgBWfYKfUdVACPV2/veqnQtwTVXj+3DfNeFEO1Fssn7VaPfVCPkCYU4MBDiqsD68
	/PPpX0NYnbLUv9M1h89Vj4g3tFURPgmc2yi75or8RsNdrKuBJK4L3lXkxgqGdk78f0mjnh8T7Pz
	6IRMBEoDU/9CFczmT3L2IZ+/H9/iqZFd2W+6PkQDpHFZQ5xx9le1
X-Received: by 2002:a05:622a:130d:b0:516:3def:1cf4 with SMTP id
 d75a77b69052e-516c52f91damr11257861cf.1.1779383184387; Thu, 21 May 2026
 10:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260512090408.794195-1-aneesh.kumar@kernel.org> <20260512090408.794195-5-aneesh.kumar@kernel.org>
In-Reply-To: <20260512090408.794195-5-aneesh.kumar@kernel.org>
From: Mostafa Saleh <smostafa@google.com>
Date: Thu, 21 May 2026 18:06:09 +0100
X-Gm-Features: AVHnY4ISudxxSxVvcLPDn4R1NI9d_Ojyz-0XSa_zA0I3j6uTkfH8ncuvoLHXOtc
Message-ID: <CAFgf54o4ZnvnJ3369bHb10tvJJVP+5YWq=ec4Jh5K6S6U9uNEA@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>, Petr Tesarik <ptesarik@suse.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, 
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_100626_474061_04828786 
X-CRM114-Status: GOOD (  12.95  )
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

On Tue, May 12, 2026 at 10:05=E2=80=AFAM Aneesh Kumar K.V (Arm)
<aneesh.kumar@kernel.org> wrote:
> @@ -1411,6 +1436,16 @@ phys_addr_t swiotlb_tbl_map_single(struct device *=
dev, phys_addr_t orig_addr,
>         if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
>                 pr_warn_once("Memory encryption is active and system is u=
sing DMA bounce buffers\n");
>
> +       /*
> +        * if we are trying to swiotlb map a decrypted paddr or the paddr=
 is encrypted
> +        * but the device is forcing decryption, use decrypted io_tlb_mem
> +        */
> +       if ((attrs & DMA_ATTR_CC_SHARED) || force_dma_unencrypted(dev))

I don't think swiotlb needs to know about force_dma_unencrypted(), the
dma/direct caller should have all the information to pass the
appropriate flags.

Thanks.
Mostafa

> +               require_decrypted =3D true;
> +
> +       if (require_decrypted !=3D mem->unencrypted)
> +               return (phys_addr_t)DMA_MAPPING_ERROR;
> +

