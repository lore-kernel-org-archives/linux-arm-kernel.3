Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2B7F01801
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Y6XoprPGy2obVCQE2uQgSeOts5auhhet8rC7x7T+9nI=; b=PPdww0v/Ftpm6r
	ECqb4v6ZAxu8SIaW6mEazRYRHJssCJpMCcIXSzvnjwOhvzIP82RcSVSo/duJA63DzbgbQCIlKU8gg
	u47wNb52uH+447GCG71FFZLIuF5983rG7EQPFhbiQzfwm4lrkx/YiAGqy2t3FvJ5qEaQ6iWFhH85e
	kURb9rCIe3F3dUdopW2/vhlT57I0sCt/u18BOfB1roJxz7eHyMnykM74RA5ruusn4W/frCUIi1oRV
	UrGyhn3uYC0oV2G9oP6Hs7QX7KAOmvXsNZNo1UlqUvfZ4p4sBx7vR9qMZnwvxSHy/2yX0M5yvB7UO
	C5u9rrjR41BX31f6K1Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPiQ-000000039dH-1Hzl;
	Fri, 06 Mar 2026 07:35:18 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPiN-000000039cm-1qno
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 07:35:16 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4807068eacbso74464115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 23:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772782513; x=1773387313; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6XoprPGy2obVCQE2uQgSeOts5auhhet8rC7x7T+9nI=;
        b=rllcYGjekX9HybottKFZJHYNBRfptUjGpNDy3RSxDwBGnrtVYaWt/ecD9xwYE2HNjs
         h0Khbq7w4WRzP5F4T/VgqA+xJKyS2nThY6j543E+tv2rl0C2T3ZYOPm0U+3KgkABr9W7
         dKoJsvF83jBfSukd7MXjweTPBA1otCLxgl+VshpuFXTQvFUKZJqf2SNqRmzFHImSz8wr
         kJz95axnJ7kuSIGfCFP4aTHR5zWnysr7Y/3YDr3NItZ2bE2ydKhW/hxSER1TKeBm0VUV
         sIapLkwHRNjpObHDBdI3ntPXJuaibOpPgLG+x3oNgeVHRiOjUfxK3KXstn19JMiKmSYy
         cEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772782513; x=1773387313;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6XoprPGy2obVCQE2uQgSeOts5auhhet8rC7x7T+9nI=;
        b=vwUSFlp5pBkbiwPBQ4P6m0MX+jmKhhOy/kXvKDwB295lvPOXFMieM5TLANuiKf+11G
         /KUc3e9TETCYNHz98Fgho7lVEj+phTOtj7nhTcWU4A2Aj51JUqDwEVVF1SreQZ44c/l/
         WeRO5fDq+6sH1w4f8q02hG5Y0k2h+1zymzBqFqglSIORuLUe/zWCRg3K8n2S0Dj+WYE/
         YMghjVpZ9wlYjQ7JboYDLzqDEDIVQwluX/q7T26P6d6iKGethX9u0//+te2oUm8Ebiin
         xa9Bud8VPNr6nrjFP2ZP/bd4sj0p5visuQA6MlJmiyumJ5DtzYdKM94jdXjHgH0ORTYv
         2QMw==
X-Forwarded-Encrypted: i=1; AJvYcCXRLo5s9tXb4f1b9TqVKiTzxridxuo+7JuLdaC1EoAYidGpbtQ2AkQlGS1P02U5HRrsOPRoKIET8bC7kyUaSOPK@lists.infradead.org
X-Gm-Message-State: AOJu0YxF8lypEY6qNI8EJD1usWQ/2gt3axIqwjktPNrQ56GVFTISJpox
	Oc+gf9mwVwyTFcgoSRNY2LE2KSWaPEdyWXW37PEYxJSAq2+d/bPB3dz0dGsNxwuQL6w=
X-Gm-Gg: ATEYQzwJ5KcPskUSW+QU31P1pesfQR8Adi9wyS4ptWmPIPmn+QwWASDlDkt7Bs5w3sw
	h9DHKm+dZ8UK2WQXb7N27F962AVKDZw5/pe5YwFAt02KR0sYGaoUZ3/xw0fFWB5jpRiMJUAdps4
	NAnqE9vzUcRspOLa8brYX6wRdn59Ll2et5EHG/QtpL35RywwZi4yEQUZwDPvqJQhXAZV4WiN1u/
	HzpoLS9uZYmmkHjbMwUbSCHXLNppLPKnIGD6Arvo6HQLG1YeLxB/BMsgxrwJS+RhUkZ5ne7vsyJ
	Vrgqeo58+gcGe3UOMfy+FuwcPKR3Qj62O2utjWCOKYkTgfnNAshXnEZutkEIYOJsQzMOhHOzlCd
	GruSeLaZTHqGzuDBWb47do8fKyDMojtiszaKiKu8PI6zFjjAAXwwjffAISl+8p9HxrfoRYkzpi3
	8brki4+BCtmERRWr4Av2mkDR70ssY6vlGS8wlspDM=
X-Received: by 2002:a05:600c:4e89:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-48526951430mr16785555e9.21.1772782512990;
        Thu, 05 Mar 2026 23:35:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2bdf8sm1953812f8f.25.2026.03.05.23.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:35:12 -0800 (PST)
Date: Fri, 6 Mar 2026 10:35:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Shenwei Wang <shenwei.wang@nxp.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	arnaud.pouliquen@foss.st.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy firmware
 protocol
Message-ID: <202603060910.Q5zBquzF-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304211808.1437846-5-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_233515_503577_834BDDB1 
X-CRM114-Status: UNSURE (   9.42  )
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

Hi Shenwei,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenwei-Wang/docs-driver-api-gpio-rpmsg-gpio-driver-over-rpmsg-bus/20260305-052440
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260304211808.1437846-5-shenwei.wang%40nxp.com
patch subject: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy firmware protocol
config: x86_64-randconfig-161-20260306 (https://download.01.org/0day-ci/archive/20260306/202603060910.Q5zBquzF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603060910.Q5zBquzF-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-rpmsg.c:188 rpmsg_gpio_imx_send_fixed_up() error: buffer overflow 'imx_std_cmd_map' 7 <= 27

vim +/imx_std_cmd_map +188 drivers/gpio/gpio-rpmsg.c

49a0cb20cd49a59 Shenwei Wang 2026-03-04  176  static int rpmsg_gpio_imx_send_fixed_up(struct rpmsg_gpio_info *info,
49a0cb20cd49a59 Shenwei Wang 2026-03-04  177  				   struct rpmsg_gpio_packet *msg)
49a0cb20cd49a59 Shenwei Wang 2026-03-04  178  {
49a0cb20cd49a59 Shenwei Wang 2026-03-04  179  	struct rpmsg_gpio_nxp_packet imx_msg;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  180  
49a0cb20cd49a59 Shenwei Wang 2026-03-04  181  	if (msg->cmd >= sizeof(imx_std_cmd_map))

This looks like a sizeof() vs ARRAY_SIZE() bug.

49a0cb20cd49a59 Shenwei Wang 2026-03-04  182  		return -EINVAL;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  183  
49a0cb20cd49a59 Shenwei Wang 2026-03-04  184  	imx_msg.id = IMX_RPMSG_ID;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  185  	imx_msg.vendor = IMX_RPMSG_VENDOR;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  186  	imx_msg.version = IMX_RPMSG_VERSION;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  187  	imx_msg.type = msg->type;
49a0cb20cd49a59 Shenwei Wang 2026-03-04 @188  	imx_msg.cmd = imx_std_cmd_map[msg->cmd];
                                                                              ^^^^^^^^
Out of bounds.

49a0cb20cd49a59 Shenwei Wang 2026-03-04  189  	imx_msg.port_idx = msg->port_idx;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  190  	imx_msg.line = msg->line;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  191  	imx_msg.val1 = msg->val1;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  192  	imx_msg.val2 = msg->val2;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  193  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


