Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2152610D14AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 13:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6kH+88JrqlfOND0jjbov2Nsohrt5nnjk0qLVmg5Ovw=; b=wgB2kPDuReI7NfpjqgqBUOe0kx
	TbbROeR0s3sBZr0n6cRzV4KF7tOx/m1tVA+qas1ts9u1eX3WjosNiPrNEmyOZehGTD8U/M6h2/ZGx
	mKHiiLQcm6+FXfbDtRRbQbYlCYfXlt42sIJ/Grb1cI2KgjZyuE6wlTB4YAc/9r3QEDWW1Z3u639ir
	0IbXxgVX/tM+caaglqq+TTkUwUoZYPKJX4Fii+Sg+qsKCKGpo6j+/vJmhbEzz/fAh4KMYhgtYyfHK
	cjIdlnhNY6SnvixXIB72PAWW16DvUhciMX5clEWb2vAeXW1wm1Vf3h9Uuzs7jj06fqLun+eD5nFE2
	tZTy682A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7COQ-0000000BK1Q-0gqR;
	Mon, 30 Mar 2026 13:10:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7COM-0000000BK10-4BcW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 13:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774876254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N6kH+88JrqlfOND0jjbov2Nsohrt5nnjk0qLVmg5Ovw=;
	b=C0O90PfPkhA3IVYPwUlsuy02iPuuVkYnsR/EX9AKxfcKlok7UtA9zqu1DVXXfoNcr6lFjH
	LkCl1IkiV14p6QO78QdTN98vIj58vizY57R8gOeSwUvpX5pAMFikVBm+5Y3i45HJ+FEmmw
	W/h6uhFDNQqDEdIjc1i92qLg63qy2sE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-DYStXBIMOiCOFJ2OIaN9ig-1; Mon, 30 Mar 2026 09:10:52 -0400
X-MC-Unique: DYStXBIMOiCOFJ2OIaN9ig-1
X-Mimecast-MFC-AGG-ID: DYStXBIMOiCOFJ2OIaN9ig_1774876251
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89fa878662bso85186366d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 06:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774876251; x=1775481051;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N6kH+88JrqlfOND0jjbov2Nsohrt5nnjk0qLVmg5Ovw=;
        b=iee4E3xxilp/WWYcz3zANj2zxieyndg9LnYcEb1MGriJAFMqLUA86HsRg3K5SnHa85
         75IeU5dO/q/J7WG/JXq+Z4XC20XINewFUZe/TKT/vkUv9+8aFDmQcQ2G/jB0jp4d9evW
         mXulRyGMjJ1NFRIf+2QIruze9Nl8MQRbYD7Q7Vu/YsG1PPbwT//dvQZQVGHSBLjce9LV
         FSDxyUCVPFHa+DBCnkrEwKemjScAe+2oNrVokgrlUXaJkpoBLWcbMa7OyIaVSzEEoyAT
         qqFEsrAM7aUmh5QZ61FMjNsGnZirnRdSYBJYyvi5XvnAKYh0mz0DsngfCzA2W8PC1w6g
         hNEA==
X-Forwarded-Encrypted: i=1; AJvYcCU4lEfzM+6sxAYWHR8jIm8Y+nqmpGE/ad6lhnqZpT+gUjrDAqezELj06ZfmC2/XL25f5o/IolRltRSxSz3aOn4G@lists.infradead.org
X-Gm-Message-State: AOJu0YwMudkq4tmTObsT6vFR+g2VWD0+/gWRWCugA6wIyam9caVZaFhr
	Q8d37NPA+UDOYgBG/+w4R0fUL6jXhUq5uP5ueoawnttu0IGXGYz8SeAt13Vzxh3Zoa/XYP19cnC
	zsTiVvTYz3dgIVRvHEPqvnNRIsBj5wQGqK6K4BVpKnRd04djVUoR952kE76ahX0yE6+hih4sOZU
	3JPLzedeQV
X-Gm-Gg: ATEYQzwu6gjRAizftdRpzpjWA94einvksl1Mw4vgeL5NHa2p75/QPpadAipXBaiZtVZ
	m+FmNJvfN7N6x17L7cSV7Q63yqYon2fvkFde1Jx1t0x7p1ElQJzDl2wQ0BMXlT6Dp+77HPKql0e
	+7EDPqqNJRtO72WhJkaAZpfEqkmsU5lFVpEDCUhjC4lYVu/OgFaNOAKHERocaj/ZfDJd/oApk+C
	fuzMiS/zahoaBjS7gnUztxZfjtXLI6xjOlforsWKLQJz7x1ZTv3x+zLiCbuCQ7yiTcBcMgyyh5l
	peWLpXk8JTHxsFRHEZBCu7Zzu5gTxqh+cNrbR1gLNo4QcKRW3XamIXUyw4JVm8OUpsDWH/B0mGR
	fee+47fR1tcpYEDg9+ZAHQqrxXzoeTuvswMagcxtCSDvdYTsdfQehLdcN
X-Received: by 2002:a05:6214:4402:b0:899:ef63:9a86 with SMTP id 6a1803df08f44-89ce8cbd43cmr195601096d6.7.1774876251541;
        Mon, 30 Mar 2026 06:10:51 -0700 (PDT)
X-Received: by 2002:a05:6214:4402:b0:899:ef63:9a86 with SMTP id 6a1803df08f44-89ce8cbd43cmr195600246d6.7.1774876250830;
        Mon, 30 Mar 2026 06:10:50 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecbda4d50sm61748316d6.15.2026.03.30.06.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:10:50 -0700 (PDT)
Date: Mon, 30 Mar 2026 09:10:48 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: bcm: iproc-asiu: simplify allocation
Message-ID: <acp2WE84FJ8Ts6Cq@redhat.com>
References: <20260326045324.240150-1-rosenp@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260326045324.240150-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aLZaihSc3HbZPjLF271rCnmQBtrmxrQBvAbrIBe9t3Y_1774876251
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_061055_155423_69DBC3F3 
X-CRM114-Status: UNSURE (   9.18  )
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

On Wed, Mar 25, 2026 at 09:53:24PM -0700, Rosen Penev wrote:
> Use kzalloc_flex and a flexible array member to combine allocations
> 
> While at it, take clk_data out of the struct and move it into probe.
> It's not used anywhere else.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


