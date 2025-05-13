Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF84C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 19:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oORfCjjMp0fnf0bcbRrrnwFPePQZmNvhaaRtgbRBFe0=; b=gP5HV28Lsn6ZFke/KD6Zv4DT/a
	rqPt3J+dxgxe+cOzk+ei5xJt6ini7vcp7l2IxDhDMYLoPl3bH5q6kXNER5kiyCrfWLJUVquaLzxvg
	DUn6CyVxAsqTb5tLB7Y7sUsgBGFfCTmQ212EAIdHwvpmXQhRAgC32Na5GqTz06/WJiWmOVcmGDzvz
	jNaQk7QF3rmo7PInswQOHRgb0GvpBZAPaXGpkIVHGfP0boniVSpXdeLw3s4FJIDf0v7wfp5FXKq3e
	SK1eFZb0X8YQvp3Zu7rg0ZsRZHX3K8qYPg8+6UPb6JPEL0YO9LuobOoCE+nt7/r4JhND3z1OGZLza
	aZ3HCKtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEvY5-0000000DPCe-45YF;
	Tue, 13 May 2025 19:44:21 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEvW0-0000000DOyW-2RaF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 19:42:13 +0000
Message-ID: <7ac6c796-cf4e-47ba-bde3-0f8c6203fea0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747165329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oORfCjjMp0fnf0bcbRrrnwFPePQZmNvhaaRtgbRBFe0=;
	b=cxLMPGYWVPzTxFMRw78DNhHqfwOH3hxsXpMukZ4w8AqwLDGm3QNvqpFXuCYpUPl8Ye4YHw
	D9q800LclkE2zLFSqN1vKgNYLywjbcPtFStoJFUWpGqZlOsWDzKC4Eky3H/KZLoExeAsBE
	t6rTt50Rl0eNCU1ijMLdKJnfD61xUMk=
Date: Tue, 13 May 2025 15:42:04 -0400
MIME-Version: 1.0
Subject: Re: [net-next PATCH v4 03/11] net: phylink: introduce internal
 phylink PCS handling
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
References: <20250511201250.3789083-1-ansuelsmth@gmail.com>
 <20250511201250.3789083-4-ansuelsmth@gmail.com>
 <5d004048-ef8f-42ad-8f17-d1e4d495f57f@linux.dev>
 <aCOXfw-krDZo9phk@makrotopia.org>
 <7b50d202-e7f6-41cb-b868-6e6b33d4a2b9@linux.dev>
Content-Language: en-US
In-Reply-To: <7b50d202-e7f6-41cb-b868-6e6b33d4a2b9@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_124212_773496_A8FF2902 
X-CRM114-Status: GOOD (  11.95  )
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

On 5/13/25 15:23, Sean Anderson wrote:
> On 5/13/25 15:03, Daniel Golle wrote:
>> On Tue, May 13, 2025 at 02:18:02PM -0400, Sean Anderson wrote:
>>> DSA drivers typically have different PCSs for each port. At the moment
>>> these are selected with mac_select_pcs, allowing the use of a single
>>> phylink_config for each port. If you need to pass PCSs through
>>> phylink_config then each port will needs its own config. This may prove
>>> difficult to integrate with the existing API.
>> 
>> This might be a misunderstanding. Also here there is only a single
>> phylink_config for each MAC or DSA port,
> 
> My point is that while this is the case at the moment, it would not be
> the case with a "generic" select pcs. You would need to modify the
> config for each port to ensure the right PCSs are passed in.

I reread dsa_port_phylink_create and I think I missed the ds/dp
distinction the first time around.

--Sean


