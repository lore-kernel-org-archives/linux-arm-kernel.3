Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA4EC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PpMXHaFF1JIW3abETAGrUWAAHuJWrnkzeYHOUDUyhbo=; b=nG1X+cxSJOxWQPWTkU2OKvsa0T
	ycFEW7BSEBAK9Tfy5yt5znyAIu46GRZvuCUIcIMq2WWnE3o6yCSAiv/21Y87iGtO+PUKqgxPJeV+t
	+BBOeTF5Mi+Vk2OQJLYU4iGolKESnyeglvNwwj3D4gLMiqwMpVSfrUb4BJ/R9eLErx50uOuXc5LHd
	+57ChVaOWrorwWLlvSGKNYqpzBxe/+vt7LB02bGo0AsQhzQM6rvikb8FjzEO7qlVYVa8g5uqzzgZ0
	7thXoKd/xgb34twGEeYd0BzgepTEbCDP/Px1r/anmw/Jz328DgJwoExVVJqD7lJ4OrfsJBDOUE6Zr
	b2/qc4vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50I5-0000000Gd0g-13un;
	Fri, 11 Sep 2026 12:23:37 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50I2-0000000Gczv-07UA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:23:35 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4843e397f74so505996f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 05:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789129412; x=1789734212; darn=lists.infradead.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpMXHaFF1JIW3abETAGrUWAAHuJWrnkzeYHOUDUyhbo=;
        b=s/Xe3HBuXe46bupOCRiNbNMCp/1C22jvb0A2U1qwy+kV46NDq8T/Ys3uqlo82wSySB
         +0KQbnUALCtLAq6yQQFMVlQAcLRwWo5OnnnHLiCM/NZ/hhLHJvkgcWCL2/yBAm5dMBx+
         UG/UM2tZmeRdacskWwfmBlwudBVp6LUbRzt5Nat5IgtcXdr4vdmREmPPCp71odVNIhrp
         UY++9xZXetLsuCti6GRRq3fb39+0eT5KDde7qLOQA1OCtzjAb8IKNcJ/ydeLGoCa1J5D
         qqRl8si51kdMd1EbZECq879yOQLGzHejHZUQCavTXYM3SQJRFgUymZenCeDoAlsAr/k4
         my1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129412; x=1789734212;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpMXHaFF1JIW3abETAGrUWAAHuJWrnkzeYHOUDUyhbo=;
        b=WHBXIoUwQ/HVtyp2f2M7jHV207YOWAeA6XQVG/LywPn9oNT53xrhxtYi+MYczmsFnP
         mc0T+6kQ/+cVMp93lAbci2pH1rYgRW1Qv+YYeLSFlcG4xxRWp+uuNAYQ8qf4/Aw1t+FM
         hU7qAO3+0/JVZtTfmk1pG/ZFLj612rsQvcVqaN/3aRvP9NdURIwvMmMYMDssauvEYN1c
         v8uLSUbIYGpZGbJktvadCbn+1p3xZpCHCxHKod75GmqdEkQMjp4N9LjZS5rJQg6iGuvX
         8jbfIR2t/2Zlf+cemWiW4g74kgjogKSv1CfgeLNl18MDINmvExCPFcZq6p0dleVrAqTT
         e9tQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpH8T+INvbFWCsFIwKxlQZ0c3Xad4jlp2PiW0qXdDZ+xDAEyCVeMMSRnJh+z0BrMoiz/uBodyxnuRp/9L2sZgJ@lists.infradead.org
X-Gm-Message-State: AFuF++n4kefUu+aE+liF4VlcdF75rb31oOHBFJXxJ2vRw1hLN/UU7veh
	0NmbzfoYhMabdXLusqF49ujCX0jfTlkfzAjPfHLK6/SSDuEuCCZ21z1q
X-Gm-Gg: AYBFou1Tx6ITDn5nkYC6N7xwQQ6dHs1zgDCqyYGMsNdjRmgAqkUc0CjB9xe/kgUTLUI
	USn2gJg4DU5tsAIR4ZEdVEcfYjPhXvkCuYrers9zJ6GQTrFu+oY4mpxVtm79qsxSZ1G5TuJeuCW
	rrokezU6m7IIo9tlAtmemFknLTD2csxUyRRDdSSqpVPTMVflGLUPlnjjk2KhQDbMgpGH5zbuPCt
	G/mmKt64v+egw7sCYg/r3uGSq9a3c1bBhg8uhxZiv+jYbl5x8Idi+sAHpHJ96BUYD5sksisnmEv
	6LUBe/1txKiaQ9f2RDHZKXl0n31HNO4xcIegoChHp/n7jLhaxWoaSKZTyW+sznitmo1H6LKznV6
	Nq+GS96te4ZL+TTzQx2nQpWTzVeaQQ76DBA/fF4oCYNCL17uZgjWFp+mkQDf9/xgVhU17pN0de5
	J2+vACOyt7qUO7sYcWYmC2BnORNW8Xc+xjzm+h22cMQ3OFLHRc+YhpxrghhVVbU1L4doc=
X-Received: by 2002:a05:6000:2311:b0:485:8d9c:47d2 with SMTP id ffacd0b85a97d-486e0f955c8mr11792035f8f.30.1789129411941;
        Fri, 11 Sep 2026 05:23:31 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm5870255f8f.23.2026.09.11.05.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:23:31 -0700 (PDT)
Date: Fri, 11 Sep 2026 15:23:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:board-remove-7.3 182/295] drivers/hwmon/ads7828.c:121
 ads7828_probe() warn: if statement not indented
Message-ID: <202609111050.oiut4oST-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_052334_086796_E7BF01B3 
X-CRM114-Status: UNSURE (   8.38  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   cf983087c51a9c74c3d4d3b353eb811ae5030823
commit: 4df92b98525f08e1eab92a25f5da2045c78403e8 [182/295] hwmon: asd7828: remove pdata based probing
config: arm-randconfig-r071-20260911 (https://download.01.org/0day-ci/archive/20260911/202609111050.oiut4oST-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609111050.oiut4oST-lkp@intel.com/

smatch warnings:
drivers/hwmon/ads7828.c:121 ads7828_probe() warn: if statement not indented

vim +121 drivers/hwmon/ads7828.c

5812f9283e6213 Steve Hardy              2008-01-22  116  
a8ddfea09566c3 Sam Povilus              2017-03-29  117  	diff_input = of_property_read_bool(dev->of_node,
a8ddfea09566c3 Sam Povilus              2017-03-29  118  					   "ti,differential-input");
fddb5ceaf901b0 Qingshuang Fu            2026-08-05  119  	vref_uv = devm_regulator_get_enable_read_voltage(dev, "vref");
fddb5ceaf901b0 Qingshuang Fu            2026-08-05  120  	if (vref_uv < 0) {
fddb5ceaf901b0 Qingshuang Fu            2026-08-05 @121  		if (vref_uv != -ENODEV)
fddb5ceaf901b0 Qingshuang Fu            2026-08-05  122  		return vref_uv;

Add another tab before the return.

fddb5ceaf901b0 Qingshuang Fu            2026-08-05  123  	} else {
a8ddfea09566c3 Sam Povilus              2017-03-29  124  		vref_mv = DIV_ROUND_CLOSEST(vref_uv, 1000);
a8ddfea09566c3 Sam Povilus              2017-03-29  125  		if (vref_mv < ADS7828_EXT_VREF_MV_MIN ||
a8ddfea09566c3 Sam Povilus              2017-03-29  126  		    vref_mv > ADS7828_EXT_VREF_MV_MAX)
a8ddfea09566c3 Sam Povilus              2017-03-29  127  			return -EINVAL;
a8ddfea09566c3 Sam Povilus              2017-03-29  128  		ext_vref = true;
a8ddfea09566c3 Sam Povilus              2017-03-29  129  	}
--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


