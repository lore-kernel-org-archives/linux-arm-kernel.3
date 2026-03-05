Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0349DF47CB5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 18:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0eRVptHtpjhyZI71FfT0Vrndbtw4GySKW+NrEZWIDWQ=; b=BrjUO0yhVSFSrGjWnCJAZ7t9yl
	pySFJvSfJk3QFiJqnt7O3e/q6TLEz89LK2am8nF36ck2mGYfV4L/Gqi+Wo8DgBfLfroewaq3QFA5+
	Uxeb23VDtGxVABoGF3ejmaGDcHknEjFJHMyeajRXtYk4nKClqYSPOVi3bCdBjVcOyewW2NsOpzhDl
	/uV/bu+TkFJBEWt56cRfKM32lErQsoZkj5BT4x4aDOCXzBJ+as7V6LvcezqW3q6+6eMxx8mExymyy
	1SAheUorPb099khvXbwZ9JbafK5aKjFZAiZsQqGJLsh/hE7dEvzObRj8iu/9tPCdESrCeqW5CyYCL
	9Yhco0/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDnZ-00000002PiO-0RKN;
	Thu, 05 Mar 2026 18:51:49 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDnW-00000002Ph3-11IJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 18:51:48 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so4570099a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 10:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772736705; x=1773341505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0eRVptHtpjhyZI71FfT0Vrndbtw4GySKW+NrEZWIDWQ=;
        b=JjgjET3ROC5/t43JtRmH3NMiF4DvwYh0hFeGx724PbDXWGMQfwZMq5ZUWT7FfVkXWx
         A2wYdiBTM41I+gvrmhyDmctV/jGCAa8Eo5LWRVM+6QDfO7X4nc79LmfEQOeKvKn+pbUN
         gPtL3FQjPAqWtawyXIZvVi+adJ7cms1WipsQfUJynWJPuNZyWvYcpNYP42ORkqjhoKG+
         0N6QbZU8Wly6NFP2RkFP5BF/wh32mekNJRSgCxkCZPLA8+Y6GSANI1u/qEIgvxKRJXBx
         u+t+SQq/E0ruuSEpp7t+V2mQHZakiBH0OQATy4oKfYWghR8W6aSI0Ivlxh1GAsk2BP2/
         aQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772736705; x=1773341505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0eRVptHtpjhyZI71FfT0Vrndbtw4GySKW+NrEZWIDWQ=;
        b=LfCkNu5LIC89DPZ7m8zFn+LxXqOhVD4nehMo/w3STKcvYmLnnK1TH8dcWS5Od2XPoO
         aoUUsRDhEKgB3tFIRREUWtbsdsTtVb//Hpq/AYGNNvLMpBBRAij11f724KLxRb0aMnXZ
         J4BMMmpfXpbWKHHlgqagli9sA88JPZolAf2c6K+762dlPASBV3vUGDlqlIH+gJ/fDKRa
         HNRPqlNZ6ySr9Bga1KeUzG8u/NNxyO9EyptCYmazEoadvNG0sk3dxe9lEDiIDwwmk3co
         ZcTmNBuNtNip1C+pCA1j94dlpWqyS3CRqucaaZvaOtbAI8KzCl40Cam2+bXBOKWV645u
         drqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIe7zuf0u7RCuxjckUYSaZ6GK7CxI3I+6T1ZtAMz7xqcHqbr7x9OCVwQSu1ytFO6L5/SMRoUGz7+aXPGPm+KFe@lists.infradead.org
X-Gm-Message-State: AOJu0YzNaUmIbqcD7feXKQO4lef/QLHQHQjpW840q8mcXquIBfZQVpGx
	kIhCj2OnSY0c4o75rCG/hULj1OnEC3FGVRrRGFjlRD8va66Ssrk9zlBc
X-Gm-Gg: ATEYQzy1lXOpnbCKlBOsWzpBGR/EpaJ9eOqVy7ClY828+LGchkyuZlNoXPoe2DzGEMC
	EvhJucao5Wzfw7khUvqtL0l7hJwFh7FLZ0SwJEJCRMFdVoZ98vov1EO0YR8jAVhP8rZNXTa4cx0
	cxXNJtAWfbewBCw/9pfeYSUv+mFq/ukIT2Lc9lfhFfIWlOo5kMBP6yoM5eR9L1zD9g0377+T1/m
	3oRzdz8zw+8PmIFYUXgB6agKlhrHvUYWa9WOU9lPaYzJzt4O6vByvhYBiYvdA0nOhtlp+Kh/Crx
	U/3ohdez03BI7GysGtUKJhIW8IZhzG5TDFJMdYMYl0Kspp/Tz3rPp8kB9qHizgt3J7H9HP8Z6eK
	hkbGZTHUDQ3L+n+U/OSoMHUfui2sqsoxXDh12j0R//5yvJA7VZPyVyumVFFa6zzHGtUyfBgGIE4
	UBY7z3WdJfifAr680hA5MlElr/7Hdu3fTrzJ9tUESK55Y8ULYdjc9DL51Bwc5s4OnuwrlRqkG+I
	fWGjDU=
X-Received: by 2002:a17:90b:2683:b0:356:7b41:d348 with SMTP id 98e67ed59e1d1-359bb3dd804mr401448a91.20.1772736704777;
        Thu, 05 Mar 2026 10:51:44 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2e14821sm2769158a91.17.2026.03.05.10.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 10:51:44 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 0/2] Add initial support for Lenovo YOGA Tablet 10 (Wi-Fi)
Date: Fri,  6 Mar 2026 03:51:14 +0900
Message-ID: <20260305185116.781184-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_105146_285660_13B20DF8 
X-CRM114-Status: GOOD (  11.78  )
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

This series of patches adds basic support to
Lenovo YOGA Tablet 10 (Wi-Fi).

Changes in v2:
- removed lenovo,b6000-f, lenovo,b6000-h, lenovo,b8000-h, lenovo,blade
  compatible strings
- remove "0x" prefix from memory Device Tree node
- remove "compatible" property from mt6589-lenovo-blade.dtsi
- dt-bindings commit message explains this product family in detail

Note:
$ make CHECK_DTBS=y mediatek/mt6589-lenovo-b8000-f.dtb
says that

  DTC [C] arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dtb
/home/akku/tmp/linux/arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dtb: clocks (simple-bus): dummy32k: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
/home/akku/tmp/linux/arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dtb: clocks (simple-bus): dummy13m: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
/home/akku/tmp/linux/arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dtb: clocks (simple-bus): dummy26m: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
/home/akku/tmp/linux/arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dtb: clocks (simple-bus): $nodename:0: 'clocks' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml

These warnings originate from existing mt6589.dtsi definitions and are
not introduced by this patch series.

Akari Tsuyukusa (2):
  dt-bindings: arm: mediatek: Add Lenovo YOGA Tablet 10 (Wi-Fi)
  arm: dts: mediatek: mt6589: add basic support for Lenovo B8000-F

 .../devicetree/bindings/arm/mediatek.yaml     |  1 +
 arch/arm/boot/dts/mediatek/Makefile           |  1 +
 .../dts/mediatek/mt6589-lenovo-b8000-f.dts    | 15 ++++++++
 .../dts/mediatek/mt6589-lenovo-blade.dtsi     | 37 +++++++++++++++++++
 4 files changed, 54 insertions(+)
 create mode 100644 arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts
 create mode 100644 arch/arm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi

-- 
2.52.0


