Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA13C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 11:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGxv71ejS+K97A0uahwgS0PlPW90qUV+YpggV5/RT/w=; b=kYJIcGIi8d8gM76mnEVG1Xqiks
	WsW3fY4gFYeHHhaSkeL3hJ3uTi2v64VcHSKkxNnh3ad90Qr1oUPExJND4p/owxKlMVIEi1iTh4UpH
	3YRkcOloj8ziB/N4oBy/l67UJXW1UFlWmYlyPtGKSsnVPWAghZ9neWChQPRUINAYrf407PSKexW0L
	9m1SURg15XYJGXJX77Jv3VauyGBT3yIWnXg71GZwWw0QJzYOrT+G+SWvKcx4Vkmt/Wl8YIemvL8KL
	5+78Xgfrww7JG7f7lOX8BZ1yj0AD2mc0/LD8e/6SNVHIgQx0g1equILpBi8eolddBlhEXSJdp22VB
	fNqLQMrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TBc-00000006vaQ-0MMc;
	Wed, 09 Apr 2025 11:01:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2T56-00000006ubf-0mkv
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Apr 2025 10:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yGxv71ejS+K97A0uahwgS0PlPW90qUV+YpggV5/RT/w=; b=DF3ngnnSwZbxB9p+i82ZRqSc5I
	739twhXmG/8ztCTKygmU5cHJ1j5II/5E1HqpKocxVDBYWcg9J3EvR9XSPDa+QvgMIN8O5pRqr2B2p
	eWsIw4S/wmRx9b+G+yg6tbcIC17ijsuaFL7zBXBP3oDdvv4BmUME7D83v8wr9WBdysn+SY0Oz2G22
	95uozuolWnmxQa41OhRc7rpdE3unOKY02VZjL6wSS2yRO6eMWHUsLSMP7U6z2biLgAzEirk6UoSz+
	ytNzadyLrPTOWCGJFHDXj97EZlRgc62vHrl8+zdAX87Jd1aBDHI4zPCs/u0FT4qu1LIm7K923HSIi
	DTpvoTCQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2T52-00000008b3v-3I3N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 10:54:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CFC81595;
	Wed,  9 Apr 2025 03:54:50 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 533103F694;
	Wed,  9 Apr 2025 03:54:48 -0700 (PDT)
Date: Wed, 9 Apr 2025 11:54:34 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Matthew Bystrin <dev.mbstr@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
Message-ID: <Z_ZR2WNBwfQqLQMd@pluto>
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
 <Z-1gY8mQLznSg5Na@pluto>
 <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
 <D91JD15NY3Y0.23E428W332D@gmail.com>
 <Z_ZRXBed2WVZ_O8Q@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_ZRXBed2WVZ_O8Q@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_115453_021710_8749C1AF 
X-CRM114-Status: UNSURE (   8.13  )
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

On Wed, Apr 09, 2025 at 11:52:12AM +0100, Cristian Marussi wrote:
> On Tue, Apr 08, 2025 at 11:22:38PM +0300, Matthew Bystrin wrote:
> > Sudeep, Cristian,
> > 
> 
> Hi,
> 
> > Gentle ping.
> >
> 
> we replied already...both of us :P
> 
> https://lore.kernel.org/arm-scmi/20250402104254.149998-1-dev.mbstr@gmail.com/
> 
> Maybe in your spam folder ?

Wait...I have just seen Peng's reply mentioning some reply of yours,
which I never saw ..  maybe MY spam folder :P ....jeezzz...

Thanks,
Cristian

