Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142A9C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 10:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42m/xcb4QGdzKXp4MOeAQAu8xnLeUjVel5+q/FCL39A=; b=Vj9dZcziQL76XIxsAHAIrAIcJf
	D/nMZqTF3H4uKNcjCmPzUSHYNQHghR5eJhVUmnzfwU5t7ug0Y1mFV6n8d0FSwQNStZ+LUT0dHdQFR
	Ij/cmi2Snq7Scj1zNf72tYoAAuWKdzUG6TcuGC3W6Y/94FPSIQ1p6jZbUQK+49CsHmNQZsGCLb8us
	UWF11DovDtXWHS7MBmT5bBEDUKZYscJ1TZpwcc1E2rz1YybUpu1eTSDeA7wITP2m1fNS3DniIDsY/
	ovDUsgayp0NEUNPbXmNRJFDhKxCQB4EmuDld14KL5vWGiA+cVsemRXICttuD0wknqXxZqOMA2w8tA
	nHzN5SGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4c19-0000000E3I6-2DWE;
	Thu, 10 Sep 2026 10:28:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4c18-0000000E3Hl-3qyV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 10:28:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 05383601F1;
	Thu, 10 Sep 2026 10:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A3F1F000FF;
	Thu, 10 Sep 2026 10:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789036109;
	bh=42m/xcb4QGdzKXp4MOeAQAu8xnLeUjVel5+q/FCL39A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bFNyVKhIhYeAP2D+ACMAAF/PssJCJjppnjWQpPJsJSi6MlZR7quI1xC0K5/bPazqJ
	 0T30N6IEh7mM0HiWihFfer0m3Tc7BTuCOu2tQtVB1LRruB6WR4yKqPPE5SmYbdwdsD
	 BfkGsZBpzuPDdO3RUUEjlcViyG7uYm7rjsCZ9TSBJFCbU+boV34kg0SysEUC2SrO6H
	 kRCJ6zuMZcoc1bbSd++p6YeVFWqE/rMXF6FhUBmdwP0UU98rbTGHOIPN4E03hF1//v
	 Bc+MqsKpvlnxb+YsrCJgEe/jLnmpR2mUfZYm1fhQ1pj59qXQgfax5UZS7+Nu2L9zQ1
	 4NrJkVksvtWRQ==
Date: Thu, 10 Sep 2026 11:28:22 +0100
From: Simon Horman <horms@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com, Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>, Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>, Shuah Khan <shuah@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next v3 03/10] net: broadcom: fix typos in comments
Message-ID: <20260910102822.GV40544@horms.kernel.org>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
 <20260908052602.27497-4-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908052602.27497-4-hemanth.selam@gmail.com>
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

On Tue, Sep 08, 2026 at 10:55:55AM +0530, Hemanth Selam wrote:
> Fix misspellings in comments, found with scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Comments only, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

...

> diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
> index 9580ab83d387..28ea4a33f245 100644
> --- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
> +++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
> @@ -280,7 +280,7 @@ enum {
>   * (db_msg_sz 1 << 7 * cid + 0x40 DPM offset) it can come up with a valid number
>   * We must avoid coming up with cid 8 for iscsi since according to this method
>   * the designated UIO cid will come out 0 and it has a special handling for that
> - * case which doesn't suit us. Therefore will will cieling to closes cid which
> + * case which doesn't suit us. Therefore will cieling to closes cid which

I'm struggling a little with cieling being used as a verb.
But that aside, I think the correct spelling is ceiling.

And perhaps closes should be closest?

Maybe we can fix these while we are here?

>   * has least signigifcant nibble 8 and if it is 8 we will move forward to 0x18.
>   */
>  

...

I don't mind if you don't want to re-spin the entire series just because
of this. Either way:

Reviewed-by: Simon Horman <horms@kernel.org>


