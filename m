Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B371FCAC593
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 14:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MIfjxfI8fjF/JltWwvv161P4lPdGyzyNYzNbvTF3UwM=; b=dAOWN0uVGFtJZpkG3y+7dGOMfb
	AHGckSiuy89LQFaCsqf9ZuiG0Xr6tvjqBwrJ83fbRhUkbU4xSvsZ51kp11Is1boJTKvoqsd1zgkqP
	aG3c6W1+tBJE87pkbmlclP6XvxEP3x4iFOk9f8oq8oLn2Wm89i+51tXGflbW+82WjLKAOwQneDVdf
	LJmvbqxM8HH7H2uK1nr7CiJlMDN5CtVr3R56Ti4rZVh2Pus3p3S9RdZYmBQy2bn2lXjtXubyOy2KI
	8Z111d8tfDWTHoym5gTLK17zMWYsJ1ETm11DrtuGiTDq5Pivviuzgx2jICj8J8gO+mjfMrPVVI+nd
	1QI7d1ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwibJ-00000003f83-0t3D;
	Thu, 11 Sep 2025 14:48:41 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwibG-00000003f65-2Kh2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 14:48:39 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55f76454f69so832548e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757602116; x=1758206916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MIfjxfI8fjF/JltWwvv161P4lPdGyzyNYzNbvTF3UwM=;
        b=tBXjH1TNWHfG6FvstvbUJG7sd4F0dWvGYhDTg4G9p9/Bm1uj2Y2FsGwB4kxAx+Mofj
         HGoDUdW8Ms3FUDVKwfHdPUfgF1cEI12W+AaC2EghranFx+o155Kwst29F0bqtbLzTW6X
         UyOjsGcBBVL2MVyEsUMCwuULWamXhSDketmH+V6EB8v14WmfqbQpjZm6EyY+xiPs0LKJ
         w+Rn4HGe0OSlV45C1Y0msynUL2LLwclYNfxBoQb4K8GYWZ2MBNE2IPU3tfO9hd+lkjBJ
         0xr1kiBMHybOdMFSYl1dtOW0qxaQpBlo9jJMXZbV01RSZ6QvnxOsQWaXa4Uvqubw8D0A
         /71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757602116; x=1758206916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIfjxfI8fjF/JltWwvv161P4lPdGyzyNYzNbvTF3UwM=;
        b=utGXij/pzU9FoeMCzTtUQYNqdPkg1K7CerR0ZrRN/BSYKLZ4S8PGkQfANPkrlWB6ez
         TIw/50P/BUdJ39ICW8gos/JtT+pBVHhpi/ssVtXR8UzXQeeuc3Eh2v6rZUMf+DBy17y7
         2cK5YBLJdQt3/HL8LVpRkwHNr8QQ/6hMQquuptrbA5OMxt4Sd9e/B9Onx8p+ZIorsswi
         a6AyvSXDa/T+cL6EuSWTLBojyN0UZibMee+Rjaip+1ncJf6J8MQiYv42CBtUN/5qOGpr
         tIUh47Uq7DoCaZ2A2qxBcqamgA8xiWYWON32PnJx7fwl2nPV5mQwt4Drz0mfw6QyTMMQ
         vqGA==
X-Gm-Message-State: AOJu0YyDXusJfKx+HfEi2XOUdNpy+EsuknWr4dxhzS8IpvMxOfNjmnQk
	wLxjKoIUFX+AT3eb8RVQFtopPo+9knmg9gvST6FSpvoX0EgDZ4+dce9a+RnQXRjOa7mGrxeeFlp
	+0+gLwdSaeQ==
X-Gm-Gg: ASbGncupQfRFcvBcpDJmVPc0/8v+jZUkPMogrFix89V7M6sXFpeIycYji+Di8k2E24g
	9xnlC+ZMDzPjbovz3xWCdd6lRaPWH+zV8vft+yu3jI92GkQRhpIChVUzt23C52ie8PVAT8PuLpP
	B/q0jLwRAcm/16W7PRFsQP1lZu+ZYzt1pBmbyPg52C4vFGtbqYP2HRIXh/Z1ITwL3A2ABTdDL7y
	60N978lXkKOgYKzRHjrJzuFkoU/z08sF/x/xj7XtroX/6Hjj1ZQsEAei6eeK2hjoMaa3dN0Ncgw
	ShKUneu4ow/cjOYgg2vKbAM7TX6UBzGoJMAq+NHizwR7nn2gO96aFADO4LoUivsIwfsYO15kQDk
	tKpecGhe4yR4gA2Jg2q0usjKs7Kqu/++3SnEFP05GJLOTLxMdlmoqFjtdfYb+ZcOAZg==
X-Google-Smtp-Source: AGHT+IHy6/1NqtnV9by+dmtQKMm6p40le7KhEDevJduhHCh2PDA/H9OMZ7vx2vMMLyLbvjYYlENfWg==
X-Received: by 2002:a05:6512:63c5:20b0:563:3ac3:1ec1 with SMTP id 2adb3069b0e04-5633ac31f71mr5579784e87.54.1757602116035;
        Thu, 11 Sep 2025 07:48:36 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b6116sm473294e87.24.2025.09.11.07.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 07:48:35 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: krzysztof.kozlowski@linaro.org,
	arnd@arndb.de,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	stable@vger.kernel.org,
	Jon Mason <jon.mason@arm.com>,
	Ross Burton <ross.burton@arm.com>,
	bruce.ashfield@gmail.com
Subject: [PATCH] arm64 defconfig: remove CONFIG_SCHED_DEBUG reference
Date: Thu, 11 Sep 2025 17:47:14 +0300
Message-ID: <20250911144714.2774539-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_074838_601616_6FD99B7C 
X-CRM114-Status: GOOD (  11.20  )
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

It has been completely removed since v6.14-rc6 by

commit dd5bdaf2b72da81d57f4f99e518af80002b6562e
Author:     Ingo Molnar <mingo@kernel.org>
AuthorDate: Mon Mar 17 11:42:54 2025 +0100
Commit:     Ingo Molnar <mingo@kernel.org>
CommitDate: Wed Mar 19 22:20:53 2025 +0100

    sched/debug: Make CONFIG_SCHED_DEBUG functionality unconditional

Fixes yocto meta-arm sbsa-ref kernel config warning which
uses kernel.org arm64 defconfig:

DEBUG: Executing python function do_kernel_configcheck
WARNING: [kernel config]: This BSP contains fragments with warnings:

[INFO]: the following symbols were not found in the active
configuration:
     - CONFIG_SCHED_DEBUG

DEBUG: Python function do_kernel_configcheck finished

Fixes: dd5bdaf2b72d ("sched/debug: Make CONFIG_SCHED_DEBUG functionality unconditional")
Cc: <stable@vger.kernel.org>
Cc: Jon Mason <jon.mason@arm.com>
Cc: Ross Burton <ross.burton@arm.com>
Cc: bruce.ashfield@gmail.com
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366cd..4126281665bf2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1798,7 +1798,6 @@ CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
 # CONFIG_FTRACE is not set
 CONFIG_CORESIGHT=m
-- 
2.34.1


