Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8D2C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 13:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xR/zckWVNzKKFa7LSQ++02YjQJSEEQWqz9MIi6yuZiU=; b=z+cnWsfSb4XiFVFyROQxwMEOWt
	LygveUXvpvG7nyIWndmtn6vP6v+/CrjjrYNA4rIbL1O+E4l+3ZpoyCb0lg4/vJ+cHJzGBAUY853L8
	5v/RUxBGIuTBUQ5rziNUeaaS1ZR1zhx3tcPKSGbsH3ltU2Ht5Jkt5w+m2ghPaHeAMAAL3KFJh851i
	xCYHE8lOGTh+k2ubuWEhMq7M4ltRjscJYrM5W8TZeyR13FKE7TJB2lODKX/yi2rt5yAoa8Jv2HbAS
	jsGhBwE9D7WlBEQmpIFrhGueTvOu6guLdl0T9Wg8iAO+7xcQ181pQ3JmVGahBDeWNNcvv/JrZDtza
	WD57idRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWagN-00000005RKP-3yBB;
	Tue, 01 Jul 2025 13:05:56 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZSo-00000004ucT-0V29
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:47:51 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-553b16a0e38so6080106e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370468; x=1751975268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xR/zckWVNzKKFa7LSQ++02YjQJSEEQWqz9MIi6yuZiU=;
        b=KqlO2G6ZBL8fhAkK7L50U/i9ZBlrSnlsY4m63QbVxMzMtYzHKXUJJKbYZcMqlpbbl5
         X7fgOPZi5k3x0tAZ8WR++rxyrkD2VG/Z+8h7F8G0dBfU4+xFXu2uMwqvGh134yz6XToC
         BNeJBkMySgPAzPTs88paqIUu2SHmrV7AyHcTbS7rpbLq6A0eZKEbSST46im7hGJHyZaZ
         FWEzZAa1CIG7qS6k7XRm20D/Jc8462I6Z6/ErVd77XC3N7s3SSC5y9V4KSKicYjADVXA
         U8Sxl47EIf47PRvc3TVThxMVwvp0Neu5yg9jI+w9oZtLGJ44pFBaxKlAxRXjbdpdxrNu
         4Avw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370468; x=1751975268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xR/zckWVNzKKFa7LSQ++02YjQJSEEQWqz9MIi6yuZiU=;
        b=gFvjyizv1FGzkRl9B33XzhsFvo722mZkmGbjGdOQOv09qIpv4JlYc62dkWSBGF094/
         Rd0Iu7ErWbeU+w2ifNBRjlVRmOwfFxx8qqz8IrP/Ok5VVikWD5OT+7BJi1mhMpaG6uBm
         BQQkJ5QCjzRdYtwQTtZUyoaDOMcn0JzAeJeR31XpP3uM1V+GxzTpUVEyBYN+Eqwu2FZJ
         ClieO540gw1w6tD0QLPXKs+SN8nvpFkn8VpdV3wgHjdG+B380eDAi14Wyou94sIxbxnQ
         yuvaDgqZaZ1ZS7hM+1CDVaCPQoLkqG/JfFmMa0e0XwGWAexWIenPmc4brckH7ubz4RIs
         +pAw==
X-Forwarded-Encrypted: i=1; AJvYcCX4H1+cEpKlJck4ftWuQAypNWx8Y5MW+Q3RWjJeoMcxIJChNdCiwuJxy6f0il61haeKcKni6xw+IlSuRtnRJA5o@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7Icru1qqYJYyxLEJf+k32OBt+enaHrI+7gtX91Po9g97ZvaUO
	tDQDJgFgonkTHCqIFRgdqQZXZG1uAc4k2FJf4rQ2oJxtEhG0y/iBGKN0sOdVzNTKCK4=
X-Gm-Gg: ASbGncuuIhVgQx7z1lNNmltnP64xSV/YUkR24gbE/T3VkFiDrxLqnHp8L8Ccl1XcAmx
	ZAHSmTZoxmeyh8Ek0DdCYSu3bsQ/p6FRwrZssFRpBnB3BpfED7mgFfZqmRp5PL7yRVmyuCmnWif
	wld6p0FJV43ASZ1RP9psp/hO5cacMmNI2AxPNrRB0BA/Y9+AVgiPlcY1094gq6B+BOA3HQMZd51
	EUZvCZm3OLVwXamFaFXUsuOk6/57WapZcOL3kibmJ0rHo2z32Nv08ulg0z5FDrIEf5IIfa76soc
	xGNPQolCkfVhO6ae2rqKW2RilEBXWuZ1BT+5KuCpb+zfWKZJ7RS5LsLwUKvH7pOxNnKFBxsR+3M
	TRsrFsrzXlfgkAOKN9WE4yTkslXRAEglea72c
X-Google-Smtp-Source: AGHT+IGO5gKzZu+VtDDlyhN1DOFOUCU8t35eiES1E+DxBtLsVS3EGtlEnPMXH9LKCJiKW0MjI+Jmzw==
X-Received: by 2002:a05:6512:159a:b0:553:ac4c:2177 with SMTP id 2adb3069b0e04-5550b83772amr4796245e87.20.1751370466845;
        Tue, 01 Jul 2025 04:47:46 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:46 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/24] pmdomain: renesas: rmobile-sysc: Move init to postcore_initcall
Date: Tue,  1 Jul 2025 13:47:04 +0200
Message-ID: <20250701114733.636510-3-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044750_155173_08D628C0 
X-CRM114-Status: GOOD (  13.32  )
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

Subsequent changes to genpd adds a limitation that registering a genpd OF
providers must be done after its bus registration, which is at
core_initcall. To adopt to this, let's move to a postcore_initcall.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- New patch.

---
 drivers/pmdomain/renesas/rmobile-sysc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pmdomain/renesas/rmobile-sysc.c b/drivers/pmdomain/renesas/rmobile-sysc.c
index 5848e79aa438..8eedc9a1d825 100644
--- a/drivers/pmdomain/renesas/rmobile-sysc.c
+++ b/drivers/pmdomain/renesas/rmobile-sysc.c
@@ -335,5 +335,4 @@ static int __init rmobile_init_pm_domains(void)
 
 	return ret;
 }
-
-core_initcall(rmobile_init_pm_domains);
+postcore_initcall(rmobile_init_pm_domains);
-- 
2.43.0


