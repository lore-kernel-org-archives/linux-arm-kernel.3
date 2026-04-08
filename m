Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90D610FC463
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 22:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOckUoz3D/kwaLSDr6qOT8erm9cqqrIc/LOah0sYQNs=; b=j8BANW0WdyrMABl0wlYkUmbBcj
	RrLc2JC6BlH0vTEnvUDgeDj61b52xRhHkpwq71O/ABYUWvmwnsNmSKAYJjX6Z2olW1LilCTo7HUq1
	WUbJj86BREwUpQEI9Ts+4Qd2l07rWztzBPb5TtimYmv5fMy6xIRBofxX57QyZwqs7I1Xj/pjT1hz1
	hNWh2S+dnqI2SIhFpeym8uufxR4gMoUCytvmFED1DKU0zojcEaW//f4JgXyV2kM2tcZQKH0O+vN8B
	0uZ7d95Ynqy8MA05piRAsBjniVhhbKV/whQegnRwF41S67lnX+7EkPH0jL6lSzK/m0mbggt+Maonj
	I+zm4h7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAbBm-00000009TEY-3o2C;
	Wed, 08 Apr 2026 22:15:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAbBh-00000009T9y-2lqQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 22:15:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4618544563;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09F50C19424;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775686551;
	bh=mWau+z9gzfl+tuHR+lGcgDHqPCc2l27GPvMVfJPudmg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OvVPmU0sOx9UheEeMlhva0qkdxI4ZiTjaSG9XNByx3cr3yZnZLrqyCRbnsWH6EM1q
	 Iv8iT7gfPpVFZVAsKRv3d6SoXRQAcvjQiLeD/867RNqUhf6L6QORbflBqA7WOZwyJN
	 vCXjAlQvr53AfqjM4VV2x6Exh5DO+EjW9nuBra/kcM6DjGD2IE5+L+n6qTMR4gs5qj
	 IKgwDQKTJETdOb4HsjEFLbmUIK8G0Lnag+fi8qMdnTFNQraE/1SQmOqb1TzBoDl+GV
	 ZaikM9VNne7gjBsu+f6bbg0OIhrJmecEB/pkneJ5Eu2Dz5wK8/jrXFSq+/Nbyb04pf
	 2F4vtKJM7N9uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0107810FC45C;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 09 Apr 2026 00:15:50 +0200
Subject: [PATCH v4 07/11] dt-bindings: input: touchscreen: st,stmfts:
 Introduce reset GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-stmfts5-v4-7-64fe62027db5@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=774; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=B9kCQKy2FHl0reom6sgNtirncPHLOm+2NoyBOxtDRYc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1tOSJUHdlj3O0LPhM1jaiJv/ALPX+SD6InEhO
 o/IffCvj2GJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadbTkgAKCRBgAj/E00kg
 csyXD/9/mTo3zD8m6fYZQtO0bvVO2xJ+E9/paboBT2bTq30RkJAtPxJMH+l5LwJAAMOz+RlfBDs
 a9GEsQj0fEeU33q4F7tDgH2l1jX7wvOzes41WGBRRTThMvbrpq5/UfNcqGtoHrLG5pQQ85keYID
 YtbgeV1EyDkV6h6oGWHNduo2e7IOsX8PMjXcgkWGniJTjeuMM/t1VlBsb02WDj5vCnnBnzLJzWk
 Q2YO4Jr024nHqEQ8OeRXu4RZrrbGLyzHvMK+6Zaz06VndUFlKelFCb0H2nxBJr38simrrDsn+AZ
 TduQwSLEtpXvnGmLr35o112ZfG45NyHteCGGvmrVnEfWdOJZk+3J8DTnJaaYMWhAiU37NfflkhR
 Bdbwxt2jwx0twBZ15uVW9C8tDJM39mDXiEEWjXOB+31qJ5LJ9bRSI5dEaPalnfk+qJvAiojLPQa
 rQJkoysMbAyJqiYgJaOkFoHG6K3eFSkla9+K1DC+JQSkQnqGl20Xc9CgPFJbioU8lNfm2nFsmYO
 RTLoXFzxS9S83/AYR22zQI1GjnTsqslGGVzzSv0Ybe4MMOFIKkqZMcR6HpkFQv4TuGbE8jAt01/
 HKdGaSAZrw8vEyoMRqcSW2wQyt9k2Lnyn+F+fvFGV6Rn+cHhfGmng6sbgVbXrUsyG7/oAOYLOd2
 AatmeUfB27sCQyg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_151553_757934_E0EE91EB 
X-CRM114-Status: UNSURE (   8.25  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

FTS has associated reset GPIO, document it.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
index 12256ae7df90d..64c4f24ea3dd0 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
@@ -40,6 +40,10 @@ properties:
   vdd-supply:
     description: Power supply
 
+  reset-gpios:
+    description: Reset GPIO (active-low)
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.53.0



