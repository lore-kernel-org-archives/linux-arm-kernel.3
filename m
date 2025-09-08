Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E42CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 20:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5u862f+33I0ToIg9z8vAxXZhZpYtuEC4meBODLVdsg=; b=dnlA/2mbtjaT65g4mgGiwiFJc0
	rOlufKe0lH9IJM6VjQtdPQZpf9qVrAPD69DhVIgA2waWWuHVnFGJwL4HX0V2QkzNSsl+gc571a3Qu
	4pgqJnJpDzaJfWqw6TdzUNgkc5Ron9pW+qpVXMLPA48tQf3lcA8pkdU+OpTQS+OrbtEqbhPecGGxK
	gdo/AVA4fDwKxbDKjLZTHrYCc9YJwn2VoYQLx6z3rrr204o7ojfDy7mFmc0t0muYKE6jid/aPlXXd
	eWXvrppETHNoARJkuFs0+bOR0NLUgdHNL0IgX6nbh4hN7YIPW89Og+NthOQNlLaecazTBmH2OY8Cl
	4CiXLfJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvip8-00000002IWD-1Aqf;
	Mon, 08 Sep 2025 20:50:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfQt-000000018DD-3hvy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 17:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757351615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f5u862f+33I0ToIg9z8vAxXZhZpYtuEC4meBODLVdsg=;
	b=TfJQxYHB7l7KDDURxBPpIH30XGO4ymo6MB3/92HdIeoAoZEtg4U/I2UWM6lwrP4l2BTnK2
	wcOBRjMSQwp2hKut/wNjnyWUR9dtKzgBF2EwHMouImHATmOHilKmJZkOxo4p5nQr3BcWx0
	YBKoI83gPpamAmV2iwvyI6JspTs1Jew=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-lWZ4uKkOPuKHmEcdUvaOsg-1; Mon, 08 Sep 2025 13:13:33 -0400
X-MC-Unique: lWZ4uKkOPuKHmEcdUvaOsg-1
X-Mimecast-MFC-AGG-ID: lWZ4uKkOPuKHmEcdUvaOsg_1757351613
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8031e10621aso1225019085a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 10:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757351613; x=1757956413;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5u862f+33I0ToIg9z8vAxXZhZpYtuEC4meBODLVdsg=;
        b=IrM+MPkQGxuOM7Ag8nIJQiAhjeIMXXvyHbsxiTIfZ9YG3XIzxO9+etJAr0A6RZzUQi
         ktSlsT7b7rwPk6tbl6T6tCTJPr3zTFEjCPMOnCnAfFjUz3n9CdVu6nGdUXDgiYLIh36z
         sInZM/Hy9sMoQqstmLyPMOyzrd7LF8pwYPHmfFSpeLtxCaCemNRnFLPO8ZUgpHCs/2TM
         TY2VYPOBUAZtq3abN4cDDZK0w5rffIY+VYcO24r4HMHrOfQcdRskoSgLEY9Uko/2TGtL
         GShaST+CpzmKnf2MeqXFyIqEmEVNEO67JQRkrXHDoMdJCyl0KwmspMsKcasJgg9WaxIf
         QPAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9yaFrxM3J0ll+rymZoMTIKpTgihGX4/ToyfH6ywuh4CxEZFbRMwsMl36PL4cZZaHCxsnkAnvC0W5AkKkvmfsY@lists.infradead.org
X-Gm-Message-State: AOJu0YxxskPFYMijnWOtwP2ZgDD3wXc6YrcRsUBgeICVvVm7H6v0Ez00
	NaLIpEAzJXW1HDjYjm6PuljFL+mFz1ci6v3Y4pHVKXAH+Apaq8/MdkeASU9Iuws8wkpB4ml1HNT
	9CUOvKR0bgzBSPFdAMingY4sPRxWyj7XC9E9TdMH6ZhaCjOM2nveI2OELLGiHV9y8peiQIHShxL
	Em
X-Gm-Gg: ASbGncvd0ovE6DUO9f6tTb7gIoV3xQifdMeiZ2/nvQ4Iq6svr+gic3Kb6bIs9/m9tsP
	xDQXIkLlNeCjWZY1n4hh+iTiDmaKgwhNUjRuk/7ulpeBND5G6KwimdquPiaGkHLQSzWOTrhofhF
	JoMU0bG9rIq+cnVZhsG6WXb8TfEnXQEt3AIhoO+qc27fyN8uo5WDN9+9OaqOIz6aBy238Wft5Ms
	Kodeo7Jy1G97cjNMblQIwqEItj5FLX8P0g10k9oh3+nboTi53IHaYgh4nuoO5x3x/VdJB5gl0Si
	nPcpnIeiY1cVMDvpZj8MX4zAU7D+N1ZXmGING9BMRbZK5zi7P6et0v9IhUg=
X-Received: by 2002:a05:620a:4589:b0:7e8:1d4b:b00e with SMTP id af79cd13be357-813c31ef062mr818167285a.30.1757351613096;
        Mon, 08 Sep 2025 10:13:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjCX6nGjgyfHMIgtZhE/2SgJwH/cNIdfnPyghhVtQtsXFicJtDPEijNhBgIwhV/6KVPSFsmg==
X-Received: by 2002:a05:620a:4589:b0:7e8:1d4b:b00e with SMTP id af79cd13be357-813c31ef062mr818162785a.30.1757351612499;
        Mon, 08 Sep 2025 10:13:32 -0700 (PDT)
Received: from x1 ([2600:382:8507:870e:b6f8:ee72:4f09:a16a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aabf586c5sm1108360485a.60.2025.09.08.10.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 10:13:31 -0700 (PDT)
Date: Mon, 8 Sep 2025 13:13:29 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/8] clk: convert drivers from deprecated round_rate() to
 determine_rate()
Message-ID: <aL8OuWjlswr95xcB@x1>
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KLNLvDuo94k74AuVUy7J2oDvY9afFPg_kg63847HxtA_1757351613
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_101336_017185_7AFECCC1 
X-CRM114-Status: GOOD (  15.74  )
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

On Thu, Aug 28, 2025 at 08:38:19PM -0400, Brian Masney wrote:
> Here's a minor v2 to my larger 114 patch series at
> https://lore.kernel.org/linux-clk/20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com/
> that only includes 8 patches where a v2 was needed. To reduce the noise
> in everyone's mailboxes I'm not including the other 106 patches that are
> still valid. I will supply a 'b4 am --cherry-pick xxx' command on the
> other cover letter to exclude the patches in this series.
> 
> This series has no dependencies and can be applied in any order.

I included a subset of these patches in this pull request to Stephen:
https://lore.kernel.org/linux-clk/aL8MXYrR5uoBa4cB@x1/T/#u

Brian


