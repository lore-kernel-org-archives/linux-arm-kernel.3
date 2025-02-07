Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F592C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 02:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ihgnc3taSXbrknD0hSr+bBzd9N3zZ9ifJfj9N5E5nmY=; b=i41fyY3j687mWXQbHRTWXif6Yc
	nuQSg7+5DAKwO+GbyXWY/UkAB7F9nJJpoZHHkoWcq7WNK5Oejj5CqJI0Ueh6u6MzdVCTJzol9TAAJ
	0wz3KU4GigsnT3XcHK6Q6R002OtSe2mPmRE6jLEJnHkan1dO+84UGjNp5Opt9Gd3O+ZdtEebc3BQ8
	bhIjLuu2zAQCQRtjSOIOLiyqtA4Yvnc9hL6b3MaQCDqKDL2VmWuVfZuXvfQihZcNYDgVu1drxw6Cu
	MGbKnmUmnUTL2TKHoJjd8s3UugTqN2TrjDQn74qz6hvMXObPi2AYwzz/OAMKm2OyiYTzbuNB/AqjQ
	HDIOM+7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgE1f-000000084kp-2gCk;
	Fri, 07 Feb 2025 02:23:27 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDzN-000000083zT-0ENs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 02:21:06 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30616d71bb0so16233021fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 18:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738894863; x=1739499663; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ihgnc3taSXbrknD0hSr+bBzd9N3zZ9ifJfj9N5E5nmY=;
        b=mgGZGpGgAPdXkUnzT78L/g1zV/uaQpsdAswNc3bRQlwnznecA44yCgBfIvNJKIwX3n
         /flbwZn4MEmpHsx9HTapfpXglVTGKd1ElkmTddJt63y58HBVVFNbRdkKn2+1FbgkJbxV
         EK2JMZy8VTylIJh5+72wuRNmQeeOaFU7lF+q0hPTHcZe0ckfMsjHF+/KANv5RD7bYUOt
         prJ7GzdqYPTl1W391T+1HJHohZJbK7m3xfHubw3OLrPXktEqY8J2JVy2N9lUNPVXVYVN
         5afkJJs5RnPNUQTC5IBoasLtJ5HAIRJMGkT27WlQODgtuZURWRgfYS11io+ahW/ad2w0
         0/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738894863; x=1739499663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ihgnc3taSXbrknD0hSr+bBzd9N3zZ9ifJfj9N5E5nmY=;
        b=NeMb9Pzb8+eH4e7QmouRSN4Ryp0WjBEc00cnsXbq6pDKqEd/2anpiNxPRcP3iY9rYl
         tI4fwgAKXn+hQuZVxyXwdo/YoTVcw7fP8ERyklmNPwNNYbyOibJyvAUaneRnf5VA3XzW
         kzOBVlTknvXXfxowZCZS7MV9ENg7x6L55qvzz4VExHJDjzIMOePBUG0wtJzpe4b+Of3N
         8LjPLib+b2K68/IdwoZXtwmMRBwmOI44WLj7u6RYjVZvG2hc1bpWj4FujTcRoePtiBtc
         pqXLTJOZSNN1VEu/J8Mqj36+7wNUjxxWFX0LgI6g8XbSCXkhjCdcw26dGLWqRUxQtIUw
         XKiw==
X-Forwarded-Encrypted: i=1; AJvYcCX9T033oCU98GjA9clS2KqFPk3ew3UZU4B4eiEUbhMmiyFxiYTURwNjWgdlTB80rapIkivrYkOk9Tojyht79/zA@lists.infradead.org
X-Gm-Message-State: AOJu0YzHb6VT1+xMnCQepQBJBwN2HvMI3bCvvXzV+vlxHPdntDUxsu+a
	RU3jYDd9S3W2nSv3nNzp9Lbi4q8WDYSaysQnlDsgVboCcw260BfkUKEVbYJqogc=
X-Gm-Gg: ASbGncvLGo5fQ6Ed1H6M/q0OXXwnsKp6MBXCFPc/e/Lb4m30tSSA3yiA6rnIQ7eY9Y9
	tf2xVJLqzHQ7pfm2y4me1wzocOqZb1Grv0kqs88SVB5gsH5LpmYtwi74H26tHQEbBtPX9RBhENH
	HZcZHZ3SXimZpzKbgi/c2vhcM722U84w8W7qVFy7dYRXNw1MvI3t1/+ncyx4RSQqlPcAs48mbkX
	upmNGBGjrAycIV35Sk8MCc0YKxMUtoPGB74va0DASdOTPB2eQF+mfBxU/WEQHoHZCmu0thsUAAd
	oLLtHIST7/+eX0u6N1Z7n/UnTat8HjSFMfrq04ADKIupkPpX5fUVZcN5mMdVjtLpw87CGnE=
X-Google-Smtp-Source: AGHT+IHRDTBhlu8pAlsQ3oP0N0FtT5qdWC2jNVUTMMclmHpLd2GBk+UOaDGiKoBFjKCmUJyp2r/OWA==
X-Received: by 2002:a2e:a913:0:b0:300:3a15:8f22 with SMTP id 38308e7fff4ca-307e581b0bdmr3526211fa.21.1738894862959;
        Thu, 06 Feb 2025 18:21:02 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de177d22sm2841571fa.2.2025.02.06.18.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:21:01 -0800 (PST)
Date: Fri, 7 Feb 2025 04:20:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 02/26] drm: of: drm_of_find_panel_or_bridge: move
 misplaced comment
Message-ID: <w4iufoohajidadw6s6qwaa6uo4qna2yepieb4qe3thkk5terwe@m2b6wogduiiz>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-2-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-2-9d6f2c9c3058@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_182105_092234_62581BE4 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Feb 06, 2025 at 07:14:17PM +0100, Luca Ceresoli wrote:
> This comment is misleading as it refers to one of the inner if() branches
> only, not the whole outer if(). Move it to the branch it refers to.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

