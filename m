Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4734E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 18:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RtDjHEsKlqnKLw9RSqshlsxOcnu2K6PLRN+CO0KMG0s=; b=vkBHTKtv2KLgq0QuVwlBvrfdMM
	qqGxyRPiqJD0bg1jvPm3FOkXsuICEoi3P+dml21e4jOMqmMnVmHPNe/SZ80LEWl4795uMEjkg6fKH
	t5zScscB5IqS/lLwQLh3/78x2dAEC0EMZCpFsLLpjZ0g2TBhZaZVmAbXMtdDSEUdbK9AXLsnnWffE
	Gv9Y3LEqn9EMonXgtZ+tYgKjAU1XQsyjf6tzfEB2Gvw0xrHh9h0ruA/Bhx7Jj579GmMayMKnzwenI
	tGtFR5rjvX570mGN1PKGNMdu0FQ66h9BYhUMuVY0dJGtwuoWMKWFzwh2GoyoeBkiqv6Ocd5RPEyCV
	kLNy5/yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQWaY-0000000ECzQ-2npX;
	Wed, 25 Dec 2024 18:58:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQWZL-0000000ECul-47nA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 18:57:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 751D0A40460;
	Wed, 25 Dec 2024 18:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E764C4CECD;
	Wed, 25 Dec 2024 18:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735153037;
	bh=uBT2bEd7Od3E7wqUTtkK5Fg6/H7rroL5PZZiaLQMxew=;
	h=From:To:Cc:Subject:Date:From;
	b=rVrPVpOKcp3m9excjTL9iDaqa+okTf4YUqY4ujqM5tg7iz38zgPz1K376D5HyDjQL
	 akbcVT7c62e/g+4c8Hnmg1PUW34wVKH5I85YqLuVOFdzyJ9Gm6BFDSjX6YkZN1A+Cp
	 6+fxUG5Eht2R1QOVZIFKmwRbrealgWxXtgBV3NPCFu/lTNE9TxGktwiHb8P67AJ14H
	 S/cgfyULcWXx75CImKRDb6yGoWFW9rsYL0f1jPpaGkM8BiqcLwkDjpUlhglDe269tD
	 wpp+qRkDLG4zl9SQPQ7o6VmJS104Vmpa46P+9di+ogfTv3dPInici1SbX67te6PCAV
	 JxxBymeMmmmag==
Received: from 91-161-240-24.subs.proxad.net ([91.161.240.24] helo=localhost.localdomain)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tQWZH-006tTE-8W;
	Wed, 25 Dec 2024 18:57:15 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] arm64: Add basic JSON register parser
Date: Wed, 25 Dec 2024 18:57:11 +0000
Message-ID: <20241225185711.582648-1-maz@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.161.240.24
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_105720_162771_CDFDC0EB 
X-CRM114-Status: GOOD (  20.24  )
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

We currently populate the sysreg file by hand from the ARM ARM,
resulting in a bunch of errors being introduced on a regular basis.
While there is an XML dump of the architecture produced on a quarterly
basis, the license that comes attached to it excludes any sort of
open-source usage.

However, ARM has recently made available a JSON dump[1] that contains
a reduced set of information under a BSD license. This has enough
data to extract what is relevant to the sysreg file.

This is achieved using a JQ script that I cobbled together over
the holiday, and while it has a number of limitations, it already
works well enough to extract useful data.

As an example, here's what the script returns for TCR_EL1:

$ jq -r --arg REG TCR_EL1 -f arch/arm64/tools/dumpreg.jq ~/Work/XML/2024-12/AARCHMRS_BSD_A_profile/Registers.json
TCR_EL1	[3,0,0,2,2]	MRS
TCR_EL1	[3,0,0,2,2]	MSRregister
TCR_EL12	[3,5,0,2,2]	MRS
TCR_EL12	[3,5,0,2,2]	MSRregister
TCRALIAS_EL1	[3,0,7,2,6]	MRS
TCRALIAS_EL1	[3,0,7,2,6]	MSRregister
true
true
Res0	63:62
Field	61	MTX1	(IsFeatureImplemented(FEAT_MTE_NO_ADDRESS_TAGS) || IsFeatureImplemented(FEAT_MTE_CANONICAL_TAGS))
Field	60	MTX0	(IsFeatureImplemented(FEAT_MTE_NO_ADDRESS_TAGS) || IsFeatureImplemented(FEAT_MTE_CANONICAL_TAGS))
Field	59	DS	(IsFeatureImplemented(FEAT_LPA2) && (!IsFeatureImplemented(FEAT_D128) || (AArch64 TCR2_EL1.D128 == '0')))
Field	59	DS	true
Field	58	TCMA1	IsFeatureImplemented(FEAT_MTE2)
Field	57	TCMA0	IsFeatureImplemented(FEAT_MTE2)
Field	56	E0PD1	IsFeatureImplemented(FEAT_E0PD)
Field	55	E0PD0	IsFeatureImplemented(FEAT_E0PD)
Field	54	NFD1	(IsFeatureImplemented(FEAT_SVE) || IsFeatureImplemented(FEAT_TME))
Field	53	NFD0	(IsFeatureImplemented(FEAT_SVE) || IsFeatureImplemented(FEAT_TME))
Field	52	TBID1	IsFeatureImplemented(FEAT_PAuth)
Field	51	TBID0	IsFeatureImplemented(FEAT_PAuth)
Field	50	HWU162	IsFeatureImplemented(FEAT_HPDS2)
Field	49	HWU161	IsFeatureImplemented(FEAT_HPDS2)
Field	48	HWU160	IsFeatureImplemented(FEAT_HPDS2)
Field	47	HWU159	IsFeatureImplemented(FEAT_HPDS2)
Field	46	HWU062	IsFeatureImplemented(FEAT_HPDS2)
Field	45	HWU061	IsFeatureImplemented(FEAT_HPDS2)
Field	44	HWU060	IsFeatureImplemented(FEAT_HPDS2)
Field	43	HWU059	IsFeatureImplemented(FEAT_HPDS2)
Field	42	HPD1	IsFeatureImplemented(FEAT_HPDS)
Field	41	HPD0	IsFeatureImplemented(FEAT_HPDS)
Field	40	HD	IsFeatureImplemented(FEAT_HAFDBS)
Field	39	HA	IsFeatureImplemented(FEAT_HAFDBS)
Field	38	TBI1
Field	37	TBI0
Field	36	AS
Res0	35
Field	34:32	IPS
Field	31:30	TG1
Field	29:28	SH1
Field	27:26	ORGN1
Field	25:24	IRGN1
Field	23	EPD1
Field	22	A1
Field	21:16	T1SZ
Field	15:14	TG0
Field	13:12	SH0
Field	11:10	ORGN0
Field	9:8	IRGN0
Field	7	EPD0
Res0	6
Field	5:0	T0SZ

I completely expect this to quickly rewritten by people who know
what they are doing (I don't) and improved as we understand more
of the data model.

[1] https://developer.arm.com/-/cdn-downloads/permalink/Exploration-Tools-OS-Machine-Readable-Data/AARCHMRS_BSD/AARCHMRS_BSD_A_profile-2024-12.tar.gz

Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/dumpreg.jq | 124 ++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 arch/arm64/tools/dumpreg.jq

diff --git a/arch/arm64/tools/dumpreg.jq b/arch/arm64/tools/dumpreg.jq
new file mode 100644
index 000000000000..84527e8d52bf
--- /dev/null
+++ b/arch/arm64/tools/dumpreg.jq
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: GPL-2.0
+# dumpreg.jq: JSON arm64 system register data extrator
+#
+# Usage: jq -r --arg REG "XZY_ELx" -f ./dumpreg.jq Registers.json
+
+# Dump a set of semi-pertinent informations (encodings, fields,
+# conditions, field position and width) about register XZY_ELx as
+# contained in ARM's AARCHMRS_BSD_A_profile JSON tarball.
+
+# This can/should be used to populate the arch/arm64/tools/sysreg
+# file, instead of copying things by hand.
+
+# The tool currently has a bunch of limitations that users need to be
+# aware of, but that should have a major impact on the usability:
+
+# - All accessors are shown, irrespective of the conditions in which
+#   the accessors are actually available
+
+# - All Fields.ConstantField are displayed as UnsignedEnum,
+#   irrespective of the signess of the field (as the JSON doesn't
+#   carry this information).
+
+# - Not all the field types are supported (Fields.Array being the most
+#   obvious one).
+
+# - Value ranges are displayed using '[...]'.
+
+# - MSRimmediate accessors have a giberish encoding displayed.
+
+# - ... and probably more...
+
+def walknode:
+        if   (._type == "AST.Identifier" or ._type == "AST.Integer") then
+	     	.value
+	elif (._type == "Types.Field") then
+	     	@text "\(.value.state) \(.value.name).\(.value.field)"
+	elif (._type == "AST.UnaryOp") then
+	     	@text "\(.op)\(.expr | walknode)"
+	elif (._type == "AST.Function") then
+		@text "\(.name)(\(.arguments[] | walknode))"
+	elif (._type == "AST.DotAtom") then
+		.values | map(walknode) | join(".")
+	elif (._type == "AST.BinaryOp") then
+		@text "(\(.left | walknode) \(.op) \(.right | walknode))"
+	elif (._type == "Values.Value" or ._type == "AST.Bool") then
+		@text "\(.value)"
+	else	# debug catch-all
+		.
+	end;
+
+def range:
+	. as { _type: $type, start: $start, width: $width } |
+	if ($width == 1) then
+		@text "\($start)"
+	else
+		@text "\($start + $width - 1):\($start)"
+	end;
+
+def fld:
+	@text "\(.type)\t\(.range | range)\t\(.name)";
+
+def condition:
+	@text "\(.condition | walknode)";
+
+def unquote:
+	"'" as $q | (.value | ltrimstr($q) | rtrimstr($q));
+
+def binvalue:
+	unquote as $v | @text "\t0b\($v)\tVAL_\($v)";
+
+def dumpconstants:
+	if   (._type == "Values.Value") then
+		binvalue
+	elif (._type == "Values.ValueRange") then
+		(.start | binvalue), @text "\t[...]", (.end | binvalue)
+	end;
+
+def walkfields:
+	if   (._type == "Fields.Reserved" and .value == "RES0") then
+		{ type: "Res0", name: "", range: .rangeset[] } | fld
+	elif (._type == "Fields.Reserved" and .value == "RES1") then
+		{ type: "Res1", name: "", range: .rangeset[] } | fld
+	elif (._type == "Fields.ConditionalField") then
+		.fields[] as $f |
+		{ type: "Field", name: $f.field.name, range: .rangeset[],
+		  condition: $f.condition } |
+		@text "\(fld)\t\(condition)"
+
+	elif (._type == "Fields.Dynamic") then
+	     	.instances[] | @text "\(.values[] | walkfields)\t\(condition)"
+	elif (._type == "Fields.ConstantField") then
+		({ type: "UnsignedEnum", name: .name, range: .rangeset[] } | fld),
+		(.value.constraints.values[]? | dumpconstants),
+		@text "EndEnum"
+	elif (._type == "Fields.Field") then
+		{ type: "Field", name: .name, range: .rangeset[] } | fld
+ 	else	# Debug catch all
+		.
+	end;
+
+def walkreg:
+	.fieldsets[] | condition,(.values[] | walkfields);
+
+# https://rosettacode.org/wiki/Non-decimal_radices/Convert#jq
+def bin_to_i:
+  explode | reverse| map(. - 48) |
+  reduce .[] as $c
+      # state: [power, ans]
+      ([1,0]; (.[0] * 2) as $b | [$b, .[1] + (.[0] * $c)]) | .[1];
+
+def encodings:
+	"'" as $q | .encodings |
+	@text "\(map(.value) | map(ltrimstr($q) | rtrimstr($q)) | map(bin_to_i) |
+		[ .[2], .[3], .[0], .[1], .[4]])";
+
+def encoding:
+	"A64." as $a64 |
+	@text "\(.encoding[].asmvalue)\t\(.encoding[] | encodings)\t\(.name | ltrimstr($a64))";
+
+def accessors:
+	.accessors[] | encoding;
+
+.[] | select (._type == "Register" and .name == $REG) |
+      accessors,condition,walkreg
-- 
2.43.0


