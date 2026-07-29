Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599AEC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 18:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7numUu4CSBH0PsQ5xf4aG2t6sq8i7IwHCDYB1qJC7FE=; b=1Vv1LQEQ1KDODI7urtY5ylE7wn
	iylYw3qz6qekTk7yF/QEY5j3ypFFWTIe1mQ5kw0Uh5pwvgVSBjRcLk4YJPse/XN/u8tVIdLdD4rvJ
	mrzXkrVcD+yJUEd0Y563BOqQT8G8R+475ykQITlT6g0mU1y5RQrgKHG5Ya90HwPDUnzi1u8VCL425
	vKaGWK2lxrksnmX1ukC/7hJQdDs2PBQpNyaZ4mH4EKqt5ydEV6+aCJsEeUYPUIz091U0fzIgwY4Tk
	jH0u6mcrHmbiBFkZmZoZhr4h8SuaX4ySaLU8A98p4ImKXigvKGF/YMFhlWi5DB2a6qHR8jTrkBKaz
	Q41z2RiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9IV-00000008qGc-3gMW;
	Wed, 29 Jul 2026 18:46:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9IU-00000008qGU-386L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 18:46:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D883D6001D;
	Wed, 29 Jul 2026 18:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6AB81F000E9;
	Wed, 29 Jul 2026 18:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785350789;
	bh=7numUu4CSBH0PsQ5xf4aG2t6sq8i7IwHCDYB1qJC7FE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hJOdybfcdmzfnZvu7dcAODD8H26LQRXyNgFLABtPYQCJs5NpYUdOhRTZRpAUi/5XD
	 xxBZLdoTitdNtkG8H+qCo/GGE7v8I4ySa+0dYDZyRvzni+sXTRpdu2x1CERezj1SAt
	 mCMBfuWO0tvduBbUuTvn/1hYuLY26p4cbWXtWtBVYeKmk/BrCEoTB29ZbDP0ESNLyP
	 kGLaDa4NJk1u7TPAuxn1fLbYYugXYbTcITTVrvjkD67Z9LOyh6fRk62kEYkqg/2n11
	 fMpzq8+IPuq0utSDPMNwllZnH7V0sDSBssFUOYjDgSl2OYRQC7sV/pDPxKsVxktFVO
	 HW7j6jdtk8flw==
Date: Wed, 29 Jul 2026 19:46:26 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Nat Gurumoorthy <natg@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] firmware: arm_ffa: Call ffa_rxtx_umap before calling
 ffa_rxtx_map
Message-ID: <20260729-nostalgic-accurate-raccoon-ab7d7e@sudeepholla>
References: <20260729162731.1383875-1-natg@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729162731.1383875-1-natg@google.com>
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

On Wed, Jul 29, 2026 at 09:27:31AM -0700, Nat Gurumoorthy wrote:
> In ffa_probe call ffa_rxtx_unmap before calling ffa_rxtx_map. It is
> possible that crash or a kexec can leave crb_ffa with old mappings.
> A call to ffa_rxtx_map will fail and leave crb_ffa interface unavalable.
> The unmap makes crb_ffa forget old mappings and allows new mappings
> to be set up. In kernels where arm_ffa is built in, module exit
> routine ffa_exit will never get called during kexec operation. This
> leaves behind stale mapping. New kernel's ffa_probe call to ffa_rxtx_map
> will fail and crb_ffa driver will not be available.
> 

This is not a proper solution, what about the notifications and other
states.

Now that we have proper probe and remove, just assign or call remove
from shutdown callback which IIRC gets called in kexec. So something like
below is a proper fix IMO(not compiled or tested)

Regards,
Sudeep

-->8

firmware: arm_ffa: Tear down driver during shutdown

The platform core invokes a driver's shutdown callback, rather than its
remove callback, while preparing devices for a normal kexec. Without a
shutdown callback, the FF-A driver leaves notifications, partition devices,
and the RX/TX mapping active before the replacement kernel is booted.

Use ffa_remove() for shutdown so the existing cleanup runs before a normal
kexec and other orderly system shutdowns.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 8654b3365c9b..28abc808fd32 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2225,6 +2225,7 @@ static void ffa_remove(struct platform_device *pdev)
 static struct platform_driver ffa_driver = {
 	.probe = ffa_probe,
 	.remove = ffa_remove,
+	.shutdown = ffa_remove,
 	.driver = {
 		.name = FFA_PLATFORM_NAME,
 	},
--
2.43.0

