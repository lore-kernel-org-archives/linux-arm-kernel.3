Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5EED12D4F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 19:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bpd/1gDMy+CTi0HB/qw5fPz2wxmUKHefEUhB4gCbWCU=; b=EVBJmoyK+vZ3S8
	/mTQTNGxtlIlmNxUtLf3s/Zyunz6/Co/eWfO2rLyJZJFr1FGEAhCmp+vj9sHJP9dXD7Bz9r98Dw4p
	TtHQ/kZqAyqnDH8VrbkWSONK8iDzvCzs6ujkDxZ/aCk9rYz4LLMUm9ZfqzWsVl6LXXQ4W1WH+vGQ9
	57nxTKl2LHks+chEvBlxTWlrVbjeknvrZkAaGCKEWIj8aiCpryFP5khGzqoqnaKOomumh3bcp/DtN
	yIA7nq8Ft7OVnaGnvVK4I2lmLpraBz9AOCtWl1Ki1h2Bqg0l+9Ju5yfQPC0yA2qqByowk5rlp7XHr
	xTXMQEoO80Ck7WxjSvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tADZi-0000000FSHX-0zRZ;
	Sun, 10 Nov 2024 19:26:18 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tADXv-0000000FS22-3bUf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 19:24:29 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5c9693dc739so5567452a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Nov 2024 11:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731266665; x=1731871465; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bpd/1gDMy+CTi0HB/qw5fPz2wxmUKHefEUhB4gCbWCU=;
        b=iFXNm+t+Rj7ZhJr+0RggWd01bSCNb657onfS30IKLIpynQ0+YwZnfQyQFqG3Zlb0nn
         QMGmO7pRJPP+o3N6p4tTOuJWyyL/NiuM64rBR+r0MwKpPmUTe5exdicnkTWK0sBfMOxo
         aXw1b3dFf1J8F+mMzRz+3zA+jj0DsGbBRE7uzbi0O0LWQJzz7+YJt18+hpsVRyBbtI8k
         CygrwNftfiuK5bgrdfDtqrGcPH4XBnyZo5dbwaYF5ta7HG+vuC2YCsKzRdZQNZIEnMr9
         lGR1vwHk4ANG7qWL/C1qJrWFfXINa2Ra1VOXf+qG4SlfWfAReZEzXJAoM8ec2zXOjyDm
         Vu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731266665; x=1731871465;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpd/1gDMy+CTi0HB/qw5fPz2wxmUKHefEUhB4gCbWCU=;
        b=HEcOnAUlxTv5Inenib38XPPs+BSf37+tmqDEpS3cQgLBtO0SaoipcDtcheomyEGLxQ
         09DJ2kFYWNjvoNh8A8BFlNlr6OAJW8eMIu1kujitXCMisGQas0+UG2s+iWDw8C2JNomG
         CchFp+UcxbDP9OVJvrMuE9ywG2tsEvMvuhoEs3YQ5lGhHVqhFYSTyMoUibRxnEF5+o/o
         Og/9UgKHleP8WFPwKAiC5pdOCz4Tk05JuHua8mwjizr8JipgugBCqC1T4z4zVbKFH7lD
         9m/E2Q/jPRMSD08dZEOgJ/koCxQf5Bopg5v6ft/nnPHb663AvH20tScKrFr8f/mY+djZ
         XwdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb/XDf3hPOT1RLPDLKOFJLAfo6xsRvNEzpIbInUjlG5GN6B6d/1OQXZXeJzx1leGfBhkQ1n0sLP/mSyOEaf9JH@lists.infradead.org
X-Gm-Message-State: AOJu0YzmTi+kmzy25x2EVfRbJYBlmwIPG1hXCI4pOrnokCknX1ielVvv
	p2FH9+jFCEGZhXeky4IlIVZh8JYZcdnCPwikgXaDpPp+qB0/sefY
X-Google-Smtp-Source: AGHT+IGwg5e/yEHyqFxbzv6x83YEXnH3A7V20G4q4dRQLeeKdzn0HLMK+KtUTjQlb8+OrHuv9q78gg==
X-Received: by 2002:a17:907:2dab:b0:a99:89bd:d84a with SMTP id a640c23a62f3a-a9eeff3786amr1003564366b.25.1731266665135;
        Sun, 10 Nov 2024 11:24:25 -0800 (PST)
Received: from [127.0.1.1] (leased-line-46-53-189-50.telecom.by. [46.53.189.50])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9ee0e0fabesm502497666b.174.2024.11.10.11.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 11:24:24 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v2 0/2] power: supply: max17042: cleanup and more features
Date: Sun, 10 Nov 2024 22:24:14 +0300
Message-Id: <20241108-b4-max17042-v2-0-f058f7a16bab@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF4IMWcC/1XMQQ7CIBCF4as0sxYDSIt15T1MFxSHdhIpBgypa
 bi72MSFy/8l79sgYSRMcGk2iJgpUVhqyEMDdjbLhIzutUFyqYTgZzYq5s0qNFeS9SfeOatb4wx
 CfTwjOlp37TbUnim9QnzveBbf9ef0f04WjLMe5cg1tgp1d528ocfRBg9DKeUDk27vvaYAAAA=
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731266662; l=1653;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=H1Syh1UcSJ7M8dVuvV3iuTAa8UOyjg7qSAGjvxwMJ7A=;
 b=CTvVR/zeK0bf1gPQRzeu+eKHLSmULIxA0my7hMX8imFRf4sEhbEdk/kIXs3kXFl0+9AFP9aSq
 OzM08qUtk74DuRPugKgYdS6HsD1UZnzsbT5MYqqiaOuBVougzy8Jg65
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_112427_937637_63C4A518 
X-CRM114-Status: GOOD (  10.38  )
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

Fuelgauge blocks often are incorporated in bigger chip,
which may use only 1 line for interrupts. Shared-irq
handles that case by requesting irq as shared.

Maxim PMICs may include fuel gauge with additional features, which is
out of single Linux power supply driver scope.

For example, in max77705 PMIC fuelgauge has additional registers,
like IIN_REG, VSYS_REG, ISYS_REG. Those needed to measure PMIC input
current, system voltage and current respectively. Those measurements
cannot be bound to any of fuelgauge properties.

The solution here add and option to use max17042 driver as a MFD
sub device, thus allowing any additional functionality be implemented as
another sub device. This will help to reduce code duplication in MFD
fuel gauge drivers.

Make max17042 interrupt shared, and add platform driver
version.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v2:
- drop NACKed commits
- make shared interrupts unconditionally
- rework descriptions
- add platform driver version
- Link to v1: https://lore.kernel.org/r/20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com

---
Dzmitry Sankouski (2):
      power: supply: max17042: make interrupt shared
      power: supply: max17042: add platform driver variant

 drivers/power/supply/max17042_battery.c | 106 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 84 insertions(+), 22 deletions(-)
---
base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
change-id: 20241108-b4-max17042-9306fc75afae

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


