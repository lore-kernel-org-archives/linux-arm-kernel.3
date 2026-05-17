Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD4CCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 11:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVWHoxGRLDyWu9GPpz9gfQuLeT4t1l9855poetoXdww=; b=Y3EpuwklJ06kNTwD2I0QaUQPS5
	jA8keVa/s76eyZCo3sDVfPX8t5YBQteIlqKWTyA9Ll93OcZcQ6LqriaRG2R6TSn+oZKCUvWp6mNji
	TpcME1M5CO2+fuQLpFtgMzFLXpgMnu4uZIuCNGKdx1PmErMHwj6bs7F6x2s69ePE0NZZKr9MjnHmi
	eI9kIWpw0qXl6sr712MZsfvGUtkF0m8BqH9HGXJAL+TTedObEKczmSzrjfGZXYNcVOgWF8IdFNReE
	3EJQqpWqyOKlOIwgqi5g6YK7euQb2d9apabmVeZQJVTVGz8scW2tApM89oMT6s6xYmtEgcHghkL8e
	EwIoQ3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOZvD-0000000CdDX-1xOV;
	Sun, 17 May 2026 11:44:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOZvB-0000000CdD2-3fOR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 11:44:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 95CB943833;
	Sun, 17 May 2026 11:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27369C2BCB8;
	Sun, 17 May 2026 11:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779018276;
	bh=uYW3m1pYFVOwcAv+n1jUSpIUtmgXX1A0uFCJX0t8J0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O5m0F391jDBmZqnZ1pp6HOAagISHQ8qvchEHXTj5tr8OvRXBSFWb3QR1LyiDxlnU1
	 g8TgRFmb25zNBN59091G4Y4Pn3FgJSWLo7C50xUwgWh8fdrwerwwtWlG0aHXeOK+cG
	 BOew/QBWGgq8HAqBXRnVV+fYp4E1MsmZf3bKTCxpuog6sD/COBJ3gTuf1XoRNHjVOc
	 Y9bTwv5tZsep34ireJiT2GxIEKrEV+b8d956oFNvwyrzv1vmcy56LvAeBuRpMHo+fS
	 Jv5iM0d0jfvM+5J+uL9XHXJ2pShN1j8OSQweUtIqxRvs7xCZRvod0Neu+tHDzyEHg0
	 sYApvuVEM3A4w==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH 0/4] firmware: arm_ffa: Move core init to platform driver probe
Date: Sun, 17 May 2026 12:44:30 +0100
Message-ID: <177901821586.3837863.815146764281043637.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org>
References: <20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_044437_933223_BF47EF01 
X-CRM114-Status: UNSURE (   8.72  )
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

On Fri, 08 May 2026 18:54:14 +0100, Sudeep Holla wrote:
> This series moves the Arm FF-A core initialisation into the driver model by
> converting the core bring-up path to a platform driver probe/remove flow.
> 
> The first patch reverts the earlier rootfs_initcall change. That initcall
> ordering workaround is not a proper solution and potentially conflicts with
> pKVM FF-A proxy requirement.
> 
> [...]

Applied to sudeep.holla/linux (for-next/ffa/updates), thanks!

[1/4] Revert "firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_initcall"
      https://git.kernel.org/sudeep.holla/c/cc7e8f21b9f0
[2/4] firmware: arm_ffa: Register core as a platform driver
      https://git.kernel.org/sudeep.holla/c/e659fc8e537c
[3/4] firmware: arm_ffa: Set the core device as FF-A device parent
      https://git.kernel.org/sudeep.holla/c/7fe2ec9fb8e9
[4/4] firmware: arm_ffa: Defer probe until pKVM is initialized
      https://git.kernel.org/sudeep.holla/c/3acc80a78e45
--
Regards,
Sudeep


