Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40CDC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tgIv5uDPfYYFM3FHtkhTsZGkNT2/xL77irb2ZwO/EGI=; b=rrIsADxn2IEI1I
	HUjKpdQw9QGX30JxUuY/sXwm1fViB6KjA+zVchm1ShmzhIDGciChmucMFSjYgxuGP/DGZn33uPRLt
	FgdK26dXBLs2cR2O/lQAVvd//GHdWh2O1SvICr3B1ubTcg+668OSWCMgVrjGuCh5cmpFls9FBy7qt
	VHW9L30guCZDBFUd46wWHiBnzYY9FcadcaJ+nY6mvsDrjNqYWNj00tKo9DpAMkwVOhF3zXTsCQoSx
	yF1coW0nRqDF5Te19MhTf3FZMhcNcIROgxKvX0/jv72nyyZWvVsrTJ5n87lAZNFUL2yII4YfeO4Wi
	/43JfVECWjJZcjm4D6gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKcR-00000008Jsm-3kQ5;
	Wed, 12 Mar 2025 11:51:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK37-00000008E5M-2Hwh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:14:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A424F1516;
	Wed, 12 Mar 2025 04:15:07 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5029C3F694;
	Wed, 12 Mar 2025 04:14:56 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 0/3] firmware: arm_scmi: Minor cleanups in the scmi bus
 layer
Date: Wed, 12 Mar 2025 11:14:31 +0000
Message-Id: <20250312-b4-scmi_minor_cleanup-v1-0-51a514282794@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJhs0WcC/x3MQQqAIBBA0avErBNySpCuEhGmUw2khlIE0d2Tl
 m/x/wOZElOGvnog0cWZYyiQdQV2M2Elwa4YsEHVtBLF3IlsPU+eQ0yT3cmE8xB60QpRu65VFkp
 7JFr4/r/D+L4fuE+v1WcAAAA=
X-Change-ID: 20250312-b4-scmi_minor_cleanup-8f85228d435c
To: linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=VUNxvcijs9An1927oTqaVDUsqXThCsE8zDBbKNgPFgM=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn0Wyv+r4TxXoykq7/MqdrURg1YjQ7n8aXimBFz
 ptftFiObS+JAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9FsrwAKCRAAQbq8MX7i
 mBP1D/4572Ajb6FerMAMnnM3+eHT0g5YxZEa4FILIZVOq08RjCnl2SRahboEDrPyc9hjmKd3GIg
 Ou0+2xer7dM2L1o9cTFrIDr5MT5MyK1/Kn1AvPT345lHcVFf/U1doDEJLdlA03dpEl9uE7PXPBE
 EVSQ+0qIR4Mtgd6Li+mZC/KKjsTZd4RqZL7OFs3quZXGeqixWog5MFAA4DkP5XQhfK4qZR6HpNQ
 5/le0qRDSwouE92rIZkjs/D3tz5Oi48P0DHsxqS+TxXS6Pynin194U/8CBGYRoRpjNHG+4VA8E3
 twVtgolf4uTrmPQiblXz9BOKNj34WgiRRFo5qXWXojFmdZmSRIxgGU3clL7mjnP8ThvYD0hVIoX
 5QfK8HQ82tTIwwb0073koIySpHI8KrI2bwOcUwJ/geL5tZbfS2UNIKylRGOzJkvpzCstLP4n8Jy
 EtdpBA1uwH4VU+JKETUrbDRZkWcm3RaPoPceDya5DtUlfEtcl396EjB30ZFUrKfsl3oN6NGArQ3
 B7PYKb7zx55ZA2Wz3dXSMuM7HtAyX8p2yJGfLDa8FLNscYzem6G5nhragRsMrl8ktRXROUvQE1z
 4RUEEVZQjDZE2WJPfk4fEy8SQE6h+1IFSVBljkblobRIfTLPFVvJ5FzPdlR28vhK3jsMHnD1h6X
 E/tpEEXPndoe0Zw==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_041457_632586_A2EA45F4 
X-CRM114-Status: UNSURE (   5.21  )
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

These cleanup centralizes error logging for SCMI device creation into a
single helper function, _scmi_device_create(), consolidates the device
matching logic into a single function, and ensures that devices must
have a name for registration, removing support for unnamed devices while
matching the devices and drivers for probing.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
Sudeep Holla (3):
      firmware: arm_scmi: Ensure scmi_devices are always matched by name as well
      firmware: arm_scmi: Refactor device matching logic to eliminate duplication
      firmware: arm_scmi: Refactor error logging from SCMI device creation to single helper

 drivers/firmware/arm_scmi/bus.c    | 75 ++++++++++++++++++++------------------
 drivers/firmware/arm_scmi/driver.c |  8 +---
 2 files changed, 40 insertions(+), 43 deletions(-)
---
base-commit: 80e54e84911a923c40d7bee33a34c1b4be148d7a
change-id: 20250312-b4-scmi_minor_cleanup-8f85228d435c

Best regards,
-- 
Regards,
Sudeep


