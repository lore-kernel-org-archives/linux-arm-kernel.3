Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A7DF3ED50
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 19:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cHQbtwOxcmIRSK/UYtPX+LYU+lWy7jhzQ3NwSZU5rqA=; b=R3alop35dr/zGq
	Gt2d7zo2RnU+isRWvmmWimRZh4kMiX+AncU6OdQHEVCqkC7T088EgGmd+NsmI04bskbvwMaM6Pd5+
	A/I1NG+LFOsu1NbNyZsXwPGwr30rKNX2dv6tYGyc1C1J/Cj9IjafnjF6q8BQE0Fn0JBcnexSlHnBM
	nm7bi/JA5yRgYTBZ7xrwgXRk8UfqBoVpi83ovyWxcuWaa9JHROZShaB+988i4ndTHw3Eei3PcwBBK
	NaBiyu6RCen5/fZ1snyrGxvWDStsjA8w8I2F51akkosV/EBoQHsgaVM2Te6Xz+4czZd27dKdKn3Fc
	pEFmunszbDC5Zz68VxNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBdc2-0000000DjDO-3SGb;
	Sat, 11 Apr 2026 19:03:22 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBdbz-0000000DjD3-3y0O
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 19:03:21 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-82f2766905fso164386b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 12:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775934198; x=1776538998; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cHQbtwOxcmIRSK/UYtPX+LYU+lWy7jhzQ3NwSZU5rqA=;
        b=kNhiEN59BZGk3kFaWWMaZtI62jklHvrHy/2UnHFVQxHS32mICYF15Vo5BItQ/VpbzA
         fleuKpuJQunMvBUvj+5TGArtK6jrvVz6m7Xh/I4+thq/hc5ZziRZQY06IN92Yf9sR7M8
         GRgjgC0jpAcllujKtLDiJbhvu5fqlIXeoBqZKsHQLCyiRT9dlHzJbK3Mlw8GJoAVbiaW
         MnkQiN6+WddH2Q6PzAfRkbaYEHNeuwmfAtgnF0oHIWDHGVnHjvTDBoUv0ornA2HyZqg0
         Pje3Jb/BiiFGrIocasnagVQdyjpiYMGL1K3QU1m0MMLDj60GfmN2oCBnT7PCQ3fNoxu+
         4wMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775934198; x=1776538998;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHQbtwOxcmIRSK/UYtPX+LYU+lWy7jhzQ3NwSZU5rqA=;
        b=feBO/G4kmiE21i58CRFLgCTjN4rHmZJuF45U7XkmBnVdBtbA5RVvBZnn6Pa6a7bhat
         TtrJVUjC4jO/x4phu8focGor+iUWyXRN1QtCNE58g1YsLH257v2LDS3xLYoL0ScWhBSl
         MzibOSaXNX33P337t0JdkHzn9kIyxxHA/Q+ob+ZkM24u9ZjdB+UD+B75TJSGsgPzBuzH
         OAcUEyGWpmi2TwpLE59Jy3Gh0wCTPaW37nP9eoaW36hb0KyQemAi8W8BY/DqTj9XMheZ
         h9kbsA3mK4HYRo8PJXp8ET0MWABKntbK4xcJ7nz0HJIl5XQaaanxBi44S6nkatPesB0L
         6d0A==
X-Forwarded-Encrypted: i=1; AJvYcCXHP+qEzTNU+sphOml/Z/C25Lwl7cs691KWbEh7+PZyoByfmDmXBaqSuLKHvQWUEwlaofxvSh66mH4NWzCfa+PG@lists.infradead.org
X-Gm-Message-State: AOJu0YyJRK6xo5cXBRmFBu12yy8pd3yxgZs4kocY7yNEaftSBeiNv9/v
	Zu6NL5DPqNRxPLtUEDyw/2rEVUpN4MJ1qVky9shW9D+oNYW3NWuLlaLqMoru97kr63o=
X-Gm-Gg: AeBDiesuOhW/VEXdfjusDydWTIlLbiUdQreY6mf4mfgJdX399GAZhTT6tEA2QcQP6xU
	AFuCI7XRRxrb8Vc+xqLjkf4sX1MUvU0upjClAZCozUCRMiS6UY9UBw101a0VfDieLU+w+HXV4SZ
	+IK5zSE/YlPwr8UlQiIpbknkyr7QD6IvtNBGhLgb1eoAhqDGYcOgEcqKTP5g5x4lKutnwcv/1DX
	0vTAw+zSvyeMiujjovqDXKsdDoBx2fWDZU42I5DteOSXl2PqmSJw4lx/m16J995nAaUPFaYcV+x
	4KrtySwKjYtG825NSRzG3t8gqb6YR2LIXwp4At7QwXrTDvXCTs9x5B+51diXZScuh0vsHmwu+A8
	emRGpCnKcX3bCoqrG6mfbhxyJOUCydP3iDofGNC7TgmVhYmTs+kSAyVEqzg+g/t/LxIhFn3CZoF
	tbawrRt5SEy4u8I29oTMT6aeYfw4kp4bB9ioH7eGY5gODK+f8USgHAgOkWJf/1lqA3uD+Q7UH31
	77nQimeWGc5jD1QSdvq
X-Received: by 2002:a05:6a00:4511:b0:82c:d7c4:4c69 with SMTP id d2e1a72fcca58-82f0c25e146mr6937134b3a.3.1775934198466;
        Sat, 11 Apr 2026 12:03:18 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c338dafsm7058962b3a.17.2026.04.11.12.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 12:03:18 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH 0/2] thermal/drivers/imx: two fixes
Date: Sun, 12 Apr 2026 03:03:02 +0800
Message-Id: <20260412-imx-v1-0-cc3b45d63811@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOaa2mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0ND3czcCt0kAyMjc0vD1ETDJEsloMqCotS0zAqwKdGxtbUAiHbDg1U
 AAAA=
X-Change-ID: 20260411-imx-b022791ea1b9
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775934187; l=466;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=NII7TnwJKw9YmpDBsJARaImgJVJgLGoeincDCzPqxIg=;
 b=oOk6zMzS2U2kzS+HMpp1a5HcEb8Vdhy4v8qOt3ufeM4ZWYMHoTsGqtnpnobEicfRXOpK9Rw9s
 BWfCxPCuXf+AiGyK3+8Ttl8xIe6Pr5IcO+NKkx4+Re8Ahgs/MxZAn+n
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_120319_991247_1F4A939C 
X-CRM114-Status: UNSURE (   6.64  )
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

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Felix Gu (2):
      thermal/drivers/imx: Fix thermal zone leak on probe error path
      thermal/drivers/imxl:Fix runtime PM handling on early returns

 drivers/thermal/imx_thermal.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)
---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260411-imx-b022791ea1b9

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


