Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33201C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 16:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JkidhIxI0JJqKCLy7C7vNd6vALRZn2Ej+iOClGDcLcc=; b=4rSaGnchmqEsqo
	gOtmJmzD4a7UlyxtQjec/nP37J5lA1gSYGUAJXIQsRWIbbUsImUoEJgtAqZw/GWHrYtWW9PRmy81S
	isM1UOEqYWUmbmZzwm1n9ypknO/ibzfXLv07v7y/rjzX6bUkaC0UbDPxN6BqmGdafzRHeBlhSa+RE
	cwXGglyeDfCg/z36V2zgdR2KxIFybeyOvk0MTwsWj3UmnYxyP2DCadzib00yqKo3Co7t9v1ZFZ7xF
	NfHy9QY0MaVDtBsIyTvBerhk37qUkOP1Cxe7207umDfZ/17r/FNwUZGVwaSFlWl0AR61ccQU0JnpG
	5kG5/bEioyQcgpMih2pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSgX-0000000FVlf-1RBm;
	Thu, 16 Jan 2025 16:25:33 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSfG-0000000FVRC-3e6L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 16:24:16 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so942840f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 08:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737044653; x=1737649453; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JkidhIxI0JJqKCLy7C7vNd6vALRZn2Ej+iOClGDcLcc=;
        b=S1/Gcm+/19UuaGqNwjL0lbRP4Or50B7vOgymXlD9gXmdwsv+7GQ5tH1lBRSsYLZE10
         p0+EOJPNqy8JpIbxyvO+/BTX9j/2D0SoGby6h43H1tSOjxVNsOuGZsBYDDf24Fc8w/Fv
         CeYwUG06Z+FgPW6OtMf8RoNJ5FeY2lAp5hJLnTFNssosQ31yz6LZ/vIRVS4Q1QHzDIyS
         y3KnLxZ6IWuw94WH527LdExNc3M0r/6kf4b6c/nNsPRrDNwaSyjuJfLcZGYVIJ5lGP8v
         a1jr9PlSKdj56vEXgfNo3gyEhRXTMAviZoGcZxdP5x3PfhAfYYUMJ8yxJFETaInUdSIs
         HrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737044653; x=1737649453;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JkidhIxI0JJqKCLy7C7vNd6vALRZn2Ej+iOClGDcLcc=;
        b=dgMrE0Xsw9A0tF6FxrhJGIk8cf8b3GDNgjTB0DA4ujTK186eD+JZOexD1UMdPG69ig
         Kkhls+3ZjqfijM1zHXBr2WISFTxw0aZprGN5zrFwUKlfT6Dr3k0b7aCec5kkP94vjxz8
         8wJ0yuXqZtoAHIuvli/yOAj0JhNblQ1ncwUfPU+tEyFNjlS2VQugRpeMAJNwMPImWWHu
         CeraNpWkPF4O2Y3mh3KTVTZVe3DEdVSMuApiXMqZD9t18LMYZZhpHcBkhLgBtPm5KPY1
         hGjWEjMPeJ/A17mv0YOxvw1PjWfvHP2K7jdvobpXEWsgWCEpUOQ3kRNFhTC/WSUvhjzx
         WuJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6kr/wjIw4MKbsQ2jAyVwXDvQoN9+f05Sxh5pg5E4Mgvv7x3oun/ZNVLQucY6kPEAdu2+cCQafLhSBSNrWYDQR@lists.infradead.org
X-Gm-Message-State: AOJu0YxyknSeCl2RkzT/T9nc69W8kR+ymYqvDAFWiZ5F4tQXJmCwRJ9q
	RsAeG1WsGEYNrkR+xbFdIi2RCD0MBJ3Cx/obzCOOLTKkjolZFJ3k4BAv9ugqpxIxtqeXy1ssXyt
	V
X-Gm-Gg: ASbGnct1VcfyofKVXNwEUf7ZQDhpsZKBq3ic+RL7ywETHGNIyDQGQjmvTJnqIRV5mrA
	8LdsLHg390ZeNxpReVrAb4AoVuE9J7d4ggocD91H48Uxicxy29/BYhc4N53a2h4Rcxw2AYp9n6B
	iETX1jiJKiaubBF9paFx/m6LEYy4a/hNd+z3mqdmL/fKlp993nyzL3+4ABsVNMjCw5T759cyqCg
	/kkgc28irW+L1hLQs7zh/z9vy2g7gykSD8W5hUUx/oqyNPu
X-Google-Smtp-Source: AGHT+IEK9Riy8ul/CXhkvjuSyP8TO4TugJgmWjoRSyKi2uOy9w+mQYDd/mxF5HQqa/Eb7X2t/US4rw==
X-Received: by 2002:a5d:584f:0:b0:385:f638:c68a with SMTP id ffacd0b85a97d-38a8730b738mr30034471f8f.30.1737044652594;
        Thu, 16 Jan 2025 08:24:12 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43890469ba8sm3715955e9.37.2025.01.16.08.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:24:12 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/5] clk: bcm: rpi: Add additional clocks for 2712.
Date: Thu, 16 Jan 2025 16:24:07 +0000
Message-Id: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKcyiWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0NT3aTkXCNzQyPd5Jxs3dKClMSS1GJdS4tEE/M0YyNDQ7MUJaDOgqL
 UtMwKsKnRsbW1ACw4f2llAAAA
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dom Cobley <popcornmix@gmail.com>, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_082414_902195_AA5F49F5 
X-CRM114-Status: GOOD (  10.58  )
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

These patches were Acked by Stephen as patches 30-34 of
https://lore.kernel.org/all/20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com/
with v2 at
https://lore.kernel.org/all/20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com/

I'm a newbie on kernel processes and where the patches should be merged.

I'd asked Stephen on the v1 thread as to what needed to happen to get
them merged, and he asked me to resend the clk patches for the next merge
window.
I must confess to it having slipped my mind, but resending them now to
hopefully be merged in time.

Thanks.
  Dave

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Dom Cobley (3):
      clk: bcm: rpi: Add ISP to exported clocks
      clk: bcm: rpi: Allow cpufreq driver to also adjust gpu clocks
      clk: bcm: rpi: Enable minimize for all firmware clocks

Maxime Ripard (2):
      clk: bcm: rpi: Create helper to retrieve private data
      clk: bcm: rpi: Add disp clock

 drivers/clk/bcm/clk-raspberrypi.c          | 33 ++++++++++++++++++++++--------
 include/soc/bcm2835/raspberrypi-firmware.h |  1 +
 2 files changed, 25 insertions(+), 9 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20250115-bcm2712-clk-updates-98a47f32116d

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


