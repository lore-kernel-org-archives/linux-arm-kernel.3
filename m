Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3768CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 17:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8cDwbI6Ask6/GbvU2GKcfXiQqVhjo5QPS67vLZ8CScU=; b=10ifXW0CQ8xznLNgVoakWVT/Xc
	6SbnUAiHat7tB5nURIsedJQoKUMIV2VzMBDpeYpWrjPo38KjGP6KSnjeTr2P3jBP+UHcx//1ufwJQ
	AoyKW0bUVeLddhai8pTyfz5LFQXU9L+um3NE+mFqE8nvHMPnaPAK79cTxA1RWW8eYcxM/1whuRycd
	X/Briy7dbFvcUi1O9Goah+QWOEUx1SYbZXmEpx1ZE4c7WzfjBeV/LQK1YNKhSfKyGNvOs596+M9wo
	GkPN5Qsw3qkt6gvI6iTbjiHHf+9uBQIzjb6ntouk85/OYx+mzA8755VMEl5QPKVU/VBAWp+O4+QsC
	UN2wtzCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3Mb-0000000Fyx2-0d69;
	Thu, 06 Nov 2025 17:01:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3MZ-0000000Fywl-1SlP;
	Thu, 06 Nov 2025 17:01:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C0A686191B;
	Thu,  6 Nov 2025 17:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54163C116C6;
	Thu,  6 Nov 2025 17:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762448490;
	bh=J7xO/f4kJLNRCPcotB9OeBJW6lh9aFBrk8x0FbgwUjs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=E9EEW1+M0I62A5N5SNnFRx5LP7H5lCHyXtKMkd4bao/9oqiX63Q+8rDhHCWb8NaFz
	 fJwPtvNDqGCPxNhYg3IRTBdqPz4ucMFEkPqqdkbr9vhbAvBd19oVXP9lRY7lOuZT64
	 vva7cLHfh/jw+NUvCo+OM4w0VNChD0G3AYuLQ5ikfvEgI46sff6iYYH+0ugbpopD9R
	 FCCpms3e7ccYv3KTxGIbineLPvrPwGMC456/Wx+CRr5QpZkCGIENzp+/8SWqCW853r
	 tj0wtC2gPPc9s0fKNv6B4A0YjygtUNm2gZS3aCFpgnBtEkyuoVwFDcH55g/ganIYvs
	 QlYY0ZXqe3hAA==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-pm@vger.kernel.org, Stanimir Varbanov <svarbanov@suse.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Lee Jones <lee@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Willow Cunningham <willow.e.cunningham@gmail.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Saenz Julienne <nsaenz@kernel.org>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Phil Elwell <phil@raspberrypi.com>, 
 Jonathan Bell <jonathan@raspberrypi.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
In-Reply-To: <20250917063233.1270-4-svarbanov@suse.de>
References: <20250917063233.1270-4-svarbanov@suse.de>
Subject: Re: (subset) [PATCH 3/4] mfd: bcm2835-pm: Add support for BCM2712
Message-Id: <176244848608.1964097.10492891348357972327.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 17:01:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
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

On Wed, 17 Sep 2025 09:32:32 +0300, Stanimir Varbanov wrote:
> The BCM2712 SoC has PM block but lacks the "asb" and "rpivid_asb"
> register spaces, and doesn't need clock(s).  Add a compatible
> string for bcm2712 to allow probe of bcm2835-wdt and
> bcm2835-power drivers.
> 
> 

Applied, thanks!

[3/4] mfd: bcm2835-pm: Add support for BCM2712
      commit: 30ed024fb0768e9353f21d1d9e6960b7028acdfa

--
Lee Jones [李琼斯]


