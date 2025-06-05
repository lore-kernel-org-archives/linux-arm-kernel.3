Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8FBC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 12:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/8FocYlY0Uv/zqrEwDCoSdy/CbzWG1fyTseLizIo+s=; b=Nh6EN2gbH3pKYhhvCEQAGZ+ybd
	P8RMyVqsKWwXpZcTScbpKx2muCYGAhn9tiouhmMHVHtaPHUOkRBEGFiXPF3lT4lmC8NfbLjm50HGe
	Zq6ZnMxjgMBNPAFNgDpZCvdaXQjXrmAzvN0o364UlMYoU2SELaDg8sL8BukwE7k6Ez5lXR3ma9C38
	ZNzyCVoy5RLj5aVX9QKIDhg7U75qTV73WSTyyopVLsCHkQ3pmThP6qzidr4jrcrM8AaRgDusCmJV0
	i2VcqsmnsB+k7Z1ksJtAghcYv7OcMZWlRXwUPGopEeTOYhzVF/EOvc/aP4gDHdakgYtIEzRvpWc3p
	a8iKH3yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN9xv-0000000FVJc-0Ty8;
	Thu, 05 Jun 2025 12:45:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN9uo-0000000FUz3-0wKx;
	Thu, 05 Jun 2025 12:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749127308;
	bh=TXksFdyyDEdsxI0qhkErvaqcJ1KZyhdNTbg4RY/u2X0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RkHfuRJGvu2PRqbK//2suBckGm9ffe1l5JEIk9rFWHq8Ho4RRz2CbZfNpDkefa7IR
	 7ivclm4GTtO/WAsZS2HTJaY74TjVDfwKebm2ARvuJdd3vAIKVtrVPG2h/vR2FNq2kE
	 zcRAQq0rtvj6PfRxp429qLrhkyC+OTVg3VG9rZuqjkyFmGNrRajnyb6kDcH3MhUCOD
	 19KpyEZX03/f2wvXeGT4zUpQ6fGHHYS8V9wMRD7R4XQZgLYTudIzmboyGJcY3Vsr+c
	 J09sj68/2iTt3a/zW0eVeUkJdp6bI7h+7XJ/YkNamWFhO9c4BbuBvM9z8XwNluKEEx
	 ezCImSkIrcdcA==
Received: from [IPv6:2606:6d00:10:5285::5ac] (unknown [IPv6:2606:6d00:10:5285::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9BE4A17E02B0;
	Thu,  5 Jun 2025 14:41:46 +0200 (CEST)
Message-ID: <608f95249ff3a39efb063ab9c6a543259a7b0ac9.camel@collabora.com>
Subject: Re: [PATCH v3 1/5] media: mc: add manual request completion
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil
	 <hans@jjverkuil.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin
	 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, linux-media@vger.kernel.org, Sebastian Fricke	
 <sebastian.fricke@collabora.com>
Date: Thu, 05 Jun 2025 08:41:45 -0400
In-Reply-To: <aEFoCvPe4zE48UG7@kekkonen.localdomain>
References: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
	 <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-1-603db4749d90@collabora.com>
	 <aEC05991kEIIifDB@kekkonen.localdomain>
	 <1ccaaec7f782afc71bae5c3b0f60a786a907555c.camel@collabora.com>
	 <aEE-VFfJDhUbM2nA@kekkonen.localdomain>
	 <8b1ed01a-b6e3-4670-a4e0-d8eee7ddc524@jjverkuil.nl>
	 <aEFoCvPe4zE48UG7@kekkonen.localdomain>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_054150_420025_6D57B140 
X-CRM114-Status: GOOD (  11.59  )
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

Hi Hans, Sakari,

Le jeudi 05 juin 2025 à 09:48 +0000, Sakari Ailus a écrit :
> > It's not user-triggerable, if this happens, then it is a driver bug.
> 
> If there is a driver bug, it could well be user-triggerable, wouldn't it?
> Testing may not uncover all such cases.

You are both right, if the driver is not used, the warning will never
trigger. I was worried of the hit of a thread safe ONCE implementation,
but WARN_ONCE is simply not, it can warn few time before it stops if
called from multiple CPUs at the same time. In that specific function,
I can move all the checks inside the lock to make it truly once.

Now its up to you, I don't have strong preference. These are driver errors,
and usually quite critical. They are not bug_on simply because we have a
crash free resolution, but its probably not functional anymore.

Nicolas

