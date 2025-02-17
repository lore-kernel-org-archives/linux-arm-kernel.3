Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3ECC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 20:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gCnfasuUl25yYqoVT9LOn0958cgrOos5fp4sXBtSCps=; b=utU9g516IHjJ+x
	5OmA9kxiQf6lge4z5beccXdHcQGCfl1VMvtfAeFy2QsN8ZmnOYvoHuw5yUUk7wn5NqJPsci5hF3kI
	6EdmZR/g7Diqt+31iqPPa1x7Sb8ua6qtsbKDToSf4qIG23BgFxNg2Xwmzak2o+fVtqkVBtj+mNce1
	W3kfEAvfvVqVXHCzpsa0+dEwm6hiJmCRVnkzYrC1q+XOvZo/7OlY4BNvDWoAssAckLnV3ar7MXMPL
	NSvLyMm1MsXPM0ZFejRzNLMYV5y6xS/oAU7gX43SBaKvr/NcKjFWL+XD8wnPA4KJrjod9nJIw2h9v
	VifaE8CMuFlmkwJmhvVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7KX-00000005pjs-2jwH;
	Mon, 17 Feb 2025 20:03:01 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7GY-00000005ofB-0H5U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 19:58:55 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=wswrQ0W15EsNXofBkD/a7weqF4ypSd3Pq9sQUTYE3UhDhTNId8BI2QZ63UqNdWuYEiMrlgKbeawNowwSEQREa/LFQ670/D0zjQIgas96uaMPxvXPQUrgq5DhO61O+0crTkziFGXNZmmwMHkkpclelgZfVaLZryizpMmboPyZP6k1lOpmdLH+oR2iCY4SRlfC5RdBLP33URQWbjpRFpLfcAn6yqxp19cD7mJR0Z0k8ksNCZgxuxQ0bNDukCk5svuhbJkYq+NxGWPKERehUodh0+oK0F0TilResz/4wMGioAfnZYevy65W7TlM9w/dd8uRqicyF4NNma0xNzDeZj7GLA==; s=purelymail3; d=purelymail.com; v=1; bh=2azF0+jA5HmB//VJzs+kgEZuuyVQ9RBu08lOIfwuSOU=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 234657940;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 17 Feb 2025 19:58:16 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v2 0/2] watchdog: Exynos990 WDT enablement
Date: Mon, 17 Feb 2025 20:57:37 +0100
Message-Id: <20250217-exynos990-wdt-v2-0-3eb4fbc113f4@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALGUs2cC/3XMQQqDMBCF4avIrJsyCU3LdNV7iIuoow5oUhKxi
 nj3pu67/B+8b4fEUTjBs9gh8iJJgs9hLgU0g/M9K2lzg0Fj0eiH4nXzIRGh+rSzQiaNyI3tiCB
 /3pE7WU+vrHIPkuYQt5Nf9G/9Jy1aoaL6Rm1njb3X+JrYz24ct+Q8T078KJ5juobYQ3UcxxdjI
 GGWuwAAAA==
X-Change-ID: 20250217-exynos990-wdt-0e9100ec5f99
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739822294; l=1058;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=2azF0+jA5HmB//VJzs+kgEZuuyVQ9RBu08lOIfwuSOU=;
 b=bPAzZrijVSBL2oVtt27dGqMGNZwzy1RtTjDOwJ67eR0lOkYgzT2PxTEBA7QwDQONaga1/KadI
 zRzPxaN846oDSxaReqgD106G9nJ1VWb+Wt7vw0V9O0Nxufy2ZaKW4HW
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_115854_179739_0FD5BF86 
X-CRM114-Status: UNSURE (   7.77  )
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

Hi all!
This series enables the two clusters of the Exynos990 watchdog timer
to be used. Weirdly enough, this SoC is missing the cl1 cluster, it has
the cl0 cluster and then jumps over to cl2. As such, new cluster index
code has been added to accomodate this oddity.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Changes in v2:
- bindings: Fix cluster-index limiting
- Link to v1: https://lore.kernel.org/r/20250217-exynos990-wdt-v1-0-9b49df5256b0@mentallysanemainliners.org

---
Igor Belwon (2):
      dt-bindings: watchdog: samsung-wdt: Add exynos990-wdt compatible
      watchdog: s3c2410_wdt: Add exynos990-wdt compatible data

 .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 11 +++---
 drivers/watchdog/s3c2410_wdt.c                     | 39 +++++++++++++++++++++-
 2 files changed, 45 insertions(+), 5 deletions(-)
---
base-commit: 253c82b3a2cec22bf9db65645f934fbe095899a3
change-id: 20250217-exynos990-wdt-0e9100ec5f99

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


