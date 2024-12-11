Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB0CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 01:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OewEZkcCpo7ZQbKiyEwJ15iCRmWZrReBVuj7ywIYel0=; b=izN4sVg/VVyu9a/G+Ws5XddPb+
	enSPjFfHg3rwr9F8Lo/6rMBYKUhPJcSb5Rt/CHk7B0E+S4U1IGaQ5joEM59VaDPvTizTVDc7qZfkc
	eb6B8m4dvewNK+raeg93cpDOvN0LV8TqDT9JaMya5ZHVQ/u2ceEl3odl+JzWkGMrMGCU6ueQmu/+t
	Nq+alYgjhYPopF0JZUmnEVUX/mdvAol/AB6ZF8t/HS6O/23jpnm/BCMusgOuPCGzLkRjC+EHbUKO0
	9fTBfLi+9ppJ5JVTrG84H+0QKbI96U6fsMP86TWNnrNYptIMzQ7x4BgUSDFi75pwHRzBCSG2Om7am
	cSCGrk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBFa-0000000DNeN-0st5;
	Wed, 11 Dec 2024 01:10:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLB9c-0000000DMSX-2RWb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 01:04:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9AF0A5C6492;
	Wed, 11 Dec 2024 01:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67295C4CEE4;
	Wed, 11 Dec 2024 01:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733879079;
	bh=D+ekxMaZJ4bu/QgKDMmDwTyVaCHyF9h+lu4yMHG3Fr4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jig45qAHCAYtmBYE5+CE8fxYhV7h9nuGy4oR8pubfZPFYILkV4+w9Zir+jn+PhZPK
	 yCHF6/atwf8RvI2VTgFcwLWFe3EajnCCcO4PveBPCOT5vE0I/17CvH2kNoSMt0iAWK
	 V8uJcYnvkW6dk0RsaHT3K/Lqjs1zsXfju9yl8BmtpRY8fMsRtw/yiKmyGPXOFSeK90
	 sBCCCGVau37CC7dlAj4F1zERyWIMlZ9U/nWltds0u3GUoD2ThF9SET1YuAx3OxonS9
	 4M3BWbFyjWXAj80jpNcB+XumEmPs+p388geiSwBl2p9PKbSrt7yZyt+jS344M3CxxT
	 9+Jc6mUs9nYiA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 11 Dec 2024 01:02:50 +0000
Subject: [PATCH v4 5/9] arm64/sysreg: Update ID_AA64SMFR0_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-arm64-2024-dpisa-v4-5-0fd403876df2@kernel.org>
References: <20241211-arm64-2024-dpisa-v4-0-0fd403876df2@kernel.org>
In-Reply-To: <20241211-arm64-2024-dpisa-v4-0-0fd403876df2@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279; i=broonie@kernel.org;
 h=from:subject:message-id; bh=D+ekxMaZJ4bu/QgKDMmDwTyVaCHyF9h+lu4yMHG3Fr4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnWOUSn+pwvZbrPc/XVepAvxg2ayGL41bDZ0s6gR6C
 sj1dDx6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ1jlEgAKCRAk1otyXVSH0EPtB/
 4hlGPRUu3sTAj3l0XPBJMqa0ifeT7VpAlUyazSgpagYgW8DUrwk4EhQ3EwS3wWdomSWQMgnMRnkDJr
 UwQyraELpVHC/G9wz+yWJ+7pTvInAojunLezWZ71QuQfa8CzbV9L3xhAuGcCHleOasEmU5QPOvxHjx
 klDQmsu1PaBM4Pb3MHzX0wSjBS65zhMPpAGU2cf+ysCV/x3d/uA4TBN2yQ5iDBfNk0tiYxYFiIeVyo
 4w2z4iX9vy1p3k1yFbwlv+mtBlOXLo2XWU4x/ylbu/HxFeQ6iEszRqy6UZvo53XKeWP5jDNZd3BNS8
 +enXEwH6APpaictQCWKmxhHj10+8yZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_170440_663528_B2042D8E 
X-CRM114-Status: UNSURE (   8.43  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

DDI0601 2024-09 introduces SME 2.2 as well as a few new optional features,
update sysreg to reflect the changes in ID_AA64SMFR0_EL1 enumerating them.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index c792bd3b0afbb5fb7e438a4d760d9f2d15621eee..d78b12c59658b480739ae797f5ea2c2f14d8d765 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1105,6 +1105,7 @@ UnsignedEnum	59:56	SMEver
 	0b0000	SME
 	0b0001	SME2
 	0b0010	SME2p1
+	0b0011	SME2p2
 	0b0000	IMP
 EndEnum
 UnsignedEnum	55:52	I16I64
@@ -1169,7 +1170,36 @@ UnsignedEnum	28	SF8DP2
 	0b0	NI
 	0b1	IMP
 EndEnum
-Res0	27:0
+UnsignedEnum	27	SF8MM8
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	26	SF8MM4
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	25	SBitPerm
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	24	AES
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	23	SFEXPA
+	0b0	NI
+	0b1	IMP
+EndEnum
+Res0	22:17
+UnsignedEnum	16	STMOP
+	0b0	NI
+	0b1	IMP
+EndEnum
+Res0	15:1
+UnsignedEnum	0	SMOP4
+	0b0	NI
+	0b1	IMP
+EndEnum
 EndSysreg
 
 Sysreg	ID_AA64FPFR0_EL1	3	0	0	4	7

-- 
2.39.5


