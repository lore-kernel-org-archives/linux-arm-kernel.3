Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D78FCA170
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 18:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e5ipli13t1o4xLS734cGrlylkoQC1n3PL8/KZ9gjCPQ=; b=0KR8mYQCZxfhcKrnlvwS6N5Vqg
	e0vXWJ84l+RiwlUcMVpAKmkP5GljxPqWqpZ9wi+R6oSTUXcfskNdD7JF1DU/ZaFf6QOVveSpBR0PV
	Rx9TSr0yFX9fy9F9CAdPFF8c0rPdHeQy3Sbg7UDTpoGa8TFKC0MixblR01llRpxOLpHuY/aqlH/03
	0AQrdOzxCGJs8nzchHtee9Ow+psrFYu7DYd8MLZPCO4OlfDA4iX3RVI2JOc7eFupQMl+283RQrkav
	Hs3ddDHlcHZqi4pHMQ7fkLeul6vPRFiAmm/X7RatGXlcXETtSaWqjNbNBgniHsMJfWZOw8xoxJ2Yc
	ozT+b37w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzevH-00000007riM-3FSi;
	Mon, 09 Mar 2026 18:01:43 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzevE-00000007rgs-3K0D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 18:01:42 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a9296b3926so91768625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 11:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773079300; x=1773684100; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5ipli13t1o4xLS734cGrlylkoQC1n3PL8/KZ9gjCPQ=;
        b=Yw9PLH3Lye/sflYbTpVTkZGtpntmi43b1qN2CP8SPIyFm5Fau15uDhUbnsKJr/THy9
         egcMCSt1rqap4hMpvbl8v7XUbI9bA3KPFWt0lyvjzRduPWkC707jtiG2lqTNpbyMj/3c
         fyKaHkV4Y/2tSWCzCKn6Pn69S+nkVY4wr3IbTW1Qh8WPUWdnqaDw+Awao/u8mkEQGG3O
         TMFQAVUUEGGg0vkhayubYcfKQzBR+4tdU0IZe06XNSfEYZ84ewud0lq5T5zJ4i5F2Yz4
         Z2wq+fJrLhv+XzW2QobguByHovZw+HpmCCR3TkdS4ywxDc5gIbCCuhoHbGRf7uzuMXPy
         n9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079300; x=1773684100;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5ipli13t1o4xLS734cGrlylkoQC1n3PL8/KZ9gjCPQ=;
        b=VXbK+ndscVqpCVcj3hSWWOoshxSAUCW0Tr2Xi1WXnBicAc01g8Z5pj3oDj6vwLecYW
         vFICzeu/2nPThavkP4tfS7Awzv9YBX8VW81XE6Y1j31XbmJ8Bad6DkGKYZaa9XjZP7iY
         MKQ8DgGEp1J7SFUkitomPo5opPbOeMczopPPOmmmRvMasmIUy7EUa0nQpvAACb29kJvS
         0YXZ9ARGP1TjepOBUfSrn70g+GuoGQF1qgZaNZMNETJRD3R9FV+bdBACZw65aAaJakQY
         1BhSqKmVg3zl2uC7zEQEsFWhn3dZHeZFpdgQiiwc8qIE9Th1LiSObOXnw/Hd58LmCaYW
         IpAA==
X-Forwarded-Encrypted: i=1; AJvYcCVFXKrrWIO+Q+406m9+VsGM/puuL6oYFKHBaE9bj9Rlo2g4cgFApyps0IaNlubiTRUVHSZrazHaIbMiil3vSW3q@lists.infradead.org
X-Gm-Message-State: AOJu0YyP/QJB3UskENjV//Jg42flMI8NvQ/xq3xm57U/BkOUjRj1HNfo
	GVrQKS0XJh4wRGvQ/7bEf0U7OG03WU2j9NO8VdjWHw2KGMf4oW9cOA+8
X-Gm-Gg: ATEYQzyyzJrY7tAptP6a4ZgNi2tRjqwAQj5Z5Eb6mnLp1LXtnDLfY83inE/f+BS1rOc
	iTWofICLeOJh5Y2FmFwt5p0uEZKTAk+QQp4Vc0prEXSrsBtzXmEg9P9dbi3pqA62uff9k2CQsYr
	GTTA5CxZ89nc4q1BfsttSck1QaSyrQb+HzbGrUSguxqLTg5mfBEiNuPniYQCkR5Sw3rFGRIJMq1
	1NvJCpsoXbgVvAVHOSSjlFdpRY4s3qUIuBjYJmodnhOvVe+/vw2P3SaAuJV/U5Jy5GLwpM5R5fr
	jujbjq9H6gYpKr9IDGGlFNxuGkz2CUgrZhZ/L67XMV+VTMxjhixT49x3Hkom6B0BrEme33mtk56
	nO2BS0e1B4DAS8xq/dqPAHKPIHjPTJ2JvaHVpEu9my8lm8UZQ5DjlifTdczfgZVedHwdauHK5bU
	Zyg6EKayGgYIrC7Iys/eGUkPCiQJ0jJTWfNTyKi7TtqBvga/A=
X-Received: by 2002:a17:902:e549:b0:2ae:6d9e:ed5a with SMTP id d9443c01a7336-2ae82439431mr111745765ad.13.1773079299326;
        Mon, 09 Mar 2026 11:01:39 -0700 (PDT)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:a816:d74a:dc19:1ab8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57b1fsm163828605ad.12.2026.03.09.11.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 11:01:38 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 10 Mar 2026 02:01:34 +0800
Subject: [PATCH v2] spi: rockchip-sfc: Fix double-free in remove() callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-sfc-v2-1-67fab04b097f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAP0Kr2kC/1WMyw7CIBBFf6WZtZiBRiiu/A/TRYWhncQ+AoZoG
 v5d7M7lubnn7JAoMiW4NjtEypx4XSqoUwNuGpaRBPvKoFBpbPEiUnCiRWOwI+udNlCfW6TA76N
 y7ytPnF5r/BzRLH/rv5+lkEKHR9A+IHXW3sZ54OfZrTP0pZQv5jq+npYAAAA=
X-Change-ID: 20260305-sfc-307708e9dc67
To: Mark Brown <broonie@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jon Lin <jon.lin@rock-chips.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773079296; l=1288;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=maxlVA4oxzDMZWxd7ftlkv5zJkOpC9hH0WTm1wcE8xY=;
 b=fNA/SvWU8RLkVmDt2uPXlgA30FSBSbY7QUvh1H2Ow5wXz38XGvEZs8Vw6XrRUMUi1rV6Zv5HI
 iR762V88B/FCeskYwi/m6NmJ2m6uoE1uY7cO43K8C75RhUrG8Wr8isl
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_110140_837249_9283EA67 
X-CRM114-Status: GOOD (  14.08  )
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

The driver uses devm_spi_register_controller() for registration, which
automatically unregisters the controller via devm cleanup when the
device is removed. The manual call to spi_unregister_controller() in
the remove() callback can lead to a double-free.

And to make sure controller is unregistered before DMA buffer is
unmapped, switch to use spi_register_controller() in probe().

Fixes: 8011709906d0 ("spi: rockchip-sfc: Support pm ops")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Fix Mark's comment.
- Link to v1: https://lore.kernel.org/r/20260305-sfc-v1-1-6fbf6df0e899@gmail.com
---
 drivers/spi/spi-rockchip-sfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
index 2990bf85ee47..174995042f53 100644
--- a/drivers/spi/spi-rockchip-sfc.c
+++ b/drivers/spi/spi-rockchip-sfc.c
@@ -711,7 +711,7 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = devm_spi_register_controller(dev, host);
+	ret = spi_register_controller(host);
 	if (ret)
 		goto err_register;
 

---
base-commit: 3f9cd19e764b782706dbaacc69e502099cb014ba
change-id: 20260305-sfc-307708e9dc67

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


