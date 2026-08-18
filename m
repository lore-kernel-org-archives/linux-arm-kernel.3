Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97910C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 15:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NwJoDPi4hp9ugtBRehcPe+nASgX9/mjinXvU+DSo5jU=; b=0Mo2CoXygfMhgoJkXeL7ObLTS6
	IzTb8u6pR6xy9CGRZjmN4ywTJmDEUj8NhxQpAKYL/1I+H45sIDosjkJ+NlFt0OOLqKNoiqbSqespP
	cfhSiruRTWxEfbVO69h05duYW8qP/yYyVgahcJ5tMsllO/x3ADktxRIibBWjy9WblFiHAs2CjTX4A
	qjSPgk0hoLxuKksY/SolBwrm64TW4XMHjmjuzxRIvVepBeZYAxPxuUMvNb2sui/6wn1U/z8uWQjle
	KGjHxmyS2T/jn00z7U0OWX3DLBlifO7E0RrJEu2an6yv/6EK6+YGLW2ig7LBZJfI8VH7KJxKVZHFW
	XGRAuSkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLzl-00000008I81-3wej;
	Tue, 18 Aug 2026 15:44:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLzl-00000008I7g-0J4I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 15:44:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 31B22601FB;
	Tue, 18 Aug 2026 15:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D677CC2BCF4;
	Tue, 18 Aug 2026 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787067895;
	bh=SYDB7RLaFGzmalX7pF7DTWHF88YLCh1NsTPKm0X9TIc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ePndhqFDR3r9o343oyFiXat5psrA8rZXRNGvTcFO3SFJIYPmBiGpZvQWoLMwaOuXj
	 2z5XS5v9lW/gJyXt3Vd3irq96X5GDrgqLYRRv7VE8moMxZLxdoC0WHFPYwuaSJ/zr7
	 o/A8yGEXeq5vAPzVl2BfBZaEaAoBEsYpC6O9DtKkq5maN+ogNlkJ/PA1oGqiZcGNb7
	 AFkC3huvcE0zQ6g1xTZMCovIlWidd2CKuNZWZRC7gJKCdyaJciNUhD27qzBYGFqYAR
	 2dJUz1C7q+rCgscNPfYJhqtb6IeTlEzUExSuqPI9CFvowFvYDE64RG5ZN6zWyEi5jZ
	 mTtYORuwYjJpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC334C5DF84;
	Tue, 18 Aug 2026 15:44:55 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Subject: [PATCH v2 0/2] watchdog: Add Exynos5515 watchdog timer support
Date: Tue, 18 Aug 2026 16:44:46 +0100
Message-Id: <20260818-for-next-lucky7-watchdog-v2-0-6743f479a47f@member.fsf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO59hGoC/3WNwQ6CMBAFf4X07JJuERFP/ofhQMsWqkJNWxBC+
 HcB49HjJO/NzMyTM+TZJZqZo8F4Y7sVxCFiqim7msBUKzPBxYmfMQVtHXQ0Bnj26jFl8C6Daip
 bQyKklilijhrZen850mbc1bfiy76Xd1Jh822Lxvhg3bS3B9x2v0z2PzMgcCjxmGScBJe5uLbUS
 nKx9jq2rmbFsiwfgl9QP9cAAAA=
X-Change-ID: 20260815-for-next-lucky7-watchdog-32bfb51191f1
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2085;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=SYDB7RLaFGzmalX7pF7DTWHF88YLCh1NsTPKm0X9TIc=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqhH311hQoKuTM7nwPpknEB9ihvqkuF3+VheZj+
 EsTV5PcqoqJAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoR99QAKCRBJJwGyxHrX
 6z4eD/9eXyKF0DJqetBo23B8WfRHUOBKB4+X7/hv19vm0RV3Dvuw1kY0Agg3ThxG74tfhK0mSNk
 xF5p9EjY4tZkNZkv9YFexrOkX6m0GHdPguYGy8A42Moiy5B9hqFhNZGa4ij9pzuicoeDwyEpcYB
 U1M95XmIFrYKgflyzWblxaEnT0SKe2EBmiql5iIfJz7zpEGxyZQX+knj+Kii7Dhj4N33/2dRxJM
 kghlIQOSPNQhEVh6D7ih6HJPbukUIrdLcYULHtH94c21KEWd+/yrF8hTyDZJNiRvKAJ5gtXezZX
 4DU4MSQePcUJ2CSdiOREQYVUqs/8ucOJmZnZQXb9Oxinvb9V20NK3wa0KkjppBcDvOkWd91uQgR
 coKf3zGywpKU73YGFHhupEo9i3Q1Y+46KlDxuSmh+MkdmB9lyDmIPwbobIy+AWAFcwApDAzdfnJ
 ge4B+huYqITBJ04HBsSed29GbjnMkiOdxDbyLN4aeXsVnJFBuKQ707WV+bThX8lauwf1w4L9NYZ
 3Mn8Q59y10QycOZjELmRptHSuDc7UkZNDZYvooUuVqbHZDhi1NKtLxWct3EQ6eYgzGAwJozM5+/
 API8bqVbCY9FHfTfD855/Crb1Uk/Mpth0eNTa/0PNk4oSRbPmA4eeehBiMRDVFXDLimSrLw9igR
 7oLGmtu/TUg8hlA==
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
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
Reply-To: aidenisik@member.fsf.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi there,

This patchset adds support for the Exynos5515 SoC's watchdog timer
to the S3C2410 watchdog timer driver.

There is one checkpatch warning for this patchset:

> -------------------------------------------------------------------------
> Commit 8f4ec3a9b89b ("watchdog: s3c2410_wdt: Add exynos5515-wdt compatibl
> -------------------------------------------------------------------------
> WARNING: Avoid unnecessary line continuations
> #26: FILE: drivers/watchdog/s3c2410_wdt.c:240:
> +       .quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \

Which seems to be erroneous: this line continuation is necessary
(and is done by every other existing entry).

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
Changes in v2:
- Add samsung,cluster-index: false to documentation
- Remove SoC comment from documentation
- Correct signed-off-by tag in commits
- Link to v1: https://patch.msgid.link/20260817-for-next-lucky7-watchdog-v1-0-a14370e20b92@member.fsf.org

To: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-watchdog@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org

---
Aiden Isik (2):
      dt-bindings: watchdog: samsung-wdt: Add exynos5515-wdt compatible
      watchdog: s3c2410_wdt: Add exynos5515-wdt compatible data

 .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 23 +++++++++++++++++++++-
 drivers/watchdog/s3c2410_wdt.c                     | 12 +++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)
---
base-commit: acde40ba506aae78633e080b5704d33cf4bc13c6
change-id: 20260815-for-next-lucky7-watchdog-32bfb51191f1

Best regards,
--  
Aiden Isik <aidenisik@member.fsf.org>



