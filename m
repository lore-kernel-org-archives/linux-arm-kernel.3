Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B20BC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 09:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhIgUGZ18lv7Q+v1IdlT15kszuimW64kU/hMIic1axA=; b=zYOs/ryrtwH6IR8xffV6j8F6k3
	TGp56axVuo1lSxlL1SnZ2Hn+3a1PLG0vg6Llm+fGy44NAFskyq+ojSEkgOhjjGRzz8xFNiz5BhpL9
	lQiwOaXbLaRsJISosK6wsoLAN9qCOQbvaCrzLEhUJMkyggfcCMmAz+jigHzpmhjzyb0HvaPPiKiW4
	Vz1n5Lu3hWePRf1CR7mE7JSuT67mf3NRaVG4jKxosGgvfSiBK5oHftB4YueUU3n880A6+yjrO/Hlf
	3E+aJB6l4psXvV9a0AKkUfZEqlJmOeVQApigImHTZ8Cy+TjtaU3CtPVXoLbXzc9ewDqs1ZqntGy/z
	Zc/emiuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u250t-00000003Okq-3M7u;
	Tue, 08 Apr 2025 09:12:59 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24mw-00000003LpC-2flH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 08:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=WhIgU
	GZ18lv7Q+v1IdlT15kszuimW64kU/hMIic1axA=; b=XGx0bMi8BRMsBbpatoekw
	rd3HhaG2HW/IYN27+oL11bxCaafPMsV7nKloeC7fiXawZOOG96hnHuwBuEZXngIc
	VA8wlur7pi9hIM7A/N2ZXNMsIXQk57c1pnuuAhbkrbT38Wu6TSHdki7hsVRbiDPj
	/YBj/Ao4DvL4osj+qzzIoA=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3Qksj5fRn4D73Ew--.59429S2;
	Tue, 08 Apr 2025 16:58:11 +0800 (CST)
From: Xavier <xavier_qy@163.com>
To: dev.jain@arm.com,
	akpm@linux-foundation.org,
	baohua@kernel.org,
	ryan.roberts@arm.com,
	catalin.marinas@arm.com,
	ioworker0@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	will@kernel.org,
	xavier_qy@163.com
Subject: [PATCH v2 0/1] mm/contpte: Optimize loop to reduce redundant operations
Date: Tue,  8 Apr 2025 16:58:08 +0800
Message-Id: <20250408085809.2217618-1-xavier_qy@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <027cc666-a562-46fa-bca5-1122ea00ec0e@arm.com>
References: <027cc666-a562-46fa-bca5-1122ea00ec0e@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3Qksj5fRn4D73Ew--.59429S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4iiiSPUUUUU
X-Originating-IP: [101.132.132.191]
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiTgkoEGfz+RI1igADs8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_015835_089433_1993A9B7 
X-CRM114-Status: UNSURE (   7.58  )
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

Hi Dev,

Thanks for your valuable feedback earlier. I have optimized the patch again,
 eliminating additional boolean variables check and allowing the loop to break
 immediately once both dirty and young flags are set. This approach should
 theoretically be more efficient than the original code. Thank you for taking
 the time to review this work, I'm happy to make further adjustments based on
 your suggestions!

Xavier (1):
  mm/contpte: Optimize loop to reduce redundant operations

 arch/arm64/mm/contpte.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

-- 
2.34.1


