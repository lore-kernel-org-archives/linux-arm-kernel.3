Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFEDC71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhvWwZ+CXS9Vy+57dCKjZUbuHrxsNmbe1LsJ5SFrRhM=; b=J0z5qJawU37nJOxOoCqIyA10x0
	SvF0jMpVqxn7MFajrEefaEvdnfk00Dy1/AIdpXn7D89uLT5WZ/UZJjs09C+fgkWD6Jeg37lzAJaMx
	p270cBdaytC9ZcdbvjSAQx7rvMgNMTG6qmCR8MAeWIvTU8Z7MlJKJMR4FQ1QeHeWJiwbNMLpKkhQB
	SvMhALJi3xVOjJ+od95hyckYygX/UrL2q+IaybY4iyCenBeFYbM1+ymytTMOWbLI+hnhZQ7ofRXTV
	yZAK7CQACPLV9JfKt8aerAqWZTwd6cAXR2AYMOKdNkk0cEwvWHLpZINr9wXKQnxxEL9pUDKixFlIo
	ilLdVR7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIXZ-00000005iot-30mg;
	Mon, 16 Jun 2025 22:42:57 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRI91-00000005gD3-17QO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:17:36 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2350fc2591dso46341405ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 15:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750112254; x=1750717054; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhvWwZ+CXS9Vy+57dCKjZUbuHrxsNmbe1LsJ5SFrRhM=;
        b=FGAboZkgL6gfe8Px+ieq+AopimwBnx/3BV2/s55X8qGsRQoa2fWL4R+9/y3U5l2BL5
         w1xSddURLazQweA6LkepuH0AvaBIyVAy7k/ld9KE7ZzG1/lIpvlQ16KLzp09thxOkrr4
         40Te+4Jmnc2kFVExq5XoN01i70QhGroGAeZsv/alYkUFFIob5D8h8zv65gnlnr11TleZ
         B3ViMhmB+P4W7ei1ccDlXcS4OjRmFbCKGG/m0cRM/ucHCnvm05QGTVexnuvlCjetNPoM
         Io1iNnsl+O8Vshhk+ufNuoQGGhh4Jx+d8ONI90yG+sujUb2fTZsTqz7SbjJFPZzVr3L4
         T0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750112254; x=1750717054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhvWwZ+CXS9Vy+57dCKjZUbuHrxsNmbe1LsJ5SFrRhM=;
        b=xBG6dgo18CStBH8/hQOKLaY19VZhlAXuxx2VAG0ISW0vECkf5mDwr161j4+RjtCRU7
         AKkTOrrhCNPswdcuKR6G7Rej8mG3z7/tcLnKuNUk8ND+9s08QqD30ys/94uPA/fWQ4iT
         iPBEtqwOM5WiP8sxyUcEzAJHvK8/mjp4mGMry6P7ouuZ5/NowsyczShQI+Tw1/MCZAZb
         MqUhfkLQMcG0zhAkcWHbnaBaatzs/sLPwrW0QSlFYxJGC3q6iGiykqEk4rxRoVyjQfOc
         80K9+0MhR43q9KfgDszX71yLJI2GHv+fdQqoWB9lVtDOtrlkXc0Qv8pv3HewYNjWBDFR
         Ay/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0gnfCkd+iGgfr7r7rLY6XC4beELm2Bi2NF46ZK70ZAONNtyeRC+JU6DV+uDm5EWkWvRdbJU3tU0YMjtNHmMsV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6pbp5XNGt9OgTjlYPAo+1MyeJi70vOeHSZnNO3Og95X6VhPn/
	tNq6Ocvfd+bv1qc2JP6lMaJaInrIontOSbFFAawM6UsIj/BHPGyw6flN
X-Gm-Gg: ASbGncs5plKQUCh0PJMhtZRzZWBd4qus58oEuz8Ox0bJRd8hvYvN174fCohZyLWnWry
	BVR1Rn5TI4p9nBHnahkDfnqc2VAnMvacUwhgyTnCUyzpJlJhAPAJPDUKbhNLqAwkeuJO4s18hcp
	E7AGtejiJ92dHRVaWv/9Eb0fQ8ImR3FmaRszSGAP3q+GFDDnJGEYaY2TKWgG6sJ+dOTcz/+as8g
	nWHKV3xk7gCSLopFzyomC1cSU9wmcAqYyo81MGQH2ewIAz63GPApU0LBUyWk51HCIYrCy+gE/ur
	WHLMPcmkcKVgBkvmUCejllomvXbO1xUHmyAcDXUuJ6op/DF8Uptz+ehmG6mhtrJrUTIzSLMoczQ
	=
X-Google-Smtp-Source: AGHT+IHEzMQYGh+Rxc5+so+AO6P4UVnGiCrhcLAB9kdOjmCCaTuKyssep3cuf68orx+kxzfxw5HgOg==
X-Received: by 2002:a17:902:cec2:b0:235:e5aa:f51a with SMTP id d9443c01a7336-23691c138bbmr3644555ad.7.1750112254563;
        Mon, 16 Jun 2025 15:17:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1643ebdsm7498669a12.26.2025.06.16.15.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:17:34 -0700 (PDT)
Date: Mon, 16 Jun 2025 15:17:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>,
	Florin Leotescu <florin.leotescu@nxp.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com, daniel.baluta@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com
Subject: Re: [PATCH 4/4] hwmon: emc2305: Set initial PWM minimum value during
 probe based on thermal state
Message-ID: <c43f5318-2158-4f7f-b8c7-d4609dbab41a@roeck-us.net>
References: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
 <20250603113125.3175103-5-florin.leotescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603113125.3175103-5-florin.leotescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_151735_301519_C07B6C73 
X-CRM114-Status: UNSURE (   8.86  )
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

On Tue, Jun 03, 2025 at 02:31:25PM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Prevent the PWM value from being set to minimum when thermal zone
> temperature exceeds any trip point during driver probe. Otherwise, the
> PWM fan speed will remains at minimum speed and not respond to
> temperature changes.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

Applied.

Thanks,
Guenter

