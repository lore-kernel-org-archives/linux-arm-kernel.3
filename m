Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBD0CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 00:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2AxNOWeNfgkS7Q/q0FXt4wBjC/2CDKjdDUbU/bPedI=; b=wCL2+6fcKcJYjtyh0RYSqANWiA
	Jq6q/oQDaSp1tsFnym8LqRG/g0ax4l8kp168oHMuSgOm6OsdsFAu8F5O5lulEG2TdxZrd86ZSP30R
	tl4LjKkVQN/9lGCknI0GpZhTup6QSM79c2zBt17vfPl8AKJZEaam+UlyT9EE0MWU8/aSzme2rK9Rp
	pidacfZKS84/TWNe0PtcBCbnK4uwkG8Yjnrhqiyx8jJISbczH8jW8a0uf4yyxSp1pjzQwDA4fgZHa
	AVRmUGLHdEZwN/ZdWJbnFcePg6L9Gu7T2j8HOrM58NO6IrStVVRTFjNMEcM45AJJ2BjMEEAguOqd5
	rio5Gaiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGnru-0000000EeTu-15Vw;
	Thu, 06 Nov 2025 00:28:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGnrr-0000000EeTI-3qng;
	Thu, 06 Nov 2025 00:28:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BC5F43DC4;
	Thu,  6 Nov 2025 00:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D115EC4CEF5;
	Thu,  6 Nov 2025 00:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762388927;
	bh=l2gVzr7ua9gwgbl7Vz7D9mJjNQJV8+w+PIZQo2MLJlM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dfGWJ/zQYcIv6FXmMa5XHigsI6uK8RODBtIoQhgLOUqUtWAER4HVOWo57uSXVcBHg
	 5MmsEDAkA2MZRKrlrk8ccVL7fz45uUYJ6pPExP88IjmKeVDiSDRiWMGyWUIv5F1yBb
	 SL9Y438Jd25hEdNWz7BEie8DZmeVbwoQJ6doKrSZoDa9snu6oKU8jzY9TT0ElQg33W
	 EzmssjwnUahwlHIsLod42JBBqPa9sjF5QJEH+J/F8xwYvSG9Y408ejYSQY9dmysohj
	 zPXvc0Zi7XEnMCmJUXZzyKq2n2ZucHIWcbVa3AkPRkiyWL9uvfWYCfDXX4z9w242Lx
	 fBmoRqSzzPHPw==
Date: Wed, 5 Nov 2025 16:28:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: airoha: Reorganize airoha_queue
 struct
Message-ID: <20251105162846.53acd791@kernel.org>
In-Reply-To: <aQsCYoS-cvkUjrMv@lore-desk>
References: <20251103-airoha-tx-linked-list-v1-0-baa07982cc30@kernel.org>
	<20251103-airoha-tx-linked-list-v1-2-baa07982cc30@kernel.org>
	<20251104183200.41b4b853@kernel.org>
	<aQsCYoS-cvkUjrMv@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_162847_984411_A2582D81 
X-CRM114-Status: GOOD (  13.75  )
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

On Wed, 5 Nov 2025 08:53:06 +0100 Lorenzo Bianconi wrote:
> > On Mon, 03 Nov 2025 11:27:56 +0100 Lorenzo Bianconi wrote:  
> > > Do not allocate memory for rx-only fields for hw tx queues and for tx-only
> > > fields for hw rx queues.  
> > 
> > Could you share more details (pahole)
> > Given that napi_struct is in the same struct, 20B is probably not going
> > to make much difference?  
> 
> I agree the difference is not huge, I added this patch mainly for code
> readability. If you prefer I can drop the patch, I do not have a strong
> opinion about it. What do you think?

I would not do it but your call.. Perhaps staring at data structures
in crash dumps w/ drgn made me overly cautions of unnecessary overlap.

