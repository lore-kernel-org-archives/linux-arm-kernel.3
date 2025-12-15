Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B167D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 03:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUp7rfUJM9vOqlJExyEHPT2rDZ3mN00FQH9tdhSrMIs=; b=Vj/3hYvHO4LmifzH9jzHAmrc8m
	bFv4MCEsDbtGVufPweif7d3bXDzQpnI+8+qv9UAWDKBBWGyYizhsql7XYP5y+LUgX0VBvhL7jpGnI
	U9t+48OXKWCPvQ/ZNar6BOp7H5k4Rmxs4Yg1ovkS2Rqmsmgv+2Ty7Z2zY8yfWKcmMcIij9GKrlWk/
	9p5H7BKfQCjImBw+vhW3rS/ucposD2ioYgAVPoPVaEZZZ8XeTLLzEyjjFrdQADGuHqZyoll+CisNY
	askM20spWUYMgkCYbziEX0ACwVUTzC2KHLtmzNv6TYFTZdVIppK7arAQ8Hz/jLn1bDPHWd0YTM/UV
	GVVJxy8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUzeJ-000000031kt-0v7S;
	Mon, 15 Dec 2025 03:53:27 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUzcr-000000030ep-464D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 03:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765770718; x=1797306718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tv+6WHQtcQWkl905f+3Iu7W12IYA8HG6+Bx0cStnWM0=;
  b=U3tHfszaanuNwIWVcSzYU3ffYB72RsrkJkRxTpQrUMIyP05WnyNmAj5q
   2ug+TIlJSq4iJXlL0TbZrmw3Eb3nrBYxV3pOdwJiU+Ju3QgJq4Aj2r9Av
   x4N2tTSW6DOQ2N9ZmtTMTXC/eCo2RfbJRiBMpfoy7X56IDrcLFdZBofUU
   Ug/uy0oavtxaogqqtriRX5rEy8/yXTmerU1SN8FrTEXzrsrFw++zD9T+j
   E6JEXMI9/LWPJDAZh4Fjt8SwpqoTfekjxageezw8luwKpcD87Q/1i6sHJ
   vXp+l7lMeMdH+VImF3I2dW7rcj7E6FT2xQmMrvD2L++tKYt1m1qPfDLJ4
   w==;
X-CSE-ConnectionGUID: AtfQq555QfSsO2nTqPbDmw==
X-CSE-MsgGUID: XPP9rNYuRB249sImmIWg6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67546371"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67546371"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 19:51:56 -0800
X-CSE-ConnectionGUID: lYLPdDnXST+jKbZOghK46Q==
X-CSE-MsgGUID: 3KULLt40RoW4AAvitoKi5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197382913"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 14 Dec 2025 19:51:53 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUzck-000000002Ye-2ivA;
	Mon, 15 Dec 2025 03:51:50 +0000
Date: Mon, 15 Dec 2025 04:51:39 +0100
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v21 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Message-ID: <202512150427.Kc14BEvI-lkp@intel.com>
References: <20251212-imx-se-if-v21-1-ee7d6052d848@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-imx-se-if-v21-1-ee7d6052d848@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_195206_415069_D6C5E329 
X-CRM114-Status: GOOD (  12.63  )
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

Hi Pankaj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4a26e7032d7d57c998598c08a034872d6f0d3945]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/Documentation-firmware-add-imx-se-to-other_interfaces/20251212-172535
base:   4a26e7032d7d57c998598c08a034872d6f0d3945
patch link:    https://lore.kernel.org/r/20251212-imx-se-if-v21-1-ee7d6052d848%40nxp.com
patch subject: [PATCH v21 1/7] Documentation/firmware: add imx/se to other_interfaces
reproduce: (https://download.01.org/0day-ci/archive/20251215/202512150427.Kc14BEvI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150427.Kc14BEvI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/firmware/intel/stratix10-svc-client.h
   WARNING: No kernel-doc for file ./include/linux/firmware/intel/stratix10-svc-client.h
   Documentation/driver-api/firmware/other_interfaces.rst:60: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/firmware/other_interfaces.rst:103: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/firmware/other_interfaces.rst:115: ERROR: Unexpected indentation. [docutils]
>> Documentation/driver-api/firmware/other_interfaces.rst:116: WARNING: Blank line required after table. [docutils]
>> Documentation/driver-api/firmware/other_interfaces.rst:140: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]
   ERROR: Cannot find file ./drivers/firmware/imx/se_fw.c
   ERROR: Cannot find file ./drivers/firmware/imx/se_fw.c
   WARNING: No kernel-doc for file ./drivers/firmware/imx/se_fw.c
   ERROR: Cannot find file ./include/linux/fpga/fpga-bridge.h
   WARNING: No kernel-doc for file ./include/linux/fpga/fpga-bridge.h


vim +116 Documentation/driver-api/firmware/other_interfaces.rst

    94	
    95	::
    96	   +--------------------------------------------+
    97	   |            Character Device(C_DEV)         |
    98	   |                                            |
    99	   |   +---------+ +---------+     +---------+  |
   100	   |   | misc #1 | | misc #2 | ... | misc #n |  |
   101	   |   |  dev    | |  dev    |     | dev     |  |
   102	   |   +---------+ +---------+     +---------+  |
   103	   |        +-------------------------+         |
   104	   |        | Misc. Dev Synchr. Logic |         |
   105	   |        +-------------------------+         |
   106	   |                                            |
   107	   +--------------------------------------------+
   108	
   109	   +--------------------------------------------+
   110	   |               Service Layer                |
   111	   |                                            |
   112	   |      +-----------------------------+       |
   113	   |      | Message Serialization Logic |       |
   114	   |      +-----------------------------+       |
   115	   |          +---------------+                 |
 > 116	   |          |  imx-mailbox  |                 |
   117	   |          |   mailbox.c   |                 |
   118	   |          +---------------+                 |
   119	   |                                            |
   120	   +--------------------------------------------+
   121	
   122	- service layer:
   123	  This layer is responsible for ensuring the communication protocol that is defined
   124	  for communication with firmware.
   125	
   126	  FW Communication protocol ensures two things:
   127	  - Serializing the messages to be sent over an MU.
   128	
   129	  - FW can handle one command message at a time.
   130	
   131	- c_dev:
   132	  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
   133	  Using these multiple device contexts that are getting multiplexed over a single MU,
   134	  userspace application(s) can call fops like write/read to send the command message,
   135	  and read back the command response message to/from Firmware.
   136	  fops like read & write use the above defined service layer API(s) to communicate with
   137	  Firmware.
   138	
   139	  Misc-device(/dev/<se>_mux_chn) synchronization protocol:
 > 140	::
   141	
   142	                                Non-Secure               +   Secure
   143	                                                         |
   144	                                                         |
   145	                  +---------+      +-------------+       |
   146	                  | se_fw.c +<---->+imx-mailbox.c|       |
   147	                  |         |      |  mailbox.c  +<-->+------+    +------+
   148	                  +---+-----+      +-------------+    | MU X +<-->+ ELE |
   149	                      |                               +------+    +------+
   150	                      +----------------+                 |
   151	                      |                |                 |
   152	                      v                v                 |
   153	                  logical           logical              |
   154	                  receiver          waiter               |
   155	                     +                 +                 |
   156	                     |                 |                 |
   157	                     |                 |                 |
   158	                     |            +----+------+          |
   159	                     |            |           |          |
   160	                     |            |           |          |
   161	              device_ctx     device_ctx     device_ctx   |
   162	                                                         |
   163	                User 0        User 1       User Y        |
   164	                +------+      +------+     +------+      |
   165	                |misc.c|      |misc.c|     |misc.c|      |
   166	 kernel space   +------+      +------+     +------+      |
   167	                                                         |
   168	 +------------------------------------------------------ |
   169	                    |             |           |          |
   170	 userspace     /dev/ele_muXch0    |           |          |
   171	                          /dev/ele_muXch1     |          |
   172	                                        /dev/ele_muXchY  |
   173	                                                         |
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

