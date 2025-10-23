Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C581ECCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 21:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWX3j8lpcW8XdONVbs8aknv+64UUzejtVFjmBch7rMc=; b=F/fi8endV8+rTqHwpxqYWLROat
	nSrImGrk2ox5fX0TgyWW/Qm9IM6ton8w+jklibgVp7F0itbLOysVivjvNkw1aeFSOjvBToQ0YnQsJ
	r57dGROg+TGr5+HJYjZIOiruwAlO5WtKLiKbKe9ZR05cieKgnw2IDUrb5f7Fjch5FAFW/PorSyNHL
	B1+hnCgfPqyf0vjiE9Xc0H4cbaUYTya3iHRRPK1MyJAuLKDqUHd7cvxyd2uMNgW6fS7po0hwuv1sX
	mxpb1b+9vFYyfiIVisPsgGhzOWjxG1Q3W/mXOpidQOwCucY4Mi5/EuHQrEdZCSM4xNL4SQxwuwwuG
	H0Ws4vuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC32x-00000007emh-12b6;
	Thu, 23 Oct 2025 21:40:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC32v-00000007emW-2S6E;
	Thu, 23 Oct 2025 21:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QWX3j8lpcW8XdONVbs8aknv+64UUzejtVFjmBch7rMc=; b=fMylW+jju5Xzwm4uIAB6haro8B
	Z9kvpDRGYcwcdapjvhhr6zFqTfk+45Hbp8uUX6h7PM+1SG7ZvuH8luElEWpL92iyxohQqymzE2VVd
	jI6rLbKqXZwRnkNRaESj77nX4vXJVUtMG+qz5Ynw8jMFamljgkbogt0XXT8wmrSV8QiV75cx28u+I
	dAzd5N3FJFOF3YNzspTBAeyQiGzdIsYP8CoX9S38d5srxFaEmP2OBF++pV1WlLbMj7YWdU3R+Vy5H
	ijxTdL5itF4YzBSvdpRuH0tW8n/AOrJpeXznj9qr+R1vkQCjOlQQ5mG1JBh9hXiVaf5H3zWDyaO0x
	9dPy1e7g==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2BD-00000001mlU-3MG7;
	Thu, 23 Oct 2025 20:45:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CCA554434A;
	Thu, 23 Oct 2025 21:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB27AC4CEE7;
	Thu, 23 Oct 2025 21:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761255626;
	bh=5qCzJg0hCt3HBb3QIW58eH+hgYTu6FwAxvg34Yv5VZo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hBJKwggNlS5Z/APUyqIyD/y3+ODXl8giHzG1gqnyTHY6Kx57RGM/6Bv+Q+hNMOJsx
	 zDGzvBYt9sYkNhQoz9P7Mq5aoI1w5n+wbOLQhWlYJHlROaaHm0GwS2ZB1p9r46g6TF
	 fVkqgs1y2mkXPHJWVeypsX5K8S5DlGCGpkBd2eFNn3JsD1f9CbVE4dKINgGj22vkWC
	 4hQLBnrCMLX7UFvzJ4Y3cIr2y7g8XIuKEev3HUd2iDuK4QpaBqtNRagn/WuAlzeyqZ
	 XlU+BzVIciG55ec82SLKs7S+ObDRCYdigBA275Spv2uU5gLCLWCEbZcPtNde9jMKCq
	 55dNZJhb5ITzA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B33380A960;
	Thu, 23 Oct 2025 21:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: fix corruption in h4_recv_buf() after cleanup
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <176125560702.3260295.10385824633115850837.git-patchwork-notify@kernel.org>
Date: Thu, 23 Oct 2025 21:40:07 +0000
References: <ab6fa50055fa0c39e5501c123c36e662eb48ae61.1761245114.git.calvin@wbinvd.org>
In-Reply-To: <ab6fa50055fa0c39e5501c123c36e662eb48ae61.1761245114.git.calvin@wbinvd.org>
To: Calvin Owens <calvin@wbinvd.org>
Cc: linux-kernel@vger.kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, amitkumar.karwar@nxp.com,
 neeraj.sanjaykale@nxp.com, yang.li@amlogic.com, pmenzel@molgen.mpg.de,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 francesco@valla.it
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_214504_040216_A3176C78 
X-CRM114-Status: GOOD (  10.28  )
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

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 23 Oct 2025 11:47:19 -0700 you wrote:
> Thanks to Francesco Valla's investigation, the reason for the duplicate
> code I recently cleaned up is finally clear: a different structure is
> stored in drvdata for the drivers which used that duplicate function,
> but h4_recv_buf() assumes drvdata is always an hci_uart structure.
> 
> Consequently, alignment and padding are now randomly corrupted for
> btmtkuart, btnxpuart, and bpa10x in h4_recv_buf(), causing erratic
> breakage.
> 
> [...]

Here is the summary with links:
  - Bluetooth: fix corruption in h4_recv_buf() after cleanup
    https://git.kernel.org/bluetooth/bluetooth-next/c/1aaa18cc80c5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



