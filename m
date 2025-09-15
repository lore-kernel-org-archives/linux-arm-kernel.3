Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DE3CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 12:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLL8rzXBaL9TL+cKj7734rcnA0rGbpZjb3H9q3ePb+M=; b=nIXHspm5Y5qo6s4Nll47/lUF6v
	lD009YQgSh1I0rz/EkOzQsBmbkjKlvxwdZGCt7g33JmxyWQXjrmRgljBAuHKs3q0dLViaouWmPyEc
	SuGk3yzqtWSv8QotVF7aj40i00ZXuMFWfmKlFRsaHiS1ZBuVXKPz+h2v19KaAziBdk4HcWEJN2FPY
	r9PZ9VpO/I7Da0hkr1xyhkIF9dT5/8dpnO+EWQNLte+m5KwntR2dy9FLfEFYrSZ3+MbdVqzTWIIEU
	QnkMa3a6GzQ8TJKiXD+uQ0eJafaFms7Kds6fNlvIDpYuOsOVQqvOwVRSaaLEpFOiUjEXlNxAGZuba
	HPJCtaYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8LF-0000000493j-0eB2;
	Mon, 15 Sep 2025 12:29:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8LC-0000000492r-00G5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 12:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757939391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wLL8rzXBaL9TL+cKj7734rcnA0rGbpZjb3H9q3ePb+M=;
	b=BxVbyryhWp089TG+BJWn0h2VhChtvXd2X+QpxpU4vILt7kZoA5uen1IKSuDSor6HLu8qNE
	a2IqBegL6tJR1B4rI3cxt/vIANKDDwIgsf67jKa+ncngPS9WaLGTmApuTMsNvQlsPb3/jI
	33W/2KELGMr0dm7F16KeU8n2QUO5eNQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-g5_DMkRVNHG1r71BASCfpA-1; Mon, 15 Sep 2025 08:29:49 -0400
X-MC-Unique: g5_DMkRVNHG1r71BASCfpA-1
X-Mimecast-MFC-AGG-ID: g5_DMkRVNHG1r71BASCfpA_1757939389
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7fc5584a2e5so1412003785a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 05:29:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757939389; x=1758544189;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLL8rzXBaL9TL+cKj7734rcnA0rGbpZjb3H9q3ePb+M=;
        b=gtb29PMe/uyFl+0zbp6L1c3hTxzRLxfmOPxiQKZ1RVuQqqz55lK1Uhh/vMpAiA0a89
         VUjmtdO/gK5/8k/E3qo4MwWAKQ1L/MTFSBIBxyjregSDz7oobCS/6Dzkmb3FgvA81H4V
         1j5VwV0R9vdPC0yz/1AWEu2+q53OkdLKMUaquH+/qyCDE38WFzAbSYcsiCRUafuAnpYr
         mSYNteutScxLRaXF718x6STlkBVQs8ZT15Z2t5CBoBXU3V8thMMD6ix05JFmFriTz6VF
         GsmBo/x54GDp+uKf7XFS4S1pBI/qBer/GHGYzih3BEwJtzRA5QXd7MDfKrL49OiyTH/1
         ZxSw==
X-Forwarded-Encrypted: i=1; AJvYcCVLWjUSw9gMy/sVk9OVZ+t/L0dXvqASZldF6U5QRXqOei8QMfuK/YPL6XL2qiSgnmNAyLqUVkpo8dGIGX3ZxIf8@lists.infradead.org
X-Gm-Message-State: AOJu0YxkODkUIomzwda2MlXCPp80JNFw8q0B8kSjzYMQMaL+BKa40S8d
	sBHw6KjUKbpLJMSCB2v/wpmFo5FLw6ISp3MVWXjiYjSrR2nvHtV0nyyGSDDz3dN1w6CbiG6mjBd
	T89sC2qroskev3FvCha2wAm3zXfEWbjJnlF0OmyewjkT0he6CIA4jKcBP2wQfCsHQO72GAU0oJE
	RI
X-Gm-Gg: ASbGncsjGrZexvbu+tsgsJ6WmRUV8NRM63I3THe8+6x+TgXTciCvzFrM8hZitaId6QQ
	+ld8uQJx/Fqo+vGBj6I2ozqWkMd8LgvkSVZMI36Du2yEgIJM6Sezv4Ml+0FyoBitabwQnlZmmuB
	kh17f5lds3XKz4zMlQpdO1hATjKworuQfFGliH6YBnDbzKX0aGcrAcVqPIa7U6hkSBCvvLwZTRJ
	FMSaSxkk6MVoPo9I42nHhbW3MtLjO9xyxhnTtvQSubDdU394sotXlKEK9XDVygkCSxrnFSzm2e2
	z0rpxbXbObO/rJOsLFjsRwiDDx2pVFdHk1vY4qrL0mRoATr/OZgEYWhrUOFn/fplc4U38PaeccP
	IvVeg7EdqGAnkJz60POQAWu6JTMHQU3I=
X-Received: by 2002:a05:620a:3194:b0:7f9:7000:f7bb with SMTP id af79cd13be357-823fbde9118mr1346854885a.7.1757939389145;
        Mon, 15 Sep 2025 05:29:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHY7Mxjz8VG1qTosAk9YY8DjG+y2q7MXDw84ZmcJWfZt1ziy/I8az1raMUNBU225CmbUCJKNA==
X-Received: by 2002:a05:620a:3194:b0:7f9:7000:f7bb with SMTP id af79cd13be357-823fbde9118mr1346851185a.7.1757939388265;
        Mon, 15 Sep 2025 05:29:48 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b79a7b639esm26809461cf.5.2025.09.15.05.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 05:29:47 -0700 (PDT)
Date: Mon, 15 Sep 2025 08:29:44 -0400
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
Subject: Re: [PATCH v4 4/5] clk: Add KUnit tests for assigned-clock-sscs
Message-ID: <aMgGuDxzYZpw9sti@redhat.com>
References: <20250915-clk-ssc-version1-v4-0-5a2cee2f0351@nxp.com>
 <20250915-clk-ssc-version1-v4-4-5a2cee2f0351@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20250915-clk-ssc-version1-v4-4-5a2cee2f0351@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OXJ5RVU2QUniidoCy8LNC0RyuF83PoNiKBab7kG8PCI_1757939389
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_052954_110296_41CA0F90 
X-CRM114-Status: GOOD (  13.46  )
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

On Mon, Sep 15, 2025 at 04:29:38PM +0800, Peng Fan wrote:
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

This looks good to me. I'd typically leave a Reviewed-by, but that's
probably not appropriate since I'm already listed with a
Co-developed-by.

Brian


