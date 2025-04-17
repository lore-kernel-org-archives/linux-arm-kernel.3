Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8C9C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 08:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0+3axhg6wpwFtwVrZK4tPqjbKFcgPMltM/8+QVmRwk=; b=PlWiX1v4dSVz4CimP+Jb7xXQjW
	gfWDUUUzJ7xvHhJ/vNB+jE3keRzW3lwmCWmw0LTqK/6ff9auU62tjV8hvuMGxvk7E6b+vlbMuWFZv
	gsqFc5f4c/BI1unWiNhNph+ALnHp2vjHbynCcoJWWrAarAErjaRic+aj2amrThW4gvvo88II+DvUX
	k1FddeFHN6DG3vEl6/uX9vs+AikSHUj2rODCJPYkDgEXv7ESKjJCKul52w5516lQM9SPEkviJg1JD
	zCPpDsipfFu/L5Gezvn3kPd+QsxGA3woPD1pnqB7U2cC20gjU5qAGS7nKms68PWZ8lRWr8X35UHRz
	QU9CEfZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KaE-0000000CGvc-1wkc;
	Thu, 17 Apr 2025 08:26:54 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KYN-0000000CGgH-2eNc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 08:25:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHsq+OKE1svzvzcFlg7+yovHYlUbImDCHGyMhvLFpgDzNoZq00w0uSCg5MSeP2fzWvXvfpbjjpfZxruktDzf7wbwHpZlMPVUajAL+Oc0qXZ3FO8CtIfQVk+FK67VouHv8IohXNLkGZ9mv4cFuOryg5n+cRIdQtD8vU+/TwL8Q4J3jsYvk4JQn8nHsYWJ9CN8MMJUwmrIJZa9U6gVcfq1KM89us/j5qa54rPx5RSk6A+xAb8Gb/HvIlr2JZITtXvNAhRtQrxivGfqxbWesdSFi/uAV6+fA8SQk0E51DhdxTKes859CGM9ZX/Fv4+h4OvWIEroQAxHCIMN5MXD/HVPtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0+3axhg6wpwFtwVrZK4tPqjbKFcgPMltM/8+QVmRwk=;
 b=kSbIBdJou/fHppeBHfV1FIEAJvqLLxr+znt2Ku3+OOyGg+6psf+230RpEihvhjx9exf8Wf9MQU/gHXhLIvPcbZdVi3iOY1dKBEN7zKBipPhmo+kjFTPtS4w/z7ih/CY0Ar4OYD3coOmBMjTSQZ6UhGtTJemDKunGjk2dJ4SnPiAXdaHYl0J9rK5aHpitrsSz4Wu/Jz1aWs0LdbIC3Dx/8NDjtrGMV3mdgLXd8JBzfIfGBcUlJgyZvXi52s2PeXuNcy6aszWrXEf68xVQ/2N8ziH+P9UWcgCVYvJb/1uuuhPn5hnXPzZ1HIc5vtjeNu1m0+wvMtYtTnUDaWgPvhp7kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SL2P216CA0205.KORP216.PROD.OUTLOOK.COM (2603:1096:101:19::15)
 by TYSPR06MB7297.apcprd06.prod.outlook.com (2603:1096:405:96::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 08:24:11 +0000
Received: from HK3PEPF0000021A.apcprd03.prod.outlook.com
 (2603:1096:101:19:cafe::7d) by SL2P216CA0205.outlook.office365.com
 (2603:1096:101:19::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Thu,
 17 Apr 2025 08:24:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF0000021A.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 08:24:10 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 206804160CA0;
	Thu, 17 Apr 2025 16:24:09 +0800 (CST)
Date: Thu, 17 Apr 2025 16:24:08 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, jassisinghbrar@gmail.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	maz@kernel.org, kajetan.puchalski@arm.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v6 09/10] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
Message-ID: <aAC6qM1LnNZnHrCI@nchen-desktop>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
 <20250415072724.3565533-10-peter.chen@cixtech.com>
 <74b9fc25-0815-4ece-845a-5f730c87fe78@kernel.org>
 <aAChkWPn4ThMx44A@nchen-desktop>
 <b90c05e9-feb7-4569-b79a-b623e535c1d0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b90c05e9-feb7-4569-b79a-b623e535c1d0@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021A:EE_|TYSPR06MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fd984ca-5243-4fd4-7cd3-08dd7d893aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W/nS0gD6qWTNMcUx34FXSjpsO5mvTDHwbcdstuqs+Wd0QQv/du9hztrueHWW?=
 =?us-ascii?Q?NpxpYkyyGHmqZltmMYTDDa4uxR8twlMUiyuCQ/KC/aIM0BAPmrWC9DhkzED1?=
 =?us-ascii?Q?ceTpyemU3wZ+PttaBOOwzs1ekZjkt6pSJOr4FMi61WvKbdhOPJ5IRswTAlCC?=
 =?us-ascii?Q?vB2xWBuIFx+aefDfQ3BYHFqbgnAP7t4wfGXzz3UciKdyNS37S08GM7Xnp4tI?=
 =?us-ascii?Q?T4H1tba/c/YTt/ugWm+NqNsqo8pr6zP6eItjjTmIGhGi4xdmfPY3eqEM6PcU?=
 =?us-ascii?Q?HaG+JbsRcXW/N1Q86tGfWM2URfVFTvF543+c1cdxjmeXqgWdHnwA/vZwj6N+?=
 =?us-ascii?Q?hFjqYefd59XORKmTUf0+LFGU3qsIDoslqoy/u9bpWpdnJNBor4FV4K8DJbDC?=
 =?us-ascii?Q?CuE4lFpsb0WiJNwOuB13cfzIF35BmV+WE0wb7JzbHIgRDQqlYgc+nQ2vq6X3?=
 =?us-ascii?Q?puNDgZ2dUBosU8+qijdXY6q1r+N8LLU7Xs16nk2Odh3an1MdyFS1ojawP7Ce?=
 =?us-ascii?Q?NvFY8yWJkP8cikqrwqZS+QVxlJk4ic0OqT0u7nd1deT0RWUXgFAzTmpJhgkX?=
 =?us-ascii?Q?27I+Pa2om6zLyyZgx8IGkaqBL8oB4Ua5uPXXtqCTawHeSXJ7lCR2PYzFVQdm?=
 =?us-ascii?Q?ZuX2ZRCA/SPU3MZ39RIa5aw/4rWWbTm5lVMAKAFwwVT2C9vnRivtqtUbvPX9?=
 =?us-ascii?Q?nLFO/hRtOSyI3f2dJ5z1W9q5ei+l5zOMDz3G36ora4kTQQy1spyq2jQaVXk7?=
 =?us-ascii?Q?PTFPvSr8sHTlVD+VqLkOUj2Unj6hEiH5IVIpxAizg4jTIQV/IHRx+tTsucyP?=
 =?us-ascii?Q?VrWcltg7NYMqrUBC5WkjLV3NtroWddpLG16LPXEAg5IFQ88AREnobeZvj4Lq?=
 =?us-ascii?Q?2hup36Ctz1+St0Jmlzdgu3qcBdri6q1b0jN2LDkaucBhQL88AtH66zYuAl3k?=
 =?us-ascii?Q?QA7GUaXzjlVes2jchk9f9dn8Ns3MymaXgQC7NcZADTcNOpwo+MItpJBbLfpz?=
 =?us-ascii?Q?XU/iJ/AkEPVW43hTc347ttotWK4r4FTSniZ2JJpWLWqF1g+GIEEJqkjJydOz?=
 =?us-ascii?Q?zbYQ2YnwqkQ9sdaDy/jabvYmyEYxAJxqYk42bcWmIMsHYKJGebzfoxFUaLvU?=
 =?us-ascii?Q?slfZJd0fHpCnxKaa9znEpOshc8nErJRmi6KVpii2Z9h7ds0+hrUU0So3dqn7?=
 =?us-ascii?Q?ZXoOSJHVgTdnnYKmjWEsCVgmQspKGEmF07V55Ix+/aki/PlAP9n/WGAnZwGY?=
 =?us-ascii?Q?NhpjFKyYW0nEXHIDjiyfwhsWwebEW8JeDGAzbuVa7GNdALd+RNqFC/Y4QQac?=
 =?us-ascii?Q?b1wcfTRN8NHIiJGh/uZofUqlbDr15xY6SUJg3kwEJUckGGaY2p5t7/Cj0w0w?=
 =?us-ascii?Q?YS73eK+cFnhU6DAibAG5MgsmV15hwDDJDuN9+0H/nPwRAP94V7EJatw/fAtW?=
 =?us-ascii?Q?y/KsVl9ExxpYfv1Ue3yvjZ2oJ7u4aJKUJ0z0zg59sXSB7kqWWD8l50R1mVdz?=
 =?us-ascii?Q?GsNZcBWy4LiMzUkpnFouIFP2SwLfDJNABx9m?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 08:24:10.0462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd984ca-5243-4fd4-7cd3-08dd7d893aa7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7297
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_012459_668315_EDBE56CA 
X-CRM114-Status: GOOD (  14.41  )
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

> >>
> >> On 15/04/2025 09:27, Peter Chen wrote:
> >>> +
> >>> +             mbox_ap2pm: mailbox@6590080 {
> >>> +                     compatible = "cix,sky1-mbox";
> >>> +                     reg = <0x0 0x06590080 0x0 0xff80>;
> >>> +                     interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>;
> >>> +                     #mbox-cells = <1>;
> >>> +                     cix,mbox-dir = "tx";
> >>> +             };
> >>> +
> >>> +             pm2ap_scmi_mem: pm2ap-shmem@65a0000 {
> >>> +                     compatible = "arm,scmi-shmem";
> >>> +                     #address-cells = <2>;
> >>> +                     #size-cells = <2>;
> >>> +                     reg-io-width = <4>;
> >>> +                     reg = <0x0 0x065a0000 0x0 0x80>;
> >>
> >> Messed order of properties. Keep it consistent (see DTS conding style).
> >> Other nodes also have oddly placed reg.
> >
> > Thanks for your reviewing, Krzysztof.
> >
> > All the nodes mailbox and shmem (in mailbox) are on the same bus, so
> > I keep it by unit address in ascending order like DTS coding sytle
> > says. I think below rules are two options, isn't it?
> 
> You speak about nodes I wrote about properties. I don't understand how
> your question is relevant to my comment.
> 
> 

Sorry, we will update the sequence of properties in node.

-- 

Best regards,
Peter

