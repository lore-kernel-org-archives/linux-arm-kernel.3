Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31B9E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 14:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0E20nH4nI7hZl+zQi4Z91y7ffU07fB4nfSqv0rzeH8M=; b=3v9EXLmr3teaAy
	S841w+1bIqJjk6tscLi73j4aNWaCstoSFBTYcF/BndB1qvM0ocw3c7ksB5q0+lc4s0Dl7RFga0qZR
	cYmQ8EElTHzuLlJAFjF3xxBuDOtSkZANLBjiuZPTz3klRYx/trhoQ6HuWnXm+rpCV7mPN/4NLYRus
	IAt7VKKt1aOlCZ8SPllu/CSrPGw7fRb5PZd1A3yC9ftcdjB0dfx5BjcoO6q5GVATuBpJ8axd0X+jR
	x/cFwIP/9nEyiWa6ZsPSRV8e/m++LItFnDicwHs6Y/sQ73eDka5iq8GmZW7TMx7snrjRjnMJwW/BB
	2OWAjxVqgGIynwynzIpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPjXV-0000000ACBd-0tk7;
	Mon, 23 Dec 2024 14:36:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPiWj-0000000A4W2-0rjz
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Dec 2024 13:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=0E20nH4nI7hZl+zQi4Z91y7ffU07fB4nfSqv0rzeH8M=; b=DRLAqy3HMcZ7VbAGlGQ2vE3F0F
	BA3DA6fa097t/8ANBjNVcEvXXrDSydjyexpl9UsiyVt4UpxuoLBW/jq0tgfdua/7cGqFFxKPLyNE+
	/hXdDiTh2NsFzNcuJKzJDxzdlXU7A5WSAZ2xscRm2ETByly1ugkZLtP/LnznY3JPzwlyTToXGkU+d
	lhdVTSQX9e7E/eN8/0IxLrvOZhz5Yc5E27J5KXN95xqnQvCZqaG5bh/DAVprtnvUsS+bymZM2Fuix
	BSoxUMdtYZTRE+DPQkEgBzBGKNeuHoYPTEgElRPI27+/aTdM4dZbGJoc5DKXw0m2eZ7aa4GjpRl1i
	NrLLCS1w==;
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPiWf-00000006MWa-43rR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 13:31:16 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aa6a618981eso712266666b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 05:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734960671; x=1735565471; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0E20nH4nI7hZl+zQi4Z91y7ffU07fB4nfSqv0rzeH8M=;
        b=WgMIVOApD5bsvbOmErWKJjvxwFUR0Ffikve5Dg+RAXKVTmfAOxPFEK7P2iaQvur1cC
         q46MeKiQuVZ2pnjmj5HxC0FFJpUP9SUlFDMy1q7p4norkx+hDlsZR58U0sloA4GL/uge
         hf48v9Z71j9m5/TQtr5Q+wPWJhuRYPcfktvtQx4fzTMYthYMsNqljqrnRtA8hC/gLdrl
         xdvsFp8wXfpNGJbDFA/u39MspQVE7FcSX4XGkY/JQRwDiVTvh7wSz5HBRvq9ZSc2jhX9
         xY+mPFC1qxw3Y+tIc3KNwBYSjZ+VfvEruAZ9GTZTI8SyINvKK9yCDhv/bi5YJzx7RP8M
         pQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734960671; x=1735565471;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0E20nH4nI7hZl+zQi4Z91y7ffU07fB4nfSqv0rzeH8M=;
        b=Ey1gMhj6wI6HEV/Gij9NaIAUggn3hTQOdHtW7ij4ZFzBs1rohARZVE+YRqmbyHYTYN
         arMeHsqEn0wLeXcFm3nFvkZP0odrVi8pE+l2My+p9WBQuKXT+ZK9owzn3OP4ddwSsSCT
         I1ui2r+5Y9g37ZgoodGI+WRwmABKUNtAFPSRuaTJ4hNqW08PtPhAxzSRWeCIH6SLLzye
         8FKkjWI9xGGQESTgw/8MnYLSvQeg6A51vteO8+w9hudN19Wyby9v8zEQGo8gUhv8alCl
         BlqEy221+i1VxqCAst5un89ImXq64r+1vT+z8byiYBuUzmnrJYBppPtRRTRY+xMB7m+e
         WoNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcwCYtN10UKk2wS3kEObo5E5+cO8bjIC2TFKdEivBNZdrIQb3AtWrgoZsApWx+VFfA5Aj8TDudVFvG0ALZvvaC@lists.infradead.org
X-Gm-Message-State: AOJu0YzouqkRStBWDIbN07dq/9j8jzNp49eazQa7ABMkRDQ4b/Ij4Uc+
	XVPjJ6pH5KApZ4IYlIhSUedYJ8UbVEwtLLmMRoe9Rs7dRnRev8AY
X-Gm-Gg: ASbGncsQUtMPqsYUfxoFwOuVssdKy1w8H0Uj0sLGeiEdEbQ8Y59Qh36P+lUrAkqGwhk
	x8imhAcEeZ+pr9a8yfKUT/cJV0CXS6LqUcmUEoyG8Xf0pm5arvXwbL9g64ohB9IzrgOhoTYEL+b
	CyyeFmWY2Bu2WHIXpi3dbzj/QHOtvVJQZXTJ8Sb+Ew6gee0hKI/gkflacHE7jJs2ReQLD3RT10C
	EQIBVlj5ljhfBCwUlKJBrOxq6UXjknuN1cJz7PZ4yNXWnyVpGmGGGQVYu00VafW7SPhI5myv14S
	ZDDy6wYy+LOzu5oujl3pkvitAg==
X-Google-Smtp-Source: AGHT+IFtl3Jc4R8ZM18OiD8T35sINFW2yCCL1hkjUfHrIzuM/MvcGihGAKcF6iZA6+Q/hgFepUAa8g==
X-Received: by 2002:a17:907:96a4:b0:aab:7507:7a94 with SMTP id a640c23a62f3a-aac2ad84badmr1228517466b.16.1734960670508;
        Mon, 23 Dec 2024 05:31:10 -0800 (PST)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-232.telecom.by. [46.53.210.232])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aac0e895502sm523749966b.63.2024.12.23.05.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 05:31:10 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v5 0/2] power: supply: max17042: cleanup and more features
Date: Mon, 23 Dec 2024 16:30:38 +0300
Message-Id: <20241223-b4-max17042-v5-0-e4e409723bce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP5laWcC/32OzQrCMBAGX6XkbCR/bRpPvod42CSbNmBbaSVUp
 O9uKghVweO3MDP7IBOOESdyKB5kxBSnOPR5lLuCuBb6Bmn0eRPBhOKc1dQq2sHMNVOCGsmq4HQ
 JAZBk4jpiiPPLdjrn3cbpNoz3lzzx9fr2mA9P4pRRg8IyjaVCXR2bDuJl74aOrJ4ktuznD0lkN
 rCyDhp4ZcF+s3LD8i9Wrl3rAD0oAeynq/50VWZr7SpvjJVe+i27LMsT2LeUIloBAAA=
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
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734960669; l=2342;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=o4Fom0Rpm9fWzhbvqugXg9BmbPqo3cs/0znTlLu54ck=;
 b=f8X4xAir/UsYai9B01gBdXs+JRfS4B/GpHsSQ6bQ+wpNPfRjetFZ6uLzwavBXVG0SW/VerEor
 87W4HwyJbVHB0I2ApwmvSY313JIzXsnoxdlHPVOGMYxp9vDxQqJ8SlI
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_133114_204771_64FC8C85 
X-CRM114-Status: GOOD (  10.16  )
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
Changes in v5:
- platform version: use parent device of_node as current device.
  This is because mfd driver matches fuel gauge node, and max17042
  platform variant is intended to match a mfd subdevice.
- fix platform version issues.
- Link to v4: https://lore.kernel.org/r/20241108-b4-max17042-v4-0-87c6d99b3d3d@gmail.com

Changes in v4:
- review fixes.
- Link to v3: https://lore.kernel.org/r/20241118-b4-max17042-v3-0-9bcaeda42a06@gmail.com

Changes in v3:
- pass dev pointer to probe
- Link to v2: https://lore.kernel.org/r/20241108-b4-max17042-v2-0-f058f7a16bab@gmail.com

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

 drivers/power/supply/max17042_battery.c | 200 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------
 1 file changed, 142 insertions(+), 58 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241108-b4-max17042-9306fc75afae

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


