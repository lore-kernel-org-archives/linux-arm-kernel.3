Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8D9CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 16:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CA7cuB52W2mQEAqgkUGyrUbyJm9rGb31mdD8XpbhOA0=; b=tUYH3nRiV1FoxhVxUDHWnTUdiM
	JB5+ZVCqvlO6RGtntKNMLCYVG4+KYSFbHoAx3p0Tcs4njTK2BP7gizaW9XV51m+mg/qnRysW3wje5
	OG3ksRAb+42pWfnAlb9tAlaLP4j3JdRWdqomCQBliL2apK9F58DoaPErejj5vehldRWFubt8gj/3y
	wISAlHJpW+36Bf+tpoW3zsuiuDY8ZH7Wsbscyd4urCQF21YJNFCU4Ouqt/te8n5tDtquZ2FaxOegD
	hUkcyIdKkEW2UhTuICf7nEiz/xUi0OQp7n78jq28l4A5JlPEBJTLwIdSY07clW6o1iWSI0KIJPh0g
	CmdDgRDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Qjl-00000005PNv-2E8a;
	Thu, 16 Oct 2025 16:21:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Qjh-00000005PL2-3typ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 16:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760631712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CA7cuB52W2mQEAqgkUGyrUbyJm9rGb31mdD8XpbhOA0=;
	b=AnQdXSbpbaqc+pJ5AFJnZd1+MTaEZTpyYBLt8EOnkDZVB1Eb8qeY27XRzoeElMREOyyqFU
	ULmSwLwTk+m1meb1mBkYc35xQ4U6jO8z/oASHPsfsUXSm2qFCk9GpJ1V+Z2mEoeFWFiPJb
	kH9VDsKR3AvS9iQRFryMqyjNVnpncHY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-0zqiE8L4NFG-Rgqr6mQBmg-1; Thu, 16 Oct 2025 12:21:51 -0400
X-MC-Unique: 0zqiE8L4NFG-Rgqr6mQBmg-1
X-Mimecast-MFC-AGG-ID: 0zqiE8L4NFG-Rgqr6mQBmg_1760631711
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-88ec911196aso336350685a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 09:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760631711; x=1761236511;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CA7cuB52W2mQEAqgkUGyrUbyJm9rGb31mdD8XpbhOA0=;
        b=AlEdeYYNmJA++gA5zsP7mkiMkZ0pim59D7PIAtkH79xBy27AeseezMlOPGuXAcHsDk
         zwMELKLbjpjqvXo1HVwXlBQHEM2/0ASlG3MBAjYaEI8SlIr/rNNqcnRElAPuekwz9DR3
         3jkB935R87TCq+Rp6FmwdabfAD1KA4pgV35CQo2D+7TL7+4hmuiArG61KahwH6H2v+i/
         C3ta5J0zUeN0lfaZCE5etm9r1EE5Ufca43T5BHm+CJR7fUD+M3Zj7iiLespLlYrxdC/L
         MoouLAhpEfcXkyYdbHno16OTah1LpDLlJQkdPWnRb8ICxkRtfu0KxOWkFjeLGvJajkX1
         GKnA==
X-Forwarded-Encrypted: i=1; AJvYcCXk7/XL9AnV4QHu8nhz08VsCMEL0blsIYEd6PWpb9gkhaZ8uQq6PJQpzwGF+qQ75bOXy5ZG6dKJ8M83XTnVKwXb@lists.infradead.org
X-Gm-Message-State: AOJu0YxrPWs23M44YdsEqtwwY5i+GdgyA8434QQolkNMJwnbgYVRSR10
	87FIIS3L7Fld2TXXBEpRg7Nsvs/DH9PHTI61NNvFrwcF3J6nW2tcNwQ7jK30tdWUYBdf+B3LWaI
	7uyB5G1+IhoDp6QL9ocr0Nxqx8PzEGPhBXR/K68Bt9rPWXESeLFgjB7MvhY3lKcEQCroq6gTVVs
	dW
X-Gm-Gg: ASbGncsXXimr0NBQ3L+WBFHXQ/XlBG0XWItdHoPBH1J8TYJXlUc+c1PoC6MZZJljqXZ
	LUgue9NH+P/62ArOJKmdybukfuThozIyddJKmAj3+sTFpIEmhJZiS7YhW+hJvHOm3EB1PNIEAOh
	mrWuCdoXjceOp6BS2bxY4bHDBogn0OJd+JvtjebWDY/xoChZcisjgohRKoXQ8yhDaFc17TCIfaT
	sljf1Xg3EgLpwgiQZUAxxFL7ES22zznLvknVBeG4I1oBKo058/T/XWr3FvilldyvCiNLRMRHTKs
	0a2r/dJqfav4yeHA2yIAHOZiyHxWN0b2WOUs13rz0ujTAGx0pl9vf2N/NQnR8fhT3B9+nbExI8o
	7P+3IHq4wBFJU83NwauyuXaKnOOgI5LoC8yv1w5NjpJxWwDEriMZQJtE0x7wqv3CYvw==
X-Received: by 2002:a05:622a:1a9f:b0:4b5:ea1f:77ec with SMTP id d75a77b69052e-4e89d091468mr10559581cf.0.1760631711007;
        Thu, 16 Oct 2025 09:21:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4xG1metr/rpLguKpcRm9DUmy+rwmLo2vG6JrUEiGqV+HAheQWldgSDUdPw7Kfed4P6HKKmw==
X-Received: by 2002:a05:622a:1a9f:b0:4b5:ea1f:77ec with SMTP id d75a77b69052e-4e89d091468mr10559121cf.0.1760631710594;
        Thu, 16 Oct 2025 09:21:50 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e885a8e10esm36941801cf.11.2025.10.16.09.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:21:49 -0700 (PDT)
Date: Thu, 16 Oct 2025 12:21:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 0/9] phy: convert from clk round_rate() to
 determine_rate()
Message-ID: <aPEbm5qK8-hkV3w_@redhat.com>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G_NsdBckhqPvlwHPiuFhNZRnSiHhZQDJu9kd4-XhWBY_1760631711
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_092154_041385_725BDA57 
X-CRM114-Status: GOOD (  12.19  )
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

Hi Vinod,

On Sun, Aug 10, 2025 at 06:45:28PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the phy subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.

I'm hoping to get this series merged so that we can remove the round_rate()
clk op from the clk core. The clk maintainer (Stephen) mentioned this work
in his last pull to Linus.

https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org/

Thanks,

Brian


