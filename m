Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A10AD65C49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 13:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNTY0Sqhk7+o+eguXb21G06qwMJTDsQYPt8jfcBPUac=; b=rETh2nQjSDwxOrletaEArWCEZo
	tG8Qam+VExjQMWEgOs/z/yy667epcsmCLmkRfZfIzB6GTaZBXyV6Q6u9KpvcN9/LXKq01teweiYll
	4JAzsVXC2/WJZkF0mDnPqW76DOBavWUCKzHU17VORlDV4WdYfZ8I638OhxVkJkXNm+UMxz7BAEGQD
	MNde9qGXretz7j+szGcUIFHrsvBE0Ednq28ZgCgY1DJur4BY61j7mB71muTLoVzEPjrrQX5YyLbfQ
	3bTHBoFJmNQ1YAi5IPaQliGZ5BpGA3+46JVzwtO3Dtijr6zwBAOQ96LGiTg15OZwYg0wVvLB2cOun
	OUBEw4ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVs3t-00000006tYO-2sn6;
	Wed, 17 Dec 2025 13:59:29 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVs3q-00000006tY0-0hqX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 13:59:28 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8b29ff9d18cso631967685a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 05:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1765979964; x=1766584764; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qNTY0Sqhk7+o+eguXb21G06qwMJTDsQYPt8jfcBPUac=;
        b=aDh01semZmUJK7xjFlLdv3Rb0dZpSLEAXYle+/nO6hkGe8OQO/PgLBMM3QGOY4GwMY
         sCleefp84JikLvtDCXldgiNDB+Jxq+Wy5Ow3i7ru26YJt9AF9wtZEc00YpgTl0R93gpn
         efjqR/+wPPk4Lqr0JjyLa8lATkKWzUz+wPgRTzZgUASNTuOWbI447tua+O/FmNQGf/Ij
         /knJEBJMRScLzM+uC8lmzw3+zWrYNoVMBID9OQkrBjH5IRK27H9r8tkRSumnkyNIQk+J
         MQ6rjobUyrWlzcWCld84hrn+kIAxEsr/A21kW7tzkVuSBJ7dDri5ak09biRzkJH7uOBX
         jxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765979964; x=1766584764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNTY0Sqhk7+o+eguXb21G06qwMJTDsQYPt8jfcBPUac=;
        b=tnHbPllGcM4tMk4I6PGRWKcl06oDX2+lAnCQDPEyEVdHs1IRPY58wU5WG9p9k5+fMR
         SVA29DUA+/+C5UHb/m/2/MkhJXhbdNsk0A5g24wIdV3I3BbZwEA4xnYQ8hjZKPfCTw6S
         I+xCQeOZnX/beRi5P7OVBR9wf6Kd+NzoQBpIuvEhx18NRXFCvjJmybYzVj9YTtq29L1I
         c+KA+tIfUgaQ9GsVDAYltFAOYB+6NaZyqRCSoz13zCBxiqe1OPGd2GWfTR7Bh7Q6IPUu
         CviNbI9Daj6nU5KEhMUb1vhlyGtZusIKzAMx5dzW8ig9+wZ1eZJTxKOr8T8TBaoKdoSu
         ICNQ==
X-Gm-Message-State: AOJu0YzsvGwlYPXu+gJgtFSh2HksvauwPggy1ZeSik6z9ufdOyFzj3hH
	MlKkCoOkqj4PLRX0U1US5zMOIepOgJJf/aw0Yr81bAhGBN0Ysjz7C9UbZ0qXNSjzxto=
X-Gm-Gg: AY/fxX5/Jl0uLaCrKTgFYa3lkbtyeHcC7mjPFA8FZjUAP3iElY1FZlB/CwqI/9+OwYt
	wWoHAsDy3hWhhfpm3yjmnLr5d8WKK3yc5AQ/nqGBGiYWgvd+bsoPS8wXs/xPVC72knbIJYk++6R
	1rcbNIUiQNuWLf3HMP6BrOK7z4Ul+MQQSalHgXbDg8NUesIODe6o4M6ijyMl+YGpZBXPEqBZOWC
	67+zEkmsJ8xse8z+D326nTtrsOtzfJE3pKeX2dNU/ZsJZXwtPhTLNLDikvDUkvsas5r41U5Ke6E
	kHuSQVJUuvOGuFFR9OJBQV4TAk8+Wdue3DQ/pgC7b81SFntd0fnrNKyfu24sXkWlC7432PQGwyn
	ctEdMaXBY5RFONy84ZsYtqKAMNShommIowNup6bhUrVC21wCEkseSYHrrcDFpo4j9Dsrj28aKFO
	9XynbWksGpEryslI14097no0RroMjQv2qzFDDi4cbn8sXdLdLPyMlUKsN6w0wn+xTJ6FI=
X-Google-Smtp-Source: AGHT+IExCGpmH3xSn76tDpf9mlwCNxEI0+dX+XnOw8fqnvLy+nODc5UF85vOKaQi2smq9F8P/d+5hQ==
X-Received: by 2002:a05:620a:7108:b0:883:9b33:f6b6 with SMTP id af79cd13be357-8bb3a39bb23mr2288717785a.84.1765979964213;
        Wed, 17 Dec 2025 05:59:24 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be31b559cdsm418416585a.30.2025.12.17.05.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 05:59:23 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vVs3m-00000000fU1-385b;
	Wed, 17 Dec 2025 09:59:22 -0400
Date: Wed, 17 Dec 2025 09:59:22 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com
Subject: Re: [PATCH v5 07/27] iommu/arm-smmu-v3: Move IDR parsing to common
 functions
Message-ID: <20251217135922.GE31492@ziepe.ca>
References: <20251117184815.1027271-1-smostafa@google.com>
 <20251117184815.1027271-8-smostafa@google.com>
 <20251128164816.GC812105@ziepe.ca>
 <aTw31-mh8z81yi4Y@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTw31-mh8z81yi4Y@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_055926_422835_3E9EE528 
X-CRM114-Status: GOOD (  16.00  )
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

On Fri, Dec 12, 2025 at 03:42:15PM +0000, Mostafa Saleh wrote:
> On Fri, Nov 28, 2025 at 12:48:16PM -0400, Jason Gunthorpe wrote:
> > On Mon, Nov 17, 2025 at 06:47:54PM +0000, Mostafa Saleh wrote:
> > > Move parsing of IDRs to functions so that it can be re-used
> > > from the hypervisor.
> > > 
> > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > ---
> > >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 112 +++-----------------
> > >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 111 +++++++++++++++++++
> > >  2 files changed, 126 insertions(+), 97 deletions(-)
> > 
> > I don't see that this slow path stuff needs to be inlined?
> > 
> > +10 to my prior remark to not dump all the huge inlines in the main
> > header.
> 
> They are inline as they are defined in the header file, otherwise they
> get defined multiple times.

Put them in a shared C file

Jason

