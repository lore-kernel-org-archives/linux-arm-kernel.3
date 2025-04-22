Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97FEC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 15:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAPsYi7X25L/caX0EHEb02SNjtKsf53q45QaVhQBarc=; b=dC1Oxz3Nw0gWgvUQcAPWEh0rbH
	LfwrTGmIwzpN63MpfTvNSnqCGgju3P9hWramapxTY5pZQif+P1GQh8OoGAaKeQ/zs7jxvflvVRkUK
	saF7xioOTaB1p4gASXYu17nnTrYb4spuwcEqe6lzu3U5EYiSmqCu6x5FlLtoAoh6MdPkIoAHDetgM
	HfEnAcrWlVp/Lc8gB5yfJtF3QEj2HPDKoeO8VAGLIUENNO0E1vTswek5ngpLHU353nVgXCyycKNXM
	xuwfcm3c2ESJd/7hxVZiuSDY5EXCE0ljBim/1zSwMt3Kl90zHUqX3yRpMGqOLylf6nvohoqCc5BxA
	TExEaDyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Fao-00000007jR3-0T8Y;
	Tue, 22 Apr 2025 15:31:26 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EOw-00000007S3W-12hz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 14:15:07 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so893557166b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745331305; x=1745936105; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VAPsYi7X25L/caX0EHEb02SNjtKsf53q45QaVhQBarc=;
        b=DSLh9SsVEV3A9Fkqjk2nPLj5e35q3iJjxpUR1gQC0xgWz0rwIOd0WpCxxS6bxQsL5Q
         X0iy4CCLUqp1FKmbyoo+7t655QIEDhKkcxtM963iZhxRobmpgxVVBxi5JZFTTnQ0ImCw
         cd67g1O8C64ws3dEVBepEI5wkOpnUifwe7rfRYTnIFLh/3bT9pOxAAZ4CnJFPc6UNRZo
         /ueJGbY6fcjqTVgA5hGz7Gl2Li8TNOGyyJDEESttCgisxYHjt9fz0fWgg3nIYjVxSmfU
         xR2Dn1h67MymLy0Rbc569DQhzABOMLohgnz4ThHSNsZVpdZ4UOblLnvxr0/XTCXY305F
         j8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745331305; x=1745936105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAPsYi7X25L/caX0EHEb02SNjtKsf53q45QaVhQBarc=;
        b=KG4fvqv+yjLgWHCBpgCaf76xyzVRzRQTA9yJcjP5NWJWqTuz/RhXkuEUOAA6UdfI1W
         b2bMDLCaVFV1K45HjPh1YM1V4NXQzLAnyK1EQgwzfIenE8CSrOy/C04MNCwiqvfmN3iH
         51Qd18xIPS9ZxzwCrSvVQW2flv4RpeuT6yK4C3fY5DKU9uZcuLNEf7kNy5LmitV+vCjO
         pjagPREkcUtBCYrRhF0bCvXFoyJ8bN4dMEuD5AxXTmsLDH0U1OXSznhJErYhtCxNySGY
         D+wwNgWrOfA8THkrJDm3l6RCcyz2aFn+tPOx9SNW0IF8+wzVIttLFDvTiUdNFcCptxfr
         QLjA==
X-Forwarded-Encrypted: i=1; AJvYcCVQVDhTZwcyx/M4LwsmVhM7QqdP929K9K01n+ZBu7X8K36sP63IsyVUEhWGIne0fqjg6ITBTch72EAxio7vISv5@lists.infradead.org
X-Gm-Message-State: AOJu0YzW32f8c+fr7ocz/YnHF1FlqZw6eq3ddeJ40H5hfmh88TNKmy/p
	vGJjaR+CJ9h1aWSHKJ2s4CeS5Ax27okIHxUNgv1YI0oW1eIz83pY9kP+dHGbYDA=
X-Gm-Gg: ASbGncvP92U78JnDNZJymG8Wwv3t6YiuSrjAgISzWYBqpiwZiWATtuEDw1GfjeshPQp
	lZciejVxaBycEv5gk2Ay1jiEXehQwSSFPPWgTRoD+rYDsse0pAhRna91lJuxs6Hj9WIlfmLVu1w
	GSPBqnLfriqVi/jbINLO96r9VVYt+ZyX1QqeGobuwmBZBuvKOecQRc1QtFleKNAaFfvv2X/ihnx
	5q3gD7hVuA7PkUZJTVWSFgCmtY3cWP3QiOnKwaHERh2EyamZsMp92EPnNJQTLiMenKF+hXCI1e3
	T/069Tov6uIsLjN3dvviPixbR5AwTsDBvsjpow==
X-Google-Smtp-Source: AGHT+IFeSK5uLgbn1NZKQrylDdRtKmBHDZDXywYGuDfa4NwCwFDz1VJZvajnIXoXSg2frAfCpTf5uw==
X-Received: by 2002:a17:907:3d8f:b0:acb:66ea:5786 with SMTP id a640c23a62f3a-acb74b88937mr1434632166b.31.1745331304772;
        Tue, 22 Apr 2025 07:15:04 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef468dfsm658630766b.133.2025.04.22.07.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:15:04 -0700 (PDT)
Date: Tue, 22 Apr 2025 17:15:02 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/11] driver core: Add dev_set_drv_sync_state()
Message-ID: <aAekZizB9lR8E4Rw@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-10-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142513.312939-10-ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_071506_303380_4B7D43A5 
X-CRM114-Status: GOOD (  10.25  )
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

On 25-04-17 16:25:07, Ulf Hansson wrote:
> From: Saravana Kannan <saravanak@google.com>
> 
> This can be used by frameworks to set the sync_state() helper functions
> for drivers that don't already have them set.
> 
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

