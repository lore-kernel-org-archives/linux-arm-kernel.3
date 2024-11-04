Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A900D132BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 12:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUT2MUhoOe9iu2p2kd8BI2aLF+LB/mKyYJdsiPsn1AE=; b=BTrsC0QbEPjsZfz3Z42+1kwbbf
	G8H5LgKZ0o/7anjb6u8JyOyZJqaKO3ZT4+twKjTH+pkbd9fp2RQz2p4LnmggU8MF6j1gd5CxCuATM
	OBZP0PsoDHbAO5/jS1Pljh9fuiCWzY0MLUJreDstt9TC7qUWMG/tVod0N78PYSyWgIK5Miep2oYIY
	5Ie0W+Tv8ot89X30JydoT5UbDueKksXM3ryoK8xDfUMUVBCmIaFfP/pcCZXvBM7bxUfRPCT0aYwmV
	1WXwiJnffAGCRpbaHQRSmtzRi/w1R2VK9hUYHrEXE+p04eH92D0SDuppNkKo2GEFXBRL+qXXn1crq
	5EneH75w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wdv-0000000DlEu-3N6Y;
	Mon, 04 Nov 2024 12:57:15 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wcE-0000000Dkzy-2w68
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 12:55:31 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2e2eb9dde40so3261136a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 04:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730724929; x=1731329729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUT2MUhoOe9iu2p2kd8BI2aLF+LB/mKyYJdsiPsn1AE=;
        b=I7ds9tkDuqu4jJ5BhU0UUHPciVmyBBbcSmlILoKcylQtKTAW46Hu0X+6iloyjlhxc+
         iPgPtJjVS8wkgsH2j3RN6XNRqWRLbq5Vp/gOWvRBpnaX9MdvdrevwJzyyw9YkU/eVMHC
         MsbC4LtKbXpwOl7FpXhf/ApZZMa+OBCO9uYUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730724929; x=1731329729;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUT2MUhoOe9iu2p2kd8BI2aLF+LB/mKyYJdsiPsn1AE=;
        b=KYQtbeQJUvaTE1+ukSZLx9ak8wOx9/WNlGZ/3hgFCpYQZCLFKX8O0up2ORZb/BIBVr
         JaIt079M6ImyFElhF11swOP4wKDbEjJGpCFktFwxQGXyuhURQqYH1FhhksDJFrCLAjaR
         JEEGrIi1d1fz7bh5mINsNYWPuCtOBG4MSbvM8pZXHYsA70Czg2Uz9o0Diojnh9UyZ7KB
         N62HrN9hKVbMaEeK0SF7WgLkPWUXy4wLbo1/YIpvCom4b0GyEXD0zxwyf4TDjTcKJTXD
         QaGC5c9GVVs2Bw3Tr0B37uezfw2U0ZMuFD3mj6ADkOfX48q+hD+whHgpMIc8CSY5dvY6
         MWGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvemE/OdrGbv5AN7vygrDFToNTxGDHX3jASEbcm1+N5lSljonEif+n4Zgx/kMOqb6G5yluO4Bd0A8N2GO6tc0L@lists.infradead.org
X-Gm-Message-State: AOJu0YxTxxIRDNEhQcx26OulebUGcm9YjOrddBew8Njos8OiQWrzzFGu
	xHI/nL8flxKWYb8eJQaXppYr1guNbqIsRytLe9ud+0GHVBqzhJLRsLhn/CRgyg==
X-Google-Smtp-Source: AGHT+IGw2My2dH4dIXYJt5UAfh9QheTuaxvz/yW07aa/c8zRoSfhpBhW/1Yv0E1txryL8w9UJYPxAg==
X-Received: by 2002:a17:90b:250a:b0:2e9:5e21:24f7 with SMTP id 98e67ed59e1d1-2e95e21257cmr10927134a91.38.1730724929339;
        Mon, 04 Nov 2024 04:55:29 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:f5f8:ffa1:d9e0:6eab])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93daacb4dsm7534611a91.24.2024.11.04.04.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 04:55:28 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 stable@vger.kernel.org
In-Reply-To: <20241029095411.657616-1-wenst@chromium.org>
References: <20241029095411.657616-1-wenst@chromium.org>
Subject: Re: [PATCH] drm/bridge: it6505: Fix inverted reset polarity
Message-Id: <173072492636.262894.11094550143215575349.b4-ty@chromium.org>
Date: Mon, 04 Nov 2024 20:55:26 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_045530_784371_C0E2BBBF 
X-CRM114-Status: GOOD (  10.71  )
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


On Tue, 29 Oct 2024 17:54:10 +0800, Chen-Yu Tsai wrote:
> The IT6505 bridge chip has a active low reset line. Since it is a
> "reset" and not an "enable" line, the GPIO should be asserted to
> put it in reset and deasserted to bring it out of reset during
> the power on sequence.
> 
> The polarity was inverted when the driver was first introduced, likely
> because the device family that was targeted had an inverting level
> shifter on the reset line.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: it6505: Fix inverted reset polarity
      commit: c5f3f21728b069412e8072b8b1d0a3d9d3ab0265

Best regards,
-- 
Chen-Yu Tsai <wenst@chromium.org>


