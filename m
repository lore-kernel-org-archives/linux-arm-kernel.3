Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A276C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 23:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8KzBySVtwo2IDazHBvVh86VLnyiAyEXlsWF5joqIm4=; b=yquhJiYsIi9yXHovcJEyUowQrG
	K3Lx9fl5vfhnc0EBkqzbbByGUBCTPDSSr+4LdB3g+YgUNpBz07RJeMxQLdYITUyW90IoeyUOMlgTt
	23KbkL7FcLDZGWutX5WIQv3SBP7bLNIe6jSdzAGFTfWDGfBb5OM/f4RDqbsEnWqFQ4sW807/gu0f+
	oGm8BNcfABLDoILzBLHATjp5BE6qXa2hjBBkV/uPhOAb5gD0RW5uwe1SxWugLDtUWC/uFbCpY6biN
	l1gJd+cGhr+f5PBiM3HHtAcSheUeMAbKZjK2WhgewNdBUT5rNAnFKBEBFfQ3X3AE3EW0hM9ttg4re
	2xjtzOwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkArp-00000006HCp-2J3Z;
	Mon, 17 Feb 2025 23:49:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkAqK-00000006GzD-48r4;
	Mon, 17 Feb 2025 23:48:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 700C65C4316;
	Mon, 17 Feb 2025 23:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DDEC4CED1;
	Mon, 17 Feb 2025 23:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739836083;
	bh=Ec/oz3AfnETndpRHCs7Z69waq5sKF9/Av7l587y2Qp0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IyeONvhg7qcvLkCd8JGbNQyO1gcfkNb0fKmCust+WEBSfG+UhbjMyKXwQpCXgheMM
	 NNkwkm4BIy+V5Y0R8GEW9iugbbDJpsMJRIeF0CtLyr777bTTj8RFDvLy2GHErKvWUn
	 YURvKZV+QxGLQdntsJ4HjyjBM6sXVTpvTMjP3LW3vbFKBGz/nua8ybRm2v7uLVUKwl
	 8yWL77sGbH+f+rerYCR7r1eVgv8li0gr+eY4nukCUf5x6yTGOtnBChj+tBfGi5XghB
	 UWT8Ca92Iqegc0h2uv4F1s9+tVsjRaMBzZxLnN/8bIol6TXALZxvLC7w2e/8TukhOO
	 e0ALtJOHZZM7g==
Date: Mon, 17 Feb 2025 15:48:01 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Russell King
 <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3] net: ethernet: mediatek: add EEE support
Message-ID: <20250217154801.338f2de4@kernel.org>
In-Reply-To: <20250217033954.3698772-1-dqfext@gmail.com>
References: <20250217033954.3698772-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_154805_086578_9F26BCE4 
X-CRM114-Status: UNSURE (   7.33  )
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

On Mon, 17 Feb 2025 11:39:53 +0800 Qingfang Deng wrote:
> Add EEE support to MediaTek SoC Ethernet. The register fields are
> similar to the ones in MT7531, except that the LPI threshold is in
> milliseconds.

Please wait 24h before reposting next time.
-- 
pv-bot: 24h

