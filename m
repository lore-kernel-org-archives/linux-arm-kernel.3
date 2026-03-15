Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE67F30283
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 18:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3JGKG/QjG3y2EozNwUJybL3IiOxbikBhjpgBeFmt2A=; b=pX3j/pgC7r9nhtXu6o0FcsCqYG
	ekfxemqHlih5lZZIsAHq2zpXFuooZ2GIQEBTSO7/LUoPZBe60Nu6qx7fA00ziRo8SiRHkZUyTme/a
	I/syCVWlpN/a1qZeGMPDIJuWGYRgyp5A4zcIh9YHG+cYpWr0WGLemg0snDV0gNQrU+AM0d6p4axc/
	JvQwkG3AbnVIdxJjSoqSFmWIubGN7nLiCo+0VA1nIZ/VC+gT8YZVRKISiugKsyXSc9rE/GZzyT7Ye
	SNBaEbKgPoXlWlJy8kT+/XcShavajSdeYwiy8KxbfKTzNcJPUirCXkbUwLzI5bdtg5rYhg3mf5HfU
	IictIIsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qaK-00000002pPT-2Jpl;
	Sun, 15 Mar 2026 18:53:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qa6-00000002pGt-3AhM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 18:52:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C85343FC1;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56A36C2BCB0;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600773;
	bh=gra4pj1Pq/mWhGDEdvUlRiEZduuSA9cXp8GcAdn9E3U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ONygmPcn+ER7Jye9kx8Xo6tcsuP9eVl4SGYJoaXbhaAo+QczxjzRqF8it7wNtcgmG
	 7Ij/qT6vHuW7TjuLmKKYhhClAOAuV6m0Mt1+sD3BeDlERqNHutNyFSNtJEolzPb2/u
	 QtpQlCXnFN3BWMHtyty76XBzXLI++VDbuM1O9d7ke5XlvdkroJRzTpZ4DKbPtnbt8g
	 J1N03axDDHWm24QDJ3ZSMWR9FbeM+buO2hFsWxTI7w8CGlGJc4UQknJBzyeC5DV5zj
	 rNRt4TEV7mSxz7x+nFBMDzQJclH5aFp2GHUs29lDnnDY4v+uMJvvhTKcW8HKCalFP/
	 d6X42eS0+c7Yw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D362F30281;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 19:52:42 +0100
Subject: [PATCH WIP v2 06/11] Input: stmfts - use client to make future
 code cleaner
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-stmfts5-v2-6-70bc83ee9591@ixit.cz>
References: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
In-Reply-To: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
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
 bh=NjXdWrTyZ4AOoAMN8FANgtl5sLWDEzgbOr47MG8j63A=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBptv/5qkGhTYBwGm6+n5LMbiGmaXgdSYsz1eYSE
 Ggl5zzA+sqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+QAKCRBgAj/E00kg
 ci4wD/9H+6EPZMql8Si2W9hkziJlAifuPuI48m3hQ6EaoLCn1JV/ScaxW4RY95HrYgT28xyfwKl
 JUqdOBiTgQJQdSV2Dsc0FyMTr06BnXnMYTQaXZ+Q4ZGsfuerdylxbJ19YOLA/3JMjw1CfJdsHy7
 /mK8gdJDc3oPr+6kyde3hk5afi90oYN8LTNdDcf2ldPgGAKhnOfHOtbXfQzuU+reSNEe0M8qClf
 dXe4eRsyFdpZeoiZsBSRrYaSR7QkCc+lFWoUJNNjHbJIrxkDH5EU30XWIN8j4PYz576GAbE3aWc
 wJNq3ZheYbryH7Eq+riMQqPtyefk1ns/ERBv09JZOSYz0crh/9URS4rwy8dVoIQDLn4nHivzWFb
 +cKwYH3O48NlBfCY9M/KxUmAGMPPN5yAnQr5ze3MdcywvDhkwClk6tmm9NoeihwxlcnxK4MmwdB
 h61mx+2tFkpQy1rimaDTLFFTCWfiSGxAaxBHUeKAyNRIGaD/B+4Mjw9kDh76eRPcgdOrdpJShUI
 9DJPtL5wbAg4Ecux3t1yqYBsAtU0BshwV0lgKNBOCtpZ0OoQYnDATMj5tb3dt3h0+KH30rTChxG
 YbaAN/GXoD1VtHqI+wpMurzeVO9v2OGEeYVsjjArog1FM7WYvpZISJ44Ok1fng1PV2pT3hJ3aCb
 duIgAnQjAEzvirA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_115254_865753_2CFDDFE7 
X-CRM114-Status: GOOD (  10.40  )
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
index bf176907177d0..4dfaf3a6077d9 100644
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
2.53.0



