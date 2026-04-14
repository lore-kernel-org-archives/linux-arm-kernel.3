Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12341F9D0DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 22:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xVaqx2bA0uX9Kc1Awl/FAoEiMPC51tiJH6XAaQB8+g=; b=qjisM3KgceledC7o5GDc4QSnHW
	RO2cp4DIdgUWVlCRH1pCBB1v2PHpbIyJmXMca/GpoNxBIiv3Gkrum5Dswk3Sr0a5P73UbYtiw44PM
	FaTH10a0sOzdiN7RlkJB3+DH4WCltds9w5seidfEPMYDNG/9i4sohNoAZBN2ZuNawGEUK7tvi+/f9
	3PhZ5FR8sTlm9hmNycbmnvO3dx1II8OqQL42FF5/+Os/SVxB6cG4MrLY6MT0TGubC7ZfR6PTco/hc
	F1hZeqpcZv2DMoPMqrmh9ugR6Xjt1I1aTWG17/FewsGV7L8Vcvu/rh5blJmD2wmo3reVu5N3yl2eu
	iVnpBtUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCmTa-00000000Icg-3mpC;
	Tue, 14 Apr 2026 22:43:22 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCmTX-00000000Ic0-2xmN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 22:43:20 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2d8fa0fadfeso1412696eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 15:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776206599; x=1776811399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xVaqx2bA0uX9Kc1Awl/FAoEiMPC51tiJH6XAaQB8+g=;
        b=s5lS4++Kq7WU0iqxLnqa1cINd9Obu4PwOwa9icadVfMybx2pegmAvLjkKatmQQnhXD
         nVrksX1AYMKfXJ9WR2AvrKfAfn5+EGopBr3WI+FqdTp2CJwKhP6C800+Hc8xocPOw9rm
         RPUNo/WaqWfrhV9bW3dGgpJ7axQv5LNpY8Lo8lKf32KBaLtQIMx19kCaJrOrinmE27XG
         atD6Xig/EXNSM3sP6w3muuSxG/8Si87Tsshxgp+vHnK4sSTWOlSzwFwmr9TCm10CT14q
         oggZyxpkGQx5ZDJsXJgr2ZMOshyUr4nds7G2or6FpaxW9Yxpuy1wDqblyTCpNmZYSX9e
         mEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776206599; x=1776811399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8xVaqx2bA0uX9Kc1Awl/FAoEiMPC51tiJH6XAaQB8+g=;
        b=ea7XNFfRwohAOqHPur8krEoHI9FDIif9Crc0S/afYKCn0FbC4WZkO8bXe0dXXgjPqk
         jhrw5qqFm9x7rdeV/23E27HsqYiKWnaR5DWjjRtX8kn63BUKm9v3AM2Oon2Y7XbY0ied
         dgHy43fpnVWafc67paVeEowUISyL9h08o44Z8EeoQvWTMopOlpS5fR74av3E3UgSJR4A
         oWRpKXDB5JPrw0XQNyLY5tQtd0nfDQbGRL30lQMJmfdOFLY+VqnmbaHxtQMAYItBjll4
         KZJ9kE2OxOdaGHrL2M5flIoAvK2TPw4SFKLnEczY1VOZYiQ4yoHySvePO/Hdc7FXWR04
         HfCg==
X-Forwarded-Encrypted: i=1; AFNElJ+vZiQzD1h86ulfZToDLZ9q/Eouq4mpo3CU76YpoIcMSwii7CoSoICh3dix12y4n5PTFvR9kOkZ+ZPkur8Jz8dc@lists.infradead.org
X-Gm-Message-State: AOJu0YytRI9pk++QLyArdiQUj1ZSV2YhYsO3BB6ZGcZ3yGX+6er8mYi0
	RBaDS8B8Ne1QqFonOAkjscDDH6jrYdRPu0Ezg9CynC1a6dUe6PMW9NgVtQSR4FqwLnQ=
X-Gm-Gg: AeBDiesDVI4P8+EmNijFHhhHRsKq2ZObKq6ogPfDGyb/06sGVE/McdoTPxuTRddvlac
	MaMWt3nSZQpdPnvoZ9Ie4E/3YaoPZGgsVQQf4snNFD/M1vnZ9hr6Xy3bz6kkbErU23zKFSxEg1i
	3V/jY6l2ygCg6Qb4xpQAQEtgzsUEn559JV8nOmpv5Jb+zmsOy3dj+o3CwrjQQhNPBJiRovx4hB1
	kVQxMphc2AWcwQKmrhWiVAk6b/EaRnb6C62vVY6Djh0ijU6UC6df0CGjHqCt8rNVaqmVLPCuNlx
	yXr5lPaNnPdRWE2u32OcRg6wEEZl30H9B1oCz69x2wDauRgDXqFFfeyle+tKEk8XvPgLvpcVb2f
	UF3vOlI0J1gzeslMi75X+Kcu6G/LVpwy/Nh/osowthL5s2FrpjS58R5YpPJKGDd1JDVEATPJYxx
	x1d1ZZ9EA7y7Sqf/+M50LD3DumN9piKYo3NOJc2uec0OwSvqHZGFhhbFQU+IqJ05eu45AKcClOK
	eE7aqczK8vGhVBo4mFQKPEYLQ1rtiGi5RZaLf1X9oAmNc0/VA==
X-Received: by 2002:a05:7301:2a27:b0:2be:acac:af7f with SMTP id 5a478bee46e88-2d40e3e6960mr10640030eec.7.1776206598921;
        Tue, 14 Apr 2026 15:43:18 -0700 (PDT)
Received: from gui-host.Dlink ([177.33.104.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2dd32dc2827sm4650361eec.23.2026.04.14.15.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 15:43:18 -0700 (PDT)
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
Subject: [PATCH v3 1/3] iio: adc: xilinx-ams: fix out-of-bounds channel lookup in event handling
Date: Tue, 14 Apr 2026 19:40:33 -0300
Message-ID: <20260414224245.8493-2-guilherme.bozi@usp.br>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414224245.8493-1-guilherme.bozi@usp.br>
References: <20260414224245.8493-1-guilherme.bozi@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_154319_746980_99E9386E 
X-CRM114-Status: GOOD (  11.79  )
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


