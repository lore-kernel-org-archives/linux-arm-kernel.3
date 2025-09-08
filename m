Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900CECA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 05:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bK4xCCUkJgHnNsrWJUX5n2h3qweAwpi9anD1X6vMswc=; b=cOIykD/qBXMt2EtNttQy/fdtpm
	VU2OL6kpsNd9XiUBXz8ltdFQXttY4lDyix64u7Z/eN1n8LaGk0+8XE4gReDA+NmrbqOUy4gAZjsdo
	y3bTPvqEAZlIBcciPP8/TY1pY9LB4ufBqigqF+ghaVMJy7z0lmUQWijBKaYTklQsA5Ua01Klx9t7q
	tb1YG31ArBiUdhryJC9yzk6QFPPrbTvRY2hFuCA6OyU08hXLuvjvF4ohzv8N9BVnkiXb7dpAJYnYb
	mmNBZicHG1Y+o/O+jllor+9MS6GjAjWCsy2mCcixOUT6Lm5JdvfCqEjXeURISqm2sHuqxkdrLk1fq
	aaIExOIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvUoN-0000000Ep57-1a31;
	Mon, 08 Sep 2025 05:53:07 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvUju-0000000EnES-48KY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 05:48:32 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3e2055ce973so2010215f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 22:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757310509; x=1757915309; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bK4xCCUkJgHnNsrWJUX5n2h3qweAwpi9anD1X6vMswc=;
        b=bN4Vs+pgMugmH3T7K9jNpu53XGjPZuoBxgOsw+kInVOynHLjqQSyYbdttdQepiLbqH
         e+d1JYyOXTgqlgqcXdgJwOs01YOFpltZOWRWv7oLtZsWdodR1jeJWEmMjkAA/5mQkMKb
         P14D9ADIWCq9SL1QFpFTtln3pu28rLSfV1HgPYcsDA5lx+1Vlr+dfkTpJFYy0OVfThgm
         VauNfrZnn2LuMtC9UaKi5RnHpDqQa9mjUCh50E9M+CTLzZgHfUgO+RmO5ZedHiW4oHmB
         UMZ+yLCAy/lkH9ZeTw9+swXmvAv9hmB6xJsWaO4wk3iwR5dC98rXm5ZrpUMI8gu2Oiv1
         1fVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757310509; x=1757915309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bK4xCCUkJgHnNsrWJUX5n2h3qweAwpi9anD1X6vMswc=;
        b=Bc/28Nk1icNFwlIIrZns/FidI7S9kTocSraQSmKREqykdAbG6B8MRw4DQKqYSpHJp3
         nhQUH2pTmX2MzcnVbVt3EPzTiKEiP9Ce98D3mtYZ4IfsSXyzBqpciGFIKqoaOCSKjVYc
         CfjmP85neKfD+eCRR+Uyxwroz1kWjCoS4jAFQhqV8ihDXNaeyeRDgOMXH76SePHrfl/d
         wLo3bqHmLhh2+axRNzBKquB8c/3b4qGNHiN4LE20K+iPqfip4o74ySoE+xDN5TRL3Auc
         3AMuo963v9YnX7m+D1vQlIzX4sPYHAEEkAeMJ93P4g7W8IXOzPfIQsg43bRnBTwqlYKv
         v41w==
X-Forwarded-Encrypted: i=1; AJvYcCX5vWxpN+OAO0Hy1t1Jrr16+7v2xy7WT7fba3vxqgA66U0mgo17h0Fx7mpLNOv7yD64+sv0Foi8bCvnSzONbn5I@lists.infradead.org
X-Gm-Message-State: AOJu0YwhmPqZs6+p7N8hGputLlUzZIQPb10pCfBUSn85F9e5gjEkK/3f
	1bXIWNWmypJBHzJ1W2MdCPWWbd4Crvh9Vmj5h2xH9CaGRSHdzS2ULbEt//AsNU0mb9M=
X-Gm-Gg: ASbGnctZ9+67bSfaPY5NSy1bm2hK5gN8vJia6628BdHxhOt4ZOlRPZcOkQyUZESG+I5
	oT2+y71jkvpWr4bj/IJP8u+Msb/cHFZ+jtDZNr/Yiok8TvqNUDWJbW4nCocM23RFfeYDA37lQfD
	wcDBrpbSuB/v98HKGPzWs9SKYL6woz353MgkEWUGWMTNcxNkoyjFNNgEPXYlW+7AV5YwQsxniw/
	lDYccX6MCB2+VTRnpx50k5+tk1kuJV5uZn5E2is+Yy+tG6ffC9IWlFK6lxgZC8xbFX3jbKDgcgK
	K1gpBn1q0mXS4hYRaXgaZztRUrQPqp3FkZUigJBjaXs3a9juVyjRxpNVukB2Vw5KA7l/nsZ6dsC
	T43XEQHTLqIqIxwcvJ5PN1aibbZL/Hlwiu5Z05g==
X-Google-Smtp-Source: AGHT+IEEWpQsJ4943vbis4w2dbJY/QBn55s5lkkvnQbqeLGZJhfjukVhzvhNNq/IsiNBzEyJkqP93A==
X-Received: by 2002:a5d:6e46:0:b0:3e7:46bf:f8bd with SMTP id ffacd0b85a97d-3e746bfff15mr1956825f8f.23.1757310509421;
        Sun, 07 Sep 2025 22:48:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3d95df59e50sm25155604f8f.23.2025.09.07.22.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 22:48:29 -0700 (PDT)
Date: Mon, 8 Sep 2025 08:48:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: Re: [PATCH v2 0/5] staging: Destage VCHIQ interface and MMAL
Message-ID: <aL5uKTiEYZP68xLd@stanley.mountain>
References: <20250907-vchiq-destage-v2-0-6884505dca78@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907-vchiq-destage-v2-0-6884505dca78@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_224831_029523_5BA278A7 
X-CRM114-Status: GOOD (  10.88  )
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

It's really hard to review the code when it's just sigle line like
this:

>  .../raspberrypi/vchiq-interface}/vchiq_arm.c       |    9 +-

It's also a head ache to do a cat -n filename and then copy and paste
it into an email message...  I thought there was a trick to make the
diff show up in the email?

regards,
dan carpenter


