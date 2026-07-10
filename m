Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD4BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 04:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ne9mmmnso31HUDrewqJxkxCVMCk7imP2313orFRMFIk=; b=zUjWMEag5kYuEI1tndajhEgx6V
	72NA/vXRtBnRlyzWdrogXPKtoRGeuSv+Uqk2rlkvuOqYrZSTV2C9D/XI3JccJKrt0TNMw0jc8Rig6
	8QPfEZYDdNZ4wiDA0SUBLChuIbUrUtLkumvl3jidNXjNKz55ZZ4I3ugm01+5hNIuy48EyfpFrZdpg
	Kuz2ttS61/h0siRiBiZslsMNil1w63Zm2abT0DnpLYmAdd5z4O0Oil2YarmcoMzm/Y2spqM26GaCC
	rzryeaDlsRycRkSQ9kxYKzJXLw7Z/x/PTsnXIoWla+eMcS1BHQyZ/KOh+eQrV/afuWRFN2eXe7MdR
	hnDFX20A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi2VX-000000044e1-0YzE;
	Fri, 10 Jul 2026 04:06:35 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi2VU-000000044dN-3z5Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 04:06:34 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-51c10e86e52so117661cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 21:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783656390; cv=none;
        d=google.com; s=arc-20260327;
        b=SDdrUX+M7iAgbzhkZmyTftrrFbSLmA9wLtzexlooac9JyleM8JNnMT+YiXeOdUDddu
         fc1oDh4Kh+vwefYAmZur0N9PPWgFlZ0E0RGQCt8fDwb9OhfR0pjfQjPB4tPywzT/qHM0
         4bcg4L230CjSEYyGO3gZ3LlSH2b4C/cGVF3KNfpYDpovb0lKkV31XwZMZ3CJo4DcksHi
         z22YlWIsZ0Mt5pg4P7006ALX/lBza/ExmP5cT/FY5PoC5wIfUtPBELOElrpy3GuqFd5r
         BQjN13hGjpJ87600Ik9Rf7e39iGUMgfZ2lluvShfevgmxy2vs0uqJqLAKigpWfY5g/wi
         EfHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ne9mmmnso31HUDrewqJxkxCVMCk7imP2313orFRMFIk=;
        fh=H44eGhnmCuLMmdEtfydlK+qBmzLwBnyHZKCAxEbZiP4=;
        b=NpR3rGiIHqyb7iaBWvY4ktM9inQsoApT5pwFaYBoljyupD6Tii71yh1YiK5Vtu2xN4
         c6HnZVTmrgGuSTZK01ob4JYHicU4WL/za92JXYZZJDOpBq++VXTjtp9m4WqjG2nk//LX
         tcMv9/o6R1qjL7ytfQz/OxIMnligEteU5XxiXyeb5j1PVDghb4yuxCBTSL2KCN5mu3EL
         nYJy1lfSGvTw5Sfc/chU5IzVnWO+JGziT1+jT7HYySbZCXwV/kqZpbjaidwhbGKu8EBi
         I0TSgLpU1Sf1v72qpN4HEMRZ6Kf7LdNbHFoLXcT4kFFEGPcQCSXTyv+d+dJh0LijPcwp
         EE+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783656390; x=1784261190; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ne9mmmnso31HUDrewqJxkxCVMCk7imP2313orFRMFIk=;
        b=nzer+v9wWYiZgelcvewkimI1r2A4T1d6HHX94ntoMiMkb5/Bj57qqOcJn2JjOQyWBR
         Mg/ZkoMwxXnDa4CHNzMjxx/fztDGYN2lFZsFn50Y2JSwxkmYI5dd2G79aXT5EEW4d6R2
         /YYN+VnDxaeAN+AEfw+hG/g1sKZi8fY1e543nunNmz4klrCoNopc5W0u4AYHdx+UUNUY
         44BdQTML66u9bQLEdkPWz5fMTsAFHcYLnT0y/WDXj1mgM+B+HaMONAYtGC65amwbDY4Y
         x3SFsSt2Tacw3bEXAK/3hRNIrklJKRz2boA+iWLuPfoAcZ46kWzJNkT3k6cQY+bg/lIw
         3uyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783656390; x=1784261190;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ne9mmmnso31HUDrewqJxkxCVMCk7imP2313orFRMFIk=;
        b=KQqknoJHHCi6V13ck0qzlO8bQDlCM/D9tcXcF+O07Fya270H7DPHAThAyEVrrwxbEI
         6pzpQpUdH1s3gz4qAxOLMaodyXOGfmuycgi4VWNsby++USyLcSBT/jw6xYi/FQM7BwEA
         rJViw19g6tTHyUFYFgTSmjTI8XnrrHPz3UHHHDgn4lG5RkCnXPitSTxIXMTA11gvue7V
         dynaeCXff/+BjHAwu2PCBS7fCVXPxXlYCXQszIlSgdtMZbjQ8TXMfgvN5KKpnZshY3Rb
         UvEycDQmyMk5Xs8nxZ5TWeEnTXVKoIFdjGhhpyeGf0CQ++D+YnAPVQB5cht3iO1AZneg
         bMRg==
X-Forwarded-Encrypted: i=1; AHgh+RrQ9h8PUQjOPZzLh6hZE++1JiQl5ti2gv+kIlvQih/eINylJLerAWlF2cYJbkw1FeChW4iPj/HzrrtrgJJQvSS5@lists.infradead.org
X-Gm-Message-State: AOJu0YwUNeQEE7nrj1r8Mf1ZdDRkGC0rKTt9yLHBpRZTeyGk+NpqHAim
	J5+ssv7XHVN0F8LW8EgtAGEEENju/FQiXa1DQPCUFIA48qF/f6aFCQAC7cddwlejoPb9QRyhLic
	K5IqQCqaWaQWiO97WTBSRVQnwro6rit0OH8M/Wdui
X-Gm-Gg: AfdE7cmOcMsuJYZQ6XLURifNFFusBCwXIyuHb0FwZJWpcAmPl1MruqXtUSw9zsxa27y
	014R5953hd1UhqCQMZHqvqlJ62LqiVG0ceXcn0lh3udMSPmAicOIUNAR5oeb/ahyZ2KvdoAtPSc
	r0KTiuOpE/pR9osOUjEg4hZp7BgZ7WfdMgzo8bV9nueedZucnv3EEA84nWY+BQ9/JtxwJWsh+4a
	MzfQPy8SKnAcUPA8otoAGohoZj2wHAv8CSvMym7tHv0PxYQnEWFvl1U8wA4j3eoVZt/ieVYn9f9
	DSts
X-Received: by 2002:a05:622a:1e91:b0:516:ccc0:ee38 with SMTP id
 d75a77b69052e-51cac51dacemr3969541cf.9.1783656389860; Thu, 09 Jul 2026
 21:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com> <2-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
In-Reply-To: <2-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Thu, 9 Jul 2026 21:06:18 -0700
X-Gm-Features: AUfX_myK7XQF1CZJv4vRx8UhENoIWryYI2BA_R5s-T_CavtrIu_usQmLmDIBaUg
Message-ID: <CAE2F3rCh8U-gULjvS_8xsVo7YWN0=K2d8DC0eHwDOfgwB7bvCA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] iommu/arm-smmu-v3: Move pgsize out of arm_smmu_inv
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Jean-Philippe Brucker <jpb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, 
	David Matlack <dmatlack@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_210633_045799_EC3226DD 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jul 6, 2026 at 9:29=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wro=
te:
>
> pgsize is a constant property of the domain, it is the base translation
> granule of the page table (4k, 16k, 64k) in log2.

> +       u8                              tgsz_lg2;

In struct pt_iommu_armv8_cfg, this is called granule_lg2sz. Should we
align on a common name?

