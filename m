Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C37CC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 09:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kYGUvnwRlJvHmfuOgllitczl0CMCq378Nwa9ArxRXpw=; b=L1EI6j/qmgC5n3f3mjjrWKkQSs
	jZ3nXRkSg5rK35XcupZbc4AHbwQExbw+nPFOvx0kyVe0/Pb8Qf8HTtGfvpUnNmITLPsUHQSiH+x7M
	AcVkRdeKOOgkTIXbaKbP8FofIq6yu7gqWXNV1eZCm9RPMy1hDCEbLczm7R3Zb0m66AD1wJxld/zgA
	KLWuB4csekMrl7wvAfhIqHTZ08cp4j78XERpr/w4CP2FP+OQ9HbYzjcO8W0xPRSozVzRT5jJoNqm5
	GEqIcpDcsLVPgq0+fCc+3Sjc8hToiP/s5MXqS9HuMZd19Bqjfhbyj8B09atz5nvrHg0q3Zjk2bGb4
	HgEe0wCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taAV8-00000007PCb-49F5;
	Tue, 21 Jan 2025 09:24:51 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taATV-00000007OvM-30Ym
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 09:23:11 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fdafso10840838a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 01:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1737451387; x=1738056187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kYGUvnwRlJvHmfuOgllitczl0CMCq378Nwa9ArxRXpw=;
        b=1VvAqbcrKSOgcFPj+cJMFkgwFGKHls9ROmI2vNozJz7Aag5pSB5dxIRgGQC1CXajIz
         JB9V1FkxxfT+LQVq38P7rfQddFmN0mAA6EDy7tJuyrBB3es7WNoZJvnr171mNOwvjiuk
         OKM7gV5xwY2nwbR1mX3my0eeqk76eLsIw0mLwz7yNeHcDRgMDPPdZiLhWe2TpLbB+p62
         aszLzbwMIZuYt9zbnfosHb38Di+SyiJGvAwq/r/pERFsLv/ZTmT/6pi/314LkTRHwMog
         6ql6DYBzVsUQPXxKLnZUot8vNSRb12u5TsEemPDnhBeTEF5sZ8cr++mP3FD8L/0P97nK
         sIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737451387; x=1738056187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYGUvnwRlJvHmfuOgllitczl0CMCq378Nwa9ArxRXpw=;
        b=ntZcafh9M2gd9I5Gv7RxTC2itO3OC/cmD4VAKwcM5NsndEQw11A4xhjuniJSHXgjO7
         1mgtt8fl+sjZYAAWaeWAuxEBJwQe3sWFrG5SB0TR+Cdm0Uw0sQUWW02jSiRqYYXK89ee
         IZrKWmdAJfml0nh2ZKZyaZ6xWPB/Xx4X4vyjoXH0bf7Nf3K4ozVrhaCNdTvwyzyOWED2
         pRfxSeFVOl4SYgPEKFiL9/JVoOgkCOp+Osbg2AR9ckVMIoqe/8GJLzDOw7Mx0bEm19ZV
         vUvo+VX3UaxvWsOF04TeUeYCOdapQCudmTPbvrJs05RTdE1UHN1FUo+c/Jib/dlUOgTq
         rL7g==
X-Gm-Message-State: AOJu0YwNxhUPFCHSLQvQjEVxWdu/GeCJhctcEZnGwgDluR/qcxtyv4JC
	jWaIdgRn4TR/om/UgkRe7IeNBaiqeLs7vtXk93ZM1JobK3FKxiVhOW5p9l6kHE9lzl82iPqVwdW
	gHvg=
X-Gm-Gg: ASbGncvJTYdM9+/t5/79tQmGOYSASup8On4CLsN9F7xVKfGUTE4cwbwTfu81aGP9kL5
	aZXYmRrQnClwsnUjFCe2i1uXmJ22Ek94XwFaJkPPRuZiacbWHnml+TD3xQ73Ea7tVbaF5/2JYZR
	nJm8cJSvoYO9VwuwZW6lreHowXeQiYkdc5PWj9DD+ZHMyS1rxMS5dmUtcICpHBJypzT3YNlk2eM
	YF2Ofua7p7zgcP9SdoxB6PiccXcChmzxyg7dPx8vonBI6YijNAbSYrVeEsQjHEbM/4V9S+0pVLX
	7lWRufjhuRW5uVy1l3MMPaGgtw==
X-Google-Smtp-Source: AGHT+IENVL6ioAEkP6ftEz8Di5TBDA/bVHDPQzMyul5XEMABgKbzLzWD5IBD9ujI4KOZy/9m6JqVrQ==
X-Received: by 2002:a05:6402:3590:b0:5d9:a91:6a47 with SMTP id 4fb4d7f45d1cf-5db7d2f577cmr17562098a12.13.1737451387263;
        Tue, 21 Jan 2025 01:23:07 -0800 (PST)
Received: from lczechowski-Latitude-5440.. ([78.9.4.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db8942cad4sm5681726a12.60.2025.01.21.01.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 01:23:07 -0800 (PST)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
To: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: quentin.schulz@cherry.de,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Subject: [PATCH 0/2] Disable DMA on secondary UART on PX30 Ringneck
Date: Tue, 21 Jan 2025 10:22:53 +0100
Message-ID: <20250121092255.3108495-1-lukasz.czechowski@thaumatec.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_012310_125100_1C0C5760 
X-CRM114-Status: GOOD (  10.52  )
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

The PX30-uQ7 (Ringneck) SoM has two external UARTs, connected to
uart0 and uart5 controllers on the PX30 SoC. The uart5 does not
expose RTS/CTS pins on the Q7 connector, as they are used for
different purposes. It was observed that UART controllers without
hardware flow controller behave unstable if the DMA is enabled.
This patch series moves the pinctrl-0 to SoM dtsi file and uses
/delete-property/ to remove DMA from this UART controller.

Lukasz Czechowski (2):
  arm64: dts: rockchip: Move uart5 pin configuration to SoM dtsi
  arm64: dts: rockchip: Disable DMA for uart5 on px30-ringneck

 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts | 1 -
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi       | 6 ++++++
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.43.0


