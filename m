Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74604F3093A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 11:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZZVApgq/G+kwjimfOM6gAatNV+GE2CQXWyQH6+SXek=; b=cDe+Adr2SdHDj4WTJCpXOHm5PL
	aLWEuUlIjfDZ3xSW0mIW2dPK9zsmVhYA6/3WJOSl9RStxXg3Mb/OyFMDTvX1pGMjOTNwZQkgVZPYT
	8lGSJoPXKWsVNrAan+06jpYHHWDVXkzkpvozvuAXa8WbHh93oxlJSj50FhP1cDNtBJHhh5RGgkRVb
	38iKcQvdBZgTM2z7onY8O3YfJWVadIPeSrtNv4ztfaeVzhTSIql582Vuipdu1m3JK9EvManDNPcvh
	Rly3oT00V7goy0jEG3w4VeLFiVIsBLmOz8oMlHF5A5Uckz6s2qaInYKmJvsZlPTJwA5D1pcu0qnKD
	2e3tbQ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6rU-00000001g8I-42Nb;
	Thu, 05 Mar 2026 11:27:24 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6rS-00000001g7p-2utC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 11:27:23 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a9296b3926so58229915ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 03:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772710041; x=1773314841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZZVApgq/G+kwjimfOM6gAatNV+GE2CQXWyQH6+SXek=;
        b=JMQdtWPaGIBIS8PXi5Me/hh13L7d2tEXFdefmNIcu4VD7F0IuuBv2Wuwul75S0Q1mQ
         yZkw/ey97V1ctwPRxsVNm7aUpxWc8QR9gxdNgU5Q4lW7dZO2qGPmyv+YFInL4o0SZbaE
         g2FVULHHEd1Qw+Ldy+SawJZN35j60ZmRLpwAjPBSmV3QUTca4wn9l6c7TRlstJheYyJL
         fG1bjzD03YK/NcWjgWM6dErgKAavwV+/UXBS748ffK5BCJY/7ECLiaOj4dHMw8ASU9Cp
         EJrD5Sf6H0ic2oQBIfxBA9Asg9QTdfWfJ1LrAQQNJwP+dbNd8LK+m5rhQnLZafW5XsMA
         wssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772710041; x=1773314841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xZZVApgq/G+kwjimfOM6gAatNV+GE2CQXWyQH6+SXek=;
        b=jjgINfPp07rq5ZES3UrZMBTad18nbXOu/hWqzJhn9AZg7QKFFoKEJwnS8mPMDNQpSE
         39CgExmrtxK1C9lfaAdy4vgk5HX9rJrRdLFC9eck23EMyXGRy/TGvGPcvmwMmMlvRpdt
         mNy4VT+OWQCm+vT9LhgNzI6au2nh6I8O+Qm6ZLENIkjJMqldpkTDf4nHj8e1fgAyf6vL
         qjPrci4AglaC1WbXuGaAKDNrdKgwh4eRqw/jYz14QHlMqB7xpPnVA1hSKyAIgTtGwCI6
         mfULtQ0sQSktGB34QHjwLy8REStPu2wkvxodKjflGpiGPHBKXEQS/q5WJ/2XG5B+aj8w
         e1nw==
X-Forwarded-Encrypted: i=1; AJvYcCXb6mta55m8RyXH9S+51isdZ6qp/wse+4G75WWxEutg9RA0qpxxbRBX+jtsK0OYw2Di5xwdC8iFRgg6t0dnZIkb@lists.infradead.org
X-Gm-Message-State: AOJu0YyfI1l+9oqb2aSAhRPbvxOLFPxqe2RsfCvcGLx9RXpgEX1C8hUY
	vdaYcgsX8DbWhP9zLQn82bdosUNQ5D2Pn5ZqYI7ME6J1kur7uR33eozH
X-Gm-Gg: ATEYQzzQPfKukUCyMLGwGqN2cg57ovkvfGeWBsu6NNIvFh6rcJKrf6VN2ZpLKhoZn2E
	lEqM5rge27kMJzR9txHyoIPk3KjW/49zsYEaR/CyrVU4AWFwUmg9jDOZRmS9Ua0lHeCbIF2AtWb
	bFVKlfyVUMKClnyQLmGnjtAo5Wloi1AyLrb1h6Rvho80N+x2orN0Vi5gH5Sj6JVC3afDP+WXPBT
	fJZw1B2K3YtKjl8fe9QBcfqd7M0vmudETXFzzZ72SYE9J5muC3H8Ah/CdZAIuP1IJCj5ASXeNf9
	U/Is2de8wQLzvaYsIo4Xdq6ozqd1cRKeWx+GnmVxE1u294h29TNnvWF2qjPwA//RdBLHFU57vWv
	gPZhoej121LseUyc4C2i4eDW+BH3vuA9nIaOLXJ3SFk9IAL4bkhbTlWaT9clJoO1VXiuwbhB00W
	QIleLPEMin1i9OXyP5
X-Received: by 2002:a17:902:e88f:b0:2ae:3a77:a1f4 with SMTP id d9443c01a7336-2ae6aa49457mr52815905ad.24.1772710041230;
        Thu, 05 Mar 2026 03:27:21 -0800 (PST)
Received: from bsp.. ([58.84.61.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5229cda1sm144938805ad.23.2026.03.05.03.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 03:27:20 -0800 (PST)
From: Rahul Navale <rahulnavale04@gmail.com>
To: Folker Schwesinger <dev@folker-schwesinger.de>
Cc: Rahul Navale <rahul.navale@ifm.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	michal.simek@amd.com,
	suraj.gupta2@amd.com,
	thomas.gessler@brueckmann-gmbh.de,
	radhey.shyam.pandey@amd.com,
	tomi.valkeinen@ideasonboard.com,
	rahulnavale04@gmail.com,
	marex@nabladev.com,
	marex@denx.de
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction reporting via device_caps
Date: Thu,  5 Mar 2026 16:57:04 +0530
Message-ID: <20260305112705.6862-1-rahulnavale04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_032722_743418_0198AE86 
X-CRM114-Status: UNSURE (   5.65  )
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

From: Rahul Navale <rahul.navale@ifm.com>

>Could you confirm that the DMA IP core in your PL design operates in 
>scatter Gather mode?

Yes, We confirmed that our DMA IP core in the PL design are configured 
for Scatter-Gather mode.

