Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30027D39420
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 13:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBHNBVUFUCJBpW5DUWaq2VhnmG86vXoZK/pVSYZwtz0=; b=3is6TMT5zc/soLc31elyn3NRXH
	2Db1ZxOZ+IIE1vrJHhYbzg0lqML+z6fym4zlpa/E7YDvZqjNS6qWhYbMzI6QbExGM++CW7La/Cuto
	EhQJD6NzzmWVuYvPeSRlQpCYqHoWlYsp+2+vy3r61X/ADlZhpnCyMXFYlck35KN1ZLjO8wGOCTzug
	f8JF/i1NBIhZF3H1KY11jRnUuwh1KncIOb8vGvU20tK0oF+JuIEhAcxTOKMWk94lcCceHrYk47ciG
	dRzN7tsWkH23uLmBCqI+C/SrUbDgXLh+BwVuRAwr/cbELNRV+vaqar+rxnT4KiZ+JNPGrh+cq2y8s
	I2brdruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Hnj-000000008yO-3Gf4;
	Thu, 02 Apr 2026 13:09:35 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Hnh-000000008wD-0gyT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 13:09:34 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so5479585e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 06:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775135371; x=1775740171; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LBHNBVUFUCJBpW5DUWaq2VhnmG86vXoZK/pVSYZwtz0=;
        b=AViwSjyz/Ao26wKbd5e6NClOd43+4nDG+PdyVQJfmvk8ax+otnEq1YNfDv0se0mKuo
         un+Oxc9L3P5zgc8DfeYnMKpHqZx6AMr7SBoSx4K2ntUaDFxA2+OEb1jjFp64pvy8eYI8
         CtNiKHkEByxF2AIwYiG+JcHttHVMi4pRQ5aSCRAMADqAQhoDM0hdZCe800PIwoBMPxh9
         /lKG4C7/xjAUGVNfYf/ghxX6f/COnXk2PDbL9ZpBlx/ho+buL3unObsvPCFxWyT+ql4u
         9m66xNIxRA1GMJ648+ss5ysinnswHKnVGdCnsJ2jumd8KWSAx6gPD3g3MlUDmIgrcqEm
         N7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775135371; x=1775740171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBHNBVUFUCJBpW5DUWaq2VhnmG86vXoZK/pVSYZwtz0=;
        b=dKH8LvFZDGHs+Mo1teaqnQQ6r/A+AbnQBzZ9Mq8CWFSNMDyQTOD6+Adf+w2Zde3gE5
         +ONruf2FtuOgqtg4+RbueEOtiXHAtmKegN7Bjr+A7o2pHH75hvr6aIcfgWJ7f+hPSX38
         2G2CaXQ/UvtvT/12YQJE5DgJUSLjOCCf+QOdXY6FaMtHGY65sMfcXaAMHeTEVJH+2S01
         jHmLUSDZ3RDuw++2BiNe767ism2M3ZdscrjurfkSZkpzKsI50/6D8vBaL9HtNloMsZ00
         mV69bjSg7+XYr5Vh3u4IWUSOQBYISzhbduegdFgjrdZruwxGUdZJwIC5C2COCspLvcXb
         P6rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMpCJUNOLb97qrVk7GXSSnJI+qylm+qTav41SZZPEUEh+wJHHbiWMXwsW73nCrRWL1VCOZA6oSMtnzVmmUS30p@lists.infradead.org
X-Gm-Message-State: AOJu0YwfPGRFpc42YKUQWZGGBnw+FdrBkGpJxzsUFCrxAVvWmEgRyfQX
	84Uc9fq3g1B2KgbijCnVNEzRKXNC7G3QMld9uDAZm7mfaUJcWr30AwuM
X-Gm-Gg: ATEYQzzUzXCq8vlcGOx9fdKW4cWuhkJj9A2w+ILeOHxITvH+zMoEZTutESSX1KDFI7Y
	JOclx+SPKBQXQGFXB5/SDJ6Qr3L+s0Gd2DYEkFqPVmB+DAM0Ig8dFUCbJf4ncqUQX/qUpac+7Rc
	/KHbwRU7xLCN5/XbDqg7rjeSkOE813vim7IIBIUKDC12eeZ0XZvN/KwUTW9BlL9XMxWr6LHybQw
	DZZSEraKt96r3eDYPn0ItQZi7F+zGLXF53jw69fxxQ2LepBrIvN9RlnxSh3KCzD6exrmSxyrAmC
	RFVqw8+VgvXQM3lxRS7TWRjRhzP9WajpGLWP6FLE4NReOs0UNGnqNNOaEyG3kUYoEYs+aNpSY+6
	fQpOhXN8bP3f7yxK6BPjBUTatRLkgYiHfCjG1BNyavjXhmNt/gs0wiD2PHrkANpZx95WyV8vQUB
	27ERVERyg1Z03u3S0zue0=
X-Received: by 2002:a05:600d:11:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-4888355df72mr134713795e9.1.1775135371137;
        Thu, 02 Apr 2026 06:09:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e829c43sm175553955e9.5.2026.04.02.06.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:09:30 -0700 (PDT)
Date: Thu, 2 Apr 2026 16:09:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: cedrus: Fix missing cleanup in error path
Message-ID: <ac5qhwdZLNe628eW@stanley.mountain>
References: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_060933_215583_571D0A2A 
X-CRM114-Status: GOOD (  14.54  )
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

On Wed, Apr 01, 2026 at 10:14:40PM +0300, Andrey Skvortsov wrote:
> From: Samuel Holland <samuel@sholland.org>
> 
> From: Samuel Holland <samuel@sholland.org>
> 
> According to the documentation struct v4l2_fh has to be cleaned up with
> v4l2_fh_exit() before being freed. [1]
> 
> 1. https://docs.kernel.org/driver-api/media/v4l2-fh.html
> 

I wish the commit message would say what the use visible effect of the
bug is.  I looked at it and I don't think this patch hurts but I also
didn't necessarily see a that the original code had a user visible bug.

I read the documentation but it wasn't as unambiguous as I'd prefer.

But I'm not a subsystem expert.

regards,
dan carpenter


