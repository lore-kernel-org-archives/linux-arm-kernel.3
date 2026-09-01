Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC31C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MR/cQZoK7JPxTk5LPqkidwaMJQfEv51POKdRxNvWHUE=; b=hNEU8HF2iy9FcDR+H7Fp3OiN2p
	fz0jdm+GRXwN/g1Vtb2Z96VWBvJOFedEoD4f3T6qIqS6Dxt+gU/AmXU+upSyRJq8tzMVHuvTNus7M
	486ezWZrozh3f6kKxr/b50qAcJYq/AjslzEU2KTfE7R36wvf6DGIxWAnKNqgGKGl67z7FbZ+4ZOf1
	99CUeTl0ILclIRSPLchsrqMUWQddAm/+/AqRE59qPToW8e7IdgeKVjXzAiSGx9+wA/gqB8fs8Qlr5
	Acq5N4bDMMF7vl286EjOaMbqNe64qejEjTRVCobu2rLDnzq8shdQV9o6acWakgWPzw86e3dlww99j
	PcHqgPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QUo-0000000CW44-1XFP;
	Tue, 01 Sep 2026 15:33:58 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QUl-0000000CW1m-1KCq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:33:56 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4843750de83so11645f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 08:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788276833; x=1788881633; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MR/cQZoK7JPxTk5LPqkidwaMJQfEv51POKdRxNvWHUE=;
        b=ahtQUN7deCnhSB0DI87v2V5QnCxi4i+8cJ0hse4oUg1dWZ1Zp3+axt0bSZeUdIqgE5
         L3H6iRiKfZMsiFLJ/y8wfcPz8nKqZPCw71ALfIwErTTaHmXZ6Ou4cA/kirGiDspqo4kJ
         e+bWUA9shEgaqriowWWon8v1NKGxuvM3VPMtF01DBHVZ0hyxIudbInuAuk7ipuahVTaK
         WjmGn9EXu4jPTznMf35xBh8WmgcuoMJzRASnIr17qHePGxv60PaT9ETffaq+I/8yOSt4
         +d9Yy97wzMrJkWOtnUZM1aKssqQLx4J0CvgVauLKxYJ640KUJA49mWAx+Fn+b0TPKIQA
         1FTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276833; x=1788881633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MR/cQZoK7JPxTk5LPqkidwaMJQfEv51POKdRxNvWHUE=;
        b=U+KgKjamfQzlI0Wu+jw9VAjTau8C+5WZowU+9eRVU/dqqQF5WIq3+1ocYsTtt9n3fK
         KIjk4CXUncIJ7H6nZLps1oniPHJL1pCdRnqjxRWDAgoeRJaznQyF5QWTIkq4PTugq3Sl
         qkAu6MqfQnLIcbMHHXUMq07A7gu0iIRxQOTXUYG/on5Uum65pfLgGx1x1dnR0HZ98AEq
         dOJJm8RbISTmXDODPnZHHWriBIgmtYWFtNSnXH7VDCBVDMRadA3L3YEeKS0MOvs3MfyY
         7d5GOX+0sNIw1kuzOIB2S0zzNA+14L988HZJqYzn6VFhGNEpU2sWO8olC8mbmVm09Pmc
         KA5g==
X-Forwarded-Encrypted: i=1; AHgh+Rr2B3LX9iFQjapYOK6/DSzCtRxithtE6DgYZeMbX4Ips+wpVtizsuv3YkeWTV0I+LmbdlP5C3j5h/ZaZRVaS8/G@lists.infradead.org
X-Gm-Message-State: AFuF++m50UypR0yRCCyIjtvDqaBWDwqZL48dbd0DJlTX7r03PY2p+0Ef
	bV/WuJBJEzcmFrhFgNWr8O73WA/5JxA7lMtJtuTCGG77WJLcfB/TljLGUR/74jwIG5MXCR1xr7z
	p7xMX
X-Gm-Gg: AR+sD11Iunq2D3EtkM+LHn25L283fzflLI92EBJWWbp1J1YyJKejr5ag6DSL4EhV6DU
	V6RTXRBYEtQlfVnnz5J5CWJlPHavvFBhYUpipA8LVu3QfL338vUu+tv+lO4ibnleH1Tfo8mVGxH
	9hyVWmH6vKhSKEZ3jzcZI9o0oYlk1rcOgwoodGxzySJonR7QsuFWICyP6EAbg31Won4+67zBk8X
	KGpPaSvyZOGTZY8xnkp+ZkZeECOleUzTb2tggtVj0SZ1mUp8/LEkBoALaMAvjhIze086E48xR06
	zhT0LOUMp9oUDj7Gzp8rQCG/M1XdHMhqEJNWQ8c65Uv7Dwkdlgk+sW4Og762HM50/MfncO1gUiS
	G8sPpEqHq8O2R7XnSm1BZo2/e5fjZTc9jb1ubwtBPC24Vn5C3AqJv+Jql1H1RHjjXX6IjjwLveL
	7h383S2YYhm26ki1NNtDIHiWTXvzsDburzZT+RGRFvi1+EpsILdsK92NNnlL3P6tuk1MiBhkTtP
	1Z2Bnpc5RyZEbwfkwfKyDZ/FNJqpH4uUvqEoietUZWYIrWPZ88=
X-Received: by 2002:a05:600c:5391:b0:49c:cedf:f870 with SMTP id 5b1f17b1804b1-49cdc555577mr180831445e9.16.1788276804848;
        Tue, 01 Sep 2026 08:33:24 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm314541845e9.0.2026.09.01.08.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:33:24 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 01 Sep 2026 19:33:11 +0400
Subject: [PATCH 1/4] nvmem: rockchip-otp: Serialize reads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-rk3576-otp-cpuid-mac-v1-1-ea9135270fc2@flipper.net>
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
In-Reply-To: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2712; i=alchark@flipper.net;
 h=from:subject:message-id; bh=amm6IB2QVHQmS41llynjCeEO9qHZu2xpesEVqtnd22I=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRN+2C3xbXrK4OeZYvDjPdrr1mZbp/St7fnwfTot49W3
 TD5HCSf3jGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUx35iZNibP3We43yhXZ16Wn+qpl7LuCJ44ZzTmxzTjRy/HlSF/clg+GfIZX2
 of9I/hUiz98vtfcUeTXiyUHIf56ZrjJturNqyaAEPAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_083355_375191_31876687 
X-CRM114-Status: GOOD (  18.27  )
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

The OTP controller is driven through a single set of registers holding a
state machine which has to be stepped through for every word read, yet
nothing keeps two readers out of each other's way. Concurrent reads
interleave, and the outcome is either a reader bailing out:

  rockchip-otp 2a580000.otp: timeout during read setup

or, worse, one of them silently taking delivery of the other's data.

Reading two cells in parallel from userspace on RK3576 reproduces both
within 150 iterations - 53 read errors and 9 corrupted results, the latter
either losing their first word or, in one case, ending in the two bytes
which belong to the other reader's cell - whereas the same reads issued
sequentially never fail. Concurrency is not hypothetical here, as six
thermal sensors source their trim values from the OTP and reach the driver
straight from asynchronous driver probing.

Guard the read path with a mutex. Reads are the only way into the hardware,
as the driver registers no write callback, and they always run in process
context, so a plain mutex spanning the whole clock-enable, read,
clock-disable sequence is enough.

Fixes: 755864feb729 ("nvmem: add Rockchip OTP driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/nvmem/rockchip-otp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index 2c0feb036f3f..b034b7455016 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/nvmem-provider.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
@@ -80,6 +81,8 @@ struct rockchip_otp {
 	void __iomem *base;
 	struct reset_control *rst;
 	const struct rockchip_data *data;
+	/* Serializes access to the OTP controller state machine */
+	struct mutex mutex;
 	struct clk_bulk_data clks[];
 };
 
@@ -272,6 +275,8 @@ static int rockchip_otp_read(void *context, unsigned int offset,
 	if (!otp->data || !otp->data->reg_read)
 		return -EINVAL;
 
+	guard(mutex)(&otp->mutex);
+
 	ret = clk_bulk_prepare_enable(otp->data->num_clks, otp->clks);
 	if (ret < 0) {
 		dev_err(otp->dev, "failed to prepare/enable clks\n");
@@ -431,6 +436,11 @@ static int rockchip_otp_probe(struct platform_device *pdev)
 
 	otp->data = data;
 	otp->dev = dev;
+
+	ret = devm_mutex_init(dev, &otp->mutex);
+	if (ret)
+		return ret;
+
 	otp->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(otp->base))
 		return dev_err_probe(dev, PTR_ERR(otp->base),

-- 
2.54.0


