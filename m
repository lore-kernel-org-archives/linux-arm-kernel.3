Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63500CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 13:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VyTIEquFqFfuHxV6IhHCBxuRdbr+JpQQcmqbOA5i2Bk=; b=XCtCuE/gKj5lGqYoI5gRIZE9nU
	o5lCkNbdMow3HQvYU883WXvfN5qzcZ0vmW6AZZw4E+vGIhh4OCY0flSSbKzPx3ueu/hIwa+x3NpIQ
	LS21pPc7e1+NtpLvbpwfQZ20HPXg9g7SgjXhC84icWKu/2DfRMNiElutaapb75VQE6bvYTrl+defe
	lLiOrcbwQEWV75s54otVPpi+oiBQ0CGHLcH7zwSIEPoUrokFBqtY1GuyUfbSOmUiurWkniPTPCBSi
	00N30Xk54QZtrNGeKK4UN1u0G3PLlKKlufE21w+EEvq56OQvYARr+A09i2yU4mxoNslnSM2H0xGBY
	6VqRtG/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsOf-00000008QIF-3j33;
	Fri, 15 May 2026 13:16:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsOe-00000008QI2-2Oz7
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 13:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VyTIEquFqFfuHxV6IhHCBxuRdbr+JpQQcmqbOA5i2Bk=; b=jFRx5098Tl4L/dHdnxGM6vmF0z
	KGJPE5XlL7JEtwxNo8YM/g+vSvZ7a2grZiI72++ZikZSSxaleOruL+M7Ms4Kosft6cgZm0g0TrfxM
	y4ND4z5OvxRMJI5HJHIKWoPRGkIGpI2a7JTAKmlwTccYxGBER1+GytqM6krc8GtQdtHoszGfWW9nr
	5JFcM104zzc4ti0V1cMbbTKWB7u0OE2U5dg6qUpVLbsR+5LFtHpEMq6q8FTZZLbnRXgU1CGresA+g
	Odm0Dy4lt+XSkWffHILJdK1lWJ22r5ScIB0bYKtrhNpiGtpi8SznhDnzCl99T+yB26MT8ZYkA7FDu
	2Y9DKAMA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsOb-00000005H5G-2GM1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 13:16:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VyTIEquFqFfuHxV6IhHCBxuRdbr+JpQQcmqbOA5i2Bk=; b=TCaEaAwc38dS3dOtMX+BczGYmw
	ikIewtgHwAGnezJbSgCwQygvwisD0pC84V8Akm9onuj/OrlgpTlsx3ImF/Yoef30zPM+56a0KtKXC
	KnJVXABGqTfkNTHodAXPwli4hSUUQlCYSz/u07Zb3e5bn3aiuTEYcwZqDC+AjzLjq+gE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wNsOb-0034By-9m; Fri, 15 May 2026 15:16:05 +0200
Date: Fri, 15 May 2026 15:16:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Cc: brgl@kernel.org, andi.shyti@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] i2c: davinci: fix division by zero on missing
 clock-frequency
Message-ID: <c67aa3e3-b995-47b8-958a-d655447b59ec@lunn.ch>
References: <20260514103740.5416-1-chaitanya.msabnis@gmail.com>
 <1ce483f8-1d9a-40c3-a45e-6ca536010b20@lunn.ch>
 <CABjkosFHLErOziCrYhJJxtpMg01t36LqAfr-zz1wE4HSZhfzFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABjkosFHLErOziCrYhJJxtpMg01t36LqAfr-zz1wE4HSZhfzFA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_141606_010243_7F84C344 
X-CRM114-Status: UNSURE (   9.16  )
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

On Fri, May 15, 2026 at 02:12:43PM +0530, Chaitanya Sabnis wrote:
> Hi Andrew,
> 
> That makes complete sense. Updating the macro to Hz is a much cleaner
> approach and aligns perfectly with the expected unit of the device
> tree property.
> 
> I have track down the original commit for the Fixes: tag and send out a v2.
> 
> Thanks for the review!

Please don't top post on mailing lists.

       Andrew

