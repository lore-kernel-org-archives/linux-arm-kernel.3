Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0732AC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 07:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J21E+R+9FyXa98btHMk4gDTQIPeK9fAVsfswg1uIiks=; b=wVDhkdpLVYnwOqVFkte3WKMjhr
	lQ9X1BUEnByYvJ3YzY1Hdc5cejO2VIwb69R/9d2I4TgtW68qlodjmOVwBkF+4hZ71rHBy10J4En5V
	aQiHHh8zfyA4shCYwJ9ee4s/ZUMNBhnZjFb4kreMz5GFx2U/F7Mn3C8czZZowsnehJMVQnNJcqluX
	cRnSTfvwhaUAP7mpsCkrQSY7S8BBHLtTZHz9dmV9+//fQun+jwDlgWfzEnp0gY3vAYAdkcrwHVNRH
	Cdw9/eUKOAQ47e5B3dTL5ZAL5lTJ3uspR4T4OK9pZLr3Td6U0axlzHl4Xr+Eze3nXQhjspwXd2/lN
	YiqLBRfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCCut-0000000Ayen-3pfF;
	Tue, 06 May 2025 07:40:39 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCCsv-0000000Ay3n-26tP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 07:38:40 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746517112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J21E+R+9FyXa98btHMk4gDTQIPeK9fAVsfswg1uIiks=;
	b=qNX6OlNrbNz/106uHkRm/Oogx7L/ATXOKXNULrHV5oMPz/EqETEhqQXik79B6uKpRxGer7
	m4uzxm2u/vU2QaScS8HXNFdOn15A29985rUYNKxJlEgIYMZ2w1+H1ulFRmwAG4w/R4TGle
	YKATZD5GaPfs4/NpeES4MdSXrjy9A07JqqRJ6XrNJ4rHONUHOpSSOpoikeV4w7+jEnAgH3
	wDyctZ2oP7z+VQkI4AWVjUjMFfSSZoanIzDawlr6ZPBGpm/TeVkNuWvcroBCq5GBHqDbDj
	xUT3egzgSGYNncpVr2GHX29FoklcLoVilQE45pXYesGjB/QFnvKiuuztHb/aQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746517112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J21E+R+9FyXa98btHMk4gDTQIPeK9fAVsfswg1uIiks=;
	b=GcoEX0hUKefceGwjO8kdQn1Zo2imgLEIYogfxjmB1jVL9zrjW9awLW1u2bvujo45XQjOxB
	UceKLzvVYcKcEsCw==
To: Alexey Charkov <alchark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Alexey Charkov <alchark@gmail.com>
Subject: Re: [PATCH 1/5] irqchip: vt8500: Split up ack/mask functions
In-Reply-To: <20250424-vt8500-intc-updates-v1-1-4ab7397155b3@gmail.com>
References: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
 <20250424-vt8500-intc-updates-v1-1-4ab7397155b3@gmail.com>
Date: Tue, 06 May 2025 09:38:32 +0200
Message-ID: <87ldranq87.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_003837_678104_2D3DBED2 
X-CRM114-Status: UNSURE (   5.63  )
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

On Thu, Apr 24 2025 at 22:35, Alexey Charkov wrote:

Please do not make up subject prefixes. See

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-submission-notes

and please read and follow _all_ of it.

Thanks,

        tglx

