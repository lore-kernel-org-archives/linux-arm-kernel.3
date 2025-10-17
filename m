Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B829CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57/rHfSQPuGwkuIFvhj50SlUVj/zuEPrhMXR5tNz9rU=; b=SBLZVHmiDu2r8jUtOHdQFYJqUy
	L4oGat96tFBfaJnuiP8Avado+IEksrSmqgBcEwWMZ7kwWyQnvM6qU98aO1PY647aPnIrpnOrmB1BI
	H3RlcXsD9ssqjKlJ2NXTwL/c2Xy9nKhHyLz6AO31SSwTtCCpudhOnrI+zEcCx2qQG40qZtWJwrQUO
	qXq07M+r4lb6rAR76jGl9M8tCcvZDb9E9qgQXlrwsguw8zibQ56aggI1491HoR0DV6rNbeJKP1BYi
	JNGsERqTKiNmZpn4n42PtxfD4Vm0+dmP6CdhBA4X3j1kGQx9RNTjVJecDspBTLXfUpESH9sKi/TG6
	OcJwGTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfq-00000008VAq-1L4H;
	Fri, 17 Oct 2025 16:51:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfg-00000008V4Y-3GJd
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 16:51:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=57/rHfSQPuGwkuIFvhj50SlUVj/zuEPrhMXR5tNz9rU=; b=LirFhmmHWGsGTbqUxmK/eKCJjt
	VTQmfSfCd6AlYWPtn09zMMdi68uP0341Nju2KFTzpOmbOYyg5Wp/R41mBjudPTphuq6WYZUWWsWFa
	xTRs2RhXCZT1zwkfNuk0Kz6aiLmKaCN7saK54oJ6NTvPwZk/UCtKPMWqsLBllW50P86Vw+dtvd7v+
	t9iOiIEPsX4YDftEhcsAynTD5VyKiUowIBwx01DJTjMld4kvEQ5Cmi857OyfSfe9OQjhWSKtJZB+2
	kAkUc3PK4VuFQwyrB0fm8ckjMnfeOOhISFbQj7xYqUp4J2ZR2UuPHf6DLtPkP2eQ9XTqxgGkYVYyJ
	StkEvOEA==;
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfd-00000007mlJ-1OkF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:51:15 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cp9nV4j7Lz9t6b;
	Fri, 17 Oct 2025 18:51:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=57/rHfSQPuGwkuIFvhj50SlUVj/zuEPrhMXR5tNz9rU=;
	b=h6Hy5gZc8o6DNgD1mXzAXa2gc2pWO2hO2Rc0XEtEFWXvNfYFYVGsGNYrMVgeAm9wxZqzhZ
	0ZlA5yB7iVwNsDtXUspThbhJAfTlY3+CwCGBv867qgg89/8MReSrTcO5lShKBwXZ+LtVG2
	gwnEB86TTxV2lXHG6K+wess5+yaqMT1RSfOMfVO0Bxyx3nenlX3oCTH2wdXJnBbq0K10aT
	Ql4nGGu3ZapgUemyfKQv2gZXZgiCZcKBZsthE5mtQJr2BdwNKDdxnN6ozlJ72oLVPnjLBp
	NNEZQ6sLxAOnXTMcCpgaeOa7SMq37N3Zfr0CgO47yMHGwbZwC3sFSoZdZWUz3g==
Message-ID: <809b7867-502b-4c3f-b7c6-f6f7a1226a08@mailbox.org>
Date: Fri, 17 Oct 2025 17:39:14 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 35/39] drm/bridge: fsl-ldb: Parse register offsets from DT
To: Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-36-marek.vasut@mailbox.org>
 <aO1RnY4CcKZWqh3s@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1RnY4CcKZWqh3s@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: e77f929ddf541b74f01
X-MBO-RS-META: q54r3z8wrx1c3jsp977s3wj1c6ik6snj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_175113_546361_A2884C40 
X-CRM114-Status: UNSURE (   8.35  )
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

On 10/13/25 9:23 PM, Frank Li wrote:

Hello Frank,

>> @@ -296,7 +290,7 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>>   	struct device_node *remote1, *remote2;
>>   	struct drm_panel *panel;
>>   	struct fsl_ldb *fsl_ldb;
>> -	int dual_link;
>> +	int dual_link, idx, ret;
>>
>>   	fsl_ldb = devm_drm_bridge_alloc(dev, struct fsl_ldb, bridge, &funcs);
>>   	if (IS_ERR(fsl_ldb))
>> @@ -309,6 +303,22 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>>   	fsl_ldb->dev = &pdev->dev;
>>   	fsl_ldb->bridge.of_node = dev->of_node;
>>
>> +	idx = of_property_match_string(dev->of_node, "reg-names", "ldb");
>> +	if (idx < 0)
>> +		return idx;
> 
> Does this broken compatiblity? If yes, need mention at commit message
Nope, it actually does not, because the binding document used for 
validation was correct and required these entries. So we can now safely 
parse them.

