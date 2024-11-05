Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706BFD1266B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 08:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhWA1Zm5K5V9AUpbNbivvhJf5lb3uP79dyebOF/LcSo=; b=eCfTbsbHjNyqIaljLcZUSx+wfm
	W5aqiPsj/m36/MtgoqMuVkoj8wYIaY+WYoLI3X7wo5yFcrixKTB9t1W/nCUqG7RJdYRvOPXrUIsmc
	A6WwyJoPCsEecb7/q5EnLgzaJPG/UHqPlHEQfuBFFUlGZAxsxCmxcexfvGcbehHdx+cghA/Xly1e6
	iCAWzK827HUgtmnjKQrdd0Fpr4ABpIpQS6TOe58fHEOQPg4K0ZBu6JMu7bWKQLBEG7jRIuvBnw+uG
	2eXD6OO9LPJwSxqYyzPP80QDRRrDiIhnGOPAVCFz9Z7v/sN0oH6y/rcQQvei9Bf3IuE0/yUID+reE
	rd+gohYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FBC-0000000GNzG-3upL;
	Tue, 05 Nov 2024 08:44:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8F8L-0000000GNLf-4AQm;
	Tue, 05 Nov 2024 08:41:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8ABD75C4CA6;
	Tue,  5 Nov 2024 08:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A480CC4CECF;
	Tue,  5 Nov 2024 08:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730796113;
	bh=lcjUZiRno1Ml7Eu7/D4qbMfW+RtMrSIyM4fBtwM/V5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=izHqV7RdRft0K8i6MdXxnu9z1rs+gBkcvH/vO/rAOV8A+N905pP/iTkhGfgnYmjYp
	 EhT5KRvfR8lhtWKzLnrCYVTjncgNhQAHpNw8BAiqY2uBdVlLAxp0ZY4rTTYaTsIsDW
	 Q5tg42pDJt9NaZBI57nB5e0u3iSYMc5DE23o9km8=
Date: Tue, 5 Nov 2024 09:41:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Haowei Cheng(Harvey)" <harvey.cheng@fibocom.com>
Cc: "chunfeng.yun@mediatek.com" <chunfeng.yun@mediatek.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: 0001-usb-mtu3-fix-panic-in-mtu3_gadget_wakeup.patch
Message-ID: <2024110512-popcorn-germless-01be@gregkh>
References: <SEZPR02MB54953820B2A9EEBD807D0ED18E512@SEZPR02MB5495.apcprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEZPR02MB54953820B2A9EEBD807D0ED18E512@SEZPR02MB5495.apcprd02.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_004154_116412_765C1FCF 
X-CRM114-Status: UNSURE (   6.87  )
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

On Mon, Nov 04, 2024 at 05:54:43PM +0000, Haowei Cheng(Harvey) wrote:
> 


For some reason you only attached a patch, please send it properly so we
can actually review and apply it if needed.

thanks,

greg k-h

