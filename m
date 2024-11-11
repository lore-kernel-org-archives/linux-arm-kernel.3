Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EE0D3ABE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 18:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uuZnyXBdk3QHcPbZuZ4wdiQBJmOvaPtia/X0YSXMhqk=; b=lkonolxkW/e7nH/AZAt/41dEH5
	9uMyTjCkhwFmrbJAULqL/oaZBlLrdXrTuByILOF9QtzmZlulGuKsNM1qnkl2jSmJqB6qBaJMzgQEA
	q38gDUwhM3giWrP9FY1S/aUDtWti5ZbZMuWPjC/0syurJT38AeOfYqrFG3qTUAB6pt1LZSyqk7ehR
	Fwc10jxvTKU6DfEPb7nEyvcthCyOPqzWdhD9WXdBJok8NTujCh6je3nhPqeUTjNMSF8gofqa3/qbi
	KKnJz9ld5uqVh2QBI+vKZdikcktoqmLTuYIWnvV3bHgcDgOE7RlTrjoDWGmClNmTXTPy9RVCMrLk8
	AnyMQYjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZ1h-00000000tEz-2HWA;
	Mon, 11 Nov 2024 18:20:37 +0000
Received: from mail-ej1-f43.google.com ([209.85.218.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYzN-00000000spX-3My9;
	Mon, 11 Nov 2024 18:18:15 +0000
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9ed49edd41so849855666b.0;
        Mon, 11 Nov 2024 10:18:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731349091; x=1731953891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uuZnyXBdk3QHcPbZuZ4wdiQBJmOvaPtia/X0YSXMhqk=;
        b=AtBYAQ/8Cig93LDv9UBsBVlmgkY6XSTg1gM2W2cGIRRhu+GSUAC1zFjx+aQgQfHyBy
         ApnPfMRwn31NiyNszqe41op8pQ4Wxcwl1+eTSRGdDOZwzgUhcMTy4BRaW1kMSTSef8Pu
         f/NtCEJdAYhsu9XWNa/Dd8nWDeAQ33D/hQL6o1nUDNlvKzsmXLDU17jwpBatBibOEJB2
         a+UtzqaLmzrulAXx0f9NvjxOmcRGZhDgMQ/jBqxjlJlDoXpS6HSt7iX3IeNZUNMdjwHQ
         ovrH5dbTgULti+DdxRi2Zapvsxg0kRCnLqRn7qJPn1P2FOIijHu85YPf9ix15Yq5nx3u
         xJyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqoPnrm1OKaG+UJ1OmwrukDXzyNZOovy7/Ej2vaeGaQCvBXQ9UayRINj83SDudIegXnpFxS2y/oYDdZPXR5iUj@lists.infradead.org, AJvYcCUuQ2nX32fjCVVR7E2nkGmTFFzvB7W59wMRsvkgIj8Zq3wmrYW78tKQB2aZqBnXOvRSy/RyhafqNZbKdXeql6I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2XDmBDgLKIgUR60hxsQ5BS2w1jowpAEpiDHUq30xaTyqXUSlJ
	Sg5kyyfJQJbn5nSujFBJcWCVpCZxlE2cG/fwm/eZsEOcpUiaO/ID8h8Thyigbx8=
X-Google-Smtp-Source: AGHT+IGFs+veCOYdFl4AbDVCq/r8ZyxcC4t3ag3b+QKAnXD58wwk8c8uG5tNU8vrFqoP3DjFTYY2kA==
X-Received: by 2002:a17:907:368a:b0:a9e:8574:e154 with SMTP id a640c23a62f3a-a9ef00216fdmr1422727866b.59.1731349091087;
        Mon, 11 Nov 2024 10:18:11 -0800 (PST)
Received: from localhost.localdomain ([193.142.191.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a17b64sm617868466b.39.2024.11.11.10.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 10:18:10 -0800 (PST)
From: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@linux.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@linux.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Dragan Simic <dsimic@manjaro.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: rockchip: rock-3b TF + M2E updates
Date: Mon, 11 Nov 2024 19:17:24 +0100
Message-ID: <20241111181807.13211-1-tszucs@linux.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_101813_866609_C369FA66 
X-CRM114-Status: UNSURE (   9.11  )
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

Hi,

Changes have been tested on an RK3568J, with an emphasis on DDR50 and SDR104 at 200 MHz.

Kind regards,
Tamas

Tamás Szűcs (3):
  arm64: dts: rockchip: Add supported UHS-I rates to sdmmc0 on rock-3b
  arm64: dts: rockchip: Enable sdmmc2 on rock-3b and set it up for SDIO
    devices
  arm64: dts: rockchip: Enable UART8 on rock-3b

 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 
2.45.2


