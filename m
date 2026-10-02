Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A22CA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=doS8d5OZpw1xxXeF9uWp+A9weIfqE/dyEXBrkjrl1wA=; b=ZPLxIZdxtO3OjVhlbJRgBEl7fj
	qvoGPdH7o1+KfxbaWgwUjTM107f8XAJQ0YuGbwEU1buUgg9hXP/yuskymeR3rjnU7E0lBtFRZ1Oh5
	PyQ8NEuhrIBfR/w/6x4ndlItaAOyYzbACxSHxFOPP8zIoS14McvVAmpy0swNhNdXtAMap3Ud8sA/I
	FueuQxsQfvAiSc2Vy2DoB9w1oesrr6nm4eKEK1rbroo9XVZDd8sdA+IW2tlQps5GwO1EB/7R4Ukwn
	Z5XWBd8tIcBPaKPhtg9rOIZ8RIYumnN0OXHWCZIFTJVXOIVeL3fUNdIc5wrgHEjuu7/RaL+pOCzhR
	OSvXEXWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjEo-0000000CQi0-0gdk;
	Fri, 02 Oct 2026 19:48:10 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjEl-0000000CQhD-3GJd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 19:48:08 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-91791ec1b83so705536d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 12:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790970486; x=1791575286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=doS8d5OZpw1xxXeF9uWp+A9weIfqE/dyEXBrkjrl1wA=;
        b=Wwzw3NC37mblb5Iq/VQNK7Q/XcL70IgZFZv0TSF0uLhV/7MyguGh98u7qViH4a4Lm7
         3PQ9+xCVryJmBlK7BUcP5c9eH9lJ0il49HKAQTtZdeUyvh5o5sjOauViGACll4gTbQBJ
         Bb5LNxS4VogL+fQ2PoyXHZ3C/xU80XzqQ7RvyelfdVj3PIbE9iXHAKHPTtIRP0geWAvy
         7uPSW6g3knbGAXKIaurkabnzkFyKPzR3G6f/lPL26dz+FtbV6CBeon5A4BV/HxS6EZb5
         gasjYeIHPAgFdCvCHrYTTzlH3uKQFVs1kxmRHkhF45syJgt8ugtL2M8P3ToEdJOpTEmZ
         eIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970486; x=1791575286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=doS8d5OZpw1xxXeF9uWp+A9weIfqE/dyEXBrkjrl1wA=;
        b=Hg2DlgUuWkDB2fIZtMYpuzW3GAyseYawegmfaVrxhJdrNimqd0QHIlbyeZESuFfVbq
         HuaKG1BX6+1e5ukjV8NnMjLSN7z0q9nU+zpX7f+KV9Dauf2Plb508/5ijqaE5tBs28Gy
         kaJxzNdxqPlhsdsWPY0sliwTLw/osMy0ltgHzy28RkXW2MvEU5ZSLPp7RPjACJzrDmUO
         eyHIt/VbUcgpOgjgqc2+sk9mZc+/SD8QXJxaMYjMXPqwJ1/iDVIQMlrFwl6hGZsGMGZ1
         MCXdWlO9ZW87ELUZoPuFBauqQqZJZ4cS/wYExnucoDNO1MujQxn+P65yx9hs+EFpSKg/
         RFdw==
X-Forwarded-Encrypted: i=1; AKwUvBwJ4bYGaaHNzeAm6YbbFpwOYpIChnVH8pap+DVlIQSXoSc/G/135V5S73XtNTT0DWGACCqAgPsZJ7zGElNQc9rE@lists.infradead.org
X-Gm-Message-State: AFuF++mvMFDL8gRhsPdmIrP5ndFVcFq6EknCLG0GswoC8QHr+BK+moyn
	yHQvVvONGx2HZVIcvwJH2DixvdD4FEidCuCk2NZlGHGbZnT3Nj4+Wug=
X-Gm-Gg: AYBFou2UxkTS0TMh2cnAhgVlPNzmIKMZQSq0Q2B03WJUlXtHnoHYqBpEZtn7spzew2D
	xF5naWl5ZS3XwjHQ9YGU9irSkT0X9SPMcPXlIfkZO8NnkD/1LbySt2rvb5s74zjqPrMieMHGryW
	kHMTE91PbolZ5asqJM1ieMTIwXOpHy5fDq2bxEl1rL6jvogbQPVAJZ/X50ieK0/Xt6FgotgZWXS
	cuiDVLTPKWb4/SPwxxn8PtTiXQcLZTEHJ9nhjCApW8bAfD147xWykBKRpREyiSyVhsi70DeHLAF
	DGpESmhLftIFy1ZhotOZ9lW0dntxTBhacw9PJHRRuWR1skbO24NiekgUOSUUyGX3pHjkV0o0/oc
	vxRZCoxAMTuCuA6EBZBjaaQnJYrCn86zp6cM1/tPppXRjUIo97qi+2P2pNJuzOTpkOPDPLdqO2F
	7eK1rMgtii6z9bIuSLSw8YxfBT0vSlY+L/9xguVYZNQWBgei5ttoI7c1mZSi+sNPySltltGigi1
	5UtFgemOoAoEAeMDPmDM+3jjSTD5kAdzkEua6rufvFhhVrbBvqNw20tdLpDGHhRoQcBDHwl0jSU
	HnPUz04AH5qdc27EdtIv/M4T0qi9
X-Received: by 2002:a05:620a:404c:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93e51081bbcmr76979085a.45.1790970486211;
        Fri, 02 Oct 2026 12:48:06 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2ed5e2sm296846985a.47.2026.10.02.12.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:48:05 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	mhun512@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2 0/2] soc: fsl: dpio: Fix IRQ cleanup during probe and removal
Date: Fri,  2 Oct 2026 15:48:00 -0400
Message-ID: <20261002194802.375497-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_124807_819415_5D956106 
X-CRM114-Status: UNSURE (   9.77  )
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

This series fixes two DPIO I/O object lifetime issues during probe
failure and device removal.

Patch 1 releases the I/O object when IRQ registration fails and removes
the unnecessary unregister call from the probe error path. Patch 2 frees
the managed IRQ before returning its resource to the MC pool and before
releasing the I/O object during removal.

Both patches carry their respective Fixes tags and are marked for stable
backporting. Patch 2 is based on patch 1, which removes the probe error
path call to unregister_dpio_irq_handlers() before that helper starts
freeing the managed IRQ.

Changes in v2:
- Present the two previously separate patches as a series.
- Remove the unnecessary unregister call from the probe error path, as
  suggested by Ioana Ciornei.
- Move devm_free_irq() into unregister_dpio_irq_handlers(), as suggested
  by Ioana Ciornei, to keep registration and unregistration in sync.
- Add Cc: stable@vger.kernel.org to both patches.

Based on Linux 7.3-rc3 (fd73f4a6659897191fa0d40695fe370925dd3780).

Myeonghun Pak (2):
  soc: fsl: dpio: Fix cleanup on IRQ registration failure
  soc: fsl: dpio: Free the IRQ before releasing the I/O object

 drivers/soc/fsl/dpio/dpio-driver.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.53.0


