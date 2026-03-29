Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE851F3D600
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 12:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=09DmEJZvX6q03iOvlAg7HJKVIb4nx37LesonFOCNgHw=; b=vjjmS+1w1NT/ItlyWqF0IXixUz
	gzU+w0xl/lV87Ppc1S5RS/rSedZF+eTxJ8roYzeIeixJVOu1zPtWKDZC6v/eqJNhJa1Hk4T//2/S8
	ASOgjixSYtneB43U1rKD7ChrVtIL0uJWCXWXUQdv4Qcp2RDziQvXIXqB+5pR1BNtRNvXBggLBGb5Y
	4Ovm9jUpg3pOwk18fWR3cAVlzu6Opb7FcupkB20vDVipIR9cqLXN+ma79AFEknGLDJkolLdo7wc7x
	AbMaSj/fimhZGv5EX6SS+wzV1KetkDl6WvxFszMFLAIL7wcvDAtmxTQlQ11YVQ7KfKQDNNhWU46ip
	MhDtSFkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6pMA-00000009uxg-3VRI;
	Sun, 29 Mar 2026 12:35:06 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6pM8-00000009uxJ-0S9p
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 12:35:05 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2b0c8362d93so19076895ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 05:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774787703; x=1775392503; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=09DmEJZvX6q03iOvlAg7HJKVIb4nx37LesonFOCNgHw=;
        b=YuPdOmxs9OzVJV29jF2FIZ+u+0VBdiRPcbfC8D3WGeN7oCFFP+8SoZ2uJ3CANELioI
         ayWVx3JHK22ofesPP/X8PGjIlZsohDqFdA9JvMKGKPW9Rg5KpcJnKQqS49nHOzDZ8ysM
         ReJLcMCqnIT984TsyImvQCK3N0lUV9gEi3FTLk6GBVCzq+xabXj5ZGCtJhy+ZKPLnIRh
         T57QJJSg15MWElolWpkXlgNIMkla/ADFzCAMbCDfe/ci+djg/mf50gdS2YZJS0ZRqoxg
         OquID2DBOdsT8iJnnIr7610qCCBrllXdOibUqRCByp6Ff8RSbGpH5r36yeO7+BCbN/gy
         HTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774787703; x=1775392503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09DmEJZvX6q03iOvlAg7HJKVIb4nx37LesonFOCNgHw=;
        b=cxT60Zp6rE9k4kD06uVi02Zp/zqw4DUYAPiu+vexyYMAJbLaSLPz28lHOT/x5gq5BW
         pkPAU27AwQJx1acyIL5a3p6fior1T454LuhqgU24tDMYd5L1bHnfjSeSTQ/TeLpqQ6j2
         +E+DxcedPezqRDbjvOLF24mdVXYW93BIwlNqmI2GL2BI17OaRMai4XomgH1DTLBUsovJ
         dXWgTvmRVdKert1FhomjFS55IXGrSkhUQa/YT0ZtygU3uTdt/R7nwJQjPeS1Om20i53Z
         pwhf+OLGqrqSzzlPTGLn7qEdvAuHMwTbzcZhTMqQO4exNKep7lENNnfPp4GgGBele3M/
         aWjw==
X-Forwarded-Encrypted: i=1; AJvYcCUjAz8P0qFgrL8/mM54YLuTzHS7qVqxmdhbpvqmnaOjGvDYg9vi0qTLopahyQywzvjY/ZySCKKE66dMiQYWGyPI@lists.infradead.org
X-Gm-Message-State: AOJu0YxqKQMWAwESdtdsABsD+bzHYBljb9Uubw73QYReE1XB55xrGhKb
	01Q5MnUdrS2osGJW8/oBVkbX6SQGaCej2asJmyCMMXZl4yUr9tifGNyb
X-Gm-Gg: ATEYQzyepTXfgHZXLgMe3+q6wpSdyPUNZMj0+x2f4ID+5O48YRaH06h0RuW8A+6b2VM
	cFx0KqUV4l6mvo11MtuE5k62zIZo6YmH+L0cwzFySMeLgwujcoBLgdXyQq5QW+WGc5qYKFspgwY
	uJAnpd9dlba1PEZ9A12GeR1Q0pNDvyNORJ/4Ajv/zHSxmUDpezS2SGWwt4UUQ5ntR0Pw1vBP/Il
	mMOaZBRdMLxcC/lBzwkDBZomCSSnDrA5RiqNnTwhJh9CN//YC2EUsgCMaNcocf/oYt6Jl3iEDq6
	jM1ala5ARsvs6GJjtLZywKIECSDO2jw9IMgPkpRkiRfVUICOJfZzyXhtAwoav9Zy2Rm34pOLzp/
	IRXDlItIOODahYdVHDs/Y+ZtIw1ORhVTs+XWDL6WlceVZjPwIyYJMPuXy9lbM6zXtrzCRdS7F8p
	lOAeNbrQ6KqiE/iIvDCa9xPelDGFvPii0lkZeyjWDMNUQXP9jeTUjhVvu/GDkI3U7dybjr3qidG
	hM=
X-Received: by 2002:a17:902:e54f:b0:2b0:6df2:8cd2 with SMTP id d9443c01a7336-2b0cdc239a3mr94457085ad.19.1774787702960;
        Sun, 29 Mar 2026 05:35:02 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427afbe0sm58709665ad.72.2026.03.29.05.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 05:35:02 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	vireshk@kernel.org,
	conor+dt@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com
Subject: [PATCH v3 0/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
Date: Sun, 29 Mar 2026 18:04:42 +0530
Message-ID: <20260329123449.309814-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_053504_150099_F621FF50 
X-CRM114-Status: GOOD (  10.88  )
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

This patch series converts SPEAr Thermal Sensor bindings to DT schema
and removes the thermal_flags property from spear13xx.dtsi.

Changes since v2:
- Reword the commit message and subject to correct explanation in patch 2
- No changes in patch 1
Changes since v1:
- Changed unevaluatedProperties to additionalProperties in the binding
- Reword the commit message and subject in the second patch

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

Gopi Krishna Menon (2):
  dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
  ARM: dts: st: spear: remove undocumented thermal_flags property

 .../bindings/thermal/spear-thermal.txt        | 14 --------
 .../thermal/st,thermal-spear1340.yaml         | 36 +++++++++++++++++++
 arch/arm/boot/dts/st/spear13xx.dtsi           |  1 -
 3 files changed, 36 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/spear-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml

-- 
2.52.0


