Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F4DC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 15:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1EJsqyoud56UXwFrS+ONP1KUQcds5dW1LMiyulo6zII=; b=CgbcxQGPYO7PfeR8U5ZZPOPVfy
	mvTzc+Llxfk8OY0ZCyY/itFcQ4tmwkIeyDTAG0UoIRlJ8TyRXjvo7xze02d5lNmXWTv8i/4iX7s33
	Z02mRkQralrY/xXPan5JYRUwTERHz3/ZtUxeCyOQRdzb086vFnwioDiHbdp70/SFfkKQxTll0/mj5
	nggaVRi3nVdO8hFa8bIe+rjdzBqllsjCmYvcNhOVJJbPclQFrJ0RtDPWcQpYY0LVp5FZjmuOGZVX3
	j5MRMiLf5xMIQTp6WHdUdQe/JFhbBB8T9P/SVT+Ij6/Q5tNoBtTV9EgeWd9vMcVq4RUhTnEiA4dVt
	WqkD6pZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiax0-00000008qQ9-2C06;
	Sun, 03 Aug 2025 15:48:42 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiauR-00000008qI1-3Rnc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 15:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1754235934; x=1754840734; i=markus.elfring@web.de;
	bh=1EJsqyoud56UXwFrS+ONP1KUQcds5dW1LMiyulo6zII=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VfQzwfhAdWWDn25B9pS9vDfSFGOLYftsOU9kbMlBlSxHYb9Lo2NMMMXAnjSw4wEa
	 6Iw74pj6hMCD96Ny8ZsSJfJcNOOppllOfUXB0FjfU9joBT8ONpPwfH5PQ1wxLlZd1
	 XPUfATM6VttmqPr+bS5cUS1isU9Yo2ZBZ4mxCNAX2U+U094fGsnMySpEPh8VlTvQW
	 2KatxKvBTY3RocXc3JCuXPLsNqW+12NiaSP9HWamhjclnFZK4U6kFAubhe4inlU7J
	 bhM2WrBjry80xioZ+UfflcyrrdgRgIspRWC7TPrfxJXk2vmohFsg/GJ8cilUlEuPS
	 +L6BXkEC6z76/X44CA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.186]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MYcpr-1vCgub0xxz-00KKw2; Sun, 03
 Aug 2025 17:45:34 +0200
Message-ID: <04bad825-1dd4-4956-95fb-a4ca62c0ed7b@web.de>
Date: Sun, 3 Aug 2025 17:45:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Elad Nachman <enachman@marvell.com>, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20250803102548.669682-1-enachman@marvell.com>
Subject: Re: [PATCH v2 0/1] irqchip/mvebu-gicp: clear pending irqs on init
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250803102548.669682-1-enachman@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FARc7NppLlVe9OyRfqHJNzLdpDF4UQRdCF2FR6lWxmWaUUiCeLw
 W5VFgYA9A2jNDzNrJj4viaqNK05toPViesvAqlii7GjNVTRP0PAe6zr+DKA+9iHkEWg+SRe
 nqpcAIWavuks6Dc2jAXN+aZ8DkTY8VQhPK4zdmF215JKSdTXIL1OR2RUN24EAVuhNHex83x
 9+gYV5ISelByNThOuCRBg==
UI-OutboundReport: notjunk:1;M01:P0:Ui8v8zK55+Q=;GUVrya2wHDWMZnZxm+JSOYrzceM
 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
 hw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_084604_228080_5A57E4C6 
X-CRM114-Status: UNSURE (   4.27  )
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

=E2=80=A6
> v2:
>   1) rewrap commit message
=E2=80=A6

You may omit a cover letter for a single patch,
don't you?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.16#n784

Regards,
Markus

