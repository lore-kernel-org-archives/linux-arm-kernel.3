Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0794EC54F55
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQxcs/6dLpHKo3+p+eUTF9ZX7c1Jn5ikh2HXlabef7k=; b=qZKCa4NIe7me6vIk03P9YxfPHF
	2sPx5Cf2Xu9OS3QxL1mQkI5f1FNv4I5xZ9Jpp91hg+xDogtM84AF/HoXAjPQBuG5/9+iq4hqTA5wK
	3n7ZwWc575TiHKLff1m0B3V+0gwoEgj2gDCSnAiKZ9zIAVgYXbb49dEWpD71t+EkRRIze3j/M1WQ/
	g4fanj+ufMVjQH9LZLmUIE2pzYY4iF7YV3leov+wa+WulvNzZM6mGY665H56eO6+QrPmhvf4VRZ1c
	3uMekoJCv+D8FCNyCHAe4L+hj4yHu2HNb2HEubkedUJlgHrF9Vtv4+qPMXa8l2oMWb0mAiSLJME1e
	UkkpF3WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojY0-00000005c7W-29bL;
	Tue, 28 Jul 2026 15:16:48 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojXw-00000005c4D-1U6J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:16:46 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so2164889f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785251802; x=1785856602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GQxcs/6dLpHKo3+p+eUTF9ZX7c1Jn5ikh2HXlabef7k=;
        b=j4+V+UJE22YNj4t4OYtN3VWqqfFq/cMhzmPO9qnL5hwSCipccA2Llt83BFYQyzcDlB
         VvUuEjr+t+iV+eSPe793mjL+vVKf11iXcSzi5QnCtmgWzKK1pdPHumV48bvju5unujUc
         UAPVmhCdar3rP4MmCwSxpB5tNmTpxKgeUyHwvfvn9XjGtSRGyf/rMn8DICxu4rp+b99J
         5IXxU9w6hR722dx7mjOVevR9IJpAb06wRxBYJZDoZR6+nau5Z1aMAI/A2r20nQoJtCk2
         ZpHd5i0fGIINe7Py+Nglba/izB9X3lGJ0UxyHQFw0hGY0GyIlTuzMSq0HDCFzEDV7i5T
         KWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785251802; x=1785856602;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQxcs/6dLpHKo3+p+eUTF9ZX7c1Jn5ikh2HXlabef7k=;
        b=UTlhIwk4SMjOAlGME35u9BAtfNR/9z+gIiZXJdCox5cplP8B28wLQ2kXbdhhHhowq0
         krMD9v9d/uirJbbHm9NF8GBSVMhmULluo9Kb2dIKBb+dl4jgPlULdkYZSeRLnD1wjYvl
         SVJZW4uvVqLX4s+9rpiufw/0ozZBCyzrE2sY7B+wCziCsLNrR5Be++X3ARn1VnnNlZZE
         58KGAUhxH4z+WaNzxdgtl3EOIdJNGOifNYEoJqR3OCBmGEKmLUuJluIOZIluSFXgfB7M
         R8k1Qh+7sEpHkA6d/IzvzGcXr5C1t9bC/aOOd2H3nWrONcpmictdKejLcc1BQJL/mwpp
         5+gQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/6GFUuOwWHJUfP96sXktTjC3G+7/oVGR7/TWm+4ZeRFKTOFg/erH8gQJ0tsdANUjVGwnjxIgkpwP8NtDbfljt@lists.infradead.org
X-Gm-Message-State: AOJu0YxD7DN/snAmqEVmr4MLIgNnuIpv2mbpH9pRKOICVFW2Re14xB/L
	0JlBD8R/JxWE6nPQlBIbC39UCXyomRoKdKYL/bOfbDqJ84VM00o5b/DX
X-Gm-Gg: AR+sD12/Qszb59CMFLusbjd+6lcvK9fqe7o0jIKetHszw4vrdoM7AXMoivX6GaV+Eex
	EDE6DFzbRPK61cBcG2JU3ufaPyFqvKDgBs4KYr5eShu3zYxCtjYF1I74q1CpqEmMD8wzyHJOjYv
	EU9oRLl7Rl2Yr2072T7CdBq5jUiLWl7GpZBwwD4G6NyDOHyW33YCU87mcanEHX1/dXMaku8dIeU
	+bbjuG0xY2e50+hFhDuvSI2jJ/WSBOJLAGXlBPRx9rhlMvtDjj/l9xJ4YU3bCxPxCFpfLxkjVf8
	mnbwDoowK/oPxk49oiYBWUUy2KdEt3cUiIbqOlpgGUqhDsGSGUQp0V2ArUBH6ho/sCnpiKfJ86y
	2yIX0GgPDKsZfE6+1CFqIkX3kG+gfMLuSeL8UgDevBrl5F2us14eUfy+UwCfpQIunP2vbJaeRgb
	hHEUT+Lyx7EMyYczZyWucntiOKhpw4nB6kgnM=
X-Received: by 2002:a05:6000:40cb:b0:47f:7261:3a5c with SMTP id ffacd0b85a97d-47fb1f30e92mr3467694f8f.56.1785251802293;
        Tue, 28 Jul 2026 08:16:42 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm58422500f8f.28.2026.07.28.08.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:16:41 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add Orbbec
Date: Tue, 28 Jul 2026 17:16:34 +0200
Message-ID: <20260728151636.236393-2-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728151636.236393-1-robazzalberto@gmail.com>
References: <20260728151636.236393-1-robazzalberto@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_081644_448735_0B126E18 
X-CRM114-Status: UNSURE (   9.23  )
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
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
3D depth cameras and embedded vision boards. The prefix is needed by
an upcoming board compatible string ("orbbec,zora-p1") introduced by
this series.

Link: https://www.orbbec.com/
Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f36..a42899bd2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1251,6 +1251,8 @@ patternProperties:
     description: Option NV
   "^oranth,.*":
     description: Shenzhen Oranth Technology Co., Ltd.
+  "^orbbec,.*":
+    description: Orbbec Inc.
   "^ORCL,.*":
     description: Oracle Corporation
   "^orisetech,.*":
-- 
2.55.0


