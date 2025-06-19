Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45A8C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:To:From:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFwa0VaeKDYvJD+4TaNeC8PvG0ohNrCLdil12mUnuYE=; b=r2F79dVNCxTx3NhchebaufjwJ6
	XJd0PI12TCbAm6frPW/u+ibvV2xcigCj0IiGGDLICdB4yWzOs3dk8ZzeG1NeTcORho/e+XfKpvdjy
	9j+AAfOpl3m7A38NkA8VK5KdVg36LGDI/c6f4N8R71Dgc11Tp7V40p/NiXvvtwUe/FjxQVKIe/eop
	Uf6dd2FFuUexyjS3Y3/9ALzEA4nAcL+synzRTjImmfGXI8CDllWIJY+ADbvJDIs8PI4js4kTr2dWy
	GPugjF1CW3DU/vViLCN+7r5628zLDajI6rg20MpMp6mRFsrBUQjsCzuYZ6b6ZM/zv7fBZgO0A7F0+
	VQFEejrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHSu-0000000DTjG-1hbA;
	Thu, 19 Jun 2025 15:46:12 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDm8-0000000Cwtd-1sPT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:49:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750333773; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=k2ECfxzVPE3LQGdP+afxdo2PgIFbQNaYLKpjrIynKpY3yybZYHJLxFiB/dmI8efnc8rUsIKNoNwmqPz2EPQsVULAfgO091mxnTABvvvCrSKmqben6qk4NSJSs+sScEpScGuZ6eLpwubPC3oaOrZbonPHtnN6Jh9cEJNxrk88RxU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750333773; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=MFwa0VaeKDYvJD+4TaNeC8PvG0ohNrCLdil12mUnuYE=; 
	b=iEW5xAAgezzbdxSNsZDDk3VsivFivtHmB6Po0joThn2weblF6yQzIy1L5IIU/InlzMjKoERnoZysKA3nOopWpeP9uCrELVxC2mLS9mr5QiqoSlnlQKehI25R/SUBNYmc1a5tAhM+UCR2sybwqLItzf5Qbu6stjltqs8Rfd2lbLw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750333773;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=MFwa0VaeKDYvJD+4TaNeC8PvG0ohNrCLdil12mUnuYE=;
	b=aTb7GInjoKUCOXMf7yztMIKG511RPdIWJjMtGuN08TR/Y1jgM1569zm5xdN3g09d
	zLZW5wOVfmSUv/fb9z0GjJg9C2ymeJy2HAqhBfCrCGJzn66/7wD5IyxD+rzdnMIpqTH
	wXQjkb/XSpDfK3ExgNAft8FJbMrF8CO1G5ovTuOY=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1750333771123763.0534931058979; Thu, 19 Jun 2025 04:49:31 -0700 (PDT)
Date: Thu, 19 Jun 2025 19:49:31 +0800
From: Li Chen <me@linux.beauty>
To: "Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"Len Brown" <lenb@kernel.org>, "Hanjun Guo" <guohanjun@huawei.com>,
	"Liu Wei" <liuwei09@cestc.cn>, "Ryan Roberts" <ryan.roberts@arm.com>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
	"Sudeep Holla" <sudeep.holla@arm.com>,
	"linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-acpi" <linux-acpi@vger.kernel.org>
Message-ID: <1978805cd53.d7656d5d435218.1873813773955537604@linux.beauty>
In-Reply-To: <20250606072802.191580-1-me@linux.beauty>
References: <20250606072802.191580-1-me@linux.beauty>
Subject: Re: [PATCH 0/2] ACPI: Improve SPCR handling and messaging on
 SPCR-less systems
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_044948_551829_D37B2D79 
X-CRM114-Status: GOOD (  17.90  )
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

Gentle ping incase of forgotten.

 ---- On Fri, 06 Jun 2025 15:27:43 +0800  Li Chen <me@linux.beauty> wrote --- 
 > From: Li Chen <chenl311@chinatelecom.cn>
 > 
 > This small series improves the kernel behavior and output when the ACPI SPCR
 > table is not present or not supported.
 > 
 > Currently, even on systems that completely lack an SPCR table, the kernel prints:
 > "Use ACPI SPCR as default console: Yes"
 > 
 > Or if with acpi=nospcr:
 > "Use ACPI SPCR as default console: No"
 > 
 > This may mislead users into thinking an SPCR table exists
 > when in fact there is no such table at all. This series addresses this in two steps:
 > 
 > Patch 1 ensures that acpi_parse_spcr() returns -ENODEV if CONFIG_ACPI_SPCR_TABLE is disabled.
 > 
 > Patch 2 updates arm64 acpi_boot_table_init() to only print the SPCR console message
 > if acpi_parse_spcr() succeeds.
 > 
 > This results in cleaner and more accurate boot logs on ARM64.
 > 
 > Tested on both SPCR-enabled and SPCR-less qemu-system arm64 virt platform. [1]
 > 
 > [1]: https://patchew.org/QEMU/20250528105404.457729-1-me@linux.beauty/
 > 
 > Li Chen (2):
 >   ACPI: Return -ENODEV from acpi_parse_spcr() when SPCR support is
 >     disabled
 >   ACPI: Suppress misleading SPCR console message when SPCR table is
 >     absent
 > 
 >  arch/arm64/kernel/acpi.c | 9 ++++++---
 >  include/linux/acpi.h     | 2 +-
 >  2 files changed, 7 insertions(+), 4 deletions(-)
 > 
 > -- 
 > 2.49.0
 > 
 > 

Regards,
Li

