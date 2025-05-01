Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3817C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 15:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24aju4vckWNvxc0dYUsOm4ELFTjb4KOrvPEs4u1cqbQ=; b=icmegY0WBPjzY+nzeQ1cKGV/v3
	GsDDq8HVXGNk7uXWDFcCn0MdeuvE7l5SV+sX8+Ga/3wUbxgMGMrL/66fUynxa3+ajVR24hHuzqphQ
	woE62IrLaGTiJ/VUSBXBLSylVd2Kf6xdPoQcSORXe2wLbogKoyhdrA6/VNA46tN6pqFORmJlWC5Af
	JDzT91l+rCI7/60y1qFPXf2qClAJr0cq5EluFqQMapMBd/5pkTu3YKtonlJozGw8X2gAau0tAeR5I
	YUNu34lGBFncOOf3Y2WqDISLPzDuNCljtOOAAlXEqi+557cqMM9DD2W7tKhjHvHFZTZzNH+05/RVc
	/h6WJfeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVet-0000000G41L-0Kcb;
	Thu, 01 May 2025 15:17:07 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVXn-0000000G2vX-1Q8u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 15:09:51 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-47680c117fdso1830691cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 08:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746112186; x=1746716986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24aju4vckWNvxc0dYUsOm4ELFTjb4KOrvPEs4u1cqbQ=;
        b=NnwX3OD5zpPRWHn7BkS2DhTLEhc8vrEFLdLaUdFTS2o2MDjG39UannRt3lqHeCcmV1
         uj9M3t4eAlRHDE00eA78DLPLbCePqdIQYoRyBT896CDjTTEU/LYIFUU4emd99k7oNOde
         wPa3mxZ0UhU2bP7Deecfqlwyeq3c6lYaw6z24MWNNRfDGYK7XgsvTWh6MTvIGJFG+guS
         SnbbIvKR6l58cAbWKK4JDmab6/LrVhj6Tg75AVbnXGfTBdJHD5RPrc3pSyN1wNvjvGyV
         mLcbmtBJUAfOe/j9UIvyC3B5Jp0NRpBkD5OukeGo1AO/W5YNHmDs4tZSM6Ql7TCrk3Hc
         uWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746112186; x=1746716986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24aju4vckWNvxc0dYUsOm4ELFTjb4KOrvPEs4u1cqbQ=;
        b=u9SuPtb6eWZW4046JvxpANNKynBLAk6Du1/I4GIsV5SLQyLAKyJw3irNVwZrv4th7B
         mlcjj324fshK3wLEzCkb4AkRVo7svBilCHRf6z4EFSaJgfnDBE2jw3KgBSyyMYZWrX+p
         erKZAx8dA/SzW76aTQl+z/crsHBB95FY5igUJwcUY9PZWlN1taN2L82e975Cfu1RSyV5
         rDSSbm1tatIZSJtdNSFsBkXnGjOD0lFO9LU4lrjLFYtY93k2npkXCjiAv/gZbgNV11CW
         cJ7FfiVyF9RzeFLTy1J+OPHEtBroEeftwuZ4L+vVtRqwrk0bc4ygR+WeO2x2Kzlpe0qr
         gBWw==
X-Forwarded-Encrypted: i=1; AJvYcCVX5zEm9QErE4CeWuUTERgZ4K8yRdKdHggHh8qxouRSOwhMrJcyOiQRy1S4WOCBu5QnJKT2diRwJeKgxTp7swHu@lists.infradead.org
X-Gm-Message-State: AOJu0YyLZw+EBTx12momZfYagz7nJM7UFedtd+oKc5GxBuR2wfpc89xe
	feIbgSwCefvDeOG7XajkyZmry6S0txo6DWEQ4iZX0xcctvRuhNX2fdM+av6hbxc=
X-Gm-Gg: ASbGncvnWbgWE5Izjf7TbWcel+RbEpl7jbxhBHKcBNPzPRZZsHUcpuT3PfUPegeFHKS
	E+o45NIbjKxeKBpVl1ajmxaSjyGKhVnX++aEXkpX0dMZvj4DTsmRKXASnC/EY55SGK0fjlN3Q4x
	E5GC+vYjmxMIlg3vdxXG27JyQ+d1kz5vaNgrdyceK54mpH9sqlyycggYg6jw3bmZlMFYBcr/33M
	GZzMOW32a9lpLIyaChtxvephdn4cr0glmjdn0Bn0xdMLeepkKVcV/5YEwUyYijV0bj09BlfklNl
	LPUqD7KR56C705wCKZloRyC+5L0Ym5+tGVrMLi70h37TdMCDmw==
X-Google-Smtp-Source: AGHT+IHHOUjXMBtVL9o1d4OTnpFX0xqq+LhKzYmbKm6TpyXgRkIOT98m3NrxbiBzgdvab9P/+F639A==
X-Received: by 2002:a05:622a:550:b0:476:652f:4dbc with SMTP id d75a77b69052e-489e4d77485mr39271321cf.7.1746112186174;
        Thu, 01 May 2025 08:09:46 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48b960cf655sm4823621cf.12.2025.05.01.08.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 08:09:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] psci: MAINTAINERS: Include DT binding in the entry
Date: Thu,  1 May 2025 17:09:36 +0200
Message-ID: <20250501150934.77317-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250501150934.77317-3-krzysztof.kozlowski@linaro.org>
References: <20250501150934.77317-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=812; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=4OJUaVfhsWGYWCQcnU50+ivFurGc1fBl5lDiP8aAxxM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE46vBUr5ttc/yCgJJGS2600wMNVyFUim++QCD
 uA9WYamECiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOOrwAKCRDBN2bmhouD
 1+wSD/93N5avRTUg69zdXpT+8IkHJGPrYaH9nAMXBpLVmBTkwDBp+r/VxGN9WlGi0qHr5XIM4PT
 7uJMgbgmSgeSG0KMaVuckaMudzZfl74yrBzZ/gCBXuqoLhQaTohlgZdYQJ1TycVAOVZ6qIpJBiB
 8teuBgNktVmEARCxLMya3ukDqb4OdJSjYEVaNo1nYyCPyKfqd/wuXFqjrcAP2SoF3G/jgCTP1oT
 LoTbMfnnrcqqtAZdMC5S8PoboAj7Zr6mNggckzJfb5nXDhPGYJEhUsPRUfY2F84sofi4V3Xgj/z
 TQMoOw/7nhpbjtIqwb4Us6+ab5G0kKH0uNA7YesyHUbNzJX4YTq7ZEZRPYF0nsrk5ccx5RuRIQE
 /4qv8QFbokNHzZoQ63VqEZxx++L2OHLb+owDU0u6PHad5T7QEbtusy4k9vrHED+jiKeDUkG3OoO
 +COkQadi06wkMvT2LjzarUrvMRc0T1Yq4aC/XaRvUCv0nhk77mYAJMZpliYU4pXb1ypHPw1ydhD
 LUjr8N/pJs4AEXYjPljOrOCSbP+MEe37uVbid+df7eOxC6sHmHdTids1mUgaxMF66NTYGkhyO7f
 8xeedmU3CP3xEnygMNXTwvQb6h2jZDjIyVFFtx1nRxuI+SMFZGwaBIWuDYt5jXtAM63KQv1x33d Wi9S89lTfRcN7cg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_080947_374104_32B1A7D4 
X-CRM114-Status: GOOD (  11.99  )
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

Updates to PSCI Devicetree binding seems to be not picked up from the
mailing list, probably because actual maintainers are not CC-ed.  Add
the binding to the PCSI maintainers entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

v2: New patch
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2c3be5f6131..193bf0895f7f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19436,6 +19436,7 @@ M:	Mark Rutland <mark.rutland@arm.com>
 M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
-- 
2.45.2


