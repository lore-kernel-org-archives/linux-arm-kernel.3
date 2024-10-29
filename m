Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EA3D5B845
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 00:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QVZ2JU/20xU0kQoPYg1zbJRW4rYjere1yut8+6KJMGM=; b=Uz4rlbhoIYiSqj
	zk8N2i8SGnqeGj/X1805sw+vlN4KYeqE7EdVAfTNIXSC5DeaMSIA84TYPpeiQtBrkiSSHQSMNHZUg
	aE5IkARd3c8FI2bh3lgDMA5CDMJd3WHgVJ1TUyYrr44z3LxKrksnECWE5wq3nDXwSWTV3emkPajYm
	CsNUfR8gljs6BU4YtWAfWUiJsmPF2jzIWEbDryeoHrQGbI5SUx9fSa+16OQqezNbRu7JhKYJx57Q4
	+xSzljlod1rHvUh9c94qcVhpBtHzDV6/PwEgyZ2/czlhuDHQiIUnhU0qQQt2FUKYGeWOLJGkx/okV
	I7RUkWVEUt4Cvtged57Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ZqZ-0000000CiVa-17Gn;
	Tue, 29 Oct 2024 00:12:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Zox-0000000CiJq-1GEP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 00:10:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 82672A4037D;
	Tue, 29 Oct 2024 00:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9839FC4CEC3;
	Tue, 29 Oct 2024 00:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730160650;
	bh=2Tz4DfrMjjNJi9ttTpQychaPANF6G/ayWTanbXJH8V0=;
	h=From:Subject:Date:To:Cc:From;
	b=R2FSbRKRp8EEO7I9/aX9GBpri1kJmV//sMJs9AW8gcFjm+E4rzVcY7PY11MGXOBd0
	 f/I5/CzoKSo7MrWGs+o4IGYZoQ+iWHnmpU9dcjxSM4JNf/lI74FEP48mKQ5S14CfTf
	 wtBhe0WDnq/Qxu6f2iPjlAqbM0Py3mf69BDX7xJOc4jfz4HqbycR9bWTrFhUa9Y/gf
	 lECL4+GyQ95vwIJCHZgm866AIMp5+q7Cd9BSO6uDh5T/865017dKeANjeZUT/5C0HZ
	 Ouq5Qbz4L7FUX8BAru1JxA6DYB6VbfeUT4y+3GpMV6/7bC51WIO2vLPt95DXJxDDH2
	 odF8mvg4zJZvg==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] kselftest/arm64: fp-stress signal delivery interval
 improvements
Date: Tue, 29 Oct 2024 00:10:38 +0000
Message-Id: <20241029-arm64-fp-stress-interval-v1-0-db540abf6dd5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP4nIGcC/x3MQQqDMBBG4avIrB1IBhukVxEXwf5pB9ooMyIF8
 e4NXX6L905ymMLp3p1kONR1rQ2x72h55foE66OZJMgQg4yc7ZMGLhv7bnBnrTvsyG8eyw1JlpA
 QhVq+GYp+/+tpvq4fRw0y6moAAAA=
X-Change-ID: 20241028-arm64-fp-stress-interval-8f5e62c06e12
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2Tz4DfrMjjNJi9ttTpQychaPANF6G/ayWTanbXJH8V0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnICgGU0fswmFnpjH9LN4ZrQr49oduaAh8GdsoBfN2
 yFkDhzyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyAoBgAKCRAk1otyXVSH0BcPB/
 9jMkqhx7JVBd/zQGP6kyYVjfL5uKJ1XlSlIdrxMaKySUbSFk3vJ+pv1YkmH1dwWPPsy30Z/+6UIfWN
 c23J8QUGbSi0MyneyWn4HfzUylNhUGki6b7dv5Bqd+b7Dv6Wm+o+W5GW8ny5DAUJs1qO5XgEMoxgzo
 w3eWNDnh4IT/pve5jGwEMo+5asj+uXEh1GUUDTM4huRkO8m49Pcg4pnxm+ZqAut3PYnpwdTQH5BkwN
 x6S1cSyAeqoqFxTPB+SetrgNnThH95Z5B+TGKwcXEuEbdFcrG4bN01dh/K0eAZVd7Yrez2mBE+c975
 JPK1923GgMvR2PWnx7479c8ZMEpnLW
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_171051_437517_7ABD2BBC 
X-CRM114-Status: UNSURE (   7.01  )
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
Mark Brown (2):
      kselftest/arm64: Increase frequency of signal delivery in fp-stress
      kselftest/arm64: Lower poll interval while waiting for fp-stress children

 tools/testing/selftests/arm64/fp/fp-stress.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)
---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241028-arm64-fp-stress-interval-8f5e62c06e12

Best regards,
-- 
Mark Brown <broonie@kernel.org>


