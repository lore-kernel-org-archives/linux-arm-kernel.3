Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F0E10FC462
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 22:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1urMHvl86LGTs6UPiBGpCJU9Jz7+Yw2DljvPmeiQpgQ=; b=zT3VQyFTVCDCMwLrxiul1CKUsw
	sxCBAXsC0QyQS+JDWJAU0r7wGTBzA8rDWIR2tQrKqiycW/kA6IGk9zGYSi6iCh2WD/oWy8sDH4N7W
	SNp4SE0w31C5M4lF2wGhVHLkF59lLcJVpSuBANW2AEgEZfE/qCbYPSq3ohiXeJejlNImOy54rf3Cx
	FANcXAiano7tvpdM2wQJJnQx1Su6zA+M6wiH3dgwTQVhN9Fdhkfq3/jnzNtkkVjulX6ZUpZ8yTuif
	pw8PK4kuWvXkaDLzzL80OvbNAeWoRuHrpH768peXLGcoBmWWymZYCZxj6DQD3jtAQZeojfwBILKuV
	eWfSyTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAbBm-00000009TEI-2PwL;
	Wed, 08 Apr 2026 22:15:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAbBh-00000009T9x-2WkO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 22:15:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A0604454B;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEF17C2BCC7;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775686551;
	bh=ZLkarQW8/Az8rauhmR2HAn+rZrJRg5Nvg4DuBB8fGyg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R4RCEQfRBQG3Jocz4jTbcIGP9WAfz5heuJgd5C57LX/dV9t0iZy5YJYZ+BHNnLNjI
	 vtOd7CmFnNBpRMtw6yaMZsRZZhqoFmO6I/UC9PKvwQGk93F3p5sHoBikw8puZ86dN8
	 SeB5c3LhesPxoN1XhJGPaeJke6UnMvO8c5HzKo6m3usZk6T2925Ox7+GALpn8JFp0j
	 qqG2Z2MVBfS5wyv6V+gVdZ2bVvtjqms1uZGMqIDx5/1nH+VwUdC69UiXUKeUVwcoWk
	 wk2fuITpB4+77KqAYxUhrgfN375O7Zw9uYkeoIUUX40gSj9vFdkRXtb1d2mLUEGNK/
	 bCOjZ4n0Zadzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E567A10FC456;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 09 Apr 2026 00:15:49 +0200
Subject: [PATCH v4 06/11] Input: stmfts - use client to make future code
 cleaner
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-stmfts5-v4-6-64fe62027db5@ixit.cz>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
In-Reply-To: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
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
 bh=b/jklM1zbCQq0LgFU9O2NrDUidLzNIiCSesKs846UrE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1tOSX/8wXIcBMj7wQU9sHsMyexCIa9bif82F+
 jn4O1E6y7uJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadbTkgAKCRBgAj/E00kg
 cqcjEACw7KJL1B4IeGb5Y5BLhFGgrkasV9+ayx/oBWguyFHfkrIFB+xMFBltOu2p09IDBo1J4+p
 4qTRCWcb6YWbnDCLB9ROTbkJHB6FqnyqD0qHhzhCj6oe6bBX8VtwihwshYUqCMOiqYTPTfyZdYA
 zSPIchO03UcluHlUbSNzns5DBC8wz7OuPjcumDzo4Ookxf5SkDVFbL1jOsWIQaf9EV8NDTp0kYv
 Qd8zrfrmVJyd7TGsfqwYgEreMlu829h7AQSzyXM01kObdBqce32QrmXVCZvDMjTIXxkjy1YbmAJ
 gkWpCMn40rVe07LKoU1qu/Eur0SmHWQhrUqYTQP0NeUH9PpeQTOn7QqiY6cA2gGkzLLnt2KjDr3
 xlghMrox8RCtiMLMLcRJnJ26jJoDdxG+Omr8AE22F4bzHTUGQhZbBR/etFEzUAKKxXAxIu4By1X
 iReyQ06qNMqe2ZarSxS8YemKaFQa+TJ4kfHhjx/3k0v213zjyLkoRRBZxBy09lgIqJDCf9HsOpe
 fMArxmvZS0rqEKK82VhfTkuPnAPzTPV7FVjxCijX6gsJnS/DFfaqcIXXGWdnGAYnjby7VipMIz/
 lPcTzlVlCUbfVXC6WuirJsGcmE5Q+6v5jMgd1eq3D/gIEjipqbxu6SHj47+2DJ5T7zDrBW6FHh0
 a4CNzCUEFCnoVyQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_151553_716297_AC5C52E3 
X-CRM114-Status: GOOD (  10.62  )
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
index 290511dd69437..b61a19e954296 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -769,9 +769,10 @@ static int stmfts_runtime_suspend(struct device *dev)
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
2.53.0



