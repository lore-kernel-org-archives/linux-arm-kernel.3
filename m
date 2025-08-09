Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C108C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 14:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aznsChEM+WoisLGAIKR8ZbxxtZ2H4YnPFrUkMLSgnvw=; b=dJYFIuPtfGlecOUfJdp+O4hVAO
	nh/RPH/znO0I4CTFmS15ECZLqFi2yJYf5f4zNWJ5O/chujPjEdoLMOjzHbKayCjFsN2QQTClXO48i
	CS7XBbyjF8K0tOhRjzSQkmyUPpM2jRyfcNYp3YK3KH35bzJqww3Flga29WCiYdhdizeyvEkB/mukD
	IAN1qxygFrhExAQaQJwTKjw0FIXIGDbQUHcVsK0oUaFbDo0+ytYZhycG+PcgV1KHKF7TbtdyGlz26
	4z4d0ogZMbok/G9T2UAGC+Ak7WS9ySFAiW9Rg0MQxsYwXy2B0t8r90yfNZtBlVHn0XOzhKsmQBf/5
	6F8mkm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukkQG-00000004Z1L-3sBp;
	Sat, 09 Aug 2025 14:19:48 +0000
Received: from smtpd7.iitb.ac.in ([103.21.126.62] helo=smtp1.iitb.ac.in)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukkNj-00000004Ypd-1sr4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 14:17:13 +0000
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id C5538104D001
	for <linux-arm-kernel@lists.infradead.org>; Sat,  9 Aug 2025 19:46:37 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in C5538104D001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1754748997; bh=YM/Qx7TWNpPuVxR9Sit+N+WIa6f7xmuztDnSOFGV+/E=;
	h=Date:From:To:Cc:Subject:From;
	b=h0LcXw3H3mYYET7ylkrl+IohQbWw6nGzNhpcN2qGuvLxD9egnZIWZWxVCmHnfgUEg
	 j59slYikDcy88tcqMmZCe0l3jMzksVLXpGjg2RUz0nA/ghCAfez5tBu7anmheDFkrE
	 xqQR2Xo5M0foO3ITLYI7wpdBsV5TjwGHTEEm62NM=
Received: (qmail 13183 invoked by uid 510); 9 Aug 2025 19:46:37 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 4.350738 secs; 09 Aug 2025 19:46:37 +0530
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 9 Aug 2025 19:46:33 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id D54C8341554;
	Sat,  9 Aug 2025 19:46:32 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 982101E81308;
	Sat,  9 Aug 2025 19:46:32 +0530 (IST)
Date: Sat, 9 Aug 2025 19:46:26 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 0/1] cpufreq: armada-37xx: use max() to calculate target_vm
Message-ID: <cover.1754747830.git.akhilesh@ee.iitb.ac.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_071711_734552_16076931 
X-CRM114-Status: UNSURE (   9.36  )
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

This patch is motivated from previous patch [1]. As per discussion in [2],
I have tested the patch for build and no additional include files are
needed. Build works fine. This change is also reported by kernel test
robot.

Link: https://lore.kernel.org/lkml/20240822074548.1365390-1-11162571@vivo.com/ [1]
Link: https://lore.kernel.org/lkml/2c55fb07-b29e-43e0-8697-f75d1f0df89a@vivo.com/ [2]

Akhilesh Patil (1):
  cpufreq: armada-37xx: use max() to calculate target_vm

 drivers/cpufreq/armada-37xx-cpufreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1


