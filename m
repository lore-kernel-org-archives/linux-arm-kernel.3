Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE07ED37E33
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 13:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUwHdBIvTLsKsKR8Ly0Gbh+6BpiQRQUlrz49UGLMS3k=; b=M2pmkdTqlntSyBIsHUWQTPfG/a
	O73/BvlFULtcpjrpzl3RT/JFuCQa9HGHbMd/9n2EVW87Zs9qVIeYFOlu6IAj0628q2cVDi32bn5wy
	h1J8MlGPnZWgQ16Jne6zlfVP152NiTnHCnHw938uaXWb/XqBhfhXKesoj7lAbQlMBZjiKgOW/VVHw
	+tGySj3p1PitkE4DcI6xuWlZeAtTNAFdnmQqLGwv047Qw+Br+h0AzYqJq//6siQqmOYvcUoNdohvH
	K32C5rKGQteudIhP5Gj3zi3cGdfT50y/8itSAMGRVM2A4Aok9oM2XHMV4pRT+IuobanXr65uBE4xs
	0jgeJA6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg0qa-00000009JqI-0I5J;
	Wed, 14 Jan 2026 13:23:41 +0000
Received: from mail-westusazon11012068.outbound.protection.outlook.com ([52.101.43.68] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg0q7-00000009JkG-3AsK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 13:23:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnipYssRwRJd7Ju3738XW7zzqzJPUW26T00SihBtwCBpS7CDlfdrQixAxd3Ggn20k0cE7n7BPWX2Aso/iUW4HElbjm75MWt4TqKZIZ5Al0/MTGmNQLmeZb3p8a4a0OGcMC7qqltEhJ/1GShNDsAM54mMLS5tjdPcmE5W4FmzRytcYx8v+xqn7ER8Ix5AWdSKqT+8ECwyQadtwKlW21wO4pGBIGFr8qMUAD74C/9iWFyYMSXGsCAvLRkZM+jF6MqUB21GT82XW1XU7lDLfyq7rBGwVFlX/Ud3JqaEiCt5N++1RGen+k09SLMd7Ukng1cuPbHVvNDXacJSnYzoCJ/MAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUwHdBIvTLsKsKR8Ly0Gbh+6BpiQRQUlrz49UGLMS3k=;
 b=QvlV0bcYoow6V3LUjIUnIoVqAeWHMKUoqHDWbpjyDCDVoZ49O/ksSJB8Vzu91aXuNz6nb/OXw8ccrRG6as66e5IDM7Q0E5pbDtJpKwqcLCSpL1vvV6sL85dgsO1WCMHstO/SKlvldSYIxbD+vfdNSsUmvqeCqZ/ivfXjn1HV8fCdvNGS1QDj1c3ue55GRL6ZLxZVw9AtRQpfy6Wwb6sC1jw33S0bWgnX+uyCokxK9DXfgkijFppPH7RQ8rT3EWO+CH18FC7TR45tkCSsd3iuPx2MZcngk1p9k++c1fw/KB2zEDlgaUKj5Ya0PdlPICu6iJ9q5h+hqciRLl4CY0ToOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUwHdBIvTLsKsKR8Ly0Gbh+6BpiQRQUlrz49UGLMS3k=;
 b=Vl1J4VYvmKlB4I54vqjEU35zcdaAZB1l6jRSQVUXJcMrfKyTi7ivDcfZu2WqDYaCLw8G+FxDDEaM4rnSfvDQlxSJZqxurXGaz6E6U/63VgNS1MbtW1o82EG93t5HfvyU7iUmSmMXH1Y9fvK02koy7px4Sg2DiALMuWvNSsTsiZJ5MnbXyBN9qnU9v3iKrmx4xjCecAV9toHsL047hu/2WQrtNGKNqXFdwjsfm29dM7J33CBl4c0/8bIRg1cJdHn9cJcQXNrO4mAY5QR89DzS7jJNIXji3XZG4idPfrJBddu5J+7aUf414mQ9L9hlLyo27rUWWccyApO5UN4Xr9JUDg==
Received: from SJ0PR05CA0122.namprd05.prod.outlook.com (2603:10b6:a03:33d::7)
 by MN0PR22MB5686.namprd22.prod.outlook.com (2603:10b6:208:4bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 13:23:05 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::6a) by SJ0PR05CA0122.outlook.office365.com
 (2603:10b6:a03:33d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Wed,
 14 Jan 2026 13:23:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 13:23:04 +0000
Received: from [127.0.0.1] (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 899EDE8F21;
	Wed, 14 Jan 2026 15:23:01 +0200 (EET)
Message-ID: <1359781c-a1cc-43ff-88e2-f381e8ab81d2@gehealthcare.com>
Date: Wed, 14 Jan 2026 15:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: fsl-imx: document continue
 in low power mode
To: Krzysztof Kozlowski <krzk@kernel.org>, wim@linux-watchdog.org,
 linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, festevam@gmail.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
 <20260112130849.3748465-2-nandor.han@gehealthcare.com>
 <e66a3dd5-1cf0-4d45-9ed2-55f50faaa0ae@kernel.org>
Content-Language: en-US
From: Nandor Han <nandor.han@gehealthcare.com>
In-Reply-To: <e66a3dd5-1cf0-4d45-9ed2-55f50faaa0ae@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|MN0PR22MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: a978b924-9aaa-4fa2-1d2b-08de53700cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTY4bHpVc25TWm1KZTR3c2pzYUJ5Y1JCQXV5V2dkSG5IODBuR1kweFVldTAw?=
 =?utf-8?B?dFFYVWJ1a3REUTlZd1BNdlA5Q0tMKzBMN3RSODlNcCtBb1BVMERZUm8zWkwv?=
 =?utf-8?B?TDVHclcyQllHekFEVzczbk9RM0Z3a1h1VjB3LzZIc2liMjV5WmkxTjNFNlNa?=
 =?utf-8?B?SGR2OTN2M3Q3Ykg0aitlVjJCb2ZMRXZIOUJHZkdYLzNDRnhObE1GMWc0a0NN?=
 =?utf-8?B?L1czdTFzY01MR0g5NWxERGRxZ3g1WUJqakx5bDh1dWtac1ZlUDM2dUFZOUdk?=
 =?utf-8?B?OFNsN2RuK3ZCNVNxWG1zS2E3ZGNWajluWk9JdmpSN2NMcjdld2ZUeXRUVVlx?=
 =?utf-8?B?bUxWREZabVl2WXpVNXQ2S21OdCtKSHZ1UTFGM0RheGpsNFEzYUEyZ1RoK2ox?=
 =?utf-8?B?cW5iNEhRa3duUThIOXJ2bzJZL21pWlVJWVJyUWRnVWFXTkZJdVdpZDNSdXps?=
 =?utf-8?B?SnhkRCtOcmtJa1dCT2Q3aUNvblhWajJmRGFNanZoR1haT2dIcWN4emRDWERU?=
 =?utf-8?B?RW5JNzZNTlI4YzR4MWV2c09idTQwNG1XTEE2TU1OWlNJVXp0Y2JRTjgyRU9w?=
 =?utf-8?B?UndtaSs2NmttUXVtVU9hZ3VHNS81UjVrOWQ0RGdTU0UwSENYQUJVVGFPdW9r?=
 =?utf-8?B?T3ptSUEwcE8zOWlFWTVTOFRUUnBIb2k1ZjVILzROSW5kQitYRnBoVFoweVZm?=
 =?utf-8?B?ZWdLWm5SVmhsckZuYXNSY09aOTJNNkRqSTFTUmtMWHhCcnZaVFg5RHJmUHlT?=
 =?utf-8?B?MWRmMVNvams4SjBVTmdWWElxUmo3L0Z1aDliaXB1QmFFckpXMW93Z0plZk9M?=
 =?utf-8?B?anYycEtkYW9pY25uc2NCTDNucmFMZDNBQjBQWkg4UDJheWplT2xkOWs2T0ZK?=
 =?utf-8?B?UFZKc3V1TzJ3UEZYYUQ0VENDNnBVVEIzdEVIZnJtci9vREdzWFBielFwR1g5?=
 =?utf-8?B?aS9rL2lDRi84bCtaalNTSWZ1WXVwVzlPY3ZRRTNqSjY5N3pJWm13d3lhNWZF?=
 =?utf-8?B?ZzQrU0kxMkJTekdkdWhXNEp5SlBWSjZac3VGbHd3SGdxREMyVEtKT1BvNmRS?=
 =?utf-8?B?REY4Ty93VVVRYlh6bXFzREZiMDE2U1U2M3hUSXRSKzdHK25PZnYwTXYwQ3Fm?=
 =?utf-8?B?MTZ3amtVZmZxOFVwMjBWVkRodk5kYng2bHVNdnVRUFNRYnZGL3FueFVUTVBK?=
 =?utf-8?B?eHN5bTFSSGhaSzc0UlEwMWpXYkNEME15bDBxMlIyb1Z0MUZMU25CckNYVEg2?=
 =?utf-8?B?WDBPYk1kNm8zdXlSaHZJWkVPOE9HTmV1QW1pdVAzNEIzR0lFTGtiWm9wWkVy?=
 =?utf-8?B?SVJsdmFETE5EcEh4N3JKNDRGSmx5OTB6djVGWjZBd2ErdDlpdWU0aFVZUDFK?=
 =?utf-8?B?ZUl6Q0F3QlE4YWdnelV1M3dNWW8rQXE5WWordk41NkI0YkZpc0JGWDN3bEVF?=
 =?utf-8?B?UHprQy9TZWs4enJWYWZaOFByQXJEcFowUXhJTWJROHMyUXZreEFQbHJoTjNY?=
 =?utf-8?B?ZGRidmRuUVovcCtoZ2ozOC9FTEZTQ0IzVldKa0FLOWVJaHhFRy8vdEZqYTV5?=
 =?utf-8?B?WWpCSHpRdHBvblp0cHlWTms2ZVpxMGV4dDFvbG1ybjhock9tYmdHTTJGVmk4?=
 =?utf-8?B?SDVBVDQ2b2xLb3hjbGpicFBUdGFOOWJIb0dGZ1ZsWEpEdkEyakhSZG9UeTBt?=
 =?utf-8?B?dWlYN2VydkMyYm9BWkFKN1RYeGh3Y2d0OGhLY0dLRXdqOHo3Tkp4cStHUmtt?=
 =?utf-8?B?UXVuNG1YQXVORmJUYno3eFBHbU1wa0JjQkQ2Y2thMlNLbTljaW5uWDEzZmt0?=
 =?utf-8?B?QWM0RXBEblRWRzQyQWdsemlPbkxxS0ZMMVVQWFVOdU9EWENTQ0oyZ1FBcWM2?=
 =?utf-8?B?TlpqU3V3a3hPdzluR09NNDNocHRxOXZVbFplZWw1WnZldG4vM3pvVzZwaHNH?=
 =?utf-8?B?MnZsWUtsSWNyY2FMZnpZbm4zZTVZMlA4Z29mdEpsa25uQXhCSHlVc3lyYytK?=
 =?utf-8?B?MEJkNk8rQXh3TTVjNGkvdHg3b25sRXhUK3huTjgrdU1XbzkybkFXVFEvREs0?=
 =?utf-8?B?eEFOTktWbHBBNWRRMHQ5Vlk0bTR5VzJKa1IvS01Tek5GWW1IQjEyZFB0a2dR?=
 =?utf-8?B?OWt3ekpZdHVlU1ZRai81dW4rRTVkT1lNQjhHWmxBYTVBSEhUTHErZ2hpSHBq?=
 =?utf-8?B?QnFWY2pTdkt1R0RJMHlBZ1l2R2JlTWh4dC9yaEZ0KzVFYU9SOVYyRk1LNFJa?=
 =?utf-8?B?ZklVSHQxcUVGRGp3d2tqcTVFczNBPT0=?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 13:23:04.9443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a978b924-9aaa-4fa2-1d2b-08de53700cf0
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR22MB5686
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_052311_830254_77C75DE5 
X-CRM114-Status: GOOD (  17.07  )
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


On 1/12/26 15:55, Krzysztof Kozlowski wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>
> On 12/01/2026 14:08, Nandor Han wrote:
>> Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
>> running in low power modes (STOP and DOZE). By default, the watchdog is
>> suspended in these modes. This property provides the option to keep the
>> watchdog active during low power states when needed.
>>
>> Signed-off-by: Nandor Han <nandor.han@gehealthcare.com>
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830

Apologies, will not do that on the next version.


<snip>

>> +  fsl,wdt-continue-in-low-power:
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +    description: |
> Do not need '|' unless you need to preserve formatting.

Thanks, will update.

>> +      If present, the watchdog device continues to run in low power modes
>> +      (STOP and DOZE).
> Not much improved. My questions how this petting is suppose to work
> remain unanswered.
>
> Again, system load is really not relevant whether watchdog works or not
> in low power mode.

Our use case is that we do not allow the CPU (i.MX7) to enter low-power modes.

To enforce this, we explicitly enable the watchdog during low-power states so that if the system enters such a mode for any reason, the watchdog will reset the CPU.
Since in STOP and DOZE modes the CPU is halted and systemd can no longer service the watchdog, the watchdog will eventually trigger a reset.

Regards,
Nandor


