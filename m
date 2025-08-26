Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD83DCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 11:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sse+JASWAhiGrL8IM8MAX4r81dm2IRFOJOQ4hyDiWrE=; b=3ImtcNEi6/I7Sw3s3iHZA5H59Z
	uEbWV3By2mVZ/N11Ul1J238UG5kGnMXcNlOaJVguWtILJ7hty9gOreBmlotNaQ2FrGsAaJ/tVHG3t
	BetkJyeYatdaapdcl0AJqfvv7O6kV3BVFrzssahx+QnBuqnUlj4K7sDuEy3uylDOv1mhOsEJ6F6V6
	1A9oQffnyhMCcikM3CMxnnMGo3DAsxW+WDm3V+XeBG0FEZaSpF5ncGbLSlO7BW2LlPCBPOoWK2dzQ
	625cPTHTXx3yCx97qTXH+wm44JJs1X2mmD9L3APNg3cvL3tXfoVHqjlyzcXzinZuqIlRRnp9rJ2oe
	3cN08dew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqryB-0000000BoEp-3tee;
	Tue, 26 Aug 2025 11:36:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqr51-0000000Be6d-0FeC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 10:39:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14D151A00;
	Tue, 26 Aug 2025 03:38:58 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B1E423F694;
	Tue, 26 Aug 2025 03:39:04 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: cristian.marussi@arm.com,
	Junnan Wu <junnan01.wu@samsung.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	florian.fainelli@broadcom.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lei19.wang@samsung.com,
	q1.huang@samsung.com
Subject: Re: [PATCH] firmware: arm_scmi: Set device ready before register scmi_virtio_driver
Date: Tue, 26 Aug 2025 11:39:01 +0100
Message-Id: <175620471163.1762592.13282724135201643997.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812075343.3201365-1-junnan01.wu@samsung.com>
References: <CGME20250812075350epcas5p1cc4533582704978ec3a4a8b73dc1535c@epcas5p1.samsung.com> <20250812075343.3201365-1-junnan01.wu@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_033907_151377_292604F6 
X-CRM114-Status: UNSURE (   6.19  )
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

On Tue, 12 Aug 2025 15:53:43 +0800, Junnan Wu wrote:
> Fix irregularities in scmi driver probe.
> 
> After 'commit 20bda12a0ea0 ("firmware: arm_scmi: Make VirtIO transport a standalone driver")'
> making SCMI VirtIO transport a standalone driver,
> `scmi_virtio_probe` will follow `scmi_vio_probe`,
> and during `scmi_virtio_probe`, it will do `scmi_probe` which will invoke
> function `scmi_protocol_acquire(handle, SCMI_PROTOCOL_BASE)`,
> and this function will send message via virtqueue and wait device's reply
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Set device ready before register scmi_virtio_driver
      https://git.kernel.org/sudeep.holla/c/e8faa8a466f6
--
Regards,
Sudeep


