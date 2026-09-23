Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74130C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VAvvdSrfVlwZUnwPbQ2SBZe8CezYqvP4YPopdOx8gA=; b=lI+BY5MIPvcNfv2go5SSSu+ulF
	HWVmDFtgsSKmswbZnm8XsG9zMNg2pcJ5UsPifE9oyPZBT+t5myqTvJEgNIXZ9AawEYS1X1SA8gfdd
	eUQXSpaLA/mVdPVyUVw3XIlUfX0ezRzChs077oEIkeg3hakekQt0PwI5J8W9xMarpkGWIuktkt9YH
	JS3s/I5dnjoiEJB7ZKjnuUqsp7lNBp3ZKON75F8CHkffBBbzBTtSVnpEqs+VKzu8QPweowm49Xb/f
	jFMLiZ680orONWwzuV9aPpud38nRTxPFPd1FwV52vR2gwXy3avamM/9atcNtrpGpbhDDhj7KTtFnh
	wHlApjMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Nue-00000008WDB-3dsV;
	Wed, 23 Sep 2026 14:25:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Nud-00000008WD1-2c2B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 14:25:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CA0F43CB6;
	Wed, 23 Sep 2026 14:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE9B1F00893;
	Wed, 23 Sep 2026 14:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790173531;
	bh=5VAvvdSrfVlwZUnwPbQ2SBZe8CezYqvP4YPopdOx8gA=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=dAhw3uKNokZzF7PVP6DNUNhPRP5TgMtmjXCfzaRzvIzZ/EDlA/W7aYqvR3pVbx51M
	 NFWU/fzMQA+/kDLKggSDlYpg/eGdjYT8bSwMitZbxPrEJzFARFUJs5d5lRIMhJf2RS
	 dkLcb6CjZeK2zfPt+LauRcs5GoQc+2pw8j/DI3ioC+YQ1/CkoDJh+ibFLQ2SqB2fic
	 h+GsO2K1S6gD/DdLcFxC+ckgYGh/EQTN9j17KpGVvoaY5trEg22bHIoOe+J6PyZe7H
	 A7VFWTB2a4uJBjxHQOHfzVvk02jgddwRsupnBSWsYPGhVeTiTRbpZehRXy08hkmmQ1
	 IoipRCEq09Y8Q==
Date: Wed, 23 Sep 2026 15:25:26 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
 <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
 <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>
 <arPMAXs4jjUeu1DE@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <arPMAXs4jjUeu1DE@monoceros>
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

On Wed, Sep 23, 2026 at 02:55:26PM +0200, Uwe Kleine-König wrote:
> On Wed, Sep 23, 2026 at 01:01:44PM +0100, Sudeep Holla wrote:
> > If Uwe is fine, yes I can take v7 as is.
> 
> Fine for me.
> 
> Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> 

Thanks Uwe!

> The nice thing is that the device_id structs are not API, so this can
> also be addressed later if someone comes up with a clever idea how to
> implement it.
> 

Agreed.

Hans,

There were other changes in bus.c that conflicted with this. I have
resolved the conflicts and pushed to my for-next/scmi/updates[1]

If anything is wrong or if you prefer, you can post a rebased version
that I can pick up.

-- 
Regards,
Sudeep

[1] https://git.kernel.org/sudeep.holla/h/for-next/scmi/updates

