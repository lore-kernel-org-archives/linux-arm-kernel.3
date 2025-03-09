Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D85C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 19:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DaUClHKbrw3O3VoC5TI5qZwqGGAi6KJugps1aNy905c=; b=HVs90JhDRV0tEXBFZKNUNpMZpu
	aDN1QX8HWIrPXbiUFKRkKvB0mf5MEmVDE3eNSAivZQPoGJ4eR/vBnhZRAiTbmI+6B77HiKIp3SExI
	1n6WUgwjH9VcNySdGPi9bZVyuEgr3J5bolxxwft/KcabnvbG1DUAaIPwrMUMXSQdev+cNBcw9pS6B
	Vx0v7udHB19iLuie2EStp4gIvvrHSSvcVYaUVQ1mouoj6JksNQvDlR96+CrWxBaeZ5lDvEqA1lFEO
	v7b1LjzUAzlXjr1be6UwlnDkQ26smzn0DVn4KrRiQklF5VRjYuMPYiGc9BnzPvsd/CmxGy5kopLcH
	ixHE6tAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trMgi-000000015zH-2avn;
	Sun, 09 Mar 2025 19:51:52 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trMf5-000000015l3-3QmY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 19:50:13 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9BE011140126;
	Sun,  9 Mar 2025 15:50:10 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sun, 09 Mar 2025 15:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1741549810; x=1741636210; bh=DaUClHKbrw
	3O3VoC5TI5qZwqGGAi6KJugps1aNy905c=; b=woALsv8FyOgj8kYQA2rUo80QBC
	z2wp7bM167KITuyD9pzCV/pcoPNc8bjUNMgYWuqDDTjV8Biv+8kgxudPfJ1EEfzt
	0s9gDCspKHMaMsIXPhXFamWeN3097JBiDVTVttHowq46t2R0cxDDyr0jiXZcqmAn
	QYEZW9/6APuDw9tdviCJWHj5gnsglZkH2yFfZpgPFvdXkgCW9K0WnZIpvRPpebr/
	wXsQSfm6u0GnZJnozLlGdiKQQyWeeWamQC69E31gK6jY2vNcnu3VE7yPo4dvIjRA
	90Zc4eZR171B+vHBYpjR64VL6yk3XinD+fvcGTuhgVtNwOZfDqA0wqxV6uCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1741549810; x=1741636210; bh=DaUClHKbrw3O3VoC5TI5qZwqGGAi6KJugps
	1aNy905c=; b=ShV/1LmmFrGPE6HYczmAX9GCGEss9pPdhLj2wSGtdu1mHlnPghe
	wX2YH+i0vmfcSxgwhVi8DmzYFHyQhzWa6HsZpjBU9EGi3hRYbMLQ1lgDpQJM+/Gc
	bwiHTMma1iebDwHx47PEMp9rwnBE9hz2wPtmyVpx2lf7kDRqnN9E7YbesJrjZKhb
	dvf5u3CuvJ2XV4jAQ0qtIXmRcOh0H2t2F2bqsrhS+k1v3A7HK9M3xq2YYFgFBysW
	BO7IWnDpZLSWRj8kVpcvkM1YZXDOsUTK/WyAfZ2ytzTyhvmp+GaKQZ7QMCDtP+16
	Ib+rPrnYifuFi/94rRsYZEpQBA62lGoyLNg==
X-ME-Sender: <xms:8vDNZ8q18oWNmIYj0GAuYMd8yGee5y_xdXmLyk7FPzjzeF0dT4WqzQ>
    <xme:8vDNZyr_2CG-UAxaCjdRC3E7zZgccatvH13yorIqCxrw16LDrvu6mEwkWMH_ogHZb
    k3OyWayBgK3ShiMfco>
X-ME-Received: <xmr:8vDNZxO5vPxSDic7Y4BBrc1UPBjqCFehqIqfwNPJ2NmxCd19CJOsORwbyb4kFtOvW6aKQpnEDKRb9rgcJ1NUZLAOabW4SN6h9xdXmhUCP0IZK6xA9B_FjJMbwvy6z5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudejfeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcurfgvthgvrhcuoehs
    vhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvghrnhepudeiiefhge
    etgfektdeiffekhfejgeeikefftdfghfegveegkeegjeetueffvdeinecuffhomhgrihhn
    pehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghrtghpthht
    ohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhotgeslhhishhtshdrlh
    hinhhugidruggvvhdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdgu
    vghvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinh
    hfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:8vDNZz5LCYcM-4Ppa7AOKDtq9eMw4qvkPyo7O6E5GGTjFOQrUg0CWw>
    <xmx:8vDNZ76B-jVf8fH8XvgGOXO04NF6RiEP9cuHhoqBvuqZzEIvRgRLcw>
    <xmx:8vDNZziOSOwVrP2G0OqvYplgvNaDUX78kx5xkWtOj8ycUg_EOVmVkA>
    <xmx:8vDNZ15v6OjduFyzo4Pi3I2viOjfp_9VVrBiCA9gNqPt5nRibJ6_fg>
    <xmx:8vDNZ-1LqTIRdsGedz1GOZetkVdp4JoVcWROu9GVApsj5VXiiW-Tzyhq>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Mar 2025 15:50:09 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Apple SoC MAINTAINERS updates for v6.14 / arm/fixes
Date: Sun,  9 Mar 2025 20:49:26 +0100
Message-Id: <20250309194926.51824-1-sven@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_125011_926941_83EB61AF 
X-CRM114-Status: UNSURE (   8.64  )
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

Hi Arnd,

As briefly mentioned on IRC we also have updates for our section in the
MAINTAINERS file. We're adding Neal Gompa as a reviewer and I also picked
up a patch from November last year that got lost (ouch) which adds the files
for our SPI controller to make sure we're CC'ed for any patches.

Please note that this is based on 6.14-rc5 like your arm/fixes branch
since we would otherwise get a conflict with previous updates to MAINTAINERS.
Hope that works!


Best,

Sven


The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:

  Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)

are available in the Git repository at:

  https://github.com/AsahiLinux/linux.git tags/asahi-soc-maintainers-6.14-fixes

for you to fetch changes up to 3a0d2facfa645ce2fca794a1105d0634ab722008:

  MAINTAINERS: Add myself (Neal Gompa) as a reviewer for ARM Apple support (2025-03-09 20:34:36 +0100)

----------------------------------------------------------------
Two updates to our ARM/APPLE MACHINE SUPPORT section in MAINTAINERS:

- Added Neal Gompa as reviewer
- Added the files for our SPI controller driver

----------------------------------------------------------------
Hector Martin (1):
      MAINTAINERS: Add apple-spi driver & binding files

Neal Gompa (1):
      MAINTAINERS: Add myself (Neal Gompa) as a reviewer for ARM Apple support

 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

