Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D41D185F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 13:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUg45kZKXdAkqMBdmgTwXnVyU+lC99m/pLl1VS0vvmM=; b=0x9lIYtc3EF0xEhj9IkJ4jDuoc
	rJOnQdPj83uX2GrQPFKYCd14DV3PmfMeqF0Ie9x6vqmMzSkO5wFkIyRTeWrK0H5hW9gsUKk7/Z/IQ
	dfUpbgLNPyA92yIqyKhsAaF5BbQTy2hJO8eRxpQV1duSV0SxLr6MfxGoNqwWdwvCtbV7D8xBNsapP
	Vbt3tjC1ZrLPnb+Mlq9r4mpKqOQR+utMivPPVcexpxsw41JfWCdegg6avIgys5tKFKoS8Q7ZVKpmn
	Aj+0LFmvpZ+mfkCAbxQvrz3VuleiOh24OLPzJHktP9YQhTiwnGUB3FuhyFh/UbH/nSW6+mAh6+3XH
	S+Nod8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdq3G-0000000H9up-0Q1L;
	Thu, 08 Jan 2026 13:27:46 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdq3E-0000000H9uA-1FiA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 13:27:45 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4ee147baf7bso955841cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 05:27:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767878863; cv=none;
        d=google.com; s=arc-20240605;
        b=hDr1e3iIQBFzZqZWIRVBI+lrmM8cFDAKXFkCXEFFYqu3B43d3aToizkHC+AoA10X+l
         5xAp8uVc0FfLPNDNfkk1cbPPLHN53+vpPW87f7R8G3C/d6U2mZqXCagJJ2xRqjLIf+0y
         XDHtvUWb0tqZh4xNkjOu8AcvVTef7qBu3dBQXcVZful8CqSMaU0YBR+xHt142Zi8Eizr
         z7dtCnBjTRTCLKEbgmSz7AYd7Bx6fXFjc2E8DVl3c50yBMqZa1gwC7DaPIb/FJFSSyDi
         ARv/q8URlkjmdWoNAiCUkOTx0NG7DrcK28sjkyo0v0TTCYu1LRA9j0gVPz/XqbmNZ53A
         JJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rUg45kZKXdAkqMBdmgTwXnVyU+lC99m/pLl1VS0vvmM=;
        fh=itJ8HgZePK5xHvqUmVHH07X3N3VrS+Cy31SE5DcZEEE=;
        b=MuC1Nwy95c/43JbcX6xrDu+NYSgvGd1EDmfEVPTmsqUF51Nci6FGoK7kUHTp/cL/Rc
         amOxFb1L+GMmjJo33GDu+BwbDe8yAJzsX4oIy3+PSuod7mJVG0xBKETVsv5zbgTuFva9
         vggkFxlrnSbU44l96eRGH4zxtZiEzqcD/6pRz02hk8vksJtqscXQdLZWx4eGUTD1LYKn
         0oAkn1ViyyT02Q/awfGSzZA5Hz6eyF4f+1RGrLoWmAP1zD0tIy50GYCCeO+yp48yuhYh
         s1x01AeWM81q7N8K70Kklv/BapqdT/PE3/ALgkSWvc1kOgvrSLgc4gLYP275SZcRbEML
         sviQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767878863; x=1768483663; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUg45kZKXdAkqMBdmgTwXnVyU+lC99m/pLl1VS0vvmM=;
        b=KZ9/Ryi2M/QyvIzE9i45bIvT7429i/gQ+sSuR7RebK1sdDo2+RIBQJjSS/hJCcdP+m
         ajVL68WQRrJG+AvYNd00i8fudSdays+0rJnbIP+Be6m1gaP9XKaHyIsgfVDy1JQa9Vwo
         VLiKRAk0jVU9/87MIlSjZa6Lc8MHPkXIl7VPaVWiTte3cItbgR9jR3oou34MXNGDfd2K
         y2cevF5AE/GIMRBJpL9abYF78N1JbGTKOCSjB5WUILn2DT9IHa65JuBlJvpuyYEumg6e
         Rt9vPLnn+lKCEROmdWM42dsguzYaGuzW26MPH9wfMlwBZHLGU191EDnwlVEhchkOF/55
         ffSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767878863; x=1768483663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rUg45kZKXdAkqMBdmgTwXnVyU+lC99m/pLl1VS0vvmM=;
        b=riRpd78apYgfxKoZ6HinmoJ1VbhNYTGtzEcfGGTU2WPzg/ywIuUz8OGjjCSMAYOAiJ
         FplbwCfuLOI3TEMq2yzcbTynLmPtEGDosW/cl8Yqk5tFztsbM1fV/zdW1bf610Zgjw1S
         UdjeORyxlZlGFiEWFpO1V9cIyDHdVvaIpKlLKx5Z6ckMQ6bDopmZFh/Xbr/yrQ5xg2iq
         iUhZwyz8AvrFvtATaB3CNkmnAzegXMGbaYKiZo7JJPDMiVm1M9CDwKqw9f1o6quEDj4e
         4EnbUneFd3ozrHl6fCqLEHqifHKS94YWhpGY9Lsalbj3PQVeOn7/76Z/K7Qqmfto41yq
         JysA==
X-Forwarded-Encrypted: i=1; AJvYcCXNDkpPKeDGKXdi4U0F1tfJ0YZYGIoJYDTO7QeQ87EcRTV+k3zIpUdGXQO9LdXSXCEQIeD2ag3OHnJAp7rwbqMC@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ3eya7csR2sqU5v+mHYr2Egx/D1XdGAhQU+Q/71Srdz+VdpAF
	yom60mPsJc+UgswXFn+6EPCQvviOH678BV/MbCcjb/bybzE56UOz8EbH5NjN5DNoEvxmA/D8Wds
	fVSB02tJpn8wlcAjZ3ad/QmXgt4kbOBAF++RNwFBi
X-Gm-Gg: AY/fxX4YqWEMNLn9u+SPDNNj4w9eOiZ3CYejhrSN4l5snsBGA8WOb5W29EBkhbKNbts
	dbJS0e7XxLEeps9cD+E8lnL36lkFcxO3+46jvsAi0nZmwOoe7F43eKRHdOi4S/wKwFNHhxKz06S
	JnvLIm8Kb+RivkxtaLePnsmS3NLF9AsZcfsQUEsKWg/mkox0CZr1EOp/UFepftTmyIXexKT0Wuv
	jlbdqyaP5avUbWiJ8ictWw6xnxv5gvzWijooSLIdv5xSHhMvnD0eHupzRSAarseYEwWRkspUUn6
	mXZ8gxpr7TfJIYmc8S+oIv1YpQbKTw==
X-Received: by 2002:a05:622a:120d:b0:4f0:2e33:81aa with SMTP id
 d75a77b69052e-4ffc094eecemr8503661cf.11.1767878862613; Thu, 08 Jan 2026
 05:27:42 -0800 (PST)
MIME-Version: 1.0
References: <20260108113846.56179-1-smostafa@google.com> <20260108125934.GB545276@ziepe.ca>
In-Reply-To: <20260108125934.GB545276@ziepe.ca>
From: Mostafa Saleh <smostafa@google.com>
Date: Thu, 8 Jan 2026 13:27:30 +0000
X-Gm-Features: AQt7F2o_Qbifizn2oH0tHC8NOTIpDkZD__WQsOdMvWghmYJtGdKDy7Vhh49RAqA
Message-ID: <CAFgf54ocNybHR_Mp1+i7cff-jkeMUV1QxBCt04jnKxwfwnyUfQ@mail.gmail.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Drop DMA API usage for CMOs
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org, 
	joro@8bytes.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_052744_371487_42BDFD8C 
X-CRM114-Status: GOOD (  17.15  )
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

On Thu, Jan 8, 2026 at 12:59=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Thu, Jan 08, 2026 at 11:38:46AM +0000, Mostafa Saleh wrote:
> > Jason pointed out that the DMA-API calls are not really needed [2].
> >
> > Looking more into this. Initially, the io-pgtable API let drivers
> > do the CMOs using tlb::flush_pgtable() where drivers were using the
> > DMA API (map/unmap_single) only to do CMOs as the low-level cache
> > functions won=E2=80=99t be available for modules.
>
> This isn't what I ment at all, the iommu-pages.h could do the flush
> inside itself using the already existing
> iommu_pages_flush_incoherent() instead of open coding the dma api
> calls everwhere, and maybe that could directly call the arch function
> on arm (as x86 does) which would be easier to implement in pkvm's
> hypervisor.
>

I see, so basically, we add the check for IOMMU_PAGES_USE_DMA_API in
iommu_pages_flush_incoherent() with the DMA-API stuff and call it from
the io-pgtable-arm instead.

> Then it is reasonable to have a pkvm version of the iommu-pages api
> for the page table and drive rto use.
>

That makes sense, I will look it over and send another version if
Robin is Ok with it.

Thanks,
Mostafa

> Jason

