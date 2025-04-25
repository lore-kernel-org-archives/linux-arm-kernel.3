Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAADC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 13:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5XEMDvTybGK8+bUqmsXMS81c/nZey7bKpfsqKYwd2I=; b=zqXFzo3oa4E1m29Zmji20Dsj8l
	Gtnu5hIjy3sU+FWw3RDd9VmAm5l2xRPYo7kJOej5cfdLTIAYNrkCCNv7tDIVmmtxQvvaNpRDNX0Xq
	72gadB/vJYLA6JeNEYrlPJLHdrfhXhJl4VxZyZrwIQlvyS2hWPKSAK2BXLe4xzQSaF0hs3ozoaC42
	NCJifaqtKn5igDToRZiWzZy/gA8UZ+rDryJzJvVVKXd0IiliNWO0lYxIWcBIbIaGZzrGF+WzrZLnf
	hmTZ6jEZju3GL0z2wGg4kEie/qpIXU4juT9qqnhuZX2u3QPXt8OW+TWKa1EDoh+rOlxGDunxW5Pav
	+07obF/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ih4-0000000HD5q-3o0I;
	Fri, 25 Apr 2025 13:02:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HF8-0000000Gy6G-0VSt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 11:29:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B93E75C6283;
	Fri, 25 Apr 2025 11:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED620C4CEE4;
	Fri, 25 Apr 2025 11:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745580555;
	bh=l4pbyFyJKgsL7EPZcn7j6uWIxIOaHPFWYyhX+MyM2yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h6T7d/VNOP5MFUv8fVjNrVzwKe108c7cd2yUnFIDkAERZT0OAORlxukO0Pa6ymvh6
	 9jXRs814OZa8LyweGU4Ovrv/1l7oq6pGKM6Ge6iYdwGFxKwr9b2V85mW/2cqNS5W4c
	 uzONH+E5U7Mh1qgsOBBsRL8WD3dCXImD4FxfxZGo0mk53kfM6cZtnH/u+NEuWWFtI1
	 FU9zjuAyn78/x7oLfwRxthWiXuB1dcH564nhHip5b/8e3QF8MAojqeXhx55xU9c4tu
	 tL7i2YTSnlp7JvCm8+rGB0mhVY6wz9Y58KeeDDG7iK6qAXHpbVYjRs0hL2EBMHClAq
	 x2t++k7A+Wx6A==
Date: Fri, 25 Apr 2025 13:29:10 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: carlos.song@nxp.com
Cc: aisheng.dong@nxp.com, frank.li@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: Fix clock count when probe defers
Message-ID: <34ally74jbpae6etevqskr4zmcv5xyac46n4hl2j5ybihwtezn@jd2gvr762gs7>
References: <20250421062341.2471922-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421062341.2471922-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_042918_193784_37639D2B 
X-CRM114-Status: UNSURE (   9.82  )
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

On Mon, Apr 21, 2025 at 02:23:41PM +0800, carlos.song@nxp.com wrote:
> From: Clark Wang <xiaoning.wang@nxp.com>
> 
> Deferred probe with pm_runtime_put() may delay clock disable, causing
> incorrect clock usage count. Use pm_runtime_put_sync() to ensure the
> clock is disabled immediately.

What is the outcome of the incorrect clock usage count? Do you
have any logs?

> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Carlo's SoB should be at the end of the chain. Should be nice to
know what these are, though, are they co-developed-by? tested-by?
Why so many SoB's?

(no need to resend for this)

Andi

