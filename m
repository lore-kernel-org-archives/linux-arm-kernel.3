Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E91AE937E7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 14:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYhMNiSVMu9YWHVhPVRMrBFQV3jTqJLs7Miosi0BkO8=; b=fHF1xN0O+0jvNFOSlHB5hr9Aav
	k6SXAWUjjMpbhDoFyXR9TJ3MLcg6KcXTQanBnszxt9XTxDVHA0wFgvSr5rUdNmZq0VLcrafzBLOab
	vH6m0OD5xPjyDFSS7VrYQjyyPy8LIC146LFAJfZiC1Ud3K77u1L+0EJTGkF6nWEYiIe1XXYqckFbn
	DWPDie+LMaC6k/reITjgWWGsIyiN+NJrpAKkH14GhJC5t14s/e1cbNQgq4SCKhLNVUH4PV23CITXM
	0lvx3HhenV8tpXcqSresgVyA50z7uMyGcEoFlT7a8O6OZbYPgIYWQDEnE+ZhBbHMeAwgYTAI88S55
	eS/G3u4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBwCO-0000000EPRn-1Hdb;
	Sun, 12 Apr 2026 14:54:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBwCL-0000000EPRI-3bUM;
	Sun, 12 Apr 2026 14:54:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B4C2141527;
	Sun, 12 Apr 2026 14:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA3EC19424;
	Sun, 12 Apr 2026 14:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776005643;
	bh=hYhMNiSVMu9YWHVhPVRMrBFQV3jTqJLs7Miosi0BkO8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EHZqcMBirrWaPT/iTHH9lRJ1HuoNL7HHSQ2OL+IqM7wS/+NLv3apgcvkdnptpAjuQ
	 p/IGAA+sZId7dLLetl9wvsKafKzT9VDzD1QzoBywR6lcYF8E8/uXwck/P5Euhm1pUU
	 /lyqs4pcbGUpfxZt9tR/+utQSd9EfAlkvjsWM/rAa6RHX89Tczpw5FpgyzTc0n+8rC
	 chu3QNPwWDNCgAK5ZmSdKcW2baBeqO+t6agKhHAFWNjbttFeflGtWPqak7i23BKd8a
	 S7voKNK0fff1r/yhQ0Pvmnk3MGKxxlEbwlSUQiSYp8nwlgyLA8FmFORigpvnhkkQcv
	 uIhCbLULAfOrg==
Date: Sun, 12 Apr 2026 07:54:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: linux@fw-web.de, nbd@nbd.name, sean.wang@mediatek.com,
 lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 daniel@makrotopia.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [RFC net-next v5 0/3] Add RSS and LRO support
Message-ID: <20260412075402.2eda04d3@kernel.org>
In-Reply-To: <trinity-1304ecb5-9a3f-4e37-b2c6-bcd7f35c2921-1775995067670@trinity-msg-rest-gmx-gmx-live-579dcf886d-nkpds>
References: <20251219151219.77115-1-linux@fw-web.de>
	<trinity-1304ecb5-9a3f-4e37-b2c6-bcd7f35c2921-1775995067670@trinity-msg-rest-gmx-gmx-live-579dcf886d-nkpds>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_075405_939039_0C09A382 
X-CRM114-Status: UNSURE (   5.79  )
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

On Sun, 12 Apr 2026 11:57:47 +0000 Frank Wunderlich wrote:
> some time has passed without a single comment, so i just send a friendly reminder ;)

You have a lot of people in the To:
Could you clarify who you expect to action these patches?
Patches are an RFC and I suppose ain't nobody got much comments?

