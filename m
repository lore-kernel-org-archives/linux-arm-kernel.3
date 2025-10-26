Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897ACCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 10:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fa1MhKqzuPVYS2M1bInqrAbv70jc0zu2caVbAoAzEXU=; b=X3LbLyN+lnuTvl/TKBze5y9n/N
	2jIvzMYjyOywW+5pgkp9rkay1Eho3yPy+CWhdMYDSh/6NC18/ifEf9PgjteBudJW1xN0XHVVZL8Oo
	JDQOUD/ekKT5ygwMDZ5kAnx0hubm2xrQ38zMztibALijSGbjMQv9xtW1YSTGEpq7dUrgwKUeXp4f/
	inkzaJY7Mfnwk04zqq+EXlMJscgd3tFZVntLZ4pqiBj5d5sd2VNaE4PBxE/cAn41BvvT6HQXIyDyU
	CSr8RuDpUMxanLU5OJxPpKZ+COUydAkaaDTQ8Q+zf367mLUktjMInNxJBKJ6MjUbbmJUme58xAoYC
	YgP5yLaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCxnS-0000000CEwO-2AHA;
	Sun, 26 Oct 2025 10:16:22 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCxnP-0000000CEvx-3ON8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 10:16:21 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42702037a01so701458f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 03:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761473778; x=1762078578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fa1MhKqzuPVYS2M1bInqrAbv70jc0zu2caVbAoAzEXU=;
        b=cKdJ1OoS0alXBbpAHDn2qNNeMdqrjEXZejVn30sRwzJgegj23MLiivZqACyJTLSJ4e
         sAHDNCYP24Bz/rAcZn/Cme8gMyo35OzNLfCMxutP67pC0McDI9yY9SDNvJcrwtQa7g1n
         4UtCm7EliXq9T2iOA5rdM0SclHIBlTxHru5PvRWoy8IK0Cqp02UXc3GZg2FTaDAbU6T0
         QoMOXNaFtf1JFRW0uUqikSFAkT8ATztjIrPXIw02D6+n4upEBLEPU3D/Uws8hUpp8mjr
         b6oopMYzitXqQ+xEeWePTNTnoV4vaAkAko5xLTtJ+L9nI9tNl4VgQLF6ZmuuarqOiKh0
         BpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761473778; x=1762078578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fa1MhKqzuPVYS2M1bInqrAbv70jc0zu2caVbAoAzEXU=;
        b=qL2xcQm34HvztAw00ZdiCelBGrOxGkYSHbtXpG5uT1PHrxc++z+UD4xEjgQKfm55I2
         K27vHHLNDm+YChBojoj8y6dz6CfkJpfxJQuhkkm+PRuhTLfkIaAo/DaypKSPOw0QgVm1
         NG/sH5bZQ4a/hM53uRuSZXpXsj3DQAzy3xambUeYdKDEHGmRTvr4duViAyNHckg+tpn5
         Hgso1iJ0fdv4dEHJgBKBcEEP08z7hIuewP2NMRzVqZJOtYhPLepir5L8VGD7FdlGA6E7
         VQF+VfR93pNYhct7w+p+SCO8xfJ6GYHgnYvjlGZo6Qi+GPdMoucGxqwkCoTIJ+PAQYAw
         kWMA==
X-Forwarded-Encrypted: i=1; AJvYcCWlKb0b2vN56rE7de0g/PcTUJR2SYkJTAxx1Wi1Pys1SYsf/uvFC6jKSkkgopjA3guCK6VGeoo0OdUHWOk6RgwT@lists.infradead.org
X-Gm-Message-State: AOJu0YzH1tJAT8C9DpO0RhTtKDaoKMflmvq9QmtI1HrvmYIlYtQFAcGz
	dcpaPfciI9m5YwAjA0vhReZ7Mg5S7JRdxYy7cHLdAjI2mSA9rArsErt/UGOBL8WDNDQ=
X-Gm-Gg: ASbGnctBQmQly38zvE6jWtwWESVUp1tehSsfTNKvR/lMVyFvWTogiF3QJrwhRiEGXAO
	PU9Yl0kGZrOq7lkIRa9o8GoSd3VDXpfedz0bqt1ZFdpgIyviMhwkHHGzt97AQN/0jOoPim/EEkn
	E0+ZaeREm03AHSmOqIUMGzg4jkhFwVVmf3AsoL2k1+AjhTaDasqJMsLuT+VDlPAd8GBhjNt4GF8
	LsYwamcaIfvdqMwLj6UwhheAX8KFIfI785PNgofkPATooaewFDJ6AShleOA8VAZS6G2coLj7Afz
	p0bq3FBvtc31iItDjQhhaO8smyyJqvQhTODZM9SzHw6Mpce6wOLI/R80TuHYSCvXGURBqUX7hg1
	fzuvct+owrADtHEAKp3b0qJO96kKEUGsXLliNR4laey2xuNs7WZqCZ/O8QYMC6WQielsLExclEp
	Rly2/t6EDspGw=
X-Google-Smtp-Source: AGHT+IEi5uzHrsnrvxV6x6FdgS/nZMzufp+jHg+YI+JOzAvJ350q2EDyHwRDOj5mFEkpTFwuZkWAKA==
X-Received: by 2002:a05:6000:2408:b0:426:c349:eb1d with SMTP id ffacd0b85a97d-4284e4fa3c5mr7192681f8f.0.1761473777719;
        Sun, 26 Oct 2025 03:16:17 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df62dsm8423876f8f.45.2025.10.26.03.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 03:16:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net] dt-bindings: net: sparx5: Narrow properly LAN969x register space windows
Date: Sun, 26 Oct 2025 11:16:15 +0100
Message-ID: <20251026101614.20271-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_031620_026573_1CE0A081 
X-CRM114-Status: GOOD (  11.33  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Commit 267bca002c50 ("dt-bindings: net: sparx5: correct LAN969x register
space windows") said that LAN969x has exactly two address spaces ("ref"
property) but implemented it as 2 or more.  Narrow the constraint to
properly express that only two items are allowed, which also matches
Linux driver.

Fixes: 267bca002c50 ("dt-bindings: net: sparx5: correct LAN969x register space windows")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

No in-kernel DTS using it.
---
 .../devicetree/bindings/net/microchip,sparx5-switch.yaml      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
index 5caa3779660d..5491d0775ede 100644
--- a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
+++ b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
@@ -180,9 +180,9 @@ allOf:
     then:
       properties:
         reg:
-          minItems: 2
+          maxItems: 2
         reg-names:
-          minItems: 2
+          maxItems: 2
     else:
       properties:
         reg:
-- 
2.48.1


