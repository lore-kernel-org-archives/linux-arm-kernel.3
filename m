Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C4DCCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCwBqZ3Z1Ko+FK+TWDpxFERf1nGdWl32MbXodX0yeFc=; b=rw5Zr5LTOseObnVZy+G6KXDMYo
	xIXWxUPPmK6GOz0gJkIeGGuK+4FLIw1c9NlTg9FJQdKVN+QVoA+bVrJTvG16aDrSX5sQkwvRGgHCA
	hOuhCwk41vEIr6ucfHS7DlgRVMduoNnFFsXPnbuV4hiRJCa8q+UfQjkjevN3R9YNndLHoUT/H6GeP
	I/xIVc3wYzcYKXorAdS26/2+SVmJhns4MyOOGruacqg3ElrLrAHIE+95CPlWn6evCUS0p4UTZhLx5
	UkOwLWB/4mnNa8to/c44KI9dNxySmBSeYdFme+KzRlKU4yHTeb0Nj+RP7ij7CDVCAGM9JZg6LFg44
	VRSyrbqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHn8V-00000003lYh-15Fj;
	Fri, 16 Oct 2026 18:58:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHn8O-00000003lS3-1Q42
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 18:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HCwBqZ3Z1Ko+FK+TWDpxFERf1nGdWl32MbXodX0yeFc=; b=jES0S5MG3rZyPciON5HWzp7GTt
	GdqkRATBAsLGUHd+2Md3fuNnQ+5ejkP12dZVeI3xc6WgdjqnXPnyelIoK7B49WY4EQwsyYqJDO/qw
	fWOhq8Dj7SeOL3NsnKrAjTAG1Qk4+yXl6TgUs2to0u2/yS7PlprhyUiRIViPrn5Ps10nAoQ/8KXN6
	xp/JlrfCO6h/ruvDI7uuX09EqeZjTcaTPs3gvOG6nnHT3uiLpw0+F+n4WfGtd5vb0LFrgufKH9MJz
	8DKspT3NzePvFVbvCbkzhn9iGSArW2TVJwqwX2aaHIZGWzf6TAcZK0bSEF9+rDsMKgTrbtl3u2o73
	Hd1Lt9Vg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHn8L-00000001rvq-2L0t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 18:58:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DE5C1516;
	Fri, 16 Oct 2026 11:58:21 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07D153F7B4;
	Fri, 16 Oct 2026 11:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177104; bh=KpUnK9nTZ9MsjB64snnJysKC48S25Nf2oKGr+4tdw/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F6RxkCWvIVLhtz0MZI7Ca5T434ugOSA1TqTnq+VeDj4bfhDVVT2KWp2rZCN06ixkV
	 rudfO8EKwRgf2KtSeFbtqqT+oAo/SshvHGrO1mgKPUj/n6Y2yOeHWGlbAQSU2o1Ncm
	 Z5oxyVr03OIr6MHx5eKUty7TRmg6rlv/gBzuUlko=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jonathan.cameron@oss.qualcomm.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v14 29/32] docs: ioctl-number: Add SCMI Ioctls
Date: Fri, 16 Oct 2026 19:55:50 +0100
Message-ID: <20261016185553.2794459-30-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016185553.2794459-1-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_195825_737874_A1022834 
X-CRM114-Status: UNSURE (   7.87  )
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

Add SCMI Subsystem IOCTLs numbers

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 2fc53093752d..3a89b2065674 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -401,6 +401,7 @@ Code  Seq#    Include File                                             Comments
 0xE5  00-3F  linux/fuse.h
 0xEC  00-01  drivers/platform/chrome/cros_ec_dev.h                     ChromeOS EC driver
 0xEE  00-09  uapi/linux/pfrut.h                                        Platform Firmware Runtime Update and Telemetry
+0xF1  00-FF  uapi/linux/scmi.h					       ARM SCMI Subsystem
 0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                       sisfb (in development)
                                                                        <mailto:thomas@winischhofer.net>
 0xF6  all                                                              LTTng Linux Trace Toolkit Next Generation
-- 
2.54.0


