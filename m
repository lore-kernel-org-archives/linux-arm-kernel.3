Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BCBC02182
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 10:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnCt5DjDOmwR4I1vAJ/enzzSs6/BjfG1IINpOsDqGQc=; b=wUI9qqFDdkmnBw0XUigxNxEprw
	8rdGdAZ1E0PuVPM4ZDSiHsKCi7mpi6aNMYEYJmzQrhs8PvekVjaHL0iFi4sd3Y5Aat8Iez4DUVqFR
	KrpEf1jt7z0GU0zwTxCA2Nebiu5zc0dypFoupCwu9j7fJl9bcUALpWopC2PRZfZjn1knHTx/607tP
	3SjlqNt76cLbVDpF5bE18Chp7ZgWkulDGc5dq4TPCqIdkrFBoQZewsuX3YOT0lqdqfJdmdVx9uiaB
	mi1xjLVzrjClGB7PQ629x+yp0RSVJvInSwwGC+YrahsV6HInblOmkT33HNgNOuxYFFaoZKhhY7pqr
	z+zl9QEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZpUE-00000005O1U-17IF;
	Mon, 20 Jan 2025 10:58:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZpSx-00000005Nut-2CoD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 10:57:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso29566905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 02:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737370629; x=1737975429; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnCt5DjDOmwR4I1vAJ/enzzSs6/BjfG1IINpOsDqGQc=;
        b=lVRt6Y8n0fH5z9dLs9ayAob1UM4h6+sjx6DgPAnRi48xV3Gdya/1XC28awvL4mIELz
         QAEzY5gvY9DdVV2h5RkWcEWf9kFk/sn73nJNzmV3cYgiJ7A+HUMZlgUaME9WtqTGbawh
         /G8mEQkNVjGx++twYf29RjO2a4BCd/+OBHBNVqujFxf+8fZtWmeS1J4WYhYv6YCacIAt
         JyDEudG4JWcwHad1V/YZgQ/vLVfU0uI1YBTgOseRd1ceT6fZzaWTu2UWd6UY+PO1aEe7
         ZK8fTyWI+7RDsY92mCuXGVTZy3v6GggWXnKxOqqRNEFfjaXRR7wp9CGxe1LYGY8AlkP2
         agsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737370629; x=1737975429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnCt5DjDOmwR4I1vAJ/enzzSs6/BjfG1IINpOsDqGQc=;
        b=otu3lP7iyeMAHDLZFlcUJS16HA+2EbIgyRY9g3eeljztNsufMZHafAVtAIhOQHtmWa
         wvtyMWmpZs+v0mm0K4ykZkf8X5fS/taCvO+OCq6Xn2OQYt40DaKApiEoAjQjl4mMxAj3
         AGotfVbhBh4khBGAHPG+T1keliHtdChjbG3+TWdfZlmVjybrPiE4t1D3TRcjqveH94Xh
         NtvvglQZQyoQeODNivsAW645NDMseN/xStmRyoLVOi92PPjT18wIXllIpwG9KkJml0RE
         Ur4Zu5FGLfLV4ZtReF6DXIRJb9SMGj7ysQvVM/rcrBnnzWZi/4Bptb53ZiQK48LFqnS3
         YeGg==
X-Forwarded-Encrypted: i=1; AJvYcCUKGsyn9C8GEQJDcKZ50fMnje9fxy5G1YrB5Fe7chf0TDmlSN/A847AiyxtH7rE+YuVrzrUNyt+DV19vGWtoGJ0@lists.infradead.org
X-Gm-Message-State: AOJu0YztJTyyV0e3LOSwBHfB4QdbA+mPVNXa31q8cNwum2iJK18tWCu2
	KvgUPmRVgpkG7DU7YzP0sqWY7zRSKAbnasWWH07o9YEj+WHsm+XH+45vmvIh4xs=
X-Gm-Gg: ASbGncs2HPgpDS0VH8tsK7fvZHJhwoBkIgBGGIVQUV+Hmy9d81NJHAiDcgHcTPEqYJD
	Upd6iz9Q/zCsq8wNWD0Z0K+G6tRudkw71XHZ6MRsBN+eUU8TuR4HirMDXSdQj5aQ7v1D7b06rFD
	rsMuV8/qv26NKQqRer3alaczGdVXEeePQEVdn66zEbVgGIyCH6SKFT3eF/Tgc4lK4kG16gLbqSv
	MTNq9YwFv0uaxnfFf1c7c5q/nBWcZXhixJDeA+C3J5+URjMw2/UkBtc903Y0e2tiQtYmxoi3ZE=
X-Google-Smtp-Source: AGHT+IFcWdDkIWIV3+3k8GBszP8VeZU7+D+s8s4XaEHc4R+KN6tCXBGU2C0qdKTOyDm73nBXW992qw==
X-Received: by 2002:a5d:4b48:0:b0:38a:41a3:218 with SMTP id ffacd0b85a97d-38bf57a2612mr7545183f8f.36.1737370629606;
        Mon, 20 Jan 2025 02:57:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b7fsm9969683f8f.27.2025.01.20.02.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 02:57:09 -0800 (PST)
Date: Mon, 20 Jan 2025 13:57:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/4] rtc: Introduce devm_rtc_allocate_device_priv
Message-ID: <a0403834-1c2f-42b4-81f3-ca4123fd2a4e@stanley.mountain>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120-rtc-v1-3-08c50830bac9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-rtc-v1-3-08c50830bac9@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_025711_592937_A269871D 
X-CRM114-Status: GOOD (  13.90  )
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

On Mon, Jan 20, 2025 at 10:25:35AM +0800, Peng Fan (OSS) wrote:
>  int __devm_rtc_register_device(struct module *owner, struct rtc_device *rtc)
> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
> index c4a3ab53dcd4b7280a3a2981fe842729603a1feb..e0e1a488b795645d7c9453490d6cdba510cc5db5 100644
> --- a/drivers/rtc/dev.c
> +++ b/drivers/rtc/dev.c
> @@ -410,7 +410,8 @@ static long rtc_dev_ioctl(struct file *file,
>  		}
>  		default:
>  			if (rtc->ops->param_get)
> -				err = rtc->ops->param_get(rtc->dev.parent, &param);
> +				err = rtc->ops->param_get(rtc->priv ?
> +							  &rtc->dev : rtc->dev.parent, &param);

This seems kind of horrible...  I can't think of anywhere else which
does something like this.

It would almost be better to do something like:

	err = rtc->ops->param_get(rtc->priv ? (void *)rtc : rtc->dev.parent, &param);

The advatange of this is that it looks totally horrible from the get go
instead of only subtly wrong.  And it would immediately crash if you got
it wrong implementing the ->param_get() function pointer.

regards,
dan carpenter


