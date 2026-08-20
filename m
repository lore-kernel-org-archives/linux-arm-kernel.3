Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BD3C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 15:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJnamaX6JlRGHuZ8sO/4OG43OjrZQHiP9rUJ3vO4bbE=; b=wZd0ZJTPncuCrwY5+mxhiAKLVL
	LheXKuoclDZepF3rajVQYtUrLuZ0t36WjIYh7P/sF5/Dgtkxpb2pKdlz5osrEMBGHCMSWgC1xcNDe
	aiSRyBQWHqVTIm33vlUXnIWpz3+jWtson08FBK8k5jMe0wbuojMJv00UUdaIV+jpC98SwIykFx6Bk
	MFRVMYflQioK+aK0mIHqjamtaAyTBCXIuGq5pY9Bt2GCVbvCElojHkM3AmuywtvCSN6cAFED50VZc
	A2rFvx54JAcHxJiJValGtv3k/vSykV2O1hFejB+8eOXeDRCq/+/NlvvBhfNLm9lISMcQEQMDlwzie
	sBKXbcPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4OB-0000000Bm1o-15qu;
	Thu, 20 Aug 2026 15:09:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4O6-0000000Bm1A-2IxC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 15:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787238541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gJnamaX6JlRGHuZ8sO/4OG43OjrZQHiP9rUJ3vO4bbE=;
	b=eSUKvD17VuzFt1ezUoDVi4h+Do/v8u9+zB6iK0qbYxGUumLhub2eEHBGWcfKtH2lIXxCSk
	uIplCUrsgbw6lQcY+BMRvxRq8LJtjZUdOczMO7fUgQ9D8LL9jrUhVZu8i46SGTRfUDk+NG
	8uzA6jk8EYlyQSE37EUUP9fpOzF1Ank=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-vaoBK-uFNTG1Qz7cz5VFNg-1; Thu, 20 Aug 2026 11:08:59 -0400
X-MC-Unique: vaoBK-uFNTG1Qz7cz5VFNg-1
X-Mimecast-MFC-AGG-ID: vaoBK-uFNTG1Qz7cz5VFNg_1787238539
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836cda1b76bso99132017b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 08:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787238539; x=1787843339;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJnamaX6JlRGHuZ8sO/4OG43OjrZQHiP9rUJ3vO4bbE=;
        b=F7dbr19g+3aYVaPZuTkrPNcfhecvsXswha1F2ZIyWVbMj/ak1hb5PvOYaTcdB7xVnQ
         0ie3+4OC2wxZAoCPwlo5Zb4/nGnCTfnfBjc1V00VEGM2kFWkJZXat1tQlU2TU9NOEHpP
         I+uRKXD9OIJk/maLWMYShZoUqdt0xp0uN2JbpNmQxX3IfrcPED58kipPEMqKSRiHi9Db
         jXBrxmMxlrOkzenAVWT8XvB4UdIxJRyXjEh21fXyIMbUYbzDoRuwcqzpvKa2nojvMROt
         QBxoYi341zyIdkAd+W85iGRaDSe3GgTnDiZkVUu0mzdcKQ4Tcxnpkt/3jQIeWRRvEocY
         Kn8g==
X-Forwarded-Encrypted: i=1; AHgh+RrzETBAjBEqThiwaGlJUBO4gZew1TYM3P/mrJdTrQSgwpaAR+7Mn4REjrQUgQl9ExXGjibfTa2G0StfyJOH+P3k@lists.infradead.org
X-Gm-Message-State: AFuF++kdIGSVlY/InVOv7JOuC4VYap0rrJj1A4I7PjlF76O7Et6+ekS7
	D0uDmOU8VggNjGXxArk+trBodnFxe2Avgtz9H4l9t84z9l+pCLZOu6qb2pUrS7dSAMEsPUZs2w4
	LksKDNzAhxKuyiiq7wG6L6VprSsCkNNGXyCdvzaJ3OzLb/RnNUiZYDBa9mFtfHVSBrnONPSkj2O
	n0
X-Gm-Gg: AR+sD13+JfM4I675hHlcbUBgu0BYP1OfDBPnBcSYIz8e714ac1pslRruosDVGzRSSbD
	0MTbVLDFDZLAhO/VjJ5oBQZYXAICWWSCDYTTG0afTwSTg+htQlgiAbyjIpLQokOzN7wtx/hmPYo
	g/lKghMVdotWu/dqwdgmS0TItHGk1Z6eEhMCYKyflMBXfmuvAdRXX3DAibBFtoI34FUaKuNs4L8
	bUdzlGlx+u+Eqhy3dhlsiVAFsPib8yCWX96IxU+xn9O7LjnKH434KhhaKl7k6WZMFsiXPzZQho7
	n/jkW00x5rFjRXvOSw4tMtJ9Gdi/yEAUcp9xndMwvVdCyEWZF8QkDQ61Eh1JbD8jtiWSH43DY8P
	oMb+YUpeh1uqMq9N2JLONmQtbzk9IyJlH97E=
X-Received: by 2002:a05:690c:c59d:b0:81f:3b6d:a0a4 with SMTP id 00721157ae682-844e3d5d5cemr41714137b3.25.1787238538961;
        Thu, 20 Aug 2026 08:08:58 -0700 (PDT)
X-Received: by 2002:a05:690c:c59d:b0:81f:3b6d:a0a4 with SMTP id 00721157ae682-844e3d5d5cemr41713897b3.25.1787238538408;
        Thu, 20 Aug 2026 08:08:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-845186c0dacsm26600967b3.36.2026.08.20.08.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 08:08:57 -0700 (PDT)
Date: Thu, 20 Aug 2026 11:08:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, luca.ceresoli@bootlin.com,
	krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com,
	michal.simek@amd.com, shubhrajyoti.datta@amd.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <aocYhz_ASVhW8zfm@redhat.com>
References: <20260820065904.2032536-1-triet.hoang.dev@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260820065904.2032536-1-triet.hoang.dev@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xUz6vY4kvo11FtFgYZxYHIKpf7xOnamxExkf1cex-vE_1787238539
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_080902_661251_00B730BB 
X-CRM114-Status: GOOD (  10.21  )
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

On Thu, Aug 20, 2026 at 01:59:04PM +0700, Triet Hoang wrote:
> Convert the deprecated SIMPLE_DEV_PM_OPS
> to DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().
> 
> This lets us drop the __maybe_unused annotations from its suspend and
> resume callbacks, and reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled.
> 
> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


