Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6501094463
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 10:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHDWTBbKB3qdUDZBmFuIiqFXJQpeVZ0CqRE3ngdwtZw=; b=2LTuGy0DMH6fr8UHVQ+d4wlpWw
	ytiLWQ0QhsRHelE62sCG7fmTpj8+99xA6WRwZW0F6VzaDP+8Wn6YqQ8YL+kMLDLov3jBB0BVrI0x4
	bXS3d0bQbCJlzI/XqampzZdHkSX1y1SRp+7NfIcwQGiYhzHWhoChh+UgXpxjfgyjn1cMZ9hMmF2AY
	Wgn67sJuRhIuu7H8pPciYohEZvP14OndwwjforRGE2DFdhVUyuIqZ5IyR+YcNtDCwcO4yOCKYnVMQ
	3Gf1BxkH3XCDVWRj+9qOUqyUl6zb9V8hwCFfFO+lWY5dKgPzP29AaW/oKmLIe2h1Mg52N/77SjkBa
	MRvMLAoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3tLI-0000000EL3G-13pE;
	Sat, 21 Mar 2026 10:14:04 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3tLE-0000000EL0M-0D1W
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 10:14:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-486fd27754bso18285785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Mar 2026 03:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774088035; x=1774692835; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BHDWTBbKB3qdUDZBmFuIiqFXJQpeVZ0CqRE3ngdwtZw=;
        b=NIJzbaHFCxyN/IdcpcH7cgBp0LPzKyTwW6DXTmeGDzygfqPNxxOZV+ypIp1sxehelR
         J0yG3V/MvQXneGOn48XcSPzmtouFc//ZeFw55tqgmiqNjCzPmCmTVdyBJNuMwRLRk84y
         mboofKjZft0QiAIuhqBMqp3remCowWKEXBBSvYLTUlElTRWB7GBN8i7vDiU8qmp4jMQY
         oPUE1i0KMC933O+w2MPmMPkD5vfWBoqisZAW8zktKq00EqLj3ylwcFJfAfO6td253Fni
         hxGt0z1hCkjz+bFQzUpMAPhxuck5IANpnxPSKF5395qxry6XHDpkasRt2RW4xizOC7Gt
         L+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774088035; x=1774692835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHDWTBbKB3qdUDZBmFuIiqFXJQpeVZ0CqRE3ngdwtZw=;
        b=cOskHsuvhLeGLuy5Rkph4HdsQaa8Peau0+NrMTdUmFpaHsj+v7JVbPM75y40aEfUvG
         DporwVReFsiJ8AK+1flNMvIYuWZk8MEFdRae9IImNHzZ/PLx2j4fga7kRZbxOUCERzrh
         t9VLSYYd+aHkNZOsCUPFfPbGTNMbEQlVwtwIdSxaplYPZPWhgjQp5HN5m3b+UyfvHZpZ
         R1U8shW2U73b3bA1RyIH7DcpmxND6Yn+UJJAhh8747SwdTbnxFg33lfvimjDDKXt5d85
         7HYeg7wfapd7uCRpsjsD4gQXV/EoN7BUTjBFHUEu+R0hpVOcroy96/PnV8tSKOOGnI8/
         WIjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlkYh4ebrSvcTPgtIpuGVywdwAM/Glje1L0TzJAowQ9cwsgboqdEDQFkjuELAVGMjSJc52V89NuZ9ByHrfYGJE@lists.infradead.org
X-Gm-Message-State: AOJu0YwfaqPbkAwxif8ewF3U8idELAnxhxtIkyl3nsiSKj2kujtm9s+q
	s/DyPz8XDafIde9g2wt375uhTP7OuYPxHah8e8r5odlLrWvInbXtFXcLjW4b7s5Nxho=
X-Gm-Gg: ATEYQzzkxyYSmGskNHGDib8FNQhzyJ0UgxBMsHlVX4ykNjgauFLfAypsUcag8PTnKcA
	mjk+3nRAI/8LUZnhM5yfpJUbj/ExxdNbic/DiOR2P1Vcdyq7R/jrAKO+PGajk1PK8Pqc7hMgnOz
	pb4QIgZJZi+IyDdVqLX2tzd4aIvYZ3YxWyF+97QxHfrfrK75B3ue0EztEv1LdaysOYtykLk+cBH
	oj9HR4ALcdhW5b30KRRexaCnkz9qAs2ssF1ewNpMCUPM/CIh5CzOOLJMkmhTOKyA/DQPxYQtbET
	ilbgkQ+yaQyJpsUaif91xOyz1tINh59hRZFNRhM1rWfCdEZ73pef+RZgOGiycCt2ub5/TWMpby5
	5jrcIOe0vR/XjBsmZNgrETvraQYOn9kzCCPoPeFalzVwOrteFSACuQ7fCrnv5U/g9t3r2bhT3Cx
	mVMcpBpttkc7n+JYkeGhjT2Iujntib
X-Received: by 2002:a05:600c:524e:b0:486:f634:ef3 with SMTP id 5b1f17b1804b1-486ff01efcdmr83170465e9.32.1774088035226;
        Sat, 21 Mar 2026 03:13:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48704f14441sm8311465e9.9.2026.03.21.03.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:13:54 -0700 (PDT)
Date: Sat, 21 Mar 2026 13:13:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v5 5/7] firmware: arm_scmi: Allow PINCTRL_REQUEST to return
 EOPNOTSUPP
Message-ID: <96965696f3df12a7e64ee78191a727f7707cf96e.1774087290.git.dan.carpenter@linaro.org>
References: <cover.1774087290.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774087290.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_031400_354348_1260F266 
X-CRM114-Status: GOOD (  10.17  )
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

The SCMI protocol specification says that the PINCTRL_REQUEST and
PINCTRL_RELEASE commands are optional.  So if the SCMI server returns
-EOPNOTSUPP, then treat that as success and continue.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
---
v5: fix subsytem prefix
v4: add r-b tags
v3: new patch

 drivers/firmware/arm_scmi/pinctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index a020e23d7c49..42cb1aef1fe1 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -578,6 +578,8 @@ static int scmi_pinctrl_request_free(const struct scmi_protocol_handle *ph,
 	tx->flags = cpu_to_le32(type);
 
 	ret = ph->xops->do_xfer(ph, t);
+	if (ret == -EOPNOTSUPP)
+		ret = 0;
 	ph->xops->xfer_put(ph, t);
 
 	return ret;
-- 
2.51.0


