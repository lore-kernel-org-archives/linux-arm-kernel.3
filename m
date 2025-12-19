Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAC9D78794
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 15:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LQ4z69vGSK8s2cb236oA6EkXbBLT4bp97eXCFO0cPQ=; b=ZSlD+O0FOgROsUerokqQwCGNm5
	0ZHgUgKbpmxw+527A/RltH5j3pZkRlLKUUo3zfivfMabFUNSGV7KkJ6Z7Ftt6raXpuCnpYpQmAPWv
	w85FEn1NvgKz6rrf9wH5YVy2XZhujnoJ6YtKXvDGzS5HsoNjCvzDXGtivg7UoevNuapbZ31CaPXEe
	dXe4tCy+BlsDeXgw8yVPkWiC16kstnoeTZqOOOpHLJe7fmZu4OoQngkGP4ZAr7cHCiFRsDj0DfzCO
	zns+K8nK/5Xa6R6AFe8ifDM0RBqc/ArOxysLF/yzdEACwg8Q/r87pWy2RYrFvVKSW/EiF4v1ogLSJ
	AnR1J08A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcqR-0000000Aafa-1dI1;
	Fri, 19 Dec 2025 15:56:43 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcqH-0000000Aaar-34Fi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 15:56:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766159794; x=1797695794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S5i8eVfDKxPB3n3/rKECDOJx5Ees4JGr6vAqgz7sOrg=;
  b=DylBC/swxiu5s5QX7z+x/H+7vlg+Cw5QicZE4ImeQmuBfki/BtVjzAT2
   KQpFrxUEqOf71pkWYPHVTiJ5lFDRXc4pcerPoalh8VAjjudesykj1k9h4
   qyWgkiplHDIUqIA8N57VUeTJcZDRWpe6WtN9KODn09+pv8U4bO2MQpgbw
   HxFJ4ynTJNnGKBwV1RBYmde3OPI/s7mh/QmrP/JYVWhUjM+fb2/B7xayz
   Ck8DJ9vkkYSU38k7KTMnMWRhIW3QQcrElxeRrslDwcoCE1FWgtdBtLDmz
   ZBX0ZKg7A6+M+mR5K6N7ArPxjy1M7FYIxmxtfGWC76IfGuwSzuh3sRxFy
   w==;
X-CSE-ConnectionGUID: RW+eYYOqTbOGQHe27UpeXw==
X-CSE-MsgGUID: U7t1u+z1TJCUc9YkRmC+iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="71966711"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="71966711"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 07:56:30 -0800
X-CSE-ConnectionGUID: Nc51gz8kQPqnXAS5IvwCkA==
X-CSE-MsgGUID: njNmakY3TjeY30tOsQu0sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="199718513"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa010.fm.intel.com with ESMTP; 19 Dec 2025 07:56:28 -0800
Date: Fri, 19 Dec 2025 23:40:12 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
	Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
	Xu Yilun <yilun.xu@intel.com>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:FPGA MANAGER FRAMEWORK" <linux-fpga@vger.kernel.org>
Subject: Re: [PATCH] fpga: xilinx: Switch Michal Simek's email to new one
Message-ID: <aUVx3PtC1Hho5RbK@yilunxu-OptiPlex-7050>
References: <49de9536c9952a3a36bb996f2fb0a1f0efb1ba6f.1765787307.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49de9536c9952a3a36bb996f2fb0a1f0efb1ba6f.1765787307.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_075633_849253_409CF057 
X-CRM114-Status: UNSURE (   7.06  )
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

On Mon, Dec 15, 2025 at 09:28:29AM +0100, Michal Simek wrote:
> @xilinx.com is still working but better to switch to new amd.com after
> AMD/Xilinx acquisition.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>

Reviewed-by: Xu Yilun <yilun.xu@intel.com>

Applied to for-next, thanks.

