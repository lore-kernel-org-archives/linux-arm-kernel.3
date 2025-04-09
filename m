Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95756C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 11:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8OUMSsqyLIihlV/s3RjCMqd4+HGdZT4D0Danegj940=; b=EeSm+YFjRkf7QI
	VNHDp95lhvqIN9zroeFfZimIIm35V/izvbB7FlLd9Ua1ARDK+LeaJudMhytPCAIN2TRVNOxWF2bgj
	Qjka/9ZX26qsa9dtiSGb9IFNKjQAsn9xZ5mDe60LerHpXSXHC6i1rZ3vKiOGVxH5pCZ/euXtLVBp3
	Pnv6MMajfs/2pxj6PAKIoai+ktZEoVocahuWHWEbEEBSw0SfLH0OgoCC1XW4rFYWVFY3hf7fZmdyh
	mw1nrTydJUitlCDHIRO9E90mYFM+uIMTbck2pKX2609KANJ+Vfm0mM0/q47mZYi49tud50WQd7eD8
	tfiV1hNI3BLiXigFdeyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Tbs-0000000703R-3MjD;
	Wed, 09 Apr 2025 11:28:48 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Ta6-00000006zfS-0WI4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 11:26:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=A8OUMSsqyLIihlV/s3RjCMqd4+HGdZT4D0Danegj940=; b=EZiTOGN5QQPVhS/G4Z4pNruK7K
	Lfv9vKeuYOP1u1erh9WoRg7nI1cSIKzxsHkncbTo8oKfM7F2pMbuG4ZTcgRRkQ8vx4BZcni338eCh
	XIKPyYQeTfJ3aMPeDWr1JPZP9OehXPDOD5S3mTp9mYMalDEZwAGo9WBoBEDLjNi4LHK9q0BItJ70S
	cJupGhxCNYFmNmk5ZLNovJABpuWcqmUiBWQdt9ldIGqiVfvEHqHyG1V+G//RoO9XaC/+8qDju3hHf
	RAIwH/K/T4gzv6ZTwAwnljEsCfjbyKN9Sw6TRs0dS48JFmBtQaC+esYd7hKOjPMiQLUkod+2KGGh4
	olE+CtdA==;
Received: from [122.175.9.182] (port=6319 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u2Ta2-000000000OO-3638;
	Wed, 09 Apr 2025 16:56:54 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id C2069178207F;
	Wed,  9 Apr 2025 16:56:46 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 9F487178245B;
	Wed,  9 Apr 2025 16:56:46 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id emKaGm-byJBY; Wed,  9 Apr 2025 16:56:46 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 52C58178207F;
	Wed,  9 Apr 2025 16:56:46 +0530 (IST)
Date: Wed, 9 Apr 2025 16:56:46 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <890030824.1024606.1744198006152.JavaMail.zimbra@couthit.local>
In-Reply-To: <64a3cd3b-feee-4414-8569-01642b127ac8@lunn.ch>
References: <20250407102528.1048589-1-parvathi@couthit.com> <20250407113714.1050076-6-parvathi@couthit.com> <64a3cd3b-feee-4414-8569-01642b127ac8@lunn.ch>
Subject: Re: [PATCH net-next v4 05/11] net: ti: prueth: Adds ethtool support
 for ICSSM PRUETH Driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds ethtool support for ICSSM PRUETH Driver
Thread-Index: Id9woddb5lTowb7DJcpLv93q8Zy6wA==
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
X-CRM114-CacheID: sfid-20250409_042658_213916_1BD4DE28 
X-CRM114-Status: UNSURE (   2.63  )
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
Cc: nm <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

>> +#define PRUETH_MODULE_VERSION "0.2"
> 
>> +static void icssm_emac_get_drvinfo(struct net_device *ndev,
>> +				   struct ethtool_drvinfo *info)
>> +{
>> +	strscpy(info->driver, PRUETH_MODULE_DESCRIPTION, sizeof(info->driver));
>> +	strscpy(info->version, PRUETH_MODULE_VERSION, sizeof(info->version));
> 
> Driver version numbers are pointless, they never change, but the
> kernel is changing all the time. Leave version blank, and the core
> will fill in the kernel version, which is useful.
> 

Understood. We will address this in the next version.


Thanks and Regards,
Parvathi.


