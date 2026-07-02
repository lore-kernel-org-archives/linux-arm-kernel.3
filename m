Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938DDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SsY32QyOGbTjFQiZF5JH17S7U0TTGSYArv0aeQ4n90M=; b=GtPCU48WVlIVfe
	Orat0b6LTqyluQ8tzzX1FcH0Q2WWXiWTwqpwn8PyrKBGu/YgS4p7EpZr3o2UzsQvPtq+nPTOdvgp1
	IATGKjPouaJdt65jzEIXzOzF5bX5YSnv7ENhdNogGX/XbxUeCd2ld508HUywfRcLnOtGYvUP+zJU8
	3YWVMhnzdLW4AR8NOrG8qSeCwZzgy0TXhZde4t0gOmmkoNqwuhQPUKMjLgmZD6nu23/VdmtvqNENd
	aQQ7/6ZPheN3Y+1QO3hSkDiaONMGI2af6Ga5wsYFZLb0EaKFa96DA2fURLUUqUz/Fw4WX/0qzdzve
	bSM+NObPHfKUWID370Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMpC-00000005KnA-3fCk;
	Thu, 02 Jul 2026 19:11:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMpA-00000005Kmz-3pEL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 19:11:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1859A43DE8;
	Thu,  2 Jul 2026 19:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5071F000E9;
	Thu,  2 Jul 2026 19:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783019508;
	bh=SsY32QyOGbTjFQiZF5JH17S7U0TTGSYArv0aeQ4n90M=;
	h=From:Subject:Date:To:Cc;
	b=jmaMtqSfcdAzXZrAq5JOAVkhfRSDbQfdLC9EhS8LUHTO3TQt348e/VPcDCoBGoHdF
	 4OVWYf2XOO2MdjQ04qtkCOIMHZMvR9jzRybZYoAJLnOP5bq1WwB/pI3Z7icfV1YGK4
	 DzpiFPBX60tW6AfcbePrhuu5G/AVPDUYrOgCieIgAAFon3YS5IGEzCy+1fEM8NfSF+
	 31v+5KdGO4CdJorJZoSsW7G8ESBEQh1SIT0lIld+6sIhNxEXP2jd/5b5Pv0miB3veX
	 vo1xD+JNZ1z7qz4MQ34ZPOL7huwohlW4rLjraP79e6yp1/6cQ0mus73IZpch6AR6YD
	 eHgOg8zeBxhfA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/4] arm64: Fixes and cleanups for
 cpu-feature-registers.rst
Date: Thu, 02 Jul 2026 20:11:15 +0100
Message-Id: <20260702-arm64-cpu-ftr-regs-v2-0-fe0b78f1bd93@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANO3RmoC/22Nyw6CMBBFf4XM2jFtKRBd+R+GBS1TqA8gU2g0h
 H8XMO5cnuTec2YIxJ4CnJMZmKIPvu9WUIcEbFt1DaGvVwYlVC4yJbHiZ67RDhO6kZGpCWgsGVW
 nOi1yB+txYHL+tUuv5ZfDZG5kx820LVofxp7fezXKbfcLqH+BKFGgPBVFZrRwlROXO3FHj2PPD
 ZTLsnwAddhhhccAAAA=
X-Change-ID: 20260521-arm64-cpu-ftr-regs-bceb2d34376f
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lF6hsHsdZLJFUh4gzWm0UDUwtgEvWvTUL8mdZqxtKqs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqRrftUY3Hzfq43AU3DHhX+bnsN1Dw8Xi96Cxa8
 7CNJ6bIDY2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaka37QAKCRAk1otyXVSH
 0D9AB/424BJSo6GXj6RfyUt2owJmusYLvYu7S7tjMHtzR5/cwVYQEJcBSyHBAVNDzyPec1wZaZ5
 BKoFavROtFoQc8JQzf0SSPdQDE+sL+iH5UlW5OtJc28dMgu9hKE+MpnskQ+CcY6hONxSSandrCl
 qqZGvHniGelt3+e0/JWjOrMDt58flB7oQYtTNngntSCP3R0PMpoUnfmXFtnxG08u2DyC3MJdh2D
 XahdUCSdiOqwl0m17bHXX3wBeWLrbF2m7W0z/WpGadVto4jJW5Xz0avY1sgACkBBjkz9FnOkeKM
 z+wuUM5Pr9/yCTz0Jmsld/qk+mScNZ/0mE350B/fw9Rzf8Lq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

Peter Maydell noticed some missing updates to cpu-feature-registers.rst,
while looking at these a number of other other omissions and some
maintainability problems were observed.  Several registers and many
bitfields have not been added.  

Following discussion with Catalin we remove the numbering of the
registers in the first patch so that when we add the registers we can
add them in a roughly sorted order, then fix up the missing
documentation before sorting the existing entries in the file.

This whole area should have much better tooling, rather than having to
update multiple places and manually cross check several different places
including rarely used documentation we should be marking up the sysreg
descriptions and then either generating the data or validating against
manually updated copies.  Manually updated copies seem like a good idea
for the ABI documentation since while it's more work that would force
review.  I did start on some sketches, it seemed like it might make
sense to tackle along with using the MRS but the libraries for that
seem not to be progressing at any great rate, I'll dig the sketches out.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Remove documentation for hidden registers.
- Fix typos.
- Link to v1: https://patch.msgid.link/20260522-arm64-cpu-ftr-regs-v1-0-19775b40faf0@kernel.org

---
Mark Brown (4):
      arm64: Don't number registers in cpu-feature-registers.rst
      arm64: Document missing bitfields in cpu-feature-registers.rst
      arm64: Sort registers in cpu-feature-registers.rst
      arm64: Remove hidden bitfields from cpu-feature-registers.rst

 Documentation/arch/arm64/cpu-feature-registers.rst | 593 +++++++++++++--------
 1 file changed, 364 insertions(+), 229 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260521-arm64-cpu-ftr-regs-bceb2d34376f

Best regards,
--  
Mark Brown <broonie@kernel.org>


