Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E70C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 20:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLh4limW5803sh0kjrys/WA3oUN3B8C8TasX9yD7HWE=; b=JvMU1Q2YMUeoiJTWx1tWhpBaF6
	fY+b+lwfjwzs5SlVDSmXCc2dJ9+mJi2oxOxtIsAih/XVff+rwNFcO+Mco6YdT2uRNVkzuVd4OUH1n
	kW24jmrBHVhISJI7JPJMJ4fTFYKu+kypGxpdDphdd/02oUFKUTv7a7H/7FhdoICmEEHk/M1iAK11I
	HgIb+ZHDywq5gdTDWOVhJzduHuHFJ9LgDLfd8eAnJeHjqB4mU5ytXikDJVDuHxCYv43FfHOqDyApB
	FXhv1w7p/Liqrjl1EN+Fad6AofCQ8RB5iUzdaxid6TQcs/CN3zIt8e/w0alSI8jBH3k5v3MQsqS4w
	cObI6j0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weJ4q-0000000FTbU-3w8m;
	Mon, 29 Jun 2026 20:59:36 +0000
Received: from mail-northeuropeazon11012062.outbound.protection.outlook.com ([52.101.66.62] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weJ4p-0000000FTau-0xZd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 20:59:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJJ1jemULKxYaBtYKAsocUGUbktOB4wxKtwQ2ofZWqoC83Q0RE4iPlAlYJmsC4GuDzmpJ2/+l84VcxZizA7tfIS2sYkzFp/ZFclUFU4DbilqDSP5Pj632/omtIuu76hhl5doaphkcr25ImgD8xWSBFjMD2Hn1Eyi21o8411vZSL77zHRqQNnYg+gcp4A3OFPmvzcPMFiB8JqLlL1xwgme/lIMABu4AGWm/jTfDwq8VxMlpvwCb9/Cpx9Imucv32HAUTn890KT/qDYqjq5BFMeCp+MCU4Fb/5yfumWTsXc1xZ05SLcQ9dk1xxV3wc+FBsSnZBH/ZMwz84lhqzvgtSvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLh4limW5803sh0kjrys/WA3oUN3B8C8TasX9yD7HWE=;
 b=sudjPn8BuCxWxMUD/XhwlEkglnykHHC3mLVWwlShhSz5v1TY/zY0PTw2xSRtuyrN+8bL8yDu7AeNb6M6X9zXVuoItytD+tk8Qdk0saQTqcOg8Q1CQNA8R6T3mcmdY6a/Y97Xxg6Q+2WTxwbwaR8Dtflj72Wja9FtK66v5QXhy/Px+Lhdi4t+A8Lp96l8jo/twLkpNft2tQmVtk0W4sw98vlwpvwvLIsQMeMLfsBgX3AyQqAMNJ9u+XySvQ/O1rSRA/+UAMTKmkbhYQG9ge1sMZkvFbidyxpKfi4fVUT1mndAAtltooSOfinkoFKk28+tW2Dz2PVUSkJOCxr4vA4u+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLh4limW5803sh0kjrys/WA3oUN3B8C8TasX9yD7HWE=;
 b=lbNA+Ov7o+Rr6ZngowbzCN0cT/yFJaeHVkWO2fPCB99dATZpXG6KpOkh2mbdeALVkIvzBZKvAT7vzapobWVHGoeBMb2td/XcUNzNyzZBAwRQn+pAEQyBI+27ASl0doNECnl5SkXi7uGDkZTbS2oZtDOyf08GoUPCAIZGOONYuRVoaKC+7lsmqBfgZ+vCsxAeHQNctsjOAnANeL7hkkCkofgeSbX0r4KeoVJ2qdqbvHM6+/vmeoDY8jpsE+OgRMuVsmjvLX5t6Mu6Gs8HC8/oGAVwYoLaLDYVKlkSaLS3S9TPEVfytc7qqJD0rF5dME6DRGLamN0hpzam+sZs4NF2ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10595.eurprd04.prod.outlook.com (2603:10a6:800:273::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 20:59:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 20:59:28 +0000
Date: Mon, 29 Jun 2026 16:59:19 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v11 2/3] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Message-ID: <akLcp8coyZUsIR8I@lizhi-Precision-Tower-5810>
References: <20260623-csi_formatter-v11-0-a792fe9c1502@oss.nxp.com>
 <20260623-csi_formatter-v11-2-a792fe9c1502@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-csi_formatter-v11-2-a792fe9c1502@oss.nxp.com>
X-ClientProxiedBy: SA9PR13CA0130.namprd13.prod.outlook.com
 (2603:10b6:806:27::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10595:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c27dbf4-34e9-454a-2149-08ded6214eef
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19092799006|23010399003|18002099003|22082099003|3023799007|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: xHWVonMj3zE9KwvW2bnwtpTJyJKssoMPjyObrfc9JvG4+O7LxEi0JTz3HIpj3pe4AMulW2lpAXQVP9WTlpsEdFXZr/6fQgSdnF3O8rJMRDnymgihbdtN4Kr1GngSECW5i90FPtmW4POTkuLMFcUjZQuODaBTYMtBdMwYeXC83vZWaqg9hXszctMXahaU8V/4hIBX6cRoeFcnpN+INBHIJFAVCdoJgbOhPOOvSrtUZjGp05Y1CbijDPVs/Okz6qq4Ea+dhQlGWuvJM7vevb+NowiacZB0+/4mrfELpS/XxBfCGW7wELh9qWVfXlpG6N1XkqADXkcmJhHpxuiPXSUm2r4pf361+Y27zu0Vt2OXLUS9trq3kJirkhOoCbSiUxJYRjZMxkpee9zZes6bqi595rAftJ70QT8PZly7sgNDL2+Lsx2x2PbuDLQC0L+V7Hx9KrtkLgU7avF/3jHDqsS2Rkan/bXvz423lg/9hjdlxr1jSS1rTSGADyUOrVTD2RtePE0AlXYWpc3Y+piLPXcJZDQR+kkNbqV87+dfbBO5COohMu9D5/3E7MosHu0dVeD8K1wRagdCZejKi9zVj9oX8rkyj+uEEyKVmFu+fqRMPkB8KLwWqrfa0DRApClUdA7A8o7sdAvin7BGpduL0fCSdR36G2Hc3scIpvx97cYUbK0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(23010399003)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g5ZGMqqi2RXbxOVWhxi4HPuF5z3FKQ+ZeBz+FXeCMgzQkDggCXoGD1/EHcGt?=
 =?us-ascii?Q?CcQM81fCRK2Pg1tcii5cxvM66uoUo4AkdJ4GNpbHwsFMCcS8jtGB5OAswjQ8?=
 =?us-ascii?Q?IE6yAo4tE4rpLk0FPJ4yS6VNgXhEJc9kjST6Y+LBU1LR9TPrrULQ4N05PL3O?=
 =?us-ascii?Q?J8j4zPjrNqNgH3y5VtP/yWDu26Q0vilef8nCcQy4q7yU9T6kkmFA1yduEs2t?=
 =?us-ascii?Q?CkYAfGoIECQIRZbWGtB6O6qwJEYfcnY6nUZZMhqxZVU6SCFu/iCrl7D+DOgd?=
 =?us-ascii?Q?Op0dY+pjzZLF0lp5K+lFBU/HUhvk4P58psyZoYo+LUPlpZCVWbwL8F8D7l22?=
 =?us-ascii?Q?VnUh+77Mc0Q4Hro8J6oDg721FBqTkmX9raFEGO3Rtw7/cLqYs3u6gnne8aRp?=
 =?us-ascii?Q?oSRJZeCrfHmN9KqoP5U14ZrOCC5mw6fuu4tmFXlPm9dZtjb1UDGLMoDRQHo/?=
 =?us-ascii?Q?0xjqWekxiLrWlVNk6PqKt8NWoKV64UwIRJdnU2LtaBpWp1gFUbi6Fg0QCfhT?=
 =?us-ascii?Q?zhJj/lL4+QEe160H0dN81kOW0Et1TlbqvD7lGYAP7q92t45kCT5IQKRqEvjz?=
 =?us-ascii?Q?DqP3R9CN0sPFaCNvs0dITjw1Uc0uq7jam1SzBq109Dg3LkdNaYaKpgBOiaMu?=
 =?us-ascii?Q?IngewZBPb+jMXOLH4C6wJ6CWP4edufqInM2JsNS9DF//g+/3OSq4RsFReGRK?=
 =?us-ascii?Q?tOVKKppPdI2saV7jCnZywpJQf/PD0248zY4JNxeNluMI6xcBtcLVD8Mn8hZz?=
 =?us-ascii?Q?Iw/MFUiTpkqXBNa1zkCAgh1/Fa2dAn9uW0w6F1Xw5Q5+yB2Qoa3gsZLM4Q8N?=
 =?us-ascii?Q?uN+LTk08zbunWtQ8HRWB3Qb2zRXHUSeEQv7xORwwjAY6O90LP+vFsJXVD4qG?=
 =?us-ascii?Q?dy3DKtMuXQ3P9HXDaoVLnStwd/pzDcgu9C2nL4CqAxmTMeVH+0ZBGTazeyIX?=
 =?us-ascii?Q?5AhliJBpZvc2IzZ/yZ2VMla8BjHyUAGkiDu4h22grNGoELAnGuFKCRD9ntcc?=
 =?us-ascii?Q?Mru5zZuecr/2VdJ3cHDNvhTfeSfNg0OcLrDGRm391penlA41MNL6XRIIiITS?=
 =?us-ascii?Q?j3AKFGSzhwZsIZefkrU02GlGbTZkI/SoN50utJ5wibN9aG0RZa8MovojLmxL?=
 =?us-ascii?Q?2RuF9J8nuQuefmLZxhRmaoZQzMn94yg9q5D5zsEwsRX4tVR7Z4Bbur3PauCd?=
 =?us-ascii?Q?N116pzlSVSBbIJ6R06ekrdGeH/QggUbUylPZv8l0qGpqimqtYHgcQW5Ig6+I?=
 =?us-ascii?Q?gpP17PmKnhdNyAr9VeoGUvVFlaBbwI46rQvjZzBxHhdbmrTDtcnk5cFJWOJm?=
 =?us-ascii?Q?QlJ+fr8G+PPpUgs63z7W+zPzqJ+BQGTt6qcC6IupcswO9mouDT+Zat4JEF14?=
 =?us-ascii?Q?XHTVn2aSSE9BPxuouJ2VGbLpTTBcPB7EFUE0u4KkSm3M0vrYlvHL7SghIn56?=
 =?us-ascii?Q?/1L7KcUDkVaTvSpqhh4E2ENLjfgIoKYf6znlzi8HYcnSRjzWuwmk/J9FdT8e?=
 =?us-ascii?Q?zpOYfL+LwsbzH1FtghXWE3QQdTfmieftJTlDDHhhOz7IJoOiHQoIUCfTYzIo?=
 =?us-ascii?Q?w6Hy5iw2R+V6bHOcTthnF0J+0kaca8MRplT2XXg1LVzI/ZE0TsSh+CWZVUbl?=
 =?us-ascii?Q?o7CW7ENDBwwkAzWES5Qk68NWGlOV0e2z5g/QX37owzSSuhMZxJ9/aq/Wk944?=
 =?us-ascii?Q?EmsEge/jq7bM5JO0C6VOLJs7ahCRvo9iZN3KrsXQo1uvSsxuq3jfTJW9vZfT?=
 =?us-ascii?Q?WPEbb083xDGm65TU4Oz4x5Arpyd8UHhC1ww6wvZ4vASNrklyHuQm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c27dbf4-34e9-454a-2149-08ded6214eef
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 20:59:28.1428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: myhbvl4CtPLGNGKiiFiKo3+WVBUEkCnahDOeaUoUUOR1ebqn3eZWDvz5LAKIE8RtJIrCCBqAeCXKVqhK75mPYtMBSV24iyvix+qJWmzJkhccpaWvRMUew6Qw8nU6Zu46
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10595
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_135935_273735_D5304609 
X-CRM114-Status: GOOD (  19.68  )
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

On Tue, Jun 23, 2026 at 11:56:32AM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The Camera CSR contains control registers for multiple CSI formatter IPs
> at different register offsets. Each formatter is an independent hardware
> block with its own clock input and media pipeline connection.
>
> Define schema to allow formatter child nodes under nxp,imx95-camera-csr,
> with 'reg' property specifying the formatter's register offset within the
> CSR address space.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v11:
> - Move properties to top-level and use if:then:else (Krzysztof/Frank)
>
> Changes in v10:
> - Use single quotes for regex pattern to be consistent (Krzysztof Kozlowski)
> - Add formatter subnode binding and camera-csr syscon example
> - Update commit title and message
>
> Changes in v9:
> - New patch to address the issue of formatter acting as a child node of syscon
> ---
>  .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 27403b4c52d6..fbbf1b3f1790 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -39,6 +39,18 @@ properties:
>        ID in its "clocks" phandle cell. See
>        include/dt-bindings/clock/nxp,imx95-clock.h
>
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +patternProperties:
> +  '^formatter@[0-9a-f]+$':
> +    type: object
> +    $ref: /schemas/media/fsl,imx95-csi-formatter.yaml#
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> @@ -46,6 +58,23 @@ required:
>    - power-domains
>    - clocks
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nxp,imx95-camera-csr
> +    then:
> +      required:
> +        - '#address-cells'
> +        - '#size-cells'
> +    else:
> +      properties:
> +        '#address-cells': false
> +        '#size-cells': false
> +      patternProperties:
> +        '^formatter@[0-9a-f]+$': false
> +
>  additionalProperties: false
>
>  examples:
> @@ -57,4 +86,46 @@ examples:
>        clocks = <&scmi_clk 114>;
>        power-domains = <&scmi_devpd 21>;
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    syscon@4ac10000 {
> +      compatible = "nxp,imx95-camera-csr", "syscon";
> +      reg = <0x4ac10000 0x10000>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      #clock-cells = <1>;
> +      clocks = <&scmi_clk 62>;
> +      power-domains = <&scmi_devpd 3>;
> +
> +      formatter@20 {
> +        compatible = "fsl,imx95-csi-formatter";
> +        reg = <0x20 0x100>;
> +        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> +        power-domains = <&scmi_devpd 3>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            endpoint {
> +              remote-endpoint = <&mipi_csi_0_out>;
> +            };
> +
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +
> +            endpoint {
> +              remote-endpoint = <&isi_in_2>;
> +            };
> +          };
> +        };
> +      };
> +    };
>  ...
>
> --
> 2.34.1
>

