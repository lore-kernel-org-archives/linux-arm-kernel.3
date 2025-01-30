Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9216C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 13:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/DoXoEfNojPxH303Po/0vxXYMORroJgAtBPP5ML5Kk=; b=yC5hUgn/ZHAIxRX6v3N/r5llCE
	pfTyeSeOm5+EBJOh52skf7MLw0Tq+7+XMU/PnL+kNNuc+uIVQTf2RSgo6qbOfj9iQpK0UbyRGM34m
	qpeK7OuHkhswae+yZjd/ZaCogvxQRuQlnvziFUQ3ErVsi0Q8IYY9BdtFh2PiCLywnu41Fug8Hld92
	VIpIWpTPz6+v6yBzyaWfNvoZxPYiX/mxdHVIjYEejBsonmfW9wQNn1Dx3LXylbo4O3mVmv+O323AC
	uBJGWqMh99+U8cnMZNbwGyyV2oDVGrsf0+iB4p9JN8sjbT+lm3qjEGk4SVs+kgBoBmib0et9g7F6P
	aSNK+vxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdUIF-00000008ozb-07R8;
	Thu, 30 Jan 2025 13:09:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdUGp-00000008orn-0jmr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 13:07:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDA58497;
	Thu, 30 Jan 2025 05:08:09 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A885A3F63F;
	Thu, 30 Jan 2025 05:07:42 -0800 (PST)
Date: Thu, 30 Jan 2025 13:07:35 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH V1] firmware: arm_scmi: Optimize the iteration of
 scmi_requested_devices
Message-ID: <Z5t5l9MXsAzg5VIp@pluto>
References: <20250107052004.762817-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107052004.762817-1-peng.fan@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_050747_257682_69CBC8A2 
X-CRM114-Status: GOOD (  11.97  )
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

On Tue, Jan 07, 2025 at 01:20:04PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> scmi_requested_devices is organized in IDR based link lists, so only
> need to search the link lists when there is a match protocol_id.

Hi,

while the original implementation of this loop was awful (my bad), I think
this optiomization indeed NOW changes the logic of the checks....

...you can have number of proto_id/name pairs describing requested devices
and the idea of the logic in this loop was to catch ANY duplicate name across
ANY of the protocol list as stated in the function Dox:

---
 * This helper let an SCMI driver request specific devices identified by the     
 * @id_table to be created for each active SCMI instance.                        
 *                                                                               
 * The requested device name MUST NOT be already existent for any protocol;      
 * at first the freshly requested @id_table is annotated in the IDR table        
 * @scmi_requested_devices and then the requested device is advertised to any    
 * registered party via the @scmi_requested_devices_nh notification chain.       
---

The 'awfulness' of the original loop was that it was trying to do 2
things at once:

- loop all the lists in the IDR for ALL protocols looking for a
  duplicate name anywhere, and FAIL if ANY found

  ... WHILE at the same time:

- save the head of the protocol list_head matching the requested
  id_table->protocol, if any already existing, so as not to have to scan

So, indeed the original loop was meant to be an optimization, even
though probably unreadable....

... having said that, I cannot really recall WHY I decided to avoid ANY
kind of duplicate naming given that teh match happen by proto_id/name...

....maybe just for clarity ? not sure...even what the effects could be
of having such duplicated names across protocols...

Thanks,
Cristian

