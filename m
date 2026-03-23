Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AABF483E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqJ8L0iDmB6uCpuEVuLQCen8FVgOtcZrswCudIKUuCI=; b=biqaIBeGl3E6jyqbxNNjmYaS/f
	5EuekcyKXbmla15Oc0BFT0Ed8C+PczyjRNH54cTmyTflLOtDlbGFR/254iwXRuSnZiUI3ewvi8pJY
	LaaEsWGR6ZGYG1Qsqe+2++1a+LEXYhFIfNstU8yRaI8TmzKNLrljSs6f/Q32YmlpTP53YhY5qP1PZ
	s3Uw2l28orY0msPj1QgMr+YVW1LGBueH1A2tw7UO9jTf1cCzq+D7BMS7o7t7tC+VrDMAnhmRIznb5
	IJv2bckus84Uud1qPmZs3aKqYCIBD0sFVTLXfp4zMge2dSl61MC9oR8SwxY6Ds4hhruX1JXaHYyRu
	Andvu4Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kX7-0000000HOow-3uwu;
	Mon, 23 Mar 2026 19:01:49 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kX0-0000000HOjE-3Wdb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 19:01:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-486b9675d36so37228535e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 12:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292501; x=1774897301; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wqJ8L0iDmB6uCpuEVuLQCen8FVgOtcZrswCudIKUuCI=;
        b=DpMjGIPX0w7r7UCtOW5Uf6VnbDjIXMUgAmCefwaMCVuAgfduxJwHzI+oHth33VzpCM
         OXtwhQiXHIRiFBJiO35hxv3YFLSIiLO/mdraHqa3Esnjzh+WAIBaE4WfvOmFg69eUNfG
         EViUK2HA1l9IYEFHW0/ahp3K7M6GX2LYftKCo659TvOkKUq7x17pov4B0XqiqDTy6voc
         tGtj/8kxZPMpmCSrEFcxHpQIzLkcJC1akH/jyAeRRBKk+7m4Xm9VhF/8AGZB/oVNu0PZ
         xGpGLWJ2XpEjNfiN7MuFuKDEi+Vnd2bXd9VkyhKqQ7xLkavfObt6fmhTJaW4oMxpXDlh
         JNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292501; x=1774897301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqJ8L0iDmB6uCpuEVuLQCen8FVgOtcZrswCudIKUuCI=;
        b=NiYjhGfLmP1L0EqXUwmvMeAhZZ9lkinCO4zybeipdJKhtgho/8OVA0aTbHuTElfF0D
         tK/39hTX2hcahAm4zMTkHwPLL2LX09HBtxEAvAil+LAgc0/sRO333bs90JFH4jDsZI/Q
         U7sNNRDQ8uNzea/u5DEMmW4WkoTszwe9Bc0wSzX+j7zTkMV4qzZtntIStrEp6DeEz5K6
         hkktxDlSye7UcOm7IsjwO7B4zZk/m+euuv775+8DM/0NWjMaA1I2sDExF4arLoEBi29L
         9PzNEn1z3OO52gCwIksedAmxckaziY6pjNl26Q6nto43atTRUZzc0CUJ/22HCfYqz9Y8
         fMPg==
X-Forwarded-Encrypted: i=1; AJvYcCVlHXwUzwwcpCa93DeTra6SnKGkTDA44TLBWJVmvZA1tLFGbFPrlb40pR1tpCtHDqx/KqDFpiA7208nX+2ajxBR@lists.infradead.org
X-Gm-Message-State: AOJu0YyJIYpNmikeBEtla0zVHHNnrjQep20fWfzOtHsUoBTd+1l0fOSu
	dOu0v8mvNzN/uGjZVp2Ft7v+3uTKH9ANYWJQKc9xtlAvs4OOG/UjvVMxY+iZFIlSWxA=
X-Gm-Gg: ATEYQzxsl5zgP5KBUOH8lFvShPokH4zbprp51kE947Qe9g+rSDay2mA8CGyEendx9IW
	i82JBYOu4/Lmd7apj6j4FRV1qr/q2+WUHuYtpvQpVZUe69mpwWNU2osIzRk5Ih65jU6OMl73ldo
	XweW3Xwsc6yVE+K+FL91o1Ncz5NpUCh1bwuIFNDEZQIYVUo3AkJwjjs2MgFYnnBZ9k82JtOmxl1
	B6KOHwJSphM8vYTbW7GStVbdbfaX5vw5S6T1hWIBXpGT0+vPuRICtrDwNHYBgY8xr2mwIgN0ZkT
	iALWu7WZ6kbHWzNjT4dNQFNPFVTLXxOz6WWGRo3Z3U24orFhaotpm3ZfhLFIuU8SHF2jJjnMyFb
	slCT2MNWRvLJOOYIJX/0jcxuuRW9q2iaq9+cOhWYLgFzuotovq8+8zeadauxFBQmVY8IoPwUTer
	7PYS1WWZnDSM3UVS1Axy7VcQxd27Sj
X-Received: by 2002:a05:600c:608e:b0:485:419c:4eba with SMTP id 5b1f17b1804b1-486febb58a9mr166627335e9.1.1774292500848;
        Mon, 23 Mar 2026 12:01:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe032a55sm582792635e9.7.2026.03.23.12.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:40 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:37 +0300
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
Subject: [PATCH v6 5/7] firmware: arm_scmi: Allow PINCTRL_REQUEST to return
 EOPNOTSUPP
Message-ID: <2089955559d22747745c0f3fed19c1bea8608d83.1774283146.git.dan.carpenter@linaro.org>
References: <cover.1774283146.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774283146.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_120142_896577_0B062137 
X-CRM114-Status: GOOD (  10.80  )
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
2.53.0


