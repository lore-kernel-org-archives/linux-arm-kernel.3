Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB96C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ChcZ0EJVZcAgPOJD5XzR+ozVSepyZd1X7jlwl0J79K8=; b=icBPq3RqRDRVo6ZZ+vzq3XKYnx
	HDs2M1mmJVeWjWD7vQxiCuloVxSFFUpVh9BV7T77KDaAs93jcRPLHZh9ShtwXr9DZfP/PXBhhHtVd
	G8LpZV5GwfcfTGmC63lY4nvg2ySTf1OupDcXzYVOmaXzy+3uB2chSH0KYINZNz8QFobjYc4YHWkIF
	S5z0aKGDqA8ZDt1/FAAOMF1RfDU/sS2DhINqEC00UgJPUnMGjthtDBJhcwYQAvKQYF6zF+f0RBYZ4
	VgoSl4CDHaKb52/DIog5/yuDahGa7MK3chw/MyMWYlG5wjlNBTZoedfUnTOdNCChbYqipgcgaVak/
	7cLLKckA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVfV-00000003fBS-0TvP;
	Thu, 27 Aug 2026 08:41:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVfD-00000003exi-3I3c;
	Thu, 27 Aug 2026 08:40:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E63E7600DC;
	Thu, 27 Aug 2026 08:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FDF5C2BCF5;
	Thu, 27 Aug 2026 08:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787820046;
	bh=ktpLGSlyRRlqw7auNzLNwbOhfx3Zng7gvl3lK1CmWIs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uu8HYdP25xXPbklmeM3pK4dVsPQ19o/IoBEr0duItu2sswyx0nl97Z3Whr/25Ecgq
	 +/8HBLIf1I6CbQyrDmIuT2IAGhb/B28gqkYOJdoOs3N/kfGwIJ/l6F9NrYd5IpbPkY
	 oAJYjtRIuKCDJW3tHaPoH6ZcyzQGGty2ENJTMlAjnLao+HG/5e9pM09M2BjnUhgQiR
	 //wuDLD/4VJwykwyCR7fB+ToR0lX+DBXSYJmGkRSrTdDjva6gCam2axew2XFsg96O4
	 IUFA0XhewnJiUyD/17P9eZqKupz/Rh6UyzZrqNDsUfcZcMRJ1MRkKXV24I9uaVadac
	 gELTgNlGbtdLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7DDC61DB9;
	Thu, 27 Aug 2026 08:40:46 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v4 0/4] Add PWM support Amlogic S7 S7D S6
Date: Thu, 27 Aug 2026 08:40:09 +0000
Message-Id: <20260827-s6-s7-pwm-v4-0-d28a2015177d@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOn3j2oC/2XM3w6CIBiH4VtpHEfDD/ljR91H60AQlC3FQaOa8
 95Dt6atwx98zzuhaIIzEZ0PEwomuej8kEd5PCDd1UNrsGvyRkCAEwoMR46jwOOzxyALzqSSUlC
 O8v0YjHWvtXW95d25+PDhvaZTsbx+K3xXSQUmmAsDVoCqpNKXur/71umT9j1aOgk2WxLYW1gsE
 402+adi/N/SzTIo9pZmy4QiglpVW2N/7TzPH5JA1UscAQAA
X-Change-ID: 20260325-s6-s7-pwm-281658b88736
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Junyi Zhao <junyi.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787820043; l=1421;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=ktpLGSlyRRlqw7auNzLNwbOhfx3Zng7gvl3lK1CmWIs=;
 b=1mluRuPLujAiR3pYWMwR9d/nxY/Xl2i8+db1I3eTojXLA+UvV9RemLT0/znYBS+HpudSEpHsx
 8m2SQN7OUFBA8QSNObT2Q2Cease9XiDpI6K5sA8P4vVgg3LKrZBzQas
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add bindings and driver support Amlogic S7/S7D/S6 SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v4:
- It is divided into three submissions based on the function-driven part.
- Merge and modify functions for init clocks, According to Alexandre's suggestion.
- Link to v3: https://lore.kernel.org/r/20260521-s6-s7-pwm-v3-0-57b073fbafef@amlogic.com

Changes in v3:
- Use npwm instead of single_pwm in priv_data and format adjustments.
- Link to v2: https://lore.kernel.org/r/20260402-s6-s7-pwm-v2-0-657dce040956@amlogic.com

Changes in v2:
- Simpler s7 clock desc, and drop the example in bindings.
- Make minor changes to probe based on Martin's suggestion.
- Link to v1: https://lore.kernel.org/r/20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com

---
Junyi Zhao (1):
      dt-bindings: pwm: amlogic: Add new bindings for S6 S7 S7D

Xianwei Zhao (3):
      pwm: meson: add the PWM count driver data
      pwm: meson: use bulk API for per-channel clocks
      pwm: meson: Add support for Amlogic S7

 .../devicetree/bindings/pwm/pwm-amlogic.yaml       | 19 ++++++
 drivers/pwm/pwm-meson.c                            | 73 +++++++++++++---------
 2 files changed, 63 insertions(+), 29 deletions(-)
---
base-commit: b1385d0c7b7c633e55adcf4a7c1ef46c43a84a4a
change-id: 20260325-s6-s7-pwm-281658b88736

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



