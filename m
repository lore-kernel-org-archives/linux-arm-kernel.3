Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C5EC624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 14:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uu+HvTyoamB1lNH1BNuzgtxk99beZfuZqlFooUQxZqY=; b=E7S1F+Iw4mwjxF
	MLAhenvsEhGQJYPrd9duS5NDgSc625xsfZW0h9JiU+hSUabC/pPX6U35b8eYT8i00RoQQ3PWgV8tX
	4X3fP9Z9Sp6sIEGvDJrEigYidawl+xmUg5PvPDqah1BUGS+lhntH07DTiGbmiffruiIMzptwyjDHv
	tdVU2UF+H5CX77Ypk0hF1b3I6TAHcknqsT0inIVBWyWlduT5k2TinsIti7CqSCd28IyZjQrj1vfGU
	nT+l/5xHdBAHjTqI2VEDUNXoe1Wofz1L8Teuusk2hV6PdG0oWmmpSkAp78UzZgg8J88LDzV3rzrf/
	LSZzSs3+GT/Ia4yCpUcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Gz-00000009fdU-0hqW;
	Mon, 31 Aug 2026 14:46:09 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Gw-00000009fck-07xF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 14:46:07 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-ca5b707b78aso582147a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 07:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788187565; x=1788792365; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uu+HvTyoamB1lNH1BNuzgtxk99beZfuZqlFooUQxZqY=;
        b=spZINvHYql9GCOP/jx15z1+Fkfb0jnj5km+HwnTAxT9iXYLAIkujrHWgZ6MUVJSZ4U
         eTLHRO+q2m7lE5tolK6E3t7vAiypejcdagyccNA8Np/iYrgV4nMAjwPBKsok60d3Ly+7
         lp/yOUpS/+OTKfgjJZ/GeAIt7gqVqNpbpW0UJEetVhPCaBGcYiHZ/gPiV+OxZjd5TG7v
         7y4QrJWDxg4rGaoJiMDim7a9VkPAUoZPOTdu/FoaHGdl84n3s0FaK/ECIHSB7Y2bN1El
         /2iCY7OW2OFu6W2GulyckIts+Bwe04DQ9oHHUZJiJELo0edSFKMWmSfp5eQ8mjQmd0r2
         /1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788187565; x=1788792365;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uu+HvTyoamB1lNH1BNuzgtxk99beZfuZqlFooUQxZqY=;
        b=H1uOuVSE7oBP1CBXUnpyL7wdDa0SZRJon+lfktolcbyqBUqaoZYKBTKS/2eKKlqmjL
         piaxuBSS57adHI3R/4HLH84Js5DdqG9MXLOh4fXFFM7BxusX+LPcg/XZ1rFAPtNNfJJP
         h2t+nxVv/7yQXFVm1tmEx8kawvAfyGoDU3+ZQo1a4xu2KOYorLfcQ5lSdYo8GK90mT6m
         8eKKoaqNEBYgxfVvGyyAZxKkMRu+eJnE7L8/HzvTO5jIG4y3/s4uQ5+JXzCIW/LZQCI8
         MLp6Nw2cSc2h/XxFrrAyNeQfe+Feep5ptTKglC/udC3nCqXNzWsNhNHuATTt5MYUWUcX
         Xqew==
X-Forwarded-Encrypted: i=1; AKwUvBwR3EbVxuMXBbgjRwiyw//HtsBbhkTb+FJQpe2LXiZXlqrEnac6X6IDFQDFsDzCsKzuzbuyyx1kZJOfTtro2fmf@lists.infradead.org
X-Gm-Message-State: AFuF++luSRlfwbo3kv4RmumlC+8G2mXsmitmm/j6Hu4tBrVrLIpwr4tI
	WAm4eiz3B7IVYjDhchqBlnrrJbvXWCHP7kdcIBrc1KlDhVepO7cLOIoG
X-Gm-Gg: AYBFou1E+TEuQRYmOA8X8FBLdE+Y/mZDcUnaxToA99rKRADrAmsnMPXLxeuAzPbyB4m
	gMoiK6ybq8VUtPg1mMIrCTbU/Tl2qpoOPTqxJqg717d3Ww/+dZq96u0inxTvkFzgjTXow14i02R
	RSG7+5ZHTX3VRUn/WqYMrrCpc9pIc7KlPYHVonIqWikmbC9J2zeeeac2Yx+3C7N8KArabbLfYNt
	+mSmtLFmNPsmLeVttYt8CiZGaC1Zx0/pNbRkpNpH6WNMV4RHLYBRPIF9+grwoDxLqsZNiA66lU3
	DlsByiO/8JBTkxxOKTKPqahCU3yr9SI5r5IPFmrK4foUSbrzYr08SNsjxzGYv/pqzxGMaVIUYKv
	FeW9sce8UQyy4e3MtUXukcH+EQgh1tWc1aoFFsFP4mLAHg1sU8IsA+zwAAQosVqyYnXHrNYzkCB
	UkBx5kjsinXSLdNd7pgzTqWq5wq6KxthksqZurMBcPTjuInKik8MRcuy2aQ/yTdkow9F0C4RE=
X-Received: by 2002:a17:90b:17c3:b0:398:bada:832b with SMTP id 98e67ed59e1d1-398bada8463mr13042007a91.6.1788187564330;
        Mon, 31 Aug 2026 07:46:04 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5009:b339:5edc:6eb2:1ff7:f053])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm43217279c88.0.2026.08.31.07.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:46:03 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v3 0/2] ti,keystone-devctrl: Convert to DT schema and DTS
 cleanups
Date: Mon, 31 Aug 2026 20:15:33 +0530
Message-Id: <20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NzQ7CIAzA8VcxnK2h4HDz5HsYDwhlI+7DwEJcl
 r27bKcdjMd/0/46s0jBU2TXw8wCJR/90OeQxwMzje5rAm9zM8GF4iVKGD28aIrj0BNYSmYMLSg
 6VwKFI1lYli/fgZz/bOr9kbvxeT9M25OE6/S/lxAQlONalxdbaVfe6k779mSGjq1eEntD/TYEc
 Cj0EwmlwcLg3liW5QssVIWW+gAAAA==
X-Change-ID: 20260813-ti-keystone-devctrl-6e49212fe35d
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788187552; l=1832;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=A5txglQ4iZT/juDqzcBtdepUMip1daW3tLa4YrE6PeI=;
 b=5uAF3LTjxwbIRorl7/hnCp7yFyq96RIEgs7RuXrtj+raAjTecfJX+WAM7jZuoYQBJFYRLlgxl
 N1rT/BPZrX/DPWg29wTgWzLZjONyX8XsbRKmfhqszWfkPSXbw+mVYO/
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_074606_081739_4BD69AAD 
X-CRM114-Status: GOOD (  11.72  )
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

Series converts Texas Instruments Keystone Device State Control binding
to DT schema  and aligns the existing dt files with standard naming
conventions.

Patch 1 aligns the legacy child node names with standard names.
Patch 2 converts the ti,keystone-devctrl binding to YAML schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- Rebased to latest mailine 7.3-rc1
- Removed note in patch 2 as dependency is already merged into mainline
  and there are no more warnings.
- Link to v2: https://lore.kernel.org/r/20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com

Changes in v2:
- Fix legacy node names containing underscores in existing .dtsi files.
- Dropped 'minItems: 2' and the conditional block. Made 'simple-mfd' and
  bus properties strictly required, as all in-tree dts uses it. 
- Updated patternProperties to strictly enforce standard node names
- Link to v1: https://lore.kernel.org/r/20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com

---
Bhargav Joshi (2):
      ARM: dts: ti: keystone: Align devctrl child node names with dtschema
      dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema

 .../bindings/mfd/ti,keystone-devctrl.yaml          | 84 ++++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
 arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi    |  2 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi    |  4 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi   | 16 ++---
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |  8 +--
 arch/arm/boot/dts/ti/keystone/keystone.dtsi        |  2 +-
 7 files changed, 100 insertions(+), 35 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260813-ti-keystone-devctrl-6e49212fe35d

Best regards,
-- 
Bhargav


