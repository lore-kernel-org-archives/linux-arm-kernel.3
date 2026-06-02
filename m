Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F26CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 13:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t9jtpHRRJE/DKOFfDRogyp/xh/qyYac7Jc/ujWsn6Ik=; b=oxzRr9Nd4KOyHYcvn/l9gnwCEK
	5uO+/blX7uZdaigVCuTzhwsWXbSqmASZBGiTo0BhlAFMOyV+2Xcf0Jr8MjAqlcDVkRhs1lBKg3IzE
	37z53g7mlAgdBRmTrpkQw66el+e+KShzw34Vxa4rnQ5TL6WctUQGBU0WC7kQoZwzloElOJ1qviMxg
	fG0VmGmw1DBN0YrWXeM7rWdedbIPYjnqk4fj4MoliqtP9QdBgnVye6UUetc/SyX6f9xjPuoqu7grA
	aKdR3Wd6EQyImGJu6lu4sWYBxqE44YoR5RZBoJ1dhoqIzvOXcVsS4Zmf/keFEwBhEGBqGpMxXW9Di
	zTFTx0kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPbF-0000000D8lQ-18LR;
	Tue, 02 Jun 2026 13:56:09 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPbC-0000000D8l0-0GaY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 13:56:08 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-6604176b575so4080250d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 06:56:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780408565; cv=none;
        d=google.com; s=arc-20240605;
        b=UM4finRoUCgpdoa5kyr76PAcnF0mvRni85C2X5sEjUh3SpYWwB9w/t9/QQAd7d1mkL
         /EMlJszJu7dWIdiOZgKGYkjI8O05r5irSEdmVv89dYt60sALu/hi4U0FBAMTvF+hgMx3
         L+I4ZSKyBAYAZ5679qc/Amf8cC4AT7S0EmzrZDEEoZ2P841v+lmwSpxsHy2WifYhcVfL
         HDGzpPnP0kgKIfBu77r6ZHVglIG6cNymVGroU1WfS8+5e1/FJJo2awXNb32yIQHYgR7N
         MTtUYXO5GrNZR7fYQUGfNNudLW3e2IzAJx34TjKHCd+JhAZOby1v26SawXjsAX5lx5Fv
         mk9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=t9jtpHRRJE/DKOFfDRogyp/xh/qyYac7Jc/ujWsn6Ik=;
        fh=ngnzniW9/251Blo+3H7OvJM/allDljIxuXeYmmxYfks=;
        b=UqKIFtuUwrK3/vV38XrnhCkCRT6pDb3/DfUzvoWziPND4IWRsiDsN79tL/RYX3Lqqk
         ZI3bccNGaZAfxJWBX7DDZauGMSQb5WRStBeJ/PUwN+ZBMCsr9aV9TbN6eag8j5F3ctEH
         R043Fr7/X40sSHgOAeiBTY+aLu2YyOoYtMbI03mrPHLqVUM4xYsYdk1NV4+OlXtJP94U
         Ani0aMRlaPywjo7Wvjf4jcd98vU7YUiLOmckZ7ln4v0aGei9qwD01kDL/FhIkKBTXIzN
         l5HV2EXbskl+KVYH81Wic9N1gLT8MR2en9I0eXecwWO73R5cDVTSQ5PXWuO+z6g7Szyy
         urIQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1780408565; x=1781013365; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t9jtpHRRJE/DKOFfDRogyp/xh/qyYac7Jc/ujWsn6Ik=;
        b=EFsH5l4kDvvgZAeUdIgcyyaMIxVdcWSUDg8Jckl8kt9FsltQ2KF+/j89LPGGspo9LM
         qeEEhFY8FCf44OmK6LpavUs1EnY6ZZSx6bhqvqaMg+JWBYipzIMtIiwrGHnvSH6zf7JO
         FX2Wtm1LQ02u0Ac6y89USfRWBmOTA7g579jYJJkBnN8i0P6wsoPtXoUcJYluQBR8G7kw
         QynEQMihachIgqo1Y9QXv44pkmBAZPwJW1kbjsKDvEDfc0hVcJ0pd4Io/5/GWimVwvoh
         8zSDvBc2WpI2c4M+CUhSomaMX7ac8+CDA9iFqTnlBE5MacFNBJAhmgDLI3A0ZEVOtuTE
         Lxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780408565; x=1781013365;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9jtpHRRJE/DKOFfDRogyp/xh/qyYac7Jc/ujWsn6Ik=;
        b=KTl215dEegto5nANScdlhn4URYGbr8ZDZyv9xwNvxyL6ZKHixIpOY70t6n0ZGYhWk1
         xzVd0EpjigY034xXSrISfHvinOFbu+7aWYn3oqsB38rK9aEaxiqd1/pbTbl30sTs4/h0
         kdZihX+TAgVI5qy9tZ4L02MK9ohrqV9zGg0V6PZ7EbWyu+H345nlmYvTUzhq6DXzuVQp
         m38i+CmHzhZjoLY1zwoS5G55a3ij2jg9fa+I1KSN8kvHCLaeGcpHhERL6z8NPix4yfRL
         NEwm5qlcYnoa4ipVz8uXJvMcV9aKJABrf6zZOGLhGOyh5UQhH/KjOviGN0Zof2VkmShe
         gwWw==
X-Gm-Message-State: AOJu0YyJtT8hNSdDOL6MNsB6/QfLwsnxrnSZy0FmycW1du/9Ct0suJf4
	R8mhkNVSujcwyGr0kZateCzzBRYpl79J4GGIaMvqSb8Z/IU84wSfDg5XrvgLh9d48TW96LL3X7o
	KbR9HVn5UsYHEFajZiRcqOO33R7TtOMT67Ec9+uZ0EU5vbbs/HR824W31
X-Gm-Gg: Acq92OH7hEzZJcIAEOAoFmcfV3+nQ3c9/JeAA1Xt54jMOKHxF3hDdU2ly4HBfLxA5GL
	NARz5n9wSrxtEGQ3yzpM2xb2xGV1rB733RsmO59aRQZ6nNdi90KkUupZ13G5QGdAPjwPMlufhCv
	3WWZorfFaqWXUeArv2O+nWXe36FCZGwWp4P0y0PxJT5Ws2YyapuoT9t8BTOZOLH3B5PhmkZlpdf
	wrCz+WC4hOIAfBYr+v2WxjqnAAmglVgMXeIRYx8Spj4nr6NuUUG0oe2oanxwgcfW/pQsGzkK9uX
	uFyTAPDpSmVsrexQbMxNmyYX9CdWLH8alfpEF7lZ94DSYqwlWGU=
X-Received: by 2002:a53:ac81:0:b0:660:55e1:5bb0 with SMTP id
 956f58d0204a3-6605edd30e6mr13392101d50.22.1780408564617; Tue, 02 Jun 2026
 06:56:04 -0700 (PDT)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Tue, 2 Jun 2026 15:55:57 +0200
X-Gm-Features: AVHnY4L18eyVlhjycUY5iNpuboxB-7Rv0SWEmLrcTIjnB41jeLOIdSTZeBHV958
Message-ID: <CAHTX3dKJBTQ9TF2TeTTjsWBo9bkV=39b5YjTG7j+tqct0Q-E5w@mail.gmail.com>
Subject: [GIT PULL] arm64: AMD/Xilinx SOC changes for v7.2 v2
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_065606_127099_211CBDAD 
X-CRM114-Status: UNSURE (   8.58  )
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

Hi,

please pull these 2 patches to your tree. I have removed that 2
problematic patches from my queue.

Thanks,
Michal

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-7.2-v2

for you to fetch changes up to fdee7c66c0d7b6869c36b9f9a915abf29ab5b550:

  soc: xilinx: Shutdown and free rx mailbox channel (2026-04-30 12:50:05 +0200)

----------------------------------------------------------------
arm64: Xilinx SOC changes for 7.2 v2

zynqmp_power:
- Fix race condition in event registration
- Fix shutdown and free rx mailbox channel

----------------------------------------------------------------
Prasanna Kumar T S M (2):
      soc: xilinx: Fix race condition in event registration
      soc: xilinx: Shutdown and free rx mailbox channel

 drivers/soc/xilinx/zynqmp_power.c | 47 +++++++++-----------
 1 file changed, 20 insertions(+), 27 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

