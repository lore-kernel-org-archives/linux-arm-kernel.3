Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93943C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmb5ZYsqks7WEIdeRWH6smgklDya3V2PeA5rJDQKGQU=; b=0w4bW+SMMwbpfhQXuQMMsgUjF5
	SFRjBT7NXAL25aq5MEjEHxWtr9JkHCL1O9ubLuPvc6JG2JNYXbrh1lyQM9ISlcHNOiXlGY2S97WY/
	TIi6CwEeS88nTx2ZGNJ6fWdlTyL0MhCplahGK3e2mNNsEXsGqhYCZ3oqIC0otD57XpSMTVAfAwFYz
	rqeu582f2lLrQjkfMw+Fcz/N+n8ckpLYDRqPbsIN0SbzTzNn5JB1QlBIIfpDSx+usFXg7K/YubAun
	4yoYoOQ47P0cetE7beqfUGtu4rooyG/v5VI4Um7iAir/hGcmm/l5eX0kt2pyKvMgLSENgfRmhXZWt
	Z5cRos2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vSm-00000004bJe-0Pt7;
	Tue, 22 Sep 2026 08:02:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vRY-00000004aFx-3aAJ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qmb5ZYsqks7WEIdeRWH6smgklDya3V2PeA5rJDQKGQU=; b=pKm2K3DgFiVdOqCJh1XsIJNUS6
	VYc6Pqze+MFf3raHN3qzrTAumbR17kEzu+0gCBxXH+HVHhztV7F32NKz0YNi2jEeEdp9P+FdM9pUM
	eKz1OQUy4MQOfR650lAq6qvzz4lOpWF48EXU4DeDTjhLJZlVwejZQti2KrOAAJBTw82y5V2WEcwdf
	FY5IxW1XYlYhPLqDgB2/O+wl7si+mM7xnlZON0b8HIltCWkBUskswAIXE5g/VrKfyRv/jlFeJbFxT
	OG2amHZiEwRb6p4r7G43rjpovzuwNKBDODWvqwZI7jz8O7ZjIEBTd1xC1i46hPp8of82SRVlMaJDk
	qcK2Ivvw==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8vRR-0000000DEcv-2uaK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:01:33 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49fbca514f8so2712505e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064088; x=1790668888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmb5ZYsqks7WEIdeRWH6smgklDya3V2PeA5rJDQKGQU=;
        b=QCIkHLVd5fo7ObokPMKPh0TPHfo4cwK/3znDcNNYsphNKAJFu0WxKhDwIIRjkSUZ2f
         7ZlumTYRtxq9ScNVT5E4BjyDrOrQ+zCij96l/ZxsSgmkgY8mXvkNkeUIMjSpwErXdjSY
         RQXrZu13vmAYuutsheqTIFUGmHJZC61kT2tK8x+F60MiJzIsuiCMYQyst6EBoDxMXEwe
         aJ5+UZ9VIf7xV1jGlI/JJt7W74nlUWRdAsdwjpf4q0tbz7nhzKmEQEMHHpQfADXKKMpj
         6b3DulTklKjGsGZN8aMWZ2bwLusY8re6pTqGGUVtYm8jFJraRl+Uh2PYPxlJ79fqNWol
         mxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064088; x=1790668888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qmb5ZYsqks7WEIdeRWH6smgklDya3V2PeA5rJDQKGQU=;
        b=Ul15JH/YTeUyy6BLpc2qt5FNM1y+pmMCKw62Vx8IsLFQxQ81EYafUGrZqzMvFUTUBu
         zVUaFcygHnTAyVmUyb6ZcNdvzIT81wgu790C8Q1yc9dD+ybx37SbBOk/Cy8lAIRVxQGp
         5lXX/yQhtMgZQX1tjxKMtJCpfR4yyxIfalUdw0W2Ee3js3vmf3hduxPe3qPYc8/IIbkE
         maIxVmweZyl+Td6DtL4o53o5QGYCt7JYwlCfIqKIznApw8xCnjK+DbfjUr7AzO9oW1J0
         3lOgGZZ1PT788itfAkJT/qVrfA+XDE5EvFD67VNJAIvJOyBiZ2V50NoWSaqrc3caQQK8
         bOFQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6K7D1KB94I7wdAlxFDWZHlanKfqO1SYVEpZ2pFPMjwdj2v7WeqJNmc7tACFFZhjO5mGkVo9+4b3Zt8MB9ZISe@lists.infradead.org
X-Gm-Message-State: AFuF++mi8wH+hufSfSiSK2VEKGHXWqmffpjO2mPFK/tIhdZl8BFWm2Tr
	SytRFV8iQtIYz7DObe5VneCtk55NMEgbjh/o0a83J/c5NnKHkpZVJBbl
X-Gm-Gg: AYBFou1bXgJFpSWLw2IVDaD38+gflca/ca+UOH6O9H8tu/KTMd6GsRuZvbdD9l9IgH1
	ZoF+g3zDFcShwYwhimrSgruJYIUHAk0hlAebarSFOn5L1HVekPhEaDs/Noq+YJMeNVPR+hSvBf+
	xH8e638DwHsyGMM33uiL3UhtOds+TyCkt88DKDQ3zS+e4HhnEihRIS1yCrEUTK+4zJXhH1/1EDL
	K2mG3iz9ZhzM+p5W75cu5+oqmECKg0ACGYmmS41LMmH663Yxf5kIA+qC8TY7ud+B3ljap+2PITE
	kb3g2Wo1ZS4RJvdYe3bbwOQ3IjfmIp6L86RTBBWYSl8TlMY+kTOIXTUO95zmUfgSfPPhNaGxKM0
	9eeEN0BPft5Qp8Zfy1ncSiZYVlRrC2pp6iTiD+ItupDaPtXgtCuZ29rlhhqlN28hn6GI4P5DJmC
	S3r5gwpzEPUCqvm+m33ivjN6nEsl1WPzhhOmlxroChXRsZa02GGHRFGQm6aqsI1RnP2BVkSvU52
	HVcO3jqdMMYi6cWduZVSpNIThx6Qu7WyecYdXcXztw14MszA/+IsZCJE04q46cfvdDzhPFq7tgC
	278=
X-Received: by 2002:a05:600c:354e:b0:49e:479b:c13b with SMTP id 5b1f17b1804b1-49fc7dff668mr165624765e9.1.1790064085766;
        Tue, 22 Sep 2026 01:01:25 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm18248625e9.2.2026.09.22.01.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:01:25 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2 01/11] accel/rocket: search every core slot when a core is removed
Date: Tue, 22 Sep 2026 10:01:04 +0200
Message-ID: <20260922080114.44662-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922080114.44662-1-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_090129_922979_A26B0CA8 
X-CRM114-Status: GOOD (  27.45  )
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

rocket_remove() decrements rdev->num_cores for each core it removes,
while find_core_for_dev() searches slots 0 to num_cores - 1. Unbinding
the cores in the order they were bound therefore loses the last one: by
the time it is removed the search range has already shrunk past its
slot, so find_core_for_dev() returns -1 and rocket_remove() gives up
without doing anything.

num_cores never reaches zero, rocket_device_fini() never runs, and the
file-scoped rdev keeps pointing at a device that is going away. Binding
the cores again starts from that stale count, because rocket_probe()
takes rdev->num_cores as the slot to fill. On an RK3588, which describes
three cores, the second round lands on slots 1, 2 and 3 while rdev->cores
was allocated with room for three:

  rocket fdab0000.npu: Rockchip NPU core 1 version: 1179210309
  rocket fdac0000.npu: Rockchip NPU core 2 version: 1179210309
  rocket fdad0000.npu: Rockchip NPU core 3 version: 1179210309

The write to rdev->cores[3] is past the end of the array.

Nothing in tree reads the core array often enough to notice, so the
overrun is silent today. It turned up while testing a devfreq series on
top of this, where a worker walks every core a few times a second, and
UBSAN caught the first bool it read out of the overrun entry:

  UBSAN: invalid-load in drivers/accel/rocket/rocket_devfreq.c:47:10
  load of value 5 is not a valid value for type '_Bool'
  Workqueue: devfreq_wq devfreq_monitor

Record how many slots were allocated and search all of them. Every core
is then found on removal, num_cores reaches zero, the device is torn down
and a later bind starts from a clean rdev.

This does not make unbinding a single core out of several work: probe
still takes num_cores as the slot to fill, and rocket_open() still
reaches for cores[0] whether or not anything is there. The fourth patch
takes care of both.

Found by unbinding and rebinding all three cores on an Orange Pi 5 Plus.
With this applied the cores land in slots 0, 1 and 2 every time, whichever
order they are bound in, and the shared supply goes back to a single user
after each round.

Fixes: ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Tested-by: Jiaxing Hu <gahing@gahingwoo.com> # RK3576, two cores
Tested-by: Sidong Yang <sidong.yang@furiosa.ai> # RK3588, 3 cores
---
Two paragraphs changed from the standalone posting, which this series
supersedes: the one on unbinding a single core now points at patch 4
instead of saying what is left, and the round counts are dropped from
the last one. Posting:
https://lore.kernel.org/r/20260904125936.26234-1-royalnet026@gmail.com
The two Tested-by tags are from that thread. The round counts were
taken on a kernel that carried the use-after-free fixed in 8/11; they
were re-measured with the whole series applied, see the notes on patch
4 and the cover letter. The single-core unbind and rocket_open() cases
in that paragraph are 2/2 of the lifecycle series, now rebased into
this one as patch 4:
https://lore.kernel.org/r/20260731064933.12548-3-royalnet026@gmail.com

 drivers/accel/rocket/rocket_device.c | 2 ++
 drivers/accel/rocket/rocket_device.h | 1 +
 drivers/accel/rocket/rocket_drv.c    | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
index 46e6ee1e72c5f..efd004194c1af 100644
--- a/drivers/accel/rocket/rocket_device.c
+++ b/drivers/accel/rocket/rocket_device.c
@@ -31,6 +31,8 @@ struct rocket_device *rocket_device_init(struct platform_device *pdev,
 		if (of_device_is_available(core_node))
 			num_cores++;
 
+	rdev->max_cores = num_cores;
+
 	rdev->cores = devm_kcalloc(dev, num_cores, sizeof(*rdev->cores), GFP_KERNEL);
 	if (!rdev->cores)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
index ce662abc01d3d..c62d567010696 100644
--- a/drivers/accel/rocket/rocket_device.h
+++ b/drivers/accel/rocket/rocket_device.h
@@ -19,6 +19,7 @@ struct rocket_device {
 
 	struct rocket_core *cores;
 	unsigned int num_cores;
+	unsigned int max_cores;
 };
 
 struct rocket_device *rocket_device_init(struct platform_device *pdev,
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 8bbbce594883e..2bcfe4ab3c68f 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -223,7 +223,7 @@ static int find_core_for_dev(struct device *dev)
 {
 	struct rocket_device *rdev = dev_get_drvdata(dev);
 
-	for (unsigned int core = 0; core < rdev->num_cores; core++) {
+	for (unsigned int core = 0; core < rdev->max_cores; core++) {
 		if (dev == rdev->cores[core].dev)
 			return core;
 	}
-- 
2.43.0


