Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32FFFB5168
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 21:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6xJ/zDoOR7Os811YjMwToE+cggB6rQ02aG/lrQ8U/U=; b=JAlvhay1kk1tTP+HclFhKQr+HO
	XToPSmDbzNOjw7kfl2rlXkYGJIN2gouWX2dEsYRG+00fVNEnBSC6pUTnOd/ggHQxpC+lRNQCvw3HG
	+k+WMTaR1mpJdY4TOc9OhN8sLJQOFK+7id6lZpjsC7pNnckkGolf5m/8ZO23zwMYtv5RrFBIwJ0lh
	m17OhKEYGbQOFHfAIPgqsuEEFylSVtkzasj+eMGDEnX1HfvxOcaKTXFrxGEcx7DUAOgXvi8an7YIY
	5N31pCJmLzf65YnA2QT6cs3Mz7HZ8Z0bQQbA73e65ZqF9M7G567WEGPrsZWIvaE/9Ln9CZi6oeGoP
	JN2c+kAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9rPq-00000005Wb5-39nB;
	Mon, 06 Apr 2026 21:23:26 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9rPn-00000005WaS-3jaz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 21:23:25 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-38ccde812ecso42544621fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 14:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775510601; x=1776115401; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6xJ/zDoOR7Os811YjMwToE+cggB6rQ02aG/lrQ8U/U=;
        b=LvSrOS+eL4iSirvgUNG1RfCIfXh1JEKSnjinf8S7GDlsdGwjXSCgZK42DlVLkhT+iH
         EfFEix7Bdk6THQV8UsNOPnPy3boV4NUsCUFn13BXy7T9clQ4HEvJSvFqx1vj7jT9cQMf
         u37ALQiMZZ6hPXSkhZW8JLKN3zMLFSl/qZ7y2kK+CMoUuFF1g/i23Sx3G0olUZfPlZ5L
         k3s0DC5M62qewtxqe5025XAsmT5lQOz2UWYeONY0pq1kyytwUgpEuwJnLKS9stLH0P6C
         QuEnB3lgif5Da6idvaAOsFt6nfo1YZ7DzXGwEXozX4mvtMt/EYQWhzOyoUbZtWfxN7oE
         R+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775510601; x=1776115401;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q6xJ/zDoOR7Os811YjMwToE+cggB6rQ02aG/lrQ8U/U=;
        b=B2TcgmncRSs+xS3wBisBj7wRU7qMM689svrWpG3wRHhj8D/MdV9feg8c0pibrCMtzJ
         LiYGIPuxQICxWV1x50Z0/EDiGQ5sjqJ+oUof6If8QKhsMUspxxJuYRCsXFgRdzG3+54o
         L3ghqBx5XKvV67YUkSHO1OqAWK5NlghqZTEBdjI/HyI2lG7w44pswEp24HZX+8DUvG6e
         1Mnz3hOeBih4TNu/CsygGMVghYDBPuOE4ZcQlzEFGl7wUYoGVRholvAvkXytBdgmWtoy
         y4/c+rl4qkkEOPUgdAuHP/yZ2GcFHdcOa8JLGpFm7+AOd2gI3UkZfEL5GzaXRqibZvga
         xonQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPHAAYNUo0sqWZVSn+mTQRAYT7ZotrDURocEHyRkuOzp4gYXfi7JoMBQnm04wtlufzreKnzuV4rnjCMbaYwcyX@lists.infradead.org
X-Gm-Message-State: AOJu0YzFJiJdaMUJCmrcI4cOnZdOm11jTJLggC6TphsZnq+tWO0Gh9U9
	ksOjJTWpkLGr769n5Ithr5dyPGoEra29OXhOfVHimzEDd4wUKvdWAeUQ
X-Gm-Gg: AeBDievQ3eNDU+BIQSgofSyHevqVgycfoXcSzbBgPbfbDl2x17Y/8cSmetThbAxCEWb
	x063xOI+yloXfwG2VtvCj1t3zKTMYoevBSP01mTF90RdVgHGzr/47uEWsr8jB+jlVba1aKwn3IE
	LP2MG0JwA5u1LZ21pw/UMx22Y/+/BT4Bg9IlEGFpowrw49EONrKgrCC6N3Lw9atgnF3+WBt9GQb
	2ddNgGdolKPxw/xXcywZLTAmQrP+ged8+CHQkeMwYrk9xc9towAmt85NPpYhdecFqi7UkhHozO/
	UqWIMRUghErXP8aUHhEJ2xDPTIBR3HpJnPR947AmfYmD2LtBQtqP1VqwndE2PWcUTqQ9v8Tv3xi
	NfwJ0CxBgOZhIyFqR4djxCD3g3VWCLJhFO4zrWvyb2WxINOtuqxROPS/ERuj8oBoOJtGVvCk7Sw
	uLe7PtV2lCy9mvJ3mgvnQ8lc+SmJo=
X-Received: by 2002:a05:651c:1a0a:b0:38a:3498:e2f5 with SMTP id 38308e7fff4ca-38cd6e4f078mr57915391fa.15.1775510600748;
        Mon, 06 Apr 2026 14:23:20 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fffb53sm32700151fa.16.2026.04.06.14.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 14:23:20 -0700 (PDT)
Date: Tue, 7 Apr 2026 00:23:19 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dan Carpenter <error27@gmail.com>
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
Message-ID: <adQkRxR9gmAPHnYI@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
 <ac5qhwdZLNe628eW@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac5qhwdZLNe628eW@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_142323_952246_A0609F21 
X-CRM114-Status: GOOD (  19.97  )
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

Hi,

On 26-04-02 16:09, Dan Carpenter wrote:
> On Wed, Apr 01, 2026 at 10:14:40PM +0300, Andrey Skvortsov wrote:
> > From: Samuel Holland <samuel@sholland.org>
> > 
> > From: Samuel Holland <samuel@sholland.org>
> > 
> > According to the documentation struct v4l2_fh has to be cleaned up with
> > v4l2_fh_exit() before being freed. [1]
> > 
> > 1. https://docs.kernel.org/driver-api/media/v4l2-fh.html
> > 
> 
> I wish the commit message would say what the use visible effect of the
> bug is.  I looked at it and I don't think this patch hurts but I also
> didn't necessarily see a that the original code had a user visible bug.
> 
> I read the documentation but it wasn't as unambiguous as I'd prefer.
> 

Thank you for the review. Currently there is no visible
bug. v4l2_fh_exit() in this case only destroys mutex.
But it may change in the future, when v4l2_fh_init/v4l2_fh_exit will
be changed. I think the change maybe useful in this regard.

I'll describe this in the commit message in v2 and resend it separately from the
patch 2, that fixes actual problem. So this change may be skipped, if
maintainers think it's not worth to apply.

-- 
Best regards,
Andrey Skvortsov

