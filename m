Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1CDCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 19:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ANhWe0qYmdKcTZKvGQIIz2zwd1hYT8FYOTKZM81v5zg=; b=R2VIHLWHswYUzVKXpAOj8HANGB
	Z3WgKpjHrs11Mcm8/zFPrO7p9n1mgrjwoJVRhbb69FWw+A9pQpNstsTNSQiV4twvGZF4cEBHTixO2
	BV67q6eVGvZmtmv6Yf7XWNT5S4HAmAtXzgeUzi9mnyl6yxgNYbU9y0iy2HV7nzvJPs5rPrj6t9zIX
	GkuHqqeg0xVDZuIFlxYi5UR9eqcnI7AGIJD1SLyCWfHzqq2e3e5DjZVCB7Gfa15Y2U/vchIOw4tS/
	SziGTdaTSxWAGvni6meJq7X8oS408lMvlIoquNtb8cl+jPa2rTF79Q5W+1aWzAz6/c1LKnkLxntht
	pGRclXgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNIK-0000000AMEi-2Mtt;
	Fri, 24 Oct 2025 19:17:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNID-0000000AMBN-0W89
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 24 Oct 2025 19:17:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ANhWe0qYmdKcTZKvGQIIz2zwd1hYT8FYOTKZM81v5zg=; b=lXBKb+ZbMETwxUX+wZ+lLGTivJ
	4RfqnXja2HxcFTCrafnjydSFMfMnHnE5Awk2AS38C/g8/dkKAH6n+9IOnFtpKBYVGT26WIBkqeZ1h
	3klvXemMTUOQ9K8WY5KSDSV27qEmihoS9eACqCp6YG7dVNea2wtpxZEveH6M5h5OpMDsanc6sm6Hb
	WqkHZbaViv0FgNcnxT2F8+SeL8vmKq5dizj+gjSRGxUAiFcJA7MpbjY981Qy9kNOxKljzgazkmFnr
	Xo1kgzGS4xduEbx2eE//5cg8NjtNu/oBZsagp0yb6rrVXrAGONAbrs3TH7XthnTSphe3vB4sRsmnH
	P+REsdWg==;
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMQV-00000002UOM-3fhH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 18:22:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761333446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ANhWe0qYmdKcTZKvGQIIz2zwd1hYT8FYOTKZM81v5zg=;
	b=c5qzPTWLkI5BS8Q9Bxza059jRaigNP0KvcgfSEQz7jCHxGdxyrLpK/C7Z9ApfId+cminFW
	KruiW/u5a4HLo/OfAiaBZ2rN07GHVyznZGXtqnTtvejQ9b0ljIzToxbxRmJkoAL04amwNR
	vkU+iLtPQpZKydeJQBOkXv78wFbq7eY=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	David Airlie <airlied@gmail.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>,
	Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 0/3] drm: zynqmp_dp: Retrain link after HPD if necessary
Date: Fri, 24 Oct 2025 15:17:04 -0400
Message-Id: <20251024191707.2310589-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_192212_078265_E96BF295 
X-CRM114-Status: UNSURE (   6.02  )
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

I noticed that after reconnecting a mini-displayport cable, the sink
would not display an image. But if I forced the link to re-train, the
image would come back.

Some digging revealed that the DP spec requires retraining after a HPD
event if the sink syas the link has gone down. So implement that since
it fixes my problem and it's required by spec.


Sean Anderson (3):
  drm: zynqmp_dp: Update connector state before AUX transfers
  drm: zynqmp_dp: Use smp_load/store for status
  drm: zynqmp_dp: Retrain link after HPD if necessary

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 43 +++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 17 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


