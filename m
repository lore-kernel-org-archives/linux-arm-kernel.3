Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3133EC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 13:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jv3tIOWEnK/99KAUgJnbIDJX1kKr30Yc7XPU554aBtU=; b=zuQuiTMWIEHuI4h5rJkIG/jnv7
	byGj0c+FXVEphcehSSnv6MQx+TU+89d5UaEMtB7iD4qOXyLYfMrVwxU2JhpDvWau7oiyZWdHc4vcS
	X0VpuoVGaOlKBoztLN1j7t3R0UlXN1XQlEf5OshfNjYDWBSOzBdPbBPWgwqP0BAFsB+MEIz4DZOFj
	6h7qsAtmAYdPNdKiqKye4fikCH8xFYPtqnmgwuOpYIJEz/1J5Qqj1g2guCTiQudL156Nr6QrR4RAp
	kXMQiYSy3PrQdAtjPGdi/ofdvoxrVXOZZ35JQYia5tKAyISgZsKBiiTyUGoMguNjqzX1aOYjDCRZh
	fZoADUXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrbw-00000000uKe-3fqP;
	Tue, 25 Aug 2026 13:54:44 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrbu-00000000uJk-0E5K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 13:54:43 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c197e7e4e94so838074166b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 06:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1787666079; x=1788270879; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jv3tIOWEnK/99KAUgJnbIDJX1kKr30Yc7XPU554aBtU=;
        b=s2sf1mJMiXEAtwhSGLOxR8xxqOhhFIc2N0XXXAhItRmxhsAAlJTUWAluy2ZFccyipK
         lh3/y9We9lK3o/RR3t6gUVHFwz7+mjptCZfq45e1tLHe7N8UdluLkUwoz0gB3NvfB0eh
         Ofrnni2B4j/Px88XGhDAwwO3Txv85SfsMSoBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787666079; x=1788270879;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jv3tIOWEnK/99KAUgJnbIDJX1kKr30Yc7XPU554aBtU=;
        b=NA0rfLtmXldGkcXafk/4FTtM0RQIwotkviMTGg3NluCUQa1s2V/X43in4rQsDozjJB
         rb5EY0WIa5J1AhQw2ZE+KB4AGhwI1GJyoMDuutTQ8LudN6M5Qz1vnw0zPYWfdMOdd4j+
         In0qTX689TAl0HNV5/FUFxnovWi0NG7IrHTKg+B6cIrrm7AV6LK9dJl3bhrVKD8w7wpx
         ncDqtnoBZirGHibJQdGg0Pasr1qtiQP87DjSK/PvH+ywpnWG+L95gkGrLz4VMjvH5P6D
         oJcpGApEF1AeX5eBvPLUTkHWL9mWw2/rrTLeaorv4yAzTNUQm55BvP2I1+MkW4Rwwyac
         6AhQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFZG7spNKT28Zi9nZkva3JKyIBi4N545XTDPfaelA38QLORvFRfjTg3RCApQV6hn1+YWXXAIaBrYYOVbvTqF0S@lists.infradead.org
X-Gm-Message-State: AFuF++lRU5VtNXmULGIDxhs1FeFdBqcMP5AELluHB6HyO4yJYPkAfUSN
	XGnfQNRTj5ecvT9jP0nDQJCMQ9d4s8JQG8tVVtHgEsXJZcKV0TCPaQNCLKewvi4gBZs=
X-Gm-Gg: AR+sD10wNh2FNjnhuxuzTBhkut0dlhX1QOI8qA2W47Nz07kO6N4P0vmoL9N2lDh5hRO
	2G+tfGRtEUJtaemL5V0FnANsf7I9w1ADjMMvRZMMdLq1EojK9eL7n0stPVV6552pYokI7oZexzs
	PH1E7YYx5S1oQmQkq2369L+/HDqDgtzHhX6scZRNzBE9rNRd06TbWUBLFjG2ChgwZu1TSE7Px4L
	CxkDqbesQqyrySfHljH4SpufttQtUH1vREqJ8c60U9AxeHxgJfoei4XQQNPnUQsiPJYBowK29G2
	9uHbHiA5jA29wVNv8tzukgnh6QUkEYVqoPyuritt12MBOFeMrXEnU/gOAIrL99/1SCd4LUbOXj/
	TAkcPwD5Y43lcxYpv1LkNrKBV3b0D4U0Eb99xqAKDhVPUGF33+dxG4xTwOPXpIFwFWtjEmt+Y2o
	VnopTdz2EMUTACdhoPF4n+Aeuax9TnRLKx6Dxy/pro+5n6EtTwAjjYngELs3XcReX4vzq4ImOjy
	zTZKg==
X-Received: by 2002:a17:907:a089:b0:c21:450d:cd88 with SMTP id a640c23a62f3a-c24924b8000mr2955242766b.6.1787666079439;
        Tue, 25 Aug 2026 06:54:39 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968a336fsm1819330866b.60.2026.08.25.06.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 06:54:38 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v1 0/1] ARM: dts: draeger: Add devicetrees for Draeger's M48 board.
Date: Tue, 25 Aug 2026 16:54:24 +0300
Message-ID: <20260825135426.3967333-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_065442_133244_6A328A6C 
X-CRM114-Status: UNSURE (   9.62  )
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

Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the same
carrier and they are cross-monitoring each other.

Petko Manolov (1):
  ARM: dts: draeger: Add devicetree files for M48 Intel/Altera SoCFPGA
    Cyclone

 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 132 ++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3


