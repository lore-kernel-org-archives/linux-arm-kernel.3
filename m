Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFB3CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 21:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C2UQeXeCdd38LZjkJTP74V8I/AwlCwJ5vjuI4bPLac8=; b=qtG/sQRpRslyAzXeYtNoVQ970N
	qNLGeLD9vT9rBf5W4PTbd/AMfw22EhQQ9nFEOBdbYimdLtwFmb1ojheCixLknSOrwb7DYBHN25A+S
	1yKs3MU72kHYEFy/5n6CofFxu55oaqLiMpRx0r2Y9bDy8+tDi1k1rMDucVeqk7qljS6iJGKdeemz0
	gVngN8s0SmlFO8FIzX7uD9HorjUfUcTUlBRFEt+ICY0ccejb4ayQxM9YGCwLpv5BtuwOZPRt8W7jG
	gXnOtNKMk4OyAW/+zfwa557OGLgeDlWRAsfiWAIQABmvwzQdeZT4EinB3JxSoC1YTyWLgXa0Ki73/
	Qa9dEqWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4QTk-0000000BHAK-36lI;
	Thu, 02 Oct 2025 21:04:44 +0000
Received: from mail-yw1-x1162.google.com ([2607:f8b0:4864:20::1162])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4QTi-0000000BH9l-390K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 21:04:44 +0000
Received: by mail-yw1-x1162.google.com with SMTP id 00721157ae682-71d6083cc69so17189307b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 14:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759439081; x=1760043881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2UQeXeCdd38LZjkJTP74V8I/AwlCwJ5vjuI4bPLac8=;
        b=EcnZjsOTdaNivNwLombFx1PkmEZ8aohPOUF5afSVCVay2rFbUugliDWtahuG8PjstY
         +affDBxmB4SK3tCAzptVjdJe1WTegYBrOWdWK1lQO1gWr6xCKcwHP76PTXMjOhG179b5
         F3NIMuwAbhNGth+4KMR5EzU2F1r3ymYo6spJ6kQCIMwR7HkQNbYdrKWsGfnPGX0xPvYo
         vbdCQ99JqW38IGAq3LIdHd6WDZUi71HSRzL/jeZ/t2c3TzP+FbDBZHSNDLjIE/1sD7LY
         NKf3BiTBcr3JRd66Yg6BNAVXd/gbE0fqO1yaPwElszer1/GeK+vQz8NpRVB1xLyI8Dr3
         N7Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUgO4pK7bhjV35s6Se/tPHcENshn0VpSPyEsBXLRaisDbndQBjsCvoDSxtO59ajiJjhDrlH8rwORFDSF5WtptAP@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw1F1i8TmzBdu2XXM8OkHF1F1WBVNg0B+AjvHWzJ3a2z6hkLv2
	Q+uu+7hJVFYT4/INrNcL4wAaBwzYmLezYUJfP5e8RgD5hKJr0elRCImUL89b7flTnaa6hCU/wnk
	Nnc4cFW1AOTx7kfNnhzaXfuLMhMrSMNWVPKFwaZ0nE5BtQT0/+fuaelFn8GVQz7Ln3bhI4y8hIs
	t8AizTXaX8xZqm80NbbQWeA6I5RYHrBSiROS6IVpa19oUOP0r6HyAqcRUvVeNJi0zyGpjqNv7WU
	ijpEOGvyuhk05XaaSxN2IK+By8=
X-Gm-Gg: ASbGncsZowzkl63ZOXYZ17QGp4cNzAb8YTuWM30t1wEXCqUZNznjvwNYHFFA+ogFk0L
	ABcmEigfDa/SgbVjpK8PdfyZizjGbpxIPb2nsdkjsyDsDAPfkuyn8ND6sg3asVCfLSZ3gP1KD+R
	/Uj5+8cYBppsOX9EN43mj/Jsa02f+w/hRu9RD+gcmlQpdABIqSKBZqoFJbwLV8yPx4GERWtQdI4
	sgFBoDt6xHhOiQGzCGHifLrbdZpBLUVsfH/NmpgpYnRNuNeHZGH3ybVRqdICfk6+u8otH5fpsEK
	/xYd01sOdMNrNzBmXqONEeA3KMwsgF9kyXXMDbaKPHb9QHrPcc8r2G659UmnKtAOgAGreHuk5ZB
	pVLWLInb5SzlNLsbF3Wa/8B58lhk7NZlKs1pwdME9Y//HPLMzHSCAEf4H+XJ2/dLnd8UTKIIf8O
	W/4Q==
X-Google-Smtp-Source: AGHT+IGsepE7enxCES5xHM3GsoilHWXiIS1w1cyoSYKt6ki4mEcX4dr/cVbeXlELWY6Jq1x4c5Y2ta2xXo5a
X-Received: by 2002:a05:690c:6104:b0:734:f858:b1f2 with SMTP id 00721157ae682-77f9448f399mr15924067b3.30.1759439080769;
        Thu, 02 Oct 2025 14:04:40 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-77f81d2765csm1751007b3.28.2025.10.02.14.04.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Oct 2025 14:04:40 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3ee1317b132so855678f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 14:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759439079; x=1760043879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C2UQeXeCdd38LZjkJTP74V8I/AwlCwJ5vjuI4bPLac8=;
        b=WewBfttY1gNzYae1Znq8bzftSIKcBrZFBHSXWK23JcBX9tmOM2THquvh5sv6u+XbG2
         L/h7ysrBJ0O12178setD8c3bBAXwDkSKhuqyML4nQBruFRABCI43jlCul8DObLCRfi69
         0DZdYOidYXxh5mLziqevuRLZLUlwP3aovRSaY=
X-Forwarded-Encrypted: i=1; AJvYcCVs0MqZ+mg1tJfeieZzkKGkYlni8VqE+BMWJKaR2Xs3wegh/2Uz2QZC2Y5/HH+TjDPAmvzuhL/OEZ4GW9U+doyb@lists.infradead.org
X-Received: by 2002:a05:600c:5304:b0:46e:5df3:190d with SMTP id 5b1f17b1804b1-46e7110ef5dmr4793805e9.11.1759439079334;
        Thu, 02 Oct 2025 14:04:39 -0700 (PDT)
X-Received: by 2002:a05:600c:5304:b0:46e:5df3:190d with SMTP id 5b1f17b1804b1-46e7110ef5dmr4793685e9.11.1759439078875;
        Thu, 02 Oct 2025 14:04:38 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5c4c0321sm61711295e9.8.2025.10.02.14.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 14:04:37 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH 0/3] sdhci-brcmstb SD host controller SoC specific enhancements 
Date: Thu,  2 Oct 2025 17:04:23 -0400
Message-Id: <20251002210426.2490368-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_140442_790529_AF868F45 
X-CRM114-Status: UNSURE (   8.32  )
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

sdhci-brcmstb HS200 configuration for BCM72116 and PM register save restore
changes applicable to various SoCs. 

Kamal Dasu (3):
  dt-bindings: mmc: Add support for BCM72116 and BCM74371 SD host
    controller
  mmc: sdhci-brcmstb: clear CFG_OP_DLY when using HS200
  mmc: brcmstb: save and restore registers during PM

 .../bindings/mmc/brcm,sdhci-brcmstb.yaml      |   2 +
 drivers/mmc/host/sdhci-brcmstb.c              | 159 +++++++++++++++++-
 2 files changed, 153 insertions(+), 8 deletions(-)

-- 
2.34.1


