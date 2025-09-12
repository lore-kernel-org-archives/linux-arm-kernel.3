Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED13CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWnv1uPYTna1ts6VTb5bmSJ4gFzt0Uz75RWyORHBYho=; b=ZEhqOE90b01A7yJFAMSgPLZ7ep
	KT9AsGbTC3RnQvRAMK49YP9OSEj5X8kTHT+dhEsBbXA7TnF9Wue+w/ovkNEf8ewtkuZBGUrAkrjcA
	qsFEdyd304qqpskalYfqLfI+S0RWwvp32wTwl+C4nHUupR2pQMLbg+J/hicSn1aMUq+LDKF5v1uwJ
	VB/keQCdLNL6sSEJO3WlrAbsMB1R5Ed8uF2JCav9Umj31FNs2mPFWTlc8pKtH7TqJ6nzW8jlCfiRD
	twvKI5be3dyUwKDYBXlY3c+nfNJCYAqRhI/kUnvhbuZnnfp5Rymcy6cg15urWUn30bmV//foS3OKx
	7YDxd3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux56z-0000000A23E-351H;
	Fri, 12 Sep 2025 14:50:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux56t-0000000A1wq-2HhO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757688646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NWnv1uPYTna1ts6VTb5bmSJ4gFzt0Uz75RWyORHBYho=;
	b=cWboFxnO3+POHHYtgd/t7mR5Kt7Sj3ylEXOD2RrvCd28XG/A1OUmD5Nz4oX1MvZiBkgVbL
	JFz5rVJACU4d7+syyPWXUXT5XxP/dx1IVMn9EBJMzy4s2/MQ6u0P9pG0agTBBQp7w03i9U
	j40Cq+8rPdFTilIv7B5anAq5tdVmcwE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-X2237_LzOTOvzkKCmyd4nw-1; Fri, 12 Sep 2025 10:50:44 -0400
X-MC-Unique: X2237_LzOTOvzkKCmyd4nw-1
X-Mimecast-MFC-AGG-ID: X2237_LzOTOvzkKCmyd4nw_1757688643
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b3472b7efeso38855671cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 07:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757688643; x=1758293443;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnv1uPYTna1ts6VTb5bmSJ4gFzt0Uz75RWyORHBYho=;
        b=MArHulK2DhGkxSx8M/nBupqByEwWAq1c29NNtPDf/Sju1kS97BlNnv0y5Uol+0s8pn
         8xFTRb6zI8lHt7J7dsfkOOfKLDNkkNMJFDyMtDhZ1pjhnJFhr3mS8h+KMeSVw6BsgNGd
         FRbprPsoAs5g1kcceCehhWPhO4qJ8XygCO5cK+XC5cut7+Mf2r0eJsJUAfJjfUbbDWu1
         Pi3/0L8JoaweNIFyBPPf4+7PceF6dWGxPfrh9wqQ0/DiJV1CqI/qp1oaUqmOzuafYQO8
         s6Lza7hDVw0Q9BS1B3Q7gK2aMl6UkHr5Bjc5riIOhzp8PMr9kQcv+sz2WdDRXtYj8dGM
         aXdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1FcHdrYptFCAGVIFILKTSBo7jjWA7qyMwYNKRkgXUGNBr9MJf7LVM7aX6LWtJn69KdkdsTto/tZqC5S3LCzV/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywuui5BeS74Q89nkSdjLFbbefcytduGUiKMqJfTpjy+L2lixfKU
	7y09gRFOBONKMgPD/s6SZC4UTHK2qgiuFrmDC8bXbL9pXSPyTmJh0mKzDPDF5zOm1NNEjQCdPMw
	edw/dRPysaGTDxOAmYkUWijyRDeL5hQMTkcB5NHxLw+h2FqQvStQYCBTvNC9kGK6cwikubJ2/Bx
	nZ
X-Gm-Gg: ASbGnctSFFWJnrpVF7jrKHJl4QyXs8AdzwdAw7bDhpowyT8os0ouJWynqWMjwM4NbMj
	/uneRwws/8xkXkyNOOYPh2/FzIYc0w2kpCWDX9iahdRgWoga1NziXCKfhmGn0lNuKSSzQIWkKY6
	3H1kaTD52OdoUHipn5TTcSgxJT9KNbiH7tSQbFUVpcdxl0F6yTF8JAz2ooMtRXVhZJpMGmo4lRi
	RtZ9uvDZU0I61FwgdMTtRY4AJGCQlf2tQVnlhG91rY6nXKXfJqEBcSwyxzXp5ktTPKKiomir7Dj
	OGLVAnUkkR87jYIJjS5dX0zGDDwu0zSwPf4cOwc9cJT4GB34DK9AYEzMJN8ZywfJ47aD1Lq0tAF
	X1N2v+JzPg33RI0X8FR4KQPI62Qgvdw==
X-Received: by 2002:a05:622a:5c1a:b0:4a7:81f6:331e with SMTP id d75a77b69052e-4b77cb3caa7mr40317871cf.6.1757688642703;
        Fri, 12 Sep 2025 07:50:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyVIdYLjBKhorz3T0zQ9Rxegov6rF9Te/Pu4Zg+RAzt3WZQiqnmCsJB1uwM7uqun0gGUSs7Q==
X-Received: by 2002:a05:622a:5c1a:b0:4a7:81f6:331e with SMTP id d75a77b69052e-4b77cb3caa7mr40317551cf.6.1757688642278;
        Fri, 12 Sep 2025 07:50:42 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639a61502sm26238491cf.0.2025.09.12.07.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:50:41 -0700 (PDT)
Date: Fri, 12 Sep 2025 10:50:39 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/5] clk: Add KUnit tests for assigned-clock-sscs
Message-ID: <aMQzP7DamsQWl8_L@redhat.com>
References: <20250912-clk-ssc-version1-v3-0-fd1e07476ba1@nxp.com>
 <20250912-clk-ssc-version1-v3-4-fd1e07476ba1@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20250912-clk-ssc-version1-v3-4-fd1e07476ba1@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MgA6f5uFP-95RB33RAuH5Ama4q0DSNAGza5rZ5L2zB8_1757688643
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_075047_653020_5108B6D1 
X-CRM114-Status: GOOD (  17.50  )
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

On Fri, Sep 12, 2025 at 11:35:53AM +0800, Peng Fan wrote:
> Spread spectrum configuration is part of clock frequency settings,
> and its behavior can be validated similarly to assigned clock rates.
> 
> Extend the existing KUnit tests for assigned-clock-rates to cover
> assigned-clock-sscs by reusing the test framework. Add new test
> device trees:
>   - kunit_clk_assigned_sscs_null.dtso
>   - kunit_clk_assigned_sscs_null_consumer.dtso
>   - kunit_clk_assigned_sscs_without.dtso
>   - kunit_clk_assigned_sscs_without_consumer.dtso
>   - kunit_clk_assigned_sscs_zero.dtso
>   - kunit_clk_assigned_sscs_zero_consumer.dtso
> 
> These tests cover various invalid configurations of assigned-clock-sscs,
> ensuring robustness and consistent error handling, similar to the coverage
> provided for assigned-clock-rates.
> 
> Co-developed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

There's no need to add a Co-developed-by for me. I just gave you a very
rough starting point.

> diff --git a/drivers/clk/kunit_clk_assigned_rates_zero_consumer.dtso b/drivers/clk/kunit_clk_assigned_rates_zero_consumer.dtso
> index 1d964672e8553a90263af400367a2d947f755015..d62c7522c92461245d45f8ac0ebd26fa2850be98 100644
> --- a/drivers/clk/kunit_clk_assigned_rates_zero_consumer.dtso
> +++ b/drivers/clk/kunit_clk_assigned_rates_zero_consumer.dtso
> @@ -12,5 +12,6 @@ kunit-clock-consumer {
>  		compatible = "test,clk-consumer";
>  		assigned-clocks = <&clk>;
>  		assigned-clock-rates = <0>;
> +		assigned-clock-sscs = <0 0 0>;
>  	};
>  };

kunit_clk_assigned_rates_zero_consumer.dtso is modified, however
kunit_clk_assigned_rates_zero.dtso was not. The underlying test doesn't
check for this, so you can drop the change to this dtso file.

Everything else looks good to me.

Brian


