Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C037BCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 18:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdCruKGnpf4W6CfP6MEmI9h0iCjx15NxA8dwOmLuHsc=; b=AGXjkjXl/UnEQ5LbMO+Bjp62Nj
	6ODvQIWNaPnC/KdSqcijo0r7Sf732haEIPQJLH8M7IKC6Oh9mCLA7uGSrKU69K2jLoN0TkuKV8mZD
	r0vgVpQ6PkcL3u8oNuSbERqPXNXlD8ZKawCyIPP40C29QxGuofQrA7JvULS/anntu9xqyYdoZJmAm
	Z6MPC6wHKsWEQYfzGBnxaNIkZodN1N92oKob2Dxq2lOMdx48dLkqsI6wm9vSdVtyg/pGdH1JEiXT8
	O+lVx4lHtBhTfMygBX1aFUBmBMvFMWdx6jmvEzQL9VTqpsIIYzL12XKBqfE0bf9XMrza+o/LD6Wwt
	Cb3oU4lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAYSq-0000000BJQb-2ol6;
	Sun, 19 Oct 2025 18:49:08 +0000
Received: from m101-out-mua-6.websupport.se ([2a00:1968:0:9:109:235:175:106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAYSn-0000000BJOB-1VuG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 18:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=palvencia.se;
	s=mail; t=1760899479;
	bh=GdCruKGnpf4W6CfP6MEmI9h0iCjx15NxA8dwOmLuHsc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nC28rg7apx6pR5kRZM8gmR7UOqCmqBLQAmRWtNe8trIAo699ysmYJ6A1zMx5Xd5/R
	 TpQrrWP8w96stwWvigu4tR6wvmB+1lGSDQsW1lAiDHD72HLTJR1sq5v43qLYpi89Tc
	 8cScU4/MG1wpyLqad4I+Z4GWgNd5ZX5AuRw/RHvyFXMxmt4hxaPzHW5JVOzUgggi41
	 BTJg5IIW0hv2FSKLBoXVk8z4tUYWAZ1SVzhPnI3+BIvhQoE/U4OMGdWdBZoZEp+1s9
	 /KsQaAuKIsbXjhwxDTVHPfGMhD8PKtK2mhMvtv9XybXRwz44w7mzVEhc8upyy5L7ya
	 EHKLvAFOJSUxA==
Received: from m101-u5-ing.websupport.se (unknown [10.30.5.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by m101-out-mua-6.websupport.se (Postfix) with ESMTPS id 4cqSCW1zFWz1Ccc;
	Sun, 19 Oct 2025 20:44:39 +0200 (CEST)
X-Authenticated-Sender: per@palvencia.se
Authentication-Results: m101-u5-ing.websupport.se;
	auth=pass smtp.auth=per@palvencia.se smtp.mailfrom=per@palvencia.se
Received: from rpi (unknown [193.180.91.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: per@palvencia.se)
	by m101-u5-ing.websupport.se (Postfix) with ESMTPSA id 4cqSCR4QFhz1fWs;
	Sun, 19 Oct 2025 20:44:35 +0200 (CEST)
Date: Sun, 19 Oct 2025 20:44:31 +0200
From: Per Larsson <per@palvencia.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: wens@csie.org, samuel@sholland.org, mturquette@baylibre.com,
 sboyd@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: Mark A523 bus-r-cpucfg clock as critical
Message-ID: <20251019204431.32254cb4@rpi>
In-Reply-To: <20251019172647.80379-1-jernej.skrabec@gmail.com>
References: <20251019172647.80379-1-jernej.skrabec@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Out-Spamd-Result: default: False [1.90 / 1000.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_COUNT_ZERO(0.00)[0];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:35790, ipnet:193.180.91.0/24, country:SE];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_X_AS(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Out-Rspamd-Queue-Id: 4cqSCR4QFhz1fWs
X-Out-Rspamd-Server: m101-rspamd-out-4
X-Rspamd-Action: no action
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 423
X-purgate-ID: 155908::1760899479-A035718D-94DDE7B4/0/0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_114905_852941_174D2AF1 
X-CRM114-Status: UNSURE (   7.66  )
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

On Sun, 19 Oct 2025 19:26:47 +0200
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

> bus-r-cpucfg clock is important for peripheral which takes care for
> powering CPU cores on and off. Since this operation is done by
> firmware (TF-A), mark is as critical. That way Linux won't interfere
> with that clock.
 
"mark it"
Also, I think it's "takes care of"

The change itself looks good as far as I can tell.


