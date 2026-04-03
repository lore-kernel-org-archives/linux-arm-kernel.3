Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA3BE85385
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 17:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOckUoz3D/kwaLSDr6qOT8erm9cqqrIc/LOah0sYQNs=; b=Zq6cgs+B1KzD0a/Fdt9sDdpSox
	QX5le8rvqrr4jE/A208tC8TC/j20cab1Kw06Qtli6xG/AlsUyGXxOsy6MElJKOVoMVQxawDJsL/TF
	PgaEm5Jtaj9aqrWFwZUbh0giqicoId0K2BrUygk+k9L4sOqntP69cLP0mg8m0dgNmMoM+dZrwJDAp
	bHHUW147ExSbevX92sm/UPEh7hOHPFwqWo6vYLlxPdN1mzg8eC4rIw5X2KtJI3Ztoj8mdzfPjQjQc
	aX2qlXWe3mNJ3KItOJgPhHz/OhhHx8MUa0uD6CYLPdPifWSf9sOqO7RIRI7ySSBIzHcrhEfyZ/X1k
	oDy8XoeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0h-00000002Mqu-3VE8;
	Fri, 03 Apr 2026 17:08:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0d-00000002Mmh-1kl2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 17:08:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21BDA445B9;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1002C19421;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236118;
	bh=mWau+z9gzfl+tuHR+lGcgDHqPCc2l27GPvMVfJPudmg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Y1g+Qbf1ch4N+koDB2V+S7QVEOzgVfy1Pf+jHl8igUoVTRUlGfDAcPISTYrFZeWZy
	 Ks7Nb5os+jpxx026l/8BycWzDQClDMkvO+TdB8FxQqVuihR7o2OXiX8GH7yx5mzBjA
	 WtZcjbDFjkwqiRkMN6CX6FKLkx5dl0Re0XpN7GcH3a7tayomG2rHJ9ys03/CzPcIAq
	 P3EBFnZWtDmuTgP7rCSYEPxg9WzToortNZmQq2xVA9GBYsnKUvnJb9w/+XuH47FP+h
	 BXPMYfkkSksRijxEqJEKKL1WQCqftX4oIIVMRvgEqH4BCQ71N4aALqiQkUfkFaBGwI
	 /HAQ4Be1v+c6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD802E85388;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 19:08:36 +0200
Subject: [PATCH WIP v3 07/11] dt-bindings: input: touchscreen: st,stmfts:
 Introduce reset GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-stmfts5-v3-7-5da768cfd201@ixit.cz>
References: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
In-Reply-To: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
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
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QQMAdMMa8inZgJe5N3QgZUxLL3HOo56OBBV
 XKlIO3YWsiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0EAAKCRBgAj/E00kg
 cg7TEAC3dCICaldvFwpJ1VhQ2F9/wtFtgSr6tcnU9h5ePpTcqk3blelW2AxD5fL6BY0hcVpQEgn
 zq3/mw0I3NfpVAcW2vXZ+x6Qxx0HtKM4ELLb6UPsUcXjw78ldYN9k/0kpljwWv2VYIEzBBtlcn9
 l1iYGkQp0CtnjfbvvBHrzaxvmDoC1cplh3FSzRVVujsHuF8ORmmedS58dQWI+ExwxsGwlYGSOCh
 UvruzaqrNWzvB/ap5xEQu75gTaQIYZTDa1bOJqXF0ff+ThmY9rLX7gT6R8dbbTACweYig+pxaD4
 wUTMvI0ZcJSNLq9/oi8WZLUZQf+5OoJN/+Ja8sYAWdEsxzENW/H/UbxAtqPv6Zz3fpu7BF8hAle
 sT18KpLuSlHJeQhY1HfDX16SAF/mz4qWqJ5F5Ek/bynAIIumhsztLdBbtgO7BbHmM6pZgAKPw+b
 jTDDG4E2UyXR/uOxRzMOcOr36/tFR/fEjRPkTgGG4WWq/8YmzvvLfKO7jMyoSiYZRS2VLAC9Jyt
 fUIyWmyDNXtV6qrkqtBfy77RubF+suBnVzxKzL4u3wrc9A4QWZkU7c6jaroY+dWE7mIkGpMPDUW
 +TyIggaw8QNegCIaKgyswUoTP//mwWMxNii9dqcAMhIamKx+pjghlnWQLh0pHCy8io+jiJ44KCW
 AY8mUjTNBEZLkbg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_100839_535504_5D5F6599 
X-CRM114-Status: UNSURE (   8.27  )
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



