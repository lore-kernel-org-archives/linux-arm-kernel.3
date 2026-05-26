Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10948CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 22:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTo+rj9jPpTZ6MzOUwsfpt4ByYvJX/zAd699vG59KFk=; b=TOJ6AppKCFO4FgRHVrEktgvv9V
	Le7X/xUXgWWAjZnT9tC9QbG4i7Sb/ZiaYgVDVxdak1yrUrWcJ00sHd2OBMBLKzAZ/uXH4tZC+MeDB
	FEBb+pvkjanZhF+vZDw9ixulso1hDEXg+iR+bt01PSvQrAen8N7m30Nkp/p1BSsjlGHLHy3RGAC6z
	4lYBbv54D4nKs/3zp2tgCbIpu+cVJQ/AgZswCrkJyRfQvNXAu9rmYsdReYvMp0Bh3VLRKk8Ny0FKC
	xeButthMBcyr+9quytD4V/piFtmLxEKn+/jUlWS4qul0qf7vVaVzQ2NvdQsvvgVjCVcumlmJJpsCn
	fe34kvow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS0Qd-000000031pN-2aT9;
	Tue, 26 May 2026 22:39:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS0Qa-000000031p2-1b56
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 22:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779835151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nTo+rj9jPpTZ6MzOUwsfpt4ByYvJX/zAd699vG59KFk=;
	b=RnW0B3aGdvMQI4Ey2x0ycnR1gPvClDLCXVAiKyEMjjt/YsPbtNGmsonsAYB8cw/Rha/AKI
	Ba+xcWxcfZ7A5zu6ICaB9JkYUGxgRwSPg9f2PaK2QpHwQ4oGhXsG6T4/zilP5fqt4MzXYk
	WV/DfVsaIBS96u9wTvENjq7x8WBrLec=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-3RWqZHLrPB-zR9zL4i6hCg-1; Tue, 26 May 2026 18:39:09 -0400
X-MC-Unique: 3RWqZHLrPB-zR9zL4i6hCg-1
X-Mimecast-MFC-AGG-ID: 3RWqZHLrPB-zR9zL4i6hCg_1779835148
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-914ac72db7cso646490585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 15:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779835148; x=1780439948;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nTo+rj9jPpTZ6MzOUwsfpt4ByYvJX/zAd699vG59KFk=;
        b=eYY86I4DjXX0qodjW7m123b0DjfEz3z5/+xE+Q57DN69zuwUfWsiioVOsJE/dWkOt6
         7aN5ek2+O2BnomHy1xy4A94gJiAYvrN0dIfhTBe6a/oBgSLaRBHyWC7q1uKklY1gMtZh
         zgM9rv7M78jmSqv/7CozKPjTmJdg0cdB6/W+Pik+VYExsRQw7ngtfJdx0XCiliv59t1v
         vsTFV02v5aoBb/Z6S80unWgJ91G2ORTr0divhDe8YyJyUAPc5xoXzVDxKgTzhPXTGb0H
         bpo60ZOPYFEklZobozBBwiN1K2721fBITNNC6zmolcCwZL/zuYxBmkndx8KklZTMp/De
         7daA==
X-Forwarded-Encrypted: i=1; AFNElJ8PETcAuBugvhDkaOVyC8936FT//w+0zpBUwELNp57lffgHy+I6WFyBw+UkQoa6YKsWTGVNkYg8/fhYbqYcpZ1I@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7wldR1eQgnqR5pxulCmIO9FbKMKPB4SmucV/uneEUC8RCEmKr
	BXconCsZd/acUQFeFzEarKVh/AnhiTW46lFf+Mk0luNma2OWCjZi6nqPQIwuQbRWv0imOKsXZc4
	zKFFFuvUVE0Ym8RrZ1GJtYi6UsTNrO8BCmWUF30i5Kjhzo+hHVgy7pfy9WjMFYKBLjQqU34lGtA
	WJp+IubTU9
X-Gm-Gg: Acq92OGKA40f90Wbk4ta0fuYpW4+FjfoVV4y/jmXs50pz24Wmb+EeX64rsMu6Sg2Y4v
	A24Jcy1zboY6LnEbLu3I0XeHhr+o/Fajd/wU5uXCIhWOsRYHVXmd4mnb+ni2AHQyLr3mhMtAfAt
	Tb5XDB7tzqlyXWoyiNcj7ls4ruHbEca+apNwx/3w509pU1PC3ZY1eKnlWUPORHlIw7VwcBMaOK5
	iBj/147qOq3053yhPp1wigCrsrZjqcPieB4rdbCksHir88iTUbcMBKQX8jsytXWk2s4dKUx7/wD
	CoZVuLJRnHr16sMTsty+sxg1lQTSQd9lyXA5AMt1LfvI0QSpeu3AUj8+Eu8M+ynFpTpko4MLupL
	CUMZjKhze/bW4vcv55clb2ryAXVNkIs/TL23b+P1vzNelDZ1HvqUnDPEAXLP21OwpsAc=
X-Received: by 2002:a05:620a:690f:b0:914:cad9:fa2b with SMTP id af79cd13be357-914cad9fac8mr1968269285a.55.1779835148468;
        Tue, 26 May 2026 15:39:08 -0700 (PDT)
X-Received: by 2002:a05:620a:690f:b0:914:cad9:fa2b with SMTP id af79cd13be357-914cad9fac8mr1968266585a.55.1779835148050;
        Tue, 26 May 2026 15:39:08 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f8713144sm314985185a.21.2026.05.26.15.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 15:39:07 -0700 (PDT)
Date: Tue, 26 May 2026 18:39:04 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jonas Jensen <jonas.jensen@gmail.com>,
	Mike Turquette <mturquette@linaro.org>,
	"moderated list:ARM/MOXA ART SOC" <linux-arm-kernel@lists.infradead.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: moxart: remove unused variables, fix refcount leak
Message-ID: <ahYhCJ_ShikWTVc9@redhat.com>
References: <20260526204227.23181-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
In-Reply-To: <20260526204227.23181-1-grandmaster@al2klimov.de>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VBYFnfivaSM44dyyR7m2S5hJjOLTMLPA_0bfzbpzQ9s_1779835148
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_153912_492995_1A4A3FF5 
X-CRM114-Status: GOOD (  11.67  )
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

On Tue, May 26, 2026 at 10:42:26PM +0200, Alexander A. Klimov wrote:
> Not only these error checks are redundand,
> those of_clk_get() return values weren't cleaned up via clk_put().
> 
> Fixes: c7bb4fc16ead ("clk: add MOXA ART SoCs clock driver")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Reviewed-by: Brian Masney <bmasney@redhat.com>

For the future: Include the version number (v2) on the subject, and include a
changelog below the --- with what changed since the last version. You may want
to consider using b4 since it'll help set this up for you. Plus it's a
much improved contribution experience.

https://b4.docs.kernel.org/en/latest/contributor/overview.html

Brian


