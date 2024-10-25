Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C3AD149E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwKM75sCFnfctTtbj/opwnkqiPuhZWuGKbKWcmwTyIY=; b=1GTxDJ21qTBxIuQRCckgFZvaFw
	IccLRxttJF5D4ByDouvSwqyD6JNkRnolqqWR/+JP0fCr0t8tO/6EK0lXigxX4g4r/70LURI7uHcKC
	EQfnYme1vivrKJ+n+OvoTfHSsyTQGK8kCOJZmhr+acj3bqlCvOJ0gH5ChEJCKoFYCnB5NOy9QHIvB
	5Jh+0KSmq3N/8qEWe4ntNkRYMDvYkJ+Qvp7d447+6beUKJRgHGvYMTeU2VTvQqbP4sm9XhYsCA2bn
	XsRgsenn/45QHmHrTd8bjUwRVQMW75Y/SHt4DkHQV0DHpcCoLiwXGKVA7PO8nYU2f3j0mFwvZO3S3
	EU/DM+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4P6B-00000004ona-2uPq;
	Fri, 25 Oct 2024 18:31:47 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OKC-00000004egA-1Mt3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:42:13 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49PHg5wc021530;
	Fri, 25 Oct 2024 12:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729878125;
	bh=pwKM75sCFnfctTtbj/opwnkqiPuhZWuGKbKWcmwTyIY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VE6wSRv7zxAis0MClAfx62Vw8upuraUz6En61GTY3JhXbfzImFcpblBr1W0a+nASO
	 NaGFszhOPgI7MhmNVnGjjPHRtsUqfYjyKZpfr3mxRzE0NYwYstYXKDrbNjfJh8youM
	 QbMHDDQhPNlGCe36910F7UUSlTKEBAWwgP/RrnZI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49PHg5UT068344
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Oct 2024 12:42:05 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Oct 2024 12:42:05 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Oct 2024 12:42:04 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49PHg4lt109361;
	Fri, 25 Oct 2024 12:42:04 -0500
Date: Fri, 25 Oct 2024 12:42:04 -0500
From: Nishanth Menon <nm@ti.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
CC: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Anand Gadiyar <gadiyar@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Vishal Mahaveer
	<vishalm@ti.com>,
        Kevin Hilman <khilman@baylibre.com>, Dhruva Gole
	<d-gole@ti.com>
Subject: Re: [PATCH v3 2/6] firmware: ti_sci: Partial-IO support
Message-ID: <20241025174204.xwmsn2arcy4q63xu@reaction>
References: <20241012-topic-am62-partialio-v6-12-b4-v3-0-f7c6c2739681@baylibre.com>
 <20241012-topic-am62-partialio-v6-12-b4-v3-2-f7c6c2739681@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241012-topic-am62-partialio-v6-12-b4-v3-2-f7c6c2739681@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_104212_522732_53F06145 
X-CRM114-Status: GOOD (  21.05  )
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

On 16:39-20241012, Markus Schneider-Pargmann wrote:
[...]
> 
> The possible wakeup devices are found by checking which devices are
> powered by the regulator supplying the "vddshv_canuart" line. These are
> considered possible wakeup sources. Only wakeup sources that are
> actually enabled by the user will be considered as a an active wakeup
> source. If none of the wakeup sources are enabled the system will do a
> normal poweroff. If at least one wakeup source is enabled it will
> instead send a TI_SCI_MSG_PREPARE_SLEEP message from the sys_off
> handler. Sending this message will result in an immediate shutdown of
> the system. No execution is expected after this point. The code will
> wait for 5s and do an emergency_restart afterwards if Partial-IO wasn't
> entered at that point.
> 
[...]

> +static bool tisci_canuart_wakeup_enabled(struct ti_sci_info *info)
> +{
> +	static const char canuart_name[] = "vddshv_canuart";
> +	struct device_node *wakeup_node = NULL;
> +
> +	for (wakeup_node = of_find_node_with_property(NULL, "vio-supply");
> +	     wakeup_node;
> +	     wakeup_node = of_find_node_with_property(wakeup_node, "vio-supply")) {
> +		struct device_node *supply_node;
> +		const char *supply_name;
> +		struct platform_device *pdev;
> +		int ret;
> +
> +		supply_node = of_parse_phandle(wakeup_node, "vio-supply", 0);
> +		if (!supply_node)
> +			continue;
> +
> +		ret = of_property_read_string(supply_node, "regulator-name", &supply_name);
> +		of_node_put(supply_node);
> +		if (ret) {
> +			dev_warn(info->dev, "Failed to parse vio-supply phandle at %pOF %d\n",
> +				 wakeup_node, ret);
> +			continue;
> +		}
> +
> +		if (strncmp(canuart_name, supply_name, strlen(canuart_name)))
> +			continue;
> +
> +		pdev = of_find_device_by_node(wakeup_node);
> +		if (!pdev)
> +			continue;
> +
> +		if (device_may_wakeup(&pdev->dev)) {
> +			dev_dbg(info->dev, "%pOF identified as wakeup source for Partial-IO\n",
> +				wakeup_node);
> +			put_device(&pdev->dev);
> +			of_node_put(wakeup_node);
> +			return true;
> +		}
> +		put_device(&pdev->dev);
> +	}
> +
> +	return false;
> +}
> +

What is the binding that supports this? I just do not think that
scanning the entire tree for vio-supply implies you will get thr right
property here.

Just giving an example to illustrate this point:
Documentation/devicetree/bindings/net/wireless/ti,wl1251.txt says it
needs vio-supply -> so i have a node with the wireless supply as
vio-supply -> Since we are scanning from NULL for vio-supply, we hit
that, that is a bad choice for enabling io-retention.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

