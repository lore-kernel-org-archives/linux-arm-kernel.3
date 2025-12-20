Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F261E668B1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 16:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7EP/tpx9GWxii+AYAC7WJOYO3DbJ6aXW68IWJvk5iw=; b=de3wrpKmjsUsN/Tb9hCJi2Ppi8
	G4y8bYPqrye8Hha1Yg2S9gUxil3q0e4+CCLBfjKS/pja/qYvIW5To0raWkSaCz/PWhsToSoGLxUaT
	34fuJkZl2QcsRbpUSQGT3M+GKon5S2pnaZgy8idgKE5sqHfQ+9+K7jIG60yQOEeuAWpRG294Sqeg4
	GrldMBtvG1fLg4So2vEkta0ek4O6KFYZB1mUVBiMUCug5ZY1S5Ixu4CsldAgIXEzoTwnU00Iv526x
	F5RhgLkgf1l+QxQaxHDaaB2dAwNgmbbrwNvlVsXMZO6F/x1PlxnerKbvH8riNlOAKw9xxKwBFLd1E
	sR3Bg+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX06G-0000000Bl6s-1JGD;
	Sat, 20 Dec 2025 16:46:36 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX06D-0000000Bl6B-03wq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 16:46:34 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c03ea3b9603so150841a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Dec 2025 08:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766249190; x=1766853990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7EP/tpx9GWxii+AYAC7WJOYO3DbJ6aXW68IWJvk5iw=;
        b=boRNm4DeHiOkRSUASk3dJqek6+qzmWie768/gr9+FzEwQPo2SZwmq0+xitskup+u+M
         xeEqNXJsQyNZjber3T68eMmqzzjgugsaQdJBNwwcKOxhuOLYRjeME6R4vNzYEhLpew6q
         9EbCgJ65zpCrw+b/ti9VnOo1NE3k15DRZZE0TXTlgFRZrl2WsDTDSv/XVipfw6+crNrX
         VCTbPWoEd4yIuXZmdvmjZCawEYbuNyMY7LttejNPy+DFBzYCNX9VFTTe+wAdLyIZzYRe
         D0m3hiyjhxoj39s3dlhXdhx7url6Eo5zzICcccWWWEW9XJ4z/LxsfIobLR1DgIPegHRQ
         Uraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766249190; x=1766853990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c7EP/tpx9GWxii+AYAC7WJOYO3DbJ6aXW68IWJvk5iw=;
        b=Ki4tp2jXpMeLFZT1lEv9tLpQoxwXxMwPwNx/fQXCbFe1d9L/S6Ud/sfv03zAWZ13ij
         7RkQ5a8IESbaW8ck50P4VmihsCkz2WQGIC817NTaC3bebC9uWwaU9ODBptrS33kka/Gd
         KX5U4TJSKsp2qRKheSwHCoEOnexG1jYQqIGGV3V7eAqKCHdl8ZtSJhaMsOx1MffJOU+0
         c4gLKlKH7iLEDGl1rXj1wK3SuErPeBufcmd22hQfLnwXFISEteKOzAyHT7CkRxZ4sJVA
         8iESLjmVH5ABiGaLKZSj01oiFw2ebNlu8BmPKv3bW3Kzw77dautKLSwVF7Kw0cR+YdYe
         3Xaw==
X-Forwarded-Encrypted: i=1; AJvYcCWazBWOWljVEn60vMV3Gq6U7jtl/xlP4FVSU6uevuqNmR4nwm9PK1bMi9PDXqkch5RJrbfcB2L6IbagzFo31rUb@lists.infradead.org
X-Gm-Message-State: AOJu0YyNJ3HmfXT/1TXyMKQqwexQVGejATgdRyy79yEEuajFoMxPoSkJ
	ooVLCvMRfJbczGZCNwY+OhboBKTAg/XXXH65z8MsgE6RFLj4dnjHoOou
X-Gm-Gg: AY/fxX5lRpeO9iEj50UFT2XDPt25D/+bOJwDGdNavxX21cQgMzJWjQGnL+KJ6CLJCCC
	koQXbU5h8nqN+QBP7e5UvF3TrcYTQInrT4sPkqE7OPPpmIvQLdF2JQxNDwxWyOekIr18MDi3M4R
	n7vKIu2BDpk/tnl1/INAvqSfe2Z8XT+XY+GyfJeuyE3qzgTRIjcm4wXnPImdI5Q/6uCrksVIcZO
	smpwLCRZIkUOTQyEdH6ThX04iQaQ+p1rwNyoxhUglWXKugAX7ecpBBlutFGovPCWEmrbSiMUwq0
	6Q9S0Bqff8B9iOnQGMj7QzstAj5PL17D78nLSLc10vbjdiWKaz6EivrDI4hpJQ4+eH78yFnM3vL
	F/7NEVlCgJwqi/nXxHIehImvCY5oiyfNa5I7szvivBa/QKs3CYnaWk3/N7RDFJgemhR2yGjT3Fb
	fFtYN4gZqAJbQ=
X-Google-Smtp-Source: AGHT+IGdbB/Ckh95eIe2oO+uZBQ1VnyCdlca/UmZcXPpvQIRCA3Pnsjbf93FSIDDgBGYnoV1NiUdeg==
X-Received: by 2002:a05:6a00:a89:b0:776:19f6:5d3d with SMTP id d2e1a72fcca58-7ff6430c36bmr4406942b3a.2.1766249189699;
        Sat, 20 Dec 2025 08:46:29 -0800 (PST)
Received: from rock-5b.. ([45.32.55.39])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfab841sm5623899b3a.35.2025.12.20.08.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 08:46:29 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: detlev.casanova@collabora.com
Cc: corbet@lwn.net,
	daniel.almeida@collabora.com,
	didi.debian@cknow.org,
	ezequiel@vanguardiasur.com.ar,
	hansg@kernel.org,
	heiko@sntech.de,
	hverkuil@kernel.org,
	james.cowgill@blaize.com,
	jonas@kwiboo.se,
	kernel@collabora.com,
	laurent.pinchart@ideasonboard.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com,
	opensource206@gmail.com,
	ribalda@chromium.org,
	sakari.ailus@linux.intel.com,
	yunkec@google.com
Subject: Re: [PATCH v7 14/17] media: rkvdec: Add H264 support for the VDPU381 variant
Date: Sun, 21 Dec 2025 00:46:04 +0800
Message-ID: <20251220164604.10052-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218232829.337811-15-detlev.casanova@collabora.com>
References: <20251218232829.337811-15-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_084633_074978_F07FE788 
X-CRM114-Status: UNSURE (   8.90  )
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

Hi,

On Thu, 18 Dec 2025 18:28:24 -0500, Detlev Casanova wrote:
>+static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
>+{
>+	struct rkvdec_dev *rkvdec = ctx->dev;
>+	struct rkvdec_h264_priv_tbl *priv_tbl;
>+	struct rkvdec_h264_ctx *h264_ctx;
>+	struct v4l2_ctrl *ctrl;
>+	int ret;
>+
>+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
>+			      V4L2_CID_STATELESS_H264_SPS);
>+	if (!ctrl)
>+		return -EINVAL;
>+
>+	h264_ctx = kzalloc(sizeof(*h264_ctx), GFP_KERNEL);
>+	if (!h264_ctx)
>+		return -ENOMEM;

I can see the sps validation is removed:

	ret = rkvdec_h264_validate_sps(ctx, ctrl->p_new.p_h264_sps);
	if (ret)
		return ret;

This should fix decoding issue with chromium when minimum size of h264
decoder is lower than 32. While I find this issue is caused by chromium
not following v4l2 stateless spec, and I think checking sps at start
should be still necessary.

I have sent a fix to chromium[1] and it should get merged later.

[1] https://chromium-review.googlesource.com/c/chromium/src/+/7274555

Best regards,
Jianfeng

