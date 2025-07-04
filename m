Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CB1C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 10:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHZ/i9bRz/LsBXtD4GMuhPUQGeNDrBR5UucBv4sLk8I=; b=vuDCujuRsKMN68/honLYjNPoM4
	x5/7vlfoWWwF2tdtHJFDpNxNOXmIQ4jyGXWUx/MY69xHxpWcg52tvdR1/Eb8sN104glAjxjfUhF9C
	g1YTHo9g6NsWYm5UdrG7HArfhgE4ZY0vq6NOMZWifYoylHoq1FTtgobg4KMbjlqtCqBDBZOYWuii8
	Cw3i9joiaibi4mHeoDIq1HjwCRfwTjriyax0aV6E5sRast+9pdhps5O0rIrYZvizkqZ6elnkJ05zf
	Ix0ckRzjXXF6ZimqVtlLhKEUUC6sjNV2v9GgE8xpXYiH1UQk2iAsJMG60cZJ55GUp+ob20KfQp6VX
	MBkRRFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXe8v-0000000E8ti-14Wg;
	Fri, 04 Jul 2025 10:59:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcza-0000000Dxnh-44Oc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 09:46:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27F8B152B;
	Fri,  4 Jul 2025 02:45:48 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28D6F3F6A8;
	Fri,  4 Jul 2025 02:46:00 -0700 (PDT)
Date: Fri, 4 Jul 2025 10:45:57 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/7] firmware: imx: sm-misc: Dump syslog and system info
Message-ID: <aGei1YOnwjqqznrW@bogus>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-7-2b99481fe825@nxp.com>
 <20250702-berserk-paper-uakari-74a8bd@sudeepholla>
 <20250704102802.GF4525@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704102802.GF4525@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_024603_053093_266D9712 
X-CRM114-Status: GOOD (  19.60  )
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

On Fri, Jul 04, 2025 at 06:28:02PM +0800, Peng Fan wrote:
> On Wed, Jul 02, 2025 at 04:22:47PM +0100, Sudeep Holla wrote:
> >On Fri, Jun 27, 2025 at 02:03:50PM +0800, Peng Fan wrote:
> >> Add sysfs interface to read System Manager syslog and system info
> >> 
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>  drivers/firmware/imx/sm-misc.c | 97 ++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 97 insertions(+)
> >> 
> >> diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-misc.c
> >> index fc3ee12c2be878e0285183e3381c9514a63d5142..55485a3c4a5c615102a377f41025a6911d746770 100644
> >> --- a/drivers/firmware/imx/sm-misc.c
> >> +++ b/drivers/firmware/imx/sm-misc.c
> >> @@ -44,6 +44,100 @@ static int scmi_imx_misc_ctrl_notifier(struct notifier_block *nb,
> >>  	return 0;
> >>  }
> >>  
> >> +static ssize_t syslog_show(struct device *device, struct device_attribute *attr,
> >> +			   char *buf)
> >> +{
> >> +	struct scmi_imx_misc_sys_sleep_rec *rec;
> >> +	struct scmi_imx_misc_syslog *syslog;
> >> +	int ret;
> >> +	size_t len = 0;
> >> +
> >> +	if (!ph)
> >> +		return 0;
> >> +
> >> +	syslog = kmalloc(sizeof(*syslog), GFP_KERNEL);
> >> +	if (!syslog)
> >> +		return -ENOMEM;
> >> +
> >> +	ret = imx_misc_ctrl_ops->misc_syslog(ph, sizeof(*syslog), syslog);
> >> +	if (ret) {
> >> +		kfree(syslog);
> >> +		return ret;
> >> +	}
> >> +
> >> +	rec = &syslog->syssleeprecord;
> >> +
> >> +	len += sysfs_emit_at(buf, len, "Wake Vector = %u\n", rec->wakesource);
> >> +	len += sysfs_emit_at(buf, len, "Sys sleep mode = %u\n", rec->syssleepmode);
> >> +	len += sysfs_emit_at(buf, len, "Sys sleep flags = 0x%08x\n", rec->syssleepflags);
> >> +	len += sysfs_emit_at(buf, len, "MIX power status = 0x%08x\n", rec->mixpwrstat);
> >> +	len += sysfs_emit_at(buf, len, "MEM power status = 0x%08x\n", rec->mempwrstat);
> >> +	len += sysfs_emit_at(buf, len, "PLL power status = 0x%08x\n", rec->pllpwrstat);
> >> +	len += sysfs_emit_at(buf, len, "Sleep latency = %u\n", rec->sleepentryusec);
> >> +	len += sysfs_emit_at(buf, len, "Wake latency = %u\n", rec->sleepexitusec);
> >> +	len += sysfs_emit_at(buf, len, "Sleep count = %u\n", rec->sleepcnt);
> >> +
> >
> >Why can't this be individual files and values ?
> 
> The System manager firmware provides a command "syslog" to dump
> all the information, I just follow same.
> 
> With individual files, some values may not be consistent, because
> system behaviour may change during reading two files.
> 

You definitely need to convince Greg if you take this approach. I am sure
he prefers single value sysfs files.

-- 
Regards,
Sudeep

