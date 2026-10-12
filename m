Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575D6CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 18:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvdITlXxXRs9+bE1z27dUqm2hDNvQ4h8RL3okI6zm0k=; b=zUackAPRs6g98SVj97KY6Tdern
	HftP0NQBv0OJk2ZM4IRIWFOijvHJbWM/11GqIllAoq+GXTjh3AY6cmoaBikh4KoKPW5WD/wl8YQAB
	DIKrN5WzDid0Wa5wyNGtMbWY29hk4pCLtS+7QmEgQLRfeD+VtPrKpC3ge2RrasVfuFg/g9Qw3Ztle
	XdmRDH4P7s7prbLonBuvB8LPpg6RKcXwNR6JEE2mIdqEd6ybudTSLAQXAY02vQlFQ2vxjhyMQXgTE
	NTS1pjsYzB+xaU8csYv30FTczrwrzKfPRyDo5ZN/LlF/nGAgL0OojMQ/tGOidlku8+gfmESUF2T+m
	/i9kr2yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGL0A-0000000BH4P-3lnf;
	Mon, 12 Oct 2026 18:43:58 +0000
Received: from mail-southcentralusazon11012016.outbound.protection.outlook.com ([40.93.195.16] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGL05-0000000BH2X-3O5z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 18:43:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrgV7xdQ1c9P7ZzYSvudENuWrgQvt9pZs0yBmt3TB9oFPkkllRnKrHbVaAQ9o7iJrK5htPt8SdayuQOGGsrjY6gqRbIFU2i5GcMbSk+COnzm+4fdquYdCb3Nf9n8684y4XIJ3VMJx2VmF8ptgoiQRQRSnqw+Aq+bP0rQ+z46TIqW9R7cUZ5UtnJF648LslXGXmo7VTbqzCn1g+tQa/i2FIgX/gZA1en0KiRqtiowySFKXdMwxYWXI+R0pCWXz48+MFe/Q7jxULXmusk+XzjjyHikL64Om/+X5YedF7DomW4BqBJIIg08Ev1fN3rZqRHkpNay03HvtyTjAawPTJFRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvdITlXxXRs9+bE1z27dUqm2hDNvQ4h8RL3okI6zm0k=;
 b=QZ73VwpH0IsLcJ2G8KfBakGDcjrtdmN/PfmYJRkNIENN9PJIA5tYf/ja02AhlYGYxnLVnVk8FC9WPzqZ2B8eGXhJXAzou4dOfX7S8N4hJE5r7GVtdI512mG5iTT6FxO/TopJpXOPDAUnHmX3LTcoZ7jWtS/Y6kR16Bxd/7xmlKxgPdzaOP0pjl+NjJnh9K8jDMqFTsO/mIUda246Fo41cM69B4QCz3wBRbbJWozMCVFKUYaIsqLwtaNAKLMpxW0gyrsGMy9VVinz58n5YjJl3igARB80t8oV0AhTV+CwqejyvXiyGtPneHrCQl1qPilgWxgfVtRJbCIGNwxA3kwGcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvdITlXxXRs9+bE1z27dUqm2hDNvQ4h8RL3okI6zm0k=;
 b=NauwYn5bgz0HUZ+qqQKjlO355S7DBVkUUgP+pukr75y8SRkOW18yZ/oNrBsPK26/TN3daGj12tANJCHrOr0DulSrcKu82MZ9seUq5vb9aFb/EgN3zLfFoo9BUKlf5BkRi6D6WqJZ3Jf9frLJc0Ql3UWM/88B3Icj+J6l6iElh2nUhLftqrOLfrZAQ8ZSNVuNLXaQBeVlPCcIsHpawuN5EjwbJFnJ0gT3DtRIQlWKP+sWv0zsv/fJHmiKkLy5pBmfDrcYq3qJoHLRzj3MeC9pqvAqE4sYj7InjECHYW8ngAMdDuzGXbHCV34YBh/su1aFRdDK8oeaNHaBkuk7zfbVJA==
Received: from DS7PR05CA0062.namprd05.prod.outlook.com (2603:10b6:8:57::8) by
 SJ2PR12MB9239.namprd12.prod.outlook.com (2603:10b6:a03:55e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.20; Mon, 12 Oct 2026 18:43:38 +0000
Received: from DS8PEPF000000E1.namprd05.prod.outlook.com
 (2603:10b6:8:57:cafe::a3) by DS7PR05CA0062.outlook.office365.com
 (2603:10b6:8:57::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Mon, 12
 Oct 2026 18:43:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS8PEPF000000E1.mail.protection.outlook.com (10.167.23.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 18:43:38 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 12 Oct
 2026 11:43:13 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 12 Oct
 2026 11:43:13 -0700
Received: from dgx-1v-42.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Mon, 12 Oct 2026 11:43:13 -0700
From: Jamie Nguyen <jamien@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
CC: Jamie Nguyen <jamien@nvidia.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>, Dat Mach
	<dmach@nvidia.com>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] ACPI: arm64: FFH Operation Region support for FF-A (offset 2)
Date: Mon, 12 Oct 2026 11:43:12 -0700
Message-ID: <20261012184312.3177093-1-jamien@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924-private-bobcat-from-wonderland-0db8f6@sudeepholla>
References: <20260901192906.133670-1-jamien@nvidia.com> <20260922-purring-fennec-of-exercise-bbce5e@sudeepholla> <20260922155211.676134-1-jamien@nvidia.com> <20260922-exuberant-earwig-of-opportunity-4fecff@sudeepholla> <20260923124050.3270801-1-jamien@nvidia.com> <20260923-lurking-pony-of-fascination-ac6c49@sudeepholla> <20260923173240.3710620-1-jamien@nvidia.com> <20260924-tall-oryx-of-attraction-23ada5@sudeepholla> <20260924152321.3864148-1-jamien@nvidia.com> <20260924-private-bobcat-from-wonderland-0db8f6@sudeepholla>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS8PEPF000000E1:EE_|SJ2PR12MB9239:EE_
X-MS-Office365-Filtering-Correlation-Id: b6d9e58b-5c4c-4e44-1d4a-08df2890bade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|36860700016|7416014|82310400026|376014|10067099003|261009223027099003|4143699003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: BMrwyFMx10nfsL4OTzNDwuKImqSHS+tSKPkNOYD7aCWLcBMsH5ELk2I1bLB3v78TgKj6kAAzdI840HDNpoQQ/OrzMI5n2b1Jf1wJxUJrOUlRM/oLrlQ6qHWjnjLWFKdBezCpGnMNZjgeQdgcQI9aoXSh2+TniM4dGZ6pLaiyDNuMhgFoYbdovee3H2uQtwFioRpm/ivEbeHVxf8ILapAg1Tu9gq0vdCXbieuU5DV3e+42M7q/mpYd6ZOtyzk+xqGzMmXO05VN1i5o3D+W3tuMDyy9a5PX6BPRgJVURYen/ab1QE/B49AWW61JHf7DR49tUfU8ST5HH95FwWGH6hPF1VJfZOusO5cp4WbBbLdZjYdPYpdatcUhOGWDmdgslrM1DAF9hWoToD4xn/1MLTOw0PPsPyK6zAcE9XfnVp71XwyRR1nGdT4SnjmyKs5Et25uI2tlmRW9fLk9y6oB0Fwz9LgVssaYvC0Sw5uwWXnYkB8hju2dHSBWNmGna7Vb5XhQtfJUCtXbum5I1pBa8uH0xc48TMJQxI6dQ2RGArvK1ggwfMn3ia3ZmJz09GHRxr33ZqIq3F5vqEXht4gnlw/PoFakK2h+rAOo6MhqIA9191z9V0hMtjp/w7TThFHrH62ozGmW+X83CBXTybomqWN9EAlEMQ3dXDuPZEjkgukbTfR1GrfZb/5v+Dai4K4xQgcvARrazK/fXb52EPnhSWDxw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(7416014)(82310400026)(376014)(10067099003)(261009223027099003)(4143699003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tg0rldpDK5Ys+YxQWL8khRoCbBXKnvcaWcVRFr+57/a/oumTfGtRqDkZUeF3YEP5k4dFQLTH2fIwYnWp4SqFoe49ygQpMUhLkh1ylyKjUeFrL1WyZUd+siVAJjiIx85nDlLgZiMQsZrNnOqUE9hOBd7FCbP5SBkePXcvIV2RpshExKKn/VVrKCAtMrAtXKIjiN7Q1+4yIoJRBDef8NRwUJTTG8vkRx0I+dkJIzmvSx1j25sJmSekt763saGV4Pg8boTfY8BNRCuQDAgq6zYCoDbXDCQ2sz2KsBQ0g1qZEuvUv6PY3QX6lgdjxU69HtOYTRFngB/NfCJMSxhvOfgVyZCJfY28+cXz2ZjVkOxHmtgdtg8oLoU8KsZjKhIuWJB1sdG/FwIfJfyoknSf8WR5EjKdpijiyQZVctDmXgJ/ixrfeCcA3pJ1h/dSb9tR0hZc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 18:43:38.4049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d9e58b-5c4c-4e44-1d4a-08df2890bade
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS8PEPF000000E1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_114353_862302_6E7DB63D 
X-CRM114-Status: UNSURE (   8.08  )
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

On Thu, Sep 24, 2026 at 05:07:04PM +0100, Sudeep Holla wrote:
> Thanks, will think a bit on this and see what is the best way to progress.

One further data point: our platforms using offset 2 for a TPM DSM have
an FF-A 1.2 SPMC. I'd like to keep 1.2 support if possible, since
FFA_MSG_SEND_DIRECT_REQ2 was added in 1.2. How would you handle version
negotiation in ffh.c when the transport may already have negotiated a
version?

