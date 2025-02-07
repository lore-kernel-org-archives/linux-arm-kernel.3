Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3490EC02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HoRcBIyExvYO5wfuxuec/c9Ior/9K3+2MhS07KkfnRE=; b=B7gly3l6crvZH16Ow8CorG7rfR
	itznjSSuWxfCubGU4jivNxDok6PFpl0TQo1V7IIfgFSOSmEMSCAT9jig662XBGD4NmD8dfo6ucCjC
	xuJUNgaTtjGyeybFg8e2mA+TfFTGNt5Q3iDdl1jvFK/z3D3J0zEFkX66WJl1GOYzgBSl2YTAKTM+p
	MRq6YHuU7HiW8czUGE1TH7A4v9xBtBssv+gX3V6cRnNkHnox3390CaH9WtLSpQ1OdUAUrL95PrMv4
	hVjvVEP+ziPsZaqi9iPVK/fLjph0okPxl8huHFnpnVgpEIK0+XYzapZ/qpKbGGWMglv8vQ/guUkNA
	0DcTvaEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgL76-000000097lt-12Fi;
	Fri, 07 Feb 2025 09:57:32 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgL3X-0000000979O-0aUl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 09:53:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738922031; x=1770458031;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hlTuVm1xxYrUR9UPnzCM2Z9PktNqKKSfUmGDWh3FPCs=;
  b=MVAPOi3LqeieWUSXHX68IIltLakRLLYN15QJTSgCPMYffhOXmK31jI8G
   /l/U69ajugfjH/hT/A4Q017AcGOlxTP5NZpGkvsx5yrLdYENiz7PVMqsA
   oJvhQrN8kYXJUURjKjI8km43eCVYVa/ssRJHwFLjQwk44yqrHcYMtz6eC
   dXNYxSFIuMaaN9hiI3scKdB189Gd6Y5DDE4QNnD9t1ZP1SRNy8FjxC2Tk
   t0CuooaDeZmscBmtJ40CZKKW3Oy6vr2+9fLoiOaeFDfhA7ad5KPIXnU3K
   hi4GU89924GC5E0FUZSD6Q7oFCdc/B61rZQ5QT36y7MN7cVhKpCPhIy+z
   g==;
X-CSE-ConnectionGUID: Ao0//XqnToePM/N9iJ7JNQ==
X-CSE-MsgGUID: kUh0Q3GGTC6ZQy1iyv6pEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49800795"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="49800795"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 01:53:49 -0800
X-CSE-ConnectionGUID: WwnCJ8nBS7qhQMAwq3M/2g==
X-CSE-MsgGUID: wUf5a5DCSSSsebhSBlTGRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112379199"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.39.73]) ([10.247.39.73])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 01:53:40 -0800
Message-ID: <ceb6cee6-9cfb-4363-9d23-dfd21f78d486@linux.intel.com>
Date: Fri, 7 Feb 2025 17:53:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 4/7] stmmac: intel: configure SerDes according
 to the interface mode
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 David E Box <david.e.box@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, x86@kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
 <20250206131859.2960543-5-yong.liang.choong@linux.intel.com>
 <c15078bf-b6f3-5b4b-82ca-668d47168ce0@linux.intel.com>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <c15078bf-b6f3-5b4b-82ca-668d47168ce0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_015351_228991_EAC37116 
X-CRM114-Status: GOOD (  19.05  )
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



On 6/2/2025 9:31 pm, Ilpo Järvinen wrote:
>> +static int intel_tsn_lane_is_available(struct net_device *ndev,
>> +				       struct intel_priv_data *intel_priv)
>> +{
>> +	struct stmmac_priv *priv = netdev_priv(ndev);
>> +	struct pmc_ipc_cmd tmp = {};
>> +	u32 rbuf[4] = {};
>> +	int ret = 0, i, j;
>> +	const int max_fia_regs = 5;
>> +
>> +	tmp.cmd = IPC_SOC_REGISTER_ACCESS;
>> +	tmp.sub_cmd = IPC_SOC_SUB_CMD_READ;
>> +
>> +	for (i = 0; i < max_fia_regs; i++) {
> 
> Usually, defines are used for true consts.
> 
Hi Ilpo,
Thank you for your feedback. I used const int max_fia_regs = 5; to leverage 
type safety and scope control in modern C. However, I understand that 
#define is a common practice. Please let me know if you prefer I switch to 
#define for consistency.

>> +static int intel_mac_finish(struct net_device *ndev,
>> +			    void *intel_data,
>> +			    unsigned int mode,
>> +			    phy_interface_t interface)
>> +{
>> +	struct intel_priv_data *intel_priv = intel_data;
>> +	struct stmmac_priv *priv = netdev_priv(ndev);
>> +	const struct pmc_serdes_regs *regs;
>> +	int max_regs = 0;
>> +	int ret = 0;
>> +
>> +	ret = intel_tsn_lane_is_available(ndev, intel_priv);
>> +	if (ret < 0) {
>> +		netdev_info(priv->dev, "No TSN lane available to set the registers.\n");
>> +		return ret;
>> +	}
>> +
>> +	if (interface == PHY_INTERFACE_MODE_2500BASEX) {
>> +		regs = intel_priv->pid_2p5g.regs;
>> +		max_regs = intel_priv->pid_2p5g.num_regs;
>> +	} else {
>> +		regs = intel_priv->pid_1g.regs;
>> +		max_regs = intel_priv->pid_1g.num_regs;
>> +	}
>> +
>> +	ret = intel_set_reg_access(regs, max_regs);
>> +	if (ret < 0)
>> +		return ret;
> 
> This looks much cleaner now, thanks the update.
> 
> However, the intel_priv fields you introduced are not setup until patch
> 6/7? Will this cause NULL ptr deref issues in between the two changes? By
> introducing the reg arrays in this patch but only use them after patch 6,
> you'll also get unused variable warnings out of them in between the
> changes which is unacceptable.
> 
Thank you for pointing out the potential issues with the intel_priv fields. 
I will move the changes from patch 6 into this patch to avoid NULL pointer 
de-reference issues and unused variable warnings. This will ensure 
everything is properly set up and used within the same patch.

