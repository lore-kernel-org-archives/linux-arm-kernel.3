Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAE7CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ic7zvcyBVtaZcEmsf3hW05wAfmOMNZ5JL2VpkYQoXsc=; b=1F+uyhsF+5BI4yd6eP+q88uw6J
	/ayBIIAbuRYoSYQPNA2xQLzhzYaY1BeTUbemU8rAvnyAU6li4+bwRUkTvS1jPDInBIoQHJgrtY9A4
	Qvd9xB6wh+5sJpZXDJ/NhwUj1xko7siZpYRVzX2MDJCl4euycAwXlnqqTSOvaiiSVEby0B5Vjd+GW
	LL5mrEMP8diaMSEFBrc6fOPNPwcSHHscZQcEHT0cekee279tZluG7Q5Wd2Ghovvx8QnPwUcRJu20m
	vRvD+GlXQh35SqoZ8V3zbSvbsIeazBXF7+JNrNyT4linPuVRUGJd1QUqeBhBiAo0afpeC3NZCZyxz
	ihh9kELA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RVC-00000001JLk-1ETk;
	Wed, 24 Sep 2025 15:33:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RV9-00000001JIT-12NQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758728029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ic7zvcyBVtaZcEmsf3hW05wAfmOMNZ5JL2VpkYQoXsc=;
	b=Nx76Hqnh6j9u6u+tzjNKeSDmdYzRJOm0NA5DcAdvALiNU2sttdKSdlSi8SfnZZEBpzUaFw
	wWEVbLJuBqcHreQitNRC9010yNj3a8imxkxQBKun7NYr1/AW5nQXibArU4esenX1l81H9a
	E47vtCGfRXN/RlzB7xhiIPnkNC9twsY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-sOtRIiydMru6HgKE-S_0ew-1; Wed, 24 Sep 2025 11:33:48 -0400
X-MC-Unique: sOtRIiydMru6HgKE-S_0ew-1
X-Mimecast-MFC-AGG-ID: sOtRIiydMru6HgKE-S_0ew_1758728028
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-856d34460a3so2804785a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758728028; x=1759332828;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ic7zvcyBVtaZcEmsf3hW05wAfmOMNZ5JL2VpkYQoXsc=;
        b=ppY9Xf0QRx1HfawvUCI/9mcH0bNrFFc5O62KSq/rqfiIRQ6T6K8e1XIjJLMTdUNmpI
         OtR0BOGKuvSNQqjKYT3K5UFra8dPC00+zXfxcIiAq7v26elQbfawEs5fEDxH67jqstWZ
         Vir3ToW8U5hCbMblP6m7wrjSBCzjHYV//XL75VldANMLve09vFg73SpBRMgYIGdr6q85
         EURmkYT8rqic4DcIt7MV3oOx0HaoUqEy82KqcMvia8Qd4G9XcN/H2RkANPyfP9aGabHP
         VD+ol+mburqe13uU53ARHN9HjXPiUo/rnRh/+M9UsHsx1dLhyA7mp736D65qfE3r48lW
         a0ug==
X-Forwarded-Encrypted: i=1; AJvYcCV4ZcpyxBIKo6fTdDCV480OxO9GK89/RnjwaaKWhUw1PKuui90Bc9bMwA0oGDlA5ef451d1ESurOfUUjEZI8WVP@lists.infradead.org
X-Gm-Message-State: AOJu0YxqhvO9MAyaVCuEoarv7e3JhVrgQaGpDI3SU3togZkLLRyYAyeQ
	w9uP1kXmhsKfpGi1iNx6LNnKGmD3soi3nMJGfQQ7QJkKHRz3911t5br2Ib29V4kmZe9lTfdQlgp
	YpF1gcSLB6HHdxkhsrY3rh4Iqc6GR3SUTrDlVYDiV0WJ4C8wrPpESYzbEREywncj6QfRvdgoR2r
	Ci
X-Gm-Gg: ASbGncvVWJDZSFSuaFFSvUz2ZhvamgKlYzi4xjqjTxUpWsIoia2uM7mYe63wAW1XdZq
	wTe0x6mVLMUE/zFFod/ZfTJGJOpYVaHPpYh7NCJK2EqzBW/icPN+nmHtjlZ80kjzDw4MXXvcBOe
	UhdCNhy3S4cIQ32cGeoapXVpU79prOGGuFkZt6iZJFlKcLQas21DWTsWb717vhHG6DqPM69zlSn
	A+eP+Q5hvjgS1wxMAUqXE4WK2kHcf1YrzWA9LYZR2G5N6IjXI1/Zwrc/kUfdW5lfIIoCPQdX74H
	cblEA+9hRVXZT1QET0OQxWJip75fhCqZXTbRfgL0S84dhSnh5ie8tU2EgMoarMbKM5cweQ==
X-Received: by 2002:a05:620a:1a89:b0:828:1529:d028 with SMTP id af79cd13be357-85ae7cd4ac1mr7327485a.61.1758728028095;
        Wed, 24 Sep 2025 08:33:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7m0/cbnvCoTKElfyKlC9Akk8QQ848roxwkCAlIQudXokrBobnZdaunrFKeYAlTGXQPxdHhg==
X-Received: by 2002:a05:620a:1a89:b0:828:1529:d028 with SMTP id af79cd13be357-85ae7cd4ac1mr7322385a.61.1758728027583;
        Wed, 24 Sep 2025 08:33:47 -0700 (PDT)
Received: from redhat.com ([2600:382:8504:5608:ca95:838:d4f0:316f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8363198b0fbsm1167921585a.50.2025.09.24.08.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:33:46 -0700 (PDT)
Date: Wed, 24 Sep 2025 11:33:44 -0400
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
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 0/5] clk: Support spread spectrum and use it in
 clk-scmi
Message-ID: <aNQPWO6pfA_3mmxf@redhat.com>
References: <20250915-clk-ssc-version1-v4-0-5a2cee2f0351@nxp.com>
 <PAXPR04MB8459265997E9822F17AD2BC0881CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PAXPR04MB8459265997E9822F17AD2BC0881CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OuiCNllyQr2mcHEaYwhM1xygCCQWpnN0821eghEB18g_1758728028
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_083351_360469_74E6FD0E 
X-CRM114-Status: GOOD (  17.33  )
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

On Wed, Sep 24, 2025 at 02:44:21PM +0000, Peng Fan wrote:
> Hi Stephen,
> 
> > Subject: [PATCH v4 0/5] clk: Support spread spectrum and use it in clk-
> > scmi
> 
> Since clk-scmi.c for spread spectrum support needs some big changes,
> we may need to change scmi framework to make OEM extension
> in an elegant way. This will needs some time.
> 
> To patch 1-4, do you think is it ok to be in linux tree without patch 5?
> If yes, I will post V5 soon with your comments in patch 2 addressed.
> Otherwise I have to carry patch 1-4 in future clk-scmi patches.

This adds a new API, and there wouldn't be any users of it at this
point. Personally, I think it should probably wait and be merged as
one series. Unless there's another vendor that's ready to use this.

Brian


