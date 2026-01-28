Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA1ED25B64
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 13:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41MXFfWgnOshyB3yHARCHCB6QhMvFSayCiwgerFf9X0=; b=BGQQkNOfFgkYSuWC18YcSrHOmR
	PbfPLH8BavtHqj4Et85qLCmoTG+iME6EQ3I15IAuiqomV6au8t9Jn3YqnBXFYvNMx4z4xRfqzAtNH
	LF8WoNQxLo7tIA1raUZHFu8zFWZbP5owZ7e6GLo3RbneQ/2zvXdUGfFfwdgIkFPPUF9HxLSRv7hcD
	gvgjEVVNBwKZCyo5eIYSFHvf3eZxnnYqVYzDmjqx5Dw1P6gmgFaGfCjsxfBmIwn3rGqV9pJKwBbvO
	/aI9xCZI84eNydVs7vhkpVkhI2ZlKCMlFKOVYivh+VL9xN//tPwN9/j421fVooZZBkq1T0GqH8xmE
	HbfZtaOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5Z9-0000000G3iF-1Z3Z;
	Wed, 28 Jan 2026 13:26:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5Z5-0000000G3gv-2p22
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 13:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769606792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=41MXFfWgnOshyB3yHARCHCB6QhMvFSayCiwgerFf9X0=;
	b=FHX4IE22GIm7ABW9GBvmxeO4c63//2z6nmXR3LGhap/qvlPr/GN3POf5K7OTkvDBoalUm2
	O/liUfJpEzh7HNkhGlxijEHhiRlgyhhgckAizeYtQFhGaDWicz1gGfoQhR4+YWdfFTBxNu
	N3+SExxpm2DF80v1gTak0ohJRY/051U=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-wlLqrmSIMGmjWbvCcwehIg-1; Wed, 28 Jan 2026 08:26:31 -0500
X-MC-Unique: wlLqrmSIMGmjWbvCcwehIg-1
X-Mimecast-MFC-AGG-ID: wlLqrmSIMGmjWbvCcwehIg_1769606791
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a87029b6so2176400985a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 05:26:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769606791; x=1770211591;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=41MXFfWgnOshyB3yHARCHCB6QhMvFSayCiwgerFf9X0=;
        b=CLb2hNqJtH9WmIHCdq5yHpRnJlqOqzoVDEU0VulYif+oOcG6oiUQegqZcWfd+W9qKh
         ukG24CcKAlUqilNo3j429+3i88CFu2m9XdrYCsPPMG3h+Nt/gjbYaaJq/O3mclj4eLbn
         8PJvyrMDII7r+z2BY9qJyOXh3oGwFU3ESBDZ95pxmdHKpmCV9kOfkJ3i9TcP11h6erxV
         26OcIvQaTYOPQVCK53ToWw7MtP7tzkO7atGYUPtefFP1Wlo5epWFu0ecU9YHNvyQQUhj
         YPbZFCRH1CG0r3uQxCaND8bX7sodKZ5+G+0N86wj0f89Ms8ToLkz8XxvSH2904LRWBtE
         1Okg==
X-Forwarded-Encrypted: i=1; AJvYcCWFW63C6o3k+BIvZQMeJL1YNrajRzo+TV4rKzxdow6SLtpCMLUyzFvSrOanIYusrTq2XguO27ZT8xU0r0AMfo18@lists.infradead.org
X-Gm-Message-State: AOJu0YyZoX+Pz7aCIRRT2HUmYqtC3IFCn8cGRWCjhvo1zA9cU1iPreuN
	xlhuUyisCk6ty4XEZuiXOBe4ukdNJlQHo17mtFysatmbz5wHDKj9HHN3HG1WGLV8kQ7F6KcJTel
	CkO/1OCvNMhVc6kF2aSdgSqlg5fRha+8oO63UzjYT+QpO7/9CHGPT+2fcg1o20w4p4JUSC7xaAW
	4m
X-Gm-Gg: AZuq6aKAj9CgXAvGchKdk6THbnFrbak7e+JjRTVKdRXVy+TE9shQATSyahDSUh8n16n
	QKsqd08DSXzsIuLUAPv9AdZpZvu1t7KaA3MZTm8Ar3oAP5UhA99QmNiwkTukT+nnZ7JltDSt3SC
	fSksY1E7ZWweWNQrgOrudFXCgzbUlax88tRIBkzFB/WRGIi09OuRcL353Is91PciznUX1B1CZK7
	T9cv8LDEgUNgmF5kQ8wAiX9C5+Ot/dswsM5IIYvC7rTDcWNa44+TOJ4nfZBlU9y6bN5lCyBGW8s
	Qu0wm3RA26HbF8lK2zDelAc3esE0YvO+oqPh53eUS4j2MScjU92A0/5JYBtyMmqb/e0h39STyFS
	MzSu2IUObZ8CIQZ+wPQ/mPPzzhX3WF9BY8ypdf+KS1kl8
X-Received: by 2002:a05:620a:404d:b0:8c7:7a3:501b with SMTP id af79cd13be357-8c70b868c0dmr598544385a.26.1769606790690;
        Wed, 28 Jan 2026 05:26:30 -0800 (PST)
X-Received: by 2002:a05:620a:404d:b0:8c7:7a3:501b with SMTP id af79cd13be357-8c70b868c0dmr598541085a.26.1769606790291;
        Wed, 28 Jan 2026 05:26:30 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d2cdbbsm176902885a.28.2026.01.28.05.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 05:26:29 -0800 (PST)
Date: Wed, 28 Jan 2026 06:26:26 -0700
From: Brian Masney <bmasney@redhat.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"joel@jms.id.au" <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] ASPEED clk updates for v6.19
Message-ID: <aXoOgltiXIfIgX8T@redhat.com>
References: <OSQPR06MB7252BF7364580CADD7D3F6928B91A@OSQPR06MB7252.apcprd06.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <OSQPR06MB7252BF7364580CADD7D3F6928B91A@OSQPR06MB7252.apcprd06.prod.outlook.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0Ug-m8hOQ_ZywIqtLkygwSyGc6MdHc--vFHEzwUBkdo_1769606791
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_052635_783105_A2D65544 
X-CRM114-Status: GOOD (  23.31  )
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

Hi Billy,

On Wed, Jan 28, 2026 at 07:43:01AM +0000, Billy Tsai wrote:
> Hi Stephen,
> 
> Please pull the following ASPEED clock driver updates for v6.19.
> 
> The series includes:

[snip]

> - Reorganization of ASPEED clock drivers under drivers/clk/aspeed/
> - MAINTAINERS updates for ASPEED clock drivers
> - New ASPEED clock driver support

This changelog needs to go in the tag. Currently only 'ASPEED clk
updates for xxx' is in the tag.

> 
> The branch is based on v6.19-rc1 as requested..

Looks good.

> 
> Thanks,
> Billy
> 
> ----------------------------------------------------------------
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   https://github.com/billy-tsai/linux.git tags/aspeed-clk-for-v6.19-rc1

We are on v6.19-rc7 right now. This should be for v6.20-rc1.

> 
> for you to fetch changes up to dc345e213f16d3ae5dce01bb0002e46bc4eaff4c:
> 
>   clk: aspeed: add AST2700 clock driver (2026-01-28 14:58:47 +0800)
> 

[snip]

> ----------------------------------------------------------------
> ASPEED clk updates for v6.19-rc1
> 
> ----------------------------------------------------------------

Between these dashes is what will appear in the commit log when Stephen
merges this. Include the detailed changelog here of what changed.

Brian


> Ryan Chen (3):
>       clk: aspeed: Move the existing ASPEED clk drivers into aspeed subdirectory.
>       MAINTAINERS: Add entry for ASPEED clock drivers.
>       clk: aspeed: add AST2700 clock driver
> 
>  MAINTAINERS                            |    9 +
>  drivers/clk/Kconfig                    |   13 +-
>  drivers/clk/Makefile                   |    3 +-
>  drivers/clk/aspeed/Kconfig             |   21 +
>  drivers/clk/aspeed/Makefile            |    4 +
>  drivers/clk/{ => aspeed}/clk-aspeed.c  |    0
>  drivers/clk/{ => aspeed}/clk-aspeed.h  |    0
>  drivers/clk/{ => aspeed}/clk-ast2600.c |    0
>  drivers/clk/aspeed/clk-ast2700.c       | 1055 ++++++++++++++++++++++++++++++++
>  9 files changed, 1091 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/clk/aspeed/Kconfig
>  create mode 100644 drivers/clk/aspeed/Makefile
>  rename drivers/clk/{ => aspeed}/clk-aspeed.c (100%)
>  rename drivers/clk/{ => aspeed}/clk-aspeed.h (100%)
>  rename drivers/clk/{ => aspeed}/clk-ast2600.c (100%)
>  create mode 100644 drivers/clk/aspeed/clk-ast2700.c
> ----------------------------------------------------------------
> 
> The patch series can be reconstructed from the mailing list with:
>   b4 am 20251224-upstream_clk-v16-0-8c1318f56c3c@aspeedtech.com
> 


