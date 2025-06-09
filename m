Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C573AC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 09:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnImHBjEXBYKTlW6N7hHZOLrlwnq3Uv1RsZaYhtprg4=; b=WdwY3/2nduUFBYMbM+MNm582dE
	Gfzxs47dLLUG6YsbEtN8Lb2Coky/CzuQdMhdX+zuqpkCiuc5gQGwrQhWf4ldp7OvLcFaGmpp00yh/
	fFPdfkKmbgaaxk2h+8PHC5jqRM+dYItOFWRtcJX8Ef6oimjmU4ST5TQ/1x0NxtLI/2kBcK+hWHsoc
	1o/Bk8SC0c4AEg0h6SzMABMLd5AJlGyxUBjV+Ou5PCLh+vk6l0BrkriTLZMjnjck/409+3AbUpmrR
	DWmb43GE0yjfv1tRYmPNtJnSSuAtAulQVEnqkQPEprKj8K145AW1Gmo5woCjDPoXzunboLCdNAUP4
	JvHUs0iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYkl-00000003lrs-3K5I;
	Mon, 09 Jun 2025 09:25:16 +0000
Received: from mail-m19731106.qiye.163.com ([220.197.31.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYb3-00000003kD2-0ALs;
	Mon, 09 Jun 2025 09:15:14 +0000
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 18005320a;
	Mon, 9 Jun 2025 17:14:59 +0800 (GMT+08:00)
Message-ID: <639cd0b2-08d1-44dc-97a7-bd6bc9f84468@rock-chips.com>
Date: Mon, 9 Jun 2025 17:14:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, robh@kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 0/3] Fix interrupt log message
To: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org, kw@linux.com,
 bhelgaas@google.com, heiko@sntech.de, mani@kernel.org
References: <20250607160201.807043-1-18255117159@163.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20250607160201.807043-1-18255117159@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk9CSFYZTUofTEpKGk5JHRhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9753f8bc1d09cckunmebd35233698387
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PBw6MDo6KDE8MRFCMRgcSDMK
	Kk0aCkhVSlVKTE9CT01LTktKS0hDVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUlPQ083Bg++
DKIM-Signature: a=rsa-sha256;
	b=WTM1v84dbg0ubPuSSxPDivYr6mVBmeHVSpkdFbu/okZs7hP7BWpOn+HCt+xcKr0AzeHeC26Kho6btD6y3NeR6/o66XR5LDK9o6Fny2PPOhAaO5ADmLfpRW4rlbTnJcUO5PF3hXCA7sCbIroNpIjZfu+1kgJ5fgKVtPXfHAymsy0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=UnImHBjEXBYKTlW6N7hHZOLrlwnq3Uv1RsZaYhtprg4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_021513_541968_A0F82E86 
X-CRM114-Status: GOOD (  14.36  )
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

在 2025/06/08 星期日 0:01, Hans Zhang 写道:
> Dear Maintainers,
> 
> Detailed descriptions of interrupts can be seen from RK3399 TRM doc.
> I found two errors and cleaned up the driver by the way.
> 
> This patch series improves the logging accuracy and code cleanliness of
> the Rockchip PCIe host controller driver:
> 
> Log Message Clarifications
> 
> Patch 1 fixes a misleading debug message for the PCIE_CORE_INT_UCR
> interrupt, replacing a duplicated "malformed TLP" message with "Unexpected
> Completion" to reflect the actual error condition.
> 
> Patch 2 corrects the terminology for non-fatal errors, renaming "no fatal
> error" to "non fatal error interrupt received" to align with PCIe interrupt
> semantics.
> 
> Code Cleanup
> 
> Patch 3 removes redundant header includes (e.g., unused clock/reset
> headers) to streamline the driver and reduce build dependencies.
> 
> These changes enhance debug log reliability, eliminate ambiguity for
> developers.
> 

Thanks for your patches.

Acked-by: Shawn Lin <shawn.lin@rock-chips.com>

> ---
> Changes for v3:
> - Add Reviewed-by: Manivannan Sadhasivam <mani@kernel.org> (Mani's new email address.)
> 
> Changes for v2:
> - Drop patch [v1 3/4].
> - The other patches have not been modified.
> ---
> 
> Hans Zhang (3):
>    PCI: rockchip-host: Fix "Unexpected Completion" log message
>    PCI: rockchip-host: Correct non-fatal error log message
>    PCI: rockchip-host: Remove unused header includes
> 
>   drivers/pci/controller/pcie-rockchip-host.c | 13 ++-----------
>   1 file changed, 2 insertions(+), 11 deletions(-)
> 
> 
> base-commit: ec7714e4947909190ffb3041a03311a975350fe0
> 

