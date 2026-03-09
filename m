Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A926EA8551
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 03:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjmBP0MdqxK9eW9iFSpapkIs9ZQe8gs3/i8xYseK+BE=; b=3AMfEnyJlN2Wrake95s5LAeKl8
	dowWrRIdAxVDtgLoqSD3TLQqJK1x/r7SHusIZ4eH9upPE0SsRkBRCKtsY7th+1TZusLEJ0KP2MrP2
	vORzuQjFt3KvLxTgB4WvZlIDWbQN486NKd9WU/P9H9RSf4qvmh+VfZ9Gfgtv3ju4A3wqi1XKssmv5
	+T5kjXD1xbtHopKu2bhE5Z/Rf9qVnAJkF6K+C7S1EfQyGAd20P+HtbBIuQNNOMbyWFBt7mXrW0pgw
	iXGM2whhEgkUhAE1AzWVDmBAdhX4n5FAMtZcnvEby0hdWqLIhru1jg/it6DVXVe17Z/SiVHvbO4W6
	5rT9nMBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzRgh-00000006cDJ-1wcQ;
	Mon, 09 Mar 2026 03:53:47 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzRgf-00000006cCv-0BYR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 03:53:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibKvaytzob2RkURcBNRByBGGzfTg8oo6ToFImaG8TUQkXxYdd+GFRCQg2N9lUyQS43ScReRLx8IeB4Hn8Afj7X3HfMJg9FdFra3JFBUhj7EhiSCavZArf1YswsY6s1FgKUJwHUqmWtEa6ueU/+WED1iKgwc9w0ZepzF0ECM30axpOYCdVN18yR0UD6oVbLnRLFVrBFah1fD8CmYg53AXidRQd52/D9vDsSTq+VoBEy7j2wcTzqZr/rZlrhHWLfo9SC+FrQS9BmWhNjILHkyXKxd/exOyarp0w/oU51w2Lx9nBLDDQsngUbdgQqlgYvmDKE7/YAn907K1SHnRX/B04A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjmBP0MdqxK9eW9iFSpapkIs9ZQe8gs3/i8xYseK+BE=;
 b=Et+yUULawMGyv17Dl07hKoNIh0vGnf94Ju+wVYS0G2CRetWx17mwzMkpTwSxhIKyjwJAEY53wt4DLogIw/ki3VGf3qdc96Q6vNPXjGN+03YCShqWLRFSzsZwTciknkWUCePmiT/Dx7Ja7YoQE/PE5jNH1q6dtkFj59tok6WNizOYxY6KAOG/cIsBk3rnwJL7Vmww5lfNyGGTwIgtnfH88ARK0h4T720CJcm8ethR10N17sU25rqPgJnltdoo0tMM1HmlxxIw4NsF7MGRkqZjRFBN826zBBJPNUg6RcFSNv4hs6NyUENtx0Wxr7ks9ZvhKBGcwq1BydPTyNbNhgTeeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjmBP0MdqxK9eW9iFSpapkIs9ZQe8gs3/i8xYseK+BE=;
 b=j4/uCGgD7QW1pZzAUhS3l+D7zVYrnJpTq1iB/mSzIJFrHrXjcrSOxPDXZXiBf8RiqnzGmUbwXGNH36isDeba9CB6ZtPOPThZMW+3CW8wioMGsjFpgKHH8oyoL4UIXLFJ/okDYRevLXXGLX3pit8gvI6Wsbk5dLMhqBMvS+XB4Og=
Received: from SJ0PR05CA0056.namprd05.prod.outlook.com (2603:10b6:a03:33f::31)
 by DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 03:53:39 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::8c) by SJ0PR05CA0056.outlook.office365.com
 (2603:10b6:a03:33f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Mon,
 9 Mar 2026 03:53:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 03:53:37 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 8 Mar
 2026 22:53:36 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 8 Mar
 2026 22:53:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 8 Mar 2026 22:53:36 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6293rWhK4020500;
	Sun, 8 Mar 2026 22:53:33 -0500
Message-ID: <b2143a96-cbc0-41f9-935c-ddbd9357c7aa@ti.com>
Date: Mon, 9 Mar 2026 09:23:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j7*-ti-ipc-firmware: Switch MCU R5F
 cluster to Split-mode
To: Beleswar Padhi <b-padhi@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260209093015.3454340-1-b-padhi@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20260209093015.3454340-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|DS0PR10MB6271:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c8a8e73-cef3-4a26-f4fd-08de7d8f71c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016;
X-Microsoft-Antispam-Message-Info: yo5VriqSPtcYfOg2Loh6a7DKOOQe2pcrOG/RTEOzAFOIcPAQvu5ehDeA9P63w/NYElhcy6Rjjw1aih8pBhisBeCGwbBqqPbZa1RHHgjcILV3b0ATEw2C0T3bb4jF+C92B5D7PJpMqld1v1obMfL9i5+uOAjpFS8bcLkYPEubuXtZGnV5QFElDabRRiyWC1qJoAzF1tTrLXsm2xG9OVcg+14yLk8d1LXABfGtWvdndNA8t7HrRoEGRLzIKtvEQaed7T453cbUz7GVF1ZjStYUkl5Ny4NLN70j/y1BCYME9fHnKGfOwR2GP7rL5eFaxK9X8UKXsuRqxbgTu0j93eZdwxAc82Z9YMzAa7sob2mCEV0M0JwVOJUDTepQhPcWyzFRfoaGVssNYn2C5tel2ELex2FeVU5hc0Xs8bbgJ4uiZl2ypy5CyVkzJLrzyVDk75WlSsFA5cbp95O6S6YCf0/jnQDpPxPnpWDByX/QaRRZLDfbq/fsdWzOyyPi5WGKKMU59ARaroafs/7PerGeh3dCmywDITfWh9covTdjeHdf389NeKMu6oAJ9KPYTew+ONyLw99hw9YMJBS5bk32tu83yg5TUuUC+yOBtP/mm8iaAoV7BrWzwCvPGwTFUloZCd+hRXFlAb6H1hVogkWzYILWoWX8kMqCyC3IcRAFaE9ZXmOPz+uvY7vxuZr4F6g7qq5+XHiQ7r5YRCWdI+/7FV7YtWwmv+4bCvt/lS1afyjjtiE=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RNZCLDsGSuOzBI55JEuBZBKiFERbxjWJTQt5ELsUy7soZ+cvJQMDOJ47riwDfNUjieHuzHw94tu8fDlMufZvl/GsPvoESYjla6lDKrlHLNDtb+a/BbMZmvQAXXorDs5XyZazurSv664GB9fLHVcT5spwvDHJ3cdrtESEjm/WCty9gCE1FlWVODEJd32+RrtLcRNr4h/errwHP6qJaYcRelMA0jBsEm2+8yH/9Nktbtv9itRptwBzxAu3ABLUkiTG8jzjurzAjKdAC0LpZq8Ptw7cln5/EF/ifZv2X1yfTjAgqxpdLxfns/5dUl+dIQpvasr/Xn301j1WYVshHLwVkHF4X8KcNoMAxPnMgQNKgNWQwkxoxEjaXxkZQSRGaBtE+KQSII02ZSraZQU3yf6w0SpyCWxxQWqSj0i58ZFnU4L5c22UNaNVOy+5RHCPmzsc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 03:53:37.4791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c8a8e73-cef3-4a26-f4fd-08de7d8f71c9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6271
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_205345_292036_E69D25D0 
X-CRM114-Status: GOOD (  10.91  )
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

[...]

On 09/02/26 15:00, Beleswar Padhi wrote:
>  arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi             | 1 +
>  arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi             | 1 +
>  arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi            | 1 +
>  .../boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi     | 1 +
>  4 files changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
> index 9477f1efbbc61..b66faa2543f71 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
> @@ -94,6 +94,7 @@ &main_timer2 {
>  
>  &mcu_r5fss0 {
>  	status = "okay";
> +	ti,cluster-mode = <0>;

As per DT coding convention, this property needs to be before status
like below.

>  };
>  
>  &mcu_r5fss0_core0 {
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
> index 40c6cc99c4056..abd0d137d860d 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
> @@ -211,6 +211,7 @@ &main_timer15 {
>  };
>  
>  &mcu_r5fss0 {
> +	ti,cluster-mode = <0>;
>  	status = "okay";
>  };
>  

-- 
Regards
Vignesh
https://ti.com/opensource


