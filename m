Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50722CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 16:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAO+gGxG2+bfA9bUn9PeQDcZUygV2d3WgfnEJdr8asM=; b=ZhnJ4MqAoYnYAvVcFF9zKmxrqN
	U+cA6KZt43hQmxnZ9cfUKweK2dwGiBBvMx99Jzov5IEA3SQEes4BHQGnvHWiyrKNxvI/llrFTYoQI
	mkqrQ9MK4VdgRiLUYHIAlT+CcAWxsPNzFZrKF2RsyA+i9fW69PE52kkTVoJUvqrp+mfYgQUFIl9P+
	AZ4Zw7RNIRla0nWksN6DlxM+BFYuNoWslfG/+FQaqqa9HSYGmVpjpKPs7W4uXDae6DkAHNE4hwK0N
	DocUsq5UBkKnmhDA8Dminp3dSqga91rEQZ9eBOKiwPa8o46m0FVwHQTCbKi5Va8+6KZO+SKj/rZMF
	OJSUUCRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdxP-00000003WgD-3Wxz;
	Fri, 19 Sep 2025 16:27:35 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdxN-00000003WZ6-15ix
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 16:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XAO+gGxG2+bfA9bUn9PeQDcZUygV2d3WgfnEJdr8asM=; b=aQYQLuf7FC+Ugjcq+akkLzHEWb
	gnCyLMuj5kMO+VYRn2E7hKCgSKhx6G4GTh7ksinzmqPQz5Lc1wDLWEjV99GORtkou8RJkpVYKpzMY
	IpkZz9/h7x1hLwsg9iXTR53mkmQtRV4wDiknBzNb6Di/ydOK8PJ6LHdeDQIPSnxq5ujlwipeq2t1f
	Ux0ycNvS+gm8k6mhwnY2NsmNB8v3P/7nyU513H1pxcvdK9kvLpR2EGPj9Igaq4E+Gso87jRA2VIRn
	IHuOewkTswSi1O+bF+gaOQGnH3hmzUAQ/IR5IVtYv9ExiH/3ons+XzBy3wFdRaUHayqDaQTKVrTPe
	0UPmESXA==;
Received: from [122.175.9.182] (port=43780 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1uzdwg-00000008iZx-3eQP;
	Fri, 19 Sep 2025 12:26:50 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id D708317821F2;
	Fri, 19 Sep 2025 21:56:45 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id B46BF1783FBE;
	Fri, 19 Sep 2025 21:56:45 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gwyFsi76Mi5L; Fri, 19 Sep 2025 21:56:45 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 81BB117821F2;
	Fri, 19 Sep 2025 21:56:45 +0530 (IST)
Date: Fri, 19 Sep 2025 21:56:45 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: kuba <kuba@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: rogerq <rogerq@ti.com>, danishanwar <danishanwar@ti.com>, 
	parvathi <parvathi@couthit.com>, rogerq <rogerq@kernel.org>, 
	pmohan <pmohan@couthit.com>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	pabeni <pabeni@redhat.com>, basharath <basharath@couthit.com>, 
	afd <afd@ti.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	netdev <netdev@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Message-ID: <1112336225.391532.1758299205136.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250919070456.197f3930@kernel.org>
References: <aMvVagz8aBRxMvFn@stanley.mountain> <20250919070456.197f3930@kernel.org>
Subject: Re: [PATCH net-next] net: ti: icssm-prueth: unwind cleanly in
 probe()
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC139 (Mac)/8.8.15_GA_3968)
Thread-Topic: icssm-prueth: unwind cleanly in probe()
Thread-Index: Ig+wyV11vbQ6KkdDAz/IymgNZCtcYw==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.couthit.com: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_092733_369750_C818F89B 
X-CRM114-Status: UNSURE (   4.62  )
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

Hi,

> On Thu, 18 Sep 2025 12:48:26 +0300 Dan Carpenter wrote:
>> This error handling triggers a Smatch warning:
>> 
>>     drivers/net/ethernet/ti/icssm/icssm_prueth.c:1574 icssm_prueth_probe()
>>     warn: 'prueth->pru1' is an error pointer or valid
>> 
>> The warning is harmless because the pru_rproc_put() function has an
>> IS_ERR_OR_NULL() check built in.  However, there is a small bug if
>> syscon_regmap_lookup_by_phandle() fails.  In that case we should call
>> of_node_put() on eth0_node and eth1_node.
>> 
>> It's a little bit easier to re-write this code to only free things which
>> we know have been allocated successfully.
> 
> icssm maintainers - please review

Yes you are correct. This got missed somehow sorry about that.

Now the error return is gracefully exiting by freeing the resources.

Reviewed-by: Parvathi Pudi <parvathi@couthit.com>


Thanks and Regards,
Parvathi.

