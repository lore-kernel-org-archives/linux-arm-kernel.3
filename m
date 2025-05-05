Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9640C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 03:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0dCVqHq8wBzOR2g2ROSfZ/DiyTOOwKBv8XwEDg1LS8=; b=TxeceOIVrAkTjBNXXvxfWhAoLt
	/SxXTVVRVoKI9KOq47XtbvXlTwmlqclNhoye1YJ/KELCQLW6nMboXGaIv8+yv8tLS7uLolKP5WRiw
	OlsmGw7X+IZhoF4nY6tENSUrR41gSAHPZc961LGVbuuRE5tCnt+LkdUn2TZ6oCeAxrEvOYglrIWfc
	XlXhfwKEm+6X1dAx3fECwFrVeSv5GmS1SPg9gJbjh2BfUah8v1NYvWUw9WAQ0kHyAjNuvdr/VHqdt
	D0t0DPugEjQ6hhm7kGeztYyH3w4xdUSKU00uaC8i6A3Hkj0hVZokH3/YWTNMtNMTbEgIbDTJAztwj
	IsXEFhQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC9QZ-0000000A6LU-0LDb;
	Tue, 06 May 2025 03:57:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4wl-00000008yKy-3MDg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 23:10:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D0E084A2F1;
	Mon,  5 May 2025 23:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96314C4CEF3;
	Mon,  5 May 2025 23:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486603;
	bh=eRSeHeY46tLQcIFe1Mri11VeNHQat5CRun0NZB+R5wI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O6uCztHbxoT+Ca2S3iWsq3ZiowefJiPMyjLFlF0wgGpZp63q4XXQynaL2VCGgtjLq
	 PrtMAsvupNf4vBU1Ny0NHbJSqJ+TwFJQsRh3hELhtDfIS5QtT+FO9WHbirgauMB2iS
	 hX8ozZuN+aeAk6u1Dr4qj9v7Th3bQDGS8HJ1cVAHolMSbK8d7MbV8YqntUWc0Ka2N7
	 p/0NXgfzWlApAdAAzJeVb+d+TZqb/bnddzvgRfZ+LXU/fh/keWs3A0NvjInY0EQXg1
	 uolmen/cOuxPZRlvxK5gpMlyC7y7nS180tOGJvXcP9QfeEyTS2O46zU2buURzDfnEe
	 4CCEalrzL30aw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 113/212] firmware: arm_ffa: Set dma_mask for ffa devices
Date: Mon,  5 May 2025 19:04:45 -0400
Message-Id: <20250505230624.2692522-113-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_161003_860721_DECCA027 
X-CRM114-Status: UNSURE (   8.16  )
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

From: Viresh Kumar <viresh.kumar@linaro.org>

[ Upstream commit cc0aac7ca17e0ea3ca84b552fc79f3e86fd07f53 ]

Set dma_mask for FFA devices, otherwise DMA allocation using the device pointer
lead to following warning:

WARNING: CPU: 1 PID: 1 at kernel/dma/mapping.c:597 dma_alloc_attrs+0xe0/0x124

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Message-Id: <e3dd8042ac680bd74b6580c25df855d092079c18.1737107520.git.viresh.kumar@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/firmware/arm_ffa/bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus.c
index 248594b59c64d..5bda5d7ade42d 100644
--- a/drivers/firmware/arm_ffa/bus.c
+++ b/drivers/firmware/arm_ffa/bus.c
@@ -191,6 +191,7 @@ struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id,
 	dev = &ffa_dev->dev;
 	dev->bus = &ffa_bus_type;
 	dev->release = ffa_release_device;
+	dev->dma_mask = &dev->coherent_dma_mask;
 	dev_set_name(&ffa_dev->dev, "arm-ffa-%d", id);
 
 	ffa_dev->id = id;
-- 
2.39.5


