Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A44FD0075
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 17:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=froYo6+zwIftqgkBDlS7mv4zHGuddorW/VFrt5PAKV0=; b=mBevrkfp3twPN40EP7xAbCBK2H
	9oTpSSg7ZYtAlhD9/TxtXeAGmXGaIQlOe+Qih0K6OZWz57VLhjA1+QkNFiWoxb8un1E7KTDAqVLYt
	xup2GcgEOz4qHkVVJ83bf1KGlVhv/pm5+opVHQ+YTNW/sC0XzVNcOu0RsKE63uDSrlTXAUG8EX/P/
	2u0rX9TtVgUdq8cVOVpISBh73Cv7kwZksOpF99EZOFLPu3LNYMXd0JD3fQLfvnYkOnB1IJpwZd49P
	mcV0GtNIyXVIJtSUUmKipk1rCXdEowCtuQTVFTW9I1hRomdqyzxSHb01ulN+drq2+BzqeEJeWkXWT
	R81mx6AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkwu-0000000Bjt5-35Jn;
	Sun, 01 Mar 2026 17:51:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkwr-0000000BjoV-1KKj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 17:51:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DEF3344594;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B48CEC2BCB1;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772387479;
	bh=yXe1hSSdOtlyyzWGYAthZ15x+5EOdyI3Idom8hqgEB4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NBGSLn4Xu470ya2zenyjd62hwTHGHQZZxK9fhLkc7/xFzJWGY3TCd3zJ3U9mgBNSH
	 4thzI6vZlrCQd8QQCAMlz6Gjj5lkmMVKWfkESmEHTlHe92qHbGPc8KeejaKfvpArad
	 yyEqvlKC7Wmwl1pfGB3LkY/qSHTc7ctGivhGTqCepALLvkVb0qAOUFbMdNBYuRwWZi
	 Meb31ItmazvuU+cRoLHj6YBR0Dgz5z7oDuzzoLevLVUbhYUHbnGAA2csa7j6mgwCGq
	 Zl4lPPYru6xYTdDhliViWe1aS3ldImByTNrpnmPVuoFGYF+RwR/TguiW9XdfEwasfz
	 DqXlWWhp1gN6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECF3FD0076;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 18:51:20 +0100
Subject: [PATCH 06/10] dt-bindings: input: touchscreen: st,stmfts:
 Introduce reset GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-stmfts5-v1-6-22c458b9ac68@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=779; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=uZFVfrrOjw9/Zf+PjQe4vJuLBGGgUOJaBtRtnZBDj/E=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppHyVjFgb3i+M6jMlXlM5TIrAbsCQX8E1F3tW4
 LGiF70vpT+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaR8lQAKCRBgAj/E00kg
 cgHiD/0X/wHMPyxoaYtkjW4WcPvXUC08KdGlHTZKNyGoRqvDGSy8aiu2vev+LCPIk+LHsTW/Nri
 OO3T8Az2mcmKmZxF9MoBaLKMOU90J8WpI5zSt8tcb7x2BfoIhHD3ovLKWuXU5KDoTFwujc04tHs
 z7ky5WmzaSZVaBvZ5JyGtD1qqYkVeL8QrnlgeY96B98DsymS5UBCPyql8vYlfI1hndGzI+83wwP
 VTbJaqb5gNbkvdieepGW8ic3cBCrjjaBj8MzX0MwtyAX79Oq2ZwjQ/0OPZ0zSzO6eRktELfF7ay
 7AbX+lXzJ5cBsoGO6laAuOJVP5tz2vC0FyRC3vw69byINXZ8sMQ7FFhRGYefrYxoJOh1PDd6+KA
 Q+ijRhnrlg1G6BVpDPxthLSlQ1nzIyy6U4EzAODMMPZq77zeF5Zb2faqB/3wVilA1nQf0NdyGhn
 fpsx3Hftb9aHn+E4HCj4W1G9oVdAf/1tkHKF6DOvy6CXtfhiBGBFbbV5BFyNEy1mbsiElGuRf1d
 Q/WRSlwQ3rk97JWFdR+Nd4GgRhouRMzK+zCtFBdQ5HuX9sQGUVY7R9NM9XrdBR3ktQrddgLFM6O
 CNZUSAvtZAXsKPugwymImVkyTTQZdjW/d6ck7x+j6KP/E3EqNWT1tQiD+3HKkDqsYXm+TwkHSco
 uhZ4cQlRs8Ssvkg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_095121_428622_6AF04251 
X-CRM114-Status: UNSURE (   8.54  )
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

FTS may have associated reset GPIO, document it.

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
2.51.0



