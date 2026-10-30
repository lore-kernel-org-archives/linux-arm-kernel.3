Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCAA606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 20:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SyIt08ZK;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BdVxPylt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VSr45EekwXT7Gn8RorAXchQ8TsB4e3wg2k48aCXq1sA=; b=SyIt08ZKjviYrZTItfhcd/SNHK
	7999UQKleaSHg/WCNfBVU/Get8o5hhcV/ByPOQus975alxkYdi00S3mY7V1Z0RLO6GnQ/tQU05KEc
	JwkC6HPfXB64+U9iMiHRp7P+9YOpmki7neyNzAA72BMwfetJAt64ullbpoCpwBTwZ7BpcEaAPzkEb
	IxZF5fdB222Qj4IzlF5woNZWajwOqKffcfXT5D839fSCCSUA2qVkzbvs+D4aSEU7Agy6Gg9nUxDlz
	XiPEJ3tRODcR4IWY3KMLJ2VuE/9iofybGgyPuu3ppys9FJ5Zzm7R5m6U1M7zeMahgH3x/qOQ9zPy/
	4sw+KPtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMtIl-0000000CXh1-13Dr;
	Fri, 30 Oct 2026 20:34:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMtIk-0000000CXgH-1G77
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 20:34:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 758CC44044;
	Fri, 30 Oct 2026 20:34:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793392453;
	b=GVaSaOr0nT7xk7aPDmQCLCMNiVO0aH47kqT57HLI5ob2oiw0pamoaVUCOrkOp11AgFWr
	 kgsjmM90P35tgpALydetPFWYG0LlcjdWD5yIRkZo0CElH6We7luvpWYvvywmMqzY60+4V
	 cJe/8T4wbxMqDbXcsbqNipjBPzmpRgSqgV87xUECmx/a8NAHw946GKS6LBAw9Lx3SZE+C
	 i6pwXeSxx960MWAAm2IpS3v0cJ5bLShlZ9Aqduj7SH3DaRYHGCgwIDrLx0Izxko7SEOEA
	 9H+edNzP+0kggNlv7ZiwKYpReNIe0sxfCe8i+oZmJPseiTv5UY0y1tgr23PKS1or/sw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793392453;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VSr45EekwXT7Gn8RorAXchQ8TsB4e3wg2k48aCXq1sA=;
	b=MghrYpLwiRAzOyW0gye3Mv4RsblDIMQziCw4JZ8QRS4cvMxAsJZKda8Zka3QcLpqCwjv
	 n+36gwOCFuAH+FvM2VLbVymrBdAp8duhpxRjXSmz7wuiJk1gX7F3NY+dB93rHLYYwRn4E
	 U142UaopRwRnlff43ikXIZH57okEWemrh2eypxGqCqcRKk/oxFu6WCXIuSh7+hEPm0458
	 6ayIwhmEIst0f1WBqVL+0Aq/557h4VeoJtHF0Elaatb9xhsYlygjeAm9cxMPY+hYR6jK8
	 P6kQNIQiCbqhCn7jiKyQwKhIvQsLKK13T+HhBL1cM6FVOFYjtRYK/ohRLHk4Kmgn7fw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 454991F00A02;
	Fri, 30 Oct 2026 20:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793392453;
	bh=VSr45EekwXT7Gn8RorAXchQ8TsB4e3wg2k48aCXq1sA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BdVxPylt3UyLK4YSMW9XMYqaTq64XNwhPcI529DPbeuAF2qswBmejXqC49q9L6a3b
	 c2UWx7S4fGZ3ynnb+Saa/MI7eFOdiLBjQs2CQzhyUs1cBYC7NZWTovMpz8Nl5b2gXK
	 bnVKmzG34OrJIAL9w3szwlAMbciOsJpzPRO/d2CbhfqVw3nxeBb6C8/rprIPdEuoF8
	 xERBFIm+iPIzmpp1xXHQGVypUJA3/vRueYXwFAWJ//HSM1zPkW7ixuFgTdOjU7PVUS
	 TAwuRfBhTEpk54CELT9uI+S/P0HaO8lOGdnBB/l6zOBG4vTrFNEK0e9xTek/3NQ1fw
	 5WloBR5tphWzw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BC81B44287;
	Fri, 30 Oct 2026 20:34:11 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Fri, 30 Oct 2026 20:33:58 +0000
Subject: [PATCH v3 3/5] dt-bindings: arm: samsung: Add lucky7 board binding
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261030-for-next-lucky7-v3-3-81e02272ce69@member.fsf.org>
References: <20261030-for-next-lucky7-v3-0-81e02272ce69@member.fsf.org>
In-Reply-To: <20261030-for-next-lucky7-v3-0-81e02272ce69@member.fsf.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=7JvUn6Gsqc0cxhWub/oalXTSGokInna58PtxHScXffE=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq5P9BHMKBNh4IQyDh63QQ1k4O5B7iuUyB1RWst
 LQX8wp+4zqJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCauT/QRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+t2URAAyZpdL0VPHA7tNOV/jR4IN13ZZjCE5rk
 U+2fOx7l6sFhM+bm/CXkpLAdlxnq8DYJBBMY+c9v4RDYvRAWfNwSdhBnj1vhiP82NEDomFkwN1U
 1QrAQ0FCSps9MWrONQ9aLkVkvA8KmXqXLQI+kzdmHtA/KQUHB/JgKPYEwdw33Tr3CIy90MPrGmD
 3K2cDQ3cVdtAXUtUIEUH3ZQwD2kPxtV298RhVAdpbId+CLw1fYETEdHz+/3WVLZQtcbjgfwH9P7
 QJvmZ5mEMmAzwGUXBstlTWT/Ma+n6A3wDiXEEUvQ0LwCzMDqg7GxrDdSkWjiyWQwYFZTQc/Y5WG
 GJYkI2XAdnxItD8uX0PAaFvJZi/D6R6vs6CLr0m6NG8QE0Cpb5hKjizpH3oquemGwOfPmNdch8i
 1pVV2nCidNIZppWMmYSucV48h7VmdGBfKdtzZNlwFZfh+O5TNoAMh+N7t6qo/ctF6QDhJNYkhv/
 o7e4J9s9sgFZi2LEujp/Ibr8CdeefOtzJPam5pr2UDo0WAJutthUbiiAC78VoiIVWOzZcIlVJJ8
 Kq0PRTrAVnlO4jDuqL3EW4szSyo7fwo8Z+MFBk7ijS6E8FTknoWkrHSbwXIi8CVi9dClc5oVxDW
 Y7n6uAqG74JaOAafywKRTbnVVo3O3Ocscc137xcAFTJPerl7C3mI=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aidenisik@member.fsf.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Aiden Isik <aidenisik@member.fsf.org>

Add device tree binding for the Samsung Galaxy Watch FE (SM-R861/SM-R866)
board, based on the Exynos5515 SoC.

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index db19a686f490..c80fac4fad7a 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -157,6 +157,12 @@ properties:
           - const: samsung,exynos5420
           - const: samsung,exynos5
 
+      - description: Exynos5515 based boards
+        items:
+          - enum:
+              - samsung,lucky7                  # Samsung Galaxy Watch FE (SM-R861/SM-R866)
+          - const: samsung,exynos5515
+
       - description: Google Peach Pit Boards (Rev 6+)
         items:
           - const: google,pit-rev16

-- 
2.54.0



