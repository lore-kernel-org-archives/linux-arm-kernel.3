Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE032CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ffz+WS/kwatrVzg+MFiCHc5tqdSu3w6k7GM/epuJ1A=; b=W+f+5HYWk29ziwETFc3mD1Zk2v
	n69r+Cpd/7TdDJd8s4Sl+eWcPtXBTjzfUyrsnLL9BNPXLy0sRMetOJY8KSks0JcFV8WMQNdDesprc
	XNY2XhYbNsgTd6MsUlcmZ1muRHsW4syfojz7hYnCFb7LIcWo16YQ0KSc36VrlUm8b6v8NFzwJJFiZ
	CvTkbJNPlMuGubJ9XrYbG0lM2IvL99OHRy9oBesOzTkUQAVU+Q8RZCkpZhUP3gMw+L5elG6i+5zs4
	bE0BSq0dp+dmLHL87BlXu4Hn6C1fAw3z7e32zR4oqWHjFGr/dFMyK4+4JUZmeRF5d9lGA/izUZqmg
	jhLAqynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRxg-0000000DxIA-2azl;
	Mon, 11 May 2026 14:50:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRxc-0000000DxGa-3yi7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:50:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778511020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ffz+WS/kwatrVzg+MFiCHc5tqdSu3w6k7GM/epuJ1A=;
	b=O2U9rkPoT09HZR6iluK9qogCVVo0bPORrfZccQvxR7sxBQExXySnRFC3O9hqT7EWT3VPsl
	jtENEeD1oDITfbbiS5nzhJ4MW5ttVlave6eQMOF35tD5L1PY0V46Zwd+lw+4849SqLPPKg
	PksatqbV8QptjxlgCTlmJBBq/pLDM68=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-ABy0Jd7JMgaHW87ffTYZvA-1; Mon, 11 May 2026 10:50:18 -0400
X-MC-Unique: ABy0Jd7JMgaHW87ffTYZvA-1
X-Mimecast-MFC-AGG-ID: ABy0Jd7JMgaHW87ffTYZvA_1778511018
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514b673c8f1so44748451cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778511018; x=1779115818;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ffz+WS/kwatrVzg+MFiCHc5tqdSu3w6k7GM/epuJ1A=;
        b=PndDU658vgt4wPKksz1oYRBtsJPSoijZw9JisF9NTXgukTqaxZRcLgY8PzjO41RhPH
         StsiW3CfFCEPa/bjJrMigJLOMKk+Oy3GxZ/k3V6HxFKHNixmrhlczjrnCeo8U4u5YQVS
         OyhdUH769JyUkeB97Cx4wTfnVZVUYgy+lVkOU+qtfcOh0xTFSD87LCA2Ou7TGVQsKytv
         h0fgtPoURHvYrjMK6jP0MRY3n2aiIiDcbMhpl9aS/Pf6FRa17LU6K862hwXQkxL6AiBQ
         SywW611avdxctuCE/wwq+Aaz7mbm4uPj4AH5uLhFlMLRdUTsmmnYbthYBLnt0aDTNnqr
         hNxQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZC4Y7k99G2kBdco/5HcNfXU5O4+zDDeKxEmNF2hK2su4b8mGGVqsTlxEp0UqBWBWncli2MPXck0/gt6DjEKmJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyihUcqFhkv4zXofA99uIyoplMreLSjtb9cbK/+S4yQFnWCaq6G
	nARQF+uX8ulPUK/gLpIMXhix4BRgbIxRUZukEzbJ1r6cEqbZdQ0YQBXJKUv9llDXiq8A8hAKBqN
	h5VUkKVR+ymB+8nT0g0lFwRGlEdMVgabPKEe2meYOJLbOoytYc4JogNqiiplJgU7B81omPE87KF
	xW
X-Gm-Gg: Acq92OF8p5RtPfeEgQBLbREsvUPrTLAfKK3zwsormZOMHs3/itxsmXmefwbCwQzLika
	4lQvRkzSaaRwo5Rz48yOixZZqX+D7bru/myRZ1vaW0m9GtdLfCOItmbJ1RH0+frJ0UYQIck6zYb
	k6dOM8+LxXXcdQzhtclvtgSm3Ul5DUrFSxhe8llCZK334NO5c9oqzwXQojZHyCfOhlBPC0gwKOt
	Z7+/Fh/q5CtDHHVT/hHiYZ4u3zz1BOYOiXdoB5QnWZ6VDwDQa9TtQjHjgYYKRSCV4NAUmO6W/Rw
	6OZ/NwQzcGJPq4VTWuz9G9JXihU4m+gfjskgeyQ8rL1BSwchxDWHqD4GZHYLVWyI/9bxsSH6oio
	yEP76dDqof3k1mV7jkToAT6LhmiUpGW7OopT6lxnL3euMDWRUimdZ+Ncr7Nf6yu5Jc8E=
X-Received: by 2002:a05:622a:1b1a:b0:50d:8c8f:f94d with SMTP id d75a77b69052e-514621eef47mr364491141cf.52.1778511017833;
        Mon, 11 May 2026 07:50:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1b1a:b0:50d:8c8f:f94d with SMTP id d75a77b69052e-514621eef47mr364490501cf.52.1778511017330;
        Mon, 11 May 2026 07:50:17 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3a906e25sm95748686d6.14.2026.05.11.07.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:50:16 -0700 (PDT)
Date: Mon, 11 May 2026 10:50:14 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-rockchip@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] clk: rockchip: allow COMPILE_TEST builds
Message-ID: <agHspp1KZHZmMeOy@redhat.com>
References: <20260509003602.956186-1-rosenp@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260509003602.956186-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fMs2rVj-ErK_trTQcXCvcJ9i633c_eFMX57nnHigAIM_1778511018
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_075021_058400_4E56AD90 
X-CRM114-Status: GOOD (  11.09  )
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

On Fri, May 08, 2026 at 05:36:02PM -0700, Rosen Penev wrote:
> COMMON_CLK_ROCKCHIP already gates the Rockchip clock objects inside the
> Rockchip clock Makefile.  Allow selecting it for COMPILE_TEST and use it
> for the parent Makefile descent instead of ARCH_ROCKCHIP.
> 
> The per-SoC Rockchip clock symbols already have COMPILE_TEST dependencies,
> so this exposes the existing build coverage to other architectures without
> selecting the Rockchip platform.
> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/clk/rockchip/
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


