Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5286E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 11:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2G2U1r6MNxqXWHe+KrJPIT7PkZtApRJqJedGKd+iJpc=; b=fLivQjcPWRnJej/+vuClfwiZdy
	42YCEI8ynJZReZaWHoYTDkiAIrsZV8SEaAXsZ0F/bOgTqyxLxAAzxOd7wPpCP456aIHIl+t44leGP
	ZlWnaAmdz2YEv/9jN8LZ92D7DC+86YvL1U7Rdne1iq6hGuzRhuFJQVUYOCy0lAtJmBS58gu7jb0X1
	KZSiTFgfRFaxr8bRzM7dO1JvCCXtZutCaLgo2eb+A087SH/9s6qad60LR2HZtkHfEWfB8su7FVPlo
	2HPsg4pilzMdBb8gE3003mTibwpHWY/kTko4GzckJLZ6mvsw35ApIhuOC91VsfCDZyRBfghCX7PLz
	6jJ5QzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsfVs-00000009hBk-1N1B;
	Wed, 18 Feb 2026 11:14:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsfVp-00000009hBC-2yRx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 11:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771413271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2G2U1r6MNxqXWHe+KrJPIT7PkZtApRJqJedGKd+iJpc=;
	b=KUH+t7OV30HOSW1ruP/9h0J6ZNmhwQNOBcB38cwxwuG5AWWvsjvB/RSsqCL8RGbWEuKMyb
	IeFL4lR4T2YPNzQQt0/JaD+63SJG9RO/Hqb1K535BjV2A55pg3A1dyhUnwo6iKaenrLfss
	YCE59aahICRYmiTNioLuaROphAq3B4A=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-Apgj0eNUNmGXCJwfanwaCg-1; Wed, 18 Feb 2026 06:14:28 -0500
X-MC-Unique: Apgj0eNUNmGXCJwfanwaCg-1
X-Mimecast-MFC-AGG-ID: Apgj0eNUNmGXCJwfanwaCg_1771413268
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50335bd75bdso462791721cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 03:14:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771413268; x=1772018068;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2G2U1r6MNxqXWHe+KrJPIT7PkZtApRJqJedGKd+iJpc=;
        b=JWnPE+IoObOnhnkdAo5YZJ39yb89u1BF7j4vkJAyIxjF2UCHhrhkfVVJ0tqoc6pawC
         fWk+ipsu/8OytpGFIW/75pcp+HvJJIEvusMx+wtW3I+h1ce8lQP6O5K9Ze92J+5my5dM
         MidSbNb1PRMZckVbB5LZIfCI6qSBlZlRNsFSaGHPB6A92YJ/Ac+O5pJ+o47WITTBrE6y
         3dztXefz7VIu9YAEBprvWVIJPiOBhZxal3kO8v0iUeQv0ydFu6+7ODteUKvM0rOMpGDn
         YacLV0cqjPVznmKn29qLKoClrElxwW/xxi2kEHqcjCDs4uUgc9IDkVipLlQYACxJdVO7
         6vPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5T6ztUuESP81XcILZMGQTk8Av7U29brS0BSAIWAvWFgp/ZUf7PcN2TJpTDebpJBFQGXcOH4TH3OKJ1l7ffjuA@lists.infradead.org
X-Gm-Message-State: AOJu0YzT9hIPNFFzVs7lsbUvC2oJ3zRo2ZQf7ZWfOHkEMSroFyEc1C1e
	M/8ogc+NWMMGmPPdFGv9zzwS9jJCzH7S+WdPBBJqYuQUZaSASnAFgd3SwcPXZk/ejEnGoqZf9mQ
	PI4o2nYOOCGN+x7ZIdVGMlQBpSxG/mNUj8FxhT1gnekSFlxeZm6Aqa2PxHUWVLS+07ShEX9jLzU
	hj
X-Gm-Gg: AZuq6aILaPH00lXwbFSeWQE4JOsUKE0AkFBCz73ZMylo6zEMGfYWqOzHnhJAODcJ4jr
	J0ADi2JvadpBs7cvq/eQ8pHAde2VqKuAHCyLqlFy3AwmgiLyhUP35pN69NzyE98Hw0hug9O7MTp
	pz/sLFvMU0QAa0BylJBgg4okQZJA0bFX6HLNLOrqlDhn6grSG3s0fuvMOf+cUDkmMeWx9ZxIeqA
	Qx0dd4EjNPTMW7tvaWYdzxUjl769NvMQYkx+gwgo1YxDejBBJb6PRvZbTgVni5NNaIGbgetISQU
	DzQt6DUAL3nc6Pg78tCppHx1MeP8oCU6tcVktskeg+gId6Covk6s0K+qlgg20f3WqKlS9a/oXAl
	ltxChMgjw+L7lILtp2x83ogd3fcYg7+lGU5SIOwR2EnbNswY1lYmtwvc5
X-Received: by 2002:a05:620a:1723:b0:8cb:4289:6c3a with SMTP id af79cd13be357-8cb4c01f4e9mr1744950585a.74.1771413267753;
        Wed, 18 Feb 2026 03:14:27 -0800 (PST)
X-Received: by 2002:a05:620a:1723:b0:8cb:4289:6c3a with SMTP id af79cd13be357-8cb4c01f4e9mr1744947785a.74.1771413267191;
        Wed, 18 Feb 2026 03:14:27 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0e1bdbsm1749411685a.17.2026.02.18.03.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 03:14:26 -0800 (PST)
Date: Wed, 18 Feb 2026 06:14:25 -0500
From: Brian Masney <bmasney@redhat.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: aspeed: ast2700: Add missing NULL pointer check for
 devm_kasprintf()
Message-ID: <aZWfESmMIw-e81W-@redhat.com>
References: <20260218-ast2700-v1-1-2388e0fe3597@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260218-ast2700-v1-1-2388e0fe3597@gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r8zk3_Bx-jrEKHCxfpCgfrCRYZfVNfNudILNI_0Kor0_1771413268
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_031433_825567_C5A7671A 
X-CRM114-Status: GOOD (  10.84  )
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

On Wed, Feb 18, 2026 at 04:16:37PM +0800, Felix Gu wrote:
> devm_kasprintf() can return NULL on memory allocation failure.
> 
> Check the return value and return -ENOMEM if allocation fails in
> ast2700_soc_clk_probe().
> 
> Fixes: fdc1eb624ddc ("clk: aspeed: add AST2700 clock driver")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


