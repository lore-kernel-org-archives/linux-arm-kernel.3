Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E508D60D17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 09:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4fsqGfyvQJKmn8zoPFdQOQX2dN/AEtzDhH6yM067EA=; b=G6MnKoaSX6TN6jfEFyP/j4C+kk
	1EWj6fFWlId4FRxqKysJ6dsh9L0OXrw6O+AapAZD3M7/vF/p+i33vGFt8MA/1ZS6OAtzjKFOfhzxz
	qaeKge3qKJdLJFtnIlcoYB1KHCbPQk9vmIq5Go6vLWUhW+DveSFD28Y6zceiS9oDA2KpaHOZO92v6
	3wd97bFUkdqh0Ur/svssaEReXGdkZAWqnTVlvziRGf5SAS83evdOEtcUDIqaUixd57Qxvyr6yn36i
	BoBT1A7OymKGc8f9qSM5tX8f/7XV9U+uZNc0yPxNbyY8f3Th9WkeiN+H+qPI5kiB2suRn1fFtPkTg
	gKNuhOAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhAK-0000000Ew9N-0dIN;
	Wed, 20 Nov 2024 09:38:28 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDh9N-0000000Evw7-3oR6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 09:37:31 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38232cebb0cso3190993f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 01:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1732095447; x=1732700247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4fsqGfyvQJKmn8zoPFdQOQX2dN/AEtzDhH6yM067EA=;
        b=WQW5J6pUCscOdiVoDvq90TJYiLCgW40PLpQ2KX6Mj6DT+QldqFCWyTHZbHPZ6oGlp8
         TP3DhsoNv371Ux5eEtPhtcBe1G1ax5kpPOw6bZZIlt17Pt4g+rOUDXO6HoOTrrLQshFQ
         auq1keDfG7I/27L+P7WNSWUojRTEF6NCRFgaWRyywxLiLliY4Pn+oHY+Nz4xOFhfmGbi
         cTToV0Cm2meuTSO5mfKEQC3ejo+senxZ7WaECSLYdYiaJEGnZRKrpgWNsx0cgPv00UPs
         /ukXi2op8O+chFTmFH1/sDa+ii2US5qXA7bxCMduXFVP/IQ/GRxFLhxMJN11qRdwuuDT
         Pf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732095447; x=1732700247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4fsqGfyvQJKmn8zoPFdQOQX2dN/AEtzDhH6yM067EA=;
        b=uOjyqlAYHm83YZ6A3oQ/ojGOmOh3BOD6NJOYiE80aiUGIFrEL0Mx2Qim8K0j3p/oz+
         knD0CBywtjHdYcn2ZR+vxVnDSBjkdaZ1uAVrMmJcPK4GoKU6rH3yXGtbXZNAbSCrNpgL
         eEGtpa495f7w4CFbvnmS4zozPHrEd7izrzdHNZFURE9RJQ3qcjomv++OjxZj+k6xwGu4
         a+dSLcsMlo7EZWFWerkonxs6fQP9f0zY2TLI52d+2Om8ixQCRAvk+lngLtCE6xZgcCIK
         AO6OLlM8G5nLLg2zG+1CmnIhrNuV5WjI2C+grumEquHYbDnzACUlRvv7v36P3s6JnPl5
         jNQg==
X-Forwarded-Encrypted: i=1; AJvYcCWb97oUJaBt4Xm9RafOwvkEOfVe8lZMyT8E9fF3hRIsEv89dWJ33mYkqdagXts8OFKIuasFKkYn26BiioCauFo8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+rJukeR1pVhgFuSx3Vo+RTfpEoID5f27JynvtrAhkKw4bbGEI
	ty9XiopHh4PM8QYTR4Evyt6VmWMxJeY4a41V4JVSh6Cq0lsSN8pxu9qIXNs4G/E=
X-Google-Smtp-Source: AGHT+IERdcVQmp8I/UOWOPIWa5oeyrgUNsR/Mbrq7h+WHYexcjQUaJAOdjbwnyqP/omN2/s+hyZreg==
X-Received: by 2002:a5d:47aa:0:b0:382:6f2:df7b with SMTP id ffacd0b85a97d-38254adf3camr1373292f8f.12.1732095447599;
        Wed, 20 Nov 2024 01:37:27 -0800 (PST)
Received: from fedora.. ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38254933c32sm1555709f8f.70.2024.11.20.01.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 01:37:27 -0800 (PST)
From: Daniel Semkowicz <dse@thaumatec.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	quentin.schulz@cherry.de,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	vkoul@kernel.org,
	Daniel Semkowicz <dse@thaumatec.com>
Subject: Re: [PATCH v3 0/2] MIPI DSI phy for rk3588
Date: Wed, 20 Nov 2024 10:36:38 +0100
Message-ID: <20241120093702.9018-1-dse@thaumatec.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241113221018.62150-1-heiko@sntech.de>
References: <20241113221018.62150-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_013730_211243_BBC98C89 
X-CRM114-Status: GOOD (  22.43  )
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

Hello Heiko,

> This adds the phy driver need for DSI output on rk3588.
> 
> The phy itself is used for both DSI output and CSI input, though the
> CSI part for the whole chain needs a lot more work, so is left out for
> now and only the DSI part implemented.
> 
> This allows the rk3588 with its current VOP support to drive a DSI display
> using the DSI2 controller driver I'll submit in a next step.
> 
> Only generic phy interfaces are used, so the DSI part is pretty straight
> forward.
> 
> changes in v3:
> - add Krzysztof review tag to the binding
> - address Sebastian's review comments
>   - better error handling
>   - dropping empty function
>   - headers
>   - not using of_match_ptr - this should also make the
>     test-robot happier
> 
> changes in v2:
> - fix error in dt-binding example
> - drop unused frequency table
> - pull in some more recent improvements from the vendor-kernel
>   which includes a lot less magic values
> - already include the support for rk3576
> - use dev_err_probe
> 
> Heiko Stuebner (2):
>   dt-bindings: phy: Add Rockchip MIPI CSI/DSI PHY schema
>   phy: rockchip: Add Samsung CSI/DSI Combo DCPHY driver
> 
>  .../phy/rockchip,rk3588-mipi-dcphy.yaml       |   82 +
>  drivers/phy/rockchip/Kconfig                  |   12 +
>  drivers/phy/rockchip/Makefile                 |    1 +
>  .../phy/rockchip/phy-rockchip-samsung-dcphy.c | 1647 +++++++++++++++++
>  4 files changed, 1742 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
>  create mode 100644 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> 
> -- 
> 2.45.2

Thank you very much for these patches!

I tested this series on top of v6.12 with DSI/LVDS bridge
in the following configuration:

RK3588 Tiger SoM (dsi0) --> TC358775 DSI/LVDS bridge --> LVDS display

I did not observe any undesirable artifacts on the display.
Display blank/unblank works correctly.

Tested-by: Daniel Semkowicz <dse@thaumatec.com>

Kind regards
Daniel


