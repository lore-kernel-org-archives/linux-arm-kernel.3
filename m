Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B1C107BCCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+bv56JD7xnnmkG1/WXNNS8xw0C/IEr4oRQdePf+aIw=; b=pShhPepAr8ZGwIuo7MWErZEg97
	tpVBm3ox5/5l6IxwEK1j9E2JJU42qUeC4/U8uRzsW1+RzBjnMHJLAm55LwKsQe/NVuhFZuQjoGBub
	C46vPk+oGeVCC8LGpwOvMBG2CC+UbfMaAjVHmi/3zFiakhX4TzDxihpVmBTD5mqTpIxChneXNUxrC
	qhnpaRHf/SdAdOe3/YBspS1M+RNbiadpEYwdxe5+AfVxmBffg9u6E5EFAC9xlIo+uPWDhp67PxPpM
	+qRIerZshg5MpT16YsSz9yo9fsAvpDj1nOcUKKhXqIU/TmMH/U73lalellt8AiPKGEeUB0fd+9aN+
	2uN2YmwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15Ux-00000000f40-3P9v;
	Fri, 13 Mar 2026 16:36:27 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15Us-00000000f3b-2yyv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:36:26 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-359832fc558so2028887a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20230601.gappssmtp.com; s=20230601; t=1773419782; x=1774024582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+bv56JD7xnnmkG1/WXNNS8xw0C/IEr4oRQdePf+aIw=;
        b=0Q7CPCzHVi6VJDEue5wEWx73cHYc6vtD9iWPF2t7mESmR6cs4dg8OequNk8SCJfev6
         SS1lBSde8AAqeyJbAuhxfNSO26fL0oQk6mIm+xIh7H0cwAJ9kDrunIgt2nqpjAC8rjw3
         svyLU68GuRDeRVM13HDOO5NYMtzplLUbwVQo8mRBhHa0MovvuF81ljl8f56TWyqI67Au
         SoobMMPX0Du1kHNGYDIttWWSH3NTzLIOvwDOWNitl5p6mWhVPdcjeDeo+0O0uMnkczXq
         Le+u5zhvq7KckS/BadCl2sckuopdIE7pXG7LXg0fGdm/Gj77nQdCRKYn5r3sOREpkUzS
         pWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773419782; x=1774024582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r+bv56JD7xnnmkG1/WXNNS8xw0C/IEr4oRQdePf+aIw=;
        b=JFrudsOctcZ4LUDweEjwCZi3dq6ux1nFW6PmaFxoB6uoooe/9Chjv+fpY5mE0GB9Bs
         l1x7rRO+eLMI6lFtZvQOAed+wdNOSe17GrsSV1tXag6bCWXx8Ff5T2q6F9fbfF2u7QUW
         5JduveWHf5UYeqfMrh9275F76V/CY80uHifaBI5t1iOUy/nTC5z3NGaElSTl24QhC6Qq
         yUE3vjDVtDKilweAMArGfsd1yJXrHqdiGfTAVu4RjaeHIAqIHOC6sNZU2VhCm2IEEV49
         k2Zj8VTqp5QeEu82b1cSI7EMzYgcbfCFa6Cgms6oUpfkFxtUQ5tSgX/aFScLgqm9kxH3
         qoqg==
X-Forwarded-Encrypted: i=1; AJvYcCWK3YzqesFyhdOxWC1hL29EO2hdo0PKUlKRwERKR/qu912kAOW1bP1vz4gd8ADdJhb7W0KJjymXoLeTRXztMoUW@lists.infradead.org
X-Gm-Message-State: AOJu0YxmGZzkzj5CTg7ctxy7EYH0Cc3AnJlxEyIFqRDKub9srcC16EQC
	y0+Nn3Ul0PS8jPPFebg9RBlU5jXigBSw+uUvvN27QMXu8Yun37x7+Pv789rwwhuIGqM=
X-Gm-Gg: ATEYQzxvbWylTBmgPrPaOOaxZg8tRm5ub6ML3xLoiQSqPMfCZ2YzR0DmlY7NsxcJiRb
	vEcrvmACXwsUagTzi2OxI7TLAz6mThhpmy2rn/b7fHkVzh6x/9cc3eZ1CZ9vpk5q8S2NXdmZANx
	qGd2enOH0rwIYjZdNZGXm2aZrSTb8oVuYsV8/KvJMB7x7rSOv0UVIE8vnxATx6IHcKOcegMoXYd
	orZWzM3NPdS9Q5aBskvVCyljODJ/tenNeYMky9mFeM7iFw7Nl+mspzg2o49cnfIj4QrtFTRcdQm
	8onobEmm8S8uIZXhU6rWHe+vuS2mOeGlYENz51j38M8asEXYIIntPn6ghevP+BGhvd6AWTuJXow
	R+GZY3KolcRfEAJuhbt3aoLlHOWBERoz/3mJXIirejRtslVk5azVyqlo3rjHNrI1l9wCxs8yBTY
	3XZl0=
X-Received: by 2002:a17:90b:278d:b0:359:f3ec:c773 with SMTP id 98e67ed59e1d1-35a21e4ee48mr4110674a91.3.1773419781856;
        Fri, 13 Mar 2026 09:36:21 -0700 (PDT)
Received: from gpc ([2400:8902:e002:de08:5754:7dac:85df:935a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359fe40bed5sm9754313a91.5.2026.03.13.09.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:36:21 -0700 (PDT)
From: hev <r@hev.cc>
X-Google-Original-From: hev <git@hev.cc>
To: usama.arif@linux.dev
Cc: Liam.Howlett@oracle.com,
	ajd@linux.ibm.com,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	brauner@kernel.org,
	catalin.marinas@arm.com,
	david@kernel.org,
	dev.jain@arm.com,
	hannes@cmpxchg.org,
	jack@suse.cz,
	kas@kernel.org,
	kees@kernel.org,
	kernel-team@meta.com,
	kevin.brodsky@arm.com,
	lance.yang@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	npache@redhat.com,
	rmclure@linux.ibm.com,
	ryan.roberts@arm.com,
	shakeel.butt@linux.dev,
	viro@zeniv.linux.org.uk,
	will@kernel.org,
	willy@infradead.org,
	ziy@nvidia.com,
	WANG Rui <r@hev.cc>
Subject: Re: [PATCH 0/4] arm64/mm: contpte-sized exec folios for 16K and 64K pages
Date: Sat, 14 Mar 2026 00:35:57 +0800
Message-ID: <20260313163557.147948-1-git@hev.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310145406.3073394-1-usama.arif@linux.dev>
References: <20260310145406.3073394-1-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_093623_024986_E664CBE4 
X-CRM114-Status: UNSURE (   5.78  )
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

From: WANG Rui <r@hev.cc>

Hi,

I ran a quick bench on RK3399:

Binutils: 2.46
GCC: 15.2.1 (--enable-host-pie)

Workload: building vmlinux from Linux v7.0-rc1 with allnoconfig.

                Base                 Patchset [1]         Patchset [2]
instructions    3,115,852,636,773    3,194,533,947,809    3,235,417,205,947
cpu-cycles      8,374,429,970,450    8,457,398,871,141    8,323,881,987,768
itlb-misses         9,250,336,037        8,033,415,293        2,946,152,935
                                             ~ -13.16%            ~ -68.15%
time elapsed             610.51 s             605.12 s             593.83 s

[1] https://lore.kernel.org/all/20260310145406.3073394-1-usama.arif@linux.dev
[2] https://lore.kernel.org/linux-fsdevel/20260313005211.882831-1-r@hev.cc

Should we prefer to PMD aligned here?

Thanks,
Rui

