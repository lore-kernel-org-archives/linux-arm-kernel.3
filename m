Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A95CC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 02:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWPnCoj/n27Bfx0tgEGVyx2pUy69j05tjHGEPB0Gdhg=; b=NCuCpK5bK2XbqlvamSpxHJ7dMf
	nxuO5z9HUBL3g6+DT/08jhV6Le5BpFwGbDfcbKCy9nGyZHkmuji8P706otccVkH4yoidMcH6Ab0Y3
	JRKG/zvQcHoZDDClISCuG6MiriYv1cp+3FZidig635CuSmtDl5lfdG5hSRTKdCG9FcrGazVcMZcqp
	a+e15LeV/YLKsU+2q3gNIyAhwl/gxpyghKPY0FY9ybmSd1jpa8dqn56u16PhdXUo5qSp2+/rpsClI
	XYTEm0yVNwEVbHJbuP6TNT/e9/xjSbZD8A51NA1Ui6Y++qHLbBdxvJVSGEdvlb3uMUalbbTZWnhCI
	T/vZ5G1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trSjb-00000001R4Q-3v9T;
	Mon, 10 Mar 2025 02:19:15 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trShy-00000001Qxp-2xi5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 02:17:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741573055; x=1773109055;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cvz/Me2nH/t84KohtCMiEZKpQSLJ47u4h7hNNkCqYI0=;
  b=lqBUN1dCxcEjymFFHoRiKHjlSGs0mfZTPkVgONUPgfUveNUaLe8ETW60
   2W5HvM8IY8yTMLV4ULaE3Z57qiAFSnQyi+WPOigixkUnufgykzcCAH3Kf
   uWh7w0rYw6zDQU5uiVmc1Rgc0nMkm2MbeMnwi+MKo67svW1HTYytJyeg9
   184Of8t28Fr9/bOcKpimlKmoubsI/TBTtRN2XHbFtISnwNO6yLIQd1S12
   SihnCU/O2grsoaKNSDEGfUOHWU+i3fMcBTlYKnsoNXoPpTmn859E9PB2g
   vN3KxlnpeeFPGnsSCpkdHhHRLPsriChLx/sDOaDMQMACvooUA2s3+Cu4O
   w==;
X-CSE-ConnectionGUID: wBLGL+HsRvuTfeM1+JBQtQ==
X-CSE-MsgGUID: MEUoyTSPTdWY3KRoA6g/fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="52763932"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="52763932"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 19:17:34 -0700
X-CSE-ConnectionGUID: H0j5eek0SheUYkhhk/umzg==
X-CSE-MsgGUID: lADrhadKRkK2+QNbJcgOvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="119702595"
Received: from kmania1x-mobl.gar.corp.intel.com (HELO [10.107.17.30]) ([10.107.17.30])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 19:15:46 -0700
Message-ID: <2f1f4a5f-712e-45c4-ae9f-57105f92f14a@linux.intel.com>
Date: Mon, 10 Mar 2025 10:15:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] net: stmmac: configure SerDes according to the
 interface mode
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <677ffce5-0d76-4b97-abd3-1ac7608417f3@stanley.mountain>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <677ffce5-0d76-4b97-abd3-1ac7608417f3@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_191734_820911_FDB3DB26 
X-CRM114-Status: GOOD (  16.54  )
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



On 8/3/2025 7:17 pm, Dan Carpenter wrote:
> Hello Choong Yong Liang,
> 
> Commit a42f6b3f1cc1 ("net: stmmac: configure SerDes according to the
> interface mode") from Feb 27, 2025 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c:497 intel_tsn_lane_is_available()
> 	warn: missing error code? 'ret'
> 
> drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
>      472 static int intel_tsn_lane_is_available(struct net_device *ndev,
>      473                                        struct intel_priv_data *intel_priv)
>      474 {
>      475         struct stmmac_priv *priv = netdev_priv(ndev);
>      476         struct pmc_ipc_cmd tmp = {};
>      477         struct pmc_ipc_rbuf rbuf = {};
>      478         int ret = 0, i, j;
> 
> Better to avoid initializing ret so that bug show up as uninitialized
> variables.
> 
>      479         const int max_fia_regs = 5;
>      480
>      481         tmp.cmd = IPC_SOC_REGISTER_ACCESS;
>      482         tmp.sub_cmd = IPC_SOC_SUB_CMD_READ;
>      483
>      484         for (i = 0; i < max_fia_regs; i++) {
>      485                 tmp.wbuf[0] = R_PCH_FIA_15_PCR_LOS1_REG_BASE + i;
>      486
>      487                 ret = intel_pmc_ipc(&tmp, &rbuf);
>      488                 if (ret < 0) {
>      489                         netdev_info(priv->dev, "Failed to read from PMC.\n");
>      490                         return ret;
>      491                 }
>      492
>      493                 for (j = 0; j <= intel_priv->max_tsn_lane_regs; j++)
>      494                         if ((rbuf.buf[0] >>
>      495                                 (4 * (intel_priv->tsn_lane_regs[j] % 8)) &
>      496                                         B_PCH_FIA_PCR_L0O) == 0xB)
> --> 497                                 return ret;
> 
> This should probably be return -EINVAL, right?
> 
>      498         }
>      499
>      500         return ret;
> 
> It's more clear to just return 0 for the success path.  Otherwise you
> have to read the code a bit.
> 
>      501 }
> 
> regards,
> dan carpenter

Hello Dan,

Thank you for bringing this to my attention.

The code at line 497 should return 0 to indicate success when the condition 
is met. Additionally, I will modify line 500 to return -EINVAL to clearly 
signify an error when no valid lane is found.

I will prepare and submit a patch to implement these changes. If you have 
any further feedback or suggestions, please feel free to let me know.

Thanks again for your valuable input.

Best regards,
Yong Liang

