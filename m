Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3B41125847
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7BFBm0ORq4+JJOt2QbOg12ZPSD3QFxst8CC7tIRj8k=; b=GmRaccBitJi5VxQOjCFjJPnw+6
	BWii2gHUjpFKNDMmuKaAbXrlBwONAodHpBDCDsyw4lcHgNZafISXfNL2kuK5xJfBC2VDFQ3QiveAE
	3EWGtk50Md9fSgG/HjjNhd8qaqxdJxT43qcN8g9vC/CtAlTD8AUWPSA3fxlaiJKWXIIntkuswj8Ut
	FS9bf9sIxtlo0S1ISDhgkR4aFL0nHVzvAx9u/jycA6fHtmMc5XzsA2WaNd568cOPXcP5vk/Z5FJ3/
	yoj1M3sOQuQQsXQFZhqvVYKjJQ+pV7JsVznGisRPw5ooZaV7ppO1aiUJ1y5ZGoENfuI4+4+T6FqZm
	c31eKYvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0MIz-0000000BuZH-3BhQ;
	Wed, 11 Mar 2026 16:21:05 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0MIv-0000000BuUZ-2GJr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:21:02 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-439c9bdc1eeso50088f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773246060; x=1773850860; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7BFBm0ORq4+JJOt2QbOg12ZPSD3QFxst8CC7tIRj8k=;
        b=Vuv3GlsNwJJIlLn6uYChJJ+/VKyDTOITxbxQRL2YJh7NCFvxjromx6tuwxI5i9oJAC
         0Nq0sg4MYufsDmQWrnGm7FrLHMyqZHZPP8PAYJHwkCkbcgDxvaj3uBQ8HPuxOOzdYDp+
         LqD/AZZhGnUS7XvppxaVzOjTt7yUWkjArYNpYVghs+CRWhLauDYhvZLZUXgVLYr58CbF
         Ybc0dwcOaG0M4clZAwZTIggUOkP6pM23+h3HeI2Ts3chz9G7+E3mUYTZicJtV79+AilC
         rPH1lOOVm5X0jyOd/QnAppwws3uUb3yGJSGPynv8rRID4qmIuJ5XRGOisM2/hzULaUjm
         Yr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773246060; x=1773850860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n7BFBm0ORq4+JJOt2QbOg12ZPSD3QFxst8CC7tIRj8k=;
        b=L1S27kNlIgWNQ1oAA1gvR5HuOHC5YmcyhM0v5Eze1NtYrga3QDriaXbjQzB0YG7z5r
         ppUfKrSHm7JyPcrcTYHEG6Koy0YGIRKQmy8ibYrUBgXyDXg5cPsLbwISuhrlpPVOgpOz
         o6TM5AuslCLFbWVMZG3L6ihYZhTNGwrS+hgF8MSUSoC34YSvn5+TLT1icBT2bAeYOyee
         zNUOjS06BCHwqSUgJ34DkbGRSa9mbptYBeOpGnwGRjb1KmhzWorlOf2RkIFtSz1o35QU
         8n5vBP6+NHctDCIvAcBFW/rFVraZJ9gQG3gTil3rEmd52VmEI9aLcjCy5llXkHbjsMna
         YVvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWODHmwrUJvV3xikWdTinHTzDKl0kMjvf5YRczidPma4KifkQAYj0AAG5e0hYkGtt0gopQG6QkQUljZll8FJQmw@lists.infradead.org
X-Gm-Message-State: AOJu0YwL1H7oNISN1YjC0UHt9IdxyVuy9lYo318SIAGlXRSnOXt/Wu3c
	19RLeY24ryEVmakghUU9f6BL6lLFulMaKQfGCBt3U/yYFu1HJLmdAbs61zSJQoro4WQ=
X-Gm-Gg: ATEYQzxeITH5rUVBeRYc+G9FzfQmVdpaCuE4e+CQvBPcovbAj/5tYlDAUUJP9DkqzD4
	bgoFMFzBM9q/sWssRydDnJW2GbIACxThSAZdtZd60+u14au5V/qYK7l94pEggHl5hUSuvZN5y1/
	RIPb9I/RToMQrQwL3JrkW1ypI9IHVlyfmyq+gsxxNhHet9SvmkA+psg67MxBP62fp9Pw8vCFMAW
	V4mTgJb2f4lLvniz9ba2yWabJ9bLB2DsaahdmQ9G0hCxvMs26Hq7qaBADDqfZNIggtHmUFkSkz/
	b5mjm64gXhn9hn8jzLwNE9BKr4/oiI/rWXcLsxUEhR6vsoHyUWp4q9gqA3ctJV5IRkncfjwKQa6
	fQJSxBbiV6bzGscqQHQ940XTSaiaAYwbb0KSwLmbdemSG0p6eD27arPFmZHwXD6dF7Zr2d4aPCZ
	I5dJGJcZu+vsE16WWJ3G3R6mzTIs5rhssOxQoRzEmUExsNwb8j3OVyrmfYoupHiwBXaWP2f2FT3
	4CRKQ==
X-Received: by 2002:a05:6000:4312:b0:439:c1b7:890d with SMTP id ffacd0b85a97d-439f8219facmr6362482f8f.26.1773246059591;
        Wed, 11 Mar 2026 09:20:59 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b899sm283952f8f.23.2026.03.11.09.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:20:59 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 11 Mar 2026 20:20:45 +0400
Subject: [PATCH 2/4] dt-bindings: usb: richtek,rt1711h: Add Hynetek HUSB311
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-husb311-v1-2-f25bcb58cff7@flipper.net>
References: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
In-Reply-To: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1200; i=alchark@flipper.net;
 h=from:subject:message-id; bh=bMf9TRmYtn46zMSSe2mzXvRDTFA7QHx3kPDHNmgVLZU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRunJbcc2jLT4V9ix4K200se7ToyfSMgN7pC59fnRV6j
 tVEp5drQsdEFgYxLgZLMUWWud+W2E414pu1y8PjK8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Z2ioY6xjxMDFKQBXbcvwP/zaNvclqs9M5l+x+LTT/OzkBxrf6u8Z7341Y+cZ77S5K/8zMsxIy/j
 1mfvvhL+MrE8V/04w/nD/w+9XJl0WR/N4Hyvf28cPAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_092101_636326_62814763 
X-CRM114-Status: UNSURE (   9.15  )
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

HUSB311 is a pin-compatible and register-compatible drop-in replacement
for RT1711H, so add its compatible string to the existing binding.

Link: https://www.hynetek.com/uploadfiles/site/219/news/0863c0c7-f535-4f09-bacd-0440d2c21088.pdf
Link: https://dl.xkwy2018.com/downloads/RK3588S/03_Product%20Line%20Branch_Tablet/02_Key%20Device%20Specifications/HUSB311%20introduction%2020210526.pdf
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
index ae611f7e57ca..b24502bc8213 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
@@ -21,8 +21,10 @@ properties:
     enum:
       - richtek,rt1711h
       - richtek,rt1715
+      - hynetek,husb311
     description:
       RT1711H support PD20, RT1715 support PD30 except Fast Role Swap.
+      HUSB311 is a rebrand of RT1711H which is pin and register compatible.
 
   reg:
     maxItems: 1

-- 
2.52.0


