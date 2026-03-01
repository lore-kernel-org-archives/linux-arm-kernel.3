Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237C6FD0073
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 17:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+VIdTELDAhCdkQkXMFXMLIwu6LgqSdRe8qjS0wB2nI=; b=MTSlHq38IwXhd5TcEzI46W5ZCz
	2AVPMh7vlUXO+wUnW7/evOX9/NbVsznj9CWxwTnAj5yEN5hme4hT5O67BtwetD9NwzchH65IfdnWD
	6maKArCFr8+0NRylzh85kxbu/V5MoV+vPp4mPN2Ko22zvR5JgWdmdNISbomiws+iJDFBtK3KtspLG
	GlztlEFgLXm4fm1azEaFnWUkq8m0xyQscZ0/Wdg8GycPxBwVWm9s8j86NLJ/wfvYp/Gs7qqSZE5bI
	ZTEbniSqMhnvNeIozlqbGpY5MpawnxJDy36kdCBjm8sPVmVx8mZacjHlAmAVZacimEH5kUg+9qSvC
	29T1kIbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkwx-0000000BjuU-05wn;
	Sun, 01 Mar 2026 17:51:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkwr-0000000BjoT-1JFz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 17:51:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B768544575;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 960F7C2BCB9;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772387479;
	bh=EEDR+B/u70Hi5MKRcWvqfizpDa9OzsP0bN0/LeEmdjw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NpCIwspCDQBcXxr2XaO6mLILh5eR6xrpmzKPx767QEnDzCj867iwTG7i4g75fIwbD
	 d5UOKnvJ8Bqc22BTBl1iSUPDNHOyM/l3CX767lP4S4mKktj3RPWkOSpIyuEmp3qrdz
	 sqROVfUvBUXgVotAvlPuUYQ6LjQRSLg0QforfZkr8zVTCKp0YocY01KDLNzESHqTcQ
	 EDE2yHqhZwwCA0Fsrz+T5UB0tyR11WPRRnpVJTeVB8k4ucmLgYEinbJt/kmnWzKsfU
	 StcM9QWIUKtzX2/f5ui8rBbxy/yCaV4uDS5KSTorumARIXrK1D/3WFLu2lWhepsbhC
	 ut+tGyXzsEA1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAF0FD0075;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 18:51:19 +0100
Subject: [PATCH 05/10] Input: stmfts - use client to make future code
 cleaner
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-stmfts5-v1-5-22c458b9ac68@ixit.cz>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
In-Reply-To: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=999; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=J6AT4NhPh73qOCpvlr3elkk31hc657GgBpzGKxirckY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppHyUhUCNk886i9UHnFeU9WfswQgQdF4RB0CFY
 hE1WxDMyVSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaR8lAAKCRBgAj/E00kg
 cv3hEADLtufWl141f1f1h14sRKMAUQ/PoEqhqbwRFbpVBK0+19MxXs+qgfz3O2zFaj2jijCLVtW
 ZuPmjvRGgQ/fZr3VS5JKnRSuWVxqrIWc7uYf0WO3UDw6VVzaTGkrJ5fdNPbHZAIH0jzaaDQAnfy
 z1stmZk9RWS0BVPkaz9C55qxwBVdATfJTb7+87BmRFJixu1WJeK/JWDgc+XrwOxtpFI3hQKSrH3
 oPNlm7ns/UbaS1gryeiXLSaXHl93B6IGwgDOouIJ7MHTIguincDwKfwoPOfekXpt0OUhyu5o9Tp
 JhD9BzftvNYOsZp4wfG0yngoJO2FWuROEF+aEqllVpgOar3RnbOkNOWImVHMWPLKRxLaj8uqYrK
 wfpier9Akmd0orG5s1TeqBhU7t1tqmChv2kOsXXgoYAKoMJU6/mUAZLISuDOa5p92//0j7MKDXs
 ADXPvTgxdunq9J/WL/tijtxwDfpDSvyoTxXsHMOvYuifChd+ZfnriG+xTQP+8iTpiNLSrHccI6y
 6pYEzSqcEWmGNjlEOad/2yS9DWnT/YRHAvMnlacgIjv6CJJou2PHt70CjY7xc2rPuA+ts/VBUNT
 lxrA/GIhYjS3Ufckok889Myqg6VupZ57VWysTrDxEKyfjgESgD/Hs/sKzQmNEUb4I3XIK2gEVRx
 FvYqik3DCVMk6OA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_095121_432877_F65E14B4 
X-CRM114-Status: GOOD (  10.69  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Petr Hodina <petr.hodina@protonmail.com>

Make code cleaner, compiler will optimize it away anyway.

Preparation for FTM5 support, where more steps are needed.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index f4e5f1b3ce796..9dedccbb183ed 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -764,9 +764,10 @@ static int stmfts_runtime_suspend(struct device *dev)
 static int stmfts_runtime_resume(struct device *dev)
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
+	struct i2c_client *client = sdata->client;
 	int ret;
 
-	ret = i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_OUT);
+	ret = i2c_smbus_write_byte(client, STMFTS_SLEEP_OUT);
 	if (ret)
 		dev_err(dev, "failed to resume device: %d\n", ret);
 

-- 
2.51.0



