Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839C9E83844
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQCVNJ0xhxgMaoaFhTWQILaSB8T+RgQ3cn2tYyBCj7Q=; b=dNo+vuHp1AOelapgg6qW1iBheq
	NrWodOoW2V68VmGPih08KaoS+KaUo/WD87smUN1utiKjxzOLgBWsSw0NXQfbCSQZtEX3VFYid6Q6q
	Z/p9EcxEZz9JuQG3NFN/6oszc6Hg4CpL/gb8DC3wuSs0dem7sNqTvmheiugo2nkBYxvVmz3QlNW13
	l4Onijd5wlCQDwkSzWjqm6AC0QJxm7uI/f8fkz4eeUbdRvaSbuFytUX4C4FsidTMrouHWV7bp7WVY
	mDDEcSaZQx9LxNSfZnsbUXExPuiJlyeD3OYIvaSLfkukm2LGNF9DOTd9o4cTeTve7Q+nMAGeONepF
	gdfWt4hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKvP-00000008Hyl-25bH;
	Tue, 17 Feb 2026 13:15:35 +0000
Received: from mail-southcentralusazon11013008.outbound.protection.outlook.com ([40.93.196.8] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKvM-00000008HxG-0PwF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:15:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFW2fJskMheDB3csPWZUWGmVaMt1rmn/xoZTPLhF4bMcKKwN7T+pmHCCyyBennYRzbuAcjDSleUUM7n101Br9mF0cAvM+/EVTooADHMTiBLYuk3EIgcci3rcHA7+9ZloHm0POW8onHakFtc8ttYaIjebBHK01R151FEskuIAOtsggLnyebD3s9g0W6UNMLQHu9OJmfc3+Q4fk5L+Nn22oTqyN3HAkkYqqqD9G2vtZRc4QGbCAQiCicY4y8RyTEkPKvxwQmly2n/PkL0ns2FfgPBUOCZmL+wrdLTu3UC7zlxSwOfw/y3VPlatyPKE5Z753qIztUkkdXQR7mHhepZ/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQCVNJ0xhxgMaoaFhTWQILaSB8T+RgQ3cn2tYyBCj7Q=;
 b=lXXf/jr6rQefTPcOAI8yeYZniGcHkSBQNzT/hhnErQ+VQ1EyKw97J8n4cpX9lvPyzyb65xFKhbv8s5CX+wv30Q7CBbGRBXSS7jF2m7fhXuVy5b4sdWW0FUd/LuiWp3e4PHNNC6RGHVFhusnBVQZNo+ItB25Hylq4EOWaPRa/qj/mgmr1VuwhFeN2fsGmOXw4peyv5f6TR5L3SeVqv6ewMcaIMRTCOGYSm0D21IeEVwk4Mbp9LkL/MWJHj0Fv9ctoTQjHBhmGZiOPpd4SoTGGtjDgTk9p1KKKUbY+hwO/RkPUGLLotq/mZhmSQnETEyDy2i98HmGc7ze7CP0R5Dr3Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQCVNJ0xhxgMaoaFhTWQILaSB8T+RgQ3cn2tYyBCj7Q=;
 b=g/tv1YyaD5fOUhuq8WJ7UA2SWKqyC0rBynwyBK20SQpXRDfTJ4KsVYAYoChPOOCAuKiO/GAXvz1r6y7kuM4DktmRKximotdOndg1p2Eb+8PQXiwjSbLBsF57URS+5pZEm/4s2QpnNsxMYamsNNTR6BzPEjbGkCML7qFLs+c8u7m3UQcV/IFwlEOBvkllEKlHqBtKSfCzr+7XrO4IdY50zH66UnND+sl4VFgZw4v3VwycIqy9gdsbkyhdrPEThCirqYU7fXMh7p2AxoIR7wVYt4wEt0MuNaRuVALjwr2d+dd2j8zdBNf2X9zISwAvtnQ+eCSTHcshZ8ggI51Qi/Juvw==
Received: from BY5PR17CA0020.namprd17.prod.outlook.com (2603:10b6:a03:1b8::33)
 by CO6PR22MB2916.namprd22.prod.outlook.com (2603:10b6:303:14f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 13:15:21 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::5a) by BY5PR17CA0020.outlook.office365.com
 (2603:10b6:a03:1b8::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 13:15:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 13:15:17 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id C47D0E8F41;
	Tue, 17 Feb 2026 15:15:14 +0200 (EET)
Date: Tue, 17 Feb 2026 15:15:14 +0200
From: Ian Ray <ian.ray@gehealthcare.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ARM: dts: imx: bx50v3: Configure phy-mode
Message-ID: <aZRp4tqggA83BcYT@zeus>
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
 <20260217125952.53997-3-ian.ray@gehealthcare.com>
 <1fe4e13d-cc0f-4168-9c5d-db372433c384@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1fe4e13d-cc0f-4168-9c5d-db372433c384@oss.nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|CO6PR22MB2916:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c3627c7-feff-412d-22b0-08de6e269885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDlCZy9ReXhFNGlRdU10eERsbFN3dWJZMnNpV2FNekpmZFpXR0lvY0w2V0Ra?=
 =?utf-8?B?SkRJaEovWXhOQzBPNnFZelA2YVRmT045VE1Lc3lxYkhMKzhWU1pSb3dEZHpU?=
 =?utf-8?B?TWFod2tydm5aS1VJaW5IcENHZUZicWZyVzEyaVVxREVnR3h5U3Z5dXV0L0Nq?=
 =?utf-8?B?RWVaZWYxK09lVVZocUFPcVdHS3ZPVmVSRmZQSnpKZ2tTMjRzUll2OHp6VVY4?=
 =?utf-8?B?WTkyZnJ4amx0MTdTODVnRlVXVGxnUDB0QmZlWmZidExzNVhvaHNWRGxXQVhZ?=
 =?utf-8?B?U3U5elFEZHV2YW5VU3htWjN5WHRTUmlFb3hRQjJOZUNoQyswai9MVnAyODAw?=
 =?utf-8?B?WjQza29BeXRZY3hhYjNDdnJGdVFXWncyYktoSGRKTVFtKzBQQnVxSUVXWU5R?=
 =?utf-8?B?cEZodmM2dWxvb29JZ0JKM002Z0FINERFSjhwQ1dDeUczQTR0cVBFdVFqaWt4?=
 =?utf-8?B?R3FqckMvMXN0YTdjVGJ5NFYwTy9hakhwSkZid0lub1dJcmQ5d3lOdktyOXo0?=
 =?utf-8?B?S251QzhwT2d5bmJKd213YmpWYVlqYUNxOGJ0UVQwdFp1Ly9EVDlweW9lb2xk?=
 =?utf-8?B?MFh5WlMxK0s5ZGxCOXo1QllDODZpVmlzdkRGYWlJTzRpc3B0dmpoNlJ3MTZW?=
 =?utf-8?B?NG4xZ1d0eWZpTWV6eEJGUk5pdy9wODIzTlNSSVNkVnJsYWQ1Ymw1dGdIZzlm?=
 =?utf-8?B?VFhjclhYV2xnTmNJaEE1VENsTmdxQmFyR0hVcUphOENLcytzVXVQNnJ2Wnpn?=
 =?utf-8?B?K2JMdEcwdjZndTJIYkVhY2ZubHhib1BqelA0Sm9xdUZkRnN6NXJzTjBESC9H?=
 =?utf-8?B?UmdzamlXaTlwU0YrRGMxUnhhcGpubitkT0hUaTgzTlo2SnRxNEQwYUoxcTdm?=
 =?utf-8?B?MlRBckhDa2hEU21mR2U5Wk93WU1qcTFjMWNtVmVtZzNCRXZxNTFXUFNlYnJi?=
 =?utf-8?B?QWtPQlowVnZXdzV6b2NxaU5pN2RJWUx4Ym5EWFl4L2ZzZGdIVWxHRUFDMWtp?=
 =?utf-8?B?bHU0blNSTHI2Ry8yRmlnVHJ0NU80OXp6K1FUbkFnZ01rbWU2cXFQSFZ6MWNv?=
 =?utf-8?B?c0pRam5VeTRPSWM2ckpFRThaU0YvQVZYeHVKZytzTWVDWkNuYjJvc0NlaVp3?=
 =?utf-8?B?YThlN0c2aS9vekkzVnZON1A2Q2ZXeXhTUVN5RmFEVDJoa0RLQUs4MEdobi9m?=
 =?utf-8?B?Qi9RNWNKNjBkNGt6TWxMb1Fzb2ErTHJ3ZHhqeXNLM2M3dXVkT2lUa3gvTEdG?=
 =?utf-8?B?MEovbGwxaGxtcGZreWw1WmVFcDh0dHRJUlovUXM5RHMwVzJteERHdksyOXlF?=
 =?utf-8?B?QWkyM1lwTjJ2VFROZ2JwTDhDaGd0N3Q3RVFvd3FsaFN5VngzL09sS0dlNG9s?=
 =?utf-8?B?enJCRkZJR1Z3SGJxSlFPUm0ydUJRbmd4YkVwcTlBdEtkdURzbmtGZlRJWkY2?=
 =?utf-8?B?NzN3RjRrbVBZMndiTGNPNk9weWJJaUNRTytGaFpQNytYUmx0TG1QVFJpTVBa?=
 =?utf-8?B?TE9QYWNVMVd2dUVCWDZEZUVQcDN3K3lKWWhYaEQwS241VHkwVGpJZUtFZXBl?=
 =?utf-8?B?WkxTenNJVGVJUmNaZ0wwMmpWY2pmMWMxUHRHc1pzZHpFWVRMcVpwUlMvWlho?=
 =?utf-8?B?OVRwYTNmRWl0TnJWSVd4YjBZMmJTNktwSC9meE1QMnp5R0ZFeUZzUFRiK2Mv?=
 =?utf-8?B?bzF6MFdERDRtc21jWlZlcm9yWEY4cVNEV3RCclMvSlYyZDZKSTJicmVxb1Jq?=
 =?utf-8?B?T0FPZmFnbmJJcXNRN2dENXVPNDhsbllVWmhjdUlGZTVKL1FFZUVFM2tUNktT?=
 =?utf-8?B?NTVFRU9aOHV6TUpEaGdHMm9KNjcwZEx4akVwZzlEeVV2SFdCVlZ0blhqYVVC?=
 =?utf-8?B?eW1wNXZ5cmRGUW9mTDZzRHo4Q2RkaWdQU2RpWnpMZCt4SDh2d0ZPOFJZQUdo?=
 =?utf-8?B?ZTg5REZEVEZUdjdVY1dWRWpiMnIrYmtITzkyYkVlaXE4TkdSK0pkY2RTU1Rj?=
 =?utf-8?B?V1NLMVRpL1RPL2lZUjB2QVFlN25ISDNuMVZDMDZ2QUFIbDlQcTlSVVc0UVMv?=
 =?utf-8?B?dmJOT2lLOFZtTkpiSkQ0eDNpb25saWJZWlNsYjQvYWNoQnRZMi9Td0YxR1JQ?=
 =?utf-8?B?V2Q1V0labGZYREJjTVNSQmlPdEVHUmJYaE9uM2xoY1N5UnpuREZjSGpEWlNP?=
 =?utf-8?B?TWVDQU1EVFZVcDJBaHJCZE1yWmZzZ3oxWFNwRjZxOFl5NW9qRGE4elRUTWhy?=
 =?utf-8?B?Y1JiMTI5Y2lIN01zSENTS3RBNy93PT0=?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qbMuzWG834mKMB+M6LHfSbSbo00lbrl9eWmdVfkSdjyMSZ5t+TixnCwoDT8K0Pa3Re/GTsKJKto/i51hrNLm22SqYxOFU1DdJlT7oIgJfI3qEWDZvKVEBnWJqXS11V+7ux+Ow8PY2MmNUd+x03Fc9ZcgZanvAttuiZwHHGeKUhTePe7IPf3bymamw9qRgeejEFVJVKrzP7jFhriUsjoUXNb5DGJxqegSbQB2BB4YK7BJMmMhvLHhjxd6Q3paBTCbSAC9VN7OurRcyffMBbVqBnhQeJ8yfStFEzXZurFMh6IfFcCP/U4MscoGBBZhUXZmbHkay1mUfOGACCqKJdIP8uma/xhJdAS8bvCyFUsqWt3L1YQCeBs5VCJYUzt8I7IBYdOxq4jGDtKb0iwFKSxfwW8QwsKL0FBchCOyO6abL13ym6aZrZ0IV42Eq70b+aun
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:15:17.7733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3627c7-feff-412d-22b0-08de6e269885
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR22MB2916
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_051532_141627_4B656458 
X-CRM114-Status: GOOD (  11.08  )
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

On Tue, Feb 17, 2026 at 03:08:17PM +0200, Daniel Baluta wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
> 
> On 2/17/26 14:59, Ian Ray wrote:
> > Set `phy-mode' on network switch CPU ports to eliminate a warning.
> 
> Can you mention in the commit message what is the warning

Apologies for not being clearer. (Checks notes.) The warning was:

-- >8 --
mv88e6085 gpio-0:00: OF node /mdio-gpio/switch@0/ports/port@4 of CPU port 4 lacks the required "phy-mode" property
-- >8 --

I will prepare a V2.

> 
> and how did you get it?
> 

