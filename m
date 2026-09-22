Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FAAC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 19:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmpGFufBK8IPX2EkK5YOeqXtFJPDgkBV3StdAfG8PLs=; b=xvJ45t3CCv4eluNpo84X5AxtGd
	nM7SVDBUiS+1aAR+y/FbjwEjZWxXk/sXxMZIRY1pbyxkV3JxdEUOiJUaJXsxXnhUnltZnaqE4vpt+
	QCU8awWFEkOiZ2J8CJ/dhQbnsm67K3sF2YK2CH7PI9845pzj4th7JjD2UX6y6vtUtbNBxLDQxii2o
	uBadHjx7zA+Vx7ezpfu0r4xK0Zr9CBo3A7ihcbkrY1GGtAX9/kZYz5vD8CkJ3lLha5FxWNmURPAfB
	488oBYJ9/QDgzfQPmqEvpbkl6sy0QrEO9FYV0KVFxHK/pH0IwNzZrrx8Z+fsZgNN+ce8tjYp/R2ac
	NoU0JR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95zu-00000006NFU-1wRo;
	Tue, 22 Sep 2026 19:17:46 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95zs-00000006NEi-0W6J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 19:17:45 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso1087495e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790104662; x=1790709462; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zmpGFufBK8IPX2EkK5YOeqXtFJPDgkBV3StdAfG8PLs=;
        b=AO61iE/2eR2dfdBZG5GWvnWT+rh3NqB2+KjymgVh9daTAoDJtD1uKYnUfRyvquUbyF
         Z7GkpcL45TxD1LdlMZnWh4RGPRfLhR26Ei2Th4517xHihZCCJTLe6CglbSQjwhFZFPGy
         Alb45ZOCyFUFsYCKA27ip0NztpQypOE/vEKbZo7oPovuSPnnZ3R3mpqn486dY22xCy78
         jwVKFnaC4JUiwTXuN/AfmOP3UY3KL/5FCjipKiI2fcI7nLuHOZyjjT8wPC51U2dIHmWp
         bSIjPpdBif5VoUVzKSUf2LfvheAT0g4EaoY+yVgsnURIEqnvy/OaZrvRhlKtomWOHi+Z
         gYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790104662; x=1790709462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmpGFufBK8IPX2EkK5YOeqXtFJPDgkBV3StdAfG8PLs=;
        b=PuyT6X690dqQHwdZOQWTGvplBLYrsivyeryHELxIEXPHxkp/Xu3K2ZxSYQTdNj1+BL
         PD55IM32dhaHqY/0dQ0QTViD8HeWNiijAX1XIAzFJDXOc1j1F+LSh0qoPxEVyyj9XIiO
         a/5u4mmnBSmOudocMJLkgpRhqlMeUtbYG3YXvpbapyfoMaF2PNuJy04HYCNkfFcRbp1y
         Q8+GNzpAxb3+IrG+STk5735Hw3+C69Sm+vFvktkFsBGrFLFl76D5a9jwXv+QBVp6zH+H
         6+/WbDBCFapVQ0fMM0FvqSpsdERFnHYtYmBB7yT9Kw2CzJA0Oaf7rrtFcFFH0v9MiLc8
         xyDw==
X-Forwarded-Encrypted: i=1; AKwUvBwIW+l5HeoGFsElmdEJP3+9ZOUgtDNViGtF79yEpDdvCivhA2KGsacbcOUwE4vRjMYNRtR6u+ZuK+1reMe6/WGk@lists.infradead.org
X-Gm-Message-State: AFuF++nUUP1VGa2yuVLss+v+E2TARfdPR94tLBiPZwZmeMkl+hFZ/zlw
	n3uyGfptBv+myOwqVU4YvJFaNLYtmrp2MQsSbu+xy3vzUKwZ5HJl5cSz
X-Gm-Gg: AYBFou38HNd2Hg9x3PwHZI5iO+GP2FhPf+UGQ74oQZP21gFnm00Ui9UWqMYIBaW+BpZ
	77nD7gHFdoRgD1oRvTtxhcEf31oNHITw7TV/iOt8vwvVSFmf87gz4n3iDrrZvW0A7ReR9gjWwB4
	tEKD4oylFsS9Ff3LYMXrA6W+Zu/RHC7BJLQZ90V2S4BkeDoldH69TXXM2kONE2gupfqtnnCpsdP
	r27GIAcfAoL0zpkE9AJWlUUmT9jDEzrF32IiedKEJbuQgehmR16v3ifgyNtRRA9Vrf6F0zORQsL
	R80zyHfY3Y6BPOqzQosGErMJwhByZasxIiVcluteQUUzsVdkN9XoiRC3Otix8mbrYvpGtXYJNgD
	sC5kpn76wRKtzxiwTgvo7Bl1j7Foyz7sAG9gWoUSPjlbK1qLYrTDDyNXbbyDy30cDdMX+rFNEcm
	0LQh2JYypWTtMngylGxOaoslzgjgV8LNz3CIbaxobL1jKXPfuZqP3wpmUrMIpVtq0jqWN2RFEMp
	dh8Ttysj1VdpvRBUocJp1QcH3EuH3lNlv4jeT7NZiQ3Ki48ay5n+MF3geurqpo00vjukOqkSyom
	W5vGabp9qsQatACKstFbmy0WuNICKwE5ONzfMHxB2b8FERzDBHTMFl23VUZH0Ncwmy1hkH9ZyIM
	6oD3A
X-Received: by 2002:a05:600c:8a0a:20b0:49e:719e:e215 with SMTP id 5b1f17b1804b1-49fdf13b2f2mr1580215e9.26.1790104661479;
        Tue, 22 Sep 2026 12:17:41 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a5e6-3401-f8e1-409a-a02d-633a.310.pool.telefonica.de. [2a02:3100:a5e6:3401:f8e1:409a:a02d:633a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf979895sm2092885e9.1.2026.09.22.12.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:17:41 -0700 (PDT)
Date: Tue, 22 Sep 2026 21:17:40 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: ti: k3-ringacc: Fix DMA ring initialization
 kernel-doc
Message-ID: <arLTj9qVIE0Yz4vH@gmail.com>
References: <20260919163721.89044-1-kmehltretter@gmail.com>
 <20260919163721.89044-2-kmehltretter@gmail.com>
 <6cf8cc99-c2d2-43cf-bcaa-bd9cfc8679d3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cf8cc99-c2d2-43cf-bcaa-bd9cfc8679d3@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_121744_186201_562EDCBB 
X-CRM114-Status: GOOD (  10.60  )
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

On Tue, Sep 22, 2026 at 09:34:49PM +0100, Kumar, Udit wrote:
> > + * @num_rings: Number of forward/completion ring pairs
> 
> Sorry from where you got above definition of num_rings

Hi Udit,

It was inferred from the code. Is the description
inaccurate? What wording would you suggest?

Thanks,
Karl

