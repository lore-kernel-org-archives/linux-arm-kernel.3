Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AE3D34097
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 16:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DaHQrnmaLcqkmNI3JUJYTabiWcfJPlXXVi/VUUMabh4=; b=BKmsdg3kkxvLmQ
	sOmvGTpO3mQnOsu3f21noKB7c5Ho7RjM7f+2B3qeiI4E5uxuoSJAostK9OjNlLS1E5MMLpo6CAxnR
	LyX1NUjRTJMgVDLCenJOOwhov47u6fLJNKjwFeWGfrgwpaf8ZyYHRdZr+q3b4AMLQW+uPwp2tULTf
	K/DmLEx0ItWgIc4SYk9ZwWV1lhIcSHiZvKO4FhHxOhDt1UBWz9UgZcZPNcT59W9AcXB7wSflAK8bJ
	zSNk+iwTdFNuS177iqQc7+7Nq0d+S+uRD6l9pQVjKJOD+yzgodHyCVlcJTnCmWBfLHW7bjN9H+ro0
	VMUpI53Uvltehgpre6ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklmO-0000000Edte-0hmg;
	Tue, 27 Jan 2026 16:19:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklmK-0000000EdrT-2Vvi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 16:18:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F332E4376A;
	Tue, 27 Jan 2026 16:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D57C116D0;
	Tue, 27 Jan 2026 16:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769530735;
	bh=gWwadyBFgXG7MuqFc8i7dcaxPwObVtd7YJckOPo5ibg=;
	h=From:Subject:Date:To:Cc:From;
	b=OuPDjHygyo8BEBZqX8aGW/esnxqMgK4tRly3Te3r+w4JeNrBAbZ7kfMfj8vZsZjZW
	 A+2flRfgQPJ733mhmngX/mIk4FHGbgfkhaHcejbyolYWwfg65kgZSYtrR05KuqVifI
	 IoDfajB8JkKBFbE/SS3UV6XL8EWjzIiU3sMvdbSPOabp1Xd1uzjzvA1o+E5F5Hp5ae
	 x4E8yGePLYJZT/0RRgPmZJmmVDXe2u3N5K1EZPq7anltOTeM8G2G29Ok22a4yVpo+t
	 3JIE5IrC8YnMElU+anmcS/tY6UjyVObtOXbOSFS9GlB9izbzqOWyj5XLJXDIiCDtgD
	 d/de2/xNlNtDA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] kselftest/arm64: Small fp-pidbench enhancements
Date: Tue, 27 Jan 2026 16:16:13 +0000
Message-Id: <20260127-arm64-selftests-fp-pidbench-post-sve-v1-0-3c78eda0d58b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM3keGkC/yXNQQrCMBBG4auUWTvQpCWiVxEXTfrHjmgaMrEIp
 Xe36vLbvLeSogiUzs1KBYuozGmHOTQUpiHdwDLuJtta1xpreChP17PiESu0KsfMWUaPFCbOs1b
 WBRyis8fu1HvfGdpTuSDK+7e5XP/Wl78j1G+btu0Dp8UF84gAAAA=
X-Change-ID: 20260121-arm64-selftests-fp-pidbench-post-sve-cf627394bb31
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=623; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gWwadyBFgXG7MuqFc8i7dcaxPwObVtd7YJckOPo5ibg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpeOVr5kN6zDlcyb04eJjyO/VB3/RJ8OW0kl9uv
 jgoRknr2diJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaXjlawAKCRAk1otyXVSH
 0P2RB/9yTbG3FRHLDskVDlkgGgSYg7JhZ9cxiHeWRPj1ovt5lyWvgBLhuBM3HodqsBq4Ty/owzl
 kAjypCTuu+RzbzKmlw8HjGsCxSr/0EYJF0PvEwoszIpwBAvbUva0T0qH4AW9ogkbEW2HjtrtSwb
 dKRpRyNzVLXa898bfQQaFKWsAfDoB+EJcB1Kr5AASDiR74MXMbfFkdMPC8vPR6MpPyVHR/SmWE5
 zAFOqlZG+/qMI3sFHyWd6v54SAXgaQHmtEqIBj6A+EVIuo5PPhwSY/yXKvplRvPVcIWzag8Abh2
 2xPTBCR9SX8jDAwksTcFzM8mkSJgxm9fzHmtBdgf5ec/mjgk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_081856_683817_D1810801 
X-CRM114-Status: UNSURE (   6.48  )
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

I was using fp-pidbench a bit recently, resulting in a few small
enhancements which it seemed useful to integrate.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      kselftest/arm64: Add a no-SVE loop after SVE in fp-pidbench
      kselftest/arm64: Raise default number of loops in fp-pidbench

 tools/testing/selftests/arm64/fp/fp-pidbench.S | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
---
base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
change-id: 20260121-arm64-selftests-fp-pidbench-post-sve-cf627394bb31

Best regards,
--  
Mark Brown <broonie@kernel.org>


