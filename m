Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E62C44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 22:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=; b=SsaS16ALqs+fTtnDscyuf0bTaU
	b4KiukVYWoBnVuVL/g3kBf2PgkhIGg51v7TZSLyWJwHNI4BZV8lKC1oezaHqDAQ2tdzgwfKdqBN2l
	E8VoXZSCCFPWrzGRUxxmGRXMG1C0UBW23OWbGJ2dnt6sHXiyWOXXjvthvByhjQjo8OZyUNzoiVtoM
	wyQi6Ox+Lv3bgLMc0DKcaJnbAIFyuINKRwK1wzATNaP2DtZgCpXGMihxouTXwLht70El19xCOHb+8
	3qHcqYP76/dWze69Ducn2MDkEPcOS6Rmg2832O+7XunVg/pFHIgjr2e+ThDO/rua0DDXcTY1sR/+X
	SKhX8L6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vih5K-000000068GY-45CK;
	Wed, 21 Jan 2026 22:53:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vih5I-000000068Fj-0gyW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 22:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769036035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
	b=Pz61i6F8ncRy08M9ZSLc6LxnHWz6SkFmdI0VBD8mIdPpJVI+CHYEEwhlaaigDXmu10XY0Y
	4r+L+KbPJ6bbsIJFnm8RRRoHxI12z9OvRdKwxVOTYEaCqOsQ/oQ1cFSGKNhkdnAXOXIN42
	cHxOf0xZng8RRG2/ugti70lGZEwhm0M=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-J1KTXnO3PuO4ZUQhpLSIMw-1; Wed, 21 Jan 2026 17:53:51 -0500
X-MC-Unique: J1KTXnO3PuO4ZUQhpLSIMw-1
X-Mimecast-MFC-AGG-ID: J1KTXnO3PuO4ZUQhpLSIMw_1769036031
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5014d8b3ae0so8896691cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 14:53:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769036031; x=1769640831;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
        b=di89IrG2XhcD+2dv+eur39gU8TdTBObHMuk3YgImSvorm4UtYZr4V+2ri8fUWhV8AC
         o8OhvJiomOXqKnk2f1W+hW5FZrUF9zOayYl1//qLRF0jTCWBNR71mOshVfgaBgtyP/wv
         PYf39A0BhNQp4IKpqe+3IpG7FXKDF63mdaFECalw12kqItjJOule4x3s0RW2d0EBtYDb
         BtqVcJLS0EhvG1QtE9pMCnR1n98vuMYCoqykgThyX8V5YxHqIpEfSySSeUTAiH67NAeN
         hFnOIh371tOIiuy2mzpyh1lwzT/ysRKTsaI4av5DwDwxON1NNeKKzEpRbz1vnwnQQswn
         1WvA==
X-Forwarded-Encrypted: i=1; AJvYcCXghHlAQ02uZLwxsSGCf6NxDuHC6CnDI2TP3dwZmkn3kpFDh5fQO60/AtsnekJLlY9g0xdsJMqdijz+oiw5HqAz@lists.infradead.org
X-Gm-Message-State: AOJu0YwF3QVwMgOUHc2bTsWuQQTmVqthhXv0gSR1pB82plZSH/6ObXoa
	pKYOVSkwtaam4EMJAT06SdkMki1ajHT7Q/bXZB0DDBjEBdkK8zWPTnfK3/1B31hzcoqw97HUSQ1
	G4UDeNPbuy9/bo0F4j+XP+VvAI9bVDM5mB5mGgqD/NwYdkeY4h91iLAlfdY1h82VfvaF4rhexNH
	OC
X-Gm-Gg: AZuq6aLTB1bXworQXiBGwqnstPoVNs6ya7qQ+o4cktT58Ed5RTsD7j3yCPTq2+71O6n
	TBBJht+4UHQtKsyaTGu3QO2rYDjPHfTMXwL35khlvkrxusClQ7gKZVGFZA790tgUUoQKWJKxr27
	6wccHwi+wiMclYctoSVY526QV4dFbMSNgrEEL1suQ4T1b2uz4Z82O+gbTyVlaok0PAp1SSVb8oU
	yGpgHj8BlkOhQEWfglTY1j8ETIungalFwWamzo2tkFwgokodxiij9qGSPQDw43DL6nZrrTlSqfk
	TVtIjd/pgHVAuhpBYj4GN98Jqk4O8S4gl39GS8unIDqU0JWUjTfSlkW9gJUPvqJ4/T2vMeOlwHZ
	TsJU+vjnE
X-Received: by 2002:ac8:5fca:0:b0:4e7:2210:295f with SMTP id d75a77b69052e-502d84b0ca5mr87957071cf.13.1769036030776;
        Wed, 21 Jan 2026 14:53:50 -0800 (PST)
X-Received: by 2002:ac8:5fca:0:b0:4e7:2210:295f with SMTP id d75a77b69052e-502d84b0ca5mr87956771cf.13.1769036030338;
        Wed, 21 Jan 2026 14:53:50 -0800 (PST)
Received: from redhat.com ([2600:382:8125:73a8:e201:8ac3:bd7d:6acd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1f1abb9sm117138811cf.30.2026.01.21.14.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:53:49 -0800 (PST)
Date: Wed, 21 Jan 2026 17:53:44 -0500
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev,
	Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-actions@lists.infradead.org,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Michal Simek <michal.simek@amd.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 00/27] clk: remove deprecated API divider_round_rate()
 and friends
Message-ID: <aXFY-FxqeBv4BsHd@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NH7GIpcembfwuhw2JgY_n335BC8oLzI0b8bs9GKGYZE_1769036031
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_145356_273638_8AFD2B01 
X-CRM114-Status: GOOD (  11.22  )
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

Hi Stephen,

On Thu, Jan 08, 2026 at 04:16:18PM -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.

I sent you a GIT PULL for what can go to Linus for the upcoming merge
window from this series:

https://lore.kernel.org/linux-clk/aXFYU324yQ6uBmk0@redhat.com/T/#u

Thanks,

Brian


