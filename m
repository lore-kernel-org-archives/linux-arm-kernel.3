Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5338BD116EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 16:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=+u+kxqq4MMJGawqIDaTzXliKugbB0Ij2lnspVyD3E7E=; b=FvVNZkMtX8vxhn
	zqjUJSJdjqwpzOZ5YGILwfXohSfP2KhL+1Igvcxelp8MtMuqYmi10EnM/AfwHdm8B6D3ByQnTYHmZ
	daLWS5d14NUoTZtAn98RXdz7hfLd9PE87ibtNvy+0ukrSmiVDT4FBEO9jNYQPzvBUgEEwDJH2fIkY
	/vH7fXjGrgN9LMUGVi0Ha15CpeLyD7CORlkib6Oo0V+AphM0myMGxF1IpgQRp53YgPNJydKYzwRKh
	jOOZr7jF3eYGPNmrszgqA9rza4NhFfbo8GPPi93CmD3NZiMSLqira590b6xoHJWFvtkvlcUdB5T1a
	bA51S8cO/NDCiuevnf6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPO9X-00000001gDg-2LpO;
	Sat, 29 Nov 2025 16:50:31 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPO9V-00000001gCy-0g47
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 16:50:30 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso27441655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Nov 2025 08:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764435027; x=1765039827; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+u+kxqq4MMJGawqIDaTzXliKugbB0Ij2lnspVyD3E7E=;
        b=Qqdcus/o3VXHq7Gd4vwpA4878PFDi19U3PKskpmR3iGqnLVun/uEDmAUZkTdeqMZHZ
         YrAW0OhI1lBUOZ9Q83bhR3wT78+JF5gkbhfbAvXOXskOpYU2GXiQBdqTuB/rYWY2o+26
         N9svypi3pQa9OTczdGb78mBTTwty3wHjTOFqYxCcx4yqdgaxxjbAmJKSUiiRZwWC5hW2
         pRJr9DqDMEqfQonrj8bEvIjxh88QFFj+iKAOUl1sqVXLp0vNBWsN21ghdyVNU76r20Rn
         ijX3B+A/FOtwRnYE2rAXMMD+l4C7DN0uDGnrWNU/+WOLus/6l0+Jv5/EPECG4abh2j7c
         IKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764435027; x=1765039827;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+u+kxqq4MMJGawqIDaTzXliKugbB0Ij2lnspVyD3E7E=;
        b=Gw5kG8rsPv6/rGLS+LZlfV2f9nIjHIch3JROsSd5aYpaJnLoUvwxj3T2aPGMt3/zVT
         Vmge0/QCBgyeT3lwcc8fRPdmQ69JpBp8ChHy/YhYpatqPX8GEHXwyItRQILALH2Jivkr
         S/4xA1J0xtpWXVaCmigBIl3YI+6LrJEfyModzRBGpcCAorOPDXVVyS73Ju3agHNldOLx
         JPvMmMuq7WLV4XdjSQv4g0iP59tDtwyAb2lmy83ha2Kkk0I40j2gd24CF8wX9wYKJI1e
         D2gds6zUBFhSJAhDP7nh4qGLNxnIhpypRm5ULm3F/gXDyVz7dHCUTyDMqhNZUFMDP/8a
         4y2w==
X-Forwarded-Encrypted: i=1; AJvYcCVvVCMDaLGgqq4c40vzJDaxXOlDG0ALf54vyHmOHi05ktr0bnrJnSyzJv24+9Wg8YZ3hrGPHUeg5Jj0bGso+PCC@lists.infradead.org
X-Gm-Message-State: AOJu0YzpXAfQVREe8C5S3tu8007mruOSgqb/YoQ+9jUcGfjYurHEAh5M
	5bdty3U0HypY0km2csX+N61+uh6nN6gwVafqYINmjtLDRxI88254ye9UGfAabO5B6v8=
X-Gm-Gg: ASbGnct/9jfYKXznRsQj01ODZK6tPPwUijZxjmAFkOkFx7E/1zuuGudwiiZjgM0V070
	cxNmzwwGy9RuaXfLKJSxQZvB7t92GvQt8FlYZGbpmSfHZjYrtVo1D/F5LOHRf5nuIWLkQ6T2maA
	AtciuivzJB5rlc1jkIq5iGFB4so6pLHIToRW9LIzZvfz5R8KseXOnuPXY+GiNpjKja18yH2DC3w
	51wREMmmcmqHgzkva2I9fkOkXB66pKosUylyyJrnXp2yjsbeW9naYElQAw2L2UpUr9QNT6fMjs4
	YKuRpIE1SzSRAKGrOyfjwhriXWw/o9Mepq8/RonI2EChjOQYYsGEe48qdyDheVlJ5ohbhQNyy5T
	WQKzgUdlu2aiEmHdsvZQxb2QWy1A1aA5aqGIsBs4exw4rGV5DYMbBIOa/O6McOD7C28V3dA453t
	g9/kwqduJ7AdSnQG1v
X-Google-Smtp-Source: AGHT+IGEoZUwPFD59KrJidNkG9F67yymewSdufIMxYqDAzd7rSdFYU/UTCa8BEI6YpP6tuO8Wx01SA==
X-Received: by 2002:a05:600c:46cc:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-477c0174856mr324752135e9.7.1764435026599;
        Sat, 29 Nov 2025 08:50:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4791115caa7sm144049695e9.6.2025.11.29.08.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:50:26 -0800 (PST)
Date: Sat, 29 Nov 2025 19:50:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Niklas Cassel <cassel@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	FUKAUMI Naoki <naoki@radxa.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] PCI: dwc: Make Link Up IRQ logic handle already powered
 on PCIe switches
Message-ID: <202511290255.uBLXDIG5-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127134318.3655052-2-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_085029_256362_EAD89632 
X-CRM114-Status: GOOD (  10.22  )
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

Hi Niklas,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niklas-Cassel/PCI-dwc-Make-Link-Up-IRQ-logic-handle-already-powered-on-PCIe-switches/20251127-214649
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251127134318.3655052-2-cassel%40kernel.org
patch subject: [PATCH] PCI: dwc: Make Link Up IRQ logic handle already powered on PCIe switches
config: x86_64-randconfig-r071-20251128 (https://download.01.org/0day-ci/archive/20251129/202511290255.uBLXDIG5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511290255.uBLXDIG5-lkp@intel.com/

smatch warnings:
drivers/pci/controller/dwc/pcie-designware-host.c:737 dw_pcie_host_init() warn: missing error code 'ret'

vim +/ret +737 drivers/pci/controller/dwc/pcie-designware-host.c

59fbab1ae40eb0 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  712  
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  713  	ret = dw_pcie_setup_rc(pp);
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  714  	if (ret)
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  715  		goto err_remove_edma;
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  716  
c5097b9869a136 drivers/pci/controller/dwc/pcie-designware-host.c Johan Hovold              2023-07-06  717  	if (!dw_pcie_link_up(pci)) {
a37beefbde8802 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  718  		ret = dw_pcie_start_link(pci);
886a9c1347558f drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  719  		if (ret)
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  720  			goto err_remove_edma;
da56a1bfbab551 drivers/pci/controller/dwc/pcie-designware-host.c Ajay Agarwal              2023-04-12  721  	}
886a9c1347558f drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  722  
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  723  	/*
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  724  	 * Note: Skip the link up delay only when a Link Up IRQ is present.
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  725  	 * If there is no Link Up IRQ, we should not bypass the delay
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  726  	 * because that would require users to manually rescan for devices.
8d3bf19f1b585a drivers/pci/controller/dwc/pcie-designware-host.c Krishna chaitanya chundru 2024-11-23  727  	 */
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  728  	if (!pp->use_linkup_irq) {
c5097b9869a136 drivers/pci/controller/dwc/pcie-designware-host.c Johan Hovold              2023-07-06  729  		/* Ignore errors, the link may come up later */
c5097b9869a136 drivers/pci/controller/dwc/pcie-designware-host.c Johan Hovold              2023-07-06  730  		dw_pcie_wait_for_link(pci);
c5097b9869a136 drivers/pci/controller/dwc/pcie-designware-host.c Johan Hovold              2023-07-06  731  
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  732  		/*
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  733  		 * For platforms with Link Up IRQ, initial scan will be done
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  734  		 * on first Link Up IRQ.
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  735  		 */
cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  736  		if (dw_pcie_host_initial_scan(pp))
113fa857b74c94 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24 @737  			goto err_stop_link;


	ret = dw_pcie_host_initial_scan(pp);
	if (ret)
		goto err_stop_link;

cd723d3dce14ac drivers/pci/controller/dwc/pcie-designware-host.c Niklas Cassel             2025-11-27  738  	}
4fbfa17f9a0755 drivers/pci/controller/dwc/pcie-designware-host.c Shradha Todi              2025-02-21  739  
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  740  	return 0;
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  741  
113fa857b74c94 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  742  err_stop_link:
a37beefbde8802 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  743  	dw_pcie_stop_link(pci);
113fa857b74c94 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  744  
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  745  err_remove_edma:
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  746  	dw_pcie_edma_remove(pci);
939fbcd568fd29 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2023-01-13  747  
9e2b5de5604a6f drivers/pci/controller/dwc/pcie-designware-host.c Jisheng Zhang             2019-03-29  748  err_free_msi:
f78f02638af594 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herring               2020-11-05  749  	if (pp->has_msi_ctrl)
9e2b5de5604a6f drivers/pci/controller/dwc/pcie-designware-host.c Jisheng Zhang             2019-03-29  750  		dw_pcie_free_msi(pp);
c6481d51dc65f2 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  751  
c6481d51dc65f2 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  752  err_deinit_host:
aea370b2aec9d3 drivers/pci/controller/dwc/pcie-designware-host.c Yoshihiro Shimoda         2023-12-20  753  	if (pp->ops->deinit)
aea370b2aec9d3 drivers/pci/controller/dwc/pcie-designware-host.c Yoshihiro Shimoda         2023-12-20  754  		pp->ops->deinit(pp);
c6481d51dc65f2 drivers/pci/controller/dwc/pcie-designware-host.c Serge Semin               2022-06-24  755  
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  756  err_free_ecam:
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  757  	if (pp->cfg)
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  758  		pci_ecam_free(pp->cfg);
f6fd357f7afbeb drivers/pci/controller/dwc/pcie-designware-host.c Krishna Chaitanya Chundru 2025-09-23  759  
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  760  	return ret;
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vijay Abraham I    2017-02-15  761  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


