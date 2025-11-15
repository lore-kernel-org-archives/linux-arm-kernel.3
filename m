Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27265CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 00:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MY79eneNfrMG9dz4hIdkivq1gZvCTrtfj5tzDev1p4M=; b=zZeGWdn0l5AlVrdGZ9VZNw01Fy
	vfsaEgvKkXhf2fsJm6sqJB6qQ+P0BtJr9en5eNV1LSSlxXg3ep/OG3k0wzXjXLvREWi9ti/6Xk/F/
	6vHMujpHk34JEOc3MIQhk1X6yA0BeZQotoqe9jkcyPNg4xu2ANxCu9p4eCodeEYvFMAPvHR6eTQqm
	tmn+45E6VjqcjNwytLnRuwOjpdc04EPGo22HuIY1iuE9zvacB1pt4awYp6WpQ/44De3AOfrMWD8fe
	A/WXzzm/YH84BUraSUnMkYQWaiOlrYc3ky31PMKRpymdDL1NHslWJcn1pKcw9Bq1m8JamsvqsidcB
	TdsYhNUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK48x-0000000DHHg-3CWz;
	Sat, 15 Nov 2025 00:27:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK48t-0000000DHG4-0OKl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 00:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763166468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MY79eneNfrMG9dz4hIdkivq1gZvCTrtfj5tzDev1p4M=;
	b=F6P/x9aCvDfl6GcuUO7XUBHxvBrAibq0xTTIi3MlvdauPMmV5/mNMdGsgv8YuQ/e/qLajD
	J4mU349AewLwzU8iTgREZBE5gZ1Vf5MyW6nAHYTMBL2sp9UpkMW9EMpLy3AM9qyJeTQNH5
	rzFl4+kY5DyXb4qUf6/Q7QMRXfUCd60=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-kES2NqfYPjCsLkVRFOPYrw-1; Fri, 14 Nov 2025 19:27:46 -0500
X-MC-Unique: kES2NqfYPjCsLkVRFOPYrw-1
X-Mimecast-MFC-AGG-ID: kES2NqfYPjCsLkVRFOPYrw_1763166466
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8826a2b2d9aso87079586d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 16:27:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763166466; x=1763771266;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MY79eneNfrMG9dz4hIdkivq1gZvCTrtfj5tzDev1p4M=;
        b=of8NRaUJyMl/HkK+8jyursWN7Qu25GDRl9HueLGWkGxItqWBVMflMqcvbrwCp5hTrr
         RUlaxLibzsb3ow7hFr+obDfQMJoCd5Y2sHk/31KImlb9D9sXR0iKDz339o/fmNNaAlE9
         GrxdW6dHbTySz6wO42TXNRdgyPVnAUxLGMcfyjFwpHylEWte6E5RW33Dd+RbwjgkU20D
         h2njI6kq7+zb//k3d2CrEFwpLymyLg9CcvgfVPRLAaUyqfbIsy/c7D+quaJQtm96XnMp
         +i7GI7vA4CsCxK2l7+O+4tF9/zBbVnktncJEwKNs/jDK4WuwDzYfx7Pk39xf0FVntaHg
         Bf+A==
X-Forwarded-Encrypted: i=1; AJvYcCUZ4IOT3l3fw7w5IvIDqvP5e2AUtU5bl+cTzCRZIz7/J/F6MxJMAsRfIO62tev48jDZ8v3Mw2KvwmrQouznL2iZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0B3t2my1Zjghjb/7i90z68652Y8htnAfJEaFhAezxCB5yCu0Z
	bY2bCV0fNzMMby3V5L7VesyrpG7VIdwvQRGHtMkh9Y165TNFGbKjOYC5PZLlZX6NTKFwzShiYl0
	bfJ45ncn9kcLN/N7QCyDIdJgKX1l/WKYJtuFKohQ6E7bi+7uXHCvWCDx4rwmwS4bMjaM94b+I7I
	A+
X-Gm-Gg: ASbGnctp9uvKSDBLq5KvGynAkHUASSoaLFjuXymV5/9I/I5jacnw2/kwPQep0P/JIg0
	jeVcISVqDZ3ILBimwVshRsTfPpmnmNvB4DjtIy+i2fQXfVqFo5TzTQkw3GaCsjKyl1HKgs1MZaq
	jDgOf3jgM9NFQLTa0sKVLySbTtcUO235TM6ypwgXTvatKUfommXKdp7TE0UMe52b3fTIEK8MbWA
	fMWK7d3xuZu1AoOuKLKL4JDP9EB7R0zKxg9k0h+DoTp/klAnZK91BEqzbGvmP0RNJV2bYhonaRs
	y3Cpfvyy0Iie7aJYgzYanl41CR2H3//8PMBxcfXyL/Y+4KXXKlnHBXN4BQGeOkee140mR/CZcnh
	vqAjawN2i2alfDnfdDL/J57/EDZFzEwBXl76AgSZzptiB
X-Received: by 2002:a05:6214:5014:b0:882:4be6:9ab9 with SMTP id 6a1803df08f44-88292705010mr65042386d6.54.1763166466377;
        Fri, 14 Nov 2025 16:27:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGraWChEBaQ8Kt2DRqLdXdplufLvs8tWzEMELdXUg1GXFx2RN4xE4J+31DR8rAVpI9IzMPVUw==
X-Received: by 2002:a05:6214:5014:b0:882:4be6:9ab9 with SMTP id 6a1803df08f44-88292705010mr65042096d6.54.1763166466020;
        Fri, 14 Nov 2025 16:27:46 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8828659e0fcsm41781696d6.53.2025.11.14.16.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 16:27:45 -0800 (PST)
Date: Fri, 14 Nov 2025 19:27:43 -0500
From: Brian Masney <bmasney@redhat.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH RESEND v2 0/9] phy: convert from clk round_rate() to
 determine_rate()
Message-ID: <aRfI_xT680E7Cf-o@redhat.com>
References: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: avjsBX1nqHxcx03MACpjqECi7_ncwf3WhqwsuZTNaDk_1763166466
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_162751_204064_E4B8A815 
X-CRM114-Status: GOOD (  15.68  )
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

On Thu, Nov 06, 2025 at 06:25:46PM -0500, Brian Masney wrote:
> This is a resend of my previous v2 series since I haven't receieved any
> feedback.
> 
> https://lore.kernel.org/linux-phy/20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com/T/
> 
> I'm hoping to get this merged for v6.19 so that I can remove the
> round_rate() clk op from the clk core for v6.20. The clk maintainer
> (Stephen) mentioned this work in his last pull to Linus:
> 
> https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org/

Can you please take a look at this series since rc6 is this weekend? I
have almost 200 patches merged in other subsystems across the kernel
for this work since the Summer, and this series to drivers/phy is the
last one remaining that's blocking me from posting what I have to
remove the round_rate member from the clk core.

Thanks,

Brian


