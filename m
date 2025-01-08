Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9F3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 11:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5l28R7aMI01MO73n6anQqdtnCKSPC6381Q8H/ZOfFLg=; b=5BgEInUh2ZaEft6ii0QvnBNqo6
	C7OOVZ352qUVq2dSdFPyhuaOuaMcPk013mKfaijn6Cfh7N2xAVu1PDpH/r6MKoGYmyui+fqfWViok
	BvODw2TwN2+c05X2D6PtuWz8GJWPpQulce0hsZt+0TmNc3vZx4S1jcPDgebhnYs2Y5UbFE+f1XpoD
	wpVHnGBH8oZLVUdqgKlrogTGyGwfim0m0n9VQNJ0hoFqgpkoW6dAbHE/1350XqwsVDGe4u39xMh9P
	ATh11v8O/A8HnQ8TCTGeksVJcuUSJcVx8eh3ZbjmA0sehw+Zy890zV1nIQ7KD+WE+ouAOwcwJjjrW
	Gy55+F/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTuy-000000088zp-3Lj5;
	Wed, 08 Jan 2025 11:08:08 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTll-000000086Jn-0rTl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 10:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736333917; x=1767869917;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JAru+JCMinYwvPV/IOHYvgN8V7XoWvB4jQe0QBv0C0s=;
  b=Lln8TkX4Vun7pXTHKBTPYR3CbCxjPdxlYTCVNFh5CgWkanX/kCKgnzk7
   Xf6ahcAusTUWixDMuE7SuE1rY8u/+FMSdwdTlQWXJziGKIt36JIaD6nkN
   hiTpKVEo3H22EClnXCZT3Q7Dilsgev9TlNF8BjuNqMCc85Ccof1EAXuqr
   40CHIViQnIo8n/PX9wOUTXOxePwnTnsRwLKFwttWsASDw6fkmtJVcf08b
   ZLMkWJePmsLw+Xei2oHIzTOXbeQ3yWGeMS5P/9CPl79SXYw3/FgrcpKtI
   kSK+4IQQDVkIaRf/ZTku6aSygFU3UtPiHSvdA1pLm9aXnQlHgVc5Ik5M3
   w==;
X-CSE-ConnectionGUID: 3PTd3b/OR7SosierpfBmPQ==
X-CSE-MsgGUID: TZrBG5JuSCia64AK8qutzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47970595"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="47970595"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 02:58:37 -0800
X-CSE-ConnectionGUID: nm4SBxDATruaz+8W47XtvA==
X-CSE-MsgGUID: Uj7pV1SWSdqWs7QCL2E5Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="133900895"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.39.73]) ([10.247.39.73])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 02:58:33 -0800
Message-ID: <3ddc0625-15ea-4010-a830-21020569d685@linux.intel.com>
Date: Wed, 8 Jan 2025 18:58:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 02/18] net: stmmac: move tx_lpi_timer tracking
 to phylib
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
 <E1tVCRZ-007Y35-9N@rmk-PC.armlinux.org.uk>
 <66b95153-cb12-494d-851c-093a0006547f@linux.intel.com>
 <Z35WKDhVGMvPIi7d@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <Z35WKDhVGMvPIi7d@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_025837_257961_07E268F3 
X-CRM114-Status: UNSURE (   9.40  )
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



On 8/1/2025 6:40 pm, Russell King (Oracle) wrote:
> Hi,
> 
> On Wed, Jan 08, 2025 at 03:36:57PM +0800, Choong Yong Liang wrote:
>> Tested-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> 
> Please let me know if this is for the entire series.
> 
> Thanks.
> 

Yes, the test is for the entire series.

The only issue that was discovered is that during the initial state, the 
"tx_lpi_timer" is not set correctly.
The "tx_lpi_timer" with a value of 0 causes the EEE to be unable to enter 
LPI mode.

