Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1616D59D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yb0mpDrVWWr4Uchsh7e1JfdRTz6GJRCuX0Lg98K6TFs=; b=ovxPF7U/bm7M3Cx+UiaC3KFTSM
	nQdLZVbrZ7RBaOrQVdA54KSi/y5FNgUvLZAcEN4eQUd1gpQvnunDAkk04oBftMPbduMyWV0JSXzXX
	0YT6vzfUAqJfSFOD0An6r8NwMsKT/0eAPIRhJnkcZQQprb1Q0/aBpOGv839lFtUAj0kwEvprDR96O
	mygtIG/Tw/CTwtwBCMhxYfMbfLekAaTxkee325t2DVn3mmEgwEomwtMmRv/1l3ARsOiwVvp22dqdq
	1r7v8hnC/FN8qQa7xjvam6wMMuqjbjbj10GBYFJ3n55PhedcN6tyeLuoWd1RD28FF8joQjRUgtq8c
	wgl7e5kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5H4-00000000l5R-1Fur;
	Fri, 12 Dec 2025 15:41:42 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5H2-00000000l4x-1SX3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:41:41 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4779a4fb9bfso128795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765554098; x=1766158898; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yb0mpDrVWWr4Uchsh7e1JfdRTz6GJRCuX0Lg98K6TFs=;
        b=pOxTQnGU4dvcPPdnfVgaBZt0epdeG83QLGEa18vCuLY2Qh5tkRRYYCPDgyPphxxkJa
         qV8B/6OtIO8kxi0e9ZrGPDNSN189TSLrdUZXsO4LKsm3fEjBE2CEw4G5bcZ3m+2mrEDE
         yWCmew9hIV2UrvW8nc1oW8C9uAcjaOlhZgh6teKlMWLcAFa+X6QIo+m6iAQwFj4F6kv+
         CsgQsl9WDqlno7p3ed4z/vltucmNsPBrfLJmQ95lsGP8Gq1qPrZO6Efy7qYTkfRKrRfp
         t6UF0XdzIfwLKP/cTBcD9N/4+vVeRoZ5xXmEBP4dgc5dWJEvgsFCiyaIO+HGFZXOYNXQ
         bhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765554098; x=1766158898;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yb0mpDrVWWr4Uchsh7e1JfdRTz6GJRCuX0Lg98K6TFs=;
        b=BH02OzyfWnxSOK7a2Uz3hXiKWiKUKluBah+zsrzZhFREMFGcqKsB/nYIMsZbZuhSAl
         N4bXIZWRavuIRQcLk1U0sgsTc2itcJxkyWk2fT8srTEyEQoWIACFaTc3Wo5o4QKwxbzo
         Aw5EMRdoO6b19Df9zVbBn7Ce66Ib6KHKLeof9/SjV39Ix2hIVof+K2/bXW1gSVb4Iaa1
         lgppSccn/AZMTO7qXGsChmpMcUZgxDf7AN56Ugtx2MIGLSYqn6SGb2Si2IdRUuAu/guk
         f1uyGMi72cvQJrNxLnvmcqUaknJgr6/LkwS1Jmn7Zmrn+7lVn7QeOIOd2I9CRwNolsvT
         5NMA==
X-Gm-Message-State: AOJu0YyyRO6KMN+8dTi/+8J3kiAaGzUzzAjrN9swIzyLVHIjrLOVxLSk
	5yWNp6R2r6bXT0KnKvLRgQkLO++yDbXM4N+gWTiM9Gv2qojY8+xQRtiSRgkz/1S7Rx0PqzPBOeJ
	h+32SDA==
X-Gm-Gg: AY/fxX5fIj0lZKbP2W8P4cyoovvMAsvIl6Aq2/WzLhoV4VzhfI43j18crlKz8oCYGJP
	ytKl2kIMy5FAEZuAxAAtwbjjsXZGH9dyStQJRNmtoP3eED6YTrPamvABxot3jNxWPYw8UTPOBz9
	KFyq3Dx5YQGlbC51ez9ExTLRqCb6hS0kTBYY8Xy0y5SLM1T6taMD4OdoiURZ4S6sPIXlLmfFqUl
	TZX5EXo9TygQ7UwNBW+tbeqa/2kPpjFLBFvE6qRZJ9VZnm3zWXSbEEYqSyE+ZJFtGyoYmNcrfJW
	ghLGU3I+t9Ii4vIrXAPEXKDmuxZMbkIJDaqGzrWFx2wOmVcsucfFDLtowXrkOSLJdCAS3Y5lO18
	nVqam2zTiIhyiO40jXq6iSQ/g0WAkNQ+aXpHO32zxRomD+yw/GSs5qoXsEHyOYLlEbYwNemMCF+
	crGqTOBu+aTuNF6R2xs+wD/D4NocQ3b7rsmkcl6W1TqwzvB/XDFw==
X-Google-Smtp-Source: AGHT+IE8Wx434r/TRdblX8cNOSB3Il2X+1GmWAuGcjE2WU7i1xwbelBfzCA/D0WahfUc0XUl/gS5rw==
X-Received: by 2002:a05:600c:8885:b0:477:2f6f:44db with SMTP id 5b1f17b1804b1-47a8980f38emr1011225e9.5.1765554097506;
        Fri, 12 Dec 2025 07:41:37 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f49da20sm36628515e9.5.2025.12.12.07.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:41:36 -0800 (PST)
Date: Fri, 12 Dec 2025 15:41:33 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com
Subject: Re: [PATCH v5 05/27] iommu/arm-smmu-v3: Split code with hyp
Message-ID: <aTw3rS1Pp-Iqq7yU@google.com>
References: <20251117184815.1027271-1-smostafa@google.com>
 <20251117184815.1027271-6-smostafa@google.com>
 <20251128164655.GB812105@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251128164655.GB812105@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_074140_412751_EF1E54E2 
X-CRM114-Status: GOOD (  15.12  )
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

On Fri, Nov 28, 2025 at 12:46:55PM -0400, Jason Gunthorpe wrote:
> On Mon, Nov 17, 2025 at 06:47:52PM +0000, Mostafa Saleh wrote:
> > The KVM SMMUv3 driver would re-use some of the cmdq code inside
> > the hypervisor, move these functions to a new common c file that
> > is shared between the host kernel and the hypervisor.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  drivers/iommu/arm/arm-smmu-v3/Makefile        |   2 +-
> >  .../arm/arm-smmu-v3/arm-smmu-v3-common-lib.c  | 114 +++++++++++++
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 161 ------------------
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  61 +++++++
> 
> I would think these inlines should go in some -common.h instead of
> arm-smmu-v3.h for better clarity, and ideally pkvm stuff does not
> include arm-smmu-v3.h at all?

My thought was that we use “arm-smmu-v3.h” to avoid moving a lot of
code and messing up the git history, but I have no strong opinion,
splitting is fine also.

Thanks,
Mostafa

> 
> Jason

