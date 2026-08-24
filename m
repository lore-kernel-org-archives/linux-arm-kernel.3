Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43422C5DF9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MIjWVFV9tiFSCvKJHotyKhr1YJnlwFE+nvcQBHjOak=; b=0vH1mpJ9wG0TfERy0RBEdq3SCz
	5Fl6PuTsJW3f6btvy1+3Pl7hq7fORfHhnkHwQGgsC0048FWzCs4lDorKRc79yDopCQ+0AtZvMouwp
	RremOB0eMRAMIFxJeO0d6JnME1Rl6gDoLIs8HlTJHBaCCdWaJmIBhUAWOjd2lObc2GgzaUh2gAJkX
	znAeUOl6SGVRArZvSSsEc6ONAEb2oCXpm8elDcp2OgWkvLGb3C51IRKolcCcBc+9OBlN/iXFiZnEl
	ZQDiM5khAdM7DC0c0qFp08UH6y0YLldZsEKZcWY5hPZmSBAEI1gfCKkDk2jBbK6U5IjyuJ8BfFkIt
	il0ev9hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWVj-0000000GubB-2VhU;
	Mon, 24 Aug 2026 15:22:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWVg-0000000GuZV-293Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:22:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+MIjWVFV9tiFSCvKJHotyKhr1YJnlwFE+nvcQBHjOak=;
	b=KKKx8dRxSYqpmAHArSMpwZ99gJ+kTGo2mfYrtRUGinsXU9jgr9tPyLBkIF6j7RHH9htuJB
	eYLbxJTyl/kL4rtUaNh+Xc9JbQD5ZAqU3rFKnAZcWIN9tUh2zim0imUZSHgbE7LnEjCfMC
	txA+aqBe8YvCY6JA0hwCLtYFpos6dKk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-pCgy9fWLMn6_U6aRwewLwA-1; Mon, 24 Aug 2026 11:22:44 -0400
X-MC-Unique: pCgy9fWLMn6_U6aRwewLwA-1
X-Mimecast-MFC-AGG-ID: pCgy9fWLMn6_U6aRwewLwA_1787584962
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f0f45415cfso35806566d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 08:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584962; x=1788189762;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MIjWVFV9tiFSCvKJHotyKhr1YJnlwFE+nvcQBHjOak=;
        b=gw3CeqkuQl3WdkFBS7BQhQlVg9sXDId4hQoaMKCRYRgPsPs70T5a5x78NSypp5pe1i
         xLwd5r3s/Ce6EODxh7uQQ7ZjV2C8l5knoHVwXJwcx+11skHPh3jRasv8wr8KWqsSnJtg
         2GKKvuNUiAuMaSYVHdhk5BYoHjpFvI4YWhSEDVUm+t8KOakLWrQxCsD7IiN5bupMEmkZ
         /Ugo+Cn83UntBRbDSiN3fzoXcTmlySVowwuYEv/RXY89QNFbIEmSNY6E/ucYfuzBWCcd
         nZnrVwdfs8hggcEmdFarE+gnEEwMiGirxBvYWjHPlB3aRvGTjQ6zgqO0X4WwxZ3ulzXV
         2DuA==
X-Forwarded-Encrypted: i=1; AHgh+RrZH8GytDDny5SkEXrAt7Q2wgp42dSR8K/sPadChwA47uC11nPyOiAS49Z9glW27G/jyNwxiF/XEDXP89NuyLcn@lists.infradead.org
X-Gm-Message-State: AFuF++lwNRln7pwitjbAK7sPLwjr1M10gH1etk1LpmfnaZOKWO7b9nHD
	viGe1t63Jra2bFhhR1x1W18C8ZBd1a3ySQq6iLwQrkGMseemi5hK+itRnXNPGi47z42lq7tCGTB
	ATfLAizMIgFxmDEXXKJh0kSJ/D9PXRJ9FpINjt5KiK6imKn8p59I3fXDGaOI9lmZRlld9W4iEOL
	KNzUln8ZvXRvc=
X-Gm-Gg: AR+sD10dvGVWPQTjBbpITDjXLUt85dZSJ5I42S8k2mfIye048zhzNj4RsTeilQOzo+h
	E8A/s2Od/h6x3gX17myfpL7UsL7odtG4Sl3Oz39hEMIAZBViMZhSN4UgQdmZ7R30IYor25JMaBh
	zc+Q5b3/uscS+x9HsuoTGccbDbfJXVlLBLgI+84VcaESVgYgcfV0mlE2K+ukwM7J+Z6mV0ybRpp
	SSX6dtnagcm+IV3/mjXQYcmwbzzebMhPJDTWij+u3NkDCS5lBEuihKewfHa2mk2RhXEw3enI7Po
	W5Ylfg/5ae7WgP/qJ4q1LGSArXDrd16yPkPk2rvEGsi9S7cwoFZzc8h+QM96eWpUxYME5IIMLT0
	m39jjZo/ykxThv/pGRhL8uXfVvwWDSblP7Yo=
X-Received: by 2002:a05:6214:4113:b0:8df:98e0:4594 with SMTP id 6a1803df08f44-90c80c5c09fmr261568956d6.15.1787584961611;
        Mon, 24 Aug 2026 08:22:41 -0700 (PDT)
X-Received: by 2002:a05:6214:4113:b0:8df:98e0:4594 with SMTP id 6a1803df08f44-90c80c5c09fmr261568266d6.15.1787584961110;
        Mon, 24 Aug 2026 08:22:41 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c9393202esm65746196d6.27.2026.08.24.08.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:22:40 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:22:39 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ulf Hansson <ulfh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michal Simek <michal.simek@amd.com>,
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] mmc: sdhci-of-arasan: Make sure clk_init_data is
 fully initialized
Message-ID: <aoxhvzXB_Cn2vExX@redhat.com>
References: <cover.1787240090.git.geert+renesas@glider.be>
 <0235d3a3d5b71a125eeff6d7be25ddaec80ce539.1787240090.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <0235d3a3d5b71a125eeff6d7be25ddaec80ce539.1787240090.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k2THPgYXfOacNFIjFxgB30jT9mCs24hIniIf46hO64s_1787584962
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_082252_651396_6FA2E316 
X-CRM114-Status: GOOD (  12.54  )
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

On Fri, Aug 21, 2026 at 12:06:04PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


