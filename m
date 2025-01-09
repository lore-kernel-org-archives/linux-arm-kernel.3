Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CBBE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 15:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ui++7fz34GKZbY8fJxrOyiw8TD3D7+pRtsyH410bGL4=; b=PYo5ZJfT9OgEY4
	evApORKwiMhf8B1yAkDxJk6cUwmZTNFZRGlbdEifNnLczgSecTCQ1Uzm65LRNjuCDQ2eOcsta0rNE
	yY+hRoprebir9lSCNK8oNtsHHCUu8AXGlxLIpiBh/pHNvgIm/uRJ5gcRHThzGIuYj4JuMJ1DPBz0a
	77P8s1QxefVznhQkKhLYQcv4+ul+PLWOXB+AqvvMwbsvo2deHc9bl8ZiQ7q7LyxMjnF4FpkO5cEYH
	KHhXxxpW+6nAP0V3+ZzA97cUAnc396W7CM9o02BoiqXroEtXAjTa3ocNiqBH0aH9grCoI2ZkxrXm5
	Lc1KuVg5H2Ox/mSX/AQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuVq-0000000CUE0-2mk7;
	Thu, 09 Jan 2025 15:31:58 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuU0-0000000CTnF-4AEF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 15:30:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43635796b48so7254205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 07:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736436603; x=1737041403; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ui++7fz34GKZbY8fJxrOyiw8TD3D7+pRtsyH410bGL4=;
        b=BK1zDJqDGcrlDH/VjKdb0vhIeSOov+CtuUFqd0+XESmCMNeV7s27hna3/Z8MW/nsiV
         59gBsnE1LWziJR2CKS4SONEDOLMqwV1oLatjr9LDLbEZ4MzXlUkx9M6HE9OTl5Dpwaf3
         xRwBNWQQSm+zeheoxLb6Irl+CvGr9MnHQyiZdxoWe1xX7L1BO5rHjz8HqO9xir4gsOql
         wC1VLdTjhi9eUg/ll9cdA/nkyvhp9UDKmmPTeoDwXMJbxH9xJBedLuf7Fr4naJSODdl6
         2dne3Da4gFutQmaN2J6fpIdYU2LjWv2cQUxzy5OuM1oq+YAbtNjAWNPAnYj7dJ3EGlpP
         d2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736436603; x=1737041403;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ui++7fz34GKZbY8fJxrOyiw8TD3D7+pRtsyH410bGL4=;
        b=nYz6P4xVfxJetACuU3XtiLPWYCxMKtWr29hP5DjtyX47djKappDWev8AMAm+qIPHB4
         G/hxF8lEaSGhO2FQTmoudoY5yPZZ/GtL5tOy2Cn/Hkd2TCwx8Bejm3O1KzyCXgFEkZ0e
         uSFUQAgxposoJ5QZQDsFsEEjlf/1+2SoHfT5dbrf46a9nE1yM1IPN/P2nkl+s3gf9WR1
         B8UywvEFb9YfPM6MV11Xl7d+Ury8CRQWsbQulLxb9qtKTqbwN8tfYR/WXjhwDbrXRWbC
         ibbwwd4qwhkpawVUslKZMnrOgm2QMQ2nFcS2veqrI8yH/JY0h23GzaQ6+4PFzzdjf3dH
         FToQ==
X-Gm-Message-State: AOJu0YzOYMRf+dTbtd8kaMn8/6yYqG9OQECPOqzUTfP1j69seGZecQus
	wEEavTOUaKdDwx11u8TuE4XHXiIRTXoPOne+1UfZ8Hq94tP5OK1pxKlZ5xiB6NU=
X-Gm-Gg: ASbGncs9AfDm5LHzGMXFj/BJOxt8Se5ndorpUn++nE95j+D5u2MtNenhm4PbSrCNHrh
	rk5l8ddaUn0I0/ZNJnuvRyB8ZjdpXzFZ5y6kIssNogLqwcuxlYG7e2y+5k5Xm/QlPuk/r6dwOHd
	WjI6zlIrisZiqjQliI4bGFHyowSrDxqxwWby61XPj5O6mEuwXG/qW2abm4CWWToraHsH9I+Y+zV
	IilZOBdsXH2K3woK49l++PeRjxAxFLSSN0iq3izQPQd85zDO8aIqICrbrA=
X-Google-Smtp-Source: AGHT+IESEIosHxIgZW6pfGN37jB+1SZ6af3hY/XwSnu7UbwNBffzVz+YXNgg1d15dRMaOLI3zib2aw==
X-Received: by 2002:a05:600c:4e43:b0:434:fddf:5c06 with SMTP id 5b1f17b1804b1-436e9d686f3mr23854545e9.1.1736436602912;
        Thu, 09 Jan 2025 07:30:02 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e2df3610sm58307805e9.20.2025.01.09.07.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:30:02 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 0/2] Enable RTC for the MT6357
Date: Thu, 09 Jan 2025 16:29:50 +0100
Message-Id: <20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG7rf2cC/x2NQQqDMBAAvyJ77koSG6H9SvGwiZu6IGnZiAji3
 40eh2GYHQqrcIF3s4PyKkV+uYJ9NBAnyl9GGSuDM84ba17ImcLMqEvE4FJ6dp6SGz3UIFBhDEo
 5Tley9q3tUGN/ub9yku0efYbjOAEoLT/8eAAAAA==
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=606; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=pi3L0TZNyW+gb4rA9VnMXp8LC2gcMzm0O2i5QO+sp+g=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnf+t5/shO0hxQN8k02k2mkITZ69XbCGjT/miBkOuz
 GtM49VCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ3/reQAKCRArRkmdfjHURZp5D/
 0TaKWE8eyl/vEG7RaHLANL42Ymep1Hwe4a6NebC/W2NvNncoYaOY94DhnlFGHfg+2F7F2JJRVKxunq
 P12s2mr8NtBdYMPGdC2vAjzQ36YhUFIAHY4Tnxji6aW3UNvLKyF84vy2AGJhkx6nMKCNd0RPGkJiWl
 nqjkrKekSzCZwdDMS68tKAj+w2Y6YcUGV7LDuN0SdCmMMY8JWkseOOtYhAHqw0NcnYF6VayA886LoQ
 Q+Gw+tsP2CaXVOL3tyfywmrolG9ufPcsA4mpZTZBKCYf+zgfDfzB4AZ1s5P3on8rZhz1hnlltPT2yN
 NVcngc8oe9rEYaxXlFCx8vCwJYCh9OOBaCyd5b+H1ptFQZzbMS20MnAer0cF+F69x69cadrfqoTv01
 i5JwxVO1kercx1a8A4DM18shkyhzUV01fOl+lpmCZ869cVnhNiQ5BBhifI6aq70CqCunidVO1CMQsu
 sLlW1gKWZveod4lkQcy/449bn6mjzw+wgNhfjFc+8PqfcHJbqhd7NqskaQGEVClfPAxSELllcUp0vl
 yiYiPqzZWKfybXWt3JkCAuaMhfxnSYPieu2Ib9IAV2BjhwIOWOOeZfEIMe8n6ta7/RIT5kPFBI7GWS
 6LG1rSv2KDsQ8b67cSa5b/5zd8NTVfJwu8nNyQ3EVVHGX01oRs9+yuWkPLhA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_073005_026671_7DF0F84F 
X-CRM114-Status: UNSURE (   8.25  )
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

MT6357 PMIC's RTC use can use the MT6397 drivers with the MT6358 data.
Also, since kernel 6.6, a regression has been observed. The changes
responsible for the regression have been reverted.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (2):
      rtc: mt6359: add mt6357 support
      rtc: mt6359: fix year issue

 drivers/rtc/rtc-mt6397.c | 10 ++++++++++
 1 file changed, 10 insertions(+)
---
base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
change-id: 20250109-enable-rtc-b2ff435af2d5

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


