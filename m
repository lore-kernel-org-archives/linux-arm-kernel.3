Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A43CCD484A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 15:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaLCuwVBpxCwdbLTEf7IYx3z7POJtFUK4DUpOB/PfG8=; b=YA8mS92oLWyAsm02cw4zEpEOX6
	Z5SYyBRqghguhKUOC6FBvfZOE7AVbwAkOI1iXEl/QVhua4MytZnns7t5QiNaaAzkLWX2fMQPXehwH
	zaLw1vSETti4WF2cgz5UHe7geP11BsYeVe65yebzyu8jcnfo9jgwAXNjMoPk9INBV061vEHHruPNX
	G1xbYrejNcq0pmmqO3Lg1krEhoCKc+H7DOi8VjfiNgjFMGlzjYdOxeEZ1Y+qyjtxwiL0Me5c9eTqQ
	9Q30yJll8vd+IeZXgRIiGQE6chsIanMpfrEyaHJPK4uNaHkfPBvnpDqYAkMJm5zpVlqbaHOBMzaqh
	CySrmUEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSqn-0000000E6NY-2S7K;
	Mon, 11 May 2026 15:47:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSqj-0000000E6ML-1x6x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 15:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778514436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IaLCuwVBpxCwdbLTEf7IYx3z7POJtFUK4DUpOB/PfG8=;
	b=VbCW3XVk0Hh23LYfv3UNoWcwRt82IgTYRNJjsDfPEmVCW6nTmNyhi05GwwSWRJ6DixxuU4
	2jkBe6gGezylzHY9+XukOyg0N0/hY6sXznc4Z++/KxVxyf2fyOmBgmvPg/jspfMdLPVTzz
	XywwdgFtOLSzk6vvlDRlexLXXCSgsTg=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-PxifXLyeMbqqD4K6unckAg-1; Mon, 11 May 2026 11:47:14 -0400
X-MC-Unique: PxifXLyeMbqqD4K6unckAg-1
X-Mimecast-MFC-AGG-ID: PxifXLyeMbqqD4K6unckAg_1778514433
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95d25cc8f5bso6486901241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 08:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514433; x=1779119233;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IaLCuwVBpxCwdbLTEf7IYx3z7POJtFUK4DUpOB/PfG8=;
        b=HvYApMHyLj/D8ef7R+9Q66f3y57nlF9mCx+ZXW9ctA6piOyAHzXlSf4ra9ikfMcpWq
         UDP1dx2BvjW8xuaGOWoGW58f0439wj6jgUCdi7GxiBuYtfj+Eta/Qqsvk09K7E1nS8EX
         wWUQ+7UsDgoQC4L2O/jZTjnRaffnA8gyE9oIPt5lKGzfQFZhh1PElGjjCZRo2sxrpjtW
         99q2QjLgyua/f+i3Bc0oHLijthoSlUBjS1IV+DC362a4H6OkK3PIYzNfDolt1Y/87OnY
         2+rZwZWtfPPAx+Ie/Szi6Iu6PqqUQA+5YyxaZqBkubX2BHmCOfZ6JKPttHHAxrEkeeXu
         7Mcg==
X-Forwarded-Encrypted: i=1; AFNElJ+RTnjeB5WzG37UVmHlYIr3u1noYQV4A6OSvbGJGQ4Mk1wajo/eTTssZ5F7t5hEZ8zmoCZoijZEZX9GF1RhGIun@lists.infradead.org
X-Gm-Message-State: AOJu0YzFlQX30C/7zrN+07ffmNAsVE4bCeaOybcIt2uCjfeh4Y6MRaXy
	gy8j4rqnd0WpNcvQYRGKysPy/Spy1xlcgKen95O/bdS0tZOAJKDP4WMLqk7HEBBS20GiX0LGeJt
	iU9M/X8pLhmhATx6EZUvu9TPu/V8uZZGR6XmfqS22mswBNT0hSd8LnWA1M9QGDuhMRfJUt4KAzi
	2j
X-Gm-Gg: Acq92OFmhA2qtQbSNRryL9TFBMjSMA5tRkMRA/z1Cza6W2nRz5hVV6RUp2GCp5sk4Mb
	fuusVYp2VLaRP5E8Ek+P9FGI8K388RGt59HaXS8fw4+wnSGuJcGQgZNjogIlDK43Rhlf61+8T75
	Ndp5BOzkYldlN6CAAD44Bekhedus5T5iYttPU2NYZCtjPuYMk0OLXmRVHLo9Eb6Z/tdLkgxrMw/
	ovoCtIavakvsiWjQWXaWUF1CX1q6s2BcF7u6ED+V61BqRVeWKamj1U/IedmVdvrzFoPemerCWjY
	+feeyFbxHnodvmrSisuHVjW6S1XKGh59c8HWubSzC6XAOcRGSa1yxsDkYqhinKoC94/qZTL6DSQ
	E+I9XbXJ45vNse3LtBvGEwAuzldO/7cavdXOxidcFpAjaRW4bN9pFCOSHToi2pmxtK3I=
X-Received: by 2002:a67:e704:0:b0:610:db51:6f3d with SMTP id ada2fe7eead31-631da02a2ffmr4546435137.12.1778514433502;
        Mon, 11 May 2026 08:47:13 -0700 (PDT)
X-Received: by 2002:a67:e704:0:b0:610:db51:6f3d with SMTP id ada2fe7eead31-631da02a2ffmr4546395137.12.1778514433109;
        Mon, 11 May 2026 08:47:13 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3b0c4c9dsm101224006d6.5.2026.05.11.08.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:47:12 -0700 (PDT)
Date: Mon, 11 May 2026 11:47:10 -0400
From: Brian Masney <bmasney@redhat.com>
To: jian.hu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/10] clk: amlogic: PLL l_detect signal supports
 active-high configuration
Message-ID: <agH5_mWD0CRIcGyS@redhat.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zXA-4s8hwsHGZTWq1aE8oDEgvbcvGrPhXFdPLjoKL_U_1778514433
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_084717_632174_4930BCC6 
X-CRM114-Status: UNSURE (   9.41  )
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

On Mon, May 11, 2026 at 08:47:27PM +0800, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> l_detect controls the enable/disable of the PLL lock-detect module.
> 
> For A9, the l_detect signal is active-high:
> 0 -> Disable lock-detect module;
> 1 -> Enable lock-detect module.
> 
> Here, a flag CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH is added to handle cases
> like A9, where the signal is active-high.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


