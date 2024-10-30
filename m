Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7B8D5B872
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 15:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1eP4tJjmDieJcuawYQxzboAK6qeuddcc5YbP5qT2L0w=; b=0KhdzuWLxk6DgvqCsYDfIjO3o/
	DcGTBAmCBY07twFeH28ZuuUx11MYACEucN6CRNddtfjJo3A3NtcDiGjEU2RngmQmpTsozavnRUqyg
	pW8mw0mZqUyFhyHa8WZXlrVHgZXO6dB9evytTKqXpIco92XQi8dpJThXCa2pgangpRWuDc7tPuwZX
	MLEZb8H7cl4Pms3QD/wIOLxDlM5fIA69LwYONWxDsZXXpwV66BbO/ta+TNNxYaGuvbOSR0dJ1nd3t
	zLMYHfzggJPorqerv1KaSPZs/tvEzJ4Y0juO/hjalOxGrk7lUCkzRdC2SrxxG2xsjOvNgTRVjXQ5E
	6GvBLLXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Azf-00000000xAT-00PW;
	Wed, 30 Oct 2024 15:52:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6AoR-00000000uUw-2zTC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 15:40:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 07A665C5FD4;
	Wed, 30 Oct 2024 15:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB00C4CECE;
	Wed, 30 Oct 2024 15:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730302846;
	bh=mdF9l8XoMfCClmS8E8sWltwQ5YchWlsCeLs+M166hTU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aaDj3mZlLVYfcvDJO+E+R4/Be3S4iaQk63rmX8wiWw1/dFJCH93/3sD2/zgHYh7wh
	 dwuDFV/dpKKLmFTnX5b3Sfj2LdccqXbneGvHaks+1MsIfL2fjDaPhrh5emC06xIUXE
	 XQ/OvqjEarbcvs+1Jj3F1xPdKN8a/eylIVFnbaRoacQKMhOdMUOBaPMMhGz+L0p5m/
	 CfiP0k0/lLXlzEuZW2J3USJ1Dh12//4g1AOBl0cnzJz+MkAhCpQb0YAnZgw0TzsfoE
	 xKe0+9xIvJkXr4PFfsjy6T+bh5D8d/daRYXIzAzLjql2RJlLeU3vJohuliuJR2IHcA
	 ctgmkAVxvDDsA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Oct 2024 15:34:51 +0000
Subject: [PATCH v2 6/9] arm64/sysreg: Update ID_AA64ISAR2_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-arm64-2024-dpisa-v2-6-b6601a15d2a5@kernel.org>
References: <20241030-arm64-2024-dpisa-v2-0-b6601a15d2a5@kernel.org>
In-Reply-To: <20241030-arm64-2024-dpisa-v2-0-b6601a15d2a5@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=827; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mdF9l8XoMfCClmS8E8sWltwQ5YchWlsCeLs+M166hTU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnIlNm0j6x8UgWp6faY1nzLF9krmdT6RQwTnafTD8Q
 JURn3niJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyJTZgAKCRAk1otyXVSH0KcDB/
 9IC0APArk3dIya0nkA8PjNNFCzVemr2UjVkMWj+lK/cIgBOKN7/fcjUsgUp0ry7UVsQeQt632YJDjD
 gnswsPZnQeS3NLkM1qn5mU9W1CI52P+2GRTA55t3XqI1Ii1J7KV2XmzcNX/bJh1txtURXT88Fl/fe6
 OnfiT7Ua/kGiRyaidu4LFpjX7U6ggiJ4WXjj+a+RgUJLX+gsYGoRIWOW/F80q7h9jF5fvOc358k/78
 +YoaurRAdCQ/OakmR8bolL5jHxiHwcvZoG1JjtHcX12+yvBzkQQR8+kWkF1jRsvHIbU4HV5kozk2Ti
 57Bok0kArHiPu8Vfd3OLwDwIRQK2MN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_084047_850345_39D40FCB 
X-CRM114-Status: UNSURE (   9.41  )
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

DDI0601 2024-09 introduces new features which are enumerated via
ID_AA64ISAR2_EL1, update the sysreg file to reflect these updates.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 808bbd6d3a40a4cd652ac25d686f11ccafc5acf3..c8cc092fc0f63f91c7e87d679266a1f8a38176b0 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1521,12 +1521,16 @@ EndEnum
 UnsignedEnum	55:52	CSSC
 	0b0000	NI
 	0b0001	IMP
+	0b0010	CMPBR
 EndEnum
 UnsignedEnum	51:48	RPRFM
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Res0	47:44
+UnsignedEnum	47:44	PCDPHINT
+	0b0000	NI
+	0b0001	IMP
+EndEnum
 UnsignedEnum	43:40	PRFMSLC
 	0b0000	NI
 	0b0001	IMP

-- 
2.39.2


