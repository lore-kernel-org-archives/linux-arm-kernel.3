Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7B5F30282
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 18:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOckUoz3D/kwaLSDr6qOT8erm9cqqrIc/LOah0sYQNs=; b=ctDxcNsLHC7vjlE0arUlWRg3Lt
	4shW8/Zk/f05586ntCU0nL9ZERqBinQTSxahYjF+urBuX5qc81/9UFt1Elhl+3Pr6osVDglnK+VVZ
	/S/1DYpFd6gNekPjBQHgj/t3u0up/z/Kq/eorAP09bEeWtdGiyBAWseAnBkH47d7xVMqtD6nDrYcS
	9MuavbyFWaJrj8L58BUHIy9JGyYCm6iqSlS9RC7EqmeQlz15Eb8Pqqk/QN6DSTNbV5PaI9tlXWtDy
	a9vMyTb+LmLgMY/GjXblqT6On9G1jJPxynXTZBLx2TMAxAo5OTSDGxrYCmoj7QplJ2eRnjEKNt7Cj
	ZkOp405g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qaL-00000002pQ5-083v;
	Sun, 15 Mar 2026 18:53:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qa7-00000002pGv-02nq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 18:52:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91D5E44561;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69180C4CEF7;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600773;
	bh=mWau+z9gzfl+tuHR+lGcgDHqPCc2l27GPvMVfJPudmg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J+C6b14D1Z3IAY/ppctcf+zNpbkuFiZu3u6RdPlJGUHgLLDWIUCHYgI61FhkgxwE8
	 y3iuT/mPJ6fHjUwbQh1TgYSJ9eqZaIP7cn5/eUyJk7inRJzODUtVggfWyZghOi6AGr
	 SmqL/nEClcnDWnyy8tMRzhyBgy6g1OASGUG0VasUc1QvKiYa8rUEUyY3/KOfExOPgU
	 arDVifGSshCXMsID9sfO8EE+8A/sJIePSsjLK5AntOEmxKpX8wg5qssmWQMN5eXyWy
	 EiS6roiUxiOrQ7pk0+cwvFNZPmz/o1KS2hlDm9JeLL9k0R3AmT3IImyfKIe9nYf7LO
	 S34ObahG3mp8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE9EF3027F;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 19:52:43 +0100
Subject: [PATCH WIP v2 07/11] dt-bindings: input: touchscreen: st,stmfts:
 Introduce reset GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-stmfts5-v2-7-70bc83ee9591@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=774; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=B9kCQKy2FHl0reom6sgNtirncPHLOm+2NoyBOxtDRYc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBptv/5Hr4nIhYBYqKW3kJsb59+rMkofVULsqvjf
 LU/5n/61pOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+QAKCRBgAj/E00kg
 ckS4EAC+Ji6pS/DWWfmBRQx00NgDnq8aSy4O9EO1aNKr9j6j4LGWZz0EV/y28xtEpYkh+19vigC
 gUa4/Uj8aTUL2sgZkqFdCxIh1Pb7UWz2W8p7Mwth1uya/z4Fv/yXmqYHNSyA9NHatV/+v7g8KdP
 6Kuftrph9RlYEDvTlzsKFIzWgnC2liyuTfgWXh6tVg3wOdw+XC9HfS3WZGknm3b6BeMd1D1Vee+
 tLToc3RcDqXjtWlEwOOHhy5N77rYg+eKp18TTQY+VqMYcBiIn4rjP3VsZvs+UHZkQ/k6yHKmiP8
 t/DR2EsM63FRh43Di+0d1zbIRt0MlVAp1o2JvaOwz0P7QV7n6zROLNXsHlV9pXUuNvw+1wSgXwG
 AEKYch9OrIUUFENKkugiH2xTcwIZ/ZIQDqrEeUL9MtUylwxHYKspRJUY8v6bfroQaH2SdxziB8n
 RP/Q4UK/EV4QyNZj1txoivWzdOleXtnz8X0TyfI9qZs0io12ske1tpKfbX5sUvpZi/0XX3JKdwr
 WsWn/qg1ksn7VVblBD4Z1uGbGZaHcdSvDhALmX8m/Y1JDtE+6wmki5owqzgzptKAyMFIS3fvVxJ
 Dw0b5X4lPkHJvvqNYXqaZCKUdRGAgv7k7BONEVfdrg7m+B0+k2+M7FFAozQfuxo4Yd9UlzYUI9c
 Ubbo/vB94zUL08A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_115255_117721_F8D2197A 
X-CRM114-Status: UNSURE (   8.03  )
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



