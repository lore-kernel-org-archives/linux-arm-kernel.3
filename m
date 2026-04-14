Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1287ED7B9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 10:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KeHPQvcdCQ3nvg+KY/rV/Tln29SkakA7HHIFRcYo3eE=; b=W6oPzquWt/fXCiE0H0cPK/EoE9
	HkixV4Tyl0HvsEWmFWP6Kwj0J9p8g6q/LX/pPXUeo48xa6Af7gK2Wx79aikvRkIu5TkF7Is8u0r5o
	AliRCsXk8jtO1K5bdDWsy6YgX7XeyXj0Re8KEbmBJIth7IIfEbc/9VkwWX7sanmgyJwkmd3xwkB2D
	GAvGsJ/N8o3WsZ7RSs9Jg39gLQFYTv6cJFz83PQtQb3CiozCA9X6IaYwoYdye0Yz9nspD6EDTfe5v
	pPwKVduxgC32X3RflxBt1H6b4o6BWBCrdGEIKHtAYU/C7ycj9WiUxYa57G18eaDE1Yd/h/yTMmy9Q
	Y5xZY8Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCb5W-0000000H9St-1t8m;
	Tue, 14 Apr 2026 10:33:46 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCb5U-0000000H9SN-1teW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 10:33:45 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2d17b8fbedaso2179967eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 03:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776162823; x=1776767623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeHPQvcdCQ3nvg+KY/rV/Tln29SkakA7HHIFRcYo3eE=;
        b=HWXMtNxI9BHSexVlpFJyDnJpKibIv/CIlC5qrE0dMJgVA6nK1PlspBLasQpMrbz4Dj
         YjJKh6wVrY7gQMXF5qRUrJ5yidMizPg+xrtT6XKNLDW87Lul+/KC1TN5NePj1kJm7rmc
         dZ2KeoMgBm6ops5MN5qf586+20PaAMU36Bcm1LZXFgY4ra1x1CSSDUOUj3NOB9CFgV0J
         oBtsImjK/YLIWh8W4vq5huFzpj3H5ou41ceC+CusC1CGkQwsq6MhzEatK4NPILRssUms
         9+uTQ4sIjpmuGC/SWUUpWuMTZA6VO8S2FGIQQNHqew2NKM9PayX26YbmtzbmdcSCBLr4
         oK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162823; x=1776767623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KeHPQvcdCQ3nvg+KY/rV/Tln29SkakA7HHIFRcYo3eE=;
        b=YxCC/0j1K2ocPNxImgl4g/xD4jrYivGdp+692q2Ba1ZPTjSokPwQqmOH/YSfOzOJqD
         jNe5W6LJXg1vfsM+PVHymZI1UXTc2ocAAoeJbfvYpVmz2mZxI7q06iNmjHpV3/EskWlf
         Q/fNZghqPHs7ae/bKbkJnZnp5PVZnk2Z4hPWehlVhObLLcWkDedWuWs753IbD4OXi8hF
         EWoGRLSMRgQMcP+9whVC6cJU4buR5ViOZ4FrmXBljqWd/I2xeov8gIUsRgF9FpPSUUp7
         glpM5FkW/maVw6mXn7B4BFgf+N9UzJjYBb/NQ0c+7jzz8rM/Uw6YgpXzVwGbCzO7zQv+
         Q3VA==
X-Forwarded-Encrypted: i=1; AFNElJ9J9vaAPvTI4BGyKF1k4kj6LBFFDYINckp1fDXLT9jzJKQovqVJ65qLNYGyIudXs+t/puHhIezphqZ4flaViL5+@lists.infradead.org
X-Gm-Message-State: AOJu0YxdBjqNF4rqZdMdFcAYrFDswohRWmS9dau2NdFUZstyHA+aT/e3
	cUj6Lk1/3jdIgru7TkkAb/RqWXdMl2NE3m9rWK39G4W8jNMsfMrqC08uh8vyyDZgsHY=
X-Gm-Gg: AeBDievdtvPYAbYTRtXwL/LBAY08RhVweG5qfaR5WbER7AW0lECYyxhypwPW9JBoPrc
	QRrYAW2xOvDNlQxENdoLTHKhAha3SxaPWf0fbaTqLjetH0DECTIX6brJjXILLJH4GfJA+KldPeU
	Bp5W0IdiFVKBReQgzIV1nlUKSTDMZQfCpz1L2NN3oLqog0DCE1xchG2G82KVrJ7PjVaWlSCwPTI
	xv7BcJFh2fF3xWIOhMXsnT2faPP73Yb6ietGB7OOTPph9tC0g1hXKE4irBWCnYhM6C/oR84Jf6T
	x+1MTYKo/l6Q6SQVUn04ecMuC0CIqRGY0IjB53wE2pqr8zixflauSMHLrFr0MZlWBj1X9LbYwNc
	ekflQxJgnw2+JPfdNbnFV/MdrJIMhtGYV7VHAjkouE6g2SnofCgZmEK9JidcljEcPHxnNHfiseS
	/yMBFbqmrgnzNiJz4yFuGNBDLtnlan+BNisgwFe2JnSRsXI16f2L+wYP05C8HIYWDDs0o2dt2A0
	YOhb5HYb0LElDkZ62IO6vyMx0/2/B2FcoUJvipjJYnC9+g4Jg==
X-Received: by 2002:a05:7301:2b07:b0:2dc:5d20:c163 with SMTP id 5a478bee46e88-2dc5ebd1395mr1174530eec.6.1776162823340;
        Tue, 14 Apr 2026 03:33:43 -0700 (PDT)
Received: from gui-host.Dlink ([177.33.104.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d90ae89e49sm8735499eec.31.2026.04.14.03.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 03:33:42 -0700 (PDT)
From: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
To: Salih Erim <salih.erim@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guilherme Ivo Bozi <guilherme.bozi@usp.br>
Subject: [PATCH v2 1/3] iio: adc: xilinx-ams: fix out-of-bounds channel lookup in event handling
Date: Tue, 14 Apr 2026 07:29:17 -0300
Message-ID: <20260414103316.18455-2-guilherme.bozi@usp.br>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414103316.18455-1-guilherme.bozi@usp.br>
References: <20260414093018.7153-1-guilherme.bozi@usp.br>
 <20260414103316.18455-1-guilherme.bozi@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_033344_495646_B266525A 
X-CRM114-Status: GOOD (  11.52  )
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
index 124470c92529..f364e69a5a0d 100644
--- a/drivers/iio/adc/xilinx-ams.c
+++ b/drivers/iio/adc/xilinx-ams.c
@@ -871,6 +871,9 @@ static const struct iio_chan_spec *ams_event_to_channel(struct iio_dev *dev,
 		if (dev->channels[i].scan_index == scan_index)
 			break;
 
+	if (i >= dev->num_channels)
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


