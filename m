Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16881C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 22:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/vmxyfLZmsdUgaY4GgNAqPHe54Ny5KUNKHgsqFY9Is=; b=bjJ17jX+xY+sAr16GpfHdElnLO
	fzoKnURXUeQf7GXdGy04pxb5ouStjzIJztKUM24SGP5S2fe0Tplgzn0veRXpExwx3WR68XVzsVlE1
	lKhKdcCHGmkkbtp+cnQWSspcUdEAaOlj2oXpS3Ph1ICoHfdFxGu7OtvnCNXJlZFCtf3x1WBHv5eOW
	vZS90o9cmK9h93VVMsYmdn7h8ucJ6Uxry0FsTmK+IhtsEEAlvMjmhhIroM3Yiul3OhNrzUpjq+fJP
	wLkNojMHXQyg7taMRHWGYsPk7n39Ymv/JLwnUmKn807Z5zEfyGkDplvJ3Oo1JPICEYIZlknUPqvlI
	qRuEkQ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnO2c-0000000HHpC-26tn;
	Fri, 24 Jul 2026 22:06:50 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnO2Z-0000000HHoa-497G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 22:06:49 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47f7854678cso592825f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784930806; x=1785535606; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s/vmxyfLZmsdUgaY4GgNAqPHe54Ny5KUNKHgsqFY9Is=;
        b=m9QKsECncu7SbmdmycJUCLDYrvUCRRC3NZ0ppx6d7oFilGjqp3+QzU9Ws44EoOHAXg
         8TAVH2o9EOBTcXZ0Rc4JksrXZvyprG0adc+8zUuBupM4fsGVhYM0OSCY4A13/zzxeU/2
         HNSXrDagrv0+O9/ISZk1E2/umQi1sy3fRhXnHzQOfa1QUXa3wMOoIXtekFTzKPp5s2E7
         cuhe4Ag6t/2e8FaQuzlc8UDG25vuyM6KMsouRrrFTS+BUx9M9av3s/weywDF8BG3ZbAS
         ZlycPVoP0YFDJsyOrlqClsiAKKx3cCC0CxMpI/C+4BNAWUDeI+mJ7F/wkTjPDb11ErCx
         SIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784930806; x=1785535606;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/vmxyfLZmsdUgaY4GgNAqPHe54Ny5KUNKHgsqFY9Is=;
        b=hGaGtPoVFzgzlPf61IU2AZ8oDcI+j51VvBtjh9vqaVeaJipB8qdv2Z5cJVVvP5L22B
         nudD26tiL4vnhrqbj/AgxzXtSeXBZMGkRuwf3FSSGMpG7PL6LLddr5JBL1DPsPlZnUAw
         i1tUi98nmIL1cUfuAySB3ogxILZF3Nk/wEZoh0bh6hu5thTyWaADsR/er166BltjGH3A
         t8hhNF4uhOMStPC2kTAs4Kn6fsWBXqAqf6d1/srtLnBSpKhXTahcNlWdVEeGILBhT8Kr
         iXhMYnnn/r4RevlMfZBvr6a9kQBy98b4NYoVLs6QZq3CqJfRCzRU2G1MZHDmHRrJfJLl
         L6UQ==
X-Gm-Message-State: AOJu0YyjfCFAMWpucY5yhC5Cu2x1Y1kHIU4DD+xlN/dGaaoakg96f2G4
	Q/Ib7bB10bINf2h9Nh8ys2VdunB9BDANb+YL86LeKpwLS++TUQLbVIZm
X-Gm-Gg: AR+sD13Eh3km116nGK4RLv56QMozhXtzp9t1J4Z/+5q/GaYOiH2q2at6rSB5tjdmOvs
	su3B10710hdJFOBm33NG1O61gmoZKperanJ+njd7RROZw4pQJ1yFCisMyVMoBs+jqS4Qc70TEgI
	f8mzQ4NMbxKY5Zi+Kf9chiBWOl+uYi/TxLVoOc2sIdHz81VwxsLGDGrGtbCIAd06w5JapEYs9Ls
	w3tkZy3GWciNtNn8cVsUvPjH4nMk0MTyVsaYpCwkjhvy2v7kE/AlQ6LIXv0TD9r7AyIPTILJSrN
	ZpHLITqkku6wVmWeeTtlRkxSE7JS6nEafCd2BxxvhAMjVioxP0GjcF2woGZxp2/3loCwe/WiI6p
	Q9mourFKQksQd5jY+hAdLDmyNtM1PMtD1yRnfK3/Wikl7lyoicoG1wVt6goUeavbfOAZx/A0+Rl
	dCOH1ZgM2k8g9aumclG/lR/DU4QCBMXQXjzmjEu/CJmox79Z1kNfWz0iP8kRmQNTavc7vLzgTk4
	iCX0a2jjSvERHUSMz40uGOjcdHW9hB+bIXBldamkWMTujEI8n8E75iyiug3xViLaZIRlzpxUaZo
	jfi2xRYnNrs=
X-Received: by 2002:a05:6000:25c1:b0:47b:5f25:7c59 with SMTP id ffacd0b85a97d-47f9fea2b4bmr34501f8f.38.1784930806012;
        Fri, 24 Jul 2026 15:06:46 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-ae93-f301-cdd9-d5ea-080d-9131.310.pool.telefonica.de. [2a02:3100:ae93:f301:cdd9:d5ea:80d:9131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bd850asm26780306f8f.15.2026.07.24.15.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 15:06:45 -0700 (PDT)
Date: Sat, 25 Jul 2026 00:06:43 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	Russell King <linux@armlinux.org.uk>, Kevin Cernekee <cernekee@gmail.com>, 
	Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH v2] ARM: set !LPAE MAX_PHYSMEM_BITS to 32 and remove IO_36
Message-ID: <amPhVKnTgESQQp7w@gmail.com>
References: <20260724174748.65958-1-kmehltretter@gmail.com>
 <0d6dbd8f-c5c5-49d2-b36e-3cdd404eb55b@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d6dbd8f-c5c5-49d2-b36e-3cdd404eb55b@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_150648_047161_A128D678 
X-CRM114-Status: GOOD (  13.14  )
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

On Fri, Jul 24, 2026 at 08:31:35PM +0100, Arnd Bergmann wrote:
> 
> I'm not sure why you remove remap_area_supersections() but keep
> create_36bit_mapping(). I would just remove that as well.

Sorry, my earlier explanation was confusing. create_36bit_mapping() is
not totally unreachable after this patch. The ARM EFI path can reach it
through:

    efi_create_mapping()
      -> create_mapping_late()
      -> create_36bit_mapping()

I verified this with a modified EDK2 build under QEMU that advertised an
aligned, write-back EFI runtime memory descriptor above 4 GiB. The
kernel successfully created the mapping and enabled EFI runtime
services.

Admittedly, this is a synthetic configuration. Stock ARM32 EDK2
restricts allocations to below 4 GiB, and I believe the AArch32 UEFI
specification requires RAM in the UEFI memory map to be identity-mapped
during boot services. The test setup is therefore probably not a
conforming real-world firmware configuration.

Maybe you want to keep create_36bit_mapping() because of that?

Alternatively, if this should be considered unsupported, I can remove
it in v3 as you suggested.

If create_36bit_mapping() remains, I will update the commit message to
clarify that the patch removes 36-bit I/O mappings, while retaining the
generic supersection mapping path for domain-0 memory mappings.

Thanks,
Karl

