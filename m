Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B351E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 06:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=3EBP5eZrSw5SNu4AKLCAw7ge8STkhI5WlLpg3XWzOaM=; b=zI+IjA8S8WFXBn
	CELpuwFw1GRpHhW20oGt62sJwh6m22RSzNEzV6jqZnmnbhYdtAv7I2NdZ3/q2EE6Lxy9mDmzxjou6
	h/d9Xyajl+QFrmqi36ormBRYUrDXsjcic6UmJ6mH25lvjpjeaNwGNteOCQ1JZPIj17Pv0r+qruPN9
	vRGhqGE6rb/H8GXiMb45I2BWVsdekKYBFjYi8vwiG8e1uH/ZRS6LzVNSzhvvTpUlW7LnpCafT6f7m
	VPH2YqGMvAf9geJ6KZdolctgu1EfDspX3KaPtUU7kPcEWjoq2NYbRWW4MbuP7JKOi7ElXx+s5hmQE
	umGIMQhktaRi/GRaFPIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsxtg-0000000AzPv-0Gir;
	Thu, 19 Feb 2026 06:52:24 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsxtc-0000000AzPJ-0fxv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 06:52:21 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4362c635319so556747f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 22:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771483937; x=1772088737; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3EBP5eZrSw5SNu4AKLCAw7ge8STkhI5WlLpg3XWzOaM=;
        b=yiRH+hLd71Qo4RsES4HolSUgYWz5daogpAL4UPy0Fcw3J4g5TMFwMhs/zHOwHwvNNv
         9BZ51l6tCpVXjTYxZ5Vm46cKwdhl4Vs6pUbsPliSAoEb8bE3gDJTKozqUjajWUK4I5jd
         LB6daKu3aEnqvHcO3kZPvlXEBHYJcEYAFVGZZsVE2QTMUZvdBsgeCtRtYpjqN1Z7rUxD
         hC54igtHz+vhY6uIE7UsEdsErXHgMjIEevYUNiEGOZaCReNdogly79Q8UpnHt3oza/iN
         Mcd2UrJYGVzCZwPhwvm7qf9nC/T4sH1DwRbV0QbidAUjtk0XKkgnNuVXis6qRifFb9Zb
         GA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771483937; x=1772088737;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EBP5eZrSw5SNu4AKLCAw7ge8STkhI5WlLpg3XWzOaM=;
        b=WZH3P0w5NOv74jixHQKlpm4jmHY5TarZDmor5Lq6LN2D5ND6AO1n+EaWMy94BOH2WG
         cr/I194Mo19GLntyWWSmLBpJri7aTAapdEkmQkbMSRGuYMoSpaComX13exSxXcdoTEiY
         XivZuMnQNd2j6aVibNOB38NFKVHQF1fUjDJ6IcHmB0ia3Ub/7wjQr/+koLa3atGIliIm
         L7sxqRH0mbzfc1kFcCtp74yltONUsyn+1VTgUaow64HGizga452WZMw5NlOT1ri2A6sj
         iTupZsPwJYgPX2GPAZSjH6/ktdtz8D7NPwOOE4Js6AkuMGZWgOCX4aR+50/q+FGajbG/
         ZObQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbFs46Dp73/PoFdSQJD8bjopgCqfgF4T1wdPqrld9ppxBUC3bAreweHipkcFKCdQOx7J+/7BjofLCiUkqXlbis@lists.infradead.org
X-Gm-Message-State: AOJu0YzLUPdhBr4zrC7fZq1+hd9St+cgnuvMd0i0+94pWbWqQ3OcQVcT
	tSr1FCcMTZvQjKp8H8tBKJVNgSEnIWmrwtrLxr4ywfP4TmStmS5ELKdjk0yLq67To4M=
X-Gm-Gg: AZuq6aLbbmNU9oBXG3CXdcwnMzofqZoD5z1EPgBrWyHV7F9I5NogtTYwlh/RoApVMV8
	yUYMSR50rs4jUJBf4TngF/R5jqfeNOgEVlN54sHcH/5MYRnu8BnC5NYq4+LHGzot/tZJFJkiJrB
	S4A3oE7e2iPBu/KPkHVESY63WSIJbMX9bxJH4BH9cgZx1W2xpIDMwrwjJMMuZRB2FpaAz+Ir5AB
	jCNjcbCXk4Q48eL1BVl97n6aVoSzyZdZZGdmFF/Q5EKHpnyN9a3oUpyM5r5KZ5v1wxQTeLpPAmU
	IuY5jV6mhn5BdXqBrd/+ZB/lpXfZ97WZnTD3EV870Fq8eEmSr62q/giJPiC/1hSHlTLfwnE/S9S
	BFUkLV34IxLEUvGAfwMCdtoRPbxVKLu+vi7jBJWzDx/RUqGipe6eOD2sYkP/qWVPKIBORGTbcqz
	o8p4QRZ/PYkJPBAIHEDY29dHWPSPeWSqhAJ3s7sxE=
X-Received: by 2002:a05:6000:401f:b0:430:f5dc:d34a with SMTP id ffacd0b85a97d-43958e4a636mr7655865f8f.29.1771483937384;
        Wed, 18 Feb 2026 22:52:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acf5b9sm45905510f8f.34.2026.02.18.22.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 22:52:17 -0800 (PST)
Date: Thu, 19 Feb 2026 09:52:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Harry Austen <hpausten@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Michal Simek <monstr@monstr.eu>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Harry Austen <hpausten@protonmail.com>
Subject: Re: [PATCH v4 2/2] clk: clocking-wizard: add user clock monitor
 support
Message-ID: <202602151704.qepyfVlc-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214180933.42143-3-hpausten@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_225220_232436_F50A7F58 
X-CRM114-Status: UNSURE (   9.94  )
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

Hi Harry,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Austen/dt-bindings-clock-xilinx-add-description-of-user-monitor-interrupt/20260215-021554
base:   ea7282e99ead6d2a294cef40acd2a29ada3ab71d
patch link:    https://lore.kernel.org/r/20260214180933.42143-3-hpausten%40protonmail.com
patch subject: [PATCH v4 2/2] clk: clocking-wizard: add user clock monitor support
config: microblaze-randconfig-r072-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151704.qepyfVlc-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602151704.qepyfVlc-lkp@intel.com/

smatch warnings:
drivers/clk/xilinx/clk-xlnx-clock-wizard.c:1183 clk_wzrd_user_mon_work() error: dereferencing freed memory 'dump' (line 1182)

vim +/dump +1183 drivers/clk/xilinx/clk-xlnx-clock-wizard.c

68614f228e6cbe Harry Austen 2026-02-14  1176  static void clk_wzrd_user_mon_work(struct work_struct *work)
68614f228e6cbe Harry Austen 2026-02-14  1177  {
68614f228e6cbe Harry Austen 2026-02-14  1178  	struct clk_wzrd *clk_wzrd = container_of(work, struct clk_wzrd, work.work);
68614f228e6cbe Harry Austen 2026-02-14  1179  	u32 *dump = vmalloc(WZRD_NUM_DUMP_REGS * sizeof(*dump));
68614f228e6cbe Harry Austen 2026-02-14  1180  
68614f228e6cbe Harry Austen 2026-02-14  1181  	ioread32_rep(clk_wzrd->base, dump, WZRD_NUM_DUMP_REGS);
68614f228e6cbe Harry Austen 2026-02-14 @1182  	dev_coredumpv(&clk_wzrd->pdev->dev, dump, WZRD_NUM_DUMP_REGS * sizeof(*dump), GFP_KERNEL);
68614f228e6cbe Harry Austen 2026-02-14 @1183  	iowrite32(dump[WZRD_INTR_STATUS / sizeof(*dump)], clk_wzrd->base + WZRD_INTR_STATUS);
                                                          ^^^^
dev_coredumpv() can free dump.

68614f228e6cbe Harry Austen 2026-02-14  1184  }
68614f228e6cbe Harry Austen 2026-02-14  1185  
-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


