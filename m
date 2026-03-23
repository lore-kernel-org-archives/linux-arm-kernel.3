Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87AEF483E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mX/GcwoKo6bWMEhcm0gaJZhmtfjF5BKuCj21CKeODo=; b=JkJ5ceN2WDOqLVzH2pg3wuFnL/
	hbEdDgxUQoJX5bk6xvbg6OgG5oA3WazBkJZUG3tMie5MT/9bauKHVCqVCz7KE0UwSlUfJUGvZxXcn
	mUnL7e4WxxfvOzzb0RXrqhtscBfrFjGdfDocAeHmsljDA2PcfbYlzxN1MJjIj+XXVFQsT6evHkz1a
	qoooNN6xtpmA+QltEYQFWEaGYMeEdUwzpRPX9eI84pJlpgUY2tjD3wDWuu1W3q8vCZdOmk3eQI7HX
	wlNGHNjCVSlv9TEySnbd/T2Jws/hNUfA0jAHBtp7KsdlaLsi88aXEW80nSCTZHiGTyaAYzVnJXx2N
	FYi8rf4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kX1-0000000HOkL-1TkH;
	Mon, 23 Mar 2026 19:01:43 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kWv-0000000HOfv-2ZUz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 19:01:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-486fb439299so36616425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 12:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292496; x=1774897296; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8mX/GcwoKo6bWMEhcm0gaJZhmtfjF5BKuCj21CKeODo=;
        b=sLcyO/TnHrlRwIS96FB3/Mp8Gi/7JyYy1hIBZlORl6uC6KYGFeHCiOdjckB0ajhb+t
         XH+TDD2vyspTihX75vixigqujT1Y0xrnEfFnBLbBVdxIvetDl9VEAoAmslWU8PPqDhfF
         DlzWYg5ZCOa8t0Y4YnHO8nYZaYGkrDEIiJ1sSCxeyXIfJ8n0JZwnjbX4Jfer8MAFbzSt
         rCOIdgnlmx96/ybrRd0RaNreTr3+WBZ0p/ZBBwW7pZ/VtOTPQy/p5RPNVK5/pTGi5Ptm
         GxswJUux+FOPJZjPm3eOJcxhuHp1nvo8YeUgWOy0tNdAM4uDjuPyoxDpLhNMEE6sq3WD
         QsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292496; x=1774897296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mX/GcwoKo6bWMEhcm0gaJZhmtfjF5BKuCj21CKeODo=;
        b=i4pRbP+OketF+we/9WvswUDGC82a3EyE4D/hVMX5N/AmukUHl8G92Jokl1AO3lY7og
         yuoBvU/O2KpY1gZEW1OEfKdbMhCV4tcxmudtz0oEJqgLO2EuKs5nP/Ut4C5aU4x/KeJ5
         UnHjdRSM6aNNdb082WKJff++zbMW65iGIXSiJpb/PEpcYmhhVqhx1kEijc5U+f/dB/wM
         o5W2AkxHIh1iVwVVr2eHP/KsOs23+c4Ls73ir3QJ/2euCjw9iQgyF/TbGsf+mKppXfth
         jZUtLHzr6jWWRlDLaflNMIDbZzQItNg4rFoB5P91IZSAo/SSQFVzBp9cBuyXJWccOyy5
         jxew==
X-Forwarded-Encrypted: i=1; AJvYcCWIRCuu4F6bwp2qNYEURsRj3qwljMfDB+YGqcmHIwhoqe7mNH8p0prQh8vwHrZnLwr7AsxJVmcbU0tuSS8JEf/j@lists.infradead.org
X-Gm-Message-State: AOJu0YwSBHKr9YQCrPLHpfICCwoR+Zk9m7hgwfdWn/fm1scMtL+oH03R
	fp6+2nWnnFVWbC6XFej5LqQNp80xe56OfgSdmNzJyR35C2Mi6Yqeq5TbrQ+jl2vv4u0=
X-Gm-Gg: ATEYQzyn6cJdJaVeTajJT8tMdHXFuYtd23oVSW4LrmQjqcvjyeVPfWt46xQS6SAJpfX
	U1HfY7skBAoe4CuJc3R3roFCruLQQCtYgSZ0qSJNiYIFRNhZfI0BS8r1GAewB5YwGAbVfuVn0/4
	+OHIRxdAgderrVvdPUO39Qv+whdi3EQnAw1n56U5aejjOFstJbh8mf0Wha8ItolCAtF5zf5IEr1
	PIzU9kpANE3/bKaQ7+Jpo8YwiLGHeeCECD4IfYbPAJsQkLCnAUzRz9c3KTK//hlRnc5Bbn2cslj
	YSao8USzRdK/HIpnRL6M2J2k/WLZsv2YHJftErlTUh56YG7ltQtgGrD8Wo8v3TRtqw89h5slARh
	I7IZ5lly1/ZO2qhpjic6CFktoieL7qmE2w8/LA0L8HdFksOKikuiudi21Iion++L/1leDPXEy7w
	+Ms/4FtAqXwNMkSIbCl57mAMKY7wqa
X-Received: by 2002:a05:600c:3514:b0:485:3d3e:1675 with SMTP id 5b1f17b1804b1-486fedb5624mr182256275e9.8.1774292495555;
        Mon, 23 Mar 2026 12:01:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f80b6a3sm1441505e9.21.2026.03.23.12.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:35 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v6 3/7] pinctrl: scmi: Delete
 PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
Message-ID: <48bee15dbf615c0c9a76ee4313bed7c06a07f143.1774283146.git.dan.carpenter@linaro.org>
References: <cover.1774283146.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774283146.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_120137_687661_CE562BDA 
X-CRM114-Status: GOOD (  10.95  )
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

The argument for PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS is supposed to
be expressed in terms of ohms.  But the pinctrl-scmi driver was
implementing it the same as PIN_CONFIG_OUTPUT and writing either a
zero or one to the pin.

The SCMI protocol doesn't have an support configuration type so just
delete this code instead of replacing it.

Cc: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v5: fix subystem prefix
v4: add r-b tags
v3: new patch

 drivers/pinctrl/pinctrl-scmi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 5d347e6b2e4c..de8c113bc61d 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -254,9 +254,6 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		*type = SCMI_PIN_OUTPUT_MODE;
 		break;
-	case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS:
-		*type = SCMI_PIN_OUTPUT_VALUE;
-		break;
 	case PIN_CONFIG_POWER_SOURCE:
 		*type = SCMI_PIN_POWER_SOURCE;
 		break;
-- 
2.53.0


