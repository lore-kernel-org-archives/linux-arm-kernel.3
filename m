Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FC2C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 16:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rVlDR9iO9xzNSL/ayRFSNBQcAYg5eJCcJuC+js2w0wM=; b=SXWP/bmxtbm4GQ
	QVXZIih8tYVXPl/YVNAsKg6W/460asL24nSsQ0Q/dYpk1NgAdS3ZLUcF+Xd7juCwhLPWtb3gfnEwP
	V3tQtnWIm53CbLwph5ZddRFOEMZB/cNN8+5QSGf+rMUXF+WaIq7/oriSb8x7gRztgaH+3rW0yS4LW
	Yi6rF11tWTNEl+V/FH9lLTvzzeftAte8KiOvATq4OETHQxH2Lq8d/MYeQCKkQ93BPY9RDOJ5C897u
	le0hH+f3W3ff52b/r28xphrvUHR2wQnv3W+NwjcZaAo2ptIt4M8SO2jLcMbbPogsIeaLE6MbMKVib
	vHu+EwYtKQIp042wtexA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6A16-00000004LXz-1Spe;
	Mon, 14 Sep 2026 16:58:53 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6A12-00000004LWt-06IS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 16:58:50 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f633cd80so985582f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789405126; x=1790009926; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rVlDR9iO9xzNSL/ayRFSNBQcAYg5eJCcJuC+js2w0wM=;
        b=bn5tms0inqdvmXRq3izRZ1KVqJNpI46Sxyzi0WDZ1O6tCauD1dxI9pSvn0FWuKVE5O
         F7//wG8iAtJY8Rr2cxkMh4ynoBmRDKy3LwrW7ccCM/KN3MZ21SMMM6dzK8h5dEDesmD8
         ryHz/JfjzCgUsI6OD07d3/Fn6wohEK5z5QnwLGzxCA4e4ibh+JAC0p+g+855atF12V1t
         dvTDZLo/f0zR0a5kGcPx+uwdfEvX+I159JayAhqMMFOXsovVr0ixVpgE3gdBDfzfv3yI
         rJJKNasiLmU6SMX3sEIm/l6tGVW1cpJ5cNOZO01YapQv7XdrL3Ald6uM0CKFmeS2j3FJ
         w/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789405126; x=1790009926;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rVlDR9iO9xzNSL/ayRFSNBQcAYg5eJCcJuC+js2w0wM=;
        b=qAzidR3p/GFUHuyfHjmr3K+vv0XJOXJRpmoz2qqSW3f2oWFrSXHICm7pdkTmkohJiW
         xZ7iCJRbd+kW4sV9vZaeOhH2PZBLP1g/ZDTOVYV0RUDfAfhBQsw/td/vaEH3vxC50v9X
         DtFpRRE+D0MGJ5an7lSlkAkAxi440y7Fzt26zU2WjuD2Ma6SS0ZftBOfWHXpjTXyiO0L
         Kw08iMVXmDbzfOUwZFeZHbXhfPV4KcgTnAgLWHIR/GpB0k32D7dq7IH6wI7gEpma5vYr
         Gp6C3k7LdzcIrcPki2dEOUFsppcSjDe6wFuvAffCNJtkC3gl7mWIPjXijE3WrVN8vBO/
         oTNA==
X-Forwarded-Encrypted: i=1; AKwUvByyWLSPPppebUbz2LGwRWoUQhvoU/MaUAobq3vZQ5SLZYa01VWD9jj9pdQlI15Of3f7VnV1lRdzyHgGsy9GQOTH@lists.infradead.org
X-Gm-Message-State: AFuF++mUVrB7YWVwu6MUcrscT3YVtbZBeXBVj9vAtyMBVEb/HPO9zbFc
	UgNt88gtcP97Q1iXxYNKPo579ivLPAjvgRk/HTy/CCOeCXva3KMYfT5ISy4d6q8XD4U=
X-Gm-Gg: AYBFou3kaKWX3jRhcLYwu9SGqGFVC8XfDnir+IHZWc8pCTtEkSnkY62W3vPOSQvQOKu
	VLJkcJyhYsOEJ7EpvqDw6ULb0DUKz0dbPT9jvBJvt5Pb1LnZZkJjXFc1NCIgBvuFee3Ez1jX57Y
	mK4GtD0xwKWVmalcg8lVAIJHzAs246fYUhNmGhaAGrlQIcqjlfSPmhM89XHDd7GCy9k9Lpikn35
	+teJlw04eXcsde4rAZ1pzXukhZlR4f5u/+NI46Ft7AkRmcIjIReHgliSq0Wxqxagi8s80sDYHod
	TQgJ5C5gCu+/YCCgoqEmPQuUCvDRtfzWqu07haOWKEWUeKlegbECHBXv4C5mAGn+H49Z592tipp
	o37nVvokOt/3e3EnJNf6wfkMZBMOZPKW/iAMuB2wHDhq5ckzShiBB+9zgQlvDr289BcMWPfYsHf
	QuwS6ZTxgftwBVrp2vsNfXWfDqKGFnm5z/T6f/LZ6RbD3Q5tUkjZsJNGBIY96e7Uzrn216RJlVG
	ZOuZ+fyaS9k/0Rx6kQwNU1Guobl3c6P+sfSivIoTk4QMOTrBUHXHABTArLpZLQ=
X-Received: by 2002:a05:6000:25f4:b0:486:f9ea:796f with SMTP id ffacd0b85a97d-48702b5b1efmr4480960f8f.41.1789405125646;
        Mon, 14 Sep 2026 09:58:45 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm29636198f8f.7.2026.09.14.09.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:58:45 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v4 0/2] Exynos850 ACPM SRAM devicetree node
Date: Mon, 14 Sep 2026 17:58:43 +0100
Message-Id: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMMnqGoC/3XM0QqCMBiG4VuRHbfYfqfbOuo+ImLqrw5qiy1EE
 e+96UmFdPh98LwziRgsRnLKZhJwsNF6l4Y4ZKTujeuQ2iZtAgxKJnhOcZycj6pgtxjMg9aGA2O
 V1qiAJPQM2NpxC16uafc2vnyYtv7A1/dvauCUU9k2pqhkW8lGnO/WmeCPPnRkbQ3w8RL2Hiijt
 Ra6VFhAK2Dn828vdz5PXpUgjdBcKax//LIsb910RkwtAQAA
X-Change-ID: 20260413-exynos850_sram-ca1200b99e82
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_095848_109027_E182D6AB 
X-CRM114-Status: GOOD (  11.74  )
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

Hi all,

this is a small series that adds sram node required for ACPM communication.
Bindings update adds new compatible "samsung,exynos850-acpm-sram" there and
excludes it from having child nodes and not required properties.
The node becomes a simple one:

apm_sram: sram@2039000 {
	compatible = "samsung,exynos850-acpm-sram";
	reg = <0x2039000 0x40000>;
}

The ACPM driver will just continue to parse shmem phandle, so
as far as I can see no updates there are required.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v4:
- extended/added a bit more explanation in the commit message of patch 1/2
  as Sam suggested;
- fixed size of sram apm node (thanks to Sam for noticing!);
- Link to v3: https://lore.kernel.org/r/20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org

Changes in v3:
- sram node moved to the beginning of SoC section in DT change,
  reg property updated to match section requirement address-cells=1;
- updated trailers;
- Link to v2: https://lore.kernel.org/r/20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org

Changes in v2:
- small update of the initial commit message
  "Add SRAM node" -> "Add acpm SRAM node"
- new commit, updates dt bindings to exclude sram node to have child nodes
  and related properties, this adds new compatible
  samsung,exynos850-acpm-sram
- Link to v1: https://lore.kernel.org/r/20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org

---
Alexey Klimov (2):
      dt-bindings: sram: Document samsung,exynos850-acpm-sram
      arm64: dts: exynos850: Add acpm SRAM node

 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 arch/arm64/boot/dts/exynos/exynos850.dtsi        | 5 +++++
 2 files changed, 7 insertions(+)
---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260413-exynos850_sram-ca1200b99e82

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


