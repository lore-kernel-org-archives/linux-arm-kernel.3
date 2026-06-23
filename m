Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4258ECDB466
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 00:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHsLQsrlZlU5oN+RlVxh1ifTEZ9ESp+ZM0jQZA3kndU=; b=wYUpG+HaTDpA9luL+K4m6TccH1
	LUs7hk3GzL3ziY41i6cCqKO4HXOOisrUPVUzfBP2bH6hcvd6wg46aKN4fOAdy2whq8YyCozT6wGmR
	MBR48AeLfXffa8BRWv41F069OJ5+jyDqanPTPZdQta6iIbua0tnGbCgKL17DdSSyTTnrRp//AuvAf
	gWjsQXQDBZAAN6K3YgbhEKyLNgU24fEx4czv4ykQfnjwsLAtU5v0SRniN8C/P5t884S+UL46TFElH
	qLd0ovfn7oKtA8bhOWjk3uvAli6GfWLAl+axkKuDF8IrHiu+RbWmyLHM8PRMMneFViM9WY4jScUHa
	ZOvLEmHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbpQn-00000005VOx-3aUc;
	Tue, 23 Jun 2026 00:56:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbpQm-00000005VN7-2qtq;
	Tue, 23 Jun 2026 00:56:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ACB76445B7;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6302AC2BCF5;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782176159;
	bh=NAQ2wPwIxNZQO7OtM7yBfMhOLpni9K/2uOT+0gTcdss=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q1vXSbLV6q9wVvZSjX2Z9NxO07sUskAJXSNt/6c+Ggu4SEZWOy8o0JwmS46aFXNms
	 GCvT58oPF/x2PA2uErBIajK2ZCEjnzRKnYNjCf4kSaBI7ToprbfaE+tZwBsDuvAtkQ
	 mKNSSrVFYhfaO7Gm4ofolbpLZDozWVB8ox/t0PKWNp9dRmxgWwBy3zPFovvDiJKeJL
	 VRNIXjO8ZeQmXO5tsfXe8Aia3CehURxcE2yXhFGPpT4Om7hwSYxj6dPAUG/eaTmj+B
	 E3NemT2eBlfMRk44/DVZ1R4fLOVDDi44Rq0jMfsjJ+sNQDTdc5kLHA3xiBdl4JBMMC
	 tmRhl36qKbB6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4A4CDB476;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Mon, 22 Jun 2026 20:54:24 -0400
Subject: [PATCH 3/8] arm64: dts: qcom: sm8450: Modify GPU operating points
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sm8450-qol-v1-3-37e2ee8df9da@proton.me>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
In-Reply-To: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782176157; l=1067;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=UC8G+Beo5Ny4qD1bWQkjh6S3TFmJKL1P3wTRFImBETw=;
 b=V0HqhO1u+vHE2WkQyZ8w53tz9nq5vyJwjoEMcNSnSh9lQeJePF45vUwQO1oEV5l9C03S56ym5
 yuN/x2btOijA7GTkYxTOpmiR7wyBg3PEFIHlzEQG2lD3ssBubBG0T7a
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
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
Reply-To: esteuwu@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Esteban Urrutia <esteuwu@proton.me>

These frecuencies don't exist in downstream device trees.
Both 220MHz and 285MHz belong to SM8475, and I'm not sure where 317MHz
came from.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index e34e3c05bf74..5e331a25e22a 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2495,21 +2495,6 @@ opp-350000000 {
 					opp-hz = /bits/ 64 <350000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 				};
-
-				opp-317000000 {
-					opp-hz = /bits/ 64 <317000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
-				};
-
-				opp-285000000 {
-					opp-hz = /bits/ 64 <285000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
-				};
-
-				opp-220000000 {
-					opp-hz = /bits/ 64 <220000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
-				};
 			};
 		};
 

-- 
2.54.0



