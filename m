Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04836C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 14:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEJ45fNosp7BpOTPhXbzgXwToXVydxose2bLKPWbZBI=; b=2xMuFnK2eYJ/iAC/w1ibgvU9ph
	wnUyr4AUss9nN+zGI1GTWmHFFn6j1ddbsaujkyeDLQWroe13NMfJEURU+m7PkFBvB7nkUBXp8bhMt
	KZxw1YUmxp+TRghpw6cAkBPCtlRev1gbPAReewuLmbaH7pYmxBON50jAQHnVobWiu+hEJ0aQPrgIU
	NI2pOgZIteagj75/+SN70YqHwDE3l50okUxMmUXpgkSNcFjsJEfd5OQZxtFIZBnAaveDsPGVi/Wj1
	JsQhISTfIUNSJD7R7MbuiQ7sXXxtmkkppCE8LBmsO78UXecsQuPB/ZTCpDDuQ2TGsa8dluNxZk8vp
	OdTQ2nRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdrkM-0000000AkYX-1Boe;
	Fri, 31 Jan 2025 14:11:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdrj3-0000000AkPw-1qIK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 14:10:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD346497;
	Fri, 31 Jan 2025 06:10:53 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E411E3F63F;
	Fri, 31 Jan 2025 06:10:26 -0800 (PST)
Date: Fri, 31 Jan 2025 14:10:24 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, <arm-scmi@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH V1] firmware: arm_scmi: Optimize the iteration of
 scmi_requested_devices
Message-ID: <Z5zZ0BnEVKL-vZGa@bogus>
References: <20250107052004.762817-1-peng.fan@oss.nxp.com>
 <Z5t5l9MXsAzg5VIp@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5t5l9MXsAzg5VIp@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_061029_526289_2D86C338 
X-CRM114-Status: UNSURE (   8.23  )
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

On Thu, Jan 30, 2025 at 01:07:35PM +0000, Cristian Marussi wrote:
>
> ... having said that, I cannot really recall WHY I decided to avoid ANY
> kind of duplicate naming given that teh match happen by proto_id/name...
>
> ....maybe just for clarity ? not sure...even what the effects could be
> of having such duplicated names across protocols...
>

Looking at scmi_dev_match_id(), it should be fine even if the names are
duplicated across protocols. We must just not allow duplicates within a
protocol IMO. I will push a patch to handle it soon.

--
Regards,
Sudeep

