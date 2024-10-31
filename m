Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA526D767DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+Wt5gEXGTTMFhAf0TDuO7kCimt1FNZkZpqrNk88/+4=; b=ETaf/wgj6/mVYfMH9DjqE2zWEP
	GRjuF3iDOnGgXSMNn+mDOlN91no0MhrFjIE48y8KbKhMUS2SKyAqN9LCwYVda4JdAO33kFEWTo32H
	h3FNwWlAx74oJfFvaTuVjEGHVkOi4zGdZMzpu7A/F4a6zxCRYQnBIaflqtg5Z3FUzRHpdk99t4MbA
	tNgVVbGVrD5LTaaNv7o3qWHeTYX61/mEB21bx+VJ8xLf/LTtLsNFzRI/UROIIG8vXTBV0PIc99HlW
	2fdAGJ1bvhQ36MrCR64xLQZa5xzKSdbmm/Zi+PNvW8LtAoKI/mnQ5QND0irdJnLB1WjqUZrs2syYQ
	H4dC6DbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XD2-000000041hA-0u30;
	Thu, 31 Oct 2024 15:35:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6X4y-00000003zIJ-3tue
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:27:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43158625112so8768785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388439; x=1730993239; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+Wt5gEXGTTMFhAf0TDuO7kCimt1FNZkZpqrNk88/+4=;
        b=AvBxOmY0QKigk07D50AWtG5iHiw8fAq991Biyo+9AMpjEU7B31eKzGSZfNipRelqe2
         HswYsa3a9kpbohxGwRo3srgV7xEP3PbqH2rR9RmVHJKK5Oogb5l0OIwaly/Zst5tbX7b
         DLrbdUdO4fO2Cze8Hn0KRuiSZQrq87MHzgD9vv367ulexdvqQAiilKeLCXNsyoVHpBUl
         sCY83BxouLxaF7+KW3kCy0h0V91c+RHU1q7fJGGb6jMgtys8qaRfvbC/ebuBG7BKdFuR
         mJLcNJy39bk0OoTh4gBJBYgqqkasUF6aAM0z4DkKIa/0EsQkS19zE1BMPcbQTjCfTo+d
         LJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388439; x=1730993239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+Wt5gEXGTTMFhAf0TDuO7kCimt1FNZkZpqrNk88/+4=;
        b=v6xNaekLgXTNlsOqZelsNIbAEg4Hw224JMnIDOXLrO1K65vBZrXXnIAw00fpIcDTWw
         doflFgGv0urnHchpHIyt8OQCmes9tEhyxbI8AZAt0bVjYIICtb5PkkmJ8LsaV4SgHGjZ
         6WGwlE1QNHklgtIxQ6RKOuS3oEaZb0KuZOzMNcAdqtMhXhehfD2VcecB7mnv/7FhgYcF
         QFemX1krc+NQNI4MLPfUNOqs3cb0pl4bWLQ6Fg+qkussW5UpyFemIIXMqO9wdC8/Cv0N
         FqcE7KTsow16QhdNjHcYLJsnTrdaUaNtpBgwYDn1TZ+8s8aJoaHGqS3OiUUW0X6CQlWe
         Dl8g==
X-Forwarded-Encrypted: i=1; AJvYcCV+3KsbVQgfpeBw074wdB1pHs88uz2DFiIugYfcOQwQpno8zxEOO+i5rHntxuskOmqpoiXHMXThWj+ob4lzW575@lists.infradead.org
X-Gm-Message-State: AOJu0YyUmnjGGRGz+P+vcSoB5SvwS4W2AvfJdjqyj9BtTHcUalf+t2ol
	98n0IsyzqHrAp7Z1YuVuP/f/e+nLtKV2NHwRmy7SaF/MxG2pQ6d9yaRQxR5C78w=
X-Google-Smtp-Source: AGHT+IEyu6FJS8+aBQtlI/2iMWr0qg8SLYMIc2U9veyCeAFrXBtLbW2/W+xR+K+a9Ow41bs7++cXAQ==
X-Received: by 2002:a05:600c:3ca1:b0:425:80d5:b8b2 with SMTP id 5b1f17b1804b1-43283255489mr2254255e9.16.1730388438884;
        Thu, 31 Oct 2024 08:27:18 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:18 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:27:06 +0100
Subject: [PATCH v2 11/15] iio: imu: st_lsm6dsx: use bool for event state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-11-2bcacbb517a2@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
To: Mudit Sharma <muditsharma.info@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Anshul Dalal <anshulusr@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Ramona Gradinariu <ramona.gradinariu@analog.com>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Dan Robertson <dan@dlrobertson.com>, 
 Marcelo Schmitt <marcelo.schmitt@analog.com>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Mariel Tinaco <Mariel.Tinaco@analog.com>, 
 Jagath Jog J <jagathjog1996@gmail.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, 
 Kevin Tsai <ktsai@capellamicro.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_082721_000417_980FDC40 
X-CRM114-Status: GOOD (  12.60  )
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

Since the write_event_config callback now uses a bool for the state
parameter, update the signature of the function it calls accordingly.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
index caefa15e559b8808051ff1c7f82c3f36c947933c..509e0169dcd54e773540c4e3f1b56e5b737f80c3 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
@@ -1865,7 +1865,7 @@ static int st_lsm6dsx_write_raw(struct iio_dev *iio_dev,
 	return err;
 }
 
-static int st_lsm6dsx_event_setup(struct st_lsm6dsx_hw *hw, int state)
+static int st_lsm6dsx_event_setup(struct st_lsm6dsx_hw *hw, bool state)
 {
 	const struct st_lsm6dsx_reg *reg;
 	unsigned int data;

-- 
2.47.0


