Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A61AFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 09:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCVoQLzeSnEIV6g9VauqYrzXA45pGA73bVfYhY5Hkas=; b=sBtDfVn4rHWhpUYPpZeBMdz/Rs
	D+3Y09Qat5rmoVINiUzWSSHX3g60j+/wosye2/jQFDnjd+9CVqEC3G5nVDK15VsPLM83dOvsG7z10
	jp7ImDU/rVR9u7MfUBleq58TbNHOVnQPc7mpysGxCKLMpRwUE/INWzTmbMxM5hrpRscJpvR/cgPhN
	+vKf+uRkmqzANKB8DyuqOaw6V8JeaJENatBkxd7D6re7UV6sTvE35CqseCNkDVD3LhB7omnaucmPA
	YhbFS32eYKnfHzmf7l3/6wIquInzmqGvOszMFEPTllWqeQM91WeQmPNJxonv3OmiuhG2MRODQxJtj
	TnaOZ4Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wINT1-000000054xf-2Icq;
	Thu, 30 Apr 2026 09:13:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wINSy-000000054xJ-49jM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 09:13:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3274E4019D;
	Thu, 30 Apr 2026 09:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116A3C2BCB3;
	Thu, 30 Apr 2026 09:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777540432;
	bh=UdNB1egWYjpUHiiwp2CFfEtBa7QoII0RZrh0xQbjLGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RAtE09c/Pq4kL4koWknd9JnUKr6X7YSZn8+aOr84h3F8VuzIw9nGbNfYjzgVOVStb
	 PfZ9zaOTiIdfH7QSRpAadzDY3cLewijCk+xAKzI+08bUll2fq9Ac8VjZg6db9HFPG1
	 bg3amLo6SkLBFzvfr1DGUGaG/7WQ6Ra3wgdcjtvFTtCMd+AfW6GXuFBMv+EXt8mt9J
	 +izL3jjVhVoBhyblugNDVbjqVTz/FELwo9lXE31lUJNQTyOBKUja2qtbICMUob7K0a
	 QeW/C1DlNJOogoiSoUaxU4nLGbvLrdHYhfEKggYjgL2F245krxrYnQ2fnCBkIOAg3t
	 uEfbvQj29D0Qg==
Date: Thu, 30 Apr 2026 10:13:48 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: imx: Support getting reset
 reason of MISC protocol
Message-ID: <20260430-private-versatile-jacamar-fd932f@sudeepholla>
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
 <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
 <20260318-savvy-courageous-mule-b3f9ae@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-savvy-courageous-mule-b3f9ae@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_021353_069781_61889373 
X-CRM114-Status: GOOD (  15.39  )
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

On Wed, Mar 18, 2026 at 03:25:03PM +0000, Sudeep Holla wrote:
> On Thu, Mar 05, 2026 at 09:56:44AM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> > 
> > MISC protocol supports getting reset reason per Logical Machine or
> > System. Add the API for user to retrieve the information from System
> > Manager.
> > 
> 
> Sorry for missing this earlier. It looks good though my usual rant is that
> this MISC protocol is becoming never ending dumping ground for all sorts of
> info you want kernel to dump in dmesg. Anyways, I am not too bothered as it
> is not any user ABI.
> 
> If, you plan to ask i.MX maintainers to pick this up,
> 
> Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
> 
> If not, I need their ack for 2/2/
> 

I have left it in my -next queue assuming I would get ack if I need to take
it. But I haven't received any, so not sure if I need to take it or drop it
assuming it will go via i.MX tree ?

-- 
Regards,
Sudeep

