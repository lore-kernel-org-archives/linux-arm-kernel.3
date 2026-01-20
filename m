Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F89D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdNwNcGnrHVRj7c7tzYxsUBjZ6i7z3klcWNlJbURQPw=; b=kaVLka4YXWFHVZCdt0lnyQ81zm
	zqh6mKds60IRIClnHjy6nFvHm5MPjEtuFeQ1L/3l94MFf76nryewb9yydmmR46ZtIJKX6WUIUjOXV
	7liIQdk/usQqjTMSiKvVsmyf0fudBsceF9pVnCwtR+DaUFOr0g52gfsqlcA7cEJATCKgAwCZk09sR
	kNmog6pomnkO9pOu0t2/Lk7J/+QLOBIW8+O700mmsLh7yRrqOW8VbTUZ8EZakO439+iqzR6Ejg/DK
	YYAKUpciSoItzyHpuBT+srl7SNMaSjb+T3rCImtoRmb/taieq35TwmCCMVfaX6liaUIVmvCuxNNi2
	4MGJfJQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAZu-00000003nPR-4ASR;
	Tue, 20 Jan 2026 12:11:22 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAZs-00000003nOk-2Qvq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 12:11:21 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-64d00702990so995318a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 04:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768911078; x=1769515878; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EdNwNcGnrHVRj7c7tzYxsUBjZ6i7z3klcWNlJbURQPw=;
        b=CfyPsMpWYvxdLeaR92bJYz9jv9PKWxok1XVOaO92iPI6msyHZMd+g1MOMAGziHhT8D
         eK2RuqidhwCkFfi/KCdqS1XAZsYEWtN8NIY8UgmsZ6pMnZZxhNvGLfYBzVelPosbpHNs
         3HhjAz/bBrOCc1p+AD0/W3hKfmBJPxfW3HfywRWTSlk858H0xC3db48V1DEYJkfuwumY
         llEhLqa4knBxyV1hf7MShslxbDkq8Kk83dVq9Q0bEf6SGANTauSzGcD1BaFmzYHUyrxw
         fR3UrnzD932sGgHb0c43USpC05iAXQJp+8cRht+3bXK3mYS0YGZDTZwJp4vlgKzvqs4u
         ikAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768911078; x=1769515878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EdNwNcGnrHVRj7c7tzYxsUBjZ6i7z3klcWNlJbURQPw=;
        b=votR9cxn52JMubY/am/Kwy5Y+iu7odOd43CI478gK5GYPOlmgGgv/FzdTBpWm8MDfe
         g1GPFxgsxgYz+gORfNFEABzvU4EIg91VRN1YifoShAAMoWNtK2lBznoFdWUD4jh/UQRO
         WysP2J6uKaaBymvLpeOaHVFFlcbNPg+Q6Ga5owqh+vZIDTyWjSCpS8ZnwwOBpv/8HjfP
         n9IZD27/V1Z7rTY6JqNXdsMNdQ0y/c2ylY99uqRYZORKwhQ86MHqc32CF5O/sWqfeJPa
         6APJLjq/Lhvs14zj8KgTVJ696x2HaICSGzumvjX59yKob5jignZocuX7NLX12IEeyLMy
         sOZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEEqy7lFazfeE2+vaLurvXT633kTOL2CGSvbblLk/c8i+bIheexs7Mw8USlf923wmjnsmz7pJaqG3bCmiwCYi+@lists.infradead.org
X-Gm-Message-State: AOJu0YzqNA1CkcXVXPOVLtt4vozCt3SVcO809ocU6VcLW8AstlNEjx5h
	kTsavoPBe3n5ZVYOh4KyzVIVX9zhxnAF8f+ti1chfV7SOOiwaaa6q+0Z
X-Gm-Gg: AZuq6aLjyaAkdjuvimVfScz+gUQj5vbwoHAZxQGZzl25AuYJ68ovSsCo1td9CN3r1i2
	tXU/oqbI2LuzzApuupzd42IaukgACMhnQeRXaQZU+fyOMbkJVUf/W/bjFllfgtUACwb9TCh75N2
	KCxsZ8ySb6XTfZo+fvXLh//pMxOY4Uhqu5CEt01KOK99UJybJoYT7EuziuyfsOJL1V0/TsZfupd
	/Tt1tAJpLakjZwMmCP+7j+YDHgWlCwID73Nptatcoy/OS0UNYM6Cr3yaoFjWsfV9sE0GZ+wtpyC
	92sybXebIbnIuhnO1sy80rngTFl0aaqHclvhI9+KwQPURDdR+rlrm/4auuXCpqtLTqgcHqG7wQy
	W1IyGaXOVkbzpXgyHuIGIjljgr/QHnzRzZdiydjZ13Be5pQDduzE4wtGALYqyr3G+USImdWVZzZ
	hJSnk=
X-Received: by 2002:a05:6402:348d:b0:64c:9e19:982d with SMTP id 4fb4d7f45d1cf-654523cc85bmr6515961a12.1.1768911078156;
        Tue, 20 Jan 2026 04:11:18 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:619a:24df:1726:f869])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c4aa7sm13503305a12.34.2026.01.20.04.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:11:17 -0800 (PST)
Date: Tue, 20 Jan 2026 14:11:14 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jakub Kicinski <kuba@kernel.org>, linux-phy@lists.infradead.org,
	davem@davemloft.net, maxime.chevallier@bootlin.com,
	alexandre.torgue@foss.st.com, mohd.anwar@oss.qualcomm.com,
	neil.armstrong@linaro.org, hkallweit1@gmail.com,
	mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
	edumazet@google.com, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, vkoul@kernel.org,
	andrew@lunn.ch, pabeni@redhat.com, andrew+netdev@lunn.ch,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,05/14] net: stmmac: add stmmac core serdes support
Message-ID: <20260120121114.2aedgu42i2wax3yp@skbuf>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
 <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
 <20260120081844.7e6aq2urhxrylywi@skbuf>
 <aW9VHt6meEJFxV0I@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW9VHt6meEJFxV0I@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_041120_659179_9A5020A3 
X-CRM114-Status: GOOD (  18.18  )
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

On Tue, Jan 20, 2026 at 10:12:46AM +0000, Russell King (Oracle) wrote:
> First, I'll say I'm on a very short fuse today; no dinner last night,
> at the hospital up until 5:30am, and a fucking cold caller rang the door
> bell at 10am this morning. Just fucking our luck.

Sorry to hear that.

> On Tue, Jan 20, 2026 at 10:18:44AM +0200, Vladimir Oltean wrote:
> > Isn't it sufficient to set pl->pcs to NULL when pcs_enable() fails and
> > after calling pcs_disable(), though?
>
> No. We've already called mac_prepare(), pcs_pre_config(),
> pcs_post_config() by this time, we're past the point of being able to
> unwind.

I'm set out to resolve a much smaller problem.

Calling it a full "unwind" is perhaps a bit much, because pcs_pre_config()
and pcs_post_config() don't have unwinding equivalents, unlike how
pcs_enable() has pcs_disable(). I don't see what API convention would be
violated if phylink decided to drop a PCS whose enable() returned an error.

Similarly, the fact we don't have to whom to report an error code
doesn't make it pointless to offer the guarantee that pcs_disable() will
be called only when pcs_enable() has succeeded.  It is only the latter
that seems necessary in order to develop reliable complexity on top of
these.

If SerDes PHY integration in phylink_pcs drivers is a model to follow
for other drivers, I think the way in which balanced calls can be made
from pcs_enable()/pcs_disable() needs to be given more attention.
And I think it's a bit worse than "doesn't matter, the port is dead
anyway".  For example, we can have QSGMII where 4 PCSes share a single
SerDes lane, so one single malfunctioning PCS instance can affect all
the others through the lane's phy->power_count.

