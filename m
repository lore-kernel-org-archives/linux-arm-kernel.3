Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4BEC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYzoKM5lmkaC39sbNzJGopm6Y6YP0IvsOMHeqSwvGiI=; b=3qFOqn3JHRmPUnaZ2/oZEpyWGQ
	O+VoJJgcBMS0AwfNDTp/oJPHzlPb8TFxBJ9dcRJqyklHEeyKylDSBZ9Qtx0wRmaUnSaCluksy2VIb
	9Lc8lo2s4kZOdhi74kbc4HJIzBVMb6g/kMN2a4P7vY3lh6AUiKUNDfWiV5t3aWGnp41maHZW/40O4
	7SlL8yCckpofeEvoAX3qfU7LunUxSAs7UKqZ1xMn/cfFXQ95fKcXtc9eepMvsdAMtdJ7TPIxMwvbp
	j9WCjCYhNRuf1QdQnAkJU4Ktxco40pMpItc2cnBpniaPOUvsJV2qDj5xb/zZ+x1Eox3JjSwRsGULM
	g4tLQqHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxS5K-0000000DpAc-1JpU;
	Fri, 21 Aug 2026 16:27:16 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxS5G-0000000Dp9w-3XI5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:27:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0LLp84dybvZs1qRa1VZN432CKA0bzBqa961fux8YKmY94am+SjbUkVfLPTdqvi+56DAAw74vJkm6eB/V96Mz9uYiLi3UzNXpBjK8MJp9JY7Zdhv1rpiXN5o0IoMvLV7ON4cLVbDIsseTtTNRnkai5JbyfIDFWqxySXxOTvtz9LqOdWU4aHjmvVsG/fVgCHHHfThv5EmTAlxIslrL2kaK7voCCJSc5Th/I0Ew1t9NEFFqz2mHeCG3cYMjRM3XWoJBFRNMiLIuUliNMWSoe2V8mAfJXUSi/5VegtYktbmujdsV2r04txX9FL6UgwLXFiYnnARgn96SGZB616INoIrQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYzoKM5lmkaC39sbNzJGopm6Y6YP0IvsOMHeqSwvGiI=;
 b=y5sp7g1zSV0xTJJb5nDbdzCsbhgJntwxptIx2jRsaiJKOjKYNQXhbtqSnhj8gjsLQnUiWWYLkSPHLADrWQrNkYUnP2ji2r0f9FkKreLPahjSi/Au1vPngI+5BdUyTbGl/gfSIv87HfUW6eRA1xIl4wRWC6Uwc+UNtNIyaJ4uEEW/W3AEhFeKxDAVyYE5cxniZC2LxZZ2onSfWib+jqsQLrOMFptuXlDv0JUHCjZFFN8aKB+tfSee/ExPINojJWTRMAzHw8RIf4p7n9y/DfdzCV7WpBVgVIyrFT77dAVVokGtx2suAElvl7n9QzfvOpaRri0OUNnXZkebQTAC4FfyiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYzoKM5lmkaC39sbNzJGopm6Y6YP0IvsOMHeqSwvGiI=;
 b=O+Sl39aDrlqFXzKyWSzJZ2ErgR5wEKQzwBhNccF78RwpzFiSX6wT9OJynDfRB1Y4rELBFxlzYA00oFXYhySfjj36Z7hbOXNWIvEC6LM54BthB2dUG6XQUQe0FEbNhEo9J/VkNShsU4GvnJq9azJRWXW8J4XYd9sR0+wgz3UWjWVOqXCwzbdSCb/3b5x16TFX+tQXn+WiF11QdC8dV5UCKOaP33BLHT2LygpdOzh1cQKOx+9RnNulOfJn910z8sB+8n6MQ7g48VOh9aPUiXrmLL6Lh6/lNqwDQPw6SOBI1P6HOsE7IZKKEd8E5pOyZdDGOD92yaVbtfk7lqMDzMcbjQ==
Received: from DUZPR01CA0238.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::9) by DB9PR10MB6642.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3d2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 16:27:06 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::55) by DUZPR01CA0238.outlook.office365.com
 (2603:10a6:10:4b5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 16:27:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 21 Aug 2026 16:27:06 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:32:05 +0200
Received: from [10.48.86.251] (10.48.86.251) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:27:04 +0200
Message-ID: <db62c29a-7260-4e19-9279-e38323353c30@foss.st.com>
Date: Fri, 21 Aug 2026 18:27:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: usb: Document ST UCPD
To: Marek Vasut <marex@nabladev.com>, <linux-usb@vger.kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley
	<conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Rob
 Herring" <robh@kernel.org>, Sebastian Reichel
	<sebastian.reichel@collabora.com>, <devicetree@vger.kernel.org>,
	<kernel@dh-electronics.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20260819163410.119755-1-marex@nabladev.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20260819163410.119755-1-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.251]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FB:EE_|DB9PR10MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fb3e4a3-7159-4259-96b1-08deffa10a63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|1800799024|36860700016|376014|23010399003|18002099003|13003099007|3023799007|56012099006|10067099003|11063799006|5023799004|22082099003;
X-Microsoft-Antispam-Message-Info: JI8P2/1LlV4pX6wbFtpUulS+Kup6ZZGif6bSnfBLhx8Typghtxw52ZL7CcFeI0dFSn8IF45kTbKbiUPaRGdD5mZdwvZiyOlbK7gBJTRQotCE5EfjCz6X4UKBI7HCHmnarX/wQKpHeUTB8eQK00ijsaqWWGYe+ttE6QQtkk3tSTMKsMktM+gRGEaDOtQenuTdVTe1RneR7j3rBmMisttLfRFbybBYnzded8kPrWYHppPygJhrliPbD2DrhdKD2ZmAk4PLDfH+qJ3VLYGpw8Q7+ccvZwfL+gIYJtbTQpSYLIjnpbcZqBxmZa7n6vECZb57vfNLqI43E/imSb8uUgBqO5CtWTqm0D15hTzenEjI0jG+RRH+HO7txJNeo5/40Oy5nafCwdpdMge+j6sBHg4stBedWhu46HLqWWQlulglRmzYOIRNfvxObryqyKmjZjG4aKtrrA9RosWZqDlUrUnjfqqTZ0prdQa+GDBwdJ4wavKQLBHTuv6E8iDOHO7321+DBi/Vvn8uhtYaSRvwFMK5/tdh8xmDN7HiSWNXjA2xQNC5+AxtGIjcGypN0OQhvr7Cx2p928HEw9/qP0D646yzCtQv+du0OdcR6HgGrHfrYGAvoATCZGJE3HlGa53Jwumrjx+Epmf9gcD37Fgywu2qBA==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(13003099007)(3023799007)(56012099006)(10067099003)(11063799006)(5023799004)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: O51Rpk1OOo6f9Lddo7Vdgv1o2u1zYv5zd0Z2oqzxL/SH4MeXzwqORwTTlVyNeuO63Q9S5PMnGwdvTR6vkFBX2RcnggOiaJqeH20DcIsrfe2XonrG0bBGKhHv6Z8qqLxvaHtpBC5RG8CATCD82OWiRcRgoZceIHGRip1T/kPhmSGZxzxR50h4+tXRomwUmCO5d7GClQi1SRvUu4f5q99ueS2fdR2Q/qlZQTJWc9HGAN6vRwPwLQ8Bru4rrzpRoVggr1PXE1ETLdugNCcM+i9xKlHqX20cjudqM5cYP6dQKbsUS+q+4O2b0s4XaEB0sWxZOfLQPVZVlF0BtdkYKn1k3hIoA9z8/oDDpnapA6fxPwNLtRevqnUwbad83/WhEahOYc3wZT+2SE0qKqtp1468x7rN80Kb1VX5YLXqBgFW+c2R/m8a/Wn4aihiRMFKPb7b
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:27:06.1092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb3e4a3-7159-4259-96b1-08deffa10a63
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6642
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_092710_915654_3DE42E2F 
X-CRM114-Status: GOOD (  16.77  )
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

On 8/19/26 18:33, Marek Vasut wrote:
> Document ST UCPD Type-C block. The UCPD integrates the physical
> layer of the Power Delivery (PD), with CC signaling method, for
> operation with Type-C cables. Vbus and Vconn control is performed
> using an external chip, usually ST TCPP01/TCPP02/TCPP03 or similar.

Hi Marek, All,

I've sent a series for the complete case. Please check and review here:
https://lore.kernel.org/linux-usb/20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com/

Thanks,
BR,
Fabrice

> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
>  .../bindings/usb/st,stm32mp25-ucpd.yaml       | 154 ++++++++++++++++++
>  1 file changed, 154 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/st,stm32mp25-ucpd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/st,stm32mp25-ucpd.yaml b/Documentation/devicetree/bindings/usb/st,stm32mp25-ucpd.yaml
> new file mode 100644
> index 0000000000000..9b13efdc90597
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/st,stm32mp25-ucpd.yaml
> @@ -0,0 +1,154 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/st,stm32mp25-ucpd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32MP25 UCPD Type-C controller
> +
> +maintainers:
> +  - Marek Vasut <marex@nabladev.com>
> +
> +description:
> +  The UCPD integrates the physical layer of the Power Delivery (PD),
> +  with CC signaling method, for operation with Type-C cables. Vbus
> +  and Vconn control is performed using an external chip, usually
> +  ST TCPP01/TCPP02/TCPP03 or similar.
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp25-ucpd
> +
> +  reg:
> +    maxItems: 1
> +
> +  access-controllers:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +      - const: ker
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  nvmem-cells:
> +    maxItems: 1
> +
> +  nvmem-cell-names:
> +    const: trim
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: phy
> +
> +  vconn-gpios:
> +    description: GPIOs used to control CC1 and CC2 Vconn
> +
> +  vdd33-supply:
> +    description: Regulator that supplies the CC lines driver
> +
> +  connector:
> +    type: object
> +    $ref: /schemas/connector/usb-connector.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      compatible:
> +        const: usb-c-connector
> +
> +      power-role: true
> +
> +      typec-power-opmode: true
> +
> +    required:
> +      - compatible
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - nvmem-cells
> +  - nvmem-cell-names
> +  - power-domains
> +  - resets
> +  - reset-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +
> +    ucpd: phy@480a0000 {
> +        compatible = "st,stm32mp25-ucpd";
> +        reg = <0x480a0000 0x1000>;
> +        access-controllers = <&rifsc 69>;
> +        clocks = <&rcc CK_BUS_USBTC>, <&rcc CK_KER_USBTC>;
> +        clock-names = "apb", "ker";
> +        interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
> +        nvmem-cells = <&ucpdtrim>;
> +        nvmem-cell-names = "trim";
> +        power-domains = <&cluster_pd>;
> +        resets = <&rcc USBTC_R>;
> +        reset-names = "phy";
> +
> +        vconn-gpios = <&tcpp 0 0>, <&tcpp 1 0>;
> +        vdd33-supply = <&scmi_vdd33ucpd>;
> +
> +        connector {
> +            compatible = "usb-c-connector";
> +            label = "USB-C";
> +            data-role = "dual";
> +            power-role = "source";
> +            self-powered;
> +            vbus-gpios = <&gpioa 10 0>;
> +            vbus-supply = <&reg_usbc_vbus>;
> +
> +            altmodes {
> +                displayport {
> +                    svid = /bits/ 16 <0xff01>;
> +                    vdo = <0xffffffff>;
> +                };
> +            };
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    usbc0_hs_ep: endpoint {
> +                        remote-endpoint = <&usb_drd0_hs_ep>;
> +                    };
> +                };
> +                port@1 {
> +                    reg = <1>;
> +                    usbc0_ss_ep: endpoint {
> +                        remote-endpoint = <&usb_drd0_ss_ep>;
> +                    };
> +                };
> +
> +                port@2 {
> +                    reg = <2>;
> +                    usbc0_sbu_ep: endpoint {
> +                        remote-endpoint = <&usb_sbu_ep>;
> +                    };
> +                };
> +            };
> +        };
> +    };


