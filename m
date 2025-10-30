Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4485FCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 22:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5vuV/8yNqcCPgemhGCUUQBQDrlCH0iJrd6i7TcBGCZU=; b=d2oQspK2PM3WUOl7vQegmAb+N7
	hIPJPIk+C70LLaessei198NpKXD5xo087sDb8K6HTWFNycumvWqMpkGHzJKVxdrrr7wS+lwgxRY7j
	s4jBHl9sq6eYSZjoqDIR2eixYZVVP8UVXeo01lvtXvrVeFFeaFv7onQ4zBqN18HDuPAtbYNi5koyJ
	Wkpr//pXqJoKD36Ko31IOzEQoO+FxWF65lim79aI5ZBXS4hFCJ5L2Av7YS9g0zhgg22ZF1AicuCI5
	FCYn2m1xYvz3zYbFzMxl9wYam1SnnpRF5Y+qKCvru2Ew6AJz4EZNmwt6h7p8L8qxKfyQWDibpW61f
	Dno7rapQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEb5Z-000000054CF-3xUJ;
	Thu, 30 Oct 2025 22:25:49 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEb5T-000000054BU-0iu7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 22:25:47 +0000
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3c2db014easo348308466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 15:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761863140; x=1762467940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5vuV/8yNqcCPgemhGCUUQBQDrlCH0iJrd6i7TcBGCZU=;
        b=sLkgWLl34kevPuRJK2qq7LdinijiHQ/f3rzl/HyCC64jlPIBAswD2jaj7Asnf7esZd
         pDzQyCmWMfnM9FWLPIR0sXYsIo8kZWc3ICBqgUek2FELs4grwIrARgdQTMEbtJONSH8m
         CUt93px78GgaWcAOSmVhWz/byhn0lCPtszB8kAe7+nyEUZQL2wCpOP2Pq2973N2aUcbC
         Vj34hhzs43W2svmG/nKZ85n3Hq99H7S4GUyntL9xgia3wDeryXhvNgyxrqIlCwkMPb5L
         T7bSxTMsRo3ph/qfFZjy3Ij7ZyAwYUlujHlkGlwK3eVGQFU3SkOoN679c+XCkPj6PXXQ
         Pq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761863140; x=1762467940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vuV/8yNqcCPgemhGCUUQBQDrlCH0iJrd6i7TcBGCZU=;
        b=KrRVB4OYeg96bw4OhgqjksAKryORH71cu3WI1oXDDF9Ed5cCwCYeg46zNzh9YZC2Pv
         c019Rbr7fCljr24FiX0Fd5KvErucTweaunjMN4mgN7nN8CH5BTmemzuh5Up4+ghsZ89B
         weut3tv68SdoHVBOKpVrdtuUfI8jpUmYEIK9QjY+rWj6MXxfz6Y8h7JRN2+YbXwttDE6
         5jHMhPs/Jl0Y5jslKjV7AHX6NKnfxly8vTvVxpO5QNbhfoWhyYo/+q2a8Ofo5TxM5pR3
         BVOZ3jXW+EPNPK9mLkNnN6F+nDYLzmw9njOGrhnC//kvxxEvjU70C7ydwewQk0MicnBE
         ULBw==
X-Forwarded-Encrypted: i=1; AJvYcCXTpNQT8U6EzcIpMrldV4pmuc8HZELmAJ75QDRsN8rafLzB9kcg0thmGdAgRr3Bt3nbD4X0PzblNLsMJ0BwsSjB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcup9E3BC2lceY8l9t8Uc632fZKTNYlEmlYvEhvkyRaTgTPYkU
	YDmXetysdJ7KjoorjWxErlupW7zbGI+iJE2f+jDmWmo1O6g0k3aO0/cxgqy1+Cc4BYz2UEOCJRS
	hYzzd
X-Gm-Gg: ASbGncsgPLYrCClwDeydOfJAHwXExW657tH7E9dV1Xgm00tawqZS41J+EAXy78sgkBT
	J0BcD6MpwpDlGrtQpGhXNgXgHRVA2waibQcUSkLTIhhH1Gwa/nLN0Qb4UVP/4c8Qyy2r11ObRiI
	45SFNt3lL7kWNZcxXKOz1EL6JCL7/wPrk9GH1kLvoumNHqZEvC5F8Au6JpgI8zmShXzN+YyM/Eu
	hz2bjSZzgdHTkWzzXAHCMSbCxfrkY6z8l6xvtTXJRJOFoX0Y7FDUNErRiAj1qKi4FeEtDKZ89KN
	h8VvpY2NpPzdBwq2rMTd69MRtYN8O49fE0fFWIqsWlLO/WtOtfhG6ygVDeM48PisIJcvuR5AIIN
	f6vWkHivGrzPKhvJGIWEiHdBQ9urbsXzY7EzFDZoWkOF+bP3LUg2wtG3DvxQ5wXpRSpOC5pzUGo
	i0dRn1fg==
X-Google-Smtp-Source: AGHT+IF5SUMEmxJ7sHz5EU26ysWE5fSSIeUi/liwYBUEkNzqfcfYDxvn9nhf0+F8pjiFc45fRSt38g==
X-Received: by 2002:a17:907:806:b0:b3b:82ee:def9 with SMTP id a640c23a62f3a-b707083054emr117347566b.53.1761863140409;
        Thu, 30 Oct 2025 15:25:40 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7044d00de6sm579859366b.74.2025.10.30.15.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 15:25:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Julia Lawall <julia.lawall@inria.fr>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pwm: mediatek: Make use of struct_size macro
Date: Thu, 30 Oct 2025 23:25:27 +0100
Message-ID: <20251030222528.632836-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=SYIUerC/xexWng8EppMsWh0BUF/Bl5ux1CEatheccIw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpA+XYSVrbXsDagZh1G/OShMN8OLLSgCz++eV/0 4cjDcAPTWqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaQPl2AAKCRCPgPtYfRL+ TqUZB/9yusSl/guKODh4FsI0I+VSKcrmxssTgz9GdsZBh4o+ADFSw6swjRwKMmGEQovx/evZ0n2 ckY5v3yWkiu4td18CXVksMoUPZNhz/DFtmyjkx6IezcMEYhEeNv39mSbfDVy6r+YvKDZYDZF93c BtFVfvL2givWJwEOF1ZEoOPuy5Zej30p40lSSb+x+NUOy1IaQXsa2olJHZIfQe9ZoTZAsjClru6 fA89b6jO2Kw0Z9sFzSzihGGyH39655BbMp9d1BKhMArWNy8ANoWx7MvU/88ZBgIb+6ZuKNvKMlc lPEZp4uWp/Pt4LHbAgl3TnIZw+BVLw/FrcunXV613rpsopxj
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_152543_333867_37F784E7 
X-CRM114-Status: GOOD (  13.80  )
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

struct_size provides the size of a struct with a flexible array member.
Use that instead of open-coding it (with less checks than the global
macro).

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202510301753.iqGmTwae-lkp@intel.com/
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 4291072a13a7..d09f2eb4fb24 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -377,7 +377,7 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 	soc = of_device_get_match_data(&pdev->dev);
 
 	chip = devm_pwmchip_alloc(&pdev->dev, soc->num_pwms,
-				  sizeof(*pc) + soc->num_pwms * sizeof(*pc->clk_pwms));
+				  struct_size(pc, clk_pwms, soc->num_pwms));
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);
 	pc = to_pwm_mediatek_chip(chip);

base-commit: 27a8bb33b660614184b9382c146afd2ebfd7d7b7
-- 
2.47.3


