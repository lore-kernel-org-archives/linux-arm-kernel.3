Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5EDD44D42
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 10:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=19QztSNR39Yv8poxA+mfIzYPMb9oWEv+tHdPnrrM4pM=; b=b4m40/reVQXSIXJrQ2tgLqXueP
	hriZI500szOXlPhGjQ/m7LLqjnxkc1MNkrjxSsvXWrHRhIJAyoIy/KORE2GMQTdK4PIvuf9S8PKCg
	PaMdQDTeDDWQUUyUJHfpnrIeyFXT5DDbrUjIAQN4BVGWOxaQaj0jpSCjGxpxNLr4IyezuFHPDj8hG
	4qDrQPRVUzf3UT+ZcOPQJOc8gjm/+2Y+RSSoWySEkZUZ9i52y1SyPDqETf8Jrr7LoWrAYiy1QtbgQ
	CPyUsjMGDLRuY1YV4EvOjvmGZ52l0G7odOp/hEKmaUJqQAhXwr5470q2Gx0fv19mGDSbwDWMqsQXz
	PP3RspIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dKt-00000002krA-3aVC;
	Wed, 06 Nov 2024 10:32:27 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cZW-00000002bEk-1hgV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:43:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1730886205; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Cf0amWWIstvFR5QgZScGuFWSe/ptlLRmdNgB0XRtJ5Ld0F5cb0s5WDBEc1E/ddl0qRKID9o1cjzllsML2ukNFI2qBbl+EvaXx+9KaHcRG1PLIdpKLRlMTobXzdqgZ5uorTJLdG7BrTAtWbxeRoGu/Nr7IQL/vWtZTmzKDTc3APE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730886205; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=19QztSNR39Yv8poxA+mfIzYPMb9oWEv+tHdPnrrM4pM=; 
	b=QsFmLpCBZ+fXU3SwIe4DymZPOpmmFevvc6cys5DX92jCJkzRfmdhhFBn21gHz967IpDKexylrzrzi9Wg2b129wCWDesA37bRLn/3AqODgExC6320832SeyarJ0uuyrFuQMB+DZgkJBAbNFk4FcX9sK1L7QTJdGiI6H0mLWuaxhY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730886205;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:From:From:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=19QztSNR39Yv8poxA+mfIzYPMb9oWEv+tHdPnrrM4pM=;
	b=dJJ1Xp6tPrD0aW1Sfldn8aFMJueS3VBTcEhlG/QPeKwKshxQRYrKnVcKRa7SpAb8
	DUnr3Hp+zFibfeSPwCIif/mMgjSZChb3jW58V19BYaxrRbW3vrsyilmIVjRcGuxBNG8
	u5KyxAJ8VMwFpifQFhuMiHjLPVr4W7XH3KlPHbNU=
Received: by mx.zohomail.com with SMTPS id 1730886202930134.79232865862105;
	Wed, 6 Nov 2024 01:43:22 -0800 (PST)
Message-ID: <83aac8b2-f80a-46b5-93fc-3369b30cbfc7@collabora.com>
Date: Wed, 6 Nov 2024 10:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: IMX8MQ EVK board not booting anymore with v6.12-rc
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_014330_535175_548C10EC 
X-CRM114-Status: UNSURE (   9.65  )
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

Hello,

I notice that my IMX8MQ evk board doesn't boot with the latest v6.12-rc*.
After bisect I found the suspect commit:
   commit b8979c6b4d0d1b36e94f5bc483fd86e38107e554
   Merge: 7b17f5ebd5fc b62800736f61
   Author: Linus Torvalds <torvalds@linux-foundation.org>
   Date:   Tue Sep 17 10:48:09 2024 +0200

       Merge tag 'soc-drivers-6.12' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc

I haven't been able to identify why the kernel isn't booting anymore.
I have udpated u-boot (v2024.10) and firmware-imx (8.25-27879f8) on my board.
When using the commit before or the tag 'soc-drivers-6.12' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
the kernel boot.

I use the following command to cross-compile the kernel
ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make defconfig
ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make

Have you been able to boot IMX8MQ evk board with a kernel version since v6.12-rc* ?
I don't have any log since kernel just don't start.

Regards,
Benjamin


