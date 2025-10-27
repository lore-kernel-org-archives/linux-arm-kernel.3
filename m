Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB24CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 20:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/SBV90iCKGz6XON109DoFy6Jo9KP1hBDt8Ha5ZIeUs=; b=DnAMSxKQwfaAdh28+Gc0weY3sH
	fGj18Ri3OAt1Uln3OLCyHuv9ITPI7FIuzkyzj6QXxzKP030KmTOYlLu/LTpJk6dgbnBe0M21q4fER
	lI2z4mAUeqIBoVLykzP5/HJjDzg8zdjuXWdlh/Rf17x9Ptg8cwDC9XkOX/YkzJv75ZUrMksPnHKaz
	dmb8y3d1RFMs/yOXLaXRhs0qZck7RW2Sr9DPMIlWOgpLadUzFeVYfGbiMTDeZtWxoh8CPq5Xt45i9
	b1UgwPVTVGIplCAJBe6FT1m5RtL6FnldOqdaqEVSgjqyd/9FAevN67xo/H/EZkN6+q5dglf87QbVL
	0hui1uOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTns-0000000EjTQ-0DOS;
	Mon, 27 Oct 2025 20:26:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTnp-0000000EjSq-13nU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 20:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761596811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/SBV90iCKGz6XON109DoFy6Jo9KP1hBDt8Ha5ZIeUs=;
	b=EMGLz+AYS+vgGUZJV8T7VtbGoQAzCaM7VokDn9t/naHm20XWuztcxBHmo7QW5geNydedPJ
	xtirCq1wnTloYTsEHk7y45SXDG5NX9vlaU1XijapsYeO9BOKUrlBrECfTVG7F44/oWqerQ
	5kbzHn5lQXsBqqZVJO9O4sY3D1mvdM8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-QTIAYO1VPrqzcqq9vNLFyw-1; Mon, 27 Oct 2025 16:26:49 -0400
X-MC-Unique: QTIAYO1VPrqzcqq9vNLFyw-1
X-Mimecast-MFC-AGG-ID: QTIAYO1VPrqzcqq9vNLFyw_1761596809
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8a1ba620dc9so568559785a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 13:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761596809; x=1762201609;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/SBV90iCKGz6XON109DoFy6Jo9KP1hBDt8Ha5ZIeUs=;
        b=ES5wo+/3KFSJoAzAquklVJ4MsRdJY2sdeb2RC5xelx0ddLObtVAZjAa3FvSOC6Fvmj
         ATKqci7sq3bc5aYGgvSnTEk0XrhwO7Dh2xK52K5A57yP0GIIn+zU6Qp9jVqNwD7mpBZs
         kNuxmHRVeavO1FODyEqGbKL/Nza+yiGFdQk1I2EFoYWY1MzepluN1Ax2bjYUJm0zsVKa
         q6llxCRLTLedeR8oO3xi7MWKJ9ZpFdTGKxCxraqc2dJxY5nW8O3mMiHdyWKQv8v3p4Dg
         6UJsy2w9sassGpl2V1tjGr6yQBHfrI93E8vHguo0YN96xQVcI82Vnez2aPzCDDIQKfWt
         RfJA==
X-Forwarded-Encrypted: i=1; AJvYcCXvXheBLr0XA8IqgabYPWRGRTJUaZ4hUgiD6WDHt4uZaNsD4yRbbpqfmaAPtZvSibt88Ffdu6aB1HFrz/xePGOK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6pBVqoudnS9OC1A4z4PZL6xqh6sdPWrK8vTTzuOGKO9b1OrcK
	L7zTaEBijrx2LPsGDuYPKIGz1/fhbMqfcdDPIsiYnCJKZBQO7Bio1MMDVSquGqcvPlx1nEaJlhY
	Pu4osLgSwB78O6sMRRR1wjNOd0y46+Kwq40u6S9zV9z9RAXpkn7K85Hx4obHduTJKEKXRLi2zzE
	NA
X-Gm-Gg: ASbGncuFX5prFC8DxLfq+xFYyX/R5cYvFtVrysvlzHLYumBMuzQFMmZGZ8Tuw9u/b/G
	FBQJnpxgS9/trUd8OtT64JUYWvVjsSqK/KQEsg9yuFLWFjtaJvZ70pJuS0t7uFsisGrhs8xA93k
	wh1cgAAdRmyceJe2kGJL8iRC9NdjZHJPQU/F2QXDrJ+j/JFn1eF/Oo+AIVS4fEojcs9J4s0BlyE
	k93D5WhgwooKLZWMqwfoUkEe29hU9j0dR2SHUTrtdzJkXpqKDDp3h8LE6FxxwiX9y/frLS/JB00
	yuZrcyfC+dBbXwoovk2AbCbnUQqUrKyt8CKiLG9qoHJZqkQWR4Ol0cgoqLYnZprEzFD6OLlmYAG
	siwpGxsc0hRCD1WlPDyvTGpSnvcKuWO83xGiKK6Hug2f37Zj/NWcvWsQ23baouTqc/g==
X-Received: by 2002:a05:620a:2544:b0:88e:6bac:92e7 with SMTP id af79cd13be357-8a7283cf657mr93234385a.44.1761596809228;
        Mon, 27 Oct 2025 13:26:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUEmCLFiys53M27OcwnIWGH/VtfZVuFONe30VKZoy1ylmoq5yRl+2RmIUCn1F3cGE5/JrVxw==
X-Received: by 2002:a05:620a:2544:b0:88e:6bac:92e7 with SMTP id af79cd13be357-8a7283cf657mr93230885a.44.1761596808648;
        Mon, 27 Oct 2025 13:26:48 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f24cd5617sm667155385a.19.2025.10.27.13.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 13:26:48 -0700 (PDT)
Date: Mon, 27 Oct 2025 16:26:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: tests: Add tests for clk lookup by name
Message-ID: <aP_VhHGLj3-JvgTB@redhat.com>
References: <20251015090701.2049164-1-wenst@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20251015090701.2049164-1-wenst@chromium.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gJzjzbSIkCLXHxXyNcYnH5ZHgPkjXyf2qVA3xco-ZqA_1761596809
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_132653_388059_A6F6E873 
X-CRM114-Status: GOOD (  12.71  )
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

On Wed, Oct 15, 2025 at 05:06:59PM +0800, Chen-Yu Tsai wrote:
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

Reviewed-by: Brian Masney <bmasney@redhat.com>


