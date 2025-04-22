Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FAEC369D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 11:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gk2RkHKBbmDCAEiGNxk6lHORjkiITEvX4vdaTicTZeI=; b=YiaECtW2aGMtmwkB1CKba4Z5gH
	+jrKyTjgOOFi0J/hpSFSlw4HdNRNiJQX2eaPw5YLJOrOJbyiaFF/kQkhsM5nQVHshxrKaqBHQIl4s
	SYWkQaF1fricgDEWnfuO01nVksFta/LIezUsA2ViCV1PMLHB0HSTi6u3CKp53DjTF6dNSyiN/wwVb
	6ATWYBmQ5bGSdOLl8QsFaL+d1A0qcB3NrGgzTwKmvy8gWopMtdmwvz7GLYL3l5o0JERHRx6vBVBei
	awj0wWOcK1eB94iZyl30jdv4TWTb67VQMUn4pedWG5YpFu+CSCGCqSBnh3Zkofoi5/eBNCawKsogv
	4vAlzrJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BPe-00000006s24-49U2;
	Tue, 22 Apr 2025 11:03:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AgO-00000006iWo-2O4G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 10:16:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1399152B;
	Tue, 22 Apr 2025 03:16:45 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F67A3F66E;
	Tue, 22 Apr 2025 03:16:47 -0700 (PDT)
Date: Tue, 22 Apr 2025 11:16:44 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <20250422-vigorous-cockatoo-of-growth-bacdb7@sudeepholla>
References: <PAXPR04MB8459EA5C7898393E51C246AD88D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB8459A73179FFF0ED0C9A51E488D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z9AdICiyaCmzKh-N@bogus>
 <Z9FnZzBQuZ1j5k3I@bogus>
 <Z9Fv9JPdF5OWUHfk@bogus>
 <20250313052309.GA11131@nxa18884-linux>
 <20250409035029.GC27988@nxa18884-linux>
 <20250409-incredible-attentive-scorpion-fa9def@sudeepholla>
 <20250417-diligent-anteater-of-felicity-70bff3@sudeepholla>
 <20250420140944.GB31933@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250420140944.GB31933@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_031652_647774_323A4124 
X-CRM114-Status: GOOD (  11.31  )
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

On Sun, Apr 20, 2025 at 10:09:44PM +0800, Peng Fan wrote:
> On Thu, Apr 17, 2025 at 03:26:42PM +0100, Sudeep Holla wrote:
> 
> >Revert to old behaviour and driver request fw_devlink dependencies to
> >be created if they rely on them. I am not sure if that is better approach.
> 
> This requires to update various drivers(clk,power,perf,pinctrl,regulator) to
> set the flag SCMI_DEV_SET_FWNODE.
> 
> Using SCMI_DEV_NO_FWNODE would avoid updating the various drivers.
> 

Agreed and good point.

> Anyway, you decide which to go :)

Still undecided 🙁

-- 
Regards,
Sudeep

