Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89760D74957
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 02:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sP5xpZduj43TYHlaBf4CywJfHfvvBC3OdWLfWrB8Hpw=; b=aPWhQuLbc/XF/k
	tkO2MdfW3QwCSlZrMftRw2f45+aima1+Z9ZdO2KA3SXkgWBEhai3lZxRC3jrG7p2bVs7lDEF/RF7l
	gioLHGxYXeIAkQ60S+kIzoARbncqfyxhM3QohUSkvy20GJftnMq/gV7Huyga+JwdmRp58TAT7S/Uo
	iTJuVSHem+G2GSY+vShp81U2IQqHTKCUOgz0gx+2cxkR2oDgnob0YlxaMbsKN4zZXvyj3q8n4puIF
	DgZKSR6p9MzOW3slbRBRYi7lUDzwZN2UaueIoIg/3Qq0WLWzuSEFIB1r2QGTQVVqkHxxzpA7O6BjT
	7klu6Cq3ZRdNdLhv5FCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5yTq-0000000GWXf-2I4W;
	Wed, 30 Oct 2024 02:30:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5wAD-0000000GI5V-2ym9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 00:02:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E4065C4BBE;
	Wed, 30 Oct 2024 00:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42770C4CEE3;
	Wed, 30 Oct 2024 00:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730246536;
	bh=vfX4nbW4kowy7IUtSJ8IaSqrtLKsP7rLoMKjBgXuBGg=;
	h=From:Subject:Date:To:Cc:From;
	b=mGabhJiWp2yr+cfAuEkEMIOVXMD5r3xovvjDIeNhn2eh4AAkJ+KYxmHZyWeACZht5
	 Ifa9eu7Upu+sKHSZZuWA61YaufGHR6uQNQUS0kyV3ZfHSYxlrvL3Ap29Q4+3krw5MT
	 9RRYadhEJN5Np2L/AwPGTxgSWzdbNChzWY6UriSLzKyccTll2qblJINT5Hn4Ut3qxG
	 000XFXC6Tq9wKElRGX3Yv9xxHtW8cJb/gjHXAA+xsAg+P3FsxN8QXdNx0yyNw/h6ez
	 tN8Ly/AFCV3Y0PsJi3JVov580ZoWc1oxA1S2zdnT6R2ko+X9+GGTWh9Ui1CX9X7wpt
	 G0QzO27WicusQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/2] kselftest/arm64: fp-stress signal delivery interval
 improvements
Date: Wed, 30 Oct 2024 00:02:01 +0000
Message-Id: <20241030-arm64-fp-stress-interval-v2-0-bd3cef48c22c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHl3IWcC/3WNQQqDMBBFryJZd0oSNNiueo/iIpqJDrVRJiG0i
 HdvKnTZ5Xvw399ERCaM4lptgjFTpCUU0KdKDJMNIwK5wkJLXSupW7D8NDX4FWJijBEoJORsZ2h
 9g0YP0qDSosxXRk+vI33vCk8U08Lv4ymrr/1FL/+jWYEE1ze1tL03zjW3B3LA+bzwKLp93z/OA
 AytwQAAAA==
X-Change-ID: 20241028-arm64-fp-stress-interval-8f5e62c06e12
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vfX4nbW4kowy7IUtSJ8IaSqrtLKsP7rLoMKjBgXuBGg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnIXeEQX3ZnpyxHhcbEA+5T7ZncKjnsWPSGQng27oY
 QhNxq8yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyF3hAAKCRAk1otyXVSH0JTxB/
 9GTxbnEKrWGh2epcF+v4WIllG00TQeqlIs6DOZ7YsmXiF6C2wQ8+A11TnS+xsQin8dNyb4Dy5dhAc9
 HTq0yXhY9o96J4qY6cZ7EojkCXuPp5j0V8c1BfbV9hp/pfH6RFkpEev5//vbh+1uqpU2ANqV627Byv
 xIcQ9Q69xjWf+y9SXduHqnVRRZmejm54CAaSY15zgZfQejQDaGDeeqLrTtk5vawxvWZca4NvtoydFM
 1UD6Zwcr+Fa1dQuzkywYFK4ONqDJ7Z5/AihGQbRIRqE4YbY4zjrrSpoBuM/+08UYanz9b4zAt5ud/2
 EOKnq45ZKuAuirtIG9bsRMiKhG8I4/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_170217_829370_7F226772 
X-CRM114-Status: UNSURE (   8.46  )
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

One of the things that fp-stress does to stress the floating point
context switching is send signals to the test threads it spawns.
Currently we do this once per second but as suggested by Mark Rutland if
we increase this we can improve the chances of triggering any issues
with context switching the signal handling code.  Do a quick change to 
increase the rate of signal delivery, trying to avoid excessive impact
on emulated platforms, and a further change to mitigate the impact that
this creates during startup.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Minor clarifications in commit message and log output.
- Link to v1: https://lore.kernel.org/r/20241029-arm64-fp-stress-interval-v1-0-db540abf6dd5@kernel.org

---
Mark Brown (2):
      kselftest/arm64: Increase frequency of signal delivery in fp-stress
      kselftest/arm64: Poll less often while waiting for fp-stress children

 tools/testing/selftests/arm64/fp/fp-stress.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)
---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241028-arm64-fp-stress-interval-8f5e62c06e12

Best regards,
-- 
Mark Brown <broonie@kernel.org>


