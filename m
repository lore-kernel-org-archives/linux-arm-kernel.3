Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E150CCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 08:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H57ytt+CGjRPah9T4NNX0HJjHszWwEHrR2pXvanUoG8=; b=dcBtG8BlT5sgZisAfRtuNIzQLx
	DjvyBXBAPNFspe6Qpspy1XEK0SAP12FfEuw6Y80ydampA8wdDNNlV5OvUK+asTpo6JWNMq2RN768f
	MeI61k5nZ1TqQsEk4CaUYCopmHnge5R6gKhIm8EWnfMtnO1lPHDcpcNl/VQVh4XLE1dy/XU2Suqci
	EJjSj/RGR60Y7k2NB/lHtAOU+RS2wThLnx8/vSY0JxwGd3zGDomHWDGDWoWIjuMupzym1+J636Z9H
	ix63DVarHEx8W5ag7m2hWFuMtWL9yD9m7ZsxKmq3VFtTd5HEFy0bLgrXvPPP0E8Stg5+qxjm7S/+7
	QXJY7OtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhl0C-00000001aB9-0uyH;
	Mon, 19 Jan 2026 08:52:48 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhl08-00000001aAp-3bZq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 08:52:46 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-6420c0cf4abso3304019d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 00:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1768812764; x=1769417564; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H57ytt+CGjRPah9T4NNX0HJjHszWwEHrR2pXvanUoG8=;
        b=QFHaAqPR6TCkLqhs4BrKR2yvuF+rM6fG6wlBEv6MHmFp4VkEEWSwlrjcEXJWhXjkRf
         vK/Qatw3oxv+bfr7CYBCXDwGvTF9Tqw6XhvX0JJOuHuhjg9JAFj4y5p0W+TeaeTW6BTY
         59PClBETmT6L/7KwkyzB2okr7HFHB76txjsOMBH4bd5Oh3S+JTc7pY0qmIpGX9H5VpdA
         eUg8M5dWYl7+mUZ83/wprN+0D+iAL7NNyaZmzQ8bADFRDATq1Ke53TDpkOtI7q1fjQQQ
         dEMfcqqZEKmgOXwCfE5YM+UGERweDL6G6ffHDzi2QMS/MSp6m8cvWc85mY33XaizuCWI
         ihEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768812764; x=1769417564;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H57ytt+CGjRPah9T4NNX0HJjHszWwEHrR2pXvanUoG8=;
        b=oOrCXEtOai05iCaF6RSsXSfXJACqbkapB7xseb43ciHEuiCCHNShFwJUpjzOE9weOB
         LHSU+PwfbiGePjeXGcmU1yzICOTRiMGgdj36wAQ3cjl58ROyN+kC1PHX36EMirVLXwrl
         xdigtvVCJyc1p1jVSaDle5Gj89RHDwMfiq7SL207a0bj+J7cz4tcRKbvcQp5esBUXgQi
         /teGIGuI12rY+D5NkFzBftVTTrZRw+cdUuv7F/2mBJciFvPSNDtdEjMl07A+Bk+nLTCc
         SQJSeLaDM4PtNBVvHlnDU17vwvymt61evtAL5mpr0w0z8wlIzO/Nn+FQep5it8xEJxiW
         AJdQ==
X-Gm-Message-State: AOJu0Yw+8KXxE6LZ2Kb1ffBBrUMuVxk9CzRsnNzKN/lKLqSE979G+7xk
	fqDF86JuHt0baXNAUrAJS44ETtGtUkCqR0DI4XgDQo5K36bQ8W9Yj62LpVD+x2N3JaovEIewdXa
	1+qBqc+/GjzxeC0AUC2yVEJFqwj8GmVWCwh/Gtmjk
X-Gm-Gg: AZuq6aJ+3Jh95JGrNCR6+IGvPvgy3P5sS/8XwrHX+KxdW0+s0Px0wZCzNVjIPdkYsnv
	fHWfPWpHlOAOFdWijYkM24Zptf/Ia3dSaE6EkeqHfDHb0adpjMJ7kJUK+cWnXZ4BA7MnkqFzsGp
	BdlbLUIqx8UoZUH0ftIhmwbdHEKFsdVAVXsYEEoqg4E59Sk3Vr6rCkYVY/NBQ3RHIOhwRVuiZEn
	02TFWkArt5VIzE7HJjHDQzsmYA9DTk+0EZl+2bAJzhtZU4PnTphQdQ5gWO1yVdRHnmZjwDE
X-Received: by 2002:a05:690e:1507:b0:646:e379:5ad0 with SMTP id
 956f58d0204a3-6491648acf2mr9214573d50.17.1768812763695; Mon, 19 Jan 2026
 00:52:43 -0800 (PST)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Mon, 19 Jan 2026 09:52:32 +0100
X-Gm-Features: AZwV_QgqjEXi5Tc-0GhpMuTQWD2vz0XHZwPZzORCGW_nu9b6y_UAvgVHFpS1w58
Message-ID: <CAHTX3dJDXwA-y-DaJbM4x+UEBJvwhCr_xz4xGf0kF7_8ufvNWQ@mail.gmail.com>
Subject: [GIT PULL] arm64: Xilinx defconfig changes for v6.20
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_005244_901693_A2E303D7 
X-CRM114-Status: UNSURE (   7.64  )
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

please pull these two patches to your tree.

Thanks,
Michal

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/xilinx-defconfig-for-6.20

for you to fetch changes up to 43cb48478719707b3ab115112b9e0168292c8270:

  arm64: defconfig: Drop duplicate CONFIG_OMAP_USB2 entry (2025-12-15
09:05:45 +0100)

----------------------------------------------------------------
arm64: Xilinx defconfig changes for 6.20

- Enable missing drivers by default

----------------------------------------------------------------
Lad Prabhakar (1):
      arm64: defconfig: Drop duplicate CONFIG_OMAP_USB2 entry

Michal Simek (1):
      arm64: defconfig: Enable missing AMD/Xilinx drivers

 arch/arm64/configs/defconfig | 42 ++++++++++++++++++++
 1 file changed, 42 insertions(+)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

