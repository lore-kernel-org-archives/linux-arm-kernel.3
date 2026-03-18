Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B97103E197
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhbynmWg9sZqv8BVLzvPJLx78I+2GMm9N3KPCBAqJ38=; b=g3jTxg+UDxkDjkUf3F64WZpse9
	P4gaQNG8yIZbdeCcyn1+vHjdXsTVSSVc6Z1CzcnjI4pTFGl9MzRkPBPcYPTgpsVVj6u9m+iAukQL5
	UKyMsRYiXtld3Ll1aFbEmlKg7xoxFjVXvFMSKIy0Wb7+I1vcgGWiCo5paqjKxbx8vJyoxtbM/+rqr
	/Sb6TIdzFdx71uJu9njQ/P97iHLnuTom5gxPJNuwjsFycfogqgxcj7wL2s6yElmPdo4llH/u1I0So
	S4IxPvmubHtV6UElXtOUuqRZa6+rO4O2djRqCP2B/Th9xj61YooabsBB5dSrxoBqXVlHD3T1Oc6wz
	wAhRVcCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sli-00000008hES-0y36;
	Wed, 18 Mar 2026 15:25:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2slg-00000008hEJ-2elz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:25:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC8A760054;
	Wed, 18 Mar 2026 15:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76040C19421;
	Wed, 18 Mar 2026 15:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773847507;
	bh=nxhXPh3vQNUIoVu+t7BQIF5HZ0lldKFWGEMR6X+FJuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fgC+yxsYUq8NVj+WWQyM2OlwtE3LCphfH9SCKX5ECbV7Ypz8ZP1NnpY3wkZ4B/X3V
	 BurNtscpTZ+4p8jYjdiWEduW8LrdYlsFgjMpuCfx3Iflf83UirRTgewOIgi4ZVdAfZ
	 fhaiWnt01Xajdg4pF5HI9dt9WEHshQgCEAXVBS7R/9wbfrL4t6jR5+EuOLy5rZiI1R
	 OrWQIJu9Hh36zzaZqsN82kun+69iTHqpw1K+nDXI90SgqW26v25PKHme90VTPii4ZI
	 SVb+mKC+4zZWcOWOHxlQ41yWVtXlFUfz50NNWHxlx0Ec5CPYHH4Fj7VPV6l0VnmuQ3
	 Ohyz9v31Micgg==
Date: Wed, 18 Mar 2026 15:25:03 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: imx: Support getting reset
 reason of MISC protocol
Message-ID: <20260318-savvy-courageous-mule-b3f9ae@sudeepholla>
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
 <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
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

On Thu, Mar 05, 2026 at 09:56:44AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> MISC protocol supports getting reset reason per Logical Machine or
> System. Add the API for user to retrieve the information from System
> Manager.
> 

Sorry for missing this earlier. It looks good though my usual rant is that
this MISC protocol is becoming never ending dumping ground for all sorts of
info you want kernel to dump in dmesg. Anyways, I am not too bothered as it
is not any user ABI.

If, you plan to ask i.MX maintainers to pick this up,

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

If not, I need their ack for 2/2/

-- 
Regards,
Sudeep

