Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BD1C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OVLzpGyAnuZGHlfCQnUEFiF2NICo49l1c70JyAHdJCE=; b=MJIOgzIsiTyMmu
	0WAzHAIpGZ1hZLpT265FsBbbrHmg0XXcxyDFEfw2RhgYW3IMQpThwwYJa1OZ5yMfj15HXt7zq38ES
	zKjCa6G++c69yvIRU6X2IVbxPwURoN+y1svsJrizWZuNnntdO2kmppmRtbmnOV/LPrOJcRHdxiG1p
	X3iiFR+dzm6KbRDaQriA+m31xd4ECv7TaHpRfnQrXWTsHBYtvzS5tlDYt92Qhb5gp6ry2jUYqIkkz
	on684mBWPrT4O+0Qw0bunGZft7wOGS9G+N74wHx+/+2141GPSZ/EpMzc97luBvk/9TRTu73i7UD51
	+JZf64vtuOvURrcouBOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKlD-00000007jX2-1ATR;
	Tue, 18 Feb 2025 10:23:27 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKUq-00000007fOM-2Du1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 10:06:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=OVLzpGyAnuZGHlfCQnUEFiF2NICo49l1c70JyAHdJCE=; b=YsjgW8iQkmOefbMr+6DULtsIga
	yFggL4XyBiiokWFf3Yl10YLELIEdidsYjMd1P23he71C2U0yLjxOQ1A2Z1/Lxh452bIq7+gmWbfhH
	ykWZ3d/b0XeYJlwVZY8I8ahMi8s3TkX4kifAxMp/kp2wa3mH+63hOkhk402KWiBaAoPNPKTJOQs2f
	qoxFzskQ+WpcfR2y/pE4OMAAGAJDbJgiuxgQ6iop5tWejuRB+1aLSnzTWbk77Gdn66JlCUuM6pcSR
	p4mcDjSZ/iglZq+kxgGilPEXmFV1sfz1koVdXfY2+evT2Ue16Ysfe6Ey5OKxEJvxt0YlReMGrD7be
	0JNj/tYQ==;
Received: from [122.175.9.182] (port=15274 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parvathi@couthit.com>)
	id 1tkKUm-00086M-2f;
	Tue, 18 Feb 2025 15:36:29 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 8A9E317821C8;
	Tue, 18 Feb 2025 15:36:20 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 665BF17823D4;
	Tue, 18 Feb 2025 15:36:20 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id AF5WfMi2JOCR; Tue, 18 Feb 2025 15:36:20 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 3381D17821C8;
	Tue, 18 Feb 2025 15:36:20 +0530 (IST)
Date: Tue, 18 Feb 2025 15:36:20 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <1348929889.600853.1739873180072.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250214170219.22730c3b@kernel.org>
References: <20250214054702.1073139-1-parvathi@couthit.com> <20250214170219.22730c3b@kernel.org>
Subject: Re: [PATCH net-next v3 00/10] PRU-ICSSM Ethernet Driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: PRU-ICSSM Ethernet Driver
Thread-Index: G9POODYMWs8t48CuCyp4N0Tp+gKU+w==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_020632_599148_E7202A6F 
X-CRM114-Status: UNSURE (   6.23  )
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
Cc: nm@ti.com, Vignesh Raghavendra <vigneshr@ti.com>, praneeth@ti.com, edumazet@google.com, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh@kernel.org, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, m-karicheri2@ti.com, basharath <basharath@couthit.com>, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan <mohan@couthit.com>, richardcochran@gmail.com, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh <pratheesh@ti.com>, m-malladi@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, danishanwar <danishanwar@ti.com>, afd@ti.com, andrew+netdev@lunn.ch, parvathi <parvathi@couthit.com>, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


Hi,

> On Fri, 14 Feb 2025 11:16:52 +0530 parvathi wrote:
>> The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
>> is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
>> Megabit ICSS (ICSSM).
> 
> Every individual patch must build cleanly with W=1.
> Otherwise doing git bisections is a miserable experience.
> --

As we mentioned in cover letter we have dependency with SOC patch.

"These patches have a dependency on an SOC patch, which we are including at the
end of this series for reference. The SOC patch has been submitted in a separate
thread [2] and we are awaiting for it to be merged."

SOC patch need to be applied prior applying the "net" patches. We have changed the 
order and appended the SOC patch at the end, because SOC changes need to go into 
linux-next but not into net-next. 

We have make sure every individual patch has compiled successfully with W=1 if we 
apply SOC patch prior to the "net" patches.


Thanks and Regards,
Parvathi.

