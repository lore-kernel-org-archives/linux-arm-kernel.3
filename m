Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82C0CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 23:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYml2VDxH0siTYU9ImG12BR4vPhtEsV9x6dMYi9DuW8=; b=xLs47MUmD6vlEQ5Yx7bGf28WX+
	5aWNnDb7P8jE5XRrLsq0ZaZmmYv6HU1Y0U+fX7GSZ6XrwhKvsGTmmH6Faw50/j+92pESOl2tmXdVz
	UIYmarSLrQlY1SupaWrGeJ4aZEEn6e+xK7z13LU4InvQrh3Ay8UXGsoVg90RQO0VNLjwG8YItL/yN
	vpzliNwpYz/3U+tw2sgdZ/2f1oj1//JB8Mm+eKVTT9PdnP6SbPWt3TMPukNIbN8vrkZijbqw4foLZ
	flAR06ycGSpMiZQvWm0Kzv0W4LDB+wxe+wmxBseFtJjAPE4Ywt6l+q7xTZRGed6A4W+q1a0klhP3B
	sh0TXxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6e2u-00000004qak-2BIA;
	Wed, 08 Oct 2025 23:58:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6e2q-00000004qaN-451y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 23:58:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759967886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yYml2VDxH0siTYU9ImG12BR4vPhtEsV9x6dMYi9DuW8=;
	b=bfeO5h5GlA1OTU2OTg5a8KZXJvBYCcXrFdnWRXaU4gKnxtvlGcUdwbzn42Ju/mTo7KDM3B
	CYUKCLdWfNiM39OZ1c3CVROE6t1MjeHve/9lmfGnJCUh7WwWB9Vc+WrVVOwSo8399QDZJb
	2dqY/t+QepgsrgZAx+cy36EmMXX8KKs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-8g9BFRJDM4KqFJRPPuGpFA-1; Wed, 08 Oct 2025 19:58:05 -0400
X-MC-Unique: 8g9BFRJDM4KqFJRPPuGpFA-1
X-Mimecast-MFC-AGG-ID: 8g9BFRJDM4KqFJRPPuGpFA_1759967885
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-829080582b4so131423485a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 16:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759967885; x=1760572685;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYml2VDxH0siTYU9ImG12BR4vPhtEsV9x6dMYi9DuW8=;
        b=TWzS5LcE6zkssMd0N3kaM8qZdb2MjDeUel44acu31YwVZImlDLN/1Z3hnZaOO3x6d7
         7bLeeFkXaUzKfsY/ey6a6+Ipqm8N5+TcT8ZLo2VGeqOkuw7cOfhCsUdgIRx/fp7mTthH
         lPyFUpOmc12Qf2txLJl2SNn9R8iKEWRVrEhG1S3ur9lDo+GxhfAKmWhUSt9JVWWOlmK9
         XBg55HH1PAtGh5zyf9/aDSB5t9ge4WQTbV0xNXXyc/8OOzt+x1QfFTkB7T5jKbt2nNsJ
         20mkUuom1NVwpW2PVtpzFhn4fDGh9b8mz2Yiits8BOyKsitn5CeAvwazNZteBkE84NfR
         h6Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXj0QZUWniWDr0UyWy80tcjNlVRXxdC2IVaC5+T6gTXrGOEsQZGoUqb6eOjJs6OXXynEgHENMR/ww1D+/KWwjHT@lists.infradead.org
X-Gm-Message-State: AOJu0YxwBZSECJdWYwTFzELehzFIy02Gxmikp27CcSXnfDnIsfLMbLay
	yW9WbARwHVKFOVcgXA+cnMTQzg4F7XnaBbAOl0qEJNlj2QplkNN/TGoLbcpl3kQxLmrMJqibNnL
	AMQKCv7ovzuedmGrkJRzg2x3mCuoSWsRVUSezlG/LSHLocNc0TjiuDCSHdrJGFW+rQGmXSOlK/R
	35
X-Gm-Gg: ASbGncsyHGb8rSXXDdqaBCXumbBnvwXL2+Yevt9oZB9SQO040xEjAMSd7MU9v61bFIM
	p3IfucSFrQ5TX6XLGl0bTlgJOo7iClwN8Oa3SUA/1rqYq0CBYHJm0ktGGnsuBPrme0cd7cwk+6V
	NeNftJmBQ9fbzGO7GUr0nl5TppINn1FVEAOiCaa2lEP3rGiXtBo0opMQXrLtgNWIxi/Eta0GEUt
	enKGmm0GckVN5E2ya3tsWC+i0fXwF4FYWGweIvQ4g20w6aGI34LH/+KFmMiE79MdnS5Cqf9ydER
	AHZN2DMAOeflgQIKsxkfa491PGmLAK2ORrgU97uXEvQn8VqN0bBVSzTsWS6U+GMNJvSA2hPLqjn
	DHutszLMAzJxcKpUbsksn77uC/Bxs/xvWclr/
X-Received: by 2002:a05:620a:2685:b0:864:1d18:497f with SMTP id af79cd13be357-8835088dbbdmr791584685a.20.1759967885067;
        Wed, 08 Oct 2025 16:58:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQXcFrO7Er3Q3mBDdQBcLXHQVE93CDbRMq7AeTkxsZVEPnKqRubMgwFgmWShVeh1oXVhT4lQ==
X-Received: by 2002:a05:620a:2685:b0:864:1d18:497f with SMTP id af79cd13be357-8835088dbbdmr791582885a.20.1759967884635;
        Wed, 08 Oct 2025 16:58:04 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a1ca3f2esm87125585a.41.2025.10.08.16.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 16:58:03 -0700 (PDT)
Date: Wed, 8 Oct 2025 19:58:00 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: tests: Add tests for clk lookup by name
Message-ID: <aOb6iNR9T4R9Hp3R@redhat.com>
References: <20251002092036.2504858-1-wenst@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20251002092036.2504858-1-wenst@chromium.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kHdpdoO_5TahjwqpgWavUqzzrrGqAYmmam3dvndg9eA_1759967885
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_165809_105449_F106D9D7 
X-CRM114-Status: GOOD (  22.85  )
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

On Thu, Oct 02, 2025 at 05:20:35PM +0800, Chen-Yu Tsai wrote:
> Clk lookup (by name) recently gained some performance improvements at
> the expense of more complexity within the lookup code.
> 
> To make sure that this works as intended and doesn't break, add some
> basic tests for this part of the CCF.
> 
> A new "clk_hw_lookup()" function is added purely for running kunit
> tests.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/clk/clk.c      | 11 +++++++
>  drivers/clk/clk.h      |  4 +++
>  drivers/clk/clk_test.c | 66 +++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 80 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 85d2f2481acf..a17d0070d11f 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -778,6 +778,17 @@ struct clk *__clk_lookup(const char *name)
>  	return !core ? NULL : core->hw->clk;
>  }
>  
> +#if IS_ENABLED(CONFIG_CLK_KUNIT_TEST)
> +/* This is only provided for kunit tests to test the core lookup functions. */
> +struct clk_hw *clk_hw_lookup(const char *name)
> +{
> +	struct clk_core *core = clk_core_lookup(name);
> +
> +	return !core ? NULL : core->hw;
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_lookup);
> +#endif

Use EXPORT_SYMBOL_IF_KUNIT instead for consistency with the rest of the
kernel. In clk_test.c, you'll also need to add:

MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");

Since clk_hw_lookup() is only used by kunit, why not just put this new
function in clk-test.c, and use EXPORT_SYMBOL_IF_KUNIT on
clk_core_lookup?

Brian


