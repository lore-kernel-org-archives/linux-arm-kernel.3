Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB3EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 17:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vZs0kvYLOuRfHTv6z5iXYMg9cSYr/fFrCfQbRsLZpik=; b=VmQTVLfFRb4S6UydavTy36f17Y
	dV0GlOu4dPSY2KZO0g81zRE8y8Hv7PF5WapyMIkLP5w60Q974geLZVgNMZZZ5zj/cs7Fnac7HFSk6
	JKo4T1B85q/h92B+Dru1m8Kt0chAP07QZBqwGZ6D9dudcQBxVkP9pXN6TyRllodDI25kWO6qIMrg0
	K1azn0L1BJPyiiUO04T8xrhkoTqQ0KWpiCdpsaUbFGTXEuyVlkmYGsiwlWwwajJxZkh1UxvDU+fb3
	sjGnV6IroEvp8GgKL18u3xXOHOfKIUaM1BF2qP0xGCNciZRc/75cq34++10q/fMr6adqCOvmSXUFi
	FLahXQCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQrhb-0000000G8t7-1GxZ;
	Thu, 26 Dec 2024 17:31:15 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQrfu-0000000G8h0-1fKz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 17:29:31 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21675fd60feso101445555ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 09:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1735234169; x=1735838969; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vZs0kvYLOuRfHTv6z5iXYMg9cSYr/fFrCfQbRsLZpik=;
        b=kjtRviV7Y9mTGd2WuEOcQ6aHcT8OEi6h3TWngTWOnd/9f/jj9PumxL0IJeiUMyEvc5
         wZGbwilflsrC57iUACU0PPUbrjFcJK7w4hovJ2GIQKr1PPSgGOulgcWNAWqiod4V9QIP
         BLkVbY2NWI+mK2nO98ol7TezQ6VTOtFOYZz8Aa9PPfnkenVWrfbq6edND7wUBMXBkbI+
         3Nj+tHfKokxVwXrvG/ASNuLPvcr/rkpQQVybS7mCZp6NIySxjx4ZkHUp5cNuCt8+4Ro7
         w/DhTbKzTcOjKDShp5ceiaNC7kFxRgLDdJmPQ94zl2/eBiaNb8SN0xnT+VkgPTzg/qoP
         It2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735234169; x=1735838969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZs0kvYLOuRfHTv6z5iXYMg9cSYr/fFrCfQbRsLZpik=;
        b=wYjwEcIZ8I2GlHApTMUvcpo/udTq4/apHtfbIBgLSxwHWzvNhfXQW4nG+vTF7JxVc9
         VcYmN1LunxNHvCxn1n5V8N0sZvrD8Vr2MC6cKpfF154a5wF30LaIwbNmV0BSnENZnWSf
         1brNvfuQpBslt6GiFRk+b4kTbSWQPuIL96R6T1Zt4DV6vp/UhJfQDKgwQ+m8iOJ+xADr
         uq8fUgw9sOJ4eYExE12xi2l81BwJXX0qofifs72b5J9r6PdcQz4sXcNDheaPUPLz+bM9
         qrqzNQ7boL8wwtwG/vIQfSsHljtLSXJ0f6oa2W9XIW19h6JM4OGN0Mid3dgzjRdJguj8
         ZTbQ==
X-Gm-Message-State: AOJu0YxKEUb7asoTzZYm/21TfyFeszrRiUlPO2setQ2Bq+jrjyWGZZYW
	h42TlWFNAa4Betu36TN2obwXSHUdBYzH5BfDWzP4Vrbh35X7yWMZKBLHixlIxws=
X-Gm-Gg: ASbGncvdmFYDoaWcvTKrxNlyswqxXejf/VZ+lAUdlogP1gYx/k8Gg7CgESTr+cajcfq
	ySM75k8t6dFQ8yz6IQa/E/7JUdVmuyq5p2VExoANYOR5nL8s/vgoN5xOz/RPZ/6Tfgj19TkNVxV
	sjljq8vOL8UpYh7/jIGHxpgIaiB7ufdFtGhR/kizjTXXVsurX1a4ALPNiKJqfYGONDWlb8feAjz
	jlyp3/i21OkwFWk8UbaO0eGxDKXV6eD+N8CXNkM/JnNQcI55S2NSyEg95rzs7Oq2d3WQZmS
X-Google-Smtp-Source: AGHT+IFyoBnwfgS+bL5VqV/tXqxDzNnsZyvyXWVPiNhDNb+3J0d/V4RzklQgjnNd57C69SE8kuhYQw==
X-Received: by 2002:a17:902:d48b:b0:216:5af7:5a6a with SMTP id d9443c01a7336-219e6ebb6d7mr339976965ad.32.1735234169044;
        Thu, 26 Dec 2024 09:29:29 -0800 (PST)
Received: from tops-ThinkPad-E14-Gen-5.. ([2405:201:c00a:a918:ba33:f9a0:ac68:19f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdd9bsm122027395ad.132.2024.12.26.09.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 09:29:28 -0800 (PST)
From: Jagan Teki <jagan@edgeble.ai>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Jagan Teki <jagan@edgeble.ai>
Subject: [PATCH] arm64: defconfig: Enable ROCKCHIP_DW_HDMI_QP
Date: Thu, 26 Dec 2024 22:59:18 +0530
Message-Id: <20241226172918.36023-1-jagan@edgeble.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_092930_647198_B6D2CC22 
X-CRM114-Status: UNSURE (   8.81  )
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

Rockchip specific Synopsys DW HDMI QP controller is common across
RK3588 SoC.

Enable it to access all RK3588 platforms by default.

Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dfa5c8d5b658..988e6d9cee7a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -876,6 +876,7 @@ CONFIG_ROCKCHIP_VOP2=y
 CONFIG_ROCKCHIP_ANALOGIX_DP=y
 CONFIG_ROCKCHIP_CDN_DP=y
 CONFIG_ROCKCHIP_DW_HDMI=y
+CONFIG_ROCKCHIP_DW_HDMI_QP=y
 CONFIG_ROCKCHIP_DW_MIPI_DSI=y
 CONFIG_ROCKCHIP_INNO_HDMI=y
 CONFIG_ROCKCHIP_LVDS=y
-- 
2.34.1


