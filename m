Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E902C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 06:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYStztFya2y5gjqP02BNpybAW9yRhWvY1XlPanf+Ykc=; b=qND0Kfuz5nqNpPiX1XyS3pYZzc
	a16Ey+NzpGKO/Xxbvr4p9uVg2mi75pOy3xyO48WYB/6VYH2iJ25se10xS8l75Fl4ib+zbDXuv+pri
	LZmjMUEG6o8S3O+umBVQlQcOk/GueL6aHr66iU1liLNXSCWO/hR5r+Td0M/sMMztH/JsPSojlZPNj
	VFU8wi+X/fWB4xBDa+6oljdmm4QQ+EMZBx4EIQ+jX+a7KK60gVJ/Y7+FCnb5vrxUNeVHEbWPmsvZv
	c4FUJMEuq+OJfDItdmNQ4cTU317uwCzWexcam/Tkuz2+z04aJ6sfF5SgtNEKui1M2U9Wh2IZCegJh
	xRDXrpNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lGJ-00000009LnM-2owf;
	Thu, 10 Apr 2025 06:19:43 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lER-00000009Lax-0VCe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 06:17:52 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-391342fc1f6so252784f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 23:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744265864; x=1744870664; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jYStztFya2y5gjqP02BNpybAW9yRhWvY1XlPanf+Ykc=;
        b=uuDY1/qoz56Ok2BYvDCBg6adHmBXsn/Zc5Nqy5+M28h9bBJu8pbMTXYYEZG8HK/dJL
         yok4nzO4PYUlmOcz/fiG3BJlsmL+wK2gIDfwcVjkskoJ926KU9WkFOwy5oWX1qYMOQWY
         CSvQSINCp50EWGoUnn7mDVCuAgEl2147moLgmu0tXHN4xcwrfHY1bzR3YcoKZsk5QCtW
         lCjbK8ILdkp2TBQxLIlQkes6yn5cZu1dLatoiDH8CyjqCyrvub/frV/y2GKd6SJNnAmp
         DGPYp1LrqUk1UJrE4WObw2ZO7D7auGsQgfp5QqrOqJoGNLvId8XHlkQA3S47TNINKo0y
         UFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744265864; x=1744870664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYStztFya2y5gjqP02BNpybAW9yRhWvY1XlPanf+Ykc=;
        b=RKAXK2Br3yZVaG57YoJOkhEAhmb/l8Msapgi94uYe4O3CneOQlr0rxHg8LVJ+5+Pli
         egS4Qkfk5ByY5GSbzsRwbw/raidzB73mtquxK6yvoFLI1qFiJqrdKdcJ06BtzUhSS0up
         c/jZ4gYivBf+7zPcwaK/Zl48xzQ1hp+ebKEUGErpyIbARp5p39kQR3WjRTfAYa+7aJlN
         D/6ySWt/KkjasOsM1Q5H6l0GBlGOnYW8rU3e3/yBpuqdn2HYzX2eJuLefSBoOiH5Uyxm
         eNeKlyINT2ne5DrB/1+nMnj1ZayptwCTUykxQfqB2lRLopxyZ0EbE4HiWvRWsr9MY1JB
         p/NA==
X-Forwarded-Encrypted: i=1; AJvYcCUZZA8Hhiy7DTAqpAOVbt0iBT2/YigReQcpgErv2mRYn+I4HibXZnvUWEg8KrHqWXt6CGDE2lj54CxLprtbSOmE@lists.infradead.org
X-Gm-Message-State: AOJu0YzqW/F5HYjRL/ksHQ7VIw5BJAEZSUC8bbwuUZrXYEs0XNptxVH0
	ZKbUoFQJAQxRcrKRglkI8q91bI1hNIoUUwKLfqmIE2JMOo+HboD3uyP4vh5W+Js=
X-Gm-Gg: ASbGncu9ZPlobwBAjlbHBzjvq2fiJYaSdl5cWu25de2sCUWTf+K6rkG4e4t3NPHaSDx
	iPxn/6Vx95DWFH7bbOQVtMxaVlET3bN8+o/TKfIRV7kikbrABgf3KydayB6WW2HymHCUC+E8n0n
	8TtQStdMoBGfaOyQyqkDs22ZmR+65kpvfrxuATZiqOrxxG6NbSE3RsI67Mbo/Jym1Cvs3Sf5eMn
	5FwDP6VockPlsLMiaE+pjOaC0K3cX3feeqj+cUneyh7+fQB55pmYWcJWPKXA0hbQ8bhyLtnZrwk
	5Fc2Y5dEtfj9bkwTZjpU3uKstRZzF1eDV6VG3uD/Q+S9dQHkqg+li3Vv
X-Google-Smtp-Source: AGHT+IGPf0mN33Z8VXMC6vHoEgIYPUGu+ettg097AataOUXjxz6bSk1dsUcrvcjBIRQZplQw7qTkLw==
X-Received: by 2002:a05:6000:18ae:b0:39c:2692:425a with SMTP id ffacd0b85a97d-39d8fd63d92mr746462f8f.6.1744265864279;
        Wed, 09 Apr 2025 23:17:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d893611d0sm3664353f8f.6.2025.04.09.23.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:17:43 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:17:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Siddarth G <siddarthsgml@gmail.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] staging/media/imx: fix null pointer dereference
Message-ID: <0d496695-ce20-4774-8e86-4d5c98dc220b@stanley.mountain>
References: <20250409211727.62710-1-siddarthsgml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409211727.62710-1-siddarthsgml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_231747_165193_20FAA785 
X-CRM114-Status: GOOD (  18.73  )
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

On Thu, Apr 10, 2025 at 02:47:27AM +0530, Siddarth G wrote:
> Cppcheck warnings:
> 
> drivers/staging/media/imx/imx-media-fim.c:79:6:
> error: Null pointer dereference: fi [ctunullpointer]
>   if (fi->denominator == 0) {
> 
> drivers/staging/media/imx/imx-media-csi.c:795:27:
> note: Calling function imx_media_fim_set_stream, 2nd argument is null
>   imx_media_fim_set_stream(priv->fim, NULL, false);
                                              ^^^^^
This is a false positive.  The false means that we don't call
update_fim_nominal().  Btw, Smatch parses this one correctly.

> 
> drivers/staging/media/imx/imx-media-fim.c:388:3:
> note: Calling function update_fim_nominal, 2nd argument is null
>   update_fim_nominal(fim, fi);
> 
> drivers/staging/media/imx/imx-media-fim.c:79:6:
> note: Dereferencing argument fi that is null
>   if (fi->denominator == 0) {
> 
> To fix the issue, add a check to validate that the 'fi' is not
> null before accessing its members.
> 
> Signed-off-by: Siddarth G <siddarthsgml@gmail.com>

Don't resend because we just ignore false positives instead of
trying to silence them.  But if this were a real bug then it
would need a Fixes tag.

> ---
>  drivers/staging/media/imx/imx-media-fim.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
> index ccbc0371fba2..25f79d0f87b9 100644
> --- a/drivers/staging/media/imx/imx-media-fim.c
> +++ b/drivers/staging/media/imx/imx-media-fim.c
> @@ -76,6 +76,9 @@ static bool icap_enabled(struct imx_media_fim *fim)
>  static void update_fim_nominal(struct imx_media_fim *fim,
>  			       const struct v4l2_fract *fi)
>  {
> +	if (!fi)
> +		return;

If this were a real bug, then probably the NULL check would be better in
the caller.

regards,
dan carpenter

> +
>  	if (fi->denominator == 0) {
>  		dev_dbg(fim->sd->dev, "no frame interval, FIM disabled\n");
>  		fim->enabled = false;
> -- 
> 2.43.0
> 

