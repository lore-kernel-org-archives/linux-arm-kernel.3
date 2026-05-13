Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CF7CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 00:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xVaqx2bA0uX9Kc1Awl/FAoEiMPC51tiJH6XAaQB8+g=; b=gkqB9wgOcgHzzT1YH+HKzJELZ7
	0JEm/zj1I/hSAbcd3Q0I3nLq6ad9yg81LzwjeaDEiEqMix+ZeSveHfe9cU183CJDjTJfZHUdLghV9
	FoewfvUUicW0rTz6dhVETNcPV3ytWuuPfp+UdNwUCdg01G6pRNzo6ybf3fHShEQWWgz/mAbZoqQdQ
	kaEJNj71E5CNcnBOUzIvFDeGHtmIGAgPztgpdS5DNXz1UeLzbObowaP0yoFJBSNnuM2+cVoE0mUcn
	QU1jnZpZ2qe2Ph3veFyWzBKPIKcI7mN13OiS34ozAACatxOFowXzkeEH3FYr+fGHlz7CNbwQUSsEk
	2sNSs88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMxZI-00000000n34-3f75;
	Wed, 13 May 2026 00:35:20 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMxZH-00000000n2I-0IDY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 00:35:20 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2f7020a928eso8635576eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 17:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1778632518; x=1779237318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xVaqx2bA0uX9Kc1Awl/FAoEiMPC51tiJH6XAaQB8+g=;
        b=NmLb5dM7/z0enQf5EHa3Z2xvacIQl3GpIAa6pA1GflzT/7K6Ix/FI4KD9PHSxF46On
         3yPmxnbFWEBx3GU5PXztUsA30Uv+C2kwoG140IO968hTxLNadFF2lQsdbFLS8CxbBKoU
         JSYM7g0LE9ModbeR2MGoa3lHuO/UKmuH2SNF77fRQfLwtVpMxZMMkKjDTzlyHcjBGWzn
         LqwV1CaTXfvgbt4HG/RBqER3EwY7J7xANP1uaV7Ge5XyiyxSSspHhu8FqQBeFdvGJogm
         qD+/Tk1GSs9QgzJxlyPJoRSQ3XY9xQrGz7mVUHN5RoMUwrkORksfATZS9vM1yDzldKxU
         ti8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778632518; x=1779237318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8xVaqx2bA0uX9Kc1Awl/FAoEiMPC51tiJH6XAaQB8+g=;
        b=jBuJTRz8HQqPawOQ4j5fsQBJt4RJT7Sya7Auk+m5TR0+WBOcJFAboK1HCMe1JAGRXJ
         4nwkmzj/IZOvkTCs45lTM7A2lt+v2lOjSY5tBHnHL0W9KVQxmahUYrdfTdJEvEeumHl3
         m55oBtFoN5biRI7NE1GvZ7HDPCYtwNBAS6CAjoi4lHNgmIMxL/yOfidHdf4XBsk4c8KT
         EbcDN+tTTT+eDH0jZgaqszDroyte+HLPz/IMliEjgxcFQesoEHx15q6v4fpkhB9u9ELH
         OeJqF1b1We2xX6qDtzqhmcYJwsTc0kB5SrbZYeUEvyaPOfT4QQfCC1rLqoU6j23KZezC
         Q0Sw==
X-Forwarded-Encrypted: i=1; AFNElJ+y4OTrNghu0xKg5YlHP7p1xoDhV7TPd0hvijBc8emUhhp2LQLVGScdJIZ6vjD9+oHLlwfxoz1+LnNZgMdOvEYp@lists.infradead.org
X-Gm-Message-State: AOJu0YxjwjybywDGwgX/O0Hspm8WuxScqVv/e6Wxbsjp1Y+fCuzC2wCD
	Tl1byIUqZ+srDDbtW2V/J60fySCAZeoDuxEZHp7a4jDjIl3mL6LqkuZJ3aReD8Uk09s=
X-Gm-Gg: Acq92OG/61JztGPkQ2bp0QwwlnY+INe5VTsvjYn/KkMjQMTqzbaooQ4l4gWw4Gxg8jG
	eCK4/NqP/AnvxSuYZYI3EbP0RCcENVB+AQ6e8qpvyXk7l03FAA0wur+cGZA2X1FcIBlBpoHj5xN
	PVtLaBXr+YDtxdWk+ArZu4ivWrDgA7/KkucpITF1i/6CynmQ7F2ZuuixWiTwdooWLp8az4gLsUH
	BH7sVgZcRW+4NsbTf4hPUhwEcjIoQTYAOiknrOxH758ZwoJ68kpFIiXcoHlTQEXArEW0zJnOLgc
	dO31Rkkzg8QU74683JrUFbPMjd4uvPILqWgDgwUAPEfz2FHIfYP0PL63dTBrOmo/o0s5HPqLBmJ
	SZxur70ULswrcfPoskUOypCFmrFwGbj9OHsIKxXe9BiMsnJlTGLi/tYX5Gy9dSZujdVCJrVgbM0
	E9EHAlVbBZUzI0V6xt3SCPJ0y2dcgpwzqPC050zU/98j44PoD38FE/5m27DoLr3FkaTtK7gvI7E
	el3mNa5Z7lgNNFNAtP2Bv1S+V6Wj/g3ybzcwPIKwWTEcq+H
X-Received: by 2002:a05:693c:3004:b0:2ed:e14:7f5e with SMTP id 5a478bee46e88-3011a465fadmr816322eec.34.1778632518216;
        Tue, 12 May 2026 17:35:18 -0700 (PDT)
Received: from gui-host.Dlink ([177.140.77.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f91004b6a2sm18471381eec.0.2026.05.12.17.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 17:35:17 -0700 (PDT)
From: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
To: anand.ashok.dumbre@xilinx.com,
	andy@kernel.org,
	conall.ogriofa@amd.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	manish.narani@xilinx.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	salih.erim@amd.com
Cc: Guilherme Ivo Bozi <guilherme.bozi@usp.br>,
	Jonathan.Cameron@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org
Subject: [PATCH v4 1/3] iio: adc: xilinx-ams: fix out-of-bounds channel lookup in event handling
Date: Tue, 12 May 2026 21:31:50 -0300
Message-ID: <20260513003503.339418-2-guilherme.bozi@usp.br>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260513003503.339418-1-guilherme.bozi@usp.br>
References: <20260513003503.339418-1-guilherme.bozi@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_173519_117593_3DF4C298 
X-CRM114-Status: GOOD (  11.75  )
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

ams_event_to_channel() may return a pointer past the end of
dev->channels when no matching scan_index is found. This can lead
to invalid memory access in ams_handle_event().

Add a bounds check in ams_event_to_channel() and return NULL when
no channel is found. Also guard the caller to safely handle this
case.

Fixes: d5c70627a794 ("iio: adc: Add Xilinx AMS driver")
Signed-off-by: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
---
 drivers/iio/adc/xilinx-ams.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index 124470c92529..6191cd1b29a5 100644
--- a/drivers/iio/adc/xilinx-ams.c
+++ b/drivers/iio/adc/xilinx-ams.c
@@ -871,6 +871,9 @@ static const struct iio_chan_spec *ams_event_to_channel(struct iio_dev *dev,
 		if (dev->channels[i].scan_index == scan_index)
 			break;
 
+	if (i == dev->num_channels)
+		return NULL;
+
 	return &dev->channels[i];
 }
 
@@ -1012,6 +1015,8 @@ static void ams_handle_event(struct iio_dev *indio_dev, u32 event)
 	const struct iio_chan_spec *chan;
 
 	chan = ams_event_to_channel(indio_dev, event);
+	if (!chan)
+		return;
 
 	if (chan->type == IIO_TEMP) {
 		/*
-- 
2.47.3


