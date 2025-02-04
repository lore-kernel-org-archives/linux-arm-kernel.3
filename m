Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02ABC02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 16:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBCA0PjVurUxDHTE8tDaUdxdvdUZXPx5WXbFW3jRA9c=; b=vGo5Neneqpxa6r3w0mC275L+8+
	rZ99w6VO6U4YnZiLlabgEf/V4phyvbmGGNahlsBAd5ossYIti3rPtm0dYplpOA2PW85gkH/+3SDtJ
	asO5Wwx9cZPU0FfPkT6K6VEM28BmDlY/sZ7vLVYj03o23CH+DFEE507jAA2A3SJ7zjCcimxO0qUmm
	aSJLXq6W98ySvOJvenomAa/vClzSs/Bjo21LskmbOzH0QP2EjKlpu2CtRYRV6oquDzINW2VPHrxSq
	vw9twvrpU+XSAwZQLCG/kbuYX7opT0FM7tws/spCIZAmevqgHY3PS/92Te/G/FJEFtJR+tdTNmHRS
	NX/072+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfM4q-000000010El-41tq;
	Tue, 04 Feb 2025 16:47:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfM3U-0000000101o-1Jx8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 16:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738687542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MBCA0PjVurUxDHTE8tDaUdxdvdUZXPx5WXbFW3jRA9c=;
	b=XEmDbxCxpzV1BcL1O5+kpilomcS1XkhO9PKj4dqPM7NJyyjDyFD/MpI6B2dKSEQCrJ4fvx
	WwzclmZox4PIEwlZb5XGkAKxLodJM36/5cpEzPV2lzEhsL91cGfp+8EkX7kA0G4IBTEEMR
	S6twuj647irwy0q+LRsyBAKlp2/Gs8s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-p6mjR0FYNoqDn8iiQxUmpw-1; Tue, 04 Feb 2025 11:45:41 -0500
X-MC-Unique: p6mjR0FYNoqDn8iiQxUmpw-1
X-Mimecast-MFC-AGG-ID: p6mjR0FYNoqDn8iiQxUmpw
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3862c67763dso2181831f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 08:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738687540; x=1739292340;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MBCA0PjVurUxDHTE8tDaUdxdvdUZXPx5WXbFW3jRA9c=;
        b=tCFgm2NvnJTEgbVqDwCpC4kZHL00MOQl/ZVxddFuPnbYIXseGMFidBxLyDDfX1FlsT
         AWQ0xT2k2G6nPU7AHhrWRPjN6f2KtCTvBKifPLOcbhnFi5/9YyU9YiBRPYD7jw+gl5Bt
         xbsqFuBpDtipfyqbh5HXqJHGOIET5P9w9KAeGu4okSxjhAUcKgBYF5vm3SJGTqRb0K0d
         9fQ61i01bzpY8EhOMSnqMhc4occbQ6D+fdZoY6ftTcq3h2UZBu2Li0m6nLDi6nwQXGFc
         LK42I3NbULOPiSu1/2o06el09tStgVe8om0TsUBNmiTRBAe0+eUqvhMDbvFBA2nqJGMF
         sIGw==
X-Forwarded-Encrypted: i=1; AJvYcCVlHRXylydsKPpqtMuLpbLguO+2V9YiEmptWkRywIps4pWoZ3EM2b/dMcofLdzCLkkTJ1/1GzyDCqeydxdHosLs@lists.infradead.org
X-Gm-Message-State: AOJu0YyUHJZEUqvZh1MN/a/FAydKbNoeJ06veq9TwERJjTZqZ9J79SMg
	tc+o/c+ZXEIIVjcIV0frYZMrefrhkuWPrUYVQl0q/PS7tSHuDFk88PKebPrYBnxLZHUyLL4CJGD
	FIdsIhaWAl3PqFH9jFXbvuJRM6QHEQZnJp8QWeDX8yV1fC4wpwI69p2GjI9CuY5UZdk+b0jMP
X-Gm-Gg: ASbGncsVMKI84TwaMA0g3LqeSH9Q4qGHiyMe/RkMEsrsqmmitDcXdZjNu3DxbWdKND5
	wHQ/5cUa8r9JnSfrztG+8RXbh+Si6yLBlN/W9m1a3bytLSAg9xe6BCx0L8UhLOue+TR2Ld+YXdL
	IZKeEnVOQ+Vp9IDiz8ydMsXXAkfQZGTQDuDrhJwlSjSR8Et8M149MtzGpBSgJ12bqmBjvhmi7f7
	vidsoUwII3i18ovoRWyxpXT0AKAgqQxgdGkQ2GO6rjvLNfB2mn0ffDXMMtB/Som0XFEBqrF5ylb
	qu/Yf9/TvWAtMrCm0flNSvTLPQloGBQhoTFwHPmsF8ZREe/YQSe6TA==
X-Received: by 2002:a5d:5f44:0:b0:385:e411:c894 with SMTP id ffacd0b85a97d-38c520938eemr25194909f8f.43.1738687539947;
        Tue, 04 Feb 2025 08:45:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4pBkOX7fbB5E+46TakvY1pNF/mGFNJ7jtM/9pTutWHDSdXh7u0KEbKJApI78TVZPUVk1B6Q==
X-Received: by 2002:a5d:5f44:0:b0:385:e411:c894 with SMTP id ffacd0b85a97d-38c520938eemr25194886f8f.43.1738687539533;
        Tue, 04 Feb 2025 08:45:39 -0800 (PST)
Received: from rh (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390692a4bdsm18504135e9.0.2025.02.04.08.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 08:45:39 -0800 (PST)
Date: Tue, 4 Feb 2025 17:45:38 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
cc: kvmarm@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev, 
    catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
    Cornelia Huck <cohuck@redhat.com>, eric.auger@redhat.com, 
    yuzenghui@huawei.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com, 
    jonathan.cameron@huawei.com, anthony.jebson@huawei.com, 
    linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH v5 0/4] KVM: arm64: Errata management for VM Live
 migration
In-Reply-To: <20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com>
Message-ID: <76172c57-aac6-d540-5b98-8de100c0886c@redhat.com>
References: <20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bNpzY9ISlUHkDa3-Qe5zm-8FjsX2URE46rBsZ16ictI_1738687540
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_084544_419838_202B562C 
X-CRM114-Status: GOOD (  12.29  )
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

Hey,

On Fri, 24 Jan 2025, Shameer Kolothum wrote:
> On ARM64 platforms most of the errata workarounds are based on CPU
> MIDR/REVIDR values and a number of these workarounds need to be
> implemented by the Guest kernel as well. This creates a problem when
> Guest needs to be migrated to a platform that differs in these
> MIDR/REVIDR values even if the VMM can come up with a common minimum
> feature list for the Guest using the recently introduced "Writable
> ID registers" support.

Currently MIDR/REVIDR are still RO and guest access is not trapped - so
even with the errata management patches in place the guest state would
change and a migration (between hosts that differ in these regs) would
not be possible. Are there any plans to allow to actually change these?

Thanks,
Sebastian


